# SMStoEFT
Repository for holding code and data for the SMS -> EFT project

### Installation

The following Mathematica packages must be installed (in <home folder>/.Mathematica/Applications)[^1]:

  * [FeynArts,FormCalc,LoopTools](https://feynarts.de/)
  * [FeynRules](https://feynrules.irmp.ucl.ac.be/)
  * [FeynCalc](https://feyncalc.github.io/)
  * [FeynHelpers](https://github.com/FeynCalc/feynhelpers)
  * [Package-X](https://gitlab.com/mule-tools/package-x) (use this [tarball](./packageX.tar.gz))

In addition [MadGraph5](https://launchpad.net/mg5amcnlo) must also be installed.


### Form Factors

Instruction for implementing form factors within MadGraph can be found here:

 * [MadGraph wiki](https://cp3.irmp.ucl.ac.be/projects/madgraph/wiki/FormFactors)
 * [MadGraph Tutorial](./Refs/Hands-onStartToMG.pdf)
 * [Loop Induced Process - P. Bittar](./Refs/LI_off-shell_Higgs_Final.pdf)
 
An example of the implementation of form factors for the effective Higgs-gluon-gluon coupling
can be found [here](./modelFiles/gghEFT_UFO_withFormFactor/form_factors.py). The [vertices.py](./modelFiles/gghEFT_UFO_withFormFactor/vertices.py)
and [lorentz.py](./modelFiles/gghEFT_UFO_withFormFactor/lorentz.py) files also need to be modified (more details [here](./modelFiles/hGG.fr)).
 
   

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