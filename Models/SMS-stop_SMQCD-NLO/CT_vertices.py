# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 12.1.0 for Linux x86 (64-bit) (March 18, 2020)
# Date: Tue 16 May 2023 14:59:22


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
               couplings = {(0,0,0):C.R2GC_38_21,(0,0,1):C.R2GC_38_22})

V_2 = CTVertex(name = 'V_2',
               type = 'R2',
               particles = [ P.g, P.g, P.g, P.g ],
               color = [ 'd(-1,1,3)*d(-1,2,4)', 'd(-1,1,3)*f(-1,2,4)', 'd(-1,1,4)*d(-1,2,3)', 'd(-1,1,4)*f(-1,2,3)', 'd(-1,2,3)*f(-1,1,4)', 'd(-1,2,4)*f(-1,1,3)', 'f(-1,1,2)*f(-1,3,4)', 'f(-1,1,3)*f(-1,2,4)', 'f(-1,1,4)*f(-1,2,3)', 'Identity(1,2)*Identity(3,4)', 'Identity(1,3)*Identity(2,4)', 'Identity(1,4)*Identity(2,3)' ],
               lorentz = [ L.VVVV1, L.VVVV2, L.VVVV4, L.VVVV7 ],
               loop_particles = [ [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.g] ] ],
               couplings = {(2,0,0):C.R2GC_19_5,(2,0,1):C.R2GC_19_6,(0,0,0):C.R2GC_19_5,(0,0,1):C.R2GC_19_6,(6,0,0):C.R2GC_22_10,(6,0,1):C.R2GC_48_28,(4,0,0):C.R2GC_17_1,(4,0,1):C.R2GC_17_2,(3,0,0):C.R2GC_17_1,(3,0,1):C.R2GC_17_2,(8,0,0):C.R2GC_18_3,(8,0,1):C.R2GC_18_4,(7,0,0):C.R2GC_23_12,(7,0,1):C.R2GC_47_27,(5,0,0):C.R2GC_17_1,(5,0,1):C.R2GC_17_2,(1,0,0):C.R2GC_17_1,(1,0,1):C.R2GC_17_2,(11,3,0):C.R2GC_21_8,(11,3,1):C.R2GC_21_9,(10,3,0):C.R2GC_21_8,(10,3,1):C.R2GC_21_9,(9,3,1):C.R2GC_20_7,(2,1,0):C.R2GC_19_5,(2,1,1):C.R2GC_19_6,(0,1,0):C.R2GC_19_5,(0,1,1):C.R2GC_19_6,(4,1,0):C.R2GC_17_1,(4,1,1):C.R2GC_17_2,(3,1,0):C.R2GC_17_1,(3,1,1):C.R2GC_17_2,(8,1,0):C.R2GC_18_3,(8,1,1):C.R2GC_49_29,(6,1,0):C.R2GC_45_24,(6,1,1):C.R2GC_45_25,(7,1,0):C.R2GC_23_12,(7,1,1):C.R2GC_23_13,(5,1,0):C.R2GC_17_1,(5,1,1):C.R2GC_17_2,(1,1,0):C.R2GC_17_1,(1,1,1):C.R2GC_17_2,(2,2,0):C.R2GC_19_5,(2,2,1):C.R2GC_19_6,(0,2,0):C.R2GC_19_5,(0,2,1):C.R2GC_19_6,(4,2,0):C.R2GC_17_1,(4,2,1):C.R2GC_17_2,(3,2,0):C.R2GC_17_1,(3,2,1):C.R2GC_17_2,(8,2,0):C.R2GC_18_3,(8,2,1):C.R2GC_46_26,(6,2,0):C.R2GC_22_10,(6,2,1):C.R2GC_22_11,(7,2,0):C.R2GC_44_23,(7,2,1):C.R2GC_19_6,(5,2,0):C.R2GC_17_1,(5,2,1):C.R2GC_17_2,(1,2,0):C.R2GC_17_1,(1,2,1):C.R2GC_17_2})

V_3 = CTVertex(name = 'V_3',
               type = 'R2',
               particles = [ P.P__tilde__chi, P.t, P.P__tilde__ST__tilde__ ],
               color = [ 'Identity(2,3)' ],
               lorentz = [ L.FFS1 ],
               loop_particles = [ [ [P.g, P.P__tilde__ST, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_60_42})

V_4 = CTVertex(name = 'V_4',
               type = 'R2',
               particles = [ P.t__tilde__, P.P__tilde__chi, P.P__tilde__ST ],
               color = [ 'Identity(1,3)' ],
               lorentz = [ L.FFS2 ],
               loop_particles = [ [ [P.g, P.P__tilde__ST, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_60_42})

V_5 = CTVertex(name = 'V_5',
               type = 'R2',
               particles = [ P.c__tilde__, P.c, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.c, P.g] ] ],
               couplings = {(0,0,0):C.R2GC_24_14})

V_6 = CTVertex(name = 'V_6',
               type = 'R2',
               particles = [ P.t__tilde__, P.t, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.g, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_24_14})

V_7 = CTVertex(name = 'V_7',
               type = 'R2',
               particles = [ P.u__tilde__, P.u, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.g, P.u] ] ],
               couplings = {(0,0,0):C.R2GC_24_14})

V_8 = CTVertex(name = 'V_8',
               type = 'R2',
               particles = [ P.b__tilde__, P.b, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.b, P.g] ] ],
               couplings = {(0,0,0):C.R2GC_24_14})

V_9 = CTVertex(name = 'V_9',
               type = 'R2',
               particles = [ P.d__tilde__, P.d, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.d, P.g] ] ],
               couplings = {(0,0,0):C.R2GC_24_14})

V_10 = CTVertex(name = 'V_10',
                type = 'R2',
                particles = [ P.s__tilde__, P.s, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_24_14})

V_11 = CTVertex(name = 'V_11',
                type = 'R2',
                particles = [ P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'T(1,3,2)' ],
                lorentz = [ L.VSS1, L.VSS2 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
                couplings = {(0,0,1):C.R2GC_57_35,(0,0,0):C.R2GC_57_36,(0,1,1):C.R2GC_56_33,(0,1,0):C.R2GC_56_34})

V_12 = CTVertex(name = 'V_12',
                type = 'R2',
                particles = [ P.g, P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'Identity(1,2)*Identity(3,4)', 'T(1,-1,3)*T(2,4,-1)', 'T(1,4,-1)*T(2,-1,3)' ],
                lorentz = [ L.VVSS1 ],
                loop_particles = [ [ [P.g] ], [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
                couplings = {(2,0,0):C.R2GC_58_37,(2,0,2):C.R2GC_58_38,(2,0,1):C.R2GC_58_39,(1,0,0):C.R2GC_58_37,(1,0,2):C.R2GC_58_38,(1,0,1):C.R2GC_58_39,(0,0,0):C.R2GC_21_9,(0,0,1):C.R2GC_28_16})

V_13 = CTVertex(name = 'V_13',
                type = 'R2',
                particles = [ P.b__tilde__, P.b ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3, L.FF4, L.FF5 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_35_17,(0,2,0):C.R2GC_35_17,(0,1,0):C.R2GC_25_15,(0,3,0):C.R2GC_25_15})

V_14 = CTVertex(name = 'V_14',
                type = 'R2',
                particles = [ P.c__tilde__, P.c ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_25_15})

V_15 = CTVertex(name = 'V_15',
                type = 'R2',
                particles = [ P.d__tilde__, P.d ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_25_15})

V_16 = CTVertex(name = 'V_16',
                type = 'R2',
                particles = [ P.g, P.g ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VV1, L.VV2, L.VV3 ],
                loop_particles = [ [ [P.b] ], [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.g] ], [ [P.t] ] ],
                couplings = {(0,0,2):C.R2GC_37_20,(0,1,0):C.R2GC_7_43,(0,1,3):C.R2GC_7_44,(0,2,1):C.R2GC_36_18,(0,2,2):C.R2GC_36_19})

V_17 = CTVertex(name = 'V_17',
                type = 'R2',
                particles = [ P.s__tilde__, P.s ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_25_15})

V_18 = CTVertex(name = 'V_18',
                type = 'R2',
                particles = [ P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.SS1, L.SS2 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
                couplings = {(0,0,1):C.R2GC_59_40,(0,0,0):C.R2GC_59_41,(0,1,1):C.R2GC_55_31,(0,1,0):C.R2GC_55_32})

V_19 = CTVertex(name = 'V_19',
                type = 'R2',
                particles = [ P.t__tilde__, P.t ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3, L.FF4, L.FF5 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_52_30,(0,2,0):C.R2GC_52_30,(0,1,0):C.R2GC_25_15,(0,3,0):C.R2GC_25_15})

V_20 = CTVertex(name = 'V_20',
                type = 'R2',
                particles = [ P.u__tilde__, P.u ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_25_15})

V_21 = CTVertex(name = 'V_21',
                type = 'UV',
                particles = [ P.g, P.g, P.g ],
                color = [ 'f(1,2,3)' ],
                lorentz = [ L.VVV1, L.VVV2, L.VVV3, L.VVV4 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,1,0):C.UVGC_38_31,(0,1,1):C.UVGC_38_32,(0,1,4):C.UVGC_38_33,(0,1,5):C.UVGC_38_34,(0,3,2):C.UVGC_8_106,(0,0,3):C.UVGC_9_107,(0,2,4):C.UVGC_10_1})

V_22 = CTVertex(name = 'V_22',
                type = 'UV',
                particles = [ P.g, P.g, P.g, P.g ],
                color = [ 'd(-1,1,3)*d(-1,2,4)', 'd(-1,1,3)*f(-1,2,4)', 'd(-1,1,4)*d(-1,2,3)', 'd(-1,1,4)*f(-1,2,3)', 'd(-1,2,3)*f(-1,1,4)', 'd(-1,2,4)*f(-1,1,3)', 'f(-1,1,2)*f(-1,3,4)', 'f(-1,1,3)*f(-1,2,4)', 'f(-1,1,4)*f(-1,2,3)', 'Identity(1,2)*Identity(3,4)', 'Identity(1,3)*Identity(2,4)', 'Identity(1,4)*Identity(2,3)' ],
                lorentz = [ L.VVVV1, L.VVVV2, L.VVVV4, L.VVVV7 ],
                loop_particles = [ [ [P.b] ], [ [P.b], [P.c], [P.d], [P.s], [P.P__tilde__ST], [P.t], [P.u] ], [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(2,0,4):C.UVGC_18_8,(2,0,5):C.UVGC_18_7,(0,0,4):C.UVGC_18_8,(0,0,5):C.UVGC_18_7,(6,0,0):C.UVGC_47_57,(6,0,3):C.UVGC_47_58,(6,0,4):C.UVGC_48_63,(6,0,5):C.UVGC_48_64,(6,0,6):C.UVGC_47_61,(6,0,7):C.UVGC_47_62,(4,0,4):C.UVGC_17_5,(4,0,5):C.UVGC_17_6,(3,0,4):C.UVGC_17_5,(3,0,5):C.UVGC_17_6,(8,0,4):C.UVGC_18_7,(8,0,5):C.UVGC_18_8,(7,0,0):C.UVGC_47_57,(7,0,3):C.UVGC_47_58,(7,0,4):C.UVGC_47_59,(7,0,5):C.UVGC_47_60,(7,0,6):C.UVGC_47_61,(7,0,7):C.UVGC_47_62,(5,0,4):C.UVGC_17_5,(5,0,5):C.UVGC_17_6,(1,0,4):C.UVGC_17_5,(1,0,5):C.UVGC_17_6,(11,3,4):C.UVGC_21_11,(11,3,5):C.UVGC_21_12,(10,3,4):C.UVGC_21_11,(10,3,5):C.UVGC_21_12,(9,3,4):C.UVGC_20_9,(9,3,5):C.UVGC_20_10,(2,1,4):C.UVGC_18_8,(2,1,5):C.UVGC_18_7,(0,1,4):C.UVGC_18_8,(0,1,5):C.UVGC_18_7,(4,1,4):C.UVGC_17_5,(4,1,5):C.UVGC_17_6,(3,1,4):C.UVGC_17_5,(3,1,5):C.UVGC_17_6,(8,1,0):C.UVGC_49_65,(8,1,3):C.UVGC_49_66,(8,1,4):C.UVGC_49_67,(8,1,5):C.UVGC_49_68,(8,1,6):C.UVGC_49_69,(8,1,7):C.UVGC_49_70,(6,1,0):C.UVGC_44_43,(6,1,4):C.UVGC_45_48,(6,1,5):C.UVGC_45_49,(6,1,6):C.UVGC_45_50,(6,1,7):C.UVGC_44_47,(7,1,1):C.UVGC_22_13,(7,1,4):C.UVGC_23_16,(7,1,5):C.UVGC_23_17,(5,1,4):C.UVGC_17_5,(5,1,5):C.UVGC_17_6,(1,1,4):C.UVGC_17_5,(1,1,5):C.UVGC_17_6,(2,2,4):C.UVGC_18_8,(2,2,5):C.UVGC_18_7,(0,2,4):C.UVGC_18_8,(0,2,5):C.UVGC_18_7,(4,2,4):C.UVGC_17_5,(4,2,5):C.UVGC_17_6,(3,2,4):C.UVGC_17_5,(3,2,5):C.UVGC_17_6,(8,2,0):C.UVGC_46_51,(8,2,3):C.UVGC_46_52,(8,2,4):C.UVGC_46_53,(8,2,5):C.UVGC_46_54,(8,2,6):C.UVGC_46_55,(8,2,7):C.UVGC_46_56,(6,2,2):C.UVGC_22_13,(6,2,4):C.UVGC_22_14,(6,2,5):C.UVGC_20_9,(6,2,6):C.UVGC_22_15,(7,2,0):C.UVGC_44_43,(7,2,4):C.UVGC_44_44,(7,2,5):C.UVGC_44_45,(7,2,6):C.UVGC_44_46,(7,2,7):C.UVGC_44_47,(5,2,4):C.UVGC_17_5,(5,2,5):C.UVGC_17_6,(1,2,4):C.UVGC_17_5,(1,2,5):C.UVGC_17_6})

V_23 = CTVertex(name = 'V_23',
                type = 'UV',
                particles = [ P.P__tilde__chi, P.t, P.P__tilde__ST__tilde__ ],
                color = [ 'Identity(2,3)' ],
                lorentz = [ L.FFS1 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST], [P.g, P.P__tilde__ST, P.t] ], [ [P.g, P.t] ], [ [P.P__tilde__chi, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ], [ [P.P__tilde__ST, P.t] ] ],
                couplings = {(0,0,2):C.UVGC_60_99,(0,0,3):C.UVGC_60_100,(0,0,0):C.UVGC_60_101,(0,0,1):C.UVGC_60_102,(0,0,4):C.UVGC_63_105})

V_24 = CTVertex(name = 'V_24',
                type = 'UV',
                particles = [ P.t__tilde__, P.P__tilde__chi, P.P__tilde__ST ],
                color = [ 'Identity(1,3)' ],
                lorentz = [ L.FFS2 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST], [P.g, P.P__tilde__ST, P.t] ], [ [P.g, P.t] ], [ [P.P__tilde__chi, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
                couplings = {(0,0,2):C.UVGC_60_99,(0,0,3):C.UVGC_60_100,(0,0,0):C.UVGC_60_101,(0,0,1):C.UVGC_60_102})

V_25 = CTVertex(name = 'V_25',
                type = 'UV',
                particles = [ P.c__tilde__, P.c, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV4, L.FFV5 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.c, P.g] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,2):C.UVGC_12_3,(0,1,0):C.UVGC_39_35,(0,1,1):C.UVGC_39_36,(0,1,3):C.UVGC_39_37,(0,1,4):C.UVGC_39_38,(0,1,5):C.UVGC_39_39,(0,1,6):C.UVGC_39_40})

V_26 = CTVertex(name = 'V_26',
                type = 'UV',
                particles = [ P.t__tilde__, P.t, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.t] ], [ [P.P__tilde__chi, P.P__tilde__ST] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,4):C.UVGC_12_3,(0,1,0):C.UVGC_39_35,(0,1,1):C.UVGC_39_36,(0,1,2):C.UVGC_39_37,(0,1,3):C.UVGC_39_38,(0,1,6):C.UVGC_39_39,(0,1,7):C.UVGC_39_40,(0,1,5):C.UVGC_51_73,(0,1,4):C.UVGC_51_74,(0,2,0):C.UVGC_39_35,(0,2,1):C.UVGC_39_36,(0,2,2):C.UVGC_39_37,(0,2,3):C.UVGC_39_38,(0,2,6):C.UVGC_39_39,(0,2,7):C.UVGC_39_40,(0,2,5):C.UVGC_54_78,(0,2,4):C.UVGC_51_74})

V_27 = CTVertex(name = 'V_27',
                type = 'UV',
                particles = [ P.u__tilde__, P.u, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.u] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,4):C.UVGC_12_3,(0,1,0):C.UVGC_39_35,(0,1,1):C.UVGC_39_36,(0,1,2):C.UVGC_39_37,(0,1,3):C.UVGC_39_38,(0,1,5):C.UVGC_39_39,(0,1,6):C.UVGC_39_40,(0,1,4):C.UVGC_40_41,(0,2,0):C.UVGC_39_35,(0,2,1):C.UVGC_39_36,(0,2,2):C.UVGC_39_37,(0,2,3):C.UVGC_39_38,(0,2,5):C.UVGC_39_39,(0,2,6):C.UVGC_39_40,(0,2,4):C.UVGC_40_41})

V_28 = CTVertex(name = 'V_28',
                type = 'UV',
                particles = [ P.b__tilde__, P.b, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.b, P.g] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,1):C.UVGC_12_3,(0,1,0):C.UVGC_39_35,(0,1,2):C.UVGC_39_36,(0,1,3):C.UVGC_39_37,(0,1,4):C.UVGC_39_38,(0,1,5):C.UVGC_39_39,(0,1,6):C.UVGC_39_40,(0,1,1):C.UVGC_43_42,(0,2,0):C.UVGC_39_35,(0,2,2):C.UVGC_39_36,(0,2,3):C.UVGC_39_37,(0,2,4):C.UVGC_39_38,(0,2,5):C.UVGC_39_39,(0,2,6):C.UVGC_39_40,(0,2,1):C.UVGC_43_42})

V_29 = CTVertex(name = 'V_29',
                type = 'UV',
                particles = [ P.d__tilde__, P.d, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.d, P.g] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,2):C.UVGC_12_3,(0,1,0):C.UVGC_39_35,(0,1,1):C.UVGC_39_36,(0,1,3):C.UVGC_39_37,(0,1,4):C.UVGC_39_38,(0,1,5):C.UVGC_39_39,(0,1,6):C.UVGC_39_40,(0,1,2):C.UVGC_40_41,(0,2,0):C.UVGC_39_35,(0,2,1):C.UVGC_39_36,(0,2,3):C.UVGC_39_37,(0,2,4):C.UVGC_39_38,(0,2,5):C.UVGC_39_39,(0,2,6):C.UVGC_39_40,(0,2,2):C.UVGC_40_41})

V_30 = CTVertex(name = 'V_30',
                type = 'UV',
                particles = [ P.s__tilde__, P.s, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.s] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,4):C.UVGC_12_3,(0,1,0):C.UVGC_39_35,(0,1,1):C.UVGC_39_36,(0,1,2):C.UVGC_39_37,(0,1,3):C.UVGC_39_38,(0,1,5):C.UVGC_39_39,(0,1,6):C.UVGC_39_40,(0,1,4):C.UVGC_40_41,(0,2,0):C.UVGC_39_35,(0,2,1):C.UVGC_39_36,(0,2,2):C.UVGC_39_37,(0,2,3):C.UVGC_39_38,(0,2,5):C.UVGC_39_39,(0,2,6):C.UVGC_39_40,(0,2,4):C.UVGC_40_41})

V_31 = CTVertex(name = 'V_31',
                type = 'UV',
                particles = [ P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'T(1,3,2)' ],
                lorentz = [ L.VSS1, L.VSS2 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,0):C.UVGC_57_82,(0,0,1):C.UVGC_57_83,(0,0,2):C.UVGC_57_84,(0,0,3):C.UVGC_57_85,(0,0,6):C.UVGC_57_86,(0,0,7):C.UVGC_57_87,(0,0,5):C.UVGC_57_88,(0,0,4):C.UVGC_57_89,(0,1,0):C.UVGC_39_35,(0,1,1):C.UVGC_39_36,(0,1,2):C.UVGC_39_37,(0,1,3):C.UVGC_39_38,(0,1,6):C.UVGC_39_39,(0,1,7):C.UVGC_39_40,(0,1,5):C.UVGC_56_80,(0,1,4):C.UVGC_56_81})

V_32 = CTVertex(name = 'V_32',
                type = 'UV',
                particles = [ P.g, P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'Identity(1,2)*Identity(3,4)', 'T(1,-1,3)*T(2,4,-1)', 'T(1,4,-1)*T(2,-1,3)' ],
                lorentz = [ L.VVSS1 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(2,0,0):C.UVGC_58_90,(2,0,1):C.UVGC_47_58,(2,0,2):C.UVGC_58_91,(2,0,3):C.UVGC_58_92,(2,0,6):C.UVGC_58_93,(2,0,7):C.UVGC_58_94,(2,0,5):C.UVGC_58_95,(2,0,4):C.UVGC_58_96,(1,0,0):C.UVGC_58_90,(1,0,1):C.UVGC_47_58,(1,0,2):C.UVGC_58_91,(1,0,3):C.UVGC_58_92,(1,0,6):C.UVGC_58_93,(1,0,7):C.UVGC_58_94,(1,0,5):C.UVGC_58_95,(1,0,4):C.UVGC_58_96,(0,0,2):C.UVGC_28_19,(0,0,4):C.UVGC_28_20})

V_33 = CTVertex(name = 'V_33',
                type = 'UV',
                particles = [ P.b__tilde__, P.b ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3, L.FF4, L.FF5 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_35_22,(0,2,0):C.UVGC_35_22,(0,1,0):C.UVGC_34_21,(0,3,0):C.UVGC_34_21})

V_34 = CTVertex(name = 'V_34',
                type = 'UV',
                particles = [ P.c__tilde__, P.c ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF3, L.FF5 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_25_18,(0,1,0):C.UVGC_11_2,(0,2,0):C.UVGC_11_2})

V_35 = CTVertex(name = 'V_35',
                type = 'UV',
                particles = [ P.d__tilde__, P.d ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF3, L.FF5 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_25_18,(0,1,0):C.UVGC_11_2,(0,2,0):C.UVGC_11_2})

V_36 = CTVertex(name = 'V_36',
                type = 'UV',
                particles = [ P.g, P.g ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VV1, L.VV3 ],
                loop_particles = [ [ [P.b] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,0):C.UVGC_37_26,(0,0,1):C.UVGC_37_27,(0,0,2):C.UVGC_37_28,(0,0,3):C.UVGC_37_29,(0,0,4):C.UVGC_37_30,(0,1,0):C.UVGC_36_23,(0,1,3):C.UVGC_36_24,(0,1,4):C.UVGC_36_25})

V_37 = CTVertex(name = 'V_37',
                type = 'UV',
                particles = [ P.s__tilde__, P.s ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF3, L.FF5 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.UVGC_25_18,(0,1,0):C.UVGC_11_2,(0,2,0):C.UVGC_11_2})

V_38 = CTVertex(name = 'V_38',
                type = 'UV',
                particles = [ P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.SS1, L.SS2 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__chi, P.t] ] ],
                couplings = {(0,0,1):C.UVGC_59_97,(0,0,0):C.UVGC_59_98,(0,1,1):C.UVGC_55_79})

V_39 = CTVertex(name = 'V_39',
                type = 'UV',
                particles = [ P.t__tilde__, P.t ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3, L.FF4, L.FF5 ],
                loop_particles = [ [ [P.g, P.t] ], [ [P.P__tilde__chi, P.P__tilde__ST] ] ],
                couplings = {(0,0,1):C.UVGC_52_75,(0,0,0):C.UVGC_52_76,(0,2,1):C.UVGC_52_75,(0,2,0):C.UVGC_52_76,(0,1,1):C.UVGC_50_71,(0,1,0):C.UVGC_50_72,(0,3,1):C.UVGC_53_77,(0,3,0):C.UVGC_50_72})

V_40 = CTVertex(name = 'V_40',
                type = 'UV',
                particles = [ P.u__tilde__, P.u ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF3, L.FF5 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.UVGC_25_18,(0,1,0):C.UVGC_11_2,(0,2,0):C.UVGC_11_2})

V_41 = CTVertex(name = 'V_41',
                type = 'UV',
                particles = [ P.P__tilde__chi, P.P__tilde__chi ],
                color = [ '1' ],
                lorentz = [ L.FF1, L.FF2, L.FF3, L.FF4, L.FF5 ],
                loop_particles = [ [ [P.P__tilde__ST, P.t] ] ],
                couplings = {(0,1,0):C.UVGC_62_104,(0,3,0):C.UVGC_62_104,(0,2,0):C.UVGC_61_103,(0,4,0):C.UVGC_61_103,(0,0,0):C.UVGC_15_4})

