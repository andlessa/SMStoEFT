#!/usr/bin/env python3

import os,glob
import numpy as np
import pandas as pd
import pyslha
import time
import progressbar as P
import tempfile,gzip,pylhe
import fastjet

atlas_bins = np.array([355.0,381.0,420.0,478.0,549.0,633.0,720.0,836.0,2000.0])

def getLHEevents(fpath):
    """
    Reads a set of LHE files and returns a dictionary with the file labels as keys
    and the PyLHE Events object as values.
    """

    # It is necessary to remove the < signs from the LHE files (in the generate line) before parsing with pylhe
    fixedFile = tempfile.mkstemp(suffix='.lhe')
    os.close(fixedFile[0])
    fixedFile = fixedFile[1]
    with  gzip.open(fpath,'rt') as f:
        data = f.readlines()
        with open(fixedFile,'w') as newF:
            for l in data:
                if 'generate' in l:
                    continue
                newF.write(l)
        events = list(pylhe.read_lhe_with_attributes(fixedFile))
        nevents = pylhe.read_num_events(fixedFile)

    os.remove(fixedFile)
    return nevents,events


def getPTThist(nevents,events,etamax=2.0,pTmin=355.0,weightMultiplier = 1.0):
    """
    Reads a PyLHE Event object and extracts the ttbar invariant
    mass for each event.
    """

    
    jetdef = fastjet.JetDefinition(fastjet.antikt_algorithm, 0.4)
    fatjetdef = fastjet.JetDefinition(fastjet.antikt_algorithm, 1.0)


    pTT = []
    weights = []
    for ev in events:        
        error = False
        weightPB = weightMultiplier*ev.eventinfo.weight/nevents
        weightAndError = np.array([weightPB,weightPB**2])

        # Add information to particles:
        for ptc in ev.particles:
            ptc.daughters = []
            ptc.PID = int(ptc.id)
            p = np.sqrt(ptc.px**2 + ptc.py**2 + ptc.pz**2)
            ptc.PT = np.sqrt(ptc.px**2 + ptc.py**2)
            if not ptc.PT: # Only for incoming partons
                ptc.Eta = None
                ptc.Phi = None
            else:
                ptc.Eta = (1./2.)*np.log((p+ptc.pz)/(p-ptc.pz))        
                ptc.Phi = np.arctan2(ptc.py,ptc.px)
            ptc.Px = ptc.px
            ptc.Py = ptc.py
            ptc.Pz = ptc.pz
            ptc.E = ptc.e
            
        for ptc in ev.particles:
            for mom in ptc.mothers():
                mom.daughters.append(ptc)
        
        # Get tops and their final decays:
        tops = {}
        topDecays = {}
        for ptc in ev.particles:        
            if abs(ptc.PID) == 6:
                tops[ptc.PID] = ptc # Store only the last top/anti-top            
                daughters = {d.PID : d for d in ptc.daughters}
                hasDaughters = [pid for pid,d in daughters.items() if d.daughters]
                while len(hasDaughters) > 0:
                    for pid in hasDaughters:
                        d = daughters.pop(pid)
                        for dd in d.daughters:
                            daughters[dd.PID] = dd
                    hasDaughters = [pid for pid,d in daughters.items() if d.daughters]
                topDecays[ptc.PID] = list(daughters.values())
        
        # Select events with one lepton and one hadronic top:
        topH = None
        topLep = None
        for topPID,daughters in topDecays.items():        
            dPIDs =  [abs(ptc.PID) for ptc in daughters]
            if len(dPIDs) != 3:
                error = True
                print('Error getting daughters:',dPIDs)
                break
            if not 5 in dPIDs:
                continue # Skip rare decays to W+c
            if (11 in dPIDs) or (13 in dPIDs):
                topLep = topPID
            elif max(dPIDs) <= 5:
                topH = topPID

        if error:
            break
        
        if topH is None or topLep is None:
            continue

        # Hadronic top:    
        # Regular jets:
        quarks = [ptc for ptc in topDecays[topH]]
        jetArray = [fastjet.PseudoJet(q.Px,q.Py,q.Pz,q.E) for q in quarks if abs(q.Eta) < 4.5]
        for ij,j in enumerate(jetArray):
            j.set_user_index(quarks[ij].PID)
        cluster = fastjet.ClusterSequence(jetArray, jetdef)
        jets = cluster.inclusive_jets(ptmin = 26.0)
        jets = [j for j in jets if abs(j.eta()) < 2.5]
        if len(jets) == 0:
            continue

        # ## Fat jet:    
        jetArray = [fastjet.PseudoJet(j.px(),j.py(),j.pz(),j.E()) for j in jets]
        for ij,j in enumerate(jetArray):
            for q in jets[ij].constituents():
                if abs(q.user_index()) == 5:
                    j.set_user_index(5) # Tag the regular jets containing a b-quark
        clusterFat = fastjet.ClusterSequence(jetArray, fatjetdef)
        if len(clusterFat.inclusive_jets()) == 0:
            continue
        
        # Use hardest fat jet
        fatJet = sorted([j for j in clusterFat.inclusive_jets()], key = lambda j: j.pt(), reverse=True)[0]
        # Invariant mass cut:
        if not (120. < fatJet.m() < 220.):
            continue
        # PT cut
        if fatJet.pt() < pTmin:
            continue

        # Eta cut
        if abs(fatJet.eta()) > etamax:
            continue

        # Require a b inside the Fat jet
        hasB = False
        for q in fatJet.constituents():
            if q.user_index() == 5:
                hasB = True
        if not hasB:
            continue
    
        # Leptonic top:
        leptons = [ptc for ptc in topDecays[topLep] if abs(ptc.PID) in [11,13]]
        neutrinos = [ptc for ptc in topDecays[topLep] if abs(ptc.PID) in [12,14]]
        bLep = [ptc for ptc in topDecays[topLep] if abs(ptc.PID) ==5]
        if len(leptons) != 1:
            error = True
            print('Error getting leptons')
        if len(neutrinos) != 1:
            error = True
            print('Error getting neutrinos')
        if len(bLep) != 1:
            error = True
            print('Error getting b-jet')
            break
        if error:
            break
        lepton = leptons[0]
        nu = neutrinos[0]
        bLep = bLep[0]
        
        pTlepton = lepton.PT
        etaLep = np.abs(lepton.Eta)
        # Lepton pT cut
        if pTlepton < 27.0:
            continue
        # Lepton eta cut
        if etaLep > 2.5:
            continue

        # Require the b to be close to the lep'MET > 20'ton
        dRlep = np.sqrt((lepton.Eta-bLep.Eta)**2 + (lepton.Phi-bLep.Phi)**2)
        if dRlep > 2.0:
            continue
        # Invariant mass of lepton and b < 180:
        mlb = np.sqrt((lepton.E+bLep.E)**2-(lepton.Px+bLep.Px)**2-(lepton.Py+bLep.Py)**2-(lepton.Pz+bLep.Pz)**2)
        if mlb > 180.0:
            continue
        # Skip events where lepton overlaps to jet
        dRlep = min([np.sqrt((lepton.Eta-j.eta())**2 + (lepton.Phi-j.phi())**2) for j in jets])    
        if dRlep < 0.4:
            continue
        # MET cut
        if (nu.PT < 20.0):
            continue


        pTT.append(tops[topH].PT)
        weights.append(weightAndError)
    

    weights = np.array(weights)
    pTtHist,_ = np.histogram(pTT,weights=weights[:,0],bins=atlas_bins)
    pTtHistError,_ = np.histogram(pTT,weights=weights[:,1],bins=atlas_bins)
    pTtHistError = np.sqrt(pTtHistError)

    data = np.array(list(zip(atlas_bins[:-1],atlas_bins[1:],pTtHist,pTtHistError)))
    del events
    
    return data


def getInfo(f):

    procDict = {
                'g g > t t~' : r'$g g \to \bar{t} t$', 'g g > t~ t' : r'$g g \to \bar{t} t$',
                'q q > t t~' : r'$q q \to \bar{t} t$', 'q q > t~ t' : r'$q q \to \bar{t} t$'
                }
    
    banner = list(glob.glob(os.path.join(os.path.dirname(f),'*banner*')))[0]
    with open(banner,'r') as bannerF:
        bannerData = bannerF.read()
    
    # Get process data:
    processData = bannerData.split('<MGProcCard>')[1].split('</MGProcCard>')[0]

    # Get model
    model = processData.split('Begin MODEL')[1].split('End   MODEL')[0]
    model = model.split('\n')[1].strip()

    # Get process
    proc = processData.split('Begin PROCESS')[1].split('End PROCESS')[0]
    proc = proc.split('\n')[1].split('#')[0].strip()
    if proc in procDict:
        proc = procDict[proc]
    
    # Get parameters data:
    parsData = bannerData.split('<slha>')[1].split('</slha>')[0]
    parsSLHA = pyslha.readSLHA(parsData)
    
    if 5000002 in parsSLHA.blocks['MASS']:
        mST = parsSLHA.blocks['MASS'][5000002]
        mChi = parsSLHA.blocks['MASS'][5000012]
        yDM = list(parsSLHA.blocks['FRBLOCK'].values())[-1]
    else:
        mST = 0.0
        mChi = 0.0
        yDM = 0.0
    mT  = parsSLHA.blocks['MASS'][6]
    

    
    # Get event data:
    eventData = bannerData.split('<MGGenerationInfo>')[1].split('</MGGenerationInfo>')[0]
    nEvents = eval(eventData.split('\n')[1].split(':')[1].strip())
    xsec = eval(eventData.split('\n')[2].split(':')[1].strip())

    fileInfo = {'model' : model, 'process' : proc, 'mST' : mST, 'mChi' : mChi, 'mT' : mT, 'yDM' : yDM,
               'xsec (pb)' : xsec, 'MC Events' : nEvents, 'file' : f}
    
    return fileInfo


def getRecastData(inputFiles,weightMultiplier=1.0):

    allData = []

    progressbar = P.ProgressBar(widgets=["Reading %i Files: " %len(inputFiles), 
                            P.Percentage(),P.Bar(marker=P.RotatingMarker()), P.ETA()])
    progressbar.maxval = len(inputFiles)
    progressbar.start()
    nfiles = 0

    for f in inputFiles:
        # print('\nReading file: %s' %f)
        fileInfo = getInfo(f)
        # Get events:
        nevents,events = getLHEevents(f)
        data = getPTThist(nevents,events,weightMultiplier=weightMultiplier)
        # Create a dictionary with the bin counts and their errors
        dataDict = fileInfo
        bins_left = data[:,0]
        bins_right = data[:,1]
        w = data[:,2]
        wError = data[:,3]    
        for ibin,b in enumerate(bins_left):
            label = 'bin_%1.0f_%1.0f'%(b,bins_right[ibin])
            dataDict[label] = w[ibin]
            dataDict[label+'_Error'] = wError[ibin]
        allData.append(dataDict)
        nfiles += 1
        progressbar.update(nfiles)

    progressbar.finish()
    return allData


if __name__ == "__main__":
    
    import argparse    
    ap = argparse.ArgumentParser( description=
            "Run the recasting for ATLAS-TOPQ-2019-23 using one or multiple MadGraph (parton level) LHE files. "
            + "If multiple files are given as argument, add them."
            + " Store the SR bins in a pickle (Pandas DataFrame) file." )
    ap.add_argument('-f', '--inputFile', required=True,nargs='+',
            help='path to the LHE event file(s) generated by MadGraph.', default =[])
    ap.add_argument('-o', '--outputFile', required=False,
            help='path to output file storing the DataFrame with the recasting data.'
                 + 'If not defined, will use the name of the first input file', 
            default = None)
    ap.add_argument('-w', '--weightMultiplier', required=True, type=float,
            help='Factor used to multiply the weights (in case events were generated with specific top decays in each branch)', default =[])


    t0 = time.time()

    # # Set output file
    args = ap.parse_args()
    inputFiles = args.inputFile
    outputFile = args.outputFile
    weightMultiplier = args.weightMultiplier

    if outputFile is None:
        outputFile = inputFiles[0].replace('.lhe.gz','atlas_topq_2019_23.pcl')

    if os.path.splitext(outputFile)[1] != '.pcl':
        outputFile = os.path.splitext(outputFile)[0] + '.pcl'

    dataDict = getRecastData(inputFiles,weightMultiplier)

    # #### Create pandas DataFrame
    df = pd.DataFrame.from_dict(dataDict)

    # ### Save DataFrame to pickle file
    print('Saving to',outputFile)
    df.to_pickle(outputFile)

    print("\n\nDone in %3.2f min" %((time.time()-t0)/60.))
