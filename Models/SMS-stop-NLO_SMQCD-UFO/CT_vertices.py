# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 12.1.0 for Linux x86 (64-bit) (March 18, 2020)
# Date: Thu 31 Aug 2023 09:37:17


from object_library import all_vertices, all_CTvertices, Vertex, CTVertex
import particles as P
import CT_couplings as C
import lorentz as L


V_1 = CTVertex(name = 'V_1',
               type = 'R2',
               particles = [ P.g, P.g, P.g ],
               color = [ 'f(1,2,3)' ],
               lorentz = [ L.VVV1, L.VVV2, L.VVV4, L.VVV6, L.VVV7, L.VVV8 ],
               loop_particles = [ [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.g] ] ],
               couplings = {(0,0,0):C.R2GC_112_8,(0,0,1):C.R2GC_112_9,(0,1,0):C.R2GC_120_10,(0,1,1):C.R2GC_120_11,(0,2,0):C.R2GC_120_10,(0,2,1):C.R2GC_120_11,(0,3,0):C.R2GC_112_8,(0,3,1):C.R2GC_112_9,(0,4,0):C.R2GC_112_8,(0,4,1):C.R2GC_112_9,(0,5,0):C.R2GC_120_10,(0,5,1):C.R2GC_120_11})

V_2 = CTVertex(name = 'V_2',
               type = 'R2',
               particles = [ P.g, P.g, P.g, P.g ],
               color = [ 'd(-1,1,3)*d(-1,2,4)', 'd(-1,1,3)*f(-1,2,4)', 'd(-1,1,4)*d(-1,2,3)', 'd(-1,1,4)*f(-1,2,3)', 'd(-1,2,3)*f(-1,1,4)', 'd(-1,2,4)*f(-1,1,3)', 'f(-1,1,2)*f(-1,3,4)', 'f(-1,1,3)*f(-1,2,4)', 'f(-1,1,4)*f(-1,2,3)', 'Identity(1,2)*Identity(3,4)', 'Identity(1,3)*Identity(2,4)', 'Identity(1,4)*Identity(2,3)' ],
               lorentz = [ L.VVVV1, L.VVVV2, L.VVVV3 ],
               loop_particles = [ [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.g] ] ],
               couplings = {(2,0,0):C.R2GC_91_41,(2,0,1):C.R2GC_123_13,(0,0,0):C.R2GC_91_41,(0,0,1):C.R2GC_123_13,(6,0,0):C.R2GC_127_20,(6,0,1):C.R2GC_127_21,(4,0,0):C.R2GC_89_38,(4,0,1):C.R2GC_89_39,(3,0,0):C.R2GC_89_38,(3,0,1):C.R2GC_89_39,(8,0,0):C.R2GC_125_16,(8,0,1):C.R2GC_90_40,(7,0,0):C.R2GC_126_18,(7,0,1):C.R2GC_126_19,(5,0,0):C.R2GC_89_38,(5,0,1):C.R2GC_89_39,(1,0,0):C.R2GC_89_38,(1,0,1):C.R2GC_89_39,(11,0,0):C.R2GC_93_43,(11,0,1):C.R2GC_103_3,(10,0,0):C.R2GC_93_43,(10,0,1):C.R2GC_103_3,(9,0,1):C.R2GC_92_42,(2,1,0):C.R2GC_91_41,(2,1,1):C.R2GC_123_13,(0,1,0):C.R2GC_91_41,(0,1,1):C.R2GC_123_13,(4,1,0):C.R2GC_89_38,(4,1,1):C.R2GC_89_39,(3,1,0):C.R2GC_89_38,(3,1,1):C.R2GC_89_39,(8,1,0):C.R2GC_125_16,(8,1,1):C.R2GC_128_22,(6,1,0):C.R2GC_124_14,(6,1,1):C.R2GC_124_15,(7,1,0):C.R2GC_126_18,(7,1,1):C.R2GC_96_45,(5,1,0):C.R2GC_89_38,(5,1,1):C.R2GC_89_39,(1,1,0):C.R2GC_89_38,(1,1,1):C.R2GC_89_39,(11,1,0):C.R2GC_93_43,(11,1,1):C.R2GC_103_3,(10,1,0):C.R2GC_93_43,(10,1,1):C.R2GC_103_3,(9,1,1):C.R2GC_92_42,(2,2,0):C.R2GC_91_41,(2,2,1):C.R2GC_123_13,(0,2,0):C.R2GC_91_41,(0,2,1):C.R2GC_123_13,(4,2,0):C.R2GC_89_38,(4,2,1):C.R2GC_89_39,(3,2,0):C.R2GC_89_38,(3,2,1):C.R2GC_89_39,(8,2,0):C.R2GC_125_16,(8,2,1):C.R2GC_125_17,(6,2,0):C.R2GC_127_20,(6,2,1):C.R2GC_95_44,(7,2,0):C.R2GC_123_12,(7,2,1):C.R2GC_123_13,(5,2,0):C.R2GC_89_38,(5,2,1):C.R2GC_89_39,(1,2,0):C.R2GC_89_38,(1,2,1):C.R2GC_89_39,(11,2,0):C.R2GC_93_43,(11,2,1):C.R2GC_103_3,(10,2,0):C.R2GC_93_43,(10,2,1):C.R2GC_103_3,(9,2,1):C.R2GC_92_42})

V_3 = CTVertex(name = 'V_3',
               type = 'R2',
               particles = [ P.P__tilde__chi, P.t, P.P__tilde__ST__tilde__ ],
               color = [ 'Identity(2,3)' ],
               lorentz = [ L.FFS1 ],
               loop_particles = [ [ [P.g, P.P__tilde__ST, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_139_35})

V_4 = CTVertex(name = 'V_4',
               type = 'R2',
               particles = [ P.t__tilde__, P.P__tilde__chi, P.P__tilde__ST ],
               color = [ 'Identity(1,3)' ],
               lorentz = [ L.FFS2 ],
               loop_particles = [ [ [P.g, P.P__tilde__ST, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_139_35})

V_5 = CTVertex(name = 'V_5',
               type = 'R2',
               particles = [ P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
               color = [ 'T(1,3,2)' ],
               lorentz = [ L.VSS1, L.VSS2 ],
               loop_particles = [ [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
               couplings = {(0,0,1):C.R2GC_136_28,(0,0,0):C.R2GC_136_29,(0,1,1):C.R2GC_135_26,(0,1,0):C.R2GC_135_27})

V_6 = CTVertex(name = 'V_6',
               type = 'R2',
               particles = [ P.g, P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
               color = [ 'Identity(1,2)*Identity(3,4)', 'T(1,-1,3)*T(2,4,-1)', 'T(1,4,-1)*T(2,-1,3)' ],
               lorentz = [ L.VVSS1 ],
               loop_particles = [ [ [P.g] ], [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
               couplings = {(2,0,0):C.R2GC_137_30,(2,0,2):C.R2GC_137_31,(2,0,1):C.R2GC_137_32,(1,0,0):C.R2GC_137_30,(1,0,2):C.R2GC_137_31,(1,0,1):C.R2GC_137_32,(0,0,0):C.R2GC_103_3,(0,0,1):C.R2GC_103_4})

V_7 = CTVertex(name = 'V_7',
               type = 'R2',
               particles = [ P.u__tilde__, P.u, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.g, P.u] ] ],
               couplings = {(0,0,0):C.R2GC_100_1})

V_8 = CTVertex(name = 'V_8',
               type = 'R2',
               particles = [ P.c__tilde__, P.c, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.c, P.g] ] ],
               couplings = {(0,0,0):C.R2GC_100_1})

V_9 = CTVertex(name = 'V_9',
               type = 'R2',
               particles = [ P.t__tilde__, P.t, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.g, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_100_1})

V_10 = CTVertex(name = 'V_10',
                type = 'R2',
                particles = [ P.d__tilde__, P.d, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_100_1})

V_11 = CTVertex(name = 'V_11',
                type = 'R2',
                particles = [ P.s__tilde__, P.s, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_100_1})

V_12 = CTVertex(name = 'V_12',
                type = 'R2',
                particles = [ P.b__tilde__, P.b, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_100_1})

V_13 = CTVertex(name = 'V_13',
                type = 'R2',
                particles = [ P.b__tilde__, P.b ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3, L.FF4, L.FF5 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_98_46,(0,2,0):C.R2GC_98_46,(0,1,0):C.R2GC_101_2,(0,3,0):C.R2GC_101_2})

V_14 = CTVertex(name = 'V_14',
                type = 'R2',
                particles = [ P.c__tilde__, P.c ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_101_2})

V_15 = CTVertex(name = 'V_15',
                type = 'R2',
                particles = [ P.d__tilde__, P.d ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_101_2})

V_16 = CTVertex(name = 'V_16',
                type = 'R2',
                particles = [ P.g, P.g ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VV1, L.VV2, L.VV3 ],
                loop_particles = [ [ [P.b] ], [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.g] ], [ [P.t] ] ],
                couplings = {(0,0,2):C.R2GC_111_7,(0,1,0):C.R2GC_82_36,(0,1,3):C.R2GC_82_37,(0,2,1):C.R2GC_110_5,(0,2,2):C.R2GC_110_6})

V_17 = CTVertex(name = 'V_17',
                type = 'R2',
                particles = [ P.s__tilde__, P.s ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_101_2})

V_18 = CTVertex(name = 'V_18',
                type = 'R2',
                particles = [ P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.SS1, L.SS2 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
                couplings = {(0,0,1):C.R2GC_138_33,(0,0,0):C.R2GC_138_34,(0,1,1):C.R2GC_134_24,(0,1,0):C.R2GC_134_25})

V_19 = CTVertex(name = 'V_19',
                type = 'R2',
                particles = [ P.t__tilde__, P.t ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3, L.FF4, L.FF5 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_131_23,(0,2,0):C.R2GC_131_23,(0,1,0):C.R2GC_101_2,(0,3,0):C.R2GC_101_2})

V_20 = CTVertex(name = 'V_20',
                type = 'R2',
                particles = [ P.u__tilde__, P.u ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_101_2})

V_21 = CTVertex(name = 'V_21',
                type = 'UV',
                particles = [ P.g, P.g, P.g ],
                color = [ 'f(1,2,3)' ],
                lorentz = [ L.VVV1, L.VVV2, L.VVV3, L.VVV4, L.VVV5, L.VVV6, L.VVV7, L.VVV8 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,0):C.UVGC_112_14,(0,0,1):C.UVGC_112_15,(0,0,2):C.UVGC_112_16,(0,0,3):C.UVGC_112_17,(0,0,4):C.UVGC_112_18,(0,0,5):C.UVGC_112_19,(0,1,0):C.UVGC_120_33,(0,1,1):C.UVGC_120_34,(0,1,2):C.UVGC_121_39,(0,1,3):C.UVGC_121_40,(0,1,4):C.UVGC_121_41,(0,1,5):C.UVGC_120_38,(0,3,0):C.UVGC_120_33,(0,3,1):C.UVGC_120_34,(0,3,2):C.UVGC_120_35,(0,3,3):C.UVGC_120_36,(0,3,4):C.UVGC_120_37,(0,3,5):C.UVGC_120_38,(0,5,0):C.UVGC_112_14,(0,5,1):C.UVGC_112_15,(0,5,2):C.UVGC_114_22,(0,5,3):C.UVGC_114_23,(0,5,4):C.UVGC_114_24,(0,5,5):C.UVGC_112_19,(0,6,0):C.UVGC_112_14,(0,6,1):C.UVGC_112_15,(0,6,2):C.UVGC_113_20,(0,6,3):C.UVGC_113_21,(0,6,4):C.UVGC_112_18,(0,6,5):C.UVGC_112_19,(0,7,0):C.UVGC_120_33,(0,7,1):C.UVGC_120_34,(0,7,2):C.UVGC_122_42,(0,7,3):C.UVGC_122_43,(0,7,4):C.UVGC_121_41,(0,7,5):C.UVGC_120_38,(0,2,2):C.UVGC_88_109,(0,2,3):C.UVGC_120_36,(0,4,2):C.UVGC_94_118,(0,4,3):C.UVGC_112_17,(0,4,4):C.UVGC_94_119})

V_22 = CTVertex(name = 'V_22',
                type = 'UV',
                particles = [ P.g, P.g, P.g, P.g ],
                color = [ 'd(-1,1,3)*d(-1,2,4)', 'd(-1,1,3)*f(-1,2,4)', 'd(-1,1,4)*d(-1,2,3)', 'd(-1,1,4)*f(-1,2,3)', 'd(-1,2,3)*f(-1,1,4)', 'd(-1,2,4)*f(-1,1,3)', 'f(-1,1,2)*f(-1,3,4)', 'f(-1,1,3)*f(-1,2,4)', 'f(-1,1,4)*f(-1,2,3)', 'Identity(1,2)*Identity(3,4)', 'Identity(1,3)*Identity(2,4)', 'Identity(1,4)*Identity(2,3)' ],
                lorentz = [ L.VVVV1, L.VVVV2, L.VVVV3 ],
                loop_particles = [ [ [P.b] ], [ [P.b], [P.c], [P.d], [P.s], [P.P__tilde__ST], [P.t], [P.u] ], [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(2,0,4):C.UVGC_90_113,(2,0,5):C.UVGC_90_112,(0,0,4):C.UVGC_90_113,(0,0,5):C.UVGC_90_112,(6,0,0):C.UVGC_126_58,(6,0,3):C.UVGC_126_59,(6,0,4):C.UVGC_127_64,(6,0,5):C.UVGC_127_65,(6,0,6):C.UVGC_126_62,(6,0,7):C.UVGC_126_63,(4,0,4):C.UVGC_89_110,(4,0,5):C.UVGC_89_111,(3,0,4):C.UVGC_89_110,(3,0,5):C.UVGC_89_111,(8,0,4):C.UVGC_90_112,(8,0,5):C.UVGC_90_113,(7,0,0):C.UVGC_126_58,(7,0,3):C.UVGC_126_59,(7,0,4):C.UVGC_126_60,(7,0,5):C.UVGC_126_61,(7,0,6):C.UVGC_126_62,(7,0,7):C.UVGC_126_63,(5,0,4):C.UVGC_89_110,(5,0,5):C.UVGC_89_111,(1,0,4):C.UVGC_89_110,(1,0,5):C.UVGC_89_111,(11,0,4):C.UVGC_93_116,(11,0,5):C.UVGC_93_117,(10,0,4):C.UVGC_93_116,(10,0,5):C.UVGC_93_117,(9,0,4):C.UVGC_92_114,(9,0,5):C.UVGC_92_115,(2,1,4):C.UVGC_90_113,(2,1,5):C.UVGC_90_112,(0,1,4):C.UVGC_90_113,(0,1,5):C.UVGC_90_112,(4,1,4):C.UVGC_89_110,(4,1,5):C.UVGC_89_111,(3,1,4):C.UVGC_89_110,(3,1,5):C.UVGC_89_111,(8,1,0):C.UVGC_128_66,(8,1,3):C.UVGC_128_67,(8,1,4):C.UVGC_128_68,(8,1,5):C.UVGC_128_69,(8,1,6):C.UVGC_128_70,(8,1,7):C.UVGC_128_71,(6,1,0):C.UVGC_123_44,(6,1,4):C.UVGC_124_49,(6,1,5):C.UVGC_124_50,(6,1,6):C.UVGC_124_51,(6,1,7):C.UVGC_123_48,(7,1,1):C.UVGC_95_120,(7,1,4):C.UVGC_96_123,(7,1,5):C.UVGC_96_124,(5,1,4):C.UVGC_89_110,(5,1,5):C.UVGC_89_111,(1,1,4):C.UVGC_89_110,(1,1,5):C.UVGC_89_111,(11,1,4):C.UVGC_93_116,(11,1,5):C.UVGC_93_117,(10,1,4):C.UVGC_93_116,(10,1,5):C.UVGC_93_117,(9,1,4):C.UVGC_92_114,(9,1,5):C.UVGC_92_115,(2,2,4):C.UVGC_90_113,(2,2,5):C.UVGC_90_112,(0,2,4):C.UVGC_90_113,(0,2,5):C.UVGC_90_112,(4,2,4):C.UVGC_89_110,(4,2,5):C.UVGC_89_111,(3,2,4):C.UVGC_89_110,(3,2,5):C.UVGC_89_111,(8,2,0):C.UVGC_125_52,(8,2,3):C.UVGC_125_53,(8,2,4):C.UVGC_125_54,(8,2,5):C.UVGC_125_55,(8,2,6):C.UVGC_125_56,(8,2,7):C.UVGC_125_57,(6,2,2):C.UVGC_95_120,(6,2,4):C.UVGC_95_121,(6,2,5):C.UVGC_92_114,(6,2,6):C.UVGC_95_122,(7,2,0):C.UVGC_123_44,(7,2,4):C.UVGC_123_45,(7,2,5):C.UVGC_123_46,(7,2,6):C.UVGC_123_47,(7,2,7):C.UVGC_123_48,(5,2,4):C.UVGC_89_110,(5,2,5):C.UVGC_89_111,(1,2,4):C.UVGC_89_110,(1,2,5):C.UVGC_89_111,(11,2,4):C.UVGC_93_116,(11,2,5):C.UVGC_93_117,(10,2,4):C.UVGC_93_116,(10,2,5):C.UVGC_93_117,(9,2,4):C.UVGC_92_114,(9,2,5):C.UVGC_92_115})

V_23 = CTVertex(name = 'V_23',
                type = 'UV',
                particles = [ P.P__tilde__chi, P.t, P.P__tilde__ST__tilde__ ],
                color = [ 'Identity(2,3)' ],
                lorentz = [ L.FFS1 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST], [P.g, P.P__tilde__ST, P.t] ], [ [P.g, P.t] ], [ [P.P__tilde__chi, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ], [ [P.P__tilde__ST, P.t] ] ],
                couplings = {(0,0,2):C.UVGC_139_100,(0,0,3):C.UVGC_139_101,(0,0,0):C.UVGC_139_102,(0,0,1):C.UVGC_139_103,(0,0,4):C.UVGC_142_106})

V_24 = CTVertex(name = 'V_24',
                type = 'UV',
                particles = [ P.t__tilde__, P.P__tilde__chi, P.P__tilde__ST ],
                color = [ 'Identity(1,3)' ],
                lorentz = [ L.FFS2 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST], [P.g, P.P__tilde__ST, P.t] ], [ [P.g, P.t] ], [ [P.P__tilde__chi, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
                couplings = {(0,0,2):C.UVGC_139_100,(0,0,3):C.UVGC_139_101,(0,0,0):C.UVGC_139_102,(0,0,1):C.UVGC_139_103})

V_25 = CTVertex(name = 'V_25',
                type = 'UV',
                particles = [ P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'T(1,3,2)' ],
                lorentz = [ L.VSS1, L.VSS2 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,0):C.UVGC_136_83,(0,0,1):C.UVGC_136_84,(0,0,2):C.UVGC_136_85,(0,0,3):C.UVGC_136_86,(0,0,6):C.UVGC_136_87,(0,0,7):C.UVGC_136_88,(0,0,5):C.UVGC_136_89,(0,0,4):C.UVGC_136_90,(0,1,0):C.UVGC_115_25,(0,1,1):C.UVGC_115_26,(0,1,2):C.UVGC_115_27,(0,1,3):C.UVGC_115_28,(0,1,6):C.UVGC_115_29,(0,1,7):C.UVGC_115_30,(0,1,5):C.UVGC_135_81,(0,1,4):C.UVGC_135_82})

V_26 = CTVertex(name = 'V_26',
                type = 'UV',
                particles = [ P.g, P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'Identity(1,2)*Identity(3,4)', 'T(1,-1,3)*T(2,4,-1)', 'T(1,4,-1)*T(2,-1,3)' ],
                lorentz = [ L.VVSS1 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(2,0,0):C.UVGC_137_91,(2,0,1):C.UVGC_126_59,(2,0,2):C.UVGC_137_92,(2,0,3):C.UVGC_137_93,(2,0,6):C.UVGC_137_94,(2,0,7):C.UVGC_137_95,(2,0,5):C.UVGC_137_96,(2,0,4):C.UVGC_137_97,(1,0,0):C.UVGC_137_91,(1,0,1):C.UVGC_126_59,(1,0,2):C.UVGC_137_92,(1,0,3):C.UVGC_137_93,(1,0,6):C.UVGC_137_94,(1,0,7):C.UVGC_137_95,(1,0,5):C.UVGC_137_96,(1,0,4):C.UVGC_137_97,(0,0,2):C.UVGC_103_3,(0,0,4):C.UVGC_103_4})

V_27 = CTVertex(name = 'V_27',
                type = 'UV',
                particles = [ P.u__tilde__, P.u, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.u] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,4):C.UVGC_100_1,(0,1,0):C.UVGC_115_25,(0,1,1):C.UVGC_115_26,(0,1,2):C.UVGC_115_27,(0,1,3):C.UVGC_115_28,(0,1,5):C.UVGC_115_29,(0,1,6):C.UVGC_115_30,(0,1,4):C.UVGC_115_31,(0,2,0):C.UVGC_115_25,(0,2,1):C.UVGC_115_26,(0,2,2):C.UVGC_115_27,(0,2,3):C.UVGC_115_28,(0,2,5):C.UVGC_115_29,(0,2,6):C.UVGC_115_30,(0,2,4):C.UVGC_115_31})

V_28 = CTVertex(name = 'V_28',
                type = 'UV',
                particles = [ P.c__tilde__, P.c, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.c, P.g] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,2):C.UVGC_100_1,(0,1,0):C.UVGC_115_25,(0,1,1):C.UVGC_115_26,(0,1,3):C.UVGC_115_27,(0,1,4):C.UVGC_115_28,(0,1,5):C.UVGC_115_29,(0,1,6):C.UVGC_115_30,(0,1,2):C.UVGC_115_31,(0,2,0):C.UVGC_115_25,(0,2,1):C.UVGC_115_26,(0,2,3):C.UVGC_115_27,(0,2,4):C.UVGC_115_28,(0,2,5):C.UVGC_115_29,(0,2,6):C.UVGC_115_30,(0,2,2):C.UVGC_115_31})

V_29 = CTVertex(name = 'V_29',
                type = 'UV',
                particles = [ P.t__tilde__, P.t, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.t] ], [ [P.P__tilde__chi, P.P__tilde__ST] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,4):C.UVGC_100_1,(0,1,0):C.UVGC_115_25,(0,1,1):C.UVGC_115_26,(0,1,2):C.UVGC_115_27,(0,1,3):C.UVGC_115_28,(0,1,6):C.UVGC_115_29,(0,1,7):C.UVGC_115_30,(0,1,5):C.UVGC_130_74,(0,1,4):C.UVGC_130_75,(0,2,0):C.UVGC_115_25,(0,2,1):C.UVGC_115_26,(0,2,2):C.UVGC_115_27,(0,2,3):C.UVGC_115_28,(0,2,6):C.UVGC_115_29,(0,2,7):C.UVGC_115_30,(0,2,5):C.UVGC_133_79,(0,2,4):C.UVGC_130_75})

V_30 = CTVertex(name = 'V_30',
                type = 'UV',
                particles = [ P.d__tilde__, P.d, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.d, P.g] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,2):C.UVGC_100_1,(0,1,0):C.UVGC_115_25,(0,1,1):C.UVGC_115_26,(0,1,3):C.UVGC_115_27,(0,1,4):C.UVGC_115_28,(0,1,5):C.UVGC_115_29,(0,1,6):C.UVGC_115_30,(0,1,2):C.UVGC_115_31,(0,2,0):C.UVGC_115_25,(0,2,1):C.UVGC_115_26,(0,2,3):C.UVGC_115_27,(0,2,4):C.UVGC_115_28,(0,2,5):C.UVGC_115_29,(0,2,6):C.UVGC_115_30,(0,2,2):C.UVGC_115_31})

V_31 = CTVertex(name = 'V_31',
                type = 'UV',
                particles = [ P.s__tilde__, P.s, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.s] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,4):C.UVGC_100_1,(0,1,0):C.UVGC_115_25,(0,1,1):C.UVGC_115_26,(0,1,2):C.UVGC_115_27,(0,1,3):C.UVGC_115_28,(0,1,5):C.UVGC_115_29,(0,1,6):C.UVGC_115_30,(0,1,4):C.UVGC_115_31,(0,2,0):C.UVGC_115_25,(0,2,1):C.UVGC_115_26,(0,2,2):C.UVGC_115_27,(0,2,3):C.UVGC_115_28,(0,2,5):C.UVGC_115_29,(0,2,6):C.UVGC_115_30,(0,2,4):C.UVGC_115_31})

V_32 = CTVertex(name = 'V_32',
                type = 'UV',
                particles = [ P.b__tilde__, P.b, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.b, P.g] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,1):C.UVGC_100_1,(0,1,0):C.UVGC_115_25,(0,1,2):C.UVGC_115_26,(0,1,3):C.UVGC_115_27,(0,1,4):C.UVGC_115_28,(0,1,5):C.UVGC_115_29,(0,1,6):C.UVGC_115_30,(0,1,1):C.UVGC_119_32,(0,2,0):C.UVGC_115_25,(0,2,2):C.UVGC_115_26,(0,2,3):C.UVGC_115_27,(0,2,4):C.UVGC_115_28,(0,2,5):C.UVGC_115_29,(0,2,6):C.UVGC_115_30,(0,2,1):C.UVGC_119_32})

V_33 = CTVertex(name = 'V_33',
                type = 'UV',
                particles = [ P.b__tilde__, P.b ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3, L.FF4, L.FF5 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_98_125,(0,2,0):C.UVGC_98_125,(0,1,0):C.UVGC_109_5,(0,3,0):C.UVGC_109_5})

V_34 = CTVertex(name = 'V_34',
                type = 'UV',
                particles = [ P.c__tilde__, P.c ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF3, L.FF5 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_101_2,(0,1,0):C.UVGC_83_107,(0,2,0):C.UVGC_83_107})

V_35 = CTVertex(name = 'V_35',
                type = 'UV',
                particles = [ P.d__tilde__, P.d ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF3, L.FF5 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_101_2,(0,1,0):C.UVGC_83_107,(0,2,0):C.UVGC_83_107})

V_36 = CTVertex(name = 'V_36',
                type = 'UV',
                particles = [ P.g, P.g ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VV1, L.VV3 ],
                loop_particles = [ [ [P.b] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,0):C.UVGC_111_9,(0,0,1):C.UVGC_111_10,(0,0,2):C.UVGC_111_11,(0,0,3):C.UVGC_111_12,(0,0,4):C.UVGC_111_13,(0,1,0):C.UVGC_110_6,(0,1,3):C.UVGC_110_7,(0,1,4):C.UVGC_110_8})

V_37 = CTVertex(name = 'V_37',
                type = 'UV',
                particles = [ P.s__tilde__, P.s ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF3, L.FF5 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.UVGC_101_2,(0,1,0):C.UVGC_83_107,(0,2,0):C.UVGC_83_107})

V_38 = CTVertex(name = 'V_38',
                type = 'UV',
                particles = [ P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.SS1, L.SS2 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
                couplings = {(0,0,1):C.UVGC_138_98,(0,0,0):C.UVGC_138_99,(0,1,1):C.UVGC_134_80})

V_39 = CTVertex(name = 'V_39',
                type = 'UV',
                particles = [ P.t__tilde__, P.t ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3, L.FF4, L.FF5 ],
                loop_particles = [ [ [P.g, P.t] ], [ [P.P__tilde__chi, P.P__tilde__ST] ] ],
                couplings = {(0,0,1):C.UVGC_131_76,(0,0,0):C.UVGC_131_77,(0,2,1):C.UVGC_131_76,(0,2,0):C.UVGC_131_77,(0,1,1):C.UVGC_129_72,(0,1,0):C.UVGC_129_73,(0,3,1):C.UVGC_132_78,(0,3,0):C.UVGC_129_73})

V_40 = CTVertex(name = 'V_40',
                type = 'UV',
                particles = [ P.u__tilde__, P.u ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF3, L.FF5 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.UVGC_101_2,(0,1,0):C.UVGC_83_107,(0,2,0):C.UVGC_83_107})

V_41 = CTVertex(name = 'V_41',
                type = 'UV',
                particles = [ P.P__tilde__chi, P.P__tilde__chi ],
                color = [ '1' ],
                lorentz = [ L.FF1, L.FF2, L.FF3, L.FF4, L.FF5 ],
                loop_particles = [ [ [P.P__tilde__ST, P.t] ] ],
                couplings = {(0,1,0):C.UVGC_141_105,(0,3,0):C.UVGC_141_105,(0,2,0):C.UVGC_140_104,(0,4,0):C.UVGC_140_104,(0,0,0):C.UVGC_86_108})

