# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 12.1.0 for Linux x86 (64-bit) (March 18, 2020)
# Date: Tue 16 May 2023 14:12:33



from object_library import all_parameters, Parameter


from function_library import complexconjugate, re, im, csc, sec, acsc, asec, cot

# This is a default parameter object representing 0.
ZERO = Parameter(name = 'ZERO',
                 nature = 'internal',
                 type = 'real',
                 value = '0.0',
                 texname = '0')

# This is a default parameter object representing the renormalization scale (MU_R).
MU_R = Parameter(name = 'MU_R',
                 nature = 'external',
                 type = 'real',
                 value = 91.188,
                 texname = '\\text{\\mu_r}',
                 lhablock = 'LOOP',
                 lhacode = [1])

# User-defined parameters.
aEWM1 = Parameter(name = 'aEWM1',
                  nature = 'external',
                  type = 'real',
                  value = 127.9,
                  texname = '\\text{aEWM1}',
                  lhablock = 'SMINPUTS',
                  lhacode = [ 1 ])

aS = Parameter(name = 'aS',
               nature = 'external',
               type = 'real',
               value = 0.1184,
               texname = '\\alpha _s',
               lhablock = 'SMINPUTS',
               lhacode = [ 3 ])

yDM = Parameter(name = 'yDM',
                nature = 'external',
                type = 'real',
                value = 1.,
                texname = 'y_{\\text{DM}}',
                lhablock = 'FRBlock',
                lhacode = [ 1 ])

MU = Parameter(name = 'MU',
               nature = 'external',
               type = 'real',
               value = 0.,
               texname = 'M',
               lhablock = 'MASS',
               lhacode = [ 2 ])

MT = Parameter(name = 'MT',
               nature = 'external',
               type = 'real',
               value = 173.,
               texname = '\\text{MT}',
               lhablock = 'MASS',
               lhacode = [ 6 ])

mChi = Parameter(name = 'mChi',
                 nature = 'external',
                 type = 'real',
                 value = 100.,
                 texname = '\\text{mChi}',
                 lhablock = 'MASS',
                 lhacode = [ 5000012 ])

mST = Parameter(name = 'mST',
                nature = 'external',
                type = 'real',
                value = 400.,
                texname = '\\text{mST}',
                lhablock = 'MASS',
                lhacode = [ 5000002 ])

WT = Parameter(name = 'WT',
               nature = 'external',
               type = 'real',
               value = 1.50833649,
               texname = '\\text{WT}',
               lhablock = 'DECAY',
               lhacode = [ 6 ])

wChi = Parameter(name = 'wChi',
                 nature = 'external',
                 type = 'real',
                 value = 0.,
                 texname = '\\text{wChi}',
                 lhablock = 'DECAY',
                 lhacode = [ 5000012 ])

wST = Parameter(name = 'wST',
                nature = 'external',
                type = 'real',
                value = 1.,
                texname = '\\text{wST}',
                lhablock = 'DECAY',
                lhacode = [ 5000002 ])

G = Parameter(name = 'G',
              nature = 'internal',
              type = 'real',
              value = '2*cmath.sqrt(aS)*cmath.sqrt(cmath.pi)',
              texname = 'G')

aEW = Parameter(name = 'aEW',
                nature = 'internal',
                type = 'real',
                value = '1/aEWM1',
                texname = '\\alpha _{\\text{EW}}')

ee = Parameter(name = 'ee',
               nature = 'internal',
               type = 'real',
               value = '2*cmath.sqrt(aEW)*cmath.sqrt(cmath.pi)',
               texname = 'e')

