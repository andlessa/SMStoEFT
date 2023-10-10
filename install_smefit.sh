#!/bin/sh

homeDIR="$( pwd )"

echo "Installation will take place in $homeDIR"

echo "[Checking system dependencies]"
if ! [ -x "$(command -v conda	)" ]; then
  echo "conda not found. Install conda or miniconda:\n\n"
  echo "mkdir -p ~/miniconda3"
  echo "wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh"
  echo "bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3"
  echo "rm -rf ~/miniconda3/miniconda.sh\n\n"
  echo "Modify bashrc: export PATH=/home/lessa/miniconda3/bin:PATH"
  
  exit
fi

echo "[SMEFIT installer] Cloning smefit"
git clone git@github.com:LHCfitNikhef/smefit_release.git SMEFIT
echo "[SMEFIT installer] Cloning smefit database"
git clone git@github.com:LHCfitNikhef/smefit_database.git SMEFIT/smefit_database
mv SMEFIT/smefit_database/commondata/* SMEFIT/commondata/*
mv SMEFIT/smefit_database/theory/* SMEFIT/theory/*
rm -rf SMEFIT/smefit_database
cd SMEFIT
rm -rf .git*
echo "[SMEFIT installer] Installing smefit"
./install.sh;
