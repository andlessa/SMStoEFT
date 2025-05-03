# This file was automatically created by FeynRules 2.4.91
# Mathematica version: 14.1.0 for Linux x86 (64-bit) (July 16, 2024)
# Date: Tue 25 Mar 2025 15:32:36


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
               couplings = {(0,0,0):C.R2GC_129_20,(0,0,1):C.R2GC_129_21})

V_2 = CTVertex(name = 'V_2',
               type = 'R2',
               particles = [ P.g, P.g, P.g, P.g ],
               color = [ 'd(-1,1,3)*d(-1,2,4)', 'd(-1,1,3)*f(-1,2,4)', 'd(-1,1,4)*d(-1,2,3)', 'd(-1,1,4)*f(-1,2,3)', 'd(-1,2,3)*f(-1,1,4)', 'd(-1,2,4)*f(-1,1,3)', 'f(-1,1,2)*f(-1,3,4)', 'f(-1,1,3)*f(-1,2,4)', 'f(-1,1,4)*f(-1,2,3)', 'Identity(1,2)*Identity(3,4)', 'Identity(1,3)*Identity(2,4)', 'Identity(1,4)*Identity(2,3)' ],
               lorentz = [ L.VVVV1, L.VVVV2, L.VVVV4, L.VVVV9 ],
               loop_particles = [ [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.g] ] ],
               couplings = {(2,0,0):C.R2GC_104_5,(2,0,1):C.R2GC_104_6,(0,0,0):C.R2GC_104_5,(0,0,1):C.R2GC_104_6,(4,0,0):C.R2GC_102_1,(4,0,1):C.R2GC_102_2,(3,0,0):C.R2GC_102_1,(3,0,1):C.R2GC_102_2,(8,0,0):C.R2GC_103_3,(8,0,1):C.R2GC_103_4,(6,0,0):C.R2GC_107_10,(6,0,1):C.R2GC_141_30,(7,0,0):C.R2GC_108_12,(7,0,1):C.R2GC_142_31,(5,0,0):C.R2GC_102_1,(5,0,1):C.R2GC_102_2,(1,0,0):C.R2GC_102_1,(1,0,1):C.R2GC_102_2,(11,3,0):C.R2GC_106_8,(11,3,1):C.R2GC_106_9,(10,3,0):C.R2GC_106_8,(10,3,1):C.R2GC_106_9,(9,3,1):C.R2GC_105_7,(2,1,0):C.R2GC_104_5,(2,1,1):C.R2GC_104_6,(0,1,0):C.R2GC_104_5,(0,1,1):C.R2GC_104_6,(4,1,0):C.R2GC_102_1,(4,1,1):C.R2GC_102_2,(3,1,0):C.R2GC_102_1,(3,1,1):C.R2GC_102_2,(8,1,0):C.R2GC_103_3,(8,1,1):C.R2GC_140_29,(6,1,0):C.R2GC_139_27,(6,1,1):C.R2GC_139_28,(7,1,0):C.R2GC_108_12,(7,1,1):C.R2GC_108_13,(5,1,0):C.R2GC_102_1,(5,1,1):C.R2GC_102_2,(1,1,0):C.R2GC_102_1,(1,1,1):C.R2GC_102_2,(0,2,0):C.R2GC_104_5,(0,2,1):C.R2GC_104_6,(2,2,0):C.R2GC_104_5,(2,2,1):C.R2GC_104_6,(5,2,0):C.R2GC_102_1,(5,2,1):C.R2GC_102_2,(1,2,0):C.R2GC_102_1,(1,2,1):C.R2GC_102_2,(7,2,0):C.R2GC_138_26,(7,2,1):C.R2GC_104_6,(4,2,0):C.R2GC_102_1,(4,2,1):C.R2GC_102_2,(3,2,0):C.R2GC_102_1,(3,2,1):C.R2GC_102_2,(8,2,0):C.R2GC_103_3,(8,2,1):C.R2GC_137_25,(6,2,0):C.R2GC_107_10,(6,2,1):C.R2GC_107_11})

V_3 = CTVertex(name = 'V_3',
               type = 'R2',
               particles = [ P.P__tilde__chi, P.t, P.P__tilde__ST__tilde__ ],
               color = [ 'Identity(2,3)' ],
               lorentz = [ L.FFS1 ],
               loop_particles = [ [ [P.g, P.P__tilde__ST, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_146_33})

V_4 = CTVertex(name = 'V_4',
               type = 'R2',
               particles = [ P.t__tilde__, P.P__tilde__chi, P.P__tilde__ST ],
               color = [ 'Identity(1,3)' ],
               lorentz = [ L.FFS3 ],
               loop_particles = [ [ [P.g, P.P__tilde__ST, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_146_33})

V_5 = CTVertex(name = 'V_5',
               type = 'R2',
               particles = [ P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
               color = [ 'T(1,3,2)' ],
               lorentz = [ L.VSS1 ],
               loop_particles = [ [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_130_22,(0,0,1):C.R2GC_155_35})

V_6 = CTVertex(name = 'V_6',
               type = 'R2',
               particles = [ P.g, P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
               color = [ 'Identity(1,2)*Identity(3,4)', 'T(1,-1,3)*T(2,4,-1)', 'T(1,4,-1)*T(2,-1,3)' ],
               lorentz = [ L.VVSS1 ],
               loop_particles = [ [ [P.g] ], [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
               couplings = {(2,0,0):C.R2GC_136_23,(2,0,1):C.R2GC_136_24,(2,0,2):C.R2GC_156_36,(1,0,0):C.R2GC_136_23,(1,0,1):C.R2GC_136_24,(1,0,2):C.R2GC_156_36,(0,0,0):C.R2GC_106_9,(0,0,1):C.R2GC_117_17})

V_7 = CTVertex(name = 'V_7',
               type = 'R2',
               particles = [ P.u__tilde__, P.u, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.g, P.u] ] ],
               couplings = {(0,0,0):C.R2GC_109_14})

V_8 = CTVertex(name = 'V_8',
               type = 'R2',
               particles = [ P.c__tilde__, P.c, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.c, P.g] ] ],
               couplings = {(0,0,0):C.R2GC_109_14})

V_9 = CTVertex(name = 'V_9',
               type = 'R2',
               particles = [ P.t__tilde__, P.t, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.g, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_109_14})

V_10 = CTVertex(name = 'V_10',
                type = 'R2',
                particles = [ P.d__tilde__, P.d, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_109_14})

V_11 = CTVertex(name = 'V_11',
                type = 'R2',
                particles = [ P.s__tilde__, P.s, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_109_14})

V_12 = CTVertex(name = 'V_12',
                type = 'R2',
                particles = [ P.b__tilde__, P.b, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_109_14})

V_13 = CTVertex(name = 'V_13',
                type = 'R2',
                particles = [ P.t__tilde__, P.t ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF5, L.FF8 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_145_32,(0,1,0):C.R2GC_111_16})

V_14 = CTVertex(name = 'V_14',
                type = 'R2',
                particles = [ P.u__tilde__, P.u ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_111_16})

V_15 = CTVertex(name = 'V_15',
                type = 'R2',
                particles = [ P.c__tilde__, P.c ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_111_16})

V_16 = CTVertex(name = 'V_16',
                type = 'R2',
                particles = [ P.d__tilde__, P.d ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_111_16})

V_17 = CTVertex(name = 'V_17',
                type = 'R2',
                particles = [ P.s__tilde__, P.s ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_111_16})

V_18 = CTVertex(name = 'V_18',
                type = 'R2',
                particles = [ P.b__tilde__, P.b ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF5, L.FF8 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_110_15,(0,1,0):C.R2GC_111_16})

V_19 = CTVertex(name = 'V_19',
                type = 'R2',
                particles = [ P.g, P.g ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VV1, L.VV2, L.VV3 ],
                loop_particles = [ [ [P.b] ], [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.g] ], [ [P.t] ] ],
                couplings = {(0,2,2):C.R2GC_95_38,(0,0,0):C.R2GC_96_39,(0,0,3):C.R2GC_96_40,(0,1,1):C.R2GC_97_41})

V_20 = CTVertex(name = 'V_20',
                type = 'R2',
                particles = [ P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.SS1, L.SS2 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_127_19,(0,0,1):C.R2GC_157_37,(0,1,0):C.R2GC_126_18,(0,1,1):C.R2GC_154_34})

V_21 = CTVertex(name = 'V_21',
                type = 'UV',
                particles = [ P.g, P.g, P.g ],
                color = [ 'f(1,2,3)' ],
                lorentz = [ L.VVV1, L.VVV2, L.VVV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,1,0):C.UVGC_129_31,(0,1,1):C.UVGC_129_32,(0,1,2):C.UVGC_129_33,(0,1,3):C.UVGC_129_34,(0,1,4):C.UVGC_129_35,(0,1,5):C.UVGC_129_36,(0,0,2):C.UVGC_99_113,(0,2,4):C.UVGC_101_2})

V_22 = CTVertex(name = 'V_22',
                type = 'UV',
                particles = [ P.g, P.g, P.g, P.g ],
                color = [ 'd(-1,1,3)*d(-1,2,4)', 'd(-1,1,3)*f(-1,2,4)', 'd(-1,1,4)*d(-1,2,3)', 'd(-1,1,4)*f(-1,2,3)', 'd(-1,2,3)*f(-1,1,4)', 'd(-1,2,4)*f(-1,1,3)', 'f(-1,1,2)*f(-1,3,4)', 'f(-1,1,3)*f(-1,2,4)', 'f(-1,1,4)*f(-1,2,3)', 'Identity(1,2)*Identity(3,4)', 'Identity(1,3)*Identity(2,4)', 'Identity(1,4)*Identity(2,3)' ],
                lorentz = [ L.VVVV1, L.VVVV2, L.VVVV4, L.VVVV9 ],
                loop_particles = [ [ [P.b] ], [ [P.b], [P.c], [P.d], [P.s], [P.P__tilde__ST], [P.t], [P.u] ], [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(2,0,4):C.UVGC_103_6,(2,0,5):C.UVGC_103_5,(0,0,4):C.UVGC_103_6,(0,0,5):C.UVGC_103_5,(4,0,4):C.UVGC_102_3,(4,0,5):C.UVGC_102_4,(3,0,4):C.UVGC_102_3,(3,0,5):C.UVGC_102_4,(8,0,4):C.UVGC_103_5,(8,0,5):C.UVGC_103_6,(6,0,0):C.UVGC_141_80,(6,0,3):C.UVGC_141_81,(6,0,4):C.UVGC_141_82,(6,0,5):C.UVGC_141_83,(6,0,6):C.UVGC_141_84,(6,0,7):C.UVGC_141_85,(7,0,0):C.UVGC_141_80,(7,0,3):C.UVGC_141_81,(7,0,4):C.UVGC_142_86,(7,0,5):C.UVGC_142_87,(7,0,6):C.UVGC_141_84,(7,0,7):C.UVGC_141_85,(5,0,4):C.UVGC_102_3,(5,0,5):C.UVGC_102_4,(1,0,4):C.UVGC_102_3,(1,0,5):C.UVGC_102_4,(11,3,4):C.UVGC_106_9,(11,3,5):C.UVGC_106_10,(10,3,4):C.UVGC_106_9,(10,3,5):C.UVGC_106_10,(9,3,4):C.UVGC_105_7,(9,3,5):C.UVGC_105_8,(2,1,4):C.UVGC_103_6,(2,1,5):C.UVGC_103_5,(0,1,4):C.UVGC_103_6,(0,1,5):C.UVGC_103_5,(4,1,4):C.UVGC_102_3,(4,1,5):C.UVGC_102_4,(3,1,4):C.UVGC_102_3,(3,1,5):C.UVGC_102_4,(8,1,0):C.UVGC_140_74,(8,1,3):C.UVGC_140_75,(8,1,4):C.UVGC_140_76,(8,1,5):C.UVGC_140_77,(8,1,6):C.UVGC_140_78,(8,1,7):C.UVGC_140_79,(6,1,0):C.UVGC_138_65,(6,1,3):C.UVGC_138_66,(6,1,4):C.UVGC_139_71,(6,1,5):C.UVGC_139_72,(6,1,6):C.UVGC_139_73,(6,1,7):C.UVGC_138_70,(7,1,1):C.UVGC_107_11,(7,1,4):C.UVGC_108_14,(7,1,5):C.UVGC_108_15,(5,1,4):C.UVGC_102_3,(5,1,5):C.UVGC_102_4,(1,1,4):C.UVGC_102_3,(1,1,5):C.UVGC_102_4,(0,2,4):C.UVGC_103_6,(0,2,5):C.UVGC_103_5,(2,2,4):C.UVGC_103_6,(2,2,5):C.UVGC_103_5,(5,2,4):C.UVGC_102_3,(5,2,5):C.UVGC_102_4,(1,2,4):C.UVGC_102_3,(1,2,5):C.UVGC_102_4,(7,2,0):C.UVGC_138_65,(7,2,3):C.UVGC_138_66,(7,2,4):C.UVGC_138_67,(7,2,5):C.UVGC_138_68,(7,2,6):C.UVGC_138_69,(7,2,7):C.UVGC_138_70,(4,2,4):C.UVGC_102_3,(4,2,5):C.UVGC_102_4,(3,2,4):C.UVGC_102_3,(3,2,5):C.UVGC_102_4,(8,2,0):C.UVGC_137_59,(8,2,3):C.UVGC_137_60,(8,2,4):C.UVGC_137_61,(8,2,5):C.UVGC_137_62,(8,2,6):C.UVGC_137_63,(8,2,7):C.UVGC_137_64,(6,2,2):C.UVGC_107_11,(6,2,4):C.UVGC_107_12,(6,2,5):C.UVGC_105_7,(6,2,6):C.UVGC_107_13})

V_23 = CTVertex(name = 'V_23',
                type = 'UV',
                particles = [ P.P__tilde__chi, P.t, P.P__tilde__ST__tilde__ ],
                color = [ 'Identity(2,3)' ],
                lorentz = [ L.FFS1 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST] ], [ [P.g, P.P__tilde__ST, P.t] ], [ [P.g, P.t] ], [ [P.P__tilde__chi, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ], [ [P.P__tilde__ST, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_146_91,(0,0,2):C.UVGC_146_92,(0,0,1):C.UVGC_146_93,(0,0,3):C.UVGC_162_109,(0,0,4):C.UVGC_162_110,(0,0,5):C.UVGC_162_111})

V_24 = CTVertex(name = 'V_24',
                type = 'UV',
                particles = [ P.t__tilde__, P.P__tilde__chi, P.P__tilde__ST ],
                color = [ 'Identity(1,3)' ],
                lorentz = [ L.FFS3 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST] ], [ [P.g, P.P__tilde__ST, P.t] ], [ [P.g, P.t] ], [ [P.P__tilde__chi, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ], [ [P.P__tilde__ST, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_146_91,(0,0,2):C.UVGC_146_92,(0,0,1):C.UVGC_146_93,(0,0,3):C.UVGC_162_109,(0,0,4):C.UVGC_162_110,(0,0,5):C.UVGC_162_111})

V_25 = CTVertex(name = 'V_25',
                type = 'UV',
                particles = [ P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'T(1,3,2)' ],
                lorentz = [ L.VSS1 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,0):C.UVGC_130_37,(0,0,1):C.UVGC_130_38,(0,0,2):C.UVGC_130_39,(0,0,3):C.UVGC_130_40,(0,0,6):C.UVGC_130_41,(0,0,7):C.UVGC_130_42,(0,0,4):C.UVGC_130_43,(0,0,5):C.UVGC_155_102})

V_26 = CTVertex(name = 'V_26',
                type = 'UV',
                particles = [ P.g, P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'Identity(1,2)*Identity(3,4)', 'T(1,-1,3)*T(2,4,-1)', 'T(1,4,-1)*T(2,-1,3)' ],
                lorentz = [ L.VVSS1 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(2,0,0):C.UVGC_136_52,(2,0,1):C.UVGC_136_53,(2,0,2):C.UVGC_136_54,(2,0,3):C.UVGC_136_55,(2,0,6):C.UVGC_136_56,(2,0,7):C.UVGC_136_57,(2,0,4):C.UVGC_136_58,(2,0,5):C.UVGC_156_103,(1,0,0):C.UVGC_136_52,(1,0,1):C.UVGC_136_53,(1,0,2):C.UVGC_136_54,(1,0,3):C.UVGC_136_55,(1,0,6):C.UVGC_136_56,(1,0,7):C.UVGC_136_57,(1,0,4):C.UVGC_136_58,(1,0,5):C.UVGC_156_103,(0,0,2):C.UVGC_117_20,(0,0,4):C.UVGC_117_21})

V_27 = CTVertex(name = 'V_27',
                type = 'UV',
                particles = [ P.u__tilde__, P.u, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV5 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.u] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,4):C.UVGC_109_16,(0,1,0):C.UVGC_131_44,(0,1,1):C.UVGC_131_45,(0,1,2):C.UVGC_131_46,(0,1,3):C.UVGC_131_47,(0,1,5):C.UVGC_131_48,(0,1,6):C.UVGC_131_49,(0,1,4):C.UVGC_131_50})

V_28 = CTVertex(name = 'V_28',
                type = 'UV',
                particles = [ P.c__tilde__, P.c, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV5 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.c, P.g] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,2):C.UVGC_109_16,(0,1,0):C.UVGC_131_44,(0,1,1):C.UVGC_131_45,(0,1,3):C.UVGC_131_46,(0,1,4):C.UVGC_131_47,(0,1,5):C.UVGC_131_48,(0,1,6):C.UVGC_131_49,(0,1,2):C.UVGC_131_50})

V_29 = CTVertex(name = 'V_29',
                type = 'UV',
                particles = [ P.t__tilde__, P.t, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3, L.FFV5 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.t] ], [ [P.P__tilde__chi, P.P__tilde__ST] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,4):C.UVGC_109_16,(0,3,0):C.UVGC_131_44,(0,3,1):C.UVGC_131_45,(0,3,2):C.UVGC_131_46,(0,3,3):C.UVGC_131_47,(0,3,6):C.UVGC_131_48,(0,3,7):C.UVGC_131_49,(0,3,4):C.UVGC_144_89,(0,3,5):C.UVGC_148_95,(0,1,5):C.UVGC_150_97,(0,2,5):C.UVGC_153_100})

V_30 = CTVertex(name = 'V_30',
                type = 'UV',
                particles = [ P.d__tilde__, P.d, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV5 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.d, P.g] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,2):C.UVGC_109_16,(0,1,0):C.UVGC_131_44,(0,1,1):C.UVGC_131_45,(0,1,3):C.UVGC_131_46,(0,1,4):C.UVGC_131_47,(0,1,5):C.UVGC_131_48,(0,1,6):C.UVGC_131_49,(0,1,2):C.UVGC_131_50})

V_31 = CTVertex(name = 'V_31',
                type = 'UV',
                particles = [ P.s__tilde__, P.s, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV5 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.s] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,4):C.UVGC_109_16,(0,1,0):C.UVGC_131_44,(0,1,1):C.UVGC_131_45,(0,1,2):C.UVGC_131_46,(0,1,3):C.UVGC_131_47,(0,1,5):C.UVGC_131_48,(0,1,6):C.UVGC_131_49,(0,1,4):C.UVGC_131_50})

V_32 = CTVertex(name = 'V_32',
                type = 'UV',
                particles = [ P.b__tilde__, P.b, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV5 ],
                loop_particles = [ [ [P.b] ], [ [P.b, P.g] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,1):C.UVGC_109_16,(0,1,0):C.UVGC_131_44,(0,1,2):C.UVGC_131_45,(0,1,3):C.UVGC_131_46,(0,1,4):C.UVGC_131_47,(0,1,5):C.UVGC_131_48,(0,1,6):C.UVGC_131_49,(0,1,1):C.UVGC_135_51})

V_33 = CTVertex(name = 'V_33',
                type = 'UV',
                particles = [ P.t__tilde__, P.t ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF5, L.FF7, L.FF8 ],
                loop_particles = [ [ [P.g, P.t] ], [ [P.P__tilde__chi, P.P__tilde__ST] ] ],
                couplings = {(0,1,0):C.UVGC_145_90,(0,1,1):C.UVGC_151_98,(0,3,0):C.UVGC_143_88,(0,3,1):C.UVGC_147_94,(0,2,1):C.UVGC_152_99,(0,0,1):C.UVGC_149_96})

V_34 = CTVertex(name = 'V_34',
                type = 'UV',
                particles = [ P.u__tilde__, P.u ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF8 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.UVGC_111_18,(0,1,0):C.UVGC_112_19})

V_35 = CTVertex(name = 'V_35',
                type = 'UV',
                particles = [ P.c__tilde__, P.c ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF8 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_111_18,(0,1,0):C.UVGC_112_19})

V_36 = CTVertex(name = 'V_36',
                type = 'UV',
                particles = [ P.d__tilde__, P.d ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF8 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_111_18,(0,1,0):C.UVGC_112_19})

V_37 = CTVertex(name = 'V_37',
                type = 'UV',
                particles = [ P.s__tilde__, P.s ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF8 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.UVGC_111_18,(0,1,0):C.UVGC_112_19})

V_38 = CTVertex(name = 'V_38',
                type = 'UV',
                particles = [ P.b__tilde__, P.b ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF5, L.FF8 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_110_17,(0,1,0):C.UVGC_125_22})

V_39 = CTVertex(name = 'V_39',
                type = 'UV',
                particles = [ P.g, P.g ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VV4, L.VV5, L.VV6 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,0):C.UVGC_128_25,(0,0,1):C.UVGC_128_26,(0,0,2):C.UVGC_128_27,(0,0,3):C.UVGC_128_28,(0,0,4):C.UVGC_128_29,(0,0,5):C.UVGC_128_30,(0,1,2):C.UVGC_98_112,(0,2,3):C.UVGC_100_1})

V_40 = CTVertex(name = 'V_40',
                type = 'UV',
                particles = [ P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.SS1, L.SS2 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_127_24,(0,0,1):C.UVGC_157_104,(0,1,0):C.UVGC_126_23,(0,1,1):C.UVGC_154_101})

V_41 = CTVertex(name = 'V_41',
                type = 'UV',
                particles = [ P.P__tilde__chi, P.P__tilde__chi ],
                color = [ '1' ],
                lorentz = [ L.FF1, L.FF3, L.FF4, L.FF6 ],
                loop_particles = [ [ [P.P__tilde__ST, P.t] ] ],
                couplings = {(0,1,0):C.UVGC_159_106,(0,2,0):C.UVGC_161_108,(0,3,0):C.UVGC_158_105,(0,0,0):C.UVGC_160_107})

