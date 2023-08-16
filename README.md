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

```math
    \mathcal{L}_{SMS} = \bar{\chi}\left( i \gamma^\mu \partial_\mu -\frac{1}{2} m_{\chi} \right) \chi + |D_\mu \phi_T|^2 - m_{T}^2 |\phi_T|^2 - y_{\mathrm{DM}} \phi_T^\dagger \bar{\chi} t_R 
```

In addition we assume $m_T > m_{\chi}$, so the DM candidate is stable.

### Top Couplings with Form Factors (Top-FormFactors)

 * The model is defined in [modelFiles/Top-FormFactors.fr](./modelFiles/Top-FormFactors.fr)

The model includes the dim-6 EFT operators in the *off-shell* (Green) basis relevant for $q q \to t \bar{t}$ production.  and corresponds to the lagrangian:

```math
    \mathcal{L}_{FF} = \mathcal{L}_{SMS} + i A_1\ \bar{t}_R \gamma^\mu D_\mu t_R + \frac{i}{2} A_2\ \bar{t}_R \gamma^\mu \left( D^\nu D_\nu D_\mu + D_\mu D^\nu D_\nu \right)  t_R + A_3\ D^\nu G_{\mu \nu}^A \bar{t}_R T^A \gamma^\mu t_R
```

The operator coefficients ($A_i$) are supposed to be replaced by form factors, so the full one loop calculation is reproduced. The model

### Top EFT off-shell (Top-EFToffshell)

 * The model is defined in [modelFiles/Top-EFToffshell.fr](./modelFiles/Top-EFToffshell.fr)

The model is identical to the Top-FormFactor model, except that the coefficients $A_i$ are defined as a function of the heavy BSM masses ($m_T,m_{\chi}$) in the EFT limit: $m_T,m_{\chi} \gg m_t,\hat{s}$.


### Top EFT on-shell (Top-EFTonshell)

 * The model is defined in [modelFiles/Top-EFTonshell.fr](./modelFiles/Top-EFTonshell.fr)

The model includes the dim-6 EFT operators in the *physical* (on-shell) basis relevant for $q q \to t \bar{t}$ production. The model lagrangian is:

```math
    \mathcal{L}_{ttG} = \mathcal{L}_{SMS} + 2 i A_0\ G^{\mu\nu} \bar{t}\gamma^\mu \gamma^\nu t
```

The coefficient $A_0$ is defined as a function of the heavy BSM masses ($m_T,m_{\chi}$) in the EFT limit: $m_T,m_{\chi} \gg m_t,\hat{s}$.

# Additional Information

## Folders and files

 * [convertModelToFA.py](convertModelToFA.py): convert the FeynArts (generic) model file generated by FeynRules so they can be used with FeynCalc
 
 * [convert2SLHA.py](convert2SLHA.py): reads a LHE event file generate by MG5 and convert it to a SLHA file with cross-section blocks.

 * [fixForCollier.sh](fixForCollier.sh): script for making changes to a MG5 process folder in order for it to be compiled with Collier

 * [run_matchmaker.sh](run_matchmaker.sh): script for running MatchMakerEF over for a (compatible) BSM FeynRules file
    
 * scan_parameters_xx.ini: several parameter files for running 
 scans

 * [smodels_parameters.ini](smodels_parameters.ini): parameters for running SModelS

 * [Refs](./Refs): folder listing several relevant references

 * [Recast](./Recast): folder to store the recasting code for the [CMS-EXO-20-004](https://cms-results.web.cern.ch/cms-results/public-results/publications/EXO-20-004/) monojet search and the [ATLAS-SUSY-2018-042](https://atlas.web.cern.ch/Atlas/GROUPS/PHYSICS/PAPERS/SUSY-2018-42/) HSCP search

 * [runScanMG5.py](runScanMG5.py): python code for running scans over the parameter space and generating events with MadGraph

 * [smodelsOutput](smodelsOutput): stores the SModelS output for the UV simplified model (SMS-stop)

 * [slhaFiles](slhaFiles): stores the SLHA files for the simplified model (SMS-stop) to be used as input for SModelS

 * [Cards](./Cards): stores several process and parameter cards for generating events with MadGraph

 * [auxFiles](./auxFiles): contain fixes for the MG5 makefiles required when compiling with Collier as well as the Higgs-G-G example.

 * [mathematicaNBs](./mathematicaNBs/): contains several mathematical notebooks for loading the models, calculating diagrams and loop integrals and checking the matching conditions.

    * [loadModels](./mathematicaNBs/loadModels): notebooks for loading the FeynRules models and exporting to FeynArts and UFO formats

        * [SMS-stop](./mathematicaNBs/loadModels/SMS-stop.nb): loads the UV simplified model
        * [SMS-stopNLO](./mathematicaNBs/loadModels/SMS-stopNLO.nb): loads the UV simplified model with QCD counter-terms (used for the loop induced process $pp \to \chi \chi$)
        * [Top-FormFactors](./mathematicaNBs/loadModels/Top-FormFactors.nb): loads the EFT on-shell model
        * [Top-EFTonshell](./mathematicaNBs/loadModels/Top-EFTonshell.nb): loads the EFT on-shell model
        * [Top-EFToffshell](./mathematicaNBs/loadModels/Top-EFToffshell.nb): loads the EFT off-shell model
    
    * [amplitudes](./mathematicaNBs/oneLoop): notebooks for computing the amplitudes both at 1-loop (UV models) or "tree level" (EFT models)

        * [TopEFTonshell-effectiveCouplings](./mathematicaNBs/amplitudes/TopEFTonshell-effectiveCouplings.nb): computes the amplitudes for $u u \rightarrow t \bar{t}$ using the on-shell EFT model
        * [SMS-oneLoop-diagrams](./mathematicaNBs/amplitudes/SMS-oneLoop-diagrams.nb): all 1-loop diagrams relevant for top EFT
         * [diagrams-SMEFT-stop](./mathematicaNBs/amplitudes/diagrams-SMEFT-stop.nb): all 1-loop diagrams relevant for $pp \to t \bar{t}$ production
        * [diagrams-DMEFT-stop](./mathematicaNBs/amplitudes/diagrams-DMEFT-stop.nb): all 1-loop diagrams relevant for $pp \to \chi \chi$ production         
    
    * [matching](./mathematicaNBs/matching): notebooks for computing the matching between the UV and EFT models.

         * [SMS-stop-ttG-loop](./mathematicaNBs/matching/SMS-stop-ttG-loop.nb): calculation of the full 1-loop effective coupling (gluon-top-top) form factors using the UV model
         * [TopEFT-ttG](./mathematicaNBs/matching/TopEFT-ttG.nb): calculation of the tree level effective coupling (gluon-top-top) using the  model
         * [SMS-stop-Matchete](./mathematicaNBs/matching/SMS-stop-Matchete.nb): matching operators using Matchete.
         * [matchMakerReader](./mathematicaNBs/matching/matchMakerReader.nb): reads the MatchMaker output
         * [numericalLoops](): compute numerical values for the loop integrals (for debugging) as well as the high mass limit
    
    * [modelFiles](./modelFiles): stores the FeynRules files for the models described above

    * [Models](./Models): stores the UFO and FeynArts output for the models described above

    * [notebooks](./notebooks): several jupyter notebooks for plotting and analyzing the data
    

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
 
