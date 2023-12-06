# Recast

Contains code and results for recasting the ATLAS and CMS top measurements as well as the CMS ISR+MET (monojet) search.

## Folders and files

* [sms_smodels](./sms_smodels.pclsms_): contains a Pandas dataframe holding the SModelS output for recasting direct searches used for [plotting](../plotting/).

* [ATLAS-TOPQ-2019-23_tpT](./ATLAS-TOPQ-2019-23_tpT/): contains code and data for recasting the [ATLAS-TOPQ-2019-23](https://atlas.web.cern.ch/Atlas/GROUPS/PHYSICS/PAPERS/TOPQ-2019-23/) analysis. Contains code for [applying the event selection](./ATLAS-TOPQ-2019-23_tpT/atlas_topq_2019_23_Recast.py), [combining results](./ATLAS-TOPQ-2019-23_tpT/atlas_topq_2019_23_CombineData.py) results from different BSM points into a single Pandas dataframe and [computing observed and expected upper limits](./ATLAS-TOPQ-2019-23_tpT/atlas_topq_2019_23_Limits.py) using ATLAS data. It also stores the dataframes used for [plotting](../plotting/).

* [CMS-TOP-20-001_mtt](./CMS-TOP-20-001_mtt/): contains code and data for recasting the [CMS-TOP-20-001](https://cms-results.web.cern.ch/cms-results/public-results/publications/TOP-20-001/) analysis. Contains code for [applying the event selection](./CMS-TOP-20-001_mtt/cms_top_20_001_Recast.py), [combining results](./CMS-TOP-20-001_mtt/cms_top_20_001_CombineData.py) results from different BSM points into a single Pandas dataframe and [computing observed and expected upper limits](./CMS-TOP-20-001_mtt/cms_top_20_001_Limits.py) using ATLAS data. It also stores the dataframes used for [plotting](../plotting/).


* [CMS-EXO-20-004](./CMS-EXO-20-004/): contains code and data for recasting the [CMS-EXO-20-004](https://cms-results.web.cern.ch/cms-results/public-results/publications/EXO-20-004/) analysis. Contains code for [applying the event selection](./CMS-EXO-20-004/cms_exo_20_004_Recast.py), [combining results](./CMS-EXO-20-004/cms_exo_20_004_CombineData.py) results from different BSM points into a single Pandas dataframe and [computing observed and expected upper limits](./CMS-EXO-20-004/cms_exo_20_004_Limits.py) using ATLAS data. It also stores the dataframes used for [plotting](../plotting/).

* [statisticalTools](./statisticalTools/): contains additional code computing upper limits using covariant matrices.
