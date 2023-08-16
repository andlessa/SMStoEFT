#!/bin/sh

currentDIR="$( pwd )"

smModelFile=$currentDIR/matchmakerModels/MatchMakerEFT/UnbrokenSM_BFM.fr
eftModel=$currentDIR/matchmakerModels/MatchMakerEFT/SMEFT_Green_Bpreserving_MM

Help()
{
   # Display Help
   echo
   echo "Syntax: ./run_matchmaker_sh <FeynRules model file> <output folder>"
   echo
}



if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then 
  echo "Runs MatchMakerEFT for a given input model file plus the UnbrokenSM_BFM model matched to the SMEFT_Green_Bpreserving model."
  Help;
  exit
fi


if [ $# -ne "2" ]; then 
  Help;
  exit
fi

modelFile=`realpath $1`
outputFolder=`realpath $2`
filename=`basename $modelFile`


if [ ! -f "$modelFile" ]; then
  echo "Model file $modelFile DOES NOT exists.\n Please, pass a valid path as the first argument";
  exit
fi

if [ -d "$outputFolder" ]; then 
  echo "Output folder $outputFolder already exists. DELETE folder?[y/n]";
  read answer;
  if echo "$answer" | grep -iq "^y" ;then
    rm -rf $outputFolder;
    mkdir $outputFolder;
  else
    exit;    
  fi
else
  mkdir $outputFolder;
fi

cp $modelFile $outputFolder/$filename

cd $outputFolder
echo "create_model $smModelFile $outputFolder/$filename" > tmp_cmds
modelName=`basename $filename .fr`
modelName=$modelName"_MM"
echo "match_model_to_eft $outputFolder/$modelName $eftModel" >> tmp_cmds
echo "Running MatchMakerEFT in $outputFolder"
matchmakereft < tmp_cmds
rm tmp_cmds
cd $currentDIR
