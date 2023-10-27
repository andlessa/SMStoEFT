#!/usr/bin/env python3

import numpy as np
import pandas as pd
import time,os,sys
import progressbar as P
import numpy as np
import csv 
import pandas as pd
from scipy.optimize import minimize, brentq

atlas_bins = np.array([355.0,381.0,420.0,478.0,549.0,633.0,720.0,836.0,2000.0])
bin_width  = atlas_bins[1:]-atlas_bins[:-1]


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
    for item in data[1:9]:
        atlas_data.append(float(item[3]))

    atlas_bg = np.loadtxt(os.path.join(dataDir,'../sm/nnlo_from_fig11_digitized.txt'),dtype=float,usecols=(0,))
    # The digitized values are divided by the width
    atlas_bg = atlas_bg*bin_width

    covdata = csv_reader(os.path.join(dataDir,'HEPData-ins2037744-v2-Table_3.csv'))
    covmat = []
    for item in covdata[1:65]:
        covmat.append(float(item[-1]))

    covmat = np.array(covmat).reshape(8,8)

    return np.array(atlas_data), atlas_bg, covmat

def getSMLO(smFile='./sm/sm_tt_lo_atlas_topq_2019_23.pcl'):

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

def chi2(yDM,signal,sm,data,covmat,kfactor=1.0):
    theory = kfactor*(sm + yDM**2*signal)
    diff = (theory - data)[1:]
    Vinv = np.linalg.inv(covmat)[1:,1:]
    return ((diff).dot(Vinv)).dot(diff)


def computeULs(inputFile,outputFile):

    

    # ### Load ATLAS data and BG
    xsecsObs,smNNLO,covMatrix = read_ATLASdata()
    
    # ### Load LO background from MG5
    smLO = getSMLO()

    # Get k-factor for each bin
    kfac = np.divide(smNNLO,smLO)

    # Rescale BG by bin width:
    smNNLO = smNNLO/bin_width
    
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

        # Rescale predictions by bin-dependent k-factors and divide by the bin widths
        signal = kfac*signal/bin_width
        
        #First find minima of the chi profile, such that the delta chi2 can then be calculated
        def func_to_solve_deltachi2(yDMval):
            return chi2(yDMval, signal, smNNLO, xsecsObs, covMatrix)

        yDMmin = minimize(func_to_solve_deltachi2, x0=20).x
        chi2min = chi2(yDMmin, signal, smNNLO, xsecsObs, covMatrix)

        def func_to_solve_95(yDMval):
            return chi2(yDMval, signal, smNNLO, xsecsObs, covMatrix) - chi2min - 3.84

        yDM95 = brentq(func_to_solve_95, a=1000,b=yDMmin)
        deltaChi95 = chi2(yDM95, signal, smNNLO, xsecsObs, covMatrix)-chi2min
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





