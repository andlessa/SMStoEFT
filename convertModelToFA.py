#!/usr/bin/env python3

# 1) Run MadGraph using the options set in the input file 
# (the proc_card.dat, parameter_card.dat and run_card.dat...).

from __future__ import print_function
import sys,os,glob
from configParserWrapper import ConfigParserExt
from convert2SLHA import getSLHAFile
import logging,shutil
import subprocess
import multiprocessing
import tempfile
import time,datetime


def main(inputFile,outputFile):
   
   keywords = ['MetricTensor','ScalarProduct','FourVector','DiracSpinor','NonCommutative','DiracSlash','PropagatorDenominator','PolarizationVector','ChiralityProjector','DiracMatrix','DiracSlash','FAGaugeXi']


   FAdict = {label : 'FA'+label for label in keywords}
   
   with open(inputFile,'r') as f:
      data = f.read()

   for label,newLabel in FAdict.items():
       data = data.replace(label,newLabel)
    
   with open(outputFile,'w') as f:
       f.write(data)

   print('Done')

if __name__ == "__main__":
    
    import argparse    
    ap = argparse.ArgumentParser( description=
            "Run a (serial) MadGraph scan for the parameters defined in the parameters file." )
    ap.add_argument('-f', '--inputFile', help='Generic model input file',required=True)
    ap.add_argument('-o', '--outputFile', help='New generic model file name',required=True)


    args = ap.parse_args()
    output = main(args.inputFile,args.outputFile)
            