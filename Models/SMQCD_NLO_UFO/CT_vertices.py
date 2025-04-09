# This file was automatically created by FeynRules 2.4.91
# Mathematica version: 14.1.0 for Linux x86 (64-bit) (July 16, 2024)
# Date: Mon 31 Mar 2025 14:55:46


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
               couplings = {(0,0,0):C.R2GC_76_21,(0,0,1):C.R2GC_76_22})

V_2 = CTVertex(name = 'V_2',
               type = 'R2',
               particles = [ P.g, P.g, P.g, P.g ],
               color = [ 'd(-1,1,3)*d(-1,2,4)', 'd(-1,1,3)*f(-1,2,4)', 'd(-1,1,4)*d(-1,2,3)', 'd(-1,1,4)*f(-1,2,3)', 'd(-1,2,3)*f(-1,1,4)', 'd(-1,2,4)*f(-1,1,3)', 'f(-1,1,2)*f(-1,3,4)', 'f(-1,1,3)*f(-1,2,4)', 'f(-1,1,4)*f(-1,2,3)', 'Identity(1,2)*Identity(3,4)', 'Identity(1,3)*Identity(2,4)', 'Identity(1,4)*Identity(2,3)' ],
               lorentz = [ L.VVVV1, L.VVVV2, L.VVVV4, L.VVVV9 ],
               loop_particles = [ [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.g] ] ],
               couplings = {(2,0,0):C.R2GC_54_9,(2,0,1):C.R2GC_54_10,(0,0,0):C.R2GC_54_9,(0,0,1):C.R2GC_54_10,(4,0,0):C.R2GC_52_5,(4,0,1):C.R2GC_52_6,(3,0,0):C.R2GC_52_5,(3,0,1):C.R2GC_52_6,(8,0,0):C.R2GC_53_7,(8,0,1):C.R2GC_53_8,(6,0,0):C.R2GC_57_14,(6,0,1):C.R2GC_86_28,(7,0,0):C.R2GC_58_16,(7,0,1):C.R2GC_87_29,(5,0,0):C.R2GC_52_5,(5,0,1):C.R2GC_52_6,(1,0,0):C.R2GC_52_5,(1,0,1):C.R2GC_52_6,(11,3,0):C.R2GC_56_12,(11,3,1):C.R2GC_56_13,(10,3,0):C.R2GC_56_12,(10,3,1):C.R2GC_56_13,(9,3,1):C.R2GC_55_11,(2,1,0):C.R2GC_54_9,(2,1,1):C.R2GC_54_10,(0,1,0):C.R2GC_54_9,(0,1,1):C.R2GC_54_10,(4,1,0):C.R2GC_52_5,(4,1,1):C.R2GC_52_6,(3,1,0):C.R2GC_52_5,(3,1,1):C.R2GC_52_6,(8,1,0):C.R2GC_53_7,(8,1,1):C.R2GC_85_27,(6,1,0):C.R2GC_83_24,(6,1,1):C.R2GC_83_25,(7,1,0):C.R2GC_58_16,(7,1,1):C.R2GC_58_17,(5,1,0):C.R2GC_52_5,(5,1,1):C.R2GC_52_6,(1,1,0):C.R2GC_52_5,(1,1,1):C.R2GC_52_6,(0,2,0):C.R2GC_54_9,(0,2,1):C.R2GC_54_10,(2,2,0):C.R2GC_54_9,(2,2,1):C.R2GC_54_10,(5,2,0):C.R2GC_52_5,(5,2,1):C.R2GC_52_6,(1,2,0):C.R2GC_52_5,(1,2,1):C.R2GC_52_6,(7,2,0):C.R2GC_84_26,(7,2,1):C.R2GC_54_10,(4,2,0):C.R2GC_52_5,(4,2,1):C.R2GC_52_6,(3,2,0):C.R2GC_52_5,(3,2,1):C.R2GC_52_6,(8,2,0):C.R2GC_53_7,(8,2,1):C.R2GC_82_23,(6,2,0):C.R2GC_57_14,(6,2,1):C.R2GC_57_15})

V_3 = CTVertex(name = 'V_3',
               type = 'R2',
               particles = [ P.u__tilde__, P.u, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.g, P.u] ] ],
               couplings = {(0,0,0):C.R2GC_59_18})

V_4 = CTVertex(name = 'V_4',
               type = 'R2',
               particles = [ P.c__tilde__, P.c, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.c, P.g] ] ],
               couplings = {(0,0,0):C.R2GC_59_18})

V_5 = CTVertex(name = 'V_5',
               type = 'R2',
               particles = [ P.t__tilde__, P.t, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.g, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_59_18})

V_6 = CTVertex(name = 'V_6',
               type = 'R2',
               particles = [ P.d__tilde__, P.d, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.d, P.g] ] ],
               couplings = {(0,0,0):C.R2GC_59_18})

V_7 = CTVertex(name = 'V_7',
               type = 'R2',
               particles = [ P.s__tilde__, P.s, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.g, P.s] ] ],
               couplings = {(0,0,0):C.R2GC_59_18})

V_8 = CTVertex(name = 'V_8',
               type = 'R2',
               particles = [ P.b__tilde__, P.b, P.g ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFV1 ],
               loop_particles = [ [ [P.b, P.g] ] ],
               couplings = {(0,0,0):C.R2GC_59_18})

V_9 = CTVertex(name = 'V_9',
               type = 'R2',
               particles = [ P.b__tilde__, P.b ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FF2, L.FF3 ],
               loop_particles = [ [ [P.b, P.g] ] ],
               couplings = {(0,0,0):C.R2GC_60_19,(0,1,0):C.R2GC_61_20})

V_10 = CTVertex(name = 'V_10',
                type = 'R2',
                particles = [ P.c__tilde__, P.c ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_61_20})

V_11 = CTVertex(name = 'V_11',
                type = 'R2',
                particles = [ P.d__tilde__, P.d ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_61_20})

V_12 = CTVertex(name = 'V_12',
                type = 'R2',
                particles = [ P.s__tilde__, P.s ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_61_20})

V_13 = CTVertex(name = 'V_13',
                type = 'R2',
                particles = [ P.t__tilde__, P.t ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_90_30,(0,1,0):C.R2GC_61_20})

V_14 = CTVertex(name = 'V_14',
                type = 'R2',
                particles = [ P.u__tilde__, P.u ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_61_20})

V_15 = CTVertex(name = 'V_15',
                type = 'R2',
                particles = [ P.g, P.g ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VV1, L.VV2, L.VV3 ],
                loop_particles = [ [ [P.b] ], [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.g] ], [ [P.t] ] ],
                couplings = {(0,2,2):C.R2GC_46_1,(0,0,0):C.R2GC_47_2,(0,0,3):C.R2GC_47_3,(0,1,1):C.R2GC_48_4})

V_16 = CTVertex(name = 'V_16',
                type = 'UV',
                particles = [ P.g, P.g, P.g ],
                color = [ 'f(1,2,3)' ],
                lorentz = [ L.VVV1, L.VVV2 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.t] ] ],
                couplings = {(0,1,0):C.UVGC_76_26,(0,1,1):C.UVGC_76_27,(0,1,2):C.UVGC_76_28,(0,1,3):C.UVGC_76_29,(0,1,4):C.UVGC_76_30,(0,0,2):C.UVGC_50_2})

V_17 = CTVertex(name = 'V_17',
                type = 'UV',
                particles = [ P.g, P.g, P.g, P.g ],
                color = [ 'd(-1,1,3)*d(-1,2,4)', 'd(-1,1,3)*f(-1,2,4)', 'd(-1,1,4)*d(-1,2,3)', 'd(-1,1,4)*f(-1,2,3)', 'd(-1,2,3)*f(-1,1,4)', 'd(-1,2,4)*f(-1,1,3)', 'f(-1,1,2)*f(-1,3,4)', 'f(-1,1,3)*f(-1,2,4)', 'f(-1,1,4)*f(-1,2,3)', 'Identity(1,2)*Identity(3,4)', 'Identity(1,3)*Identity(2,4)', 'Identity(1,4)*Identity(2,3)' ],
                lorentz = [ L.VVVV1, L.VVVV2, L.VVVV4, L.VVVV9 ],
                loop_particles = [ [ [P.b] ], [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.t] ] ],
                couplings = {(2,0,3):C.UVGC_53_7,(2,0,4):C.UVGC_53_6,(0,0,3):C.UVGC_53_7,(0,0,4):C.UVGC_53_6,(4,0,3):C.UVGC_52_4,(4,0,4):C.UVGC_52_5,(3,0,3):C.UVGC_52_4,(3,0,4):C.UVGC_52_5,(8,0,3):C.UVGC_53_6,(8,0,4):C.UVGC_53_7,(6,0,0):C.UVGC_86_55,(6,0,2):C.UVGC_86_56,(6,0,3):C.UVGC_86_57,(6,0,4):C.UVGC_86_58,(6,0,5):C.UVGC_86_59,(7,0,0):C.UVGC_86_55,(7,0,2):C.UVGC_86_56,(7,0,3):C.UVGC_87_60,(7,0,4):C.UVGC_87_61,(7,0,5):C.UVGC_86_59,(5,0,3):C.UVGC_52_4,(5,0,4):C.UVGC_52_5,(1,0,3):C.UVGC_52_4,(1,0,4):C.UVGC_52_5,(11,3,3):C.UVGC_56_10,(11,3,4):C.UVGC_56_11,(10,3,3):C.UVGC_56_10,(10,3,4):C.UVGC_56_11,(9,3,3):C.UVGC_55_8,(9,3,4):C.UVGC_55_9,(2,1,3):C.UVGC_53_7,(2,1,4):C.UVGC_53_6,(0,1,3):C.UVGC_53_7,(0,1,4):C.UVGC_53_6,(4,1,3):C.UVGC_52_4,(4,1,4):C.UVGC_52_5,(3,1,3):C.UVGC_52_4,(3,1,4):C.UVGC_52_5,(8,1,0):C.UVGC_85_50,(8,1,2):C.UVGC_85_51,(8,1,3):C.UVGC_85_52,(8,1,4):C.UVGC_85_53,(8,1,5):C.UVGC_85_54,(6,1,0):C.UVGC_83_43,(6,1,2):C.UVGC_83_44,(6,1,3):C.UVGC_83_45,(6,1,4):C.UVGC_83_46,(6,1,5):C.UVGC_83_47,(7,1,1):C.UVGC_57_12,(7,1,3):C.UVGC_58_14,(7,1,4):C.UVGC_58_15,(5,1,3):C.UVGC_52_4,(5,1,4):C.UVGC_52_5,(1,1,3):C.UVGC_52_4,(1,1,4):C.UVGC_52_5,(0,2,3):C.UVGC_53_7,(0,2,4):C.UVGC_53_6,(2,2,3):C.UVGC_53_7,(2,2,4):C.UVGC_53_6,(5,2,3):C.UVGC_52_4,(5,2,4):C.UVGC_52_5,(1,2,3):C.UVGC_52_4,(1,2,4):C.UVGC_52_5,(7,2,0):C.UVGC_83_43,(7,2,2):C.UVGC_83_44,(7,2,3):C.UVGC_84_48,(7,2,4):C.UVGC_84_49,(7,2,5):C.UVGC_83_47,(4,2,3):C.UVGC_52_4,(4,2,4):C.UVGC_52_5,(3,2,3):C.UVGC_52_4,(3,2,4):C.UVGC_52_5,(8,2,0):C.UVGC_82_38,(8,2,2):C.UVGC_82_39,(8,2,3):C.UVGC_82_40,(8,2,4):C.UVGC_82_41,(8,2,5):C.UVGC_82_42,(6,2,1):C.UVGC_57_12,(6,2,3):C.UVGC_57_13,(6,2,4):C.UVGC_55_8})

V_18 = CTVertex(name = 'V_18',
                type = 'UV',
                particles = [ P.u__tilde__, P.u, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV4 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.u] ], [ [P.t] ] ],
                couplings = {(0,0,4):C.UVGC_59_16,(0,1,0):C.UVGC_77_31,(0,1,1):C.UVGC_77_32,(0,1,2):C.UVGC_77_33,(0,1,3):C.UVGC_77_34,(0,1,5):C.UVGC_77_35,(0,1,4):C.UVGC_77_36})

V_19 = CTVertex(name = 'V_19',
                type = 'UV',
                particles = [ P.c__tilde__, P.c, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV4 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.c, P.g] ], [ [P.g] ], [ [P.ghG] ], [ [P.t] ] ],
                couplings = {(0,0,2):C.UVGC_59_16,(0,1,0):C.UVGC_77_31,(0,1,1):C.UVGC_77_32,(0,1,3):C.UVGC_77_33,(0,1,4):C.UVGC_77_34,(0,1,5):C.UVGC_77_35,(0,1,2):C.UVGC_77_36})

V_20 = CTVertex(name = 'V_20',
                type = 'UV',
                particles = [ P.t__tilde__, P.t, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV4 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.t] ], [ [P.t] ] ],
                couplings = {(0,0,4):C.UVGC_59_16,(0,1,0):C.UVGC_77_31,(0,1,1):C.UVGC_77_32,(0,1,2):C.UVGC_77_33,(0,1,3):C.UVGC_77_34,(0,1,5):C.UVGC_77_35,(0,1,4):C.UVGC_89_63})

V_21 = CTVertex(name = 'V_21',
                type = 'UV',
                particles = [ P.d__tilde__, P.d, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV4 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.d, P.g] ], [ [P.g] ], [ [P.ghG] ], [ [P.t] ] ],
                couplings = {(0,0,2):C.UVGC_59_16,(0,1,0):C.UVGC_77_31,(0,1,1):C.UVGC_77_32,(0,1,3):C.UVGC_77_33,(0,1,4):C.UVGC_77_34,(0,1,5):C.UVGC_77_35,(0,1,2):C.UVGC_77_36})

V_22 = CTVertex(name = 'V_22',
                type = 'UV',
                particles = [ P.s__tilde__, P.s, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV4 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.s] ], [ [P.t] ] ],
                couplings = {(0,0,4):C.UVGC_59_16,(0,1,0):C.UVGC_77_31,(0,1,1):C.UVGC_77_32,(0,1,2):C.UVGC_77_33,(0,1,3):C.UVGC_77_34,(0,1,5):C.UVGC_77_35,(0,1,4):C.UVGC_77_36})

V_23 = CTVertex(name = 'V_23',
                type = 'UV',
                particles = [ P.b__tilde__, P.b, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV4 ],
                loop_particles = [ [ [P.b] ], [ [P.b, P.g] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.t] ] ],
                couplings = {(0,0,1):C.UVGC_59_16,(0,1,0):C.UVGC_77_31,(0,1,2):C.UVGC_77_32,(0,1,3):C.UVGC_77_33,(0,1,4):C.UVGC_77_34,(0,1,5):C.UVGC_77_35,(0,1,1):C.UVGC_81_37})

V_24 = CTVertex(name = 'V_24',
                type = 'UV',
                particles = [ P.b__tilde__, P.b ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_60_17,(0,1,0):C.UVGC_74_20})

V_25 = CTVertex(name = 'V_25',
                type = 'UV',
                particles = [ P.c__tilde__, P.c ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF3 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_61_18,(0,1,0):C.UVGC_62_19})

V_26 = CTVertex(name = 'V_26',
                type = 'UV',
                particles = [ P.d__tilde__, P.d ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF3 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_61_18,(0,1,0):C.UVGC_62_19})

V_27 = CTVertex(name = 'V_27',
                type = 'UV',
                particles = [ P.s__tilde__, P.s ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF3 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.UVGC_61_18,(0,1,0):C.UVGC_62_19})

V_28 = CTVertex(name = 'V_28',
                type = 'UV',
                particles = [ P.t__tilde__, P.t ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_90_64,(0,1,0):C.UVGC_88_62})

V_29 = CTVertex(name = 'V_29',
                type = 'UV',
                particles = [ P.u__tilde__, P.u ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF3 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.UVGC_61_18,(0,1,0):C.UVGC_62_19})

V_30 = CTVertex(name = 'V_30',
                type = 'UV',
                particles = [ P.g, P.g ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VV4, L.VV5, L.VV6 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.t] ] ],
                couplings = {(0,0,0):C.UVGC_75_21,(0,0,1):C.UVGC_75_22,(0,0,2):C.UVGC_75_23,(0,0,3):C.UVGC_75_24,(0,0,4):C.UVGC_75_25,(0,1,2):C.UVGC_49_1,(0,2,3):C.UVGC_51_3})

