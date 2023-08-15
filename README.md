# SMStoEFT
Repository for holding code and data for the SMS -> EFT project

## Installation

The following Mathematica packages must be installed (in <home folder>/.Mathematica/Applications)[^1]:

  * [FeynArts,FormCalc,LoopTools](https://feynarts.de/)
  * [FeynRules](https://feynrules.irmp.ucl.ac.be/)
  * [FeynCalc](https://feyncalc.github.io/)
  * [FeynHelpers](https://github.com/FeynCalc/feynhelpers)
  * [Package-X](https://gitlab.com/mule-tools/package-x) (use this [tarball](./packageX.tar.gz))
  * [MatchMakerEFT](https://ftae.ugr.es/matchmakereft/)
  * [Matchete](https://gitlab.com/matchete/matchete)

In addition [MadGraph5](https://launchpad.net/mg5amcnlo) with [Collier](https://collier.hepforge.org/) must also be installed.

## Models Description

### UV Simplified Model (SMS-stop)

 * The model is defined in [modelFiles/SMS-stop.fr](./modelFiles/SMS-stop.fr)

We consider the simple case of a scalar top partner ($\phi_T$), singlet under $SU(2)_L$, and a singlet fermion ($\chi$),
which is a Dark Matter candidate. In addition we impose a $\mathcal{Z}_2$ symmetry, under which the BSM fields are odd and the SM are even. Under this assumptions the renormalizable (UV) BSM lagrangian is:

$$
    \mathcal{L}_{BSM} = \bar{\chi}\left( i \slashed{\partial} -\frac{1}{2} m_{\chi} \right) \chi + |D_\mu \phi_T|^2 - m_{T}^2 |\phi_T|^2 - y_{\mathrm{DM}} \phi_T^\dagger \bar{\chi} t_R 
$$

The FeynRules definition of the model can be found [here](./modelFiles/SMS-stop.fr). A Mathematica notebook for loading the model and exporting to the FeynArts and UFO formats is also available [here]()

In addition we assume $m_T > m_{\chi}$, the DM candidate is stable.

### Top Couplings with Form Factors (Top-FormFactors)

 * The model is defined in [modelFiles/Top-FormFactors.fr](./modelFiles/Top-FormFactors.fr)

The model includes the dim-6 operators relevant for $ q + q \to t + \bar{t}$ production. The operator coefficients are supposed to be replaced by form factos, so the full one loop calculation is reproduced.

### Top EFT off-shell (Top-EFToffshell)

 * The model is defined in [modelFiles/Top-EFToffshell.fr](./modelFiles/Top-EFToffshell.fr)

The model includes the dim-6 EFT operators in the *off-shell* (Green) basis relevant for $ q + q \to t + \bar{t}$ production. The coefficient values are defined as a function of the heavy BSM masses ($m_T,m_{\chi}$) in the EFT limit: $m_T,m_{\chi} \gg m_t,\hat{s}$.

### Top EFT on-shell (Top-EFTonshell)

 * The model is defined in [modelFiles/Top-EFTonshell.fr](./modelFiles/Top-EFTonshell.fr)

The model includes the dim-6 EFT operators in the *physical* (on-shell) basis relevant for $ q + q \to t + \bar{t}$ production. The coefficient values are defined as a function of the heavy BSM masses ($m_T,m_{\chi}$) in the EFT limit: $m_T,m_{\chi} \gg m_t,\hat{s}$.

# Additional Information

## Folders description

 * [mathematicaNBs](./mathematicaNBs/): contains several mathematical notebooks for loading the models, calculating diagrams and loop integrals and checking the matching conditions.
    
    * [matching](./mathematicaNBs/matching): notebooks for computing the matching between the UV and EFT models.

         * [SMS-stop-ttG-loop](./mathematicaNBs/matching/SMS-stop-ttG-loop.nb): calculation of the full 1-loop effective coupling (gluon-top-top) form factors using the UV model
         * [TopEFT-ttG](./mathematicaNBs/matching/TopEFT-ttG.nb): calculation of the tree level effective coupling (gluon-top-top) using the  model
         * [SMS-stop-Matchete](./mathematicaNBs/matching/SMS-stop-Matchete.nb): matching operators using Matchete.
         * [matchMakerReader](./mathematicaNBs/matching/matchMakerReader.nb): reads the MatchMaker output
    
    * [loadModels](./mathematicaNBs/loadModels): notebooks for loading the FeynRules models and exporting to FeynArts and UFO formats

        * [Top-EFTonshell-UFO](./mathematicaNBs/loadModels/Top-EFTonshell-UFO.nb): loads the EFT on-shell model
        * [Top-EFToffshell-UFO](./mathematicaNBs/loadModels/Top-EFToffshell-UFO.nb): loads the EFT off-shell model
    
    * [amplitudes](./mathematicaNBs/oneLoop): notebooks for computing the amplitudes both at 1-loop (UV models) or "tree level" (EFT models)

        * [TopEFTonshell-effectiveCouplings](): computes the amplitudes for $ u + u \rightarrow t + \bar{t}$ using the on-shell EFT model

## Form Factors

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
 
