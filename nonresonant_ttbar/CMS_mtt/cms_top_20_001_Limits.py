#!/usr/bin/env python3

import numpy as np
import pandas as pd
import time,os,sys
import progressbar as P
import numpy as np
import csv 
import pandas as pd
from scipy.optimize import minimize, brentq

def csv_reader(filename):
    output = []
    with open(filename, "r") as csvfile:
        reader = csv.reader(csvfile, delimiter=',')
        for row in reader:
            output.append(row)
        csvfile.close()

    return output

def read_HEPdata_SM(dataDir='./data'):
    '''
    Read data and covmat from hepdata
    '''
    data = csv_reader(os.path.join(dataDir,'parton_abs_ttm.csv'))
    cms_data  = []
    for item in data[9:24]:
        cms_data.append(float(item[3]))

    covdata = csv_reader(os.path.join(dataDir,'parton_abs_ttm_covariance.csv'))
    covmat = np.zeros(15*15).reshape(15,15)

    covmatlist = []
    count=0
    for item in covdata[9:234]:
        covmatlist.append(float(item[6]))

    for i in range(15):
        for j in range(15):
            covmat[i,j] = covmatlist[count]
            count+=1

    return np.array(cms_data), np.array(covmat)

def getSMLO(filename='./sm/mtt_SM_ttbar_nnpdf4p0.txt'):
    """
    Use mtt computed at LO from arXiv:2303.17634
    """

    sm = np.loadtxt(filename,usecols=(0,),dtype=float)
    return sm

def getKfactor(filename='./sm/kfac_nnlo_lo_highstats.txt'):
    """
    Use kfactors computed at NNLO from arXiv:2303.17634 (using HighTea)
    """
    
    
    kfac = np.loadtxt(filename,dtype=float,usecols=(0,))

    return kfac

def chi2(yDM,signal,sm,data,covmat,kfactor=1.0):
    theory = kfactor*(sm + yDM**2*signal)
    diff = (theory - data)[1:]
    Vinv = np.linalg.inv(covmat)[1:,1:]
    return ((diff).dot(Vinv)).dot(diff)


def computeULs(inputFile,outputFile,deltas=0.0):

    cms_bins = np.array([250.,400.,480.,560.,640.,720.,800.,900.,1000.,
                1150.,1300.,1500.,1700.,2000.,2300.,3500.])


    # ### Load CMS data
    xsecsObs,covMatrix = read_HEPdata_SM()
    
    # ### Load SM prediction (LO)
    smLO = getSMLO()
    # ### Load k-factors
    kfac = getKfactor()

    # ### Load Recast Data
    recastData = pd.read_pickle(inputFile)

    binCols = [c for c in recastData.columns 
               if 'bin_' in c.lower() and not 'error' in c.lower()]
    bins_left = np.array([eval(c.split('_')[1]) for c in binCols])
    bins_right = np.array([eval(c.split('_')[2]) for c in binCols])
    # Check that bins are consistent:
    if not np.array_equal(bins_left,cms_bins[:-1]):
        print('Bins from data do not match CMS')
        return
    if bins_right[-1] != cms_bins[-1]:
        print('Bins from data do not match CMS')
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
        sm = kfac*smLO

        # Finally, divide by the bin widths
        signal = signal/(bins_right-bins_left)
        sm = sm/(bins_right-bins_left)
        
        #First find minima of the chi profile, such that the delta chi2 can then be calculated
        def func_to_solve_deltachi2(yDMval):
            return chi2(yDMval, signal, sm, xsecsObs, covMatrix)

        yDMmin = minimize(func_to_solve_deltachi2, x0=20).x
        chi2min = chi2(yDMmin, signal, sm, xsecsObs, covMatrix)

        def func_to_solve_95(yDMval):
            return chi2(yDMval, signal, sm, xsecsObs, covMatrix) - chi2min - 3.84

        yDM95 = brentq(func_to_solve_95, a=1000,b=yDMmin)
        deltaChi95 = chi2(yDM95, signal, sm, xsecsObs, covMatrix)-chi2min
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
            "Compute the upper limit on mu from CMS-EXO-20-004 for the recast data stored in the input file.")
    ap.add_argument('-f', '--inputFile', required=True,
            help='path to the pickle file containing the Pandas DataFrame with the recasting results for the models')
    ap.add_argument('-e', '--signalError', required=False, default = 0.0, type=float,
            help='value for the relative error on the signal [default = 0.0]')
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

    deltas = args.signalError
    computeULs(inputFile,outputFile,deltas)

    print("\n\nDone in %3.2f min" %((time.time()-t0)/60.))





