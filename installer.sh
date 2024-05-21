#!/bin/sh

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


cd $homeDIR

madgraph="MG5_aMC_v3.5.4.tar.gz"
URL=https://launchpad.net/mg5amcnlo/3.0/3.5.x/+download/$madgraph
#madgraph="MG5_aMC_v3.4.2_fix.tar.gz"
echo -n "Install MadGraph (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
	mkdir MG5;
	echo "[installer] getting MadGraph5"; wget $URL 2>/dev/null || curl -O $URL; 
	tar -zxf $madgraph -C MG5 --strip-components 1;
	cd ./MG5/bin;
	echo "[installer] installing HepMC under MadGraph5"
        echo "install hepmc\ninstall lhapdf6\ninstall pythia8\ninstall Delphes\ninstall collier\nexit\n" > mad_install.txt;
	./mg5_aMC -f mad_install.txt

	rm mad_install.txt;
	cd $homeDIR;
	echo "[installer] copying bias folder"
	cp -r auxFiles/mtt_bias ./MG5/Template/LO/Source/BIAS
#    rm $madgraph;
fi

echo -n "Install SModelS (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
	echo "[installer] getting SModelS"; git clone git@github.com:SModelS/smodels.git smodels;
	echo "[installer] Done"
fi



cd $homeDIR
