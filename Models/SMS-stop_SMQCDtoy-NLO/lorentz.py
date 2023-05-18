# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 12.1.0 for Linux x86 (64-bit) (March 18, 2020)
# Date: Tue 16 May 2023 14:12:33


from object_library import all_lorentz, Lorentz

from function_library import complexconjugate, re, im, csc, sec, acsc, asec, cot
try:
   import form_factors as ForFac 
except ImportError:
   pass


SS1 = Lorentz(name = 'SS1',
              spins = [ 1, 1 ],
              structure = '1')

SS2 = Lorentz(name = 'SS2',
              spins = [ 1, 1 ],
              structure = 'P(-1,1)**2')

FF1 = Lorentz(name = 'FF1',
              spins = [ 2, 2 ],
              structure = 'P(-1,1)*Gamma(-1,2,1)')

FF2 = Lorentz(name = 'FF2',
              spins = [ 2, 2 ],
              structure = 'ProjM(2,1)')

FF3 = Lorentz(name = 'FF3',
              spins = [ 2, 2 ],
              structure = 'P(-1,1)*Gamma(-1,2,-2)*ProjM(-2,1)')

FF4 = Lorentz(name = 'FF4',
              spins = [ 2, 2 ],
              structure = 'ProjP(2,1)')

FF5 = Lorentz(name = 'FF5',
              spins = [ 2, 2 ],
              structure = 'ProjM(2,1) + ProjP(2,1)')

FF6 = Lorentz(name = 'FF6',
              spins = [ 2, 2 ],
              structure = 'P(-1,1)*Gamma(-1,2,-2)*ProjP(-2,1)')

FF7 = Lorentz(name = 'FF7',
              spins = [ 2, 2 ],
              structure = 'P(-1,1)*Gamma(-1,2,-2)*ProjM(-2,1) + P(-1,1)*Gamma(-1,2,-2)*ProjP(-2,1)')

VV1 = Lorentz(name = 'VV1',
              spins = [ 3, 3 ],
              structure = 'P(1,2)*P(2,2)')

VV2 = Lorentz(name = 'VV2',
              spins = [ 3, 3 ],
              structure = 'Metric(1,2)')

VV3 = Lorentz(name = 'VV3',
              spins = [ 3, 3 ],
              structure = 'P(-1,2)**2*Metric(1,2)')

UUV1 = Lorentz(name = 'UUV1',
               spins = [ -1, -1, 3 ],
               structure = 'P(3,2) + P(3,3)')

FFS1 = Lorentz(name = 'FFS1',
               spins = [ 2, 2, 1 ],
               structure = 'ProjM(2,1)')

FFS2 = Lorentz(name = 'FFS2',
               spins = [ 2, 2, 1 ],
               structure = 'ProjP(2,1)')

FFV1 = Lorentz(name = 'FFV1',
               spins = [ 2, 2, 3 ],
               structure = 'Gamma(3,2,1)')

FFV2 = Lorentz(name = 'FFV2',
               spins = [ 2, 2, 3 ],
               structure = 'Gamma(3,2,-1)*ProjM(-1,1)')

FFV3 = Lorentz(name = 'FFV3',
               spins = [ 2, 2, 3 ],
               structure = 'Gamma(3,2,-1)*ProjP(-1,1)')

VSS1 = Lorentz(name = 'VSS1',
               spins = [ 3, 1, 1 ],
               structure = 'P(1,2)')

VSS2 = Lorentz(name = 'VSS2',
               spins = [ 3, 1, 1 ],
               structure = 'P(1,3)')

VVV1 = Lorentz(name = 'VVV1',
               spins = [ 3, 3, 3 ],
               structure = 'P(3,1)*Metric(1,2) - 3*P(3,2)*Metric(1,2) - P(3,3)*Metric(1,2) - P(2,1)*Metric(1,3) + P(2,2)*Metric(1,3) + 3*P(2,3)*Metric(1,3) + 2*P(1,2)*Metric(2,3) - 2*P(1,3)*Metric(2,3)')

VVV2 = Lorentz(name = 'VVV2',
               spins = [ 3, 3, 3 ],
               structure = 'P(3,1)*Metric(1,2) - P(3,2)*Metric(1,2) - P(2,1)*Metric(1,3) + P(2,3)*Metric(1,3) + P(1,2)*Metric(2,3) - P(1,3)*Metric(2,3)')

VVV3 = Lorentz(name = 'VVV3',
               spins = [ 3, 3, 3 ],
               structure = 'P(3,1)*Metric(1,2) - P(3,2)*Metric(1,2) + P(2,2)*Metric(1,3) + 2*P(2,3)*Metric(1,3) + P(1,2)*Metric(2,3) - P(1,3)*Metric(2,3)')

VVV4 = Lorentz(name = 'VVV4',
               spins = [ 3, 3, 3 ],
               structure = 'P(3,1)*Metric(1,2) - (11*P(3,2)*Metric(1,2))/17. + (3*P(3,3)*Metric(1,2))/17. - P(2,1)*Metric(1,3) - (3*P(2,2)*Metric(1,3))/17. + (11*P(2,3)*Metric(1,3))/17. + (14*P(1,2)*Metric(2,3))/17. - (14*P(1,3)*Metric(2,3))/17.')

VVSS1 = Lorentz(name = 'VVSS1',
                spins = [ 3, 3, 1, 1 ],
                structure = 'Metric(1,2)')

VVVV1 = Lorentz(name = 'VVVV1',
                spins = [ 3, 3, 3, 3 ],
                structure = 'Metric(1,4)*Metric(2,3)')

VVVV2 = Lorentz(name = 'VVVV2',
                spins = [ 3, 3, 3, 3 ],
                structure = 'Metric(1,3)*Metric(2,4)')

VVVV3 = Lorentz(name = 'VVVV3',
                spins = [ 3, 3, 3, 3 ],
                structure = 'Metric(1,4)*Metric(2,3) - Metric(1,3)*Metric(2,4)')

VVVV4 = Lorentz(name = 'VVVV4',
                spins = [ 3, 3, 3, 3 ],
                structure = 'Metric(1,2)*Metric(3,4)')

VVVV5 = Lorentz(name = 'VVVV5',
                spins = [ 3, 3, 3, 3 ],
                structure = 'Metric(1,4)*Metric(2,3) - Metric(1,2)*Metric(3,4)')

VVVV6 = Lorentz(name = 'VVVV6',
                spins = [ 3, 3, 3, 3 ],
                structure = 'Metric(1,3)*Metric(2,4) - Metric(1,2)*Metric(3,4)')

VVVV7 = Lorentz(name = 'VVVV7',
                spins = [ 3, 3, 3, 3 ],
                structure = 'Metric(1,4)*Metric(2,3) + Metric(1,3)*Metric(2,4) + Metric(1,2)*Metric(3,4)')

