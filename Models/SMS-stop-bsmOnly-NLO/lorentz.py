# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 12.1.0 for Linux x86 (64-bit) (March 18, 2020)
# Date: Thu 18 May 2023 16:32:13


from object_library import all_lorentz, Lorentz

from function_library import complexconjugate, re, im, csc, sec, acsc, asec, cot
try:
   import form_factors as ForFac 
except ImportError:
   pass


SS5 = Lorentz(name = 'SS5',
              spins = [ 1, 1 ],
              structure = '1')

SS6 = Lorentz(name = 'SS6',
              spins = [ 1, 1 ],
              structure = 'P(-1,1)**2')

FF7 = Lorentz(name = 'FF7',
              spins = [ 2, 2 ],
              structure = 'P(-1,1)*Gamma(-1,2,1)')

FF8 = Lorentz(name = 'FF8',
              spins = [ 2, 2 ],
              structure = 'ProjM(2,1)')

FF9 = Lorentz(name = 'FF9',
              spins = [ 2, 2 ],
              structure = 'ProjP(2,1)')

UUS3 = Lorentz(name = 'UUS3',
               spins = [ -1, -1, 1 ],
               structure = '1')

UUV3 = Lorentz(name = 'UUV3',
               spins = [ -1, -1, 3 ],
               structure = 'P(3,2) + P(3,3)')

SSS3 = Lorentz(name = 'SSS3',
               spins = [ 1, 1, 1 ],
               structure = '1')

FFS9 = Lorentz(name = 'FFS9',
               spins = [ 2, 2, 1 ],
               structure = 'ProjM(2,1)')

FFS10 = Lorentz(name = 'FFS10',
                spins = [ 2, 2, 1 ],
                structure = 'ProjM(2,1) - ProjP(2,1)')

FFS11 = Lorentz(name = 'FFS11',
                spins = [ 2, 2, 1 ],
                structure = 'ProjP(2,1)')

FFS12 = Lorentz(name = 'FFS12',
                spins = [ 2, 2, 1 ],
                structure = 'ProjM(2,1) + ProjP(2,1)')

FFV15 = Lorentz(name = 'FFV15',
                spins = [ 2, 2, 3 ],
                structure = 'Gamma(3,2,1)')

FFV16 = Lorentz(name = 'FFV16',
                spins = [ 2, 2, 3 ],
                structure = 'Gamma(3,2,-1)*ProjM(-1,1)')

FFV17 = Lorentz(name = 'FFV17',
                spins = [ 2, 2, 3 ],
                structure = 'Gamma(3,2,-1)*ProjP(-1,1)')

FFV18 = Lorentz(name = 'FFV18',
                spins = [ 2, 2, 3 ],
                structure = 'Gamma(3,2,-1)*ProjM(-1,1) - (Gamma(3,2,-1)*ProjP(-1,1))/2.')

FFV19 = Lorentz(name = 'FFV19',
                spins = [ 2, 2, 3 ],
                structure = 'Gamma(3,2,-1)*ProjM(-1,1) + (Gamma(3,2,-1)*ProjP(-1,1))/4.')

FFV20 = Lorentz(name = 'FFV20',
                spins = [ 2, 2, 3 ],
                structure = 'Gamma(3,2,-1)*ProjM(-1,1) + (Gamma(3,2,-1)*ProjP(-1,1))/2.')

FFV21 = Lorentz(name = 'FFV21',
                spins = [ 2, 2, 3 ],
                structure = 'Gamma(3,2,-1)*ProjM(-1,1) + Gamma(3,2,-1)*ProjP(-1,1)')

VSS3 = Lorentz(name = 'VSS3',
               spins = [ 3, 1, 1 ],
               structure = 'P(1,2) - P(1,3)')

VVS3 = Lorentz(name = 'VVS3',
               spins = [ 3, 3, 1 ],
               structure = 'Metric(1,2)')

VVV3 = Lorentz(name = 'VVV3',
               spins = [ 3, 3, 3 ],
               structure = 'P(3,1)*Metric(1,2) - P(3,2)*Metric(1,2) - P(2,1)*Metric(1,3) + P(2,3)*Metric(1,3) + P(1,2)*Metric(2,3) - P(1,3)*Metric(2,3)')

SSSS3 = Lorentz(name = 'SSSS3',
                spins = [ 1, 1, 1, 1 ],
                structure = '1')

VVSS3 = Lorentz(name = 'VVSS3',
                spins = [ 3, 3, 1, 1 ],
                structure = 'Metric(1,2)')

VVVV11 = Lorentz(name = 'VVVV11',
                 spins = [ 3, 3, 3, 3 ],
                 structure = 'Metric(1,4)*Metric(2,3) - Metric(1,3)*Metric(2,4)')

VVVV12 = Lorentz(name = 'VVVV12',
                 spins = [ 3, 3, 3, 3 ],
                 structure = 'Metric(1,4)*Metric(2,3) + Metric(1,3)*Metric(2,4) - 2*Metric(1,2)*Metric(3,4)')

VVVV13 = Lorentz(name = 'VVVV13',
                 spins = [ 3, 3, 3, 3 ],
                 structure = 'Metric(1,4)*Metric(2,3) - Metric(1,2)*Metric(3,4)')

VVVV14 = Lorentz(name = 'VVVV14',
                 spins = [ 3, 3, 3, 3 ],
                 structure = 'Metric(1,3)*Metric(2,4) - Metric(1,2)*Metric(3,4)')

VVVV15 = Lorentz(name = 'VVVV15',
                 spins = [ 3, 3, 3, 3 ],
                 structure = 'Metric(1,4)*Metric(2,3) - (Metric(1,3)*Metric(2,4))/2. - (Metric(1,2)*Metric(3,4))/2.')

