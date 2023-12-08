# SMStoEFT
Holds the code and data for reproducing the results in the [Beyond Top EFT paper](https://arxiv.org/abs/2312.00670).

## Installation

The following external packages are needed.
The Mathematica notebooks assumes that the following packages are installed (in <home folder>/.Mathematica/Applications)[^1]:

  * [FeynArts,FormCalc,LoopTools](https://feynarts.de/)
  * [FeynRules](https://feynrules.irmp.ucl.ac.be/)
  * [FeynCalc](https://feyncalc.github.io/)
  * [FeynHelpers](https://github.com/FeynCalc/feynhelpers)
  * [Package-X](https://gitlab.com/mule-tools/package-x) (use this [tarball](./packageX.tar.gz))
  * [Matchete](https://gitlab.com/matchete/matchete)

Furthermore, in order to reproduce the LHC constraints, the following external packages are needed:
  
  * [SModelS](https://smodels.github.io/)
  * [MadGraph5](https://launchpad.net/mg5amcnlo) with [Collier](https://collier.hepforge.org/), [Pythia8](https://pythia.org/) and [Delphes](https://cp3.irmp.ucl.ac.be/projects/delphes)
  
Running:

```
./installer.sh
```

Should install most of the relevant (non-Mathematica) packages.


## Form Factors

The 1-loop form factors UFO model can be found [here](./Models/Top-FormFactorsOneLoop-UFO/).

### Computing Form Factors

The calculation of form factors can be done using FeynArts, FeynCalc and Package-X (see [formFactors](./mathematicaNBs/formFactors/)).

### Creating Models with Form Factors

Instruction for implementing form factors within MadGraph can be found [here](./InstructionsFormFactors.md). 
These instructions are based on:

 * [MadGraph wiki](https://cp3.irmp.ucl.ac.be/projects/madgraph/wiki/FormFactors)
 * [MadGraph Tutorial](./Refs/Hands-onStartToMG.pdf)

 
## Recasting and Limits

Details about recasting and the calculation of limits can be found in the [Recast](./Recast) folder.


## Folders and files

Below we describe the main files and folders stored in this repository. Additional information about each folder can be found in their README files.

 * [convertModelToFA.py](./convertModelToFA.py): convert the FeynArts (generic) model file generated by FeynRules so they can be used with FeynCalc
 * [convert2SLHA.py](convert2SLHA.py): reads a LHE event file generate by MG5 and convert it to a SLHA file with cross-section blocks.
 * [fixForCollier.sh](fixForCollier.sh): script for making changes to a MG5 process folder in order for it to be compiled with Collier
 * [runScanMG5.py](runScanMG5.py): python code for running scans over the parameter space and generating events with MadGraph
 * [setenv.sh](setenv.sh): bash script for setting the environment variables needed for running runScanMG5.py
 * [configParserWrapper.py](configParserWrapper.py): auxiliary parser used by runScanMG5.py
 * scan_parameters_xx.ini: several parameter files for running scans
 * [smodels_parameters.ini](smodels_parameters.ini): parameters for running SModelS
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
             {ToFileName[$HomeDirectory, ".Mathematica/Applications/LoopTools/x86_64-Linux/bin"],
             ToFileName[$HomeDirectory, ".Mathematica/Applications/FeynRules"],
             ToFileName[$HomeDirectory, ".Mathematica/Applications/FeynArts"],
             ToFileName[$HomeDirectory, ".Mathematica/Applications/X"]
             }, $Path]

     $FeynRulesPath = SetDirectory[FileNameJoin[{$HomeDirectory, ".Mathematica/Applications/FeynRules"}]];                          
     ```     
 
