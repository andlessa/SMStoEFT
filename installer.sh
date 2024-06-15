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

madgraph="MG5_aMC_v3.5.4.tar.gz"
URL=https://launchpad.net/mg5amcnlo/3.0/3.5.x/+download/$madgraph
#madgraph="auxFiles/MG5_aMC_v3.4.2_fix.tar.gz"
echo -n "Install MadGraph (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
	mkdir MG5;
	echo "[installer] getting MadGraph5"; wget $URL 2>/dev/null || curl -O $URL; 
	tar -zxf $madgraph -C MG5 --strip-components 1;
	cd ./MG5/bin;
	echo "[installer] installing HepMC under MadGraph5"
        echo "install hepmc\ninstall lhapdf6\ninstall pythia8\ninstall Delphes\ninstall collier\ninstall rivet\nexit\n" > mad_install.txt;
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


echo -n "Install Rivet (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
	echo "[installer] Installing Contur using myrivet-bootstrap";
	test -d rivet || mkdir rivet
	test -d tools-build || mkdir tools-build
	./myrivet-bootstrap
fi

echo -n "Install Contur (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
        cd $homeDIR
        source setenv_rivet.sh
        echo "[installer] Getting Contur from main branch";
        wget "https://gitlab.com/hepcedar/contur/-/archive/main/contur-main.tar.gz";
        mkdir contur;
        tar -zxf "contur-main.tar.gz" -C contur --strip-components 1;
        cd contur;
        echo "[installer] installing Contur"
        make;
        cd $homeDIR;
        rm "contur-main.tar.gz";
	#echo "[installer] Installing Contur using pip3";
	#pip3 install --user contur --break-system-packages;
        #source ~/.local/bin/conturenv.sh
        #cd $CONTUR_DATA_PATH
        #make;
        cd $homeDIR
fi


qgraf="qgraf-3.6.6.tgz"
URL=http://qgraf.tecnico.ulisboa.pt/v3.6/$qgraf
echo -n "Install MatchMaker (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
	path_to_executable=$(which qgraf)
	if [ -x "$path_to_executable" ] ; then
		echo "QGraf found at $path_to_executable"
	else
		echo "[installer] getting QGraf"; wget --user anonymous --password anonymous $URL 2>/dev/null || curl -O $URL; 
		mkdir qgraf_tmp
		mv $qgraf qgraf_tmp
		cd qgraf_tmp		
		tar -xzf $qgraf
        mkdir fmodules
		gfortran -o qgraf -Os -J fmodules qgraf-3.6.6.f08
		mv qgraf ~/.local/bin/
	fi
	cd $homeDIR
	rm -rf qgraf_tmp
	pip3 install --user matchmakereft
	echo "[installer] MatchMaker has been installed. Run it once (>matchmakereft) to set the path to FeynRules."
fi



cd $homeDIR
