#!/usr/bin/env python3


import pandas as pd


def combineRecastData(files,outputFile):

    # Get files
    if not files:
        print('No valid files found')
    else:
        print('Combining %i files' %len(files))

    allData = pd.read_pickle(files[0])
    for f in files[1:]:
        recastData = pd.read_pickle(f)
        allData = pd.concat((allData,recastData),ignore_index=True)

        
    allColumns = allData.columns.tolist()
    orderColumns = ['model', 'mST', 'mChi', 'mT', 'yDM', 'process']
    allCols = orderColumns[:] + [c for c in allColumns if not c in orderColumns]
    allData = allData[allCols]
    allData.sort_values(orderColumns,inplace=True,
                ascending=[False,False,True,True,False],ignore_index=True)     

    # Combine points with same BSM parameters and model (FormFactorOneLoop, Top-EFT,...)
    ## Get all model points:
    models = []
    mCols = ['model', 'mST', 'mChi', 'mT', 'yDM']
    for row in allData[mCols].values:
        m = dict(zip(mCols,row.tolist()))
        if m not in models:
            models.append(m)

    for model in models:
        dataDict = allData.loc[(allData[list(model)] == pd.Series(model)).all(axis=1)].to_dict()
        # Create combined dict with first entry
        combinedDict = {k : list(v.values())[0] for k,v in dataDict.items()}
        model = list(set(dataDict['model'].values()))
        model = ','.join(model)
        process = list(set(dataDict['process'].values()))
        process = ','.join(process)
        


         = {'model' : }
        
        

if __name__ == "__main__":
    
    import argparse    
    ap = argparse.ArgumentParser(description=
            "Merge individual DataFrames for model points to a single DataFrame (pickle file).")
    ap.add_argument('-f', '--inputFiles', required=True,nargs='+',
            help='list of pickle files to be merged', default =[])
    ap.add_argument('-o', '--outputFile', required=True, help='output file.')


    args = ap.parse_args()
    inputFiles = args.inputFiles
    outputFile = args.outputFile
    
    combineRecastData(inputFiles,outputFile)







