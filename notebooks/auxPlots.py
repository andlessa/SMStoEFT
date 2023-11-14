
import glob, pyslha,os
import numpy as np
import itertools
from scipy.interpolate import  griddata
from matplotlib import pyplot as plt
import tempfile
import pylhe
import gzip
import sys
sys.path.append('../../Recast/ATLAS-TOPQ-2019-23_tpT/')
from atlas_topq_2019_23_Recast import applyATLAScuts


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

def getDistributions(filename):

    nevents,events = getLHEevents(filename)
    pT1 = []
    pT2 = []
    mTT = []
    weights = []
    for ev in events:
        w = ev.eventinfo.weight/nevents
        weights.append(w)
        for ptc in ev.particles:
            if abs(ptc.id) != 6: continue
            if ptc.id == 6:
                pA = np.array([ptc.px,ptc.py,ptc.pz,ptc.e])
            else:
                pB = np.array([ptc.px,ptc.py,ptc.pz,ptc.e])

        pT1.append(max(np.linalg.norm(pA[0:3]),np.linalg.norm(pB[0:3])))
        pT2.append(min(np.linalg.norm(pA[0:3]),np.linalg.norm(pB[0:3])))
        mTT.append(np.sqrt((pA[-1]+pB[-1])**2-np.linalg.norm(pA[0:3]+pB[0:3])**2))
    
    dists = {'mTT' : mTT, 'pT1' : pT1, 'pT2' : pT2, 
             'weights' : np.array(weights), 'nevents' : nevents}

    return dists

def getATLASdistributions(filename,etamax=2.0,pTmin=355.0):

    nevents,events = getLHEevents(filename)
    pT1 = []
    pT2 = []
    mTT = []
    weights = []
    for ev in events:
        w = ev.eventinfo.weight/nevents        
        passCuts = applyATLAScuts(ev,etamax,pTmin)
        if passCuts is False:
            continue
        topHadronic,topLeptonic = passCuts

        pA = np.array([topHadronic.px,topHadronic.py,topHadronic.pz,topHadronic.e])
        pB = np.array([topLeptonic.px,topLeptonic.py,topLeptonic.pz,topLeptonic.e])

        pT1.append(np.linalg.norm(pA[0:3]))
        pT2.append(np.linalg.norm(pB[0:3]))
        mTT.append(np.sqrt((pA[-1]+pB[-1])**2-np.linalg.norm(pA[0:3]+pB[0:3])**2))
        weights.append(w)
    
    dists = {'mTT' : mTT, 'pTh' : pT1, 'pTlep' : pT2, 
             'weights' : np.array(weights), 'nevents' : nevents}

    return dists



def getInfo(f,labelsDict=None):

    if labelsDict is None:
        labelsDict = {'Top-FormFactorsOneLoop-UFO' : '1-loop', 'Top-EFTphysical_simple-UFO' : 'EFT', 
              'SMS-stop-UFO' : 'SM', 'SMS-stop-NLO_SMQCD-UFO' : 'SM',
              'g g > t t~' : r'$g g \to \bar{t} t$', 'g g > t~ t' : r'$g g \to \bar{t} t$',
              'q q > t t~' : r'$q q \to \bar{t} t$', 'q q > t~ t' : r'$q q \to \bar{t} t$',
              'p p > t t~' : r'$p p \to \bar{t} t$', 'p p > t~ t' : r'$p p \to \bar{t} t$'
             }
    
    banner = list(glob.glob(os.path.join(os.path.dirname(f),'*banner*')))[0]
    with open(banner,'r') as bannerF:
        bannerData = bannerF.read()
    
    # Get process data:
    processData = bannerData.split('<MGProcCard>')[1].split('</MGProcCard>')[0]
#     print(processData)
    # Get model
    model = processData.split('Begin MODEL')[1].split('End   MODEL')[0]
    model = model.split('\n')[1].strip()
    if model in labelsDict:
        model = labelsDict[model]
    # Get process
    proc = processData.split('Begin PROCESS')[1].split('End PROCESS')[0]
    proc = proc.split('\n')[1].split('#')[0].strip()
    if proc in labelsDict:
        proc = labelsDict[proc]
    
    # Get parameters data:
    parsData = bannerData.split('<slha>')[1].split('</slha>')[0]
    parsSLHA = pyslha.readSLHA(parsData)
    
    mT  = parsSLHA.blocks['MASS'][6]
    if 5000002 in parsSLHA.blocks['MASS']:
        mST = parsSLHA.blocks['MASS'][5000002]
        mChi = parsSLHA.blocks['MASS'][5000012]        
        yDM = list(parsSLHA.blocks['FRBLOCK'].values())[-1]
    else:
        mST = 0.0
        mChi = 0.0
        yDM = 0.0

    if yDM == 0.0:
        model = 'SM'


    
    # Get event data:
    eventData = bannerData.split('<MGGenerationInfo>')[1].split('</MGGenerationInfo>')[0]
    nEvents = eval(eventData.split('\n')[1].split(':')[1].strip())
    xsec = eval(eventData.split('\n')[2].split(':')[1].strip())

    fileInfo = {'model' : model, 'process' : proc, '(mST,mChi,mT,yDM)' : (mST,mChi,mT,yDM),
               'xsec (pb)' : xsec, 'nevents' : nEvents}
    
    return fileInfo

def interpolateData(x,y,z,nx=200,ny=200,method='linear'):

    if x.min() == x.max() or y.min() == y.max(): # Can not interpolate
        return None,None,None
    else:
        xnew = np.linspace(x.min(),x.max(),nx)
        ynew = np.linspace(y.min(),y.max(),ny)
        xi = np.array([list(v) for v in itertools.product(xnew,ynew)])
        znew = griddata(list(zip(x,y)),z,xi=xi, method=method)
    znew = np.reshape(znew,(len(xnew),len(ynew)))
    xnew,ynew  = np.meshgrid(xnew,ynew,indexing='ij')

    return xnew,ynew,znew

def getContours(x,y,z,contourValues):
    

    contours = plt.contour(x, y, z, contourValues)
    plt.close()

    contoursDict = {}

    for i,item in enumerate(contours.collections):
        cV = contourValues[i]
        xData = []
        yData = []
        for p in item.get_paths():
            v = p.vertices
            xData += list(v[:, 0])
            yData += list(v[:, 1])
        if len(xData) == 0:
            continue
        contoursDict[cV] = np.array(list(zip(xData,yData)))
    
    return contoursDict

def saveContours(contoursDict,fname,header):

    with open(fname,'w') as f:
        for cV,data in contoursDict.items():
            np.savetxt(f,data,fmt='%.4e',delimiter=',',header=header,comments='\n\n# Contour value=%1.2f \n' %cV)
    print('Contours saved to %s' %fname)

def readContours(fname):

    contoursDict = {}
    with open(fname,'r') as f:
        dataBlocks = f.read().split('#')[1:]
        for data in dataBlocks: 
            data = data.splitlines()
            cV = eval(data[0].split('=')[1])
            dataPts = np.genfromtxt(data,delimiter=',',names=True,skip_header=1)
            contoursDict[cV] = dataPts

    return contoursDict

def Cg(mChi,mST,yDM,gs):
    
    c = -gs*yDM**2/(384*np.pi**2)
    if 1-mChi**2/mST**2 < 0.1:
        r = mChi**2/(5*mST**4)-4*mChi/(5*mST**3) + 11/(10*mST**2)
    else:
        r = mST**6/mChi**6 
        r += 2*(1 - (3*mST**4)/mChi**4) 
        r += 3*mST**2*(1 + 4*np.log(mST/mChi))/mChi**2
        r = r/(mChi**2*(1 - mST**2/mChi**2)**4)
    
    return c*r
               
def Cq(mChi,mST,yDM,gs):
    
    c = 6*gs**2*yDM**2/(3456*np.pi**2)
    if 1-mChi**2/mST**2 < 0.1:
        r = mChi**2/(10*mST**4)-4*mChi/(5*mST**3)+11/(5*mST**2)
    else:
        r = 6*(mChi**2/mST**2)*np.log(mChi**2/mST**2)
        r += -11*mChi**2/mST**2 
        r += 18
        r += -9*mST**2/mChi**2 
        r += 2*mST**4/mChi**4
        r = r*mST**2*mChi**4/((mChi**2-mST**2)**4)
    
    return c*r               