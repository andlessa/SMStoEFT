#!/bin/sh

currentDIR="$( pwd )"

[ ! -d "$1" ] && echo "Directory $1 DOES NOT exists.\n Please, pass a valid process folder as the first argument" && exit


procDIR="$(cd "$(dirname "$1")" >/dev/null; pwd -P)/$(basename "$1")"


cp auxFiles/SubProcesses/makefile $procDIR/SubProcesses/
cp auxFiles/Source/makefile $procDIR/Source/
cp MG5/HEPTools/collier/COLLIER-1.2.7/modules/collier.mod $procDIR/Source/MODEL/
cp MG5/HEPTools/collier/COLLIER-1.2.7/libcollier.a $procDIR/lib

echo "Fixes for $procDIR done."


