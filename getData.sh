#!/bin/sh

homeDIR="$( pwd )"

if [ "$1" = "" ]; then 
  fdata="data"
else
  fdata=$1
fi

if [ -d "$homeDIR/$fdata" ]; then
  echo "Folder $homeDIR/$fdata already exists. Pass a new folder name as the first argument."
  exit
fi

echo "Downloading data tarballs to $homeDIR/$fdata"

echo "Downloading processFolders.tar.gz"
wget https://cernbox.cern.ch/remote.php/dav/public-files/B63F7DJu1rbRbxT/processFolders.tar.gz -O $homeDIR/$fdata/processFolders.tar.gz
echo "Downloading xsecs.tar.gz"
wget https://cernbox.cern.ch/remote.php/dav/public-files/B63F7DJu1rbRbxT/xsecs.tar.gz -O $homeDIR/$fdata/xsecs.tar.gz
