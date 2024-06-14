#!/bin/sh

currentDIR="$( pwd )"
delphesDIR=$currentDIR/MG5/Delphes
pythiaDIR=$currentDIR/MG5/HEPTools/pythia8
lhapdfDIR=$currentDIR/MG5/HEPTools/lhapdf6_py3
hepmcDIR=$currentDIR/MG5/HEPTools/hepmc
fastjetDIR=$currentDIR/MG5/HEPTools/fastjet
rivetDIR=$currentDIR/MG5/HEPTools/rivet
#Make sure pythia can be found by Delphes
export LD_LIBRARY_PATH=$pythiaDIR/lib:$lhapdfDIR/lib:$hepmcDIR/lib:$fastjetDIR/lib:$rivetDIR/lib:$LD_LIBRARY_PATH
#Make sure Delphes can be found by ROOT
export ROOT_INCLUDE_PATH=$delphesDIR/external
export PYTHONPATH=$lhapdfDIR/local/lib/python3.12/dist-packages:$rivetDIR/lib/python3.12/site-packages:$PYTHONPATH

