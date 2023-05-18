# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 12.1.0 for Linux x86 (64-bit) (March 18, 2020)
# Date: Tue 16 May 2023 14:12:34


from object_library import all_vertices, all_CTvertices, Vertex, CTVertex
import particles as P
import CT_couplings as C
import lorentz as L


V_1 = CTVertex(name = 'V_1',
               type = 'R2',
               particles = [ P.g, P.g, P.g ],
               color = [ 'f(1,2,3)' ],
               lorentz = [ L.VVV2 ],
               loop_particles = [ [ [P.g] ], [ [P.t], [P.u] ] ],
               couplings = {(0,0,0):C.R2GC_33_27,(0,0,1):C.R2GC_33_28})

V_2 = CTVertex(name = 'V_2',
               type = 'R2',
               particles = [ P.g, P.g, P.g, P.g ],
               color = [ 'd(-1,1,3)*d(-1,2,4)', 'd(-1,1,3)*f(-1,2,4)', 'd(-1,1,4)*d(-1,2,3)', 'd(-1,1,4)*f(-1,2,3)', 'd(-1,2,3)*f(-1,1,4)', 'd(-1,2,4)*f(-1,1,3)', 'f(-1,1,2)*f(-1,3,4)', 'f(-1,1,3)*f(-1,2,4)', 'f(-1,1,4)*f(-1,2,3)', 'Identity(1,2)*Identity(3,4)', 'Identity(1,3)*Identity(2,4)', 'Identity(1,4)*Identity(2,3)' ],
               lorentz = [ L.VVVV1, L.VVVV2, L.VVVV4, L.VVVV7 ],
               loop_particles = [ [ [P.g] ], [ [P.t], [P.u] ] ],
               couplings = {(0,0,0):C.R2GC_13_5,(0,0,1):C.R2GC_13_6,(2,0,0):C.R2GC_13_5,(2,0,1):C.R2GC_13_6,(6,0,0):C.R2GC_44_42,(6,0,1):C.R2GC_16_11,(7,0,0):C.R2GC_43_41,(7,0,1):C.R2GC_17_13,(5,0,0):C.R2GC_11_1,(5,0,1):C.R2GC_11_2,(1,0,0):C.R2GC_11_1,(1,0,1):C.R2GC_11_2,(4,0,0):C.R2GC_11_1,(4,0,1):C.R2GC_11_2,(3,0,0):C.R2GC_11_1,(3,0,1):C.R2GC_11_2,(8,0,0):C.R2GC_12_3,(8,0,1):C.R2GC_12_4,(11,3,0):C.R2GC_15_8,(11,3,1):C.R2GC_15_9,(10,3,0):C.R2GC_15_8,(10,3,1):C.R2GC_15_9,(9,3,0):C.R2GC_14_7,(0,1,0):C.R2GC_13_5,(0,1,1):C.R2GC_13_6,(2,1,0):C.R2GC_13_5,(2,1,1):C.R2GC_13_6,(6,1,0):C.R2GC_41_38,(6,1,1):C.R2GC_41_39,(7,1,0):C.R2GC_17_12,(7,1,1):C.R2GC_17_13,(8,1,0):C.R2GC_42_40,(8,1,1):C.R2GC_12_4,(5,1,0):C.R2GC_11_1,(5,1,1):C.R2GC_11_2,(1,1,0):C.R2GC_11_1,(1,1,1):C.R2GC_11_2,(4,1,0):C.R2GC_11_1,(4,1,1):C.R2GC_11_2,(3,1,0):C.R2GC_11_1,(3,1,1):C.R2GC_11_2,(0,2,0):C.R2GC_13_5,(0,2,1):C.R2GC_13_6,(2,2,0):C.R2GC_13_5,(2,2,1):C.R2GC_13_6,(6,2,0):C.R2GC_16_10,(6,2,1):C.R2GC_16_11,(7,2,0):C.R2GC_13_5,(7,2,1):C.R2GC_40_37,(8,2,0):C.R2GC_39_36,(8,2,1):C.R2GC_12_4,(5,2,0):C.R2GC_11_1,(5,2,1):C.R2GC_11_2,(1,2,0):C.R2GC_11_1,(1,2,1):C.R2GC_11_2,(4,2,0):C.R2GC_11_1,(4,2,1):C.R2GC_11_2,(3,2,0):C.R2GC_11_1,(3,2,1):C.R2GC_11_2})

V_3 = CTVertex(name = 'V_3',
               type = 'R2',
               particles = [ P.P__tilde__chi, P.t, P.P__tilde__ST__tilde__ ],
               color = [ 'Identity(2,3)' ],
               lorentz = [ L.FFS1 ],
               loop_particles = [ [ [P.g, P.P__tilde__ST, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_27_23})

V_4 = CTVertex(name = 'V_4',
               type = 'R2',
               particles = [ P.t__tilde__, P.P__tilde__chi, P.P__tilde__ST ],
               color = [ 'Identity(1,3)' ],
               lorentz = [ L.FFS2 ],
               loop_particles = [ [ [P.g, P.P__tilde__ST, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_27_23})

V_5 = CTVertex(name = 'V_5',
               type = 'R2',
               particles = [ P.t__tilde__, P.t, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.g, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_19_15})

V_6 = CTVertex(name = 'V_6',
               type = 'R2',
               particles = [ P.u__tilde__, P.u, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.g, P.u] ] ],
               couplings = {(0,0,0):C.R2GC_19_15})

V_7 = CTVertex(name = 'V_7',
               type = 'R2',
               particles = [ P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
               color = [ 'T(1,3,2)' ],
               lorentz = [ L.VSS1, L.VSS2 ],
               loop_particles = [ [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
               couplings = {(0,0,1):C.R2GC_34_29,(0,0,0):C.R2GC_34_30,(0,1,1):C.R2GC_37_31,(0,1,0):C.R2GC_37_32})

V_8 = CTVertex(name = 'V_8',
               type = 'R2',
               particles = [ P.g, P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
               color = [ 'Identity(1,2)*Identity(3,4)', 'T(1,-1,3)*T(2,4,-1)', 'T(1,4,-1)*T(2,-1,3)' ],
               lorentz = [ L.VVSS1 ],
               loop_particles = [ [ [P.g] ], [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
               couplings = {(2,0,0):C.R2GC_38_33,(2,0,2):C.R2GC_38_34,(2,0,1):C.R2GC_38_35,(1,0,0):C.R2GC_38_33,(1,0,2):C.R2GC_38_34,(1,0,1):C.R2GC_38_35,(0,0,0):C.R2GC_15_8,(0,0,1):C.R2GC_18_14})

V_9 = CTVertex(name = 'V_9',
               type = 'R2',
               particles = [ P.g, P.g ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.VV1, L.VV2, L.VV3 ],
               loop_particles = [ [ [P.g] ], [ [P.t] ], [ [P.t], [P.u] ], [ [P.u] ] ],
               couplings = {(0,0,0):C.R2GC_32_26,(0,1,1):C.R2GC_6_43,(0,1,3):C.R2GC_6_44,(0,2,0):C.R2GC_31_24,(0,2,2):C.R2GC_31_25})

V_10 = CTVertex(name = 'V_10',
                type = 'R2',
                particles = [ P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.SS1, L.SS2 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
                couplings = {(0,0,1):C.R2GC_26_21,(0,0,0):C.R2GC_26_22,(0,1,1):C.R2GC_25_19,(0,1,0):C.R2GC_25_20})

V_11 = CTVertex(name = 'V_11',
                type = 'R2',
                particles = [ P.t__tilde__, P.t ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3, L.FF4, L.FF6 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_23_18,(0,2,0):C.R2GC_23_18,(0,1,0):C.R2GC_22_17,(0,3,0):C.R2GC_22_17})

V_12 = CTVertex(name = 'V_12',
                type = 'R2',
                particles = [ P.u__tilde__, P.u ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF5, L.FF7 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_21_16,(0,1,0):C.R2GC_22_17})

V_13 = CTVertex(name = 'V_13',
                type = 'UV',
                particles = [ P.g, P.g, P.g ],
                color = [ 'f(1,2,3)' ],
                lorentz = [ L.VVV1, L.VVV2, L.VVV3, L.VVV4 ],
                loop_particles = [ [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ], [ [P.u] ] ],
                couplings = {(0,1,2):C.UVGC_33_42,(0,1,3):C.UVGC_33_43,(0,1,4):C.UVGC_33_44,(0,3,0):C.UVGC_7_96,(0,0,1):C.UVGC_8_97,(0,2,2):C.UVGC_9_98})

V_14 = CTVertex(name = 'V_14',
                type = 'UV',
                particles = [ P.g, P.g, P.g, P.g ],
                color = [ 'd(-1,1,3)*d(-1,2,4)', 'd(-1,1,3)*f(-1,2,4)', 'd(-1,1,4)*d(-1,2,3)', 'd(-1,1,4)*f(-1,2,3)', 'd(-1,2,3)*f(-1,1,4)', 'd(-1,2,4)*f(-1,1,3)', 'f(-1,1,2)*f(-1,3,4)', 'f(-1,1,3)*f(-1,2,4)', 'f(-1,1,4)*f(-1,2,3)', 'Identity(1,2)*Identity(3,4)', 'Identity(1,3)*Identity(2,4)', 'Identity(1,4)*Identity(2,3)' ],
                lorentz = [ L.VVVV1, L.VVVV2, L.VVVV4, L.VVVV7 ],
                loop_particles = [ [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.P__tilde__ST], [P.t], [P.u] ], [ [P.t] ], [ [P.t], [P.u] ], [ [P.u] ] ],
                couplings = {(0,0,0):C.UVGC_12_5,(0,0,1):C.UVGC_12_4,(2,0,0):C.UVGC_12_5,(2,0,1):C.UVGC_12_4,(6,0,0):C.UVGC_44_92,(6,0,1):C.UVGC_44_93,(6,0,2):C.UVGC_43_89,(6,0,4):C.UVGC_43_90,(6,0,6):C.UVGC_43_91,(7,0,0):C.UVGC_43_87,(7,0,1):C.UVGC_43_88,(7,0,2):C.UVGC_43_89,(7,0,4):C.UVGC_43_90,(7,0,6):C.UVGC_43_91,(5,0,0):C.UVGC_11_2,(5,0,1):C.UVGC_11_3,(1,0,0):C.UVGC_11_2,(1,0,1):C.UVGC_11_3,(4,0,0):C.UVGC_11_2,(4,0,1):C.UVGC_11_3,(3,0,0):C.UVGC_11_2,(3,0,1):C.UVGC_11_3,(8,0,0):C.UVGC_12_4,(8,0,1):C.UVGC_12_5,(11,3,0):C.UVGC_15_8,(11,3,1):C.UVGC_15_9,(10,3,0):C.UVGC_15_8,(10,3,1):C.UVGC_15_9,(9,3,0):C.UVGC_14_6,(9,3,1):C.UVGC_14_7,(0,1,0):C.UVGC_12_5,(0,1,1):C.UVGC_12_4,(2,1,0):C.UVGC_12_5,(2,1,1):C.UVGC_12_4,(6,1,0):C.UVGC_41_79,(6,1,1):C.UVGC_41_80,(6,1,2):C.UVGC_41_81,(6,1,4):C.UVGC_40_77,(6,1,6):C.UVGC_40_78,(7,1,0):C.UVGC_17_13,(7,1,1):C.UVGC_17_14,(7,1,3):C.UVGC_16_12,(8,1,0):C.UVGC_42_82,(8,1,1):C.UVGC_42_83,(8,1,2):C.UVGC_42_84,(8,1,4):C.UVGC_42_85,(8,1,6):C.UVGC_42_86,(5,1,0):C.UVGC_11_2,(5,1,1):C.UVGC_11_3,(1,1,0):C.UVGC_11_2,(1,1,1):C.UVGC_11_3,(4,1,0):C.UVGC_11_2,(4,1,1):C.UVGC_11_3,(3,1,0):C.UVGC_11_2,(3,1,1):C.UVGC_11_3,(0,2,0):C.UVGC_12_5,(0,2,1):C.UVGC_12_4,(2,2,0):C.UVGC_12_5,(2,2,1):C.UVGC_12_4,(6,2,0):C.UVGC_16_10,(6,2,1):C.UVGC_14_6,(6,2,2):C.UVGC_16_11,(6,2,5):C.UVGC_16_12,(7,2,0):C.UVGC_40_74,(7,2,1):C.UVGC_40_75,(7,2,2):C.UVGC_40_76,(7,2,4):C.UVGC_40_77,(7,2,6):C.UVGC_40_78,(8,2,0):C.UVGC_39_69,(8,2,1):C.UVGC_39_70,(8,2,2):C.UVGC_39_71,(8,2,4):C.UVGC_39_72,(8,2,6):C.UVGC_39_73,(5,2,0):C.UVGC_11_2,(5,2,1):C.UVGC_11_3,(1,2,0):C.UVGC_11_2,(1,2,1):C.UVGC_11_3,(4,2,0):C.UVGC_11_2,(4,2,1):C.UVGC_11_3,(3,2,0):C.UVGC_11_2,(3,2,1):C.UVGC_11_3})

V_15 = CTVertex(name = 'V_15',
                type = 'UV',
                particles = [ P.P__tilde__chi, P.t, P.P__tilde__ST__tilde__ ],
                color = [ 'Identity(2,3)' ],
                lorentz = [ L.FFS1 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST], [P.g, P.P__tilde__ST, P.t] ], [ [P.g, P.t] ], [ [P.P__tilde__chi, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ], [ [P.P__tilde__ST, P.t] ] ],
                couplings = {(0,0,2):C.UVGC_27_27,(0,0,3):C.UVGC_27_28,(0,0,0):C.UVGC_27_29,(0,0,1):C.UVGC_27_30,(0,0,4):C.UVGC_30_33})

V_16 = CTVertex(name = 'V_16',
                type = 'UV',
                particles = [ P.t__tilde__, P.P__tilde__chi, P.P__tilde__ST ],
                color = [ 'Identity(1,3)' ],
                lorentz = [ L.FFS2 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST], [P.g, P.P__tilde__ST, P.t] ], [ [P.g, P.t] ], [ [P.P__tilde__chi, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
                couplings = {(0,0,2):C.UVGC_27_27,(0,0,3):C.UVGC_27_28,(0,0,0):C.UVGC_27_29,(0,0,1):C.UVGC_27_30})

V_17 = CTVertex(name = 'V_17',
                type = 'UV',
                particles = [ P.t__tilde__, P.t, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.g] ], [ [P.ghG] ], [ [P.g, P.t] ], [ [P.P__tilde__chi, P.P__tilde__ST] ], [ [P.P__tilde__ST] ], [ [P.t] ], [ [P.u] ] ],
                couplings = {(0,0,2):C.UVGC_19_17,(0,1,0):C.UVGC_35_52,(0,1,1):C.UVGC_35_53,(0,1,4):C.UVGC_35_54,(0,1,5):C.UVGC_35_55,(0,1,6):C.UVGC_35_56,(0,1,3):C.UVGC_35_57,(0,1,2):C.UVGC_35_58,(0,2,0):C.UVGC_35_52,(0,2,1):C.UVGC_35_53,(0,2,4):C.UVGC_35_54,(0,2,5):C.UVGC_35_55,(0,2,6):C.UVGC_35_56,(0,2,3):C.UVGC_36_59,(0,2,2):C.UVGC_35_58})

V_18 = CTVertex(name = 'V_18',
                type = 'UV',
                particles = [ P.u__tilde__, P.u, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.g] ], [ [P.ghG] ], [ [P.g, P.u] ], [ [P.P__tilde__ST] ], [ [P.t] ], [ [P.u] ] ],
                couplings = {(0,0,2):C.UVGC_19_17,(0,1,0):C.UVGC_35_52,(0,1,1):C.UVGC_35_53,(0,1,3):C.UVGC_35_54,(0,1,4):C.UVGC_35_55,(0,1,5):C.UVGC_35_56,(0,1,2):C.UVGC_46_95,(0,2,0):C.UVGC_35_52,(0,2,1):C.UVGC_35_53,(0,2,3):C.UVGC_35_54,(0,2,4):C.UVGC_35_55,(0,2,5):C.UVGC_35_56,(0,2,2):C.UVGC_46_95})

V_19 = CTVertex(name = 'V_19',
                type = 'UV',
                particles = [ P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'T(1,3,2)' ],
                lorentz = [ L.VSS1, L.VSS2 ],
                loop_particles = [ [ [P.g] ], [ [P.ghG] ], [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ], [ [P.P__tilde__ST] ], [ [P.t] ], [ [P.u] ] ],
                couplings = {(0,0,0):C.UVGC_34_45,(0,0,1):C.UVGC_34_46,(0,0,4):C.UVGC_34_47,(0,0,5):C.UVGC_34_48,(0,0,6):C.UVGC_34_49,(0,0,3):C.UVGC_34_50,(0,0,2):C.UVGC_34_51,(0,1,0):C.UVGC_35_52,(0,1,1):C.UVGC_35_53,(0,1,4):C.UVGC_35_54,(0,1,5):C.UVGC_35_55,(0,1,6):C.UVGC_35_56,(0,1,3):C.UVGC_37_60,(0,1,2):C.UVGC_37_61})

V_20 = CTVertex(name = 'V_20',
                type = 'UV',
                particles = [ P.g, P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'Identity(1,2)*Identity(3,4)', 'T(1,-1,3)*T(2,4,-1)', 'T(1,4,-1)*T(2,-1,3)' ],
                lorentz = [ L.VVSS1 ],
                loop_particles = [ [ [P.g] ], [ [P.ghG] ], [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ], [ [P.P__tilde__ST] ], [ [P.t] ], [ [P.u] ] ],
                couplings = {(2,0,0):C.UVGC_38_62,(2,0,1):C.UVGC_38_63,(2,0,4):C.UVGC_38_64,(2,0,5):C.UVGC_38_65,(2,0,6):C.UVGC_38_66,(2,0,3):C.UVGC_38_67,(2,0,2):C.UVGC_38_68,(1,0,0):C.UVGC_38_62,(1,0,1):C.UVGC_38_63,(1,0,4):C.UVGC_38_64,(1,0,5):C.UVGC_38_65,(1,0,6):C.UVGC_38_66,(1,0,3):C.UVGC_38_67,(1,0,2):C.UVGC_38_68,(0,0,0):C.UVGC_18_15,(0,0,2):C.UVGC_18_16})

V_21 = CTVertex(name = 'V_21',
                type = 'UV',
                particles = [ P.g, P.g ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VV1, L.VV3 ],
                loop_particles = [ [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ], [ [P.u] ] ],
                couplings = {(0,0,0):C.UVGC_32_37,(0,0,1):C.UVGC_32_38,(0,0,2):C.UVGC_32_39,(0,0,3):C.UVGC_32_40,(0,0,4):C.UVGC_32_41,(0,1,2):C.UVGC_31_34,(0,1,3):C.UVGC_31_35,(0,1,4):C.UVGC_31_36})

V_22 = CTVertex(name = 'V_22',
                type = 'UV',
                particles = [ P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.SS1, L.SS2 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
                couplings = {(0,0,1):C.UVGC_26_25,(0,0,0):C.UVGC_26_26,(0,1,1):C.UVGC_25_24})

V_23 = CTVertex(name = 'V_23',
                type = 'UV',
                particles = [ P.t__tilde__, P.t ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3, L.FF4, L.FF6 ],
                loop_particles = [ [ [P.g, P.t] ], [ [P.P__tilde__chi, P.P__tilde__ST] ] ],
                couplings = {(0,0,1):C.UVGC_23_21,(0,0,0):C.UVGC_23_22,(0,2,1):C.UVGC_23_21,(0,2,0):C.UVGC_23_22,(0,1,1):C.UVGC_22_19,(0,1,0):C.UVGC_22_20,(0,3,1):C.UVGC_24_23,(0,3,0):C.UVGC_22_20})

V_24 = CTVertex(name = 'V_24',
                type = 'UV',
                particles = [ P.u__tilde__, P.u ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF5, L.FF7 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.UVGC_21_18,(0,1,0):C.UVGC_45_94})

V_25 = CTVertex(name = 'V_25',
                type = 'UV',
                particles = [ P.P__tilde__chi, P.P__tilde__chi ],
                color = [ '1' ],
                lorentz = [ L.FF1, L.FF5, L.FF7 ],
                loop_particles = [ [ [P.P__tilde__ST, P.t] ] ],
                couplings = {(0,1,0):C.UVGC_29_32,(0,2,0):C.UVGC_28_31,(0,0,0):C.UVGC_10_1})

