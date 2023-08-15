# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 12.1.0 for Linux x86 (64-bit) (March 18, 2020)
# Date: Fri 23 Jun 2023 17:23:51


from object_library import all_lorentz, Lorentz

from function_library import complexconjugate, re, im, csc, sec, acsc, asec, cot
try:
   import form_factors as ForFac 
except ImportError:
   pass


SS7 = Lorentz(name = 'SS7',
              spins = [ 1, 1 ],
              structure = '1')

SS8 = Lorentz(name = 'SS8',
              spins = [ 1, 1 ],
              structure = 'P(-1,1)**2')

FF10 = Lorentz(name = 'FF10',
               spins = [ 2, 2 ],
               structure = 'P(-1,1)*Gamma(-1,2,1)')

FF11 = Lorentz(name = 'FF11',
               spins = [ 2, 2 ],
               structure = 'ProjM(2,1) + ProjP(2,1)')

UUV4 = Lorentz(name = 'UUV4',
               spins = [ -1, -1, 3 ],
               structure = 'P(3,2) + P(3,3)')

FFS7 = Lorentz(name = 'FFS7',
               spins = [ 2, 2, 1 ],
               structure = 'ProjM(2,1)')

FFS8 = Lorentz(name = 'FFS8',
               spins = [ 2, 2, 1 ],
               structure = 'ProjP(2,1)')

FFV12 = Lorentz(name = 'FFV12',
                spins = [ 2, 2, 3 ],
                structure = 'Gamma(3,2,1)')

FFV13 = Lorentz(name = 'FFV13',
                spins = [ 2, 2, 3 ],
                structure = 'Gamma(3,2,-1)*ProjM(-1,1)')

FFV14 = Lorentz(name = 'FFV14',
                spins = [ 2, 2, 3 ],
                structure = 'Gamma(3,2,-1)*ProjP(-1,1)')

VSS5 = Lorentz(name = 'VSS5',
               spins = [ 3, 1, 1 ],
               structure = 'P(1,2) - P(1,3)')

VVV7 = Lorentz(name = 'VVV7',
               spins = [ 3, 3, 3 ],
               structure = 'P(3,1)*Metric(1,2) - P(3,2)*Metric(1,2) - P(2,1)*Metric(1,3) + P(2,3)*Metric(1,3) + P(1,2)*Metric(2,3) - P(1,3)*Metric(2,3)')

VVSS4 = Lorentz(name = 'VVSS4',
                spins = [ 3, 3, 1, 1 ],
                structure = 'Metric(1,2)')

VVVV14 = Lorentz(name = 'VVVV14',
                 spins = [ 3, 3, 3, 3 ],
                 structure = 'Metric(1,4)*Metric(2,3) - Metric(1,3)*Metric(2,4)')

VVVV15 = Lorentz(name = 'VVVV15',
                 spins = [ 3, 3, 3, 3 ],
                 structure = 'Metric(1,4)*Metric(2,3) - Metric(1,2)*Metric(3,4)')

VVVV16 = Lorentz(name = 'VVVV16',
                 spins = [ 3, 3, 3, 3 ],
                 structure = 'Metric(1,3)*Metric(2,4) - Metric(1,2)*Metric(3,4)')

