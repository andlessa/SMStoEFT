# Recast

Contains code and results for recasting the ATLAS and CMS top measurements as well as the CMS ISR+MET (monojet) search.

## Folders and files

* [sms_smodels](./sms_smodels.pcl): contains a Pandas dataframe holding the SModelS output for recasting direct searches used for [plotting](../plotting/).

* [getSModelSData](./getSModelSData.ipynb): jupyter notebook for collecting the SModelS output in a single Pandas dataframe.

* [ATLAS-TOPQ-2019-23_tpT](./ATLAS-TOPQ-2019-23_tpT/): contains code and data for recasting the [ATLAS-TOPQ-2019-23](https://atlas.web.cern.ch/Atlas/GROUPS/PHYSICS/PAPERS/TOPQ-2019-23/) analysis. Contains code for [applying the event selection](./ATLAS-TOPQ-2019-23_tpT/atlas_topq_2019_23_Recast.py), [combining results](./ATLAS-TOPQ-2019-23_tpT/atlas_topq_2019_23_CombineData.py) results from different BSM points into a single Pandas dataframe and [computing observed and expected upper limits](./ATLAS-TOPQ-2019-23_tpT/atlas_topq_2019_23_Limits.py) using ATLAS data. It also stores the dataframes used for [plotting](../plotting/).

* [CMS-TOP-20-001_mtt](./CMS-TOP-20-001_mtt/): contains code and data for recasting the [CMS-TOP-20-001](https://cms-results.web.cern.ch/cms-results/public-results/publications/TOP-20-001/) analysis. Contains code for [applying the event selection](./CMS-TOP-20-001_mtt/cms_top_20_001_Recast.py), [combining results](./CMS-TOP-20-001_mtt/cms_top_20_001_CombineData.py) results from different BSM points into a single Pandas dataframe and [computing observed and expected upper limits](./CMS-TOP-20-001_mtt/cms_top_20_001_Limits.py) using ATLAS data. It also stores the dataframes used for [plotting](../plotting/).

* [CMS-EXO-20-004](./CMS-EXO-20-004/): contains code and data for recasting the [CMS-EXO-20-004](https://cms-results.web.cern.ch/cms-results/public-results/publications/EXO-20-004/) analysis. Contains code for [applying the event selection](./CMS-EXO-20-004/cms_exo_20_004_Recast.py), [combining results](./CMS-EXO-20-004/cms_exo_20_004_CombineData.py) results from different BSM points into a single Pandas dataframe and [computing observed and expected upper limits](./CMS-EXO-20-004/cms_exo_20_004_Limits.py) using ATLAS data. It also stores the dataframes used for [plotting](../plotting/).

* [statisticalTools](./statisticalTools/): contains additional code computing upper limits using covariant matrices.


## Running the recast code

In order to compute distributions and limits from MC events, the following steps can be taken:

 1. First, run (in the analysis folder):   
    ```
    <analysis>_Recast.py -f <event file> -o <output file> -w <weight multiplier>
    ```
    where \<event file\> is the path to the LHE or ROOT event file, \<output file\> is the path to the output pickle file, which will store the required signal yields and information in a Pandas dataframe. The weight multiplier is optional and can be used to rescale the input cross-section. This is particularly useful when reading decayed $t \bar{t}$ events, where only one of the decay possibilities was considered.

 2. The output of the last step will be a pickle file for each MC event file. These can then be merged into a single dataframe running:
    ```
    <analysis>_CombineData.py -f <list of pickle files> -o <output file>
    ```
    where \<list of pickle files\> is a list of file paths generated by the previous step and \<output file\> is the path to the output pickle file, which will store combined data.

  3. Finally, the observed and expected upper limits can be computed running:
     ```
     <analysis>_Limits.py -f <pickle file>
     ```
     where \<pickle file\> is the output generated by the last step. The limits will be added to the input file and can then be used for extracting exclusion curves (see [plotting](../plotting/))

### Running SModelS

The SModelS output can be obtained after installing SModelS and running

     ```
     runSModelS.py -f <slhaFolder> -o <outputFolder> -p <parameters file>
     ```
     where \<slhaFolder\> is the folder containing the SLHA files (see [data](../data/)), \<outputFolder\> is the output folder and \<parameters file\> is the SModelS parameter file (see [smodels_parameters](../smodels_parameters.ini)).

Finally, the [getSModelSData](./getSModelSData.ipynb) can be used to store the results in a single Pandas dataframe.