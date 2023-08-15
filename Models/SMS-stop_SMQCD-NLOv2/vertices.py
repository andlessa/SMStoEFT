# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 12.1.0 for Linux x86 (64-bit) (March 18, 2020)
# Date: Fri 23 Jun 2023 17:23:51


from object_library import all_vertices, Vertex
import particles as P
import couplings as C
import lorentz as L


V_1 = Vertex(name = 'V_1',
             particles = [ P.ghG, P.ghG__tilde__, P.g ],
             color = [ 'f(1,2,3)' ],
             lorentz = [ L.UUV4 ],
             couplings = {(0,0):C.GC_1})

V_2 = Vertex(name = 'V_2',
             particles = [ P.g, P.g, P.g ],
             color = [ 'f(1,2,3)' ],
             lorentz = [ L.VVV7 ],
             couplings = {(0,0):C.GC_1})

V_3 = Vertex(name = 'V_3',
             particles = [ P.g, P.g, P.g, P.g ],
             color = [ 'f(-1,1,2)*f(3,4,-1)', 'f(-1,1,3)*f(2,4,-1)', 'f(-1,1,4)*f(2,3,-1)' ],
             lorentz = [ L.VVVV14, L.VVVV15, L.VVVV16 ],
             couplings = {(1,1):C.GC_4,(0,0):C.GC_4,(2,2):C.GC_4})

V_4 = Vertex(name = 'V_4',
             particles = [ P.P__tilde__chi, P.t, P.P__tilde__ST__tilde__ ],
             color = [ 'Identity(2,3)' ],
             lorentz = [ L.FFS7 ],
             couplings = {(0,0):C.GC_5})

V_5 = Vertex(name = 'V_5',
             particles = [ P.t__tilde__, P.P__tilde__chi, P.P__tilde__ST ],
             color = [ 'Identity(1,3)' ],
             lorentz = [ L.FFS8 ],
             couplings = {(0,0):C.GC_5})

V_6 = Vertex(name = 'V_6',
             particles = [ P.c__tilde__, P.c, P.g ],
             color = [ 'T(3,2,1)' ],
             lorentz = [ L.FFV12 ],
             couplings = {(0,0):C.GC_3})

V_7 = Vertex(name = 'V_7',
             particles = [ P.t__tilde__, P.t, P.g ],
             color = [ 'T(3,2,1)' ],
             lorentz = [ L.FFV12 ],
             couplings = {(0,0):C.GC_3})

V_8 = Vertex(name = 'V_8',
             particles = [ P.u__tilde__, P.u, P.g ],
             color = [ 'T(3,2,1)' ],
             lorentz = [ L.FFV12 ],
             couplings = {(0,0):C.GC_3})

V_9 = Vertex(name = 'V_9',
             particles = [ P.b__tilde__, P.b, P.g ],
             color = [ 'T(3,2,1)' ],
             lorentz = [ L.FFV12 ],
             couplings = {(0,0):C.GC_3})

V_10 = Vertex(name = 'V_10',
              particles = [ P.d__tilde__, P.d, P.g ],
              color = [ 'T(3,2,1)' ],
              lorentz = [ L.FFV12 ],
              couplings = {(0,0):C.GC_3})

V_11 = Vertex(name = 'V_11',
              particles = [ P.s__tilde__, P.s, P.g ],
              color = [ 'T(3,2,1)' ],
              lorentz = [ L.FFV12 ],
              couplings = {(0,0):C.GC_3})

V_12 = Vertex(name = 'V_12',
              particles = [ P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
              color = [ 'T(1,3,2)' ],
              lorentz = [ L.VSS5 ],
              couplings = {(0,0):C.GC_2})

V_13 = Vertex(name = 'V_13',
              particles = [ P.g, P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
              color = [ 'T(1,-1,3)*T(2,4,-1)', 'T(1,4,-1)*T(2,-1,3)' ],
              lorentz = [ L.VVSS4 ],
              couplings = {(1,0):C.GC_4,(0,0):C.GC_4})

V_14 = Vertex(name = 'V_14',
              particles = [ P.<>CreateObjectParticleName[PartNameMG[anti[MakeIdenticalFermions[#1]] & ]], P.<>CreateObjectParticleName[PartNameMG[anti[MakeIdenticalFermions[#1]] & ]], P.<>CreateObjectParticleName[PartNameMG[anti[MakeIdenticalFermions[#1]] & ]], P.<>CreateObjectParticleName[PartNameMG[3]], P.<>CreateObjectParticleName[PartNameMG[anti[MakeIdenticalFermions[#1]] & ]], P.<>CreateObjectParticleName[PartNameMG[3]] ],
              color = [ '1' ],
              lorentz = [ L.<>PRIVATE`ConvertSpinToString[0]<>PRIVATE`ConvertSpinToString[0]<>PRIVATE`ConvertSpinToString[0]<>PRIVATE`ConvertSpinToString[0]<>PRIVATE`ConvertSpinToString[0]<>PRIVATE`ConvertSpinToString[0]<>3 ],
              couplings = {(0,0):C.GC_16})

