
import glob, pyslha,os
import numpy as np
import itertools
from scipy.interpolate import  griddata
from matplotlib import pyplot as plt


def getInfo(f,labelsDict=None):

    if labelsDict is None:
        labelsDict = {'Top-FormFactorsOneLoop-UFO' : '1-loop', 'Top-EFTphysical_simple-UFO' : 'EFT', 
              'SMS-stop-UFO' : 'SM', 'SMS-stop-NLO_SMQCD-UFO' : 'SM',
              'g g > t t~' : r'$g g \to \bar{t} t$', 'g g > t~ t' : r'$g g \to \bar{t} t$',
              'q q > t t~' : r'$q q \to \bar{t} t$', 'q q > t~ t' : r'$q q \to \bar{t} t$'
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
    
    mST = parsSLHA.blocks['MASS'][5000002]
    mChi = parsSLHA.blocks['MASS'][5000012]
    mT  = parsSLHA.blocks['MASS'][6]
    yDM = list(parsSLHA.blocks['FRBLOCK'].values())[-1]

    
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