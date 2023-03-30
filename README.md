# SMStoEFT
Repository for holding code and data for the SMS -> EFT project

### Installation

The following Mathematica packages must be installed (in <home folder>/.Mathematica/Applications)[^1]:

  * [FeynArts,FormCalc,LoopTools](https://feynarts.de/)
  * [FeynRules](https://feynrules.irmp.ucl.ac.be/)
  * [FeynCalc](https://feyncalc.github.io/)
  * [FeynHelpers](https://github.com/FeynCalc/feynhelpers)
  * [Package-X](https://gitlab.com/mule-tools/package-x) (use this [tarball](./packageX.tar.gz))

In addition [MadGraph5](https://launchpad.net/mg5amcnlo) with [Collier](https://collier.hepforge.org/) must also be installed.


### Computing Form Factors

The calculation of form factors can be done using FeynArts, FeynCalc and Package-X (through FeynHelpers).
An example of the calculation of the Higgs-Gluon-Gluon form factor can be found [here](./auxFiles/Examples/feyncalc-HGG.nb).

### Creating Models with Form Factors

Instruction for implementing form factors within MadGraph can be found [here](./InstructionsFormFactors.md). 
These instructions are based on:

 * [MadGraph wiki](https://cp3.irmp.ucl.ac.be/projects/madgraph/wiki/FormFactors)
 * [MadGraph Tutorial](./Refs/Hands-onStartToMG.pdf)
 

   

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
