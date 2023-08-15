# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 12.1.0 for Linux x86 (64-bit) (March 18, 2020)
# Date: Tue 16 May 2023 14:59:22


from object_library import all_vertices, all_CTvertices, Vertex, CTVertex
import particles as P
import CT_couplings as C
import lorentz as L



V_26 = CTVertex(name = 'V_26',
                type = 'UV',
                particles = [ P.t__tilde__, P.t, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.t] ], [ [P.P__tilde__chi, P.P__tilde__ST] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,1,5):C.UVGC_51_73,(0,2,5):C.UVGC_54_78})


V_39 = CTVertex(name = 'V_39',
                type = 'UV',
                particles = [ P.t__tilde__, P.t ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3, L.FF4, L.FF5 ],
                loop_particles = [ [ [P.g, P.t] ], [ [P.P__tilde__chi, P.P__tilde__ST] ] ],
                couplings = {(0,0,1):C.UVGC_52_75,(0,2,1):C.UVGC_52_75,(0,1,1):C.UVGC_50_71,(0,3,1):C.UVGC_53_77})


