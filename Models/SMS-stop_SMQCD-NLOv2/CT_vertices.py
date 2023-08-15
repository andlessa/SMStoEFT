# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 12.1.0 for Linux x86 (64-bit) (March 18, 2020)
# Date: Fri 23 Jun 2023 17:23:52


from object_library import all_vertices, all_CTvertices, Vertex, CTVertex
import particles as P
import CT_couplings as C
import lorentz as L


V_1 = CTVertex(name = 'V_1',
               type = 'R2',
               particles = [ P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
               color = [ 'T(1,3,2)' ],
               lorentz = [ L.VSS5 ],
               loop_particles = [ [ [P.P__tilde__chi, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_9_4})

V_2 = CTVertex(name = 'V_2',
               type = 'R2',
               particles = [ P.g, P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
               color = [ 'T(1,-1,3)*T(2,4,-1)', 'T(1,4,-1)*T(2,-1,3)' ],
               lorentz = [ L.VVSS4 ],
               loop_particles = [ [ [P.P__tilde__chi, P.t] ] ],
               couplings = {(1,0,0):C.R2GC_10_1,(0,0,0):C.R2GC_10_1})

V_3 = CTVertex(name = 'V_3',
               type = 'R2',
               particles = [ P.P__tilde__ST__tilde__, P.P__tilde__ST ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.SS7, L.SS8 ],
               loop_particles = [ [ [P.P__tilde__chi, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_11_2,(0,1,0):C.R2GC_8_3})

V_4 = CTVertex(name = 'V_4',
               type = 'UV',
               particles = [ P.P__tilde__chi, P.t, P.P__tilde__ST__tilde__ ],
               color = [ 'Identity(2,3)' ],
               lorentz = [ L.FFS7 ],
               loop_particles = [ [ [P.P__tilde__chi, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ], [ [P.P__tilde__ST, P.t] ] ],
               couplings = {(0,0,0):C.UVGC_12_3,(0,0,1):C.UVGC_12_4,(0,0,2):C.UVGC_15_7})

V_5 = CTVertex(name = 'V_5',
               type = 'UV',
               particles = [ P.t__tilde__, P.P__tilde__chi, P.P__tilde__ST ],
               color = [ 'Identity(1,3)' ],
               lorentz = [ L.FFS8 ],
               loop_particles = [ [ [P.P__tilde__chi, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
               couplings = {(0,0,0):C.UVGC_12_3,(0,0,1):C.UVGC_12_4})

V_6 = CTVertex(name = 'V_6',
               type = 'UV',
               particles = [ P.t__tilde__, P.t, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV13, L.FFV14 ],
               loop_particles = [ [ [P.P__tilde__chi, P.P__tilde__ST] ] ],
               couplings = {(0,0,0):C.UVGC_6_8,(0,1,0):C.UVGC_7_9})

V_7 = CTVertex(name = 'V_7',
               type = 'UV',
               particles = [ P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
               color = [ 'T(1,3,2)' ],
               lorentz = [ L.VSS5 ],
               loop_particles = [ [ [P.P__tilde__chi, P.t] ] ],
               couplings = {(0,0,0):C.UVGC_9_11})

V_8 = CTVertex(name = 'V_8',
               type = 'UV',
               particles = [ P.g, P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
               color = [ 'T(1,-1,3)*T(2,4,-1)', 'T(1,4,-1)*T(2,-1,3)' ],
               lorentz = [ L.VVSS4 ],
               loop_particles = [ [ [P.P__tilde__chi, P.t] ] ],
               couplings = {(1,0,0):C.UVGC_10_1,(0,0,0):C.UVGC_10_1})

V_9 = CTVertex(name = 'V_9',
               type = 'UV',
               particles = [ P.P__tilde__ST__tilde__, P.P__tilde__ST ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.SS7, L.SS8 ],
               loop_particles = [ [ [P.P__tilde__chi, P.t] ] ],
               couplings = {(0,0,0):C.UVGC_11_2,(0,1,0):C.UVGC_8_10})

V_10 = CTVertex(name = 'V_10',
                type = 'UV',
                particles = [ P.P__tilde__chi, P.P__tilde__chi ],
                color = [ '1' ],
                lorentz = [ L.FF10, L.FF11 ],
                loop_particles = [ [ [P.P__tilde__ST, P.t] ] ],
                couplings = {(0,1,0):C.UVGC_14_6,(0,0,0):C.UVGC_13_5})

