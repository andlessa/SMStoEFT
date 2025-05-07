# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 14.1.0 for Linux x86 (64-bit) (July 16, 2024)
# Date: Wed 7 May 2025 16:50:22


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
               couplings = {(0,0,0):C.R2GC_133_23,(0,0,1):C.R2GC_133_24})

V_2 = CTVertex(name = 'V_2',
               type = 'R2',
               particles = [ P.g, P.g, P.g, P.g ],
               color = [ 'd(-1,1,3)*d(-1,2,4)', 'd(-1,1,3)*f(-1,2,4)', 'd(-1,1,4)*d(-1,2,3)', 'd(-1,1,4)*f(-1,2,3)', 'd(-1,2,3)*f(-1,1,4)', 'd(-1,2,4)*f(-1,1,3)', 'f(-1,1,2)*f(-1,3,4)', 'f(-1,1,3)*f(-1,2,4)', 'f(-1,1,4)*f(-1,2,3)', 'Identity(1,2)*Identity(3,4)', 'Identity(1,3)*Identity(2,4)', 'Identity(1,4)*Identity(2,3)' ],
               lorentz = [ L.VVVV11, L.VVVV2, L.VVVV3, L.VVVV5 ],
               loop_particles = [ [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.g] ] ],
               couplings = {(2,1,0):C.R2GC_109_5,(2,1,1):C.R2GC_109_6,(0,1,0):C.R2GC_109_5,(0,1,1):C.R2GC_109_6,(4,1,0):C.R2GC_107_1,(4,1,1):C.R2GC_107_2,(3,1,0):C.R2GC_107_1,(3,1,1):C.R2GC_107_2,(8,1,0):C.R2GC_108_3,(8,1,1):C.R2GC_108_4,(6,1,0):C.R2GC_112_10,(6,1,1):C.R2GC_143_30,(7,1,0):C.R2GC_113_12,(7,1,1):C.R2GC_142_29,(5,1,0):C.R2GC_107_1,(5,1,1):C.R2GC_107_2,(1,1,0):C.R2GC_107_1,(1,1,1):C.R2GC_107_2,(11,0,0):C.R2GC_111_8,(11,0,1):C.R2GC_111_9,(10,0,0):C.R2GC_111_8,(10,0,1):C.R2GC_111_9,(9,0,1):C.R2GC_110_7,(2,2,0):C.R2GC_109_5,(2,2,1):C.R2GC_109_6,(0,2,0):C.R2GC_109_5,(0,2,1):C.R2GC_109_6,(4,2,0):C.R2GC_107_1,(4,2,1):C.R2GC_107_2,(3,2,0):C.R2GC_107_1,(3,2,1):C.R2GC_107_2,(8,2,0):C.R2GC_108_3,(8,2,1):C.R2GC_144_31,(6,2,0):C.R2GC_139_25,(6,2,1):C.R2GC_139_26,(7,2,0):C.R2GC_113_12,(7,2,1):C.R2GC_113_13,(5,2,0):C.R2GC_107_1,(5,2,1):C.R2GC_107_2,(1,2,0):C.R2GC_107_1,(1,2,1):C.R2GC_107_2,(0,3,0):C.R2GC_109_5,(0,3,1):C.R2GC_109_6,(2,3,0):C.R2GC_109_5,(2,3,1):C.R2GC_109_6,(5,3,0):C.R2GC_107_1,(5,3,1):C.R2GC_107_2,(1,3,0):C.R2GC_107_1,(1,3,1):C.R2GC_107_2,(7,3,0):C.R2GC_140_27,(7,3,1):C.R2GC_109_6,(4,3,0):C.R2GC_107_1,(4,3,1):C.R2GC_107_2,(3,3,0):C.R2GC_107_1,(3,3,1):C.R2GC_107_2,(8,3,0):C.R2GC_108_3,(8,3,1):C.R2GC_141_28,(6,3,0):C.R2GC_112_10,(6,3,1):C.R2GC_112_11})

V_3 = CTVertex(name = 'V_3',
               type = 'R2',
               particles = [ P.b__tilde__, P.b, P.H ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFS1 ],
               loop_particles = [ [ [P.b, P.g] ] ],
               couplings = {(0,0,0):C.R2GC_131_22})

V_4 = CTVertex(name = 'V_4',
               type = 'R2',
               particles = [ P.t__tilde__, P.t, P.H ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFS1 ],
               loop_particles = [ [ [P.g, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_152_35})

V_5 = CTVertex(name = 'V_5',
               type = 'R2',
               particles = [ P.u__tilde__, P.u, P.a ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.g, P.u] ] ],
               couplings = {(0,0,0):C.R2GC_121_16})

V_6 = CTVertex(name = 'V_6',
               type = 'R2',
               particles = [ P.c__tilde__, P.c, P.a ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.c, P.g] ] ],
               couplings = {(0,0,0):C.R2GC_121_16})

V_7 = CTVertex(name = 'V_7',
               type = 'R2',
               particles = [ P.t__tilde__, P.t, P.a ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.g, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_121_16})

V_8 = CTVertex(name = 'V_8',
               type = 'R2',
               particles = [ P.d__tilde__, P.d, P.a ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.d, P.g] ] ],
               couplings = {(0,0,0):C.R2GC_114_14})

V_9 = CTVertex(name = 'V_9',
               type = 'R2',
               particles = [ P.s__tilde__, P.s, P.a ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.g, P.s] ] ],
               couplings = {(0,0,0):C.R2GC_114_14})

V_10 = CTVertex(name = 'V_10',
                type = 'R2',
                particles = [ P.b__tilde__, P.b, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_114_14})

V_11 = CTVertex(name = 'V_11',
                type = 'R2',
                particles = [ P.u__tilde__, P.u, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_115_15})

V_12 = CTVertex(name = 'V_12',
                type = 'R2',
                particles = [ P.c__tilde__, P.c, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_115_15})

V_13 = CTVertex(name = 'V_13',
                type = 'R2',
                particles = [ P.t__tilde__, P.t, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_115_15})

V_14 = CTVertex(name = 'V_14',
                type = 'R2',
                particles = [ P.d__tilde__, P.d, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_115_15})

V_15 = CTVertex(name = 'V_15',
                type = 'R2',
                particles = [ P.s__tilde__, P.s, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_115_15})

V_16 = CTVertex(name = 'V_16',
                type = 'R2',
                particles = [ P.b__tilde__, P.b, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_115_15})

V_17 = CTVertex(name = 'V_17',
                type = 'R2',
                particles = [ P.d__tilde__, P.u, P.W__minus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV3 ],
                loop_particles = [ [ [P.d, P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_124_17})

V_18 = CTVertex(name = 'V_18',
                type = 'R2',
                particles = [ P.s__tilde__, P.c, P.W__minus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV3 ],
                loop_particles = [ [ [P.c, P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_124_17})

V_19 = CTVertex(name = 'V_19',
                type = 'R2',
                particles = [ P.b__tilde__, P.t, P.W__minus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV3 ],
                loop_particles = [ [ [P.b, P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_124_17})

V_20 = CTVertex(name = 'V_20',
                type = 'R2',
                particles = [ P.u__tilde__, P.d, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV3 ],
                loop_particles = [ [ [P.d, P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_124_17})

V_21 = CTVertex(name = 'V_21',
                type = 'R2',
                particles = [ P.c__tilde__, P.s, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV3 ],
                loop_particles = [ [ [P.c, P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_124_17})

V_22 = CTVertex(name = 'V_22',
                type = 'R2',
                particles = [ P.t__tilde__, P.b, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV3 ],
                loop_particles = [ [ [P.b, P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_124_17})

V_23 = CTVertex(name = 'V_23',
                type = 'R2',
                particles = [ P.u__tilde__, P.u, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV3, L.FFV5 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_150_33,(0,1,0):C.R2GC_151_34})

V_24 = CTVertex(name = 'V_24',
                type = 'R2',
                particles = [ P.c__tilde__, P.c, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV3, L.FFV5 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_150_33,(0,1,0):C.R2GC_151_34})

V_25 = CTVertex(name = 'V_25',
                type = 'R2',
                particles = [ P.t__tilde__, P.t, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV3, L.FFV5 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_150_33,(0,1,0):C.R2GC_151_34})

V_26 = CTVertex(name = 'V_26',
                type = 'R2',
                particles = [ P.d__tilde__, P.d, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV3, L.FFV5 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_129_20,(0,1,0):C.R2GC_130_21})

V_27 = CTVertex(name = 'V_27',
                type = 'R2',
                particles = [ P.s__tilde__, P.s, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV3, L.FFV5 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_129_20,(0,1,0):C.R2GC_130_21})

V_28 = CTVertex(name = 'V_28',
                type = 'R2',
                particles = [ P.b__tilde__, P.b, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV3, L.FFV5 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_129_20,(0,1,0):C.R2GC_130_21})

V_29 = CTVertex(name = 'V_29',
                type = 'R2',
                particles = [ P.u__tilde__, P.u ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_126_18})

V_30 = CTVertex(name = 'V_30',
                type = 'R2',
                particles = [ P.c__tilde__, P.c ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_126_18})

V_31 = CTVertex(name = 'V_31',
                type = 'R2',
                particles = [ P.t__tilde__, P.t ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_148_32,(0,1,0):C.R2GC_126_18})

V_32 = CTVertex(name = 'V_32',
                type = 'R2',
                particles = [ P.d__tilde__, P.d ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_126_18})

V_33 = CTVertex(name = 'V_33',
                type = 'R2',
                particles = [ P.s__tilde__, P.s ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_126_18})

V_34 = CTVertex(name = 'V_34',
                type = 'R2',
                particles = [ P.b__tilde__, P.b ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_128_19,(0,1,0):C.R2GC_126_18})

V_35 = CTVertex(name = 'V_35',
                type = 'R2',
                particles = [ P.g, P.g ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VV2, L.VV3, L.VV4 ],
                loop_particles = [ [ [P.b] ], [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.g] ], [ [P.t] ] ],
                couplings = {(0,2,2):C.R2GC_70_36,(0,0,0):C.R2GC_81_37,(0,0,3):C.R2GC_81_38,(0,1,1):C.R2GC_84_43})

V_36 = CTVertex(name = 'V_36',
                type = 'R2',
                particles = [ P.g, P.g, P.H ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VVS1 ],
                loop_particles = [ [ [P.b] ], [ [P.t] ] ],
                couplings = {(0,0,0):C.R2GC_82_39,(0,0,1):C.R2GC_82_40})

V_37 = CTVertex(name = 'V_37',
                type = 'R2',
                particles = [ P.g, P.g, P.W__minus__, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VVVV11 ],
                loop_particles = [ [ [P.b, P.t], [P.c, P.s], [P.d, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_94_56})

V_38 = CTVertex(name = 'V_38',
                type = 'R2',
                particles = [ P.a, P.g, P.g, P.Z ],
                color = [ 'Identity(2,3)' ],
                lorentz = [ L.VVVV11 ],
                loop_particles = [ [ [P.b], [P.d], [P.s] ], [ [P.c], [P.t], [P.u] ] ],
                couplings = {(0,0,0):C.R2GC_87_48,(0,0,1):C.R2GC_87_49})

V_39 = CTVertex(name = 'V_39',
                type = 'R2',
                particles = [ P.g, P.g, P.Z, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VVVV11 ],
                loop_particles = [ [ [P.b], [P.d], [P.s] ], [ [P.c], [P.t], [P.u] ] ],
                couplings = {(0,0,0):C.R2GC_90_54,(0,0,1):C.R2GC_90_55})

V_40 = CTVertex(name = 'V_40',
                type = 'R2',
                particles = [ P.a, P.a, P.g, P.g ],
                color = [ 'Identity(3,4)' ],
                lorentz = [ L.VVVV11 ],
                loop_particles = [ [ [P.b], [P.d], [P.s] ], [ [P.c], [P.t], [P.u] ] ],
                couplings = {(0,0,0):C.R2GC_85_44,(0,0,1):C.R2GC_85_45})

V_41 = CTVertex(name = 'V_41',
                type = 'R2',
                particles = [ P.g, P.g, P.g, P.Z ],
                color = [ 'd(1,2,3)', 'f(1,2,3)' ],
                lorentz = [ L.VVVV1, L.VVVV11 ],
                loop_particles = [ [ [P.b], [P.d], [P.s] ], [ [P.c], [P.t], [P.u] ] ],
                couplings = {(1,0,0):C.R2GC_89_52,(1,0,1):C.R2GC_89_53,(0,1,0):C.R2GC_88_50,(0,1,1):C.R2GC_88_51})

V_42 = CTVertex(name = 'V_42',
                type = 'R2',
                particles = [ P.a, P.g, P.g, P.g ],
                color = [ 'd(2,3,4)' ],
                lorentz = [ L.VVVV11 ],
                loop_particles = [ [ [P.b], [P.d], [P.s] ], [ [P.c], [P.t], [P.u] ] ],
                couplings = {(0,0,0):C.R2GC_86_46,(0,0,1):C.R2GC_86_47})

V_43 = CTVertex(name = 'V_43',
                type = 'R2',
                particles = [ P.g, P.g, P.H, P.H ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VVSS1 ],
                loop_particles = [ [ [P.b] ], [ [P.t] ] ],
                couplings = {(0,0,0):C.R2GC_83_41,(0,0,1):C.R2GC_83_42})

V_44 = CTVertex(name = 'V_44',
                type = 'UV',
                particles = [ P.g, P.g, P.g ],
                color = [ 'f(1,2,3)' ],
                lorentz = [ L.VVV1, L.VVV2, L.VVV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.t] ] ],
                couplings = {(0,1,0):C.UVGC_133_30,(0,1,1):C.UVGC_133_31,(0,1,4):C.UVGC_133_32,(0,2,2):C.UVGC_96_72,(0,0,3):C.UVGC_97_73})

V_45 = CTVertex(name = 'V_45',
                type = 'UV',
                particles = [ P.g, P.g, P.g, P.g ],
                color = [ 'd(-1,1,3)*d(-1,2,4)', 'd(-1,1,3)*f(-1,2,4)', 'd(-1,1,4)*d(-1,2,3)', 'd(-1,1,4)*f(-1,2,3)', 'd(-1,2,3)*f(-1,1,4)', 'd(-1,2,4)*f(-1,1,3)', 'f(-1,1,2)*f(-1,3,4)', 'f(-1,1,3)*f(-1,2,4)', 'f(-1,1,4)*f(-1,2,3)', 'Identity(1,2)*Identity(3,4)', 'Identity(1,3)*Identity(2,4)', 'Identity(1,4)*Identity(2,3)' ],
                lorentz = [ L.VVVV11, L.VVVV2, L.VVVV3, L.VVVV5 ],
                loop_particles = [ [ [P.b] ], [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.t] ] ],
                couplings = {(2,1,3):C.UVGC_108_9,(2,1,4):C.UVGC_108_8,(0,1,3):C.UVGC_108_9,(0,1,4):C.UVGC_108_8,(4,1,3):C.UVGC_107_6,(4,1,4):C.UVGC_107_7,(3,1,3):C.UVGC_107_6,(3,1,4):C.UVGC_107_7,(8,1,3):C.UVGC_108_8,(8,1,4):C.UVGC_108_9,(6,1,0):C.UVGC_142_51,(6,1,2):C.UVGC_142_52,(6,1,3):C.UVGC_143_56,(6,1,4):C.UVGC_143_57,(6,1,5):C.UVGC_142_55,(7,1,0):C.UVGC_142_51,(7,1,2):C.UVGC_142_52,(7,1,3):C.UVGC_142_53,(7,1,4):C.UVGC_142_54,(7,1,5):C.UVGC_142_55,(5,1,3):C.UVGC_107_6,(5,1,4):C.UVGC_107_7,(1,1,3):C.UVGC_107_6,(1,1,4):C.UVGC_107_7,(11,0,3):C.UVGC_111_12,(11,0,4):C.UVGC_111_13,(10,0,3):C.UVGC_111_12,(10,0,4):C.UVGC_111_13,(9,0,3):C.UVGC_110_10,(9,0,4):C.UVGC_110_11,(2,2,3):C.UVGC_108_9,(2,2,4):C.UVGC_108_8,(0,2,3):C.UVGC_108_9,(0,2,4):C.UVGC_108_8,(4,2,3):C.UVGC_107_6,(4,2,4):C.UVGC_107_7,(3,2,3):C.UVGC_107_6,(3,2,4):C.UVGC_107_7,(8,2,0):C.UVGC_144_58,(8,2,2):C.UVGC_144_59,(8,2,3):C.UVGC_144_60,(8,2,4):C.UVGC_144_61,(8,2,5):C.UVGC_144_62,(6,2,0):C.UVGC_139_40,(6,2,3):C.UVGC_139_41,(6,2,4):C.UVGC_139_42,(6,2,5):C.UVGC_139_43,(7,2,1):C.UVGC_112_14,(7,2,3):C.UVGC_113_16,(7,2,4):C.UVGC_113_17,(5,2,3):C.UVGC_107_6,(5,2,4):C.UVGC_107_7,(1,2,3):C.UVGC_107_6,(1,2,4):C.UVGC_107_7,(0,3,3):C.UVGC_108_9,(0,3,4):C.UVGC_108_8,(2,3,3):C.UVGC_108_9,(2,3,4):C.UVGC_108_8,(5,3,3):C.UVGC_107_6,(5,3,4):C.UVGC_107_7,(1,3,3):C.UVGC_107_6,(1,3,4):C.UVGC_107_7,(7,3,0):C.UVGC_139_40,(7,3,3):C.UVGC_140_44,(7,3,4):C.UVGC_140_45,(7,3,5):C.UVGC_139_43,(4,3,3):C.UVGC_107_6,(4,3,4):C.UVGC_107_7,(3,3,3):C.UVGC_107_6,(3,3,4):C.UVGC_107_7,(8,3,0):C.UVGC_141_46,(8,3,2):C.UVGC_141_47,(8,3,3):C.UVGC_141_48,(8,3,4):C.UVGC_141_49,(8,3,5):C.UVGC_141_50,(6,3,1):C.UVGC_112_14,(6,3,3):C.UVGC_112_15,(6,3,4):C.UVGC_110_10})

V_46 = CTVertex(name = 'V_46',
                type = 'UV',
                particles = [ P.b__tilde__, P.b, P.H ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFS1 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_131_27})

V_47 = CTVertex(name = 'V_47',
                type = 'UV',
                particles = [ P.t__tilde__, P.t, P.H ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFS1 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_152_71})

V_48 = CTVertex(name = 'V_48',
                type = 'UV',
                particles = [ P.u__tilde__, P.u, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV6 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.UVGC_105_3})

V_49 = CTVertex(name = 'V_49',
                type = 'UV',
                particles = [ P.c__tilde__, P.c, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV6 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_105_3})

V_50 = CTVertex(name = 'V_50',
                type = 'UV',
                particles = [ P.t__tilde__, P.t, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1, L.FFV7 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_105_3,(0,1,0):C.UVGC_146_64})

V_51 = CTVertex(name = 'V_51',
                type = 'UV',
                particles = [ P.d__tilde__, P.d, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1, L.FFV3, L.FFV5 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_114_18,(0,1,0):C.UVGC_101_2,(0,2,0):C.UVGC_101_2})

V_52 = CTVertex(name = 'V_52',
                type = 'UV',
                particles = [ P.s__tilde__, P.s, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1, L.FFV3, L.FFV5 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.UVGC_114_18,(0,1,0):C.UVGC_101_2,(0,2,0):C.UVGC_101_2})

V_53 = CTVertex(name = 'V_53',
                type = 'UV',
                particles = [ P.b__tilde__, P.b, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1, L.FFV3, L.FFV5 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_114_18,(0,1,0):C.UVGC_127_23,(0,2,0):C.UVGC_127_23})

V_54 = CTVertex(name = 'V_54',
                type = 'UV',
                particles = [ P.u__tilde__, P.u, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV3, L.FFV5 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.u] ], [ [P.t] ] ],
                couplings = {(0,0,4):C.UVGC_115_19,(0,1,0):C.UVGC_134_33,(0,1,1):C.UVGC_134_34,(0,1,2):C.UVGC_134_35,(0,1,3):C.UVGC_134_36,(0,1,5):C.UVGC_134_37,(0,1,4):C.UVGC_134_38,(0,2,0):C.UVGC_134_33,(0,2,1):C.UVGC_134_34,(0,2,2):C.UVGC_134_35,(0,2,3):C.UVGC_134_36,(0,2,5):C.UVGC_134_37,(0,2,4):C.UVGC_134_38})

V_55 = CTVertex(name = 'V_55',
                type = 'UV',
                particles = [ P.c__tilde__, P.c, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV3, L.FFV5 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.c, P.g] ], [ [P.g] ], [ [P.ghG] ], [ [P.t] ] ],
                couplings = {(0,0,2):C.UVGC_115_19,(0,1,0):C.UVGC_134_33,(0,1,1):C.UVGC_134_34,(0,1,3):C.UVGC_134_35,(0,1,4):C.UVGC_134_36,(0,1,5):C.UVGC_134_37,(0,1,2):C.UVGC_134_38,(0,2,0):C.UVGC_134_33,(0,2,1):C.UVGC_134_34,(0,2,3):C.UVGC_134_35,(0,2,4):C.UVGC_134_36,(0,2,5):C.UVGC_134_37,(0,2,2):C.UVGC_134_38})

V_56 = CTVertex(name = 'V_56',
                type = 'UV',
                particles = [ P.t__tilde__, P.t, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV3, L.FFV5 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.t] ], [ [P.t] ] ],
                couplings = {(0,0,4):C.UVGC_115_19,(0,1,0):C.UVGC_134_33,(0,1,1):C.UVGC_134_34,(0,1,2):C.UVGC_134_35,(0,1,3):C.UVGC_134_36,(0,1,5):C.UVGC_134_37,(0,1,4):C.UVGC_147_65,(0,2,0):C.UVGC_134_33,(0,2,1):C.UVGC_134_34,(0,2,2):C.UVGC_134_35,(0,2,3):C.UVGC_134_36,(0,2,5):C.UVGC_134_37,(0,2,4):C.UVGC_147_65})

V_57 = CTVertex(name = 'V_57',
                type = 'UV',
                particles = [ P.d__tilde__, P.d, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV3, L.FFV5 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.d, P.g] ], [ [P.g] ], [ [P.ghG] ], [ [P.t] ] ],
                couplings = {(0,0,2):C.UVGC_115_19,(0,1,0):C.UVGC_134_33,(0,1,1):C.UVGC_134_34,(0,1,3):C.UVGC_134_35,(0,1,4):C.UVGC_134_36,(0,1,5):C.UVGC_134_37,(0,1,2):C.UVGC_134_38,(0,2,0):C.UVGC_134_33,(0,2,1):C.UVGC_134_34,(0,2,3):C.UVGC_134_35,(0,2,4):C.UVGC_134_36,(0,2,5):C.UVGC_134_37,(0,2,2):C.UVGC_134_38})

V_58 = CTVertex(name = 'V_58',
                type = 'UV',
                particles = [ P.s__tilde__, P.s, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV3, L.FFV5 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.s] ], [ [P.t] ] ],
                couplings = {(0,0,4):C.UVGC_115_19,(0,1,0):C.UVGC_134_33,(0,1,1):C.UVGC_134_34,(0,1,2):C.UVGC_134_35,(0,1,3):C.UVGC_134_36,(0,1,5):C.UVGC_134_37,(0,1,4):C.UVGC_134_38,(0,2,0):C.UVGC_134_33,(0,2,1):C.UVGC_134_34,(0,2,2):C.UVGC_134_35,(0,2,3):C.UVGC_134_36,(0,2,5):C.UVGC_134_37,(0,2,4):C.UVGC_134_38})

V_59 = CTVertex(name = 'V_59',
                type = 'UV',
                particles = [ P.b__tilde__, P.b, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV3, L.FFV5 ],
                loop_particles = [ [ [P.b] ], [ [P.b, P.g] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.t] ] ],
                couplings = {(0,0,1):C.UVGC_115_19,(0,1,0):C.UVGC_134_33,(0,1,2):C.UVGC_134_34,(0,1,3):C.UVGC_134_35,(0,1,4):C.UVGC_134_36,(0,1,5):C.UVGC_134_37,(0,1,1):C.UVGC_138_39,(0,2,0):C.UVGC_134_33,(0,2,2):C.UVGC_134_34,(0,2,3):C.UVGC_134_35,(0,2,4):C.UVGC_134_36,(0,2,5):C.UVGC_134_37,(0,2,1):C.UVGC_138_39})

V_60 = CTVertex(name = 'V_60',
                type = 'UV',
                particles = [ P.d__tilde__, P.u, P.W__minus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV3 ],
                loop_particles = [ [ [P.d, P.g], [P.g, P.u] ], [ [P.d, P.g, P.u] ] ],
                couplings = {(0,0,0):C.UVGC_124_20,(0,0,1):C.UVGC_124_21})

V_61 = CTVertex(name = 'V_61',
                type = 'UV',
                particles = [ P.s__tilde__, P.c, P.W__minus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV3 ],
                loop_particles = [ [ [P.c, P.g], [P.g, P.s] ], [ [P.c, P.g, P.s] ] ],
                couplings = {(0,0,0):C.UVGC_124_20,(0,0,1):C.UVGC_124_21})

V_62 = CTVertex(name = 'V_62',
                type = 'UV',
                particles = [ P.b__tilde__, P.t, P.W__minus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV3 ],
                loop_particles = [ [ [P.b, P.g] ], [ [P.b, P.g, P.t] ], [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_149_67,(0,0,2):C.UVGC_149_68,(0,0,1):C.UVGC_124_21})

V_63 = CTVertex(name = 'V_63',
                type = 'UV',
                particles = [ P.u__tilde__, P.d, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV3 ],
                loop_particles = [ [ [P.d, P.g], [P.g, P.u] ], [ [P.d, P.g, P.u] ] ],
                couplings = {(0,0,0):C.UVGC_124_20,(0,0,1):C.UVGC_124_21})

V_64 = CTVertex(name = 'V_64',
                type = 'UV',
                particles = [ P.c__tilde__, P.s, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV3 ],
                loop_particles = [ [ [P.c, P.g], [P.g, P.s] ], [ [P.c, P.g, P.s] ] ],
                couplings = {(0,0,0):C.UVGC_124_20,(0,0,1):C.UVGC_124_21})

V_65 = CTVertex(name = 'V_65',
                type = 'UV',
                particles = [ P.t__tilde__, P.b, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV3 ],
                loop_particles = [ [ [P.b, P.g] ], [ [P.b, P.g, P.t] ], [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_149_67,(0,0,2):C.UVGC_149_68,(0,0,1):C.UVGC_124_21})

V_66 = CTVertex(name = 'V_66',
                type = 'UV',
                particles = [ P.t__tilde__, P.t, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV3, L.FFV5 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_150_69,(0,1,0):C.UVGC_151_70})

V_67 = CTVertex(name = 'V_67',
                type = 'UV',
                particles = [ P.b__tilde__, P.b, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV3, L.FFV5 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_129_25,(0,1,0):C.UVGC_130_26})

V_68 = CTVertex(name = 'V_68',
                type = 'UV',
                particles = [ P.u__tilde__, P.u ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF4 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.UVGC_100_1})

V_69 = CTVertex(name = 'V_69',
                type = 'UV',
                particles = [ P.c__tilde__, P.c ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF4 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_100_1})

V_70 = CTVertex(name = 'V_70',
                type = 'UV',
                particles = [ P.t__tilde__, P.t ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_148_66,(0,1,0):C.UVGC_145_63})

V_71 = CTVertex(name = 'V_71',
                type = 'UV',
                particles = [ P.d__tilde__, P.d ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF4 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_100_1})

V_72 = CTVertex(name = 'V_72',
                type = 'UV',
                particles = [ P.s__tilde__, P.s ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF4 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.UVGC_100_1})

V_73 = CTVertex(name = 'V_73',
                type = 'UV',
                particles = [ P.b__tilde__, P.b ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_128_24,(0,1,0):C.UVGC_126_22})

V_74 = CTVertex(name = 'V_74',
                type = 'UV',
                particles = [ P.g, P.g ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VV1, L.VV5 ],
                loop_particles = [ [ [P.b] ], [ [P.g] ], [ [P.ghG] ], [ [P.t] ] ],
                couplings = {(0,1,0):C.UVGC_132_28,(0,1,3):C.UVGC_132_29,(0,0,1):C.UVGC_106_4,(0,0,2):C.UVGC_106_5})

