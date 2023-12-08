# plotting

Contains code and Jupyter notebooks for analyzing and plotting the results

## Folders and files

* [constraints](./constraints/): notebooks for computing and plotting the exclusion curves from distinct sources of constraints: ATLAS pT measurement, CMS mtt measurement, direct stop searches (SModelS), ISR jets plus MET (monojet). It also contains the notebooks for combining all curves. Some notebooks are divided into: observed and expected exclusions (exp) for the 1-loop (form factor) calculation or using the EFT approximation.

* [distributions](./distributions/): notebooks for plotting the distributions for the ATLAS and CMS analyzes as well as detailed $t \bar{t}$ distributions for distinct BSM points.

* [auxPlots](./auxPlots.py): auxiliary code for computing contours, computing the EFT coefficients and extracting information from LHE events.

* [getSLHAData](./getSLHAData.ipynb): notebook for reading a set of SLHA files and storing the input into a single Pandas dataframe

* [getSModelSData](./getSModelSData.ipynb): notebook for reading a set of SLHA and SModelS output files and storing the input into a single Pandas dataframe

* [plots-eft-coeff](./plots-eft-coeff.ipynb): notebook for plotting the EFT coefficients

* [plots-formFactor](./plots-formFactor.ipynb): notebook for plotting the behavior of the $t-t-g$ form factor