#!/usr/bin/env python3

import numpy as np
import pandas as pd
import time,os,sys
import progressbar as P
import numpy as np
import csv 
import pandas as pd
from scipy.optimize import minimize, brentq

atlas_bins = np.array([355.0,381.0,420.0,478.0,549.0,633.0,
                        720.0,836.0,2000.0])
bin_widths  = atlas_bins[1:]-atlas_bins[:-1]

def csv_reader(filename):
    output = []
    with open(filename, "r") as csvfile:
        reader = csv.reader(csvfile, delimiter=',')
        for row in reader:
            output.append(row)
        csvfile.close()

    output = [l for l in output if l and l[0][0] != '#']
    return output

def read_ATLASdata(dataDir='./data'):
    '''
    Read data and covmat from hepdata
    '''
    data = csv_reader(os.path.join(dataDir,'HEPData-ins2037744-v2-Table_2.csv'))
    atlas_data  = []
    systematic_error = []
    sysCols = range(6,len(data[0]),2) # Only the plus sign errors
    for item in data[1:9]:
        atlas_data.append(float(item[3]))
        sysTot2 = 0.0
        for c in sysCols:
            avgError = (np.abs(eval(item[c].replace('%','*1e-2')))
                        +np.abs(eval(item[c+1].replace('%','*1e-2'))))/2.
            sysTot2 += avgError**2
        sysTot = np.sqrt(sysTot2)*eval(item[3])
        systematic_error.append(sysTot)
    systematic_error = np.array(systematic_error)


    atlas_bg = np.loadtxt(os.path.join(dataDir,'../sm/nnlo_from_fig11_digitized.txt'),dtype=float,usecols=(0,))
    # The digitized values are divided by the width
    atlas_bg = atlas_bg*bin_widths

    # Covariance matrix including only correlated statistical uncertainties
    covdata = csv_reader(os.path.join(dataDir,'HEPData-ins2037744-v2-Table_3.csv'))
    covmat_stat = []
    for item in covdata[1:65]:
        covmat_stat.append(float(item[-1]))

    covmat_stat = np.array(covmat_stat).reshape(8,8)

    # Total covariance matrix
    covmat = covmat_stat + np.diag(systematic_error**2)

    return np.array(atlas_data), atlas_bg, covmat

def getSMLO(smFile='./sm/sm_atlas_topq_2019_23.pcl'):

    # ### Load Recast Data
    recastData = pd.read_pickle(smFile)

    binCols = [c for c in recastData.columns 
               if 'bin_' in c.lower() and not 'error' in c.lower()]
    bins_left = np.array([eval(c.split('_')[1]) for c in binCols])
    bins_right = np.array([eval(c.split('_')[2]) for c in binCols])
    # Check that bins are consistent:
    if not np.array_equal(bins_left,atlas_bins[:-1]):
        print('Bins from data do not match ATLAS')
        return
    if bins_right[-1] != atlas_bins[-1]:
        print('Bins from data do not match ATLAS')
        return

    if len(recastData) != 1:
        print('SM LO file %s has multiple entries' %smFile)
        return False
    
    pt = recastData.iloc[0]
    smLO = list(zip(bins_left,pt[binCols].values))
    smLO = np.array(sorted(smLO))[:,1]

    return smLO

def getKfactor(smNNLO,smLO):
    """
    Compute bin-by-bin kfactors using the ATLAS NNLO and the LO xsecs
    """
    
    # Get k-factor for each bin
    kfac = np.divide(smNNLO,smLO)
    
    return kfac

def chi2(yDM,signal,sm,data,covmat,deltas=0.0):
    theory = (sm + yDM**2*signal)
    diff = (theory - data)    
    covariance = covmat + np.diag((yDM**2*signal*deltas)**2)
    Vinv = np.linalg.inv(covariance)
    return ((diff).dot(Vinv)).dot(diff)


def getUL(signal,sm_bin,xsecsObs,covMatrix,deltas=0.0):

    #First find minima of the chi profile, such that the delta chi2 can then be calculated
    def func_to_solve_deltachi2(yDMval):
        return chi2(yDMval, signal, sm_bin, xsecsObs, covMatrix, deltas)

    yDMmin = minimize(func_to_solve_deltachi2, x0=0).x
    chi2min = chi2(yDMmin, signal, sm_bin, xsecsObs, covMatrix, deltas)

    def func_to_solve_95(yDMval):
        return chi2(yDMval, signal, sm_bin, xsecsObs, covMatrix, deltas) - chi2min - 3.84

    yDMmax = min(20.,np.sqrt(np.abs(sum(0.1*sm_bin)/sum(signal))))
    yDMmax = 1000.0
    # print(ipt)
    # print('yDMmin=',yDMmin,'chi2(yDMmin)=',chi2(yDMmin, signal, sm_bin, xsecsObs, covMatrix, deltas))
    # print('yDMmax=',yDMmax,'chi2(yDMmax)=',chi2(yDMmax, signal, sm_bin, xsecsObs, covMatrix, deltas))
    
    yDM95 = brentq(func_to_solve_95, a=yDMmax,b=yDMmin)
    deltaChi95 = chi2(yDM95, signal, sm_bin, xsecsObs, covMatrix, deltas)-chi2min

    return {'yDMmin' : yDMmin, 'chi2min' : chi2min, 
            'yDM95' : yDM95, 'deltaChi95' : deltaChi95}

def computeULs(inputFile,outputFile,full=False,deltas=0.0):

    # ### Load ATLAS data and BG
    xsecsObs,sm,covMatrix = read_ATLASdata()
    
    # ### Load LO background from MG5
    smLO = getSMLO()
    # Get k-factor for each bin
    kfac = getKfactor(sm,smLO)
    
    # ### Load Recast Data
    recastData = pd.read_pickle(inputFile)

    binCols = [c for c in recastData.columns 
               if 'bin_' in c.lower() and not 'error' in c.lower()]
    bins_left = np.array([eval(c.split('_')[1]) for c in binCols])
    bins_right = np.array([eval(c.split('_')[2]) for c in binCols])
    # Check that bins are consistent:
    if not np.array_equal(bins_left,atlas_bins[:-1]):
        print('Bins from data do not match ATLAS')
        return
    if bins_right[-1] != atlas_bins[-1]:
        print('Bins from data do not match ATLAS')
        return


    progressbar = P.ProgressBar(widgets=["Computing upper limits: ", P.Percentage(),
                                P.Bar(marker=P.RotatingMarker()), P.ETA()])
    progressbar.maxval = len(recastData)
    progressbar.start()

    yDM95list = []
    deltaChi95list = []
    for ipt,pt in recastData.iterrows():

        progressbar.update(ipt)
        signal = list(zip(bins_left,pt[binCols].values))
        signal = np.array(sorted(signal))[:,1]
        yDM = pt['yDM']
        # Make sure signal is normalized to yDM = 1
        signal = signal/yDM**2
        # Rescale predictions by bin-dependent k-factors
        signal = kfac*signal

        if not full: # Use simplified chi-square
            # Finally, divide by the bin widths
            signal = signal/bin_widths
            sm_bin = sm/bin_widths
        
            resDict = getUL(signal,sm_bin,xsecsObs,covMatrix,deltas=0.0)
            yDM95 = resDict['yDM95']
            deltaChi95 = resDict['deltaChi95']            
        else: # Use full CLs calculation
            import sys
            sys.path.append('../statisticalTools')
            from simplifiedLikelihoods import Data,UpperLimitComputer,LikelihoodComputer
            ulComp = UpperLimitComputer()

            # ### Get number of observed and expected (BG) events
            lumi = 137*1e3
            nobs = xsecsObs*bin_widths*lumi
            nbg = sm*lumi
            ns = signal*lumi
            cov = covMatrix*(lumi*bin_widths)**2
            data = Data(observed=nobs, backgrounds=nbg, 
                        covariance=cov, 
                        nsignal=ns,deltas_rel=deltas)
            ul = ulComp.getUpperLimitOnMu(data)
            yDM95 = np.sqrt(ul)
            # Signal for 95% C.L. limit:
            data95 = Data(observed=nobs, backgrounds=nbg, 
                          covariance=cov, 
                          nsignal=ns*ul,deltas_rel=deltas)
            computer = LikelihoodComputer(data95)
            deltaChi95 = computer.chi2()            
        # Store result
        yDM95list.append(yDM95)
        deltaChi95list.append(deltaChi95)

    recastData['yDM (95% C.L.)'] = yDM95list
    recastData['$\Delta \chi^2$ (95% C.L.)'] = deltaChi95list
    progressbar.finish()
    recastData.to_pickle(outputFile)



if __name__ == "__main__":
    
    import argparse    
    ap = argparse.ArgumentParser(description=
            "Compute the upper limit on mu from ATLAS-TOPQ-2019-23 for the recast data stored in the input file.")
    ap.add_argument('-f', '--inputFile', required=True,
            help='path to the pickle file containing the Pandas DataFrame with the recasting results for the models')
    ap.add_argument('-o', '--outputFile', required=False,
            help='path to output file. If not defined the upper limits will be stored in the input file.',
            default = None)

    t0 = time.time()

    # # Set output file
    args = ap.parse_args()
    inputFile = args.inputFile
    if not os.path.isfile(inputFile):
        print("File %s not found" %inputFile)
        sys.exit()
    outputFile = args.outputFile
    if outputFile is None:
        outputFile = inputFile

    computeULs(inputFile,outputFile)

    print("\n\nDone in %3.2f min" %((time.time()-t0)/60.))





