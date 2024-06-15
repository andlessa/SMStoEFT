#!/bin/bash

currentDIR="$( pwd )"
delphesDIR=$currentDIR/MG5/Delphes
pythiaDIR=$currentDIR/MG5/HEPTools/pythia8
lhapdfDIR=$currentDIR/MG5/HEPTools/lhapdf6_py3
rivetDIR=$currentDIR/rivet
conturDIR=$currentDIR/contur
#Make sure pythia can be found by Delphes
export LD_LIBRARY_PATH=$pythiaDIR/lib:$lhapdfDIR/lib:$hepmcDIR/lib:$fastjetDIR/lib:$rivetDIR/lib:$rivetDIR/lib64:$LD_LIBRARY_PATH
#Make sure Delphes can be found by ROOT
export ROOT_INCLUDE_PATH=$delphesDIR/external
export PYTHONPATH=$lhapdfDIR/local/lib/python3.12/dist-packages:$rivetDIR/lib/python3.12/site-packages:$PYTHONPATH
#export PYTHONPATH=$conturDIR/python3.12:$PYTHONPATH
#Contur variables:
#export CONTUR_DATA_PATH=~/.local/share/contur
#export RIVET_DATA_PATH=$(echo $CONTUR_DATA_PATH/data/Rivet:$CONTUR_DATA_PATH/data/Theory:$RIVET_DATA_PATH | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')
#export RIVET_ANALYSIS_PATH=$(echo $CONTUR_DATA_PATH/data/Rivet:$CONTUR_USER_DIR:$RIVET_ANALYSIS_PATH | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')
export CONTUR_USER_DIR=$currentDIR/conturOutput
#source ~/.local/bin/conturenv.sh
#source $currentDIR/conturOutput/analysis-list
export RIVET_ANALYSIS_PATH=$currentDIR/contur/data/Rivet:$currentDIR/conturOutput
export RIVET_DATA_PATH=$currentDIR/contur/data/Rivet:$currentDIR/contur/data/Theory
export CONTUR_DATA_PATH=$currentDIR/contur
export CONTUR_USER_DIR=$currentDIR/conturOutput
export PYTHONPATH=$currentDIR/contur:$PYTHONPATH
export PATH=$rivetDIR/bin:$currentDIR/contur/bin:$PATH
if [ -f $currentDIR/conturOutput/analysis-list ]; then
  source $currentDIR/conturOutput/analysis-list
fi

