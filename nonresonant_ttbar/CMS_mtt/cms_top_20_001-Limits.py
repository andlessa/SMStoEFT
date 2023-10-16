#!/usr/bin/env python3

import numpy as np
import pandas as pd
import time,os,sys
import progressbar as P
import numpy as np
import csv 
from statisticalTools.simplifiedLikelihoods import Data,UpperLimitComputer
import pandas as pd

def csv_reader(filename):
    output = []
    with open(filename, "r") as csvfile:
        reader = csv.reader(csvfile, delimiter=',')
        for row in reader:
            output.append(row)
        csvfile.close()

    return output

def read_HEPdata_SM():
    '''
    Read data and covmat from hepdata
    '''
    data = csv_reader('../data/HEPData-ins1901295-v1-parton_abs_ttm.csv')
    cms_data  = []
    for item in data[9:24]:
        cms_data.append(float(item[3]))

    covdata = csv_reader('../data/HEPData-ins1901295-v1-parton_abs_ttm_covariance.csv')
    covmat = np.zeros(15*15).reshape(15,15)

    covmatlist = []
    count=0
    for item in covdata[9:234]:
        covmatlist.append(float(item[6]))

    for i in range(15):
        for j in range(15):
            covmat[i,j] = covmatlist[count]
            count+=1

    return cms_data, covmat

def kfactor():
    '''
    Get SM NNLO kfactor from hightea
    '''
    filename='./sm/kfac_nnlo_lo_highstats.txt'
    kfac = np.loadtxt(filename,dtype=float,usecols=(0,))
    kfac_unc = np.loadtxt(filename,dtype=float,usecols=(1,))

    return kfac, kfac_unc

def chi2(yDM,signal,sm,data,covmat):
    theory = sm + yDM**2*signal
    diff = (theory - data)[1:]
    Vinv = np.linalg.inv(covmat)[1:,1:]
    return ((diff).dot(Vinv)).dot(diff)



def computeULs(inputFile,outputFile,deltas=0.0):

    cms_bins = [250.,400.,480.,560.,640.,720.,800.,900.,1000.,
                1150.,1300.,1500.,1700.,2000.,2300.,3500.]
    cms_lumi = 137.


    # ### Load CMS data
    bgxsecs,covMatrix = read_HEPdata_SM()

    # ### Load Recast Data
    recastData = pd.read_pickle(inputFile)

    binCols = [c for c in recastData.columns 
               if 'bin_' in c and not 'Error' in c]
    bins_left = [eval(c.split('_')[1]) for c in binCols]
    bins_right = [eval(c.split('_')[2]) for c in binCols]

    
    # ### Loop over model points and compute UL on mu
    ulComp = UpperLimitComputer()

    progressbar = P.ProgressBar(widgets=["Computing upper limits: ", P.Percentage(),
                                P.Bar(marker=P.RotatingMarker()), P.ETA()])
    progressbar.maxval = len(recastData)
    progressbar.start()


    for ipt,pt in recastData.iterrows():

        progressbar.update(ipt)
        binWeights = [pt[c] for c in binCols]
        signal = np.array(binWeights)
        yDM = pt['yDM']
        # Make sure signal is normalized to yDM = 1
        signal = signal/yDM**2

        #First find minima of the chi profile, such that the delta chi2 can then be calculated
        def func_to_solve_deltachi2(ct):
            return chi2(ct, signal, sm, data, covMatrix)

        

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





