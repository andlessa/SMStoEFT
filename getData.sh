#!/bin/sh

homeDIR="$( pwd )"

if [ "$1" = "" ]; then 
  fdata="processFolders.tar.gz"
else
  fdata=$1
fi

if [ -f "$homeDIR/$fdata" ]; then
  echo "File $homeDIR/$fdata already exists. Pass a new file name for the data as the first argument."
  exit
fi

echo "Downloading data tarball to $homeDIR/$fdata"

wget https://cernbox.cern.ch/index.php/s/----/download -O $homeDIR/$fdata

