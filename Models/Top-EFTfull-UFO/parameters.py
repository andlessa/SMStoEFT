# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 14.2.0 for Linux x86 (64-bit) (December 26, 2024)
# Date: Fri 21 Mar 2025 08:23:20



from object_library import all_parameters, Parameter


from function_library import complexconjugate, re, im, csc, sec, acsc, asec, cot

# This is a default parameter object representing 0.
ZERO = Parameter(name = 'ZERO',
                 nature = 'internal',
                 type = 'real',
                 value = '0.0',
                 texname = '0')

# User-defined parameters.
aEWM1 = Parameter(name = 'aEWM1',
                  nature = 'external',
                  type = 'real',
                  value = 127.9,
                  texname = '\\text{aEWM1}',
                  lhablock = 'SMINPUTS',
                  lhacode = [ 1 ])

Gf = Parameter(name = 'Gf',
               nature = 'external',
               type = 'real',
               value = 0.0000116637,
               texname = 'G_f',
               lhablock = 'SMINPUTS',
               lhacode = [ 2 ])

aS = Parameter(name = 'aS',
               nature = 'external',
               type = 'real',
               value = 0.1184,
               texname = '\\alpha _s',
               lhablock = 'SMINPUTS',
               lhacode = [ 3 ])

ymb = Parameter(name = 'ymb',
                nature = 'external',
                type = 'real',
                value = 4.7,
                texname = '\\text{ymb}',
                lhablock = 'YUKAWA',
                lhacode = [ 5 ])

ymt = Parameter(name = 'ymt',
                nature = 'external',
                type = 'real',
                value = 172,
                texname = '\\text{ymt}',
                lhablock = 'YUKAWA',
                lhacode = [ 6 ])

ymtau = Parameter(name = 'ymtau',
                  nature = 'external',
                  type = 'real',
                  value = 1.777,
                  texname = '\\text{ymtau}',
                  lhablock = 'YUKAWA',
                  lhacode = [ 15 ])

yDM = Parameter(name = 'yDM',
                nature = 'external',
                type = 'real',
                value = 1.,
                texname = 'y_{\\text{DM}}',
                lhablock = 'FRBlock',
                lhacode = [ 1 ])

mST = Parameter(name = 'mST',
                nature = 'external',
                type = 'real',
                value = 1000.,
                texname = 'M_T',
                lhablock = 'FRBlock',
                lhacode = [ 2 ])

mChi = Parameter(name = 'mChi',
                 nature = 'external',
                 type = 'real',
                 value = 500.,
                 texname = 'M_{\\chi }',
                 lhablock = 'FRBlock',
                 lhacode = [ 3 ])

mu = Parameter(name = 'mu',
               nature = 'external',
               type = 'real',
               value = 1000.,
               texname = '\\mu',
               lhablock = 'FRBlock',
               lhacode = [ 4 ])

MZ = Parameter(name = 'MZ',
               nature = 'external',
               type = 'real',
               value = 91.1876,
               texname = '\\text{MZ}',
               lhablock = 'MASS',
               lhacode = [ 23 ])

MTA = Parameter(name = 'MTA',
                nature = 'external',
                type = 'real',
                value = 1.777,
                texname = '\\text{MTA}',
                lhablock = 'MASS',
                lhacode = [ 15 ])

MT = Parameter(name = 'MT',
               nature = 'external',
               type = 'real',
               value = 172,
               texname = '\\text{MT}',
               lhablock = 'MASS',
               lhacode = [ 6 ])

MB = Parameter(name = 'MB',
               nature = 'external',
               type = 'real',
               value = 4.7,
               texname = '\\text{MB}',
               lhablock = 'MASS',
               lhacode = [ 5 ])

MH = Parameter(name = 'MH',
               nature = 'external',
               type = 'real',
               value = 125,
               texname = '\\text{MH}',
               lhablock = 'MASS',
               lhacode = [ 25 ])

WZ = Parameter(name = 'WZ',
               nature = 'external',
               type = 'real',
               value = 2.4952,
               texname = '\\text{WZ}',
               lhablock = 'DECAY',
               lhacode = [ 23 ])

WW = Parameter(name = 'WW',
               nature = 'external',
               type = 'real',
               value = 2.085,
               texname = '\\text{WW}',
               lhablock = 'DECAY',
               lhacode = [ 24 ])

WT = Parameter(name = 'WT',
               nature = 'external',
               type = 'real',
               value = 1.50833649,
               texname = '\\text{WT}',
               lhablock = 'DECAY',
               lhacode = [ 6 ])

WH = Parameter(name = 'WH',
               nature = 'external',
               type = 'real',
               value = 0.00407,
               texname = '\\text{WH}',
               lhablock = 'DECAY',
               lhacode = [ 25 ])

aEW = Parameter(name = 'aEW',
                nature = 'internal',
                type = 'real',
                value = '1/aEWM1',
                texname = '\\alpha _{\\text{EW}}')

G = Parameter(name = 'G',
              nature = 'internal',
              type = 'real',
              value = '2*cmath.sqrt(aS)*cmath.sqrt(cmath.pi)',
              texname = 'G')

cuuc = Parameter(name = 'cuuc',
                 nature = 'internal',
                 type = 'real',
                 value = '0.0007915717472057639*( (-mChi**4 + mST**4 + 2*mChi**2*mST**2*cmath.log(mChi**2/mST**2))/(mChi**2 - mST**2)**3 if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.03333333333333333*(7*mChi**2 - 24*mChi*mST + 27*mST**2)/mST**4 )*yDM**4',
                 texname = 'c_{\\text{uuc}}')

MW = Parameter(name = 'MW',
               nature = 'internal',
               type = 'real',
               value = 'cmath.sqrt(MZ**2/2. + cmath.sqrt(MZ**4/4. - (aEW*cmath.pi*MZ**2)/(Gf*cmath.sqrt(2))))',
               texname = 'M_W')

ee = Parameter(name = 'ee',
               nature = 'internal',
               type = 'real',
               value = '2*cmath.sqrt(aEW)*cmath.sqrt(cmath.pi)',
               texname = 'e')

cdd = Parameter(name = 'cdd',
                nature = 'internal',
                type = 'real',
                value = '(-8.795241635619599e-6*G**4)/mST**2',
                texname = 'c_{\\text{dd}}')

cG = Parameter(name = 'cG',
               nature = 'internal',
               type = 'real',
               value = '(0.000017590483271239198*G**3)/mST**2',
               texname = 'c_G')

cqd8 = Parameter(name = 'cqd8',
                 nature = 'internal',
                 type = 'real',
                 value = '(-0.00010554289962743518*G**4)/mST**2',
                 texname = 'c_{\\text{qd8}}')

cqq1 = Parameter(name = 'cqq1',
                 nature = 'internal',
                 type = 'real',
                 value = '(-4.3976208178097996e-6*G**4)/mST**2',
                 texname = 'c_{\\text{qq1}}')

cqq3 = Parameter(name = 'cqq3',
                 nature = 'internal',
                 type = 'real',
                 value = '(-0.000013192862453429398*G**4)/mST**2',
                 texname = 'c_{\\text{qq3}}')

cqu8a = Parameter(name = 'cqu8a',
                  nature = 'internal',
                  type = 'real',
                  value = '(-0.00010554289962743518*G**4)/mST**2',
                  texname = 'c_{\\text{qu8a}}')

cud8a = Parameter(name = 'cud8a',
                  nature = 'internal',
                  type = 'real',
                  value = '(-0.00010554289962743518*G**4)/mST**2',
                  texname = 'c_{\\text{ud8a}}')

cuua = Parameter(name = 'cuua',
                 nature = 'internal',
                 type = 'real',
                 value = '(-8.795241635619599e-6*G**4)/mST**2',
                 texname = 'c_{\\text{uua}}')

cqu8b = Parameter(name = 'cqu8b',
                  nature = 'internal',
                  type = 'real',
                  value = '0.0010554289962743518*(( -0.5*(3*mChi**4 - 4*mChi**2*mST**2 + mST**4 + 2*mChi**4*cmath.log(mST**2/mChi**2))/(-mChi**2 + mST**2)**3 if (-mChi + mST)**2/(mChi + mST)**2>0.001 else -0.016666666666666666*(83*mChi**2 - 96*mChi*mST + 33*mST**2)/mChi**4 ) - 2*( -0.5*(mChi**4 - 4*mChi**2*mST**2 + 3*mST**4 + 2*mST**4*cmath.log(mChi**2/mST**2))/(mChi**2 - mST**2)**3 if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.016666666666666666*(33*mChi**2 - 96*mChi*mST + 83*mST**2)/mST**4 ) + ( (-2*mChi**6 + 9*mChi**4*mST**2 - 18*mChi**2*mST**4 + 11*mST**6 + 6*mST**6*cmath.log(mChi**2/mST**2))/(6.*(mChi**2 - mST**2)**4) if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.016666666666666666*(28*mChi**2 - 80*mChi*mST + 67*mST**2)/mST**4 ) - 2*( (mChi**2 - mST**2 + mChi**2*cmath.log(mST**2/mChi**2))/(-mChi**2 + mST**2)**2 if (-mChi + mST)**2/(mChi + mST)**2>0.001 else -0.16666666666666666*(11*mChi**2 - 12*mChi*mST + 4*mST**2)/mChi**4 ) + ( (-mChi**2 + mST**2 + mST**2*cmath.log(mChi**2/mST**2))/(mChi**2 - mST**2)**2 if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.16666666666666666*(4*mChi**2 - 12*mChi*mST + 11*mST**2)/mST**4 ) + ( (-mChi**4 + mST**4 + 2*mChi**2*mST**2*cmath.log(mChi**2/mST**2))/(mChi**2 - mST**2)**3 if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.03333333333333333*(7*mChi**2 - 24*mChi*mST + 27*mST**2)/mST**4 ))*G**2*yDM**2',
                  texname = 'c_{\\text{qu8b}}')

cud8b = Parameter(name = 'cud8b',
                  nature = 'internal',
                  type = 'real',
                  value = '0.0010554289962743518*(( -0.5*(3*mChi**4 - 4*mChi**2*mST**2 + mST**4 + 2*mChi**4*cmath.log(mST**2/mChi**2))/(-mChi**2 + mST**2)**3 if (-mChi + mST)**2/(mChi + mST)**2>0.001 else -0.016666666666666666*(83*mChi**2 - 96*mChi*mST + 33*mST**2)/mChi**4 ) - 2*( -0.5*(mChi**4 - 4*mChi**2*mST**2 + 3*mST**4 + 2*mST**4*cmath.log(mChi**2/mST**2))/(mChi**2 - mST**2)**3 if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.016666666666666666*(33*mChi**2 - 96*mChi*mST + 83*mST**2)/mST**4 ) + ( (-2*mChi**6 + 9*mChi**4*mST**2 - 18*mChi**2*mST**4 + 11*mST**6 + 6*mST**6*cmath.log(mChi**2/mST**2))/(6.*(mChi**2 - mST**2)**4) if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.016666666666666666*(28*mChi**2 - 80*mChi*mST + 67*mST**2)/mST**4 ) - 2*( (mChi**2 - mST**2 + mChi**2*cmath.log(mST**2/mChi**2))/(-mChi**2 + mST**2)**2 if (-mChi + mST)**2/(mChi + mST)**2>0.001 else -0.16666666666666666*(11*mChi**2 - 12*mChi*mST + 4*mST**2)/mChi**4 ) + ( (-mChi**2 + mST**2 + mST**2*cmath.log(mChi**2/mST**2))/(mChi**2 - mST**2)**2 if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.16666666666666666*(4*mChi**2 - 12*mChi*mST + 11*mST**2)/mST**4 ) + ( (-mChi**4 + mST**4 + 2*mChi**2*mST**2*cmath.log(mChi**2/mST**2))/(mChi**2 - mST**2)**3 if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.03333333333333333*(7*mChi**2 - 24*mChi*mST + 27*mST**2)/mST**4 ))*G**2*yDM**2',
                  texname = 'c_{\\text{ud8b}}')

cuub = Parameter(name = 'cuub',
                 nature = 'internal',
                 type = 'real',
                 value = '-0.00017590483271239196*(( -0.5*(3*mChi**4 - 4*mChi**2*mST**2 + mST**4 + 2*mChi**4*cmath.log(mST**2/mChi**2))/(-mChi**2 + mST**2)**3 if (-mChi + mST)**2/(mChi + mST)**2>0.001 else -0.016666666666666666*(83*mChi**2 - 96*mChi*mST + 33*mST**2)/mChi**4 ) - 2*( -0.5*(mChi**4 - 4*mChi**2*mST**2 + 3*mST**4 + 2*mST**4*cmath.log(mChi**2/mST**2))/(mChi**2 - mST**2)**3 if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.016666666666666666*(33*mChi**2 - 96*mChi*mST + 83*mST**2)/mST**4 ) + ( (-2*mChi**6 + 9*mChi**4*mST**2 - 18*mChi**2*mST**4 + 11*mST**6 + 6*mST**6*cmath.log(mChi**2/mST**2))/(6.*(mChi**2 - mST**2)**4) if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.016666666666666666*(28*mChi**2 - 80*mChi*mST + 67*mST**2)/mST**4 ) - 2*( (mChi**2 - mST**2 + mChi**2*cmath.log(mST**2/mChi**2))/(-mChi**2 + mST**2)**2 if (-mChi + mST)**2/(mChi + mST)**2>0.001 else -0.16666666666666666*(11*mChi**2 - 12*mChi*mST + 4*mST**2)/mChi**4 ) + ( (-mChi**2 + mST**2 + mST**2*cmath.log(mChi**2/mST**2))/(mChi**2 - mST**2)**2 if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.16666666666666666*(4*mChi**2 - 12*mChi*mST + 11*mST**2)/mST**4 ) + ( (-mChi**4 + mST**4 + 2*mChi**2*mST**2*cmath.log(mChi**2/mST**2))/(mChi**2 - mST**2)**3 if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.03333333333333333*(7*mChi**2 - 24*mChi*mST + 27*mST**2)/mST**4 ))*G**2*yDM**2',
                 texname = 'c_{\\text{uub}}')

sw2 = Parameter(name = 'sw2',
                nature = 'internal',
                type = 'real',
                value = '1 - MW**2/MZ**2',
                texname = '\\text{sw2}')

cw = Parameter(name = 'cw',
               nature = 'internal',
               type = 'real',
               value = 'cmath.sqrt(1 - sw2)',
               texname = 'c_w')

sw = Parameter(name = 'sw',
               nature = 'internal',
               type = 'real',
               value = 'cmath.sqrt(sw2)',
               texname = 's_w')

g1 = Parameter(name = 'g1',
               nature = 'internal',
               type = 'real',
               value = 'ee/cw',
               texname = 'g_1')

gw = Parameter(name = 'gw',
               nature = 'internal',
               type = 'real',
               value = 'ee/sw',
               texname = 'g_w')

vev = Parameter(name = 'vev',
                nature = 'internal',
                type = 'real',
                value = '(2*MW*sw)/ee',
                texname = '\\text{vev}')

lam = Parameter(name = 'lam',
                nature = 'internal',
                type = 'real',
                value = 'MH**2/(2.*vev**2)',
                texname = '\\text{lam}')

yb = Parameter(name = 'yb',
               nature = 'internal',
               type = 'real',
               value = '(ymb*cmath.sqrt(2))/vev',
               texname = '\\text{yb}')

yt = Parameter(name = 'yt',
               nature = 'internal',
               type = 'real',
               value = '(ymt*cmath.sqrt(2))/vev',
               texname = '\\text{yt}')

ytau = Parameter(name = 'ytau',
                 nature = 'internal',
                 type = 'real',
                 value = '(ymtau*cmath.sqrt(2))/vev',
                 texname = '\\text{ytau}')

cHq1 = Parameter(name = 'cHq1',
                 nature = 'internal',
                 type = 'real',
                 value = '(-0.0031662869888230555*(-2*( -0.5*(mChi**4 - 4*mChi**2*mST**2 + 3*mST**4 + 2*mST**4*cmath.log(mChi**2/mST**2))/(mChi**2 - mST**2)**3 if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.016666666666666666*(33*mChi**2 - 96*mChi*mST + 83*mST**2)/mST**4 ) + ( (-2*mChi**6 + 9*mChi**4*mST**2 - 18*mChi**2*mST**4 + 11*mST**6 + 6*mST**6*cmath.log(mChi**2/mST**2))/(6.*(mChi**2 - mST**2)**4) if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.016666666666666666*(28*mChi**2 - 80*mChi*mST + 67*mST**2)/mST**4 ) + ( (-mChi**2 + mST**2 + mST**2*cmath.log(mChi**2/mST**2))/(mChi**2 - mST**2)**2 if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.16666666666666666*(4*mChi**2 - 12*mChi*mST + 11*mST**2)/mST**4 ))*yDM**2*ymt**2)/vev**2',
                 texname = 'c_{\\text{Hq1}}')

cHq3 = Parameter(name = 'cHq3',
                 nature = 'internal',
                 type = 'real',
                 value = '(0.0031662869888230555*(-2*( -0.5*(mChi**4 - 4*mChi**2*mST**2 + 3*mST**4 + 2*mST**4*cmath.log(mChi**2/mST**2))/(mChi**2 - mST**2)**3 if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.016666666666666666*(33*mChi**2 - 96*mChi*mST + 83*mST**2)/mST**4 ) + ( (-2*mChi**6 + 9*mChi**4*mST**2 - 18*mChi**2*mST**4 + 11*mST**6 + 6*mST**6*cmath.log(mChi**2/mST**2))/(6.*(mChi**2 - mST**2)**4) if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.016666666666666666*(28*mChi**2 - 80*mChi*mST + 67*mST**2)/mST**4 ) + ( (-mChi**2 + mST**2 + mST**2*cmath.log(mChi**2/mST**2))/(mChi**2 - mST**2)**2 if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.16666666666666666*(4*mChi**2 - 12*mChi*mST + 11*mST**2)/mST**4 ))*yDM**2*ymt**2)/vev**2',
                 texname = 'c_{\\text{Hq3}}')

cuH = Parameter(name = 'cuH',
                nature = 'internal',
                type = 'real',
                value = '(-0.008955612003918067*(-2*( -0.5*(mChi**4 - 4*mChi**2*mST**2 + 3*mST**4 + 2*mST**4*cmath.log(mChi**2/mST**2))/(mChi**2 - mST**2)**3 if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.016666666666666666*(33*mChi**2 - 96*mChi*mST + 83*mST**2)/mST**4 ) + ( (-2*mChi**6 + 9*mChi**4*mST**2 - 18*mChi**2*mST**4 + 11*mST**6 + 6*mST**6*cmath.log(mChi**2/mST**2))/(6.*(mChi**2 - mST**2)**4) if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.016666666666666666*(28*mChi**2 - 80*mChi*mST + 67*mST**2)/mST**4 ) + ( (-mChi**2 + mST**2 + mST**2*cmath.log(mChi**2/mST**2))/(mChi**2 - mST**2)**2 if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.16666666666666666*(4*mChi**2 - 12*mChi*mST + 11*mST**2)/mST**4 ))*yDM**2*ymt**3)/vev**3',
                texname = 'c_{\\text{uH}}')

cuG = Parameter(name = 'cuG',
                nature = 'internal',
                type = 'real',
                value = '(0.002238903000979517*(-2*( -0.5*(mChi**4 - 4*mChi**2*mST**2 + 3*mST**4 + 2*mST**4*cmath.log(mChi**2/mST**2))/(mChi**2 - mST**2)**3 if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.016666666666666666*(33*mChi**2 - 96*mChi*mST + 83*mST**2)/mST**4 ) + ( (-2*mChi**6 + 9*mChi**4*mST**2 - 18*mChi**2*mST**4 + 11*mST**6 + 6*mST**6*cmath.log(mChi**2/mST**2))/(6.*(mChi**2 - mST**2)**4) if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.016666666666666666*(28*mChi**2 - 80*mChi*mST + 67*mST**2)/mST**4 ) + ( (-mChi**2 + mST**2 + mST**2*cmath.log(mChi**2/mST**2))/(mChi**2 - mST**2)**2 if (mChi - mST)**2/(mChi + mST)**2>0.001 else -0.16666666666666666*(4*mChi**2 - 12*mChi*mST + 11*mST**2)/mST**4 ))*G*yDM**2*ymt)/vev',
                texname = 'c_{\\text{uG}}')

muH = Parameter(name = 'muH',
                nature = 'internal',
                type = 'real',
                value = 'cmath.sqrt(lam*vev**2)',
                texname = '\\mu')

