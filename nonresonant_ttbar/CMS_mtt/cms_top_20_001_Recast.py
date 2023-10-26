#!/usr/bin/env python3

import os,glob
import numpy as np
import pandas as pd
import sys
import pyslha
import time
import progressbar as P
import tempfile,gzip,pylhe



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
        events = pylhe.read_lhe_with_attributes(fixedFile)        

    return events


def getMTThist(events):
    """
    Reads a PyLHE Event object and extracts the ttbar invariant
    mass for each event.
    """

    cms_bins = [250.,400.,480.,560.,640.,720.,800.,900.,1000.,
                1150.,1300.,1500.,1700.,2000.,2300.,3500.]
    mTT = []
    weights = []
    mcTotal = 0
    for ev in events:
        weights.append(ev.eventinfo.weight)
        mcTotal += 1
        for ptc in ev.particles:
            if abs(ptc.id) != 6: continue
            if ptc.id == 6:
                pA = np.array([ptc.px,ptc.py,ptc.pz,ptc.e])
            else:
                pB = np.array([ptc.px,ptc.py,ptc.pz,ptc.e])

        mTT.append(np.sqrt((pA[-1]+pB[-1])**2-np.linalg.norm(pA[0:3]+pB[0:3])**2))
    
    weights = np.array(weights)/mcTotal
    mttHist,_ = np.histogram(mTT,weights=weights,bins=cms_bins)
    mttHistError,_ = np.histogram(mTT,weights=weights**2,bins=cms_bins)
    mttHistError = np.sqrt(mttHistError)

    data = np.array(list(zip(cms_bins[:-1],cms_bins[1:],mttHist,mttHistError)))
    
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
    
    mST = parsSLHA.blocks['MASS'][5000002]
    mChi = parsSLHA.blocks['MASS'][5000012]
    mT  = parsSLHA.blocks['MASS'][6]
    yDM = list(parsSLHA.blocks['FRBLOCK'].values())[-1]

    
    # Get event data:
    eventData = bannerData.split('<MGGenerationInfo>')[1].split('</MGGenerationInfo>')[0]
    nEvents = eval(eventData.split('\n')[1].split(':')[1].strip())
    xsec = eval(eventData.split('\n')[2].split(':')[1].strip())

    fileInfo = {'model' : model, 'process' : proc, 'mST' : mST, 'mChi' : mChi, 'mT' : mT, 'yDM' : yDM,
               'xsec (pb)' : xsec, 'MC Events' : nEvents, 'file' : f}
    
    return fileInfo


def getRecastData(inputFiles):

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
        events = getLHEevents(f)
        data = getMTThist(events)
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
            "Run the recasting for CMS-TOP-20-001 using one or multiple MadGraph (parton level) LHE files. "
            + "If multiple files are given as argument, add them."
            + " Store the SR bins in a pickle (Pandas DataFrame) file." )
    ap.add_argument('-f', '--inputFile', required=True,nargs='+',
            help='path to the LHE event file(s) generated by MadGraph.', default =[])
    ap.add_argument('-o', '--outputFile', required=False,
            help='path to output file storing the DataFrame with the recasting data.'
                 + 'If not defined, will use the name of the first input file', 
            default = None)
   
    t0 = time.time()

    # # Set output file
    args = ap.parse_args()
    inputFiles = args.inputFile
    outputFile = args.outputFile

    if outputFile is None:
        outputFile = inputFiles[0].replace('.lhe.gz','cms_exo_20_004.pcl')

    if os.path.splitext(outputFile)[1] != '.pcl':
        outputFile = os.path.splitext(outputFile)[0] + '.pcl'

    dataDict = getRecastData(inputFiles)

    # #### Create pandas DataFrame
    df = pd.DataFrame.from_dict(dataDict)

    # ### Save DataFrame to pickle file
    print('Saving to',outputFile)
    df.to_pickle(outputFile)

    print("\n\nDone in %3.2f min" %((time.time()-t0)/60.))