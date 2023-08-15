# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 12.1.0 for Linux x86 (64-bit) (March 18, 2020)
# Date: Thu 18 May 2023 16:32:14


from object_library import all_vertices, all_CTvertices, Vertex, CTVertex
import particles as P
import CT_couplings as C
import lorentz as L


V_1 = CTVertex(name = 'V_1',
               type = 'R2',
               particles = [ P.P__tilde__chi, P.t, P.P__tilde__ST__tilde__ ],
               color = [ 'Identity(2,3)' ],
               lorentz = [ L.FFS9 ],
               loop_particles = [ [ [P.g, P.P__tilde__ST, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_80_5})

V_2 = CTVertex(name = 'V_2',
               type = 'R2',
               particles = [ P.t__tilde__, P.P__tilde__chi, P.P__tilde__ST ],
               color = [ 'Identity(1,3)' ],
               lorentz = [ L.FFS11 ],
               loop_particles = [ [ [P.g, P.P__tilde__ST, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_80_5})

V_3 = CTVertex(name = 'V_3',
               type = 'R2',
               particles = [ P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
               color = [ 'T(1,3,2)' ],
               lorentz = [ L.VSS3 ],
               loop_particles = [ [ [P.P__tilde__chi, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_78_3})

V_4 = CTVertex(name = 'V_4',
               type = 'R2',
               particles = [ P.g, P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
               color = [ 'T(1,-1,3)*T(2,4,-1)', 'T(1,4,-1)*T(2,-1,3)' ],
               lorentz = [ L.VVSS3 ],
               loop_particles = [ [ [P.P__tilde__chi, P.t] ] ],
               couplings = {(1,0,0):C.R2GC_70_1,(0,0,0):C.R2GC_70_1})

V_5 = CTVertex(name = 'V_5',
               type = 'R2',
               particles = [ P.P__tilde__ST__tilde__, P.P__tilde__ST ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.SS5, L.SS6 ],
               loop_particles = [ [ [P.P__tilde__chi, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_79_4,(0,1,0):C.R2GC_77_2})

V_6 = CTVertex(name = 'V_6',
               type = 'UV',
               particles = [ P.P__tilde__chi, P.t, P.P__tilde__ST__tilde__ ],
               color = [ 'Identity(2,3)' ],
               lorentz = [ L.FFS9 ],
               loop_particles = [ [ [P.g, P.P__tilde__ST], [P.g, P.P__tilde__ST, P.t] ], [ [P.g, P.t] ], [ [P.P__tilde__chi, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ], [ [P.P__tilde__ST, P.t] ] ],
               couplings = {(0,0,2):C.UVGC_80_10,(0,0,3):C.UVGC_80_11,(0,0,0):C.UVGC_80_12,(0,0,1):C.UVGC_80_13,(0,0,4):C.UVGC_83_16})

V_7 = CTVertex(name = 'V_7',
               type = 'UV',
               particles = [ P.t__tilde__, P.P__tilde__chi, P.P__tilde__ST ],
               color = [ 'Identity(1,3)' ],
               lorentz = [ L.FFS11 ],
               loop_particles = [ [ [P.g, P.P__tilde__ST], [P.g, P.P__tilde__ST, P.t] ], [ [P.g, P.t] ], [ [P.P__tilde__chi, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
               couplings = {(0,0,2):C.UVGC_80_10,(0,0,3):C.UVGC_80_11,(0,0,0):C.UVGC_80_12,(0,0,1):C.UVGC_80_13})

V_8 = CTVertex(name = 'V_8',
               type = 'UV',
               particles = [ P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
               color = [ 'T(1,3,2)' ],
               lorentz = [ L.VSS3 ],
               loop_particles = [ [ [P.P__tilde__chi, P.t] ] ],
               couplings = {(0,0,0):C.UVGC_78_8})

V_9 = CTVertex(name = 'V_9',
               type = 'UV',
               particles = [ P.t__tilde__, P.t, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV16, L.FFV17, L.FFV18, L.FFV19, L.FFV20, L.FFV21 ],
               loop_particles = [ [ [P.P__tilde__chi, P.P__tilde__ST] ] ],
               couplings = {(0,0,0):C.UVGC_75_5,(0,5,0):C.UVGC_71_1,(0,1,0):C.UVGC_76_6,(0,2,0):C.UVGC_72_2,(0,4,0):C.UVGC_74_4,(0,3,0):C.UVGC_73_3})

V_10 = CTVertex(name = 'V_10',
                type = 'UV',
                particles = [ P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.SS5, L.SS6 ],
                loop_particles = [ [ [P.P__tilde__chi, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_79_9,(0,1,0):C.UVGC_77_7})

V_11 = CTVertex(name = 'V_11',
                type = 'UV',
                particles = [ P.P__tilde__chi, P.P__tilde__chi ],
                color = [ '1' ],
                lorentz = [ L.FF7, L.FF8, L.FF9 ],
                loop_particles = [ [ [P.P__tilde__ST, P.t] ] ],
                couplings = {(0,1,0):C.UVGC_82_15,(0,2,0):C.UVGC_82_15,(0,0,0):C.UVGC_81_14})

