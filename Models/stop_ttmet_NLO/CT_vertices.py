# This file was automatically created by FeynRules 2.1.78
# Mathematica version: 9.0 for Mac OS X x86 (64-bit) (January 24, 2013)
# Date: Wed 15 Oct 2014 17:50:53


from object_library import all_vertices, all_CTvertices, Vertex, CTVertex
import particles as P
import CT_couplings as C
import lorentz as L


V_1 = CTVertex(name = 'V_1',
               type = 'R2',
               particles = [ P.g, P.g, P.g ],
               color = [ 'f(1,2,3)' ],
               lorentz = [ L.VVV2 ],
               loop_particles = [ [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.g] ] ],
               couplings = {(0,0,0):C.R2GC_150_29,(0,0,1):C.R2GC_150_30})

V_2 = CTVertex(name = 'V_2',
               type = 'R2',
               particles = [ P.g, P.g, P.g, P.g ],
               color = [ 'd(-1,1,3)*d(-1,2,4)', 'd(-1,1,3)*f(-1,2,4)', 'd(-1,1,4)*d(-1,2,3)', 'd(-1,1,4)*f(-1,2,3)', 'd(-1,2,3)*f(-1,1,4)', 'd(-1,2,4)*f(-1,1,3)', 'f(-1,1,2)*f(-1,3,4)', 'f(-1,1,3)*f(-1,2,4)', 'f(-1,1,4)*f(-1,2,3)', 'Identity(1,2)*Identity(3,4)', 'Identity(1,3)*Identity(2,4)', 'Identity(1,4)*Identity(2,3)' ],
               lorentz = [ L.VVVV2, L.VVVV3, L.VVVV4 ],
               loop_particles = [ [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.g] ] ],
               couplings = {(2,0,0):C.R2GC_110_5,(2,0,1):C.R2GC_110_6,(0,0,0):C.R2GC_110_5,(0,0,1):C.R2GC_110_6,(4,0,0):C.R2GC_108_1,(4,0,1):C.R2GC_108_2,(3,0,0):C.R2GC_108_1,(3,0,1):C.R2GC_108_2,(8,0,0):C.R2GC_109_3,(8,0,1):C.R2GC_109_4,(7,0,0):C.R2GC_114_11,(7,0,1):C.R2GC_154_35,(6,0,0):C.R2GC_113_10,(6,0,1):C.R2GC_155_36,(5,0,0):C.R2GC_108_1,(5,0,1):C.R2GC_108_2,(1,0,0):C.R2GC_108_1,(1,0,1):C.R2GC_108_2,(11,0,0):C.R2GC_112_8,(11,0,1):C.R2GC_112_9,(10,0,0):C.R2GC_112_8,(10,0,1):C.R2GC_112_9,(9,0,1):C.R2GC_111_7,(2,1,0):C.R2GC_110_5,(2,1,1):C.R2GC_110_6,(0,1,0):C.R2GC_110_5,(0,1,1):C.R2GC_110_6,(6,1,0):C.R2GC_152_33,(6,1,1):C.R2GC_152_34,(4,1,0):C.R2GC_108_1,(4,1,1):C.R2GC_108_2,(3,1,0):C.R2GC_108_1,(3,1,1):C.R2GC_108_2,(8,1,0):C.R2GC_109_3,(8,1,1):C.R2GC_154_35,(7,1,0):C.R2GC_114_11,(7,1,1):C.R2GC_109_4,(5,1,0):C.R2GC_108_1,(5,1,1):C.R2GC_108_2,(1,1,0):C.R2GC_108_1,(1,1,1):C.R2GC_108_2,(11,1,0):C.R2GC_112_8,(11,1,1):C.R2GC_112_9,(10,1,0):C.R2GC_112_8,(10,1,1):C.R2GC_112_9,(9,1,1):C.R2GC_111_7,(2,2,0):C.R2GC_110_5,(2,2,1):C.R2GC_110_6,(0,2,0):C.R2GC_110_5,(0,2,1):C.R2GC_110_6,(4,2,0):C.R2GC_108_1,(4,2,1):C.R2GC_108_2,(3,2,0):C.R2GC_108_1,(3,2,1):C.R2GC_108_2,(8,2,0):C.R2GC_109_3,(8,2,1):C.R2GC_151_32,(6,2,0):C.R2GC_113_10,(7,2,0):C.R2GC_151_31,(7,2,1):C.R2GC_151_32,(5,2,0):C.R2GC_108_1,(5,2,1):C.R2GC_108_2,(1,2,0):C.R2GC_108_1,(1,2,1):C.R2GC_108_2,(11,2,0):C.R2GC_112_8,(11,2,1):C.R2GC_112_9,(10,2,0):C.R2GC_112_8,(10,2,1):C.R2GC_112_9,(9,2,1):C.R2GC_111_7})

V_3 = CTVertex(name = 'V_3',
               type = 'R2',
               particles = [ P.t__tilde__, P.b, P.G__plus__ ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFS3, L.FFS4 ],
               loop_particles = [ [ [P.b, P.g, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_166_42,(0,1,0):C.R2GC_168_44})

V_4 = CTVertex(name = 'V_4',
               type = 'R2',
               particles = [ P.b__tilde__, P.b, P.G0 ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFS1 ],
               loop_particles = [ [ [P.b, P.g] ] ],
               couplings = {(0,0,0):C.R2GC_148_28})

V_5 = CTVertex(name = 'V_5',
               type = 'R2',
               particles = [ P.b__tilde__, P.b, P.H ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFS2 ],
               loop_particles = [ [ [P.b, P.g] ] ],
               couplings = {(0,0,0):C.R2GC_147_27})

V_6 = CTVertex(name = 'V_6',
               type = 'R2',
               particles = [ P.t__tilde__, P.t, P.G0 ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFS1 ],
               loop_particles = [ [ [P.g, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_170_46})

V_7 = CTVertex(name = 'V_7',
               type = 'R2',
               particles = [ P.t__tilde__, P.t, P.H ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFS2 ],
               loop_particles = [ [ [P.g, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_171_47})

V_8 = CTVertex(name = 'V_8',
               type = 'R2',
               particles = [ P.b__tilde__, P.t, P.G__minus__ ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFS3, L.FFS4 ],
               loop_particles = [ [ [P.b, P.g, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_169_45,(0,1,0):C.R2GC_165_41})

V_9 = CTVertex(name = 'V_9',
               type = 'R2',
               particles = [ P.chi, P.t, P.sig3__tilde__ ],
               color = [ 'Identity(2,3)' ],
               lorentz = [ L.FFS3, L.FFS4 ],
               loop_particles = [ [ [P.g, P.sig3, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_160_37,(0,1,0):C.R2GC_161_38})

V_10 = CTVertex(name = 'V_10',
                type = 'R2',
                particles = [ P.t__tilde__, P.chi, P.sig3 ],
                color = [ 'Identity(1,3)' ],
                lorentz = [ L.FFS3, L.FFS4 ],
                loop_particles = [ [ [P.g, P.sig3, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_161_38,(0,1,0):C.R2GC_160_37})

V_11 = CTVertex(name = 'V_11',
                type = 'R2',
                particles = [ P.g, P.sig3__tilde__, P.sig3 ],
                color = [ 'T(1,3,2)' ],
                lorentz = [ L.VSS1, L.VSS3 ],
                loop_particles = [ [ [P.g, P.sig3] ] ],
                couplings = {(0,0,0):C.R2GC_127_19,(0,1,0):C.R2GC_126_18})

V_12 = CTVertex(name = 'V_12',
                type = 'R2',
                particles = [ P.g, P.g, P.sig3__tilde__, P.sig3 ],
                color = [ 'Identity(1,2)*Identity(3,4)', 'T(1,-1,3)*T(2,4,-1)', 'T(1,4,-1)*T(2,-1,3)' ],
                lorentz = [ L.VVSS1 ],
                loop_particles = [ [ [P.g] ], [ [P.g, P.sig3] ] ],
                couplings = {(2,0,0):C.R2GC_128_20,(2,0,1):C.R2GC_128_21,(1,0,0):C.R2GC_128_20,(1,0,1):C.R2GC_128_21,(0,0,0):C.R2GC_112_9,(0,0,1):C.R2GC_124_16})

V_13 = CTVertex(name = 'V_13',
                type = 'R2',
                particles = [ P.u__tilde__, P.u, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_118_15})

V_14 = CTVertex(name = 'V_14',
                type = 'R2',
                particles = [ P.c__tilde__, P.c, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_118_15})

V_15 = CTVertex(name = 'V_15',
                type = 'R2',
                particles = [ P.t__tilde__, P.t, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_118_15})

V_16 = CTVertex(name = 'V_16',
                type = 'R2',
                particles = [ P.u__tilde__, P.u, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_116_13})

V_17 = CTVertex(name = 'V_17',
                type = 'R2',
                particles = [ P.c__tilde__, P.c, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_116_13})

V_18 = CTVertex(name = 'V_18',
                type = 'R2',
                particles = [ P.t__tilde__, P.t, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_116_13})

V_19 = CTVertex(name = 'V_19',
                type = 'R2',
                particles = [ P.d__tilde__, P.u, P.W__minus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.d, P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_138_22})

V_20 = CTVertex(name = 'V_20',
                type = 'R2',
                particles = [ P.s__tilde__, P.c, P.W__minus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.c, P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_138_22})

V_21 = CTVertex(name = 'V_21',
                type = 'R2',
                particles = [ P.b__tilde__, P.t, P.W__minus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.b, P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_138_22})

V_22 = CTVertex(name = 'V_22',
                type = 'R2',
                particles = [ P.u__tilde__, P.u, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_163_39,(0,1,0):C.R2GC_164_40})

V_23 = CTVertex(name = 'V_23',
                type = 'R2',
                particles = [ P.c__tilde__, P.c, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_163_39,(0,1,0):C.R2GC_164_40})

V_24 = CTVertex(name = 'V_24',
                type = 'R2',
                particles = [ P.t__tilde__, P.t, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_163_39,(0,1,0):C.R2GC_164_40})

V_25 = CTVertex(name = 'V_25',
                type = 'R2',
                particles = [ P.d__tilde__, P.d, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_115_12})

V_26 = CTVertex(name = 'V_26',
                type = 'R2',
                particles = [ P.s__tilde__, P.s, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_115_12})

V_27 = CTVertex(name = 'V_27',
                type = 'R2',
                particles = [ P.b__tilde__, P.b, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_115_12})

V_28 = CTVertex(name = 'V_28',
                type = 'R2',
                particles = [ P.d__tilde__, P.d, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_116_13})

V_29 = CTVertex(name = 'V_29',
                type = 'R2',
                particles = [ P.s__tilde__, P.s, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_116_13})

V_30 = CTVertex(name = 'V_30',
                type = 'R2',
                particles = [ P.b__tilde__, P.b, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_116_13})

V_31 = CTVertex(name = 'V_31',
                type = 'R2',
                particles = [ P.u__tilde__, P.d, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.d, P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_138_22})

V_32 = CTVertex(name = 'V_32',
                type = 'R2',
                particles = [ P.c__tilde__, P.s, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.c, P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_138_22})

V_33 = CTVertex(name = 'V_33',
                type = 'R2',
                particles = [ P.t__tilde__, P.b, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.b, P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_138_22})

V_34 = CTVertex(name = 'V_34',
                type = 'R2',
                particles = [ P.d__tilde__, P.d, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_145_25,(0,1,0):C.R2GC_146_26})

V_35 = CTVertex(name = 'V_35',
                type = 'R2',
                particles = [ P.s__tilde__, P.s, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_145_25,(0,1,0):C.R2GC_146_26})

V_36 = CTVertex(name = 'V_36',
                type = 'R2',
                particles = [ P.b__tilde__, P.b, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_145_25,(0,1,0):C.R2GC_146_26})

V_37 = CTVertex(name = 'V_37',
                type = 'R2',
                particles = [ P.u__tilde__, P.u ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_117_14})

V_38 = CTVertex(name = 'V_38',
                type = 'R2',
                particles = [ P.c__tilde__, P.c ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_117_14})

V_39 = CTVertex(name = 'V_39',
                type = 'R2',
                particles = [ P.t__tilde__, P.t ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3, L.FF4, L.FF6 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_167_43,(0,2,0):C.R2GC_167_43,(0,1,0):C.R2GC_117_14,(0,3,0):C.R2GC_117_14})

V_40 = CTVertex(name = 'V_40',
                type = 'R2',
                particles = [ P.d__tilde__, P.d ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_117_14})

V_41 = CTVertex(name = 'V_41',
                type = 'R2',
                particles = [ P.s__tilde__, P.s ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_117_14})

V_42 = CTVertex(name = 'V_42',
                type = 'R2',
                particles = [ P.b__tilde__, P.b ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF5, L.FF7 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_144_24,(0,1,0):C.R2GC_117_14})

V_43 = CTVertex(name = 'V_43',
                type = 'R2',
                particles = [ P.sig3__tilde__, P.sig3 ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.SS1, L.SS2 ],
                loop_particles = [ [ [P.g, P.sig3] ] ],
                couplings = {(0,0,0):C.R2GC_140_23,(0,1,0):C.R2GC_125_17})

V_44 = CTVertex(name = 'V_44',
                type = 'R2',
                particles = [ P.g, P.g ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VV2, L.VV3, L.VV4 ],
                loop_particles = [ [ [P.b] ], [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.g] ], [ [P.t] ] ],
                couplings = {(0,2,2):C.R2GC_75_48,(0,0,0):C.R2GC_82_49,(0,0,3):C.R2GC_82_50,(0,1,1):C.R2GC_85_55})

V_45 = CTVertex(name = 'V_45',
                type = 'R2',
                particles = [ P.g, P.g, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VVV1 ],
                loop_particles = [ [ [P.b], [P.d], [P.s] ], [ [P.c], [P.t], [P.u] ] ],
                couplings = {(0,0,0):C.R2GC_88_60,(0,0,1):C.R2GC_88_61})

V_46 = CTVertex(name = 'V_46',
                type = 'R2',
                particles = [ P.g, P.g, P.H ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VVS1 ],
                loop_particles = [ [ [P.b] ], [ [P.t] ] ],
                couplings = {(0,0,0):C.R2GC_83_51,(0,0,1):C.R2GC_83_52})

V_47 = CTVertex(name = 'V_47',
                type = 'R2',
                particles = [ P.g, P.g, P.W__minus__, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VVVV7 ],
                loop_particles = [ [ [P.b, P.t], [P.c, P.s], [P.d, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_97_71})

V_48 = CTVertex(name = 'V_48',
                type = 'R2',
                particles = [ P.a, P.a, P.g, P.g ],
                color = [ 'Identity(3,4)' ],
                lorentz = [ L.VVVV7 ],
                loop_particles = [ [ [P.b], [P.d], [P.s] ], [ [P.c], [P.t], [P.u] ] ],
                couplings = {(0,0,0):C.R2GC_86_56,(0,0,1):C.R2GC_86_57})

V_49 = CTVertex(name = 'V_49',
                type = 'R2',
                particles = [ P.a, P.g, P.g, P.Z ],
                color = [ 'Identity(2,3)' ],
                lorentz = [ L.VVVV7 ],
                loop_particles = [ [ [P.b], [P.d], [P.s] ], [ [P.c], [P.t], [P.u] ] ],
                couplings = {(0,0,0):C.R2GC_89_62,(0,0,1):C.R2GC_89_63})

V_50 = CTVertex(name = 'V_50',
                type = 'R2',
                particles = [ P.g, P.g, P.Z, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VVVV7 ],
                loop_particles = [ [ [P.b], [P.d], [P.s] ], [ [P.c], [P.t], [P.u] ] ],
                couplings = {(0,0,0):C.R2GC_92_68,(0,0,1):C.R2GC_92_69})

V_51 = CTVertex(name = 'V_51',
                type = 'R2',
                particles = [ P.a, P.g, P.g, P.g ],
                color = [ 'd(2,3,4)' ],
                lorentz = [ L.VVVV7 ],
                loop_particles = [ [ [P.b], [P.d], [P.s] ], [ [P.c], [P.t], [P.u] ] ],
                couplings = {(0,0,0):C.R2GC_87_58,(0,0,1):C.R2GC_87_59})

V_52 = CTVertex(name = 'V_52',
                type = 'R2',
                particles = [ P.g, P.g, P.g, P.Z ],
                color = [ 'd(1,2,3)', 'f(1,2,3)' ],
                lorentz = [ L.VVVV1, L.VVVV7 ],
                loop_particles = [ [ [P.b], [P.d], [P.s] ], [ [P.c], [P.t], [P.u] ] ],
                couplings = {(1,0,0):C.R2GC_91_66,(1,0,1):C.R2GC_91_67,(0,1,0):C.R2GC_90_64,(0,1,1):C.R2GC_90_65})

V_53 = CTVertex(name = 'V_53',
                type = 'R2',
                particles = [ P.g, P.g, P.H, P.H ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VVSS1 ],
                loop_particles = [ [ [P.b] ], [ [P.t] ] ],
                couplings = {(0,0,0):C.R2GC_84_53,(0,0,1):C.R2GC_84_54})

V_54 = CTVertex(name = 'V_54',
                type = 'R2',
                particles = [ P.g, P.g, P.G0, P.G0 ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VVSS1 ],
                loop_particles = [ [ [P.b] ], [ [P.t] ] ],
                couplings = {(0,0,0):C.R2GC_84_53,(0,0,1):C.R2GC_84_54})

V_55 = CTVertex(name = 'V_55',
                type = 'R2',
                particles = [ P.g, P.g, P.G__minus__, P.G__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VVSS1 ],
                loop_particles = [ [ [P.b, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_96_70})

V_56 = CTVertex(name = 'V_56',
                type = 'UV',
                particles = [ P.g, P.g, P.g ],
                color = [ 'f(1,2,3)' ],
                lorentz = [ L.VVV2 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.sig3] ], [ [P.t] ] ],
                couplings = {(0,0,0):C.UVGC_150_57,(0,0,1):C.UVGC_150_58,(0,0,2):C.UVGC_150_59,(0,0,3):C.UVGC_150_60,(0,0,4):C.UVGC_150_61,(0,0,5):C.UVGC_150_62})

V_57 = CTVertex(name = 'V_57',
                type = 'UV',
                particles = [ P.g, P.g, P.g, P.g ],
                color = [ 'd(-1,1,3)*d(-1,2,4)', 'd(-1,1,3)*f(-1,2,4)', 'd(-1,1,4)*d(-1,2,3)', 'd(-1,1,4)*f(-1,2,3)', 'd(-1,2,3)*f(-1,1,4)', 'd(-1,2,4)*f(-1,1,3)', 'f(-1,1,2)*f(-1,3,4)', 'f(-1,1,3)*f(-1,2,4)', 'f(-1,1,4)*f(-1,2,3)', 'Identity(1,2)*Identity(3,4)', 'Identity(1,3)*Identity(2,4)', 'Identity(1,4)*Identity(2,3)' ],
                lorentz = [ L.VVVV2, L.VVVV3, L.VVVV4 ],
                loop_particles = [ [ [P.b] ], [ [P.b], [P.c], [P.d], [P.s], [P.sig3], [P.t], [P.u] ], [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.sig3] ], [ [P.t] ] ],
                couplings = {(2,0,4):C.UVGC_109_9,(2,0,5):C.UVGC_109_8,(0,0,4):C.UVGC_109_9,(0,0,5):C.UVGC_109_8,(4,0,4):C.UVGC_108_6,(4,0,5):C.UVGC_108_7,(3,0,4):C.UVGC_108_6,(3,0,5):C.UVGC_108_7,(8,0,4):C.UVGC_109_8,(8,0,5):C.UVGC_109_9,(7,0,0):C.UVGC_154_76,(7,0,3):C.UVGC_128_38,(7,0,4):C.UVGC_154_77,(7,0,5):C.UVGC_154_78,(7,0,6):C.UVGC_154_79,(7,0,7):C.UVGC_154_80,(6,0,0):C.UVGC_154_76,(6,0,3):C.UVGC_128_38,(6,0,4):C.UVGC_155_81,(6,0,5):C.UVGC_155_82,(6,0,6):C.UVGC_154_79,(6,0,7):C.UVGC_154_80,(5,0,4):C.UVGC_108_6,(5,0,5):C.UVGC_108_7,(1,0,4):C.UVGC_108_6,(1,0,5):C.UVGC_108_7,(11,0,4):C.UVGC_112_12,(11,0,5):C.UVGC_112_13,(10,0,4):C.UVGC_112_12,(10,0,5):C.UVGC_112_13,(9,0,4):C.UVGC_111_10,(9,0,5):C.UVGC_111_11,(2,1,4):C.UVGC_109_9,(2,1,5):C.UVGC_109_8,(0,1,4):C.UVGC_109_9,(0,1,5):C.UVGC_109_8,(6,1,0):C.UVGC_151_63,(6,1,4):C.UVGC_152_68,(6,1,5):C.UVGC_152_69,(6,1,6):C.UVGC_152_70,(6,1,7):C.UVGC_151_67,(4,1,4):C.UVGC_108_6,(4,1,5):C.UVGC_108_7,(3,1,4):C.UVGC_108_6,(3,1,5):C.UVGC_108_7,(8,1,0):C.UVGC_156_83,(8,1,3):C.UVGC_156_84,(8,1,4):C.UVGC_154_77,(8,1,5):C.UVGC_156_85,(8,1,6):C.UVGC_156_86,(8,1,7):C.UVGC_156_87,(7,1,1):C.UVGC_113_14,(7,1,4):C.UVGC_109_8,(7,1,5):C.UVGC_114_16,(5,1,4):C.UVGC_108_6,(5,1,5):C.UVGC_108_7,(1,1,4):C.UVGC_108_6,(1,1,5):C.UVGC_108_7,(11,1,4):C.UVGC_112_12,(11,1,5):C.UVGC_112_13,(10,1,4):C.UVGC_112_12,(10,1,5):C.UVGC_112_13,(9,1,4):C.UVGC_111_10,(9,1,5):C.UVGC_111_11,(2,2,4):C.UVGC_109_9,(2,2,5):C.UVGC_109_8,(0,2,4):C.UVGC_109_9,(0,2,5):C.UVGC_109_8,(4,2,4):C.UVGC_108_6,(4,2,5):C.UVGC_108_7,(3,2,4):C.UVGC_108_6,(3,2,5):C.UVGC_108_7,(8,2,0):C.UVGC_153_71,(8,2,3):C.UVGC_153_72,(8,2,4):C.UVGC_151_64,(8,2,5):C.UVGC_153_73,(8,2,6):C.UVGC_153_74,(8,2,7):C.UVGC_153_75,(6,2,2):C.UVGC_113_14,(6,2,5):C.UVGC_111_10,(6,2,6):C.UVGC_113_15,(7,2,0):C.UVGC_151_63,(7,2,4):C.UVGC_151_64,(7,2,5):C.UVGC_151_65,(7,2,6):C.UVGC_151_66,(7,2,7):C.UVGC_151_67,(5,2,4):C.UVGC_108_6,(5,2,5):C.UVGC_108_7,(1,2,4):C.UVGC_108_6,(1,2,5):C.UVGC_108_7,(11,2,4):C.UVGC_112_12,(11,2,5):C.UVGC_112_13,(10,2,4):C.UVGC_112_12,(10,2,5):C.UVGC_112_13,(9,2,4):C.UVGC_111_10,(9,2,5):C.UVGC_111_11})

V_58 = CTVertex(name = 'V_58',
                type = 'UV',
                particles = [ P.t__tilde__, P.b, P.G__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFS3, L.FFS4 ],
                loop_particles = [ [ [P.b, P.g] ], [ [P.b, P.g, P.t] ], [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_166_104,(0,0,2):C.UVGC_166_105,(0,0,1):C.UVGC_166_106,(0,1,0):C.UVGC_168_108,(0,1,2):C.UVGC_168_109,(0,1,1):C.UVGC_168_110})

V_59 = CTVertex(name = 'V_59',
                type = 'UV',
                particles = [ P.b__tilde__, P.b, P.G0 ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFS1 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_148_53})

V_60 = CTVertex(name = 'V_60',
                type = 'UV',
                particles = [ P.b__tilde__, P.b, P.H ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFS2 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_147_52})

V_61 = CTVertex(name = 'V_61',
                type = 'UV',
                particles = [ P.t__tilde__, P.t, P.G0 ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFS1 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_170_114})

V_62 = CTVertex(name = 'V_62',
                type = 'UV',
                particles = [ P.t__tilde__, P.t, P.H ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFS2 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_171_115})

V_63 = CTVertex(name = 'V_63',
                type = 'UV',
                particles = [ P.b__tilde__, P.t, P.G__minus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFS3, L.FFS4 ],
                loop_particles = [ [ [P.b, P.g] ], [ [P.b, P.g, P.t] ], [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_169_111,(0,0,2):C.UVGC_169_112,(0,0,1):C.UVGC_169_113,(0,1,0):C.UVGC_165_101,(0,1,2):C.UVGC_165_102,(0,1,1):C.UVGC_165_103})

V_64 = CTVertex(name = 'V_64',
                type = 'UV',
                particles = [ P.chi, P.t, P.sig3__tilde__ ],
                color = [ 'Identity(2,3)' ],
                lorentz = [ L.FFS3, L.FFS4 ],
                loop_particles = [ [ [P.g, P.sig3] ], [ [P.g, P.sig3, P.t] ], [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_160_91,(0,0,2):C.UVGC_160_92,(0,0,1):C.UVGC_160_93,(0,1,0):C.UVGC_161_94,(0,1,2):C.UVGC_161_95,(0,1,1):C.UVGC_161_96})

V_65 = CTVertex(name = 'V_65',
                type = 'UV',
                particles = [ P.t__tilde__, P.chi, P.sig3 ],
                color = [ 'Identity(1,3)' ],
                lorentz = [ L.FFS3, L.FFS4 ],
                loop_particles = [ [ [P.g, P.sig3] ], [ [P.g, P.sig3, P.t] ], [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_161_94,(0,0,2):C.UVGC_161_95,(0,0,1):C.UVGC_161_96,(0,1,0):C.UVGC_160_91,(0,1,2):C.UVGC_160_92,(0,1,1):C.UVGC_160_93})

V_66 = CTVertex(name = 'V_66',
                type = 'UV',
                particles = [ P.g, P.sig3__tilde__, P.sig3 ],
                color = [ 'T(1,3,2)' ],
                lorentz = [ L.VSS1, L.VSS3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.sig3] ], [ [P.sig3] ] ],
                couplings = {(0,0,0):C.UVGC_127_31,(0,0,1):C.UVGC_127_32,(0,0,2):C.UVGC_127_33,(0,0,3):C.UVGC_127_34,(0,0,5):C.UVGC_127_35,(0,0,4):C.UVGC_127_36,(0,1,0):C.UVGC_119_21,(0,1,1):C.UVGC_119_22,(0,1,2):C.UVGC_119_23,(0,1,3):C.UVGC_119_24,(0,1,5):C.UVGC_119_25,(0,1,4):C.UVGC_126_30})

V_67 = CTVertex(name = 'V_67',
                type = 'UV',
                particles = [ P.g, P.g, P.sig3__tilde__, P.sig3 ],
                color = [ 'Identity(1,2)*Identity(3,4)', 'T(1,-1,3)*T(2,4,-1)', 'T(1,4,-1)*T(2,-1,3)' ],
                lorentz = [ L.VVSS1 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.sig3] ], [ [P.sig3] ] ],
                couplings = {(2,0,0):C.UVGC_128_37,(2,0,1):C.UVGC_128_38,(2,0,2):C.UVGC_128_39,(2,0,3):C.UVGC_128_40,(2,0,5):C.UVGC_128_41,(2,0,4):C.UVGC_128_42,(1,0,0):C.UVGC_128_37,(1,0,1):C.UVGC_128_38,(1,0,2):C.UVGC_128_39,(1,0,3):C.UVGC_128_40,(1,0,5):C.UVGC_128_41,(1,0,4):C.UVGC_128_42,(0,0,2):C.UVGC_124_27,(0,0,4):C.UVGC_124_28})

V_68 = CTVertex(name = 'V_68',
                type = 'UV',
                particles = [ P.u__tilde__, P.u, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.UVGC_118_20,(0,1,0):C.UVGC_100_1,(0,2,0):C.UVGC_100_1})

V_69 = CTVertex(name = 'V_69',
                type = 'UV',
                particles = [ P.c__tilde__, P.c, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_118_20,(0,1,0):C.UVGC_100_1,(0,2,0):C.UVGC_100_1})

V_70 = CTVertex(name = 'V_70',
                type = 'UV',
                particles = [ P.t__tilde__, P.t, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_118_20,(0,1,0):C.UVGC_158_89,(0,2,0):C.UVGC_158_89})

V_71 = CTVertex(name = 'V_71',
                type = 'UV',
                particles = [ P.u__tilde__, P.u, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.u] ], [ [P.sig3] ] ],
                couplings = {(0,0,4):C.UVGC_116_18,(0,1,0):C.UVGC_119_21,(0,1,1):C.UVGC_119_22,(0,1,2):C.UVGC_119_23,(0,1,3):C.UVGC_119_24,(0,1,5):C.UVGC_119_25,(0,1,4):C.UVGC_119_26,(0,2,0):C.UVGC_119_21,(0,2,1):C.UVGC_119_22,(0,2,2):C.UVGC_119_23,(0,2,3):C.UVGC_119_24,(0,2,5):C.UVGC_119_25,(0,2,4):C.UVGC_119_26})

V_72 = CTVertex(name = 'V_72',
                type = 'UV',
                particles = [ P.c__tilde__, P.c, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.c, P.g] ], [ [P.g] ], [ [P.ghG] ], [ [P.sig3] ] ],
                couplings = {(0,0,2):C.UVGC_116_18,(0,1,0):C.UVGC_119_21,(0,1,1):C.UVGC_119_22,(0,1,3):C.UVGC_119_23,(0,1,4):C.UVGC_119_24,(0,1,5):C.UVGC_119_25,(0,1,2):C.UVGC_119_26,(0,2,0):C.UVGC_119_21,(0,2,1):C.UVGC_119_22,(0,2,3):C.UVGC_119_23,(0,2,4):C.UVGC_119_24,(0,2,5):C.UVGC_119_25,(0,2,2):C.UVGC_119_26})

V_73 = CTVertex(name = 'V_73',
                type = 'UV',
                particles = [ P.t__tilde__, P.t, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.t] ], [ [P.sig3] ] ],
                couplings = {(0,0,4):C.UVGC_116_18,(0,1,0):C.UVGC_119_21,(0,1,1):C.UVGC_119_22,(0,1,2):C.UVGC_119_23,(0,1,3):C.UVGC_119_24,(0,1,5):C.UVGC_119_25,(0,1,4):C.UVGC_159_90,(0,2,0):C.UVGC_119_21,(0,2,1):C.UVGC_119_22,(0,2,2):C.UVGC_119_23,(0,2,3):C.UVGC_119_24,(0,2,5):C.UVGC_119_25,(0,2,4):C.UVGC_159_90})

V_74 = CTVertex(name = 'V_74',
                type = 'UV',
                particles = [ P.d__tilde__, P.u, P.W__minus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.d, P.g], [P.g, P.u] ], [ [P.d, P.g, P.u] ] ],
                couplings = {(0,0,0):C.UVGC_138_43,(0,0,1):C.UVGC_138_44})

V_75 = CTVertex(name = 'V_75',
                type = 'UV',
                particles = [ P.s__tilde__, P.c, P.W__minus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.c, P.g], [P.g, P.s] ], [ [P.c, P.g, P.s] ] ],
                couplings = {(0,0,0):C.UVGC_138_43,(0,0,1):C.UVGC_138_44})

V_76 = CTVertex(name = 'V_76',
                type = 'UV',
                particles = [ P.b__tilde__, P.t, P.W__minus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.b, P.g] ], [ [P.b, P.g, P.t] ], [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_162_97,(0,0,2):C.UVGC_162_98,(0,0,1):C.UVGC_138_44})

V_77 = CTVertex(name = 'V_77',
                type = 'UV',
                particles = [ P.t__tilde__, P.t, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_163_99,(0,1,0):C.UVGC_164_100})

V_78 = CTVertex(name = 'V_78',
                type = 'UV',
                particles = [ P.d__tilde__, P.d, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_115_17,(0,1,0):C.UVGC_102_3,(0,2,0):C.UVGC_102_3})

V_79 = CTVertex(name = 'V_79',
                type = 'UV',
                particles = [ P.s__tilde__, P.s, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.UVGC_115_17,(0,1,0):C.UVGC_102_3,(0,2,0):C.UVGC_102_3})

V_80 = CTVertex(name = 'V_80',
                type = 'UV',
                particles = [ P.b__tilde__, P.b, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_115_17,(0,1,0):C.UVGC_142_47,(0,2,0):C.UVGC_142_47})

V_81 = CTVertex(name = 'V_81',
                type = 'UV',
                particles = [ P.d__tilde__, P.d, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.d, P.g] ], [ [P.g] ], [ [P.ghG] ], [ [P.sig3] ] ],
                couplings = {(0,0,2):C.UVGC_116_18,(0,1,0):C.UVGC_119_21,(0,1,1):C.UVGC_119_22,(0,1,3):C.UVGC_119_23,(0,1,4):C.UVGC_119_24,(0,1,5):C.UVGC_119_25,(0,1,2):C.UVGC_119_26,(0,2,0):C.UVGC_119_21,(0,2,1):C.UVGC_119_22,(0,2,3):C.UVGC_119_23,(0,2,4):C.UVGC_119_24,(0,2,5):C.UVGC_119_25,(0,2,2):C.UVGC_119_26})

V_82 = CTVertex(name = 'V_82',
                type = 'UV',
                particles = [ P.s__tilde__, P.s, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.s] ], [ [P.sig3] ] ],
                couplings = {(0,0,4):C.UVGC_116_18,(0,1,0):C.UVGC_119_21,(0,1,1):C.UVGC_119_22,(0,1,2):C.UVGC_119_23,(0,1,3):C.UVGC_119_24,(0,1,5):C.UVGC_119_25,(0,1,4):C.UVGC_119_26,(0,2,0):C.UVGC_119_21,(0,2,1):C.UVGC_119_22,(0,2,2):C.UVGC_119_23,(0,2,3):C.UVGC_119_24,(0,2,5):C.UVGC_119_25,(0,2,4):C.UVGC_119_26})

V_83 = CTVertex(name = 'V_83',
                type = 'UV',
                particles = [ P.b__tilde__, P.b, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.b, P.g] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.sig3] ] ],
                couplings = {(0,0,1):C.UVGC_116_18,(0,1,0):C.UVGC_119_21,(0,1,2):C.UVGC_119_22,(0,1,3):C.UVGC_119_23,(0,1,4):C.UVGC_119_24,(0,1,5):C.UVGC_119_25,(0,1,1):C.UVGC_143_48,(0,2,0):C.UVGC_119_21,(0,2,2):C.UVGC_119_22,(0,2,3):C.UVGC_119_23,(0,2,4):C.UVGC_119_24,(0,2,5):C.UVGC_119_25,(0,2,1):C.UVGC_143_48})

V_84 = CTVertex(name = 'V_84',
                type = 'UV',
                particles = [ P.u__tilde__, P.d, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.d, P.g], [P.g, P.u] ], [ [P.d, P.g, P.u] ] ],
                couplings = {(0,0,0):C.UVGC_138_43,(0,0,1):C.UVGC_138_44})

V_85 = CTVertex(name = 'V_85',
                type = 'UV',
                particles = [ P.c__tilde__, P.s, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.c, P.g], [P.g, P.s] ], [ [P.c, P.g, P.s] ] ],
                couplings = {(0,0,0):C.UVGC_138_43,(0,0,1):C.UVGC_138_44})

V_86 = CTVertex(name = 'V_86',
                type = 'UV',
                particles = [ P.t__tilde__, P.b, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.b, P.g] ], [ [P.b, P.g, P.t] ], [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_162_97,(0,0,2):C.UVGC_162_98,(0,0,1):C.UVGC_138_44})

V_87 = CTVertex(name = 'V_87',
                type = 'UV',
                particles = [ P.b__tilde__, P.b, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_145_50,(0,1,0):C.UVGC_146_51})

V_88 = CTVertex(name = 'V_88',
                type = 'UV',
                particles = [ P.u__tilde__, P.u ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF3, L.FF6 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.UVGC_117_19,(0,1,0):C.UVGC_101_2,(0,2,0):C.UVGC_101_2})

V_89 = CTVertex(name = 'V_89',
                type = 'UV',
                particles = [ P.c__tilde__, P.c ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF3, L.FF6 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_117_19,(0,1,0):C.UVGC_101_2,(0,2,0):C.UVGC_101_2})

V_90 = CTVertex(name = 'V_90',
                type = 'UV',
                particles = [ P.t__tilde__, P.t ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3, L.FF4, L.FF6 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_167_107,(0,2,0):C.UVGC_167_107,(0,1,0):C.UVGC_157_88,(0,3,0):C.UVGC_157_88})

V_91 = CTVertex(name = 'V_91',
                type = 'UV',
                particles = [ P.d__tilde__, P.d ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF8 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_101_2})

V_92 = CTVertex(name = 'V_92',
                type = 'UV',
                particles = [ P.s__tilde__, P.s ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF8 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.UVGC_101_2})

V_93 = CTVertex(name = 'V_93',
                type = 'UV',
                particles = [ P.b__tilde__, P.b ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF5, L.FF7 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_144_49,(0,1,0):C.UVGC_141_46})

V_94 = CTVertex(name = 'V_94',
                type = 'UV',
                particles = [ P.sig3__tilde__, P.sig3 ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.SS1, L.SS2 ],
                loop_particles = [ [ [P.g, P.sig3] ] ],
                couplings = {(0,0,0):C.UVGC_140_45,(0,1,0):C.UVGC_125_29})

V_95 = CTVertex(name = 'V_95',
                type = 'UV',
                particles = [ P.g, P.g ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VV1, L.VV5 ],
                loop_particles = [ [ [P.b] ], [ [P.g] ], [ [P.ghG] ], [ [P.sig3] ], [ [P.t] ] ],
                couplings = {(0,1,0):C.UVGC_149_54,(0,1,3):C.UVGC_149_55,(0,1,4):C.UVGC_149_56,(0,0,1):C.UVGC_107_4,(0,0,2):C.UVGC_107_5})

