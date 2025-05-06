#!/bin/bash

homeDIR="$( pwd )"

echo "Installation will take place in $homeDIR"

echo "[Checking system dependencies]"
PKG_OK=$(dpkg-query -W -f='${Status}' autoconf 2>/dev/null | grep -c "ok installed")
if test $PKG_OK = "0" ; then
  echo "autoconf not found. Install it with sudo apt-get install autoconf."
  exit
fi
PKG_OK=$(dpkg-query -W -f='${Status}' libtool 2>/dev/null | grep -c "ok installed")
if test $PKG_OK = "0" ; then
  echo "libtool not found. Install it with sudo apt-get install libtool."
  exit
fi
PKG_OK=$(dpkg-query -W -f='${Status}' gzip 2>/dev/null | grep -c "ok installed")
if test $PKG_OK = "0" ; then
  echo "gzip not found. Install it with sudo apt-get install gzip."
  exit
fi
PKG_OK=$(dpkg-query -W -f='${Status}' bzr 2>/dev/null | grep -c "ok installed")
if test $PKG_OK = "0" ; then
  echo "bzr not found. Install it with sudo apt-get install bzr."
  exit
fi
PKG_OK=$(dpkg-query -W -f='${Status}' form 2>/dev/null | grep -c "ok installed")
if test $PKG_OK = "0" ; then
  echo "form not found. Install it with sudo apt-get install form."
  exit
fi
PKG_OK=$(dpkg-query -W -f='${Status}' sqlite3 2>/dev/null | grep -c "ok installed")
if test $PKG_OK = "0" ; then
  echo "sqlite3 not found. Install it with sudo apt-get install sqlite3."
  exit
fi
PKG_OK=$(dpkg-query -W -f='${Status}' cython3 2>/dev/null | grep -c "ok installed")
if test $PKG_OK = "0" ; then
  echo "cython3 not found. Install it with sudo apt-get install cython3."
  exit
fi
PKG_OK=$(dpkg-query -W -f='${Status}' autoconf --version 2>/dev/null | grep -c "ok installed")
if test $PKG_OK = "0" ; then
  echo "autoconf not found. Install it with sudo apt-get install autotools-dev."
  exit
fi

cd $homeDIR

madgraph="MG5_aMC_v3.6.2.tar.gz"
URL=https://launchpad.net/mg5amcnlo/3.0/3.5.x/+download/$madgraph
#madgraph="auxFiles/MG5_aMC_v3.4.2_fix.tar.gz"
echo -n "Install MadGraph (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
	mkdir MG5;
	tar -zxf $madgraph -C MG5 --strip-components 1;
	cd ./MG5/bin;
	echo "[installer] installing HepMC under MadGraph5"
	echo -e "install hepmc\ninstall lhapdf6\ninstall pythia8\ninstall Delphes\ninstall collier\ninstall oneloop\ninstall ninja\ninstall cuttools\nexit\n" > mad_install.txt
	./mg5_aMC -f mad_install.txt
	# rm mad_install.txt;
	cd $homeDIR;
	echo "[installer] copying bias folder"
	cp -r auxFiles/mtt_bias ./MG5/Template/LO/Source/BIAS
	cp auxFiles/mtt_bias/mtt_bias_NLO.f ./MG5/Template/NLO/Source/
	cp auxFiles/analysis_ttx.f ./MG5/Template/NLO/FixedOrderAnalysis/
	cp auxFiles/analysis_ttx_8tev.f ./MG5/Template/NLO/FixedOrderAnalysis/
	cp auxFiles/analysis_4top_split_xsecs.f ./MG5/Template/NLO/FixedOrderAnalysis/
        cp auxFiles/amcatnlo_run_interface.py ./MG5/madgraph/interface/amcatnlo_run_interface.py
        cp auxFiles/mg5_configuration.txt MG5/input/
        
#    rm $madgraph;
fi



cd $homeDIR
