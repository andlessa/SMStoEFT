# SMStoEFT

Holds the code and data for computing top observables at one loop using the simplified model with a scalar
top partner and a fermion Dark Matter candidate.

## Installation

The following external packages are needed.
The Mathematica notebooks assumes that the following packages are installed (in <home folder>/.Mathematica/Applications)[^1]:

  * [FeynArts,FormCalc,LoopTools](https://feynarts.de/)
  * [FeynRules](https://feynrules.irmp.ucl.ac.be/)
  * [FeynCalc](https://feyncalc.github.io/)
  * [FeynHelpers](https://github.com/FeynCalc/feynhelpers)
  * [Matchete](https://gitlab.com/matchete/matchete)

Furthermore, in order to reproduce the LHC constraints, the following external packages are needed:
  
  * [MadGraph5](https://launchpad.net/mg5amcnlo) with [Collier](https://collier.hepforge.org/), [Pythia8](https://pythia.org/) and [Delphes](https://cp3.irmp.ucl.ac.be/projects/delphes)
  
Running:

```
./installer.sh
```

Should install most of the relevant (non-Mathematica) packages.

## 1-Loop Model

The UFO model containing the counter-terms and vertices needed for computing both QCD and NP
loops can be found in [./Models/SMS-stop_NLO-UFO](./Models/SMS-stop_NLO-UFO).
It has been generated using the [SMS-stop_nlo_UFO.n](./mathematicaNBs/nlo/SMS-stop_nlo_UFO.nb) notebook and the [SMQCD.fr](./modelFiles/SMQCD.fr), [SMS-stop.fr](./modelFiles/SMS-stop.fr)
model files to compute the renormalization conditions and counter terms for the BSM and QCD interactions.
The final NLO model is then generated using the full SM ([SM.fr](./modelFiles/SMQCD.fr)) plus the BSM ([SMS-stop.fr](./modelFiles/SMS-stop.fr)) model files with the counter terms computed previously.


## 1-Loop Event Generation

The 1-loop UFO model can be found [here](./Models/SMS-stop_NLO-UFO).
It can be used to generate fixed-order LHE events (see [./Cards/ttbar-loop]) and compute
 distributions.
*Note that QCD corrections must always be included*, but can be filtered out using the options
in the FKS_params.dat card. For instance the SM*BSM interference term can be selected using
[./Cards/ttbar-loop/FKS_params_InterferenceOnly.dat](./Cards/ttbar-loop/FKS_params_InterferenceOnly.dat).
Also note that the number of events generated (at fixed order) is controlled by the required accuracy
and not the nevents parameter in the run card.

The python code [./runScanMG5.py](./runScanMG5.py) can be used to scan over parameters and generate 
LHE events at fixed order or distributions. An example of input parameters for generating LHE events
can be found [here](./scan_paramaters_ttbarLoop.ini)

### Event Generation with bias

Note that if events are generated using a bias, i.e. using the [run_card_bias.dat](./Cards/ttbar-loop/run_card_bias.dat), the LHE weights should be rescaled by the ratio of the total cross-section (without bias) and the its value with the bias weight.

## SMEFIT Distributions

The observables needed by SMEFIT are defined by the analyses files [analysis_ttx.f](./auxFiles/analysis_ttx.f) and 
[analysis_ttx_8tev.f](./auxFiles/analysis_ttx_8tev.f). They have to be included in the FixedOrderAnalysis folder
of the process and be selected using this [FO analysis card](./Cards/ttbar-loop/FO_analyse_card_smefit.dat).
The output is stored in .HwU files with the cross-sections for each bin.


## Folders and files

Below we describe the main files and folders stored in this repository. Additional information about each folder can be found in their README files.

 * [runScanMG5.py](runScanMG5.py): python code for running scans over the parameter space and generating events with MadGraph
 * [setenv.sh](setenv.sh): bash script for setting the environment variables needed for running runScanMG5.py
 * [configParserWrapper.py](configParserWrapper.py): auxiliary parser used by runScanMG5.py
 * scan_parameters_xx.ini: several parameter files for running scans
 ---
 * [Recast](./Recast): folder to store the recasting codes
 ---
 * [data](./data): folder storing the required data for reproducing the results
 ---
 * [plotting](./plotting): folder storing Jupyter notebooks and code used for plotting
 ---
  * [Cards](./Cards): stores several process and parameter cards for generating events with MadGraph
 ---
 * [auxFiles](./auxFiles): contain fixes for the MG5 makefiles required when compiling with Collier
 ---
 * [modelFiles](./modelFiles): stores the FeynRules files for the models
 ---
 * [Models](./Models): stores the UFO and FeynArts output for the models
 ---
 * [mathematicaNBs](./mathematicaNBs/): contains several mathematical notebooks for loading the models, calculating diagrams and loop integrals and checking the matching conditions.
 
   

[^1]: Make sure to include the following lines to <home folder>/Mathematica/Kernel/init.m:

     ```
     $Path = Join[
             {ToFileName[$UserBaseDirectory, "Applications/LoopTools/x86_64-Linux/bin"],
             ToFileName[$UserBaseDirectory, "Applications/FeynRules"],
             ToFileName[$UserBaseDirectory, "Applications/FeynArts"],
             ToFileName[$UserBaseDirectory, "Applications/X"]
             }, $Path]

     $FeynRulesPath = SetDirectory[FileNameJoin[{$$UserBaseDirectory, "Applications/FeynRules"}]];                          
     ```     
 
