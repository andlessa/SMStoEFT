# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 12.1.0 for Linux x86 (64-bit) (March 18, 2020)
# Date: Tue 15 Aug 2023 18:11:57


from object_library import all_vertices, all_CTvertices, Vertex, CTVertex
import particles as P
import CT_couplings as C
import lorentz as L


V_1 = CTVertex(name = 'V_1',
               type = 'R2',
               particles = [ P.g, P.g, P.g ],
               color = [ 'f(1,2,3)' ],
               lorentz = [ L.VVV8 ],
               loop_particles = [ [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.g] ] ],
               couplings = {(0,0,0):C.R2GC_148_30,(0,0,1):C.R2GC_148_31})

V_2 = CTVertex(name = 'V_2',
               type = 'R2',
               particles = [ P.g, P.g, P.g, P.g ],
               color = [ 'd(-1,1,3)*d(-1,2,4)', 'd(-1,1,3)*f(-1,2,4)', 'd(-1,1,4)*d(-1,2,3)', 'd(-1,1,4)*f(-1,2,3)', 'd(-1,2,3)*f(-1,1,4)', 'd(-1,2,4)*f(-1,1,3)', 'f(-1,1,2)*f(-1,3,4)', 'f(-1,1,3)*f(-1,2,4)', 'f(-1,1,4)*f(-1,2,3)', 'Identity(1,2)*Identity(3,4)', 'Identity(1,3)*Identity(2,4)', 'Identity(1,4)*Identity(2,3)' ],
               lorentz = [ L.VVVV2, L.VVVV3, L.VVVV4 ],
               loop_particles = [ [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.g] ] ],
               couplings = {(2,0,0):C.R2GC_114_6,(2,0,1):C.R2GC_114_7,(0,0,0):C.R2GC_114_6,(0,0,1):C.R2GC_114_7,(6,0,0):C.R2GC_117_11,(6,0,1):C.R2GC_161_41,(4,0,0):C.R2GC_112_2,(4,0,1):C.R2GC_112_3,(3,0,0):C.R2GC_112_2,(3,0,1):C.R2GC_112_3,(8,0,0):C.R2GC_113_4,(8,0,1):C.R2GC_113_5,(7,0,0):C.R2GC_118_13,(7,0,1):C.R2GC_160_40,(5,0,0):C.R2GC_112_2,(5,0,1):C.R2GC_112_3,(1,0,0):C.R2GC_112_2,(1,0,1):C.R2GC_112_3,(11,0,0):C.R2GC_116_9,(11,0,1):C.R2GC_116_10,(10,0,0):C.R2GC_116_9,(10,0,1):C.R2GC_116_10,(9,0,1):C.R2GC_115_8,(2,1,0):C.R2GC_114_6,(2,1,1):C.R2GC_114_7,(0,1,0):C.R2GC_114_6,(0,1,1):C.R2GC_114_7,(4,1,0):C.R2GC_112_2,(4,1,1):C.R2GC_112_3,(3,1,0):C.R2GC_112_2,(3,1,1):C.R2GC_112_3,(8,1,0):C.R2GC_113_4,(8,1,1):C.R2GC_162_42,(6,1,0):C.R2GC_158_37,(6,1,1):C.R2GC_158_38,(7,1,0):C.R2GC_118_13,(7,1,1):C.R2GC_118_14,(5,1,0):C.R2GC_112_2,(5,1,1):C.R2GC_112_3,(1,1,0):C.R2GC_112_2,(1,1,1):C.R2GC_112_3,(11,1,0):C.R2GC_116_9,(11,1,1):C.R2GC_116_10,(10,1,0):C.R2GC_116_9,(10,1,1):C.R2GC_116_10,(9,1,1):C.R2GC_115_8,(2,2,0):C.R2GC_114_6,(2,2,1):C.R2GC_114_7,(0,2,0):C.R2GC_114_6,(0,2,1):C.R2GC_114_7,(4,2,0):C.R2GC_112_2,(4,2,1):C.R2GC_112_3,(3,2,0):C.R2GC_112_2,(3,2,1):C.R2GC_112_3,(8,2,0):C.R2GC_113_4,(8,2,1):C.R2GC_159_39,(6,2,0):C.R2GC_117_11,(6,2,1):C.R2GC_117_12,(7,2,0):C.R2GC_157_36,(7,2,1):C.R2GC_114_7,(5,2,0):C.R2GC_112_2,(5,2,1):C.R2GC_112_3,(1,2,0):C.R2GC_112_2,(1,2,1):C.R2GC_112_3,(11,2,0):C.R2GC_116_9,(11,2,1):C.R2GC_116_10,(10,2,0):C.R2GC_116_9,(10,2,1):C.R2GC_116_10,(9,2,1):C.R2GC_115_8})

V_3 = CTVertex(name = 'V_3',
               type = 'R2',
               particles = [ P.t__tilde__, P.b, P.G__plus__ ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFS3, L.FFS4 ],
               loop_particles = [ [ [P.b, P.g, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_171_46,(0,1,0):C.R2GC_173_48})

V_4 = CTVertex(name = 'V_4',
               type = 'R2',
               particles = [ P.b__tilde__, P.b, P.G0 ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFS1 ],
               loop_particles = [ [ [P.b, P.g] ] ],
               couplings = {(0,0,0):C.R2GC_144_25})

V_5 = CTVertex(name = 'V_5',
               type = 'R2',
               particles = [ P.b__tilde__, P.b, P.H ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFS2 ],
               loop_particles = [ [ [P.b, P.g] ] ],
               couplings = {(0,0,0):C.R2GC_143_24})

V_6 = CTVertex(name = 'V_6',
               type = 'R2',
               particles = [ P.b__tilde__, P.t, P.G__minus__ ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFS3, L.FFS4 ],
               loop_particles = [ [ [P.b, P.g, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_174_49,(0,1,0):C.R2GC_170_45})

V_7 = CTVertex(name = 'V_7',
               type = 'R2',
               particles = [ P.t__tilde__, P.t, P.G0 ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFS1 ],
               loop_particles = [ [ [P.g, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_175_50})

V_8 = CTVertex(name = 'V_8',
               type = 'R2',
               particles = [ P.t__tilde__, P.t, P.H ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFS2 ],
               loop_particles = [ [ [P.g, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_176_51})

V_9 = CTVertex(name = 'V_9',
               type = 'R2',
               particles = [ P.P__tilde__chi, P.t, P.P__tilde__ST__tilde__ ],
               color = [ 'Identity(2,3)' ],
               lorentz = [ L.FFS3 ],
               loop_particles = [ [ [P.g, P.P__tilde__ST, P.t] ] ],
               couplings = {(0,0,0):C.R2GC_172_47})

V_10 = CTVertex(name = 'V_10',
                type = 'R2',
                particles = [ P.t__tilde__, P.P__tilde__chi, P.P__tilde__ST ],
                color = [ 'Identity(1,3)' ],
                lorentz = [ L.FFS4 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_172_47})

V_11 = CTVertex(name = 'V_11',
                type = 'R2',
                particles = [ P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'T(1,3,2)' ],
                lorentz = [ L.VSS1, L.VSS3 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST] ] ],
                couplings = {(0,0,0):C.R2GC_149_32,(0,1,0):C.R2GC_152_33})

V_12 = CTVertex(name = 'V_12',
                type = 'R2',
                particles = [ P.g, P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'Identity(1,2)*Identity(3,4)', 'T(1,-1,3)*T(2,4,-1)', 'T(1,4,-1)*T(2,-1,3)' ],
                lorentz = [ L.VVSS1 ],
                loop_particles = [ [ [P.g] ], [ [P.g, P.P__tilde__ST] ] ],
                couplings = {(2,0,0):C.R2GC_156_34,(2,0,1):C.R2GC_156_35,(1,0,0):C.R2GC_156_34,(1,0,1):C.R2GC_156_35,(0,0,0):C.R2GC_116_10,(0,0,1):C.R2GC_127_19})

V_13 = CTVertex(name = 'V_13',
                type = 'R2',
                particles = [ P.u__tilde__, P.u, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_122_18})

V_14 = CTVertex(name = 'V_14',
                type = 'R2',
                particles = [ P.c__tilde__, P.c, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_122_18})

V_15 = CTVertex(name = 'V_15',
                type = 'R2',
                particles = [ P.t__tilde__, P.t, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_122_18})

V_16 = CTVertex(name = 'V_16',
                type = 'R2',
                particles = [ P.d__tilde__, P.d, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_119_15})

V_17 = CTVertex(name = 'V_17',
                type = 'R2',
                particles = [ P.s__tilde__, P.s, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_119_15})

V_18 = CTVertex(name = 'V_18',
                type = 'R2',
                particles = [ P.b__tilde__, P.b, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_119_15})

V_19 = CTVertex(name = 'V_19',
                type = 'R2',
                particles = [ P.u__tilde__, P.u, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_120_16})

V_20 = CTVertex(name = 'V_20',
                type = 'R2',
                particles = [ P.c__tilde__, P.c, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_120_16})

V_21 = CTVertex(name = 'V_21',
                type = 'R2',
                particles = [ P.t__tilde__, P.t, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_120_16})

V_22 = CTVertex(name = 'V_22',
                type = 'R2',
                particles = [ P.d__tilde__, P.d, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_120_16})

V_23 = CTVertex(name = 'V_23',
                type = 'R2',
                particles = [ P.s__tilde__, P.s, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_120_16})

V_24 = CTVertex(name = 'V_24',
                type = 'R2',
                particles = [ P.b__tilde__, P.b, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_120_16})

V_25 = CTVertex(name = 'V_25',
                type = 'R2',
                particles = [ P.d__tilde__, P.u, P.W__minus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.d, P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_136_20})

V_26 = CTVertex(name = 'V_26',
                type = 'R2',
                particles = [ P.s__tilde__, P.c, P.W__minus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.c, P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_136_20})

V_27 = CTVertex(name = 'V_27',
                type = 'R2',
                particles = [ P.b__tilde__, P.t, P.W__minus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.b, P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_136_20})

V_28 = CTVertex(name = 'V_28',
                type = 'R2',
                particles = [ P.u__tilde__, P.d, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.d, P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_136_20})

V_29 = CTVertex(name = 'V_29',
                type = 'R2',
                particles = [ P.c__tilde__, P.s, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.c, P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_136_20})

V_30 = CTVertex(name = 'V_30',
                type = 'R2',
                particles = [ P.t__tilde__, P.b, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.b, P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_136_20})

V_31 = CTVertex(name = 'V_31',
                type = 'R2',
                particles = [ P.u__tilde__, P.u, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_100_1,(0,1,0):C.R2GC_169_44})

V_32 = CTVertex(name = 'V_32',
                type = 'R2',
                particles = [ P.c__tilde__, P.c, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_100_1,(0,1,0):C.R2GC_169_44})

V_33 = CTVertex(name = 'V_33',
                type = 'R2',
                particles = [ P.t__tilde__, P.t, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_100_1,(0,1,0):C.R2GC_169_44})

V_34 = CTVertex(name = 'V_34',
                type = 'R2',
                particles = [ P.d__tilde__, P.d, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_141_22,(0,1,0):C.R2GC_142_23})

V_35 = CTVertex(name = 'V_35',
                type = 'R2',
                particles = [ P.s__tilde__, P.s, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_141_22,(0,1,0):C.R2GC_142_23})

V_36 = CTVertex(name = 'V_36',
                type = 'R2',
                particles = [ P.b__tilde__, P.b, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_141_22,(0,1,0):C.R2GC_142_23})

V_37 = CTVertex(name = 'V_37',
                type = 'R2',
                particles = [ P.u__tilde__, P.u ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_121_17})

V_38 = CTVertex(name = 'V_38',
                type = 'R2',
                particles = [ P.c__tilde__, P.c ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_121_17})

V_39 = CTVertex(name = 'V_39',
                type = 'R2',
                particles = [ P.t__tilde__, P.t ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3, L.FF4, L.FF5 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_166_43,(0,2,0):C.R2GC_166_43,(0,1,0):C.R2GC_121_17,(0,3,0):C.R2GC_121_17})

V_40 = CTVertex(name = 'V_40',
                type = 'R2',
                particles = [ P.d__tilde__, P.d ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_121_17})

V_41 = CTVertex(name = 'V_41',
                type = 'R2',
                particles = [ P.s__tilde__, P.s ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.R2GC_121_17})

V_42 = CTVertex(name = 'V_42',
                type = 'R2',
                particles = [ P.b__tilde__, P.b ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3, L.FF4, L.FF5 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.R2GC_140_21,(0,2,0):C.R2GC_140_21,(0,3,0):C.R2GC_121_17,(0,1,0):C.R2GC_121_17})

V_43 = CTVertex(name = 'V_43',
                type = 'R2',
                particles = [ P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.SS1, L.SS2 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST] ] ],
                couplings = {(0,0,0):C.R2GC_145_26,(0,1,0):C.R2GC_83_52})

V_44 = CTVertex(name = 'V_44',
                type = 'R2',
                particles = [ P.g, P.g ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VV1, L.VV2, L.VV3 ],
                loop_particles = [ [ [P.b] ], [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.g] ], [ [P.t] ] ],
                couplings = {(0,0,2):C.R2GC_147_29,(0,1,0):C.R2GC_86_53,(0,1,3):C.R2GC_86_54,(0,2,1):C.R2GC_146_27,(0,2,2):C.R2GC_146_28})

V_45 = CTVertex(name = 'V_45',
                type = 'R2',
                particles = [ P.g, P.g, P.H ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VVS1 ],
                loop_particles = [ [ [P.b] ], [ [P.t] ] ],
                couplings = {(0,0,0):C.R2GC_87_55,(0,0,1):C.R2GC_87_56})

V_46 = CTVertex(name = 'V_46',
                type = 'R2',
                particles = [ P.g, P.g, P.W__minus__, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VVVV2, L.VVVV3, L.VVVV4 ],
                loop_particles = [ [ [P.b, P.t], [P.c, P.s], [P.d, P.u] ] ],
                couplings = {(0,0,0):C.R2GC_99_72,(0,1,0):C.R2GC_99_72,(0,2,0):C.R2GC_99_72})

V_47 = CTVertex(name = 'V_47',
                type = 'R2',
                particles = [ P.a, P.g, P.g, P.Z ],
                color = [ 'Identity(2,3)' ],
                lorentz = [ L.VVVV2, L.VVVV3, L.VVVV4 ],
                loop_particles = [ [ [P.b], [P.d], [P.s] ], [ [P.c], [P.t], [P.u] ] ],
                couplings = {(0,0,0):C.R2GC_91_63,(0,0,1):C.R2GC_91_64,(0,1,0):C.R2GC_91_63,(0,1,1):C.R2GC_91_64,(0,2,0):C.R2GC_91_63,(0,2,1):C.R2GC_91_64})

V_48 = CTVertex(name = 'V_48',
                type = 'R2',
                particles = [ P.g, P.g, P.Z, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VVVV2, L.VVVV3, L.VVVV4 ],
                loop_particles = [ [ [P.b], [P.d], [P.s] ], [ [P.c], [P.t], [P.u] ] ],
                couplings = {(0,0,0):C.R2GC_94_69,(0,0,1):C.R2GC_94_70,(0,1,0):C.R2GC_94_69,(0,1,1):C.R2GC_94_70,(0,2,0):C.R2GC_94_69,(0,2,1):C.R2GC_94_70})

V_49 = CTVertex(name = 'V_49',
                type = 'R2',
                particles = [ P.a, P.a, P.g, P.g ],
                color = [ 'Identity(3,4)' ],
                lorentz = [ L.VVVV2, L.VVVV3, L.VVVV4 ],
                loop_particles = [ [ [P.b], [P.d], [P.s] ], [ [P.c], [P.t], [P.u] ] ],
                couplings = {(0,0,0):C.R2GC_89_59,(0,0,1):C.R2GC_89_60,(0,1,0):C.R2GC_89_59,(0,1,1):C.R2GC_89_60,(0,2,0):C.R2GC_89_59,(0,2,1):C.R2GC_89_60})

V_50 = CTVertex(name = 'V_50',
                type = 'R2',
                particles = [ P.g, P.g, P.g, P.Z ],
                color = [ 'd(1,2,3)', 'f(1,2,3)' ],
                lorentz = [ L.VVVV1, L.VVVV2, L.VVVV3, L.VVVV4 ],
                loop_particles = [ [ [P.b], [P.d], [P.s] ], [ [P.c], [P.t], [P.u] ] ],
                couplings = {(1,0,0):C.R2GC_93_67,(1,0,1):C.R2GC_93_68,(0,1,0):C.R2GC_92_65,(0,1,1):C.R2GC_92_66,(0,2,0):C.R2GC_92_65,(0,2,1):C.R2GC_92_66,(0,3,0):C.R2GC_92_65,(0,3,1):C.R2GC_92_66})

V_51 = CTVertex(name = 'V_51',
                type = 'R2',
                particles = [ P.a, P.g, P.g, P.g ],
                color = [ 'd(2,3,4)' ],
                lorentz = [ L.VVVV2, L.VVVV3, L.VVVV4 ],
                loop_particles = [ [ [P.b], [P.d], [P.s] ], [ [P.c], [P.t], [P.u] ] ],
                couplings = {(0,0,0):C.R2GC_90_61,(0,0,1):C.R2GC_90_62,(0,1,0):C.R2GC_90_61,(0,1,1):C.R2GC_90_62,(0,2,0):C.R2GC_90_61,(0,2,1):C.R2GC_90_62})

V_52 = CTVertex(name = 'V_52',
                type = 'R2',
                particles = [ P.g, P.g, P.H, P.H ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VVSS1 ],
                loop_particles = [ [ [P.b] ], [ [P.t] ] ],
                couplings = {(0,0,0):C.R2GC_88_57,(0,0,1):C.R2GC_88_58})

V_53 = CTVertex(name = 'V_53',
                type = 'R2',
                particles = [ P.g, P.g, P.G0, P.G0 ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VVSS1 ],
                loop_particles = [ [ [P.b] ], [ [P.t] ] ],
                couplings = {(0,0,0):C.R2GC_88_57,(0,0,1):C.R2GC_88_58})

V_54 = CTVertex(name = 'V_54',
                type = 'R2',
                particles = [ P.g, P.g, P.G__minus__, P.G__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VVSS1 ],
                loop_particles = [ [ [P.b, P.t] ] ],
                couplings = {(0,0,0):C.R2GC_98_71})

V_55 = CTVertex(name = 'V_55',
                type = 'UV',
                particles = [ P.g, P.g, P.g ],
                color = [ 'f(1,2,3)' ],
                lorentz = [ L.VVV10, L.VVV7, L.VVV8, L.VVV9 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,2,0):C.UVGC_148_44,(0,2,1):C.UVGC_148_45,(0,2,4):C.UVGC_148_46,(0,2,5):C.UVGC_148_47,(0,0,2):C.UVGC_101_1,(0,1,3):C.UVGC_102_2,(0,3,4):C.UVGC_103_3})

V_56 = CTVertex(name = 'V_56',
                type = 'UV',
                particles = [ P.g, P.g, P.g, P.g ],
                color = [ 'd(-1,1,3)*d(-1,2,4)', 'd(-1,1,3)*f(-1,2,4)', 'd(-1,1,4)*d(-1,2,3)', 'd(-1,1,4)*f(-1,2,3)', 'd(-1,2,3)*f(-1,1,4)', 'd(-1,2,4)*f(-1,1,3)', 'f(-1,1,2)*f(-1,3,4)', 'f(-1,1,3)*f(-1,2,4)', 'f(-1,1,4)*f(-1,2,3)', 'Identity(1,2)*Identity(3,4)', 'Identity(1,3)*Identity(2,4)', 'Identity(1,4)*Identity(2,3)' ],
                lorentz = [ L.VVVV2, L.VVVV3, L.VVVV4 ],
                loop_particles = [ [ [P.b] ], [ [P.b], [P.c], [P.d], [P.s], [P.P__tilde__ST], [P.t], [P.u] ], [ [P.b], [P.c], [P.d], [P.s], [P.t], [P.u] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(2,0,4):C.UVGC_113_10,(2,0,5):C.UVGC_113_9,(0,0,4):C.UVGC_113_10,(0,0,5):C.UVGC_113_9,(6,0,0):C.UVGC_160_85,(6,0,3):C.UVGC_156_65,(6,0,4):C.UVGC_161_90,(6,0,5):C.UVGC_161_91,(6,0,6):C.UVGC_160_88,(6,0,7):C.UVGC_160_89,(4,0,4):C.UVGC_112_7,(4,0,5):C.UVGC_112_8,(3,0,4):C.UVGC_112_7,(3,0,5):C.UVGC_112_8,(8,0,4):C.UVGC_113_9,(8,0,5):C.UVGC_113_10,(7,0,0):C.UVGC_160_85,(7,0,3):C.UVGC_156_65,(7,0,4):C.UVGC_160_86,(7,0,5):C.UVGC_160_87,(7,0,6):C.UVGC_160_88,(7,0,7):C.UVGC_160_89,(5,0,4):C.UVGC_112_7,(5,0,5):C.UVGC_112_8,(1,0,4):C.UVGC_112_7,(1,0,5):C.UVGC_112_8,(11,0,4):C.UVGC_116_13,(11,0,5):C.UVGC_116_14,(10,0,4):C.UVGC_116_13,(10,0,5):C.UVGC_116_14,(9,0,4):C.UVGC_115_11,(9,0,5):C.UVGC_115_12,(2,1,4):C.UVGC_113_10,(2,1,5):C.UVGC_113_9,(0,1,4):C.UVGC_113_10,(0,1,5):C.UVGC_113_9,(4,1,4):C.UVGC_112_7,(4,1,5):C.UVGC_112_8,(3,1,4):C.UVGC_112_7,(3,1,5):C.UVGC_112_8,(8,1,0):C.UVGC_162_92,(8,1,3):C.UVGC_162_93,(8,1,4):C.UVGC_162_94,(8,1,5):C.UVGC_162_95,(8,1,6):C.UVGC_162_96,(8,1,7):C.UVGC_162_97,(6,1,0):C.UVGC_157_71,(6,1,4):C.UVGC_158_76,(6,1,5):C.UVGC_158_77,(6,1,6):C.UVGC_158_78,(6,1,7):C.UVGC_157_75,(7,1,1):C.UVGC_117_15,(7,1,4):C.UVGC_118_18,(7,1,5):C.UVGC_118_19,(5,1,4):C.UVGC_112_7,(5,1,5):C.UVGC_112_8,(1,1,4):C.UVGC_112_7,(1,1,5):C.UVGC_112_8,(11,1,4):C.UVGC_116_13,(11,1,5):C.UVGC_116_14,(10,1,4):C.UVGC_116_13,(10,1,5):C.UVGC_116_14,(9,1,4):C.UVGC_115_11,(9,1,5):C.UVGC_115_12,(2,2,4):C.UVGC_113_10,(2,2,5):C.UVGC_113_9,(0,2,4):C.UVGC_113_10,(0,2,5):C.UVGC_113_9,(4,2,4):C.UVGC_112_7,(4,2,5):C.UVGC_112_8,(3,2,4):C.UVGC_112_7,(3,2,5):C.UVGC_112_8,(8,2,0):C.UVGC_159_79,(8,2,3):C.UVGC_159_80,(8,2,4):C.UVGC_159_81,(8,2,5):C.UVGC_159_82,(8,2,6):C.UVGC_159_83,(8,2,7):C.UVGC_159_84,(6,2,2):C.UVGC_117_15,(6,2,4):C.UVGC_117_16,(6,2,5):C.UVGC_115_11,(6,2,6):C.UVGC_117_17,(7,2,0):C.UVGC_157_71,(7,2,4):C.UVGC_157_72,(7,2,5):C.UVGC_157_73,(7,2,6):C.UVGC_157_74,(7,2,7):C.UVGC_157_75,(5,2,4):C.UVGC_112_7,(5,2,5):C.UVGC_112_8,(1,2,4):C.UVGC_112_7,(1,2,5):C.UVGC_112_8,(11,2,4):C.UVGC_116_13,(11,2,5):C.UVGC_116_14,(10,2,4):C.UVGC_116_13,(10,2,5):C.UVGC_116_14,(9,2,4):C.UVGC_115_11,(9,2,5):C.UVGC_115_12})

V_57 = CTVertex(name = 'V_57',
                type = 'UV',
                particles = [ P.t__tilde__, P.b, P.G__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFS3, L.FFS4 ],
                loop_particles = [ [ [P.b, P.g] ], [ [P.b, P.g, P.t] ], [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_171_109,(0,0,2):C.UVGC_171_110,(0,0,1):C.UVGC_171_111,(0,1,0):C.UVGC_173_114,(0,1,2):C.UVGC_173_115,(0,1,1):C.UVGC_173_116})

V_58 = CTVertex(name = 'V_58',
                type = 'UV',
                particles = [ P.b__tilde__, P.b, P.G0 ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFS1 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_144_34})

V_59 = CTVertex(name = 'V_59',
                type = 'UV',
                particles = [ P.b__tilde__, P.b, P.H ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFS2 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_143_33})

V_60 = CTVertex(name = 'V_60',
                type = 'UV',
                particles = [ P.b__tilde__, P.t, P.G__minus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFS3, L.FFS4 ],
                loop_particles = [ [ [P.b, P.g] ], [ [P.b, P.g, P.t] ], [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_174_117,(0,0,2):C.UVGC_174_118,(0,0,1):C.UVGC_174_119,(0,1,0):C.UVGC_170_106,(0,1,2):C.UVGC_170_107,(0,1,1):C.UVGC_170_108})

V_61 = CTVertex(name = 'V_61',
                type = 'UV',
                particles = [ P.t__tilde__, P.t, P.G0 ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFS1 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_175_120})

V_62 = CTVertex(name = 'V_62',
                type = 'UV',
                particles = [ P.t__tilde__, P.t, P.H ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFS2 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_176_121})

V_63 = CTVertex(name = 'V_63',
                type = 'UV',
                particles = [ P.P__tilde__chi, P.t, P.P__tilde__ST__tilde__ ],
                color = [ 'Identity(2,3)' ],
                lorentz = [ L.FFS3 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST], [P.g, P.P__tilde__ST, P.t] ], [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_172_112,(0,0,1):C.UVGC_172_113})

V_64 = CTVertex(name = 'V_64',
                type = 'UV',
                particles = [ P.t__tilde__, P.P__tilde__chi, P.P__tilde__ST ],
                color = [ 'Identity(1,3)' ],
                lorentz = [ L.FFS4 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST], [P.g, P.P__tilde__ST, P.t] ], [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_172_112,(0,0,1):C.UVGC_172_113})

V_65 = CTVertex(name = 'V_65',
                type = 'UV',
                particles = [ P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'T(1,3,2)' ],
                lorentz = [ L.VSS1, L.VSS3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,0):C.UVGC_149_48,(0,0,1):C.UVGC_149_49,(0,0,2):C.UVGC_149_50,(0,0,3):C.UVGC_149_51,(0,0,5):C.UVGC_149_52,(0,0,6):C.UVGC_149_53,(0,0,4):C.UVGC_149_54,(0,1,0):C.UVGC_150_55,(0,1,1):C.UVGC_150_56,(0,1,2):C.UVGC_150_57,(0,1,3):C.UVGC_150_58,(0,1,5):C.UVGC_150_59,(0,1,6):C.UVGC_150_60,(0,1,4):C.UVGC_152_62})

V_66 = CTVertex(name = 'V_66',
                type = 'UV',
                particles = [ P.g, P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'Identity(1,2)*Identity(3,4)', 'T(1,-1,3)*T(2,4,-1)', 'T(1,4,-1)*T(2,-1,3)' ],
                lorentz = [ L.VVSS1 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.P__tilde__ST] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(2,0,0):C.UVGC_156_64,(2,0,1):C.UVGC_156_65,(2,0,2):C.UVGC_156_66,(2,0,3):C.UVGC_156_67,(2,0,5):C.UVGC_156_68,(2,0,6):C.UVGC_156_69,(2,0,4):C.UVGC_156_70,(1,0,0):C.UVGC_156_64,(1,0,1):C.UVGC_156_65,(1,0,2):C.UVGC_156_66,(1,0,3):C.UVGC_156_67,(1,0,5):C.UVGC_156_68,(1,0,6):C.UVGC_156_69,(1,0,4):C.UVGC_156_70,(0,0,2):C.UVGC_127_24,(0,0,4):C.UVGC_127_25})

V_67 = CTVertex(name = 'V_67',
                type = 'UV',
                particles = [ P.u__tilde__, P.u, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.UVGC_122_23,(0,1,0):C.UVGC_105_5,(0,2,0):C.UVGC_105_5})

V_68 = CTVertex(name = 'V_68',
                type = 'UV',
                particles = [ P.c__tilde__, P.c, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_122_23,(0,1,0):C.UVGC_105_5,(0,2,0):C.UVGC_105_5})

V_69 = CTVertex(name = 'V_69',
                type = 'UV',
                particles = [ P.t__tilde__, P.t, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_122_23,(0,1,0):C.UVGC_164_99,(0,2,0):C.UVGC_164_99})

V_70 = CTVertex(name = 'V_70',
                type = 'UV',
                particles = [ P.d__tilde__, P.d, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_119_20,(0,1,0):C.UVGC_107_6,(0,2,0):C.UVGC_107_6})

V_71 = CTVertex(name = 'V_71',
                type = 'UV',
                particles = [ P.s__tilde__, P.s, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.UVGC_119_20,(0,1,0):C.UVGC_107_6,(0,2,0):C.UVGC_107_6})

V_72 = CTVertex(name = 'V_72',
                type = 'UV',
                particles = [ P.b__tilde__, P.b, P.a ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_119_20,(0,1,0):C.UVGC_139_29,(0,2,0):C.UVGC_139_29})

V_73 = CTVertex(name = 'V_73',
                type = 'UV',
                particles = [ P.u__tilde__, P.u, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.u] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,4):C.UVGC_120_21,(0,1,0):C.UVGC_150_55,(0,1,1):C.UVGC_150_56,(0,1,2):C.UVGC_150_57,(0,1,3):C.UVGC_150_58,(0,1,5):C.UVGC_150_59,(0,1,6):C.UVGC_150_60,(0,1,4):C.UVGC_150_61,(0,2,0):C.UVGC_150_55,(0,2,1):C.UVGC_150_56,(0,2,2):C.UVGC_150_57,(0,2,3):C.UVGC_150_58,(0,2,5):C.UVGC_150_59,(0,2,6):C.UVGC_150_60,(0,2,4):C.UVGC_150_61})

V_74 = CTVertex(name = 'V_74',
                type = 'UV',
                particles = [ P.c__tilde__, P.c, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.c, P.g] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,2):C.UVGC_120_21,(0,1,0):C.UVGC_150_55,(0,1,1):C.UVGC_150_56,(0,1,3):C.UVGC_150_57,(0,1,4):C.UVGC_150_58,(0,1,5):C.UVGC_150_59,(0,1,6):C.UVGC_150_60,(0,1,2):C.UVGC_150_61,(0,2,0):C.UVGC_150_55,(0,2,1):C.UVGC_150_56,(0,2,3):C.UVGC_150_57,(0,2,4):C.UVGC_150_58,(0,2,5):C.UVGC_150_59,(0,2,6):C.UVGC_150_60,(0,2,2):C.UVGC_150_61})

V_75 = CTVertex(name = 'V_75',
                type = 'UV',
                particles = [ P.t__tilde__, P.t, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.t] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,4):C.UVGC_120_21,(0,1,0):C.UVGC_150_55,(0,1,1):C.UVGC_150_56,(0,1,2):C.UVGC_150_57,(0,1,3):C.UVGC_150_58,(0,1,5):C.UVGC_150_59,(0,1,6):C.UVGC_150_60,(0,1,4):C.UVGC_165_100,(0,2,0):C.UVGC_150_55,(0,2,1):C.UVGC_150_56,(0,2,2):C.UVGC_150_57,(0,2,3):C.UVGC_150_58,(0,2,5):C.UVGC_150_59,(0,2,6):C.UVGC_150_60,(0,2,4):C.UVGC_165_100})

V_76 = CTVertex(name = 'V_76',
                type = 'UV',
                particles = [ P.d__tilde__, P.d, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.d, P.g] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,2):C.UVGC_120_21,(0,1,0):C.UVGC_150_55,(0,1,1):C.UVGC_150_56,(0,1,3):C.UVGC_150_57,(0,1,4):C.UVGC_150_58,(0,1,5):C.UVGC_150_59,(0,1,6):C.UVGC_150_60,(0,1,2):C.UVGC_150_61,(0,2,0):C.UVGC_150_55,(0,2,1):C.UVGC_150_56,(0,2,3):C.UVGC_150_57,(0,2,4):C.UVGC_150_58,(0,2,5):C.UVGC_150_59,(0,2,6):C.UVGC_150_60,(0,2,2):C.UVGC_150_61})

V_77 = CTVertex(name = 'V_77',
                type = 'UV',
                particles = [ P.s__tilde__, P.s, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.g, P.s] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,4):C.UVGC_120_21,(0,1,0):C.UVGC_150_55,(0,1,1):C.UVGC_150_56,(0,1,2):C.UVGC_150_57,(0,1,3):C.UVGC_150_58,(0,1,5):C.UVGC_150_59,(0,1,6):C.UVGC_150_60,(0,1,4):C.UVGC_150_61,(0,2,0):C.UVGC_150_55,(0,2,1):C.UVGC_150_56,(0,2,2):C.UVGC_150_57,(0,2,3):C.UVGC_150_58,(0,2,5):C.UVGC_150_59,(0,2,6):C.UVGC_150_60,(0,2,4):C.UVGC_150_61})

V_78 = CTVertex(name = 'V_78',
                type = 'UV',
                particles = [ P.b__tilde__, P.b, P.g ],
                color = [ 'T(3,2,1)' ],
                lorentz = [ L.FFV1, L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b] ], [ [P.b, P.g] ], [ [P.c], [P.d], [P.s], [P.u] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,1):C.UVGC_120_21,(0,1,0):C.UVGC_150_55,(0,1,2):C.UVGC_150_56,(0,1,3):C.UVGC_150_57,(0,1,4):C.UVGC_150_58,(0,1,5):C.UVGC_150_59,(0,1,6):C.UVGC_150_60,(0,1,1):C.UVGC_155_63,(0,2,0):C.UVGC_150_55,(0,2,2):C.UVGC_150_56,(0,2,3):C.UVGC_150_57,(0,2,4):C.UVGC_150_58,(0,2,5):C.UVGC_150_59,(0,2,6):C.UVGC_150_60,(0,2,1):C.UVGC_155_63})

V_79 = CTVertex(name = 'V_79',
                type = 'UV',
                particles = [ P.d__tilde__, P.u, P.W__minus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.d, P.g], [P.g, P.u] ], [ [P.d, P.g, P.u] ] ],
                couplings = {(0,0,0):C.UVGC_136_26,(0,0,1):C.UVGC_136_27})

V_80 = CTVertex(name = 'V_80',
                type = 'UV',
                particles = [ P.s__tilde__, P.c, P.W__minus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.c, P.g], [P.g, P.s] ], [ [P.c, P.g, P.s] ] ],
                couplings = {(0,0,0):C.UVGC_136_26,(0,0,1):C.UVGC_136_27})

V_81 = CTVertex(name = 'V_81',
                type = 'UV',
                particles = [ P.b__tilde__, P.t, P.W__minus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.b, P.g] ], [ [P.b, P.g, P.t] ], [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_167_102,(0,0,2):C.UVGC_167_103,(0,0,1):C.UVGC_136_27})

V_82 = CTVertex(name = 'V_82',
                type = 'UV',
                particles = [ P.u__tilde__, P.d, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.d, P.g], [P.g, P.u] ], [ [P.d, P.g, P.u] ] ],
                couplings = {(0,0,0):C.UVGC_136_26,(0,0,1):C.UVGC_136_27})

V_83 = CTVertex(name = 'V_83',
                type = 'UV',
                particles = [ P.c__tilde__, P.s, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.c, P.g], [P.g, P.s] ], [ [P.c, P.g, P.s] ] ],
                couplings = {(0,0,0):C.UVGC_136_26,(0,0,1):C.UVGC_136_27})

V_84 = CTVertex(name = 'V_84',
                type = 'UV',
                particles = [ P.t__tilde__, P.b, P.W__plus__ ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2 ],
                loop_particles = [ [ [P.b, P.g] ], [ [P.b, P.g, P.t] ], [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_167_102,(0,0,2):C.UVGC_167_103,(0,0,1):C.UVGC_136_27})

V_85 = CTVertex(name = 'V_85',
                type = 'UV',
                particles = [ P.t__tilde__, P.t, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_168_104,(0,1,0):C.UVGC_169_105})

V_86 = CTVertex(name = 'V_86',
                type = 'UV',
                particles = [ P.b__tilde__, P.b, P.Z ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FFV2, L.FFV3 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_141_31,(0,1,0):C.UVGC_142_32})

V_87 = CTVertex(name = 'V_87',
                type = 'UV',
                particles = [ P.u__tilde__, P.u ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF3, L.FF5 ],
                loop_particles = [ [ [P.g, P.u] ] ],
                couplings = {(0,0,0):C.UVGC_121_22,(0,1,0):C.UVGC_104_4,(0,2,0):C.UVGC_104_4})

V_88 = CTVertex(name = 'V_88',
                type = 'UV',
                particles = [ P.c__tilde__, P.c ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF3, L.FF5 ],
                loop_particles = [ [ [P.c, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_121_22,(0,1,0):C.UVGC_104_4,(0,2,0):C.UVGC_104_4})

V_89 = CTVertex(name = 'V_89',
                type = 'UV',
                particles = [ P.t__tilde__, P.t ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3, L.FF4, L.FF5 ],
                loop_particles = [ [ [P.g, P.t] ] ],
                couplings = {(0,0,0):C.UVGC_166_101,(0,2,0):C.UVGC_166_101,(0,1,0):C.UVGC_163_98,(0,3,0):C.UVGC_163_98})

V_90 = CTVertex(name = 'V_90',
                type = 'UV',
                particles = [ P.d__tilde__, P.d ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF3, L.FF5 ],
                loop_particles = [ [ [P.d, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_121_22,(0,1,0):C.UVGC_104_4,(0,2,0):C.UVGC_104_4})

V_91 = CTVertex(name = 'V_91',
                type = 'UV',
                particles = [ P.s__tilde__, P.s ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF1, L.FF3, L.FF5 ],
                loop_particles = [ [ [P.g, P.s] ] ],
                couplings = {(0,0,0):C.UVGC_121_22,(0,1,0):C.UVGC_104_4,(0,2,0):C.UVGC_104_4})

V_92 = CTVertex(name = 'V_92',
                type = 'UV',
                particles = [ P.b__tilde__, P.b ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.FF2, L.FF3, L.FF4, L.FF5 ],
                loop_particles = [ [ [P.b, P.g] ] ],
                couplings = {(0,0,0):C.UVGC_140_30,(0,2,0):C.UVGC_140_30,(0,3,0):C.UVGC_138_28,(0,1,0):C.UVGC_138_28})

V_93 = CTVertex(name = 'V_93',
                type = 'UV',
                particles = [ P.P__tilde__ST__tilde__, P.P__tilde__ST ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.SS1 ],
                loop_particles = [ [ [P.g, P.P__tilde__ST] ] ],
                couplings = {(0,0,0):C.UVGC_145_35})

V_94 = CTVertex(name = 'V_94',
                type = 'UV',
                particles = [ P.g, P.g ],
                color = [ 'Identity(1,2)' ],
                lorentz = [ L.VV1, L.VV3 ],
                loop_particles = [ [ [P.b] ], [ [P.g] ], [ [P.ghG] ], [ [P.P__tilde__ST] ], [ [P.t] ] ],
                couplings = {(0,0,0):C.UVGC_147_39,(0,0,1):C.UVGC_147_40,(0,0,2):C.UVGC_147_41,(0,0,3):C.UVGC_147_42,(0,0,4):C.UVGC_147_43,(0,1,0):C.UVGC_146_36,(0,1,3):C.UVGC_146_37,(0,1,4):C.UVGC_146_38})
