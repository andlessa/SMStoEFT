# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 12.1.0 for Linux x86 (64-bit) (March 18, 2020)
# Date: Mon 28 Aug 2023 15:40:01


from object_library import all_vertices, Vertex
import particles as P
import couplings as C
import lorentz as L


V_1 = Vertex(name = 'V_1',
             particles = [ P.G0, P.G0, P.G0, P.G0 ],
             color = [ '1' ],
             lorentz = [ L.SSSS1 ],
             couplings = {(0,0):C.GC_20})

V_2 = Vertex(name = 'V_2',
             particles = [ P.G0, P.G0, P.G__minus__, P.G__plus__ ],
             color = [ '1' ],
             lorentz = [ L.SSSS1 ],
             couplings = {(0,0):C.GC_18})

V_3 = Vertex(name = 'V_3',
             particles = [ P.G__minus__, P.G__minus__, P.G__plus__, P.G__plus__ ],
             color = [ '1' ],
             lorentz = [ L.SSSS1 ],
             couplings = {(0,0):C.GC_19})

V_4 = Vertex(name = 'V_4',
             particles = [ P.G0, P.G0, P.H, P.H ],
             color = [ '1' ],
             lorentz = [ L.SSSS1 ],
             couplings = {(0,0):C.GC_18})

V_5 = Vertex(name = 'V_5',
             particles = [ P.G__minus__, P.G__plus__, P.H, P.H ],
             color = [ '1' ],
             lorentz = [ L.SSSS1 ],
             couplings = {(0,0):C.GC_18})

V_6 = Vertex(name = 'V_6',
             particles = [ P.H, P.H, P.H, P.H ],
             color = [ '1' ],
             lorentz = [ L.SSSS1 ],
             couplings = {(0,0):C.GC_20})

V_7 = Vertex(name = 'V_7',
             particles = [ P.G0, P.G0, P.H ],
             color = [ '1' ],
             lorentz = [ L.SSS1 ],
             couplings = {(0,0):C.GC_46})

V_8 = Vertex(name = 'V_8',
             particles = [ P.G__minus__, P.G__plus__, P.H ],
             color = [ '1' ],
             lorentz = [ L.SSS1 ],
             couplings = {(0,0):C.GC_46})

V_9 = Vertex(name = 'V_9',
             particles = [ P.H, P.H, P.H ],
             color = [ '1' ],
             lorentz = [ L.SSS1 ],
             couplings = {(0,0):C.GC_47})

V_10 = Vertex(name = 'V_10',
              particles = [ P.a, P.a, P.G__minus__, P.G__plus__ ],
              color = [ '1' ],
              lorentz = [ L.VVSS1 ],
              couplings = {(0,0):C.GC_6})

V_11 = Vertex(name = 'V_11',
              particles = [ P.a, P.G__minus__, P.G__plus__ ],
              color = [ '1' ],
              lorentz = [ L.VSS1 ],
              couplings = {(0,0):C.GC_3})

V_12 = Vertex(name = 'V_12',
              particles = [ P.ghA, P.ghWm__tilde__, P.W__minus__ ],
              color = [ '1' ],
              lorentz = [ L.UUV1 ],
              couplings = {(0,0):C.GC_3})

V_13 = Vertex(name = 'V_13',
              particles = [ P.ghA, P.ghWp__tilde__, P.W__plus__ ],
              color = [ '1' ],
              lorentz = [ L.UUV1 ],
              couplings = {(0,0):C.GC_4})

V_14 = Vertex(name = 'V_14',
              particles = [ P.ghWm, P.ghA__tilde__, P.G__plus__ ],
              color = [ '1' ],
              lorentz = [ L.UUS1 ],
              couplings = {(0,0):C.GC_53})

V_15 = Vertex(name = 'V_15',
              particles = [ P.ghWm, P.ghA__tilde__, P.W__plus__ ],
              color = [ '1' ],
              lorentz = [ L.UUV1 ],
              couplings = {(0,0):C.GC_3})

V_16 = Vertex(name = 'V_16',
              particles = [ P.ghWm, P.ghWm__tilde__, P.G0 ],
              color = [ '1' ],
              lorentz = [ L.UUS1 ],
              couplings = {(0,0):C.GC_48})

V_17 = Vertex(name = 'V_17',
              particles = [ P.ghWm, P.ghWm__tilde__, P.H ],
              color = [ '1' ],
              lorentz = [ L.UUS1 ],
              couplings = {(0,0):C.GC_49})

V_18 = Vertex(name = 'V_18',
              particles = [ P.ghWm, P.ghWm__tilde__, P.a ],
              color = [ '1' ],
              lorentz = [ L.UUV1 ],
              couplings = {(0,0):C.GC_4})

V_19 = Vertex(name = 'V_19',
              particles = [ P.ghWm, P.ghWm__tilde__, P.Z ],
              color = [ '1' ],
              lorentz = [ L.UUV1 ],
              couplings = {(0,0):C.GC_31})

V_20 = Vertex(name = 'V_20',
              particles = [ P.ghWm, P.ghZ__tilde__, P.G__plus__ ],
              color = [ '1' ],
              lorentz = [ L.UUS1 ],
              couplings = {(0,0):C.GC_56})

V_21 = Vertex(name = 'V_21',
              particles = [ P.ghWm, P.ghZ__tilde__, P.W__plus__ ],
              color = [ '1' ],
              lorentz = [ L.UUV1 ],
              couplings = {(0,0):C.GC_30})

V_22 = Vertex(name = 'V_22',
              particles = [ P.ghWp, P.ghA__tilde__, P.G__minus__ ],
              color = [ '1' ],
              lorentz = [ L.UUS1 ],
              couplings = {(0,0):C.GC_52})

V_23 = Vertex(name = 'V_23',
              particles = [ P.ghWp, P.ghA__tilde__, P.W__minus__ ],
              color = [ '1' ],
              lorentz = [ L.UUV1 ],
              couplings = {(0,0):C.GC_4})

V_24 = Vertex(name = 'V_24',
              particles = [ P.ghWp, P.ghWp__tilde__, P.G0 ],
              color = [ '1' ],
              lorentz = [ L.UUS1 ],
              couplings = {(0,0):C.GC_51})

V_25 = Vertex(name = 'V_25',
              particles = [ P.ghWp, P.ghWp__tilde__, P.H ],
              color = [ '1' ],
              lorentz = [ L.UUS1 ],
              couplings = {(0,0):C.GC_49})

V_26 = Vertex(name = 'V_26',
              particles = [ P.ghWp, P.ghWp__tilde__, P.a ],
              color = [ '1' ],
              lorentz = [ L.UUV1 ],
              couplings = {(0,0):C.GC_3})

V_27 = Vertex(name = 'V_27',
              particles = [ P.ghWp, P.ghWp__tilde__, P.Z ],
              color = [ '1' ],
              lorentz = [ L.UUV1 ],
              couplings = {(0,0):C.GC_30})

V_28 = Vertex(name = 'V_28',
              particles = [ P.ghWp, P.ghZ__tilde__, P.G__minus__ ],
              color = [ '1' ],
              lorentz = [ L.UUS1 ],
              couplings = {(0,0):C.GC_55})

V_29 = Vertex(name = 'V_29',
              particles = [ P.ghWp, P.ghZ__tilde__, P.W__minus__ ],
              color = [ '1' ],
              lorentz = [ L.UUV1 ],
              couplings = {(0,0):C.GC_31})

V_30 = Vertex(name = 'V_30',
              particles = [ P.ghZ, P.ghWm__tilde__, P.G__minus__ ],
              color = [ '1' ],
              lorentz = [ L.UUS1 ],
              couplings = {(0,0):C.GC_57})

V_31 = Vertex(name = 'V_31',
              particles = [ P.ghZ, P.ghWm__tilde__, P.W__minus__ ],
              color = [ '1' ],
              lorentz = [ L.UUV1 ],
              couplings = {(0,0):C.GC_30})

V_32 = Vertex(name = 'V_32',
              particles = [ P.ghZ, P.ghWp__tilde__, P.G__plus__ ],
              color = [ '1' ],
              lorentz = [ L.UUS1 ],
              couplings = {(0,0):C.GC_54})

V_33 = Vertex(name = 'V_33',
              particles = [ P.ghZ, P.ghWp__tilde__, P.W__plus__ ],
              color = [ '1' ],
              lorentz = [ L.UUV1 ],
              couplings = {(0,0):C.GC_31})

V_34 = Vertex(name = 'V_34',
              particles = [ P.ghZ, P.ghZ__tilde__, P.H ],
              color = [ '1' ],
              lorentz = [ L.UUS1 ],
              couplings = {(0,0):C.GC_58})

V_35 = Vertex(name = 'V_35',
              particles = [ P.ghG, P.ghG__tilde__, P.g ],
              color = [ 'f(1,2,3)' ],
              lorentz = [ L.UUV1 ],
              couplings = {(0,0):C.GC_10})

V_36 = Vertex(name = 'V_36',
              particles = [ P.g, P.g, P.g ],
              color = [ 'f(1,2,3)' ],
              lorentz = [ L.VVV1 ],
              couplings = {(0,0):C.GC_10})

V_37 = Vertex(name = 'V_37',
              particles = [ P.g, P.g, P.g, P.g ],
              color = [ 'f(-1,1,2)*f(3,4,-1)', 'f(-1,1,3)*f(2,4,-1)', 'f(-1,1,4)*f(2,3,-1)' ],
              lorentz = [ L.VVVV1, L.VVVV3, L.VVVV4 ],
              couplings = {(1,1):C.GC_13,(0,0):C.GC_13,(2,2):C.GC_13})

V_38 = Vertex(name = 'V_38',
              particles = [ P.t__tilde__, P.b, P.G__plus__ ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFS1, L.FFS3 ],
              couplings = {(0,0):C.GC_14,(0,1):C.GC_15})

V_39 = Vertex(name = 'V_39',
              particles = [ P.b__tilde__, P.b, P.G0 ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFS2 ],
              couplings = {(0,0):C.GC_60})

V_40 = Vertex(name = 'V_40',
              particles = [ P.b__tilde__, P.b, P.H ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFS4 ],
              couplings = {(0,0):C.GC_61})

V_41 = Vertex(name = 'V_41',
              particles = [ P.vt__tilde__, P.ta__minus__, P.G__plus__ ],
              color = [ '1' ],
              lorentz = [ L.FFS1 ],
              couplings = {(0,0):C.GC_97})

V_42 = Vertex(name = 'V_42',
              particles = [ P.ta__plus__, P.ta__minus__, P.G0 ],
              color = [ '1' ],
              lorentz = [ L.FFS2 ],
              couplings = {(0,0):C.GC_98})

V_43 = Vertex(name = 'V_43',
              particles = [ P.ta__plus__, P.ta__minus__, P.H ],
              color = [ '1' ],
              lorentz = [ L.FFS4 ],
              couplings = {(0,0):C.GC_99})

V_44 = Vertex(name = 'V_44',
              particles = [ P.b__tilde__, P.t, P.G__minus__ ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFS1, L.FFS3 ],
              couplings = {(0,0):C.GC_16,(0,1):C.GC_17})

V_45 = Vertex(name = 'V_45',
              particles = [ P.t__tilde__, P.t, P.G0 ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFS2 ],
              couplings = {(0,0):C.GC_95})

V_46 = Vertex(name = 'V_46',
              particles = [ P.t__tilde__, P.t, P.H ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFS4 ],
              couplings = {(0,0):C.GC_94})

V_47 = Vertex(name = 'V_47',
              particles = [ P.P__tilde__chi, P.t, P.P__tilde__ST__tilde__ ],
              color = [ 'Identity(2,3)' ],
              lorentz = [ L.FFS1 ],
              couplings = {(0,0):C.GC_62})

V_48 = Vertex(name = 'V_48',
              particles = [ P.t__tilde__, P.P__tilde__chi, P.P__tilde__ST ],
              color = [ 'Identity(1,3)' ],
              lorentz = [ L.FFS3 ],
              couplings = {(0,0):C.GC_62})

V_49 = Vertex(name = 'V_49',
              particles = [ P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
              color = [ 'T(1,3,2)' ],
              lorentz = [ L.VSS1 ],
              couplings = {(0,0):C.GC_11})

V_50 = Vertex(name = 'V_50',
              particles = [ P.g, P.g, P.P__tilde__ST__tilde__, P.P__tilde__ST ],
              color = [ 'T(1,-1,3)*T(2,4,-1)', 'T(1,4,-1)*T(2,-1,3)' ],
              lorentz = [ L.VVSS1 ],
              couplings = {(1,0):C.GC_13,(0,0):C.GC_13})

V_51 = Vertex(name = 'V_51',
              particles = [ P.a, P.W__minus__, P.G0, P.G__plus__ ],
              color = [ '1' ],
              lorentz = [ L.VVSS1 ],
              couplings = {(0,0):C.GC_33})

V_52 = Vertex(name = 'V_52',
              particles = [ P.a, P.W__minus__, P.G__plus__, P.H ],
              color = [ '1' ],
              lorentz = [ L.VVSS1 ],
              couplings = {(0,0):C.GC_32})

V_53 = Vertex(name = 'V_53',
              particles = [ P.a, P.W__minus__, P.G__plus__ ],
              color = [ '1' ],
              lorentz = [ L.VVS1 ],
              couplings = {(0,0):C.GC_52})

V_54 = Vertex(name = 'V_54',
              particles = [ P.W__minus__, P.G0, P.G__plus__ ],
              color = [ '1' ],
              lorentz = [ L.VSS1 ],
              couplings = {(0,0):C.GC_26})

V_55 = Vertex(name = 'V_55',
              particles = [ P.W__minus__, P.G__plus__, P.H ],
              color = [ '1' ],
              lorentz = [ L.VSS1 ],
              couplings = {(0,0):C.GC_24})

V_56 = Vertex(name = 'V_56',
              particles = [ P.a, P.W__minus__, P.W__plus__ ],
              color = [ '1' ],
              lorentz = [ L.VVV1 ],
              couplings = {(0,0):C.GC_4})

V_57 = Vertex(name = 'V_57',
              particles = [ P.a, P.W__plus__, P.G0, P.G__minus__ ],
              color = [ '1' ],
              lorentz = [ L.VVSS1 ],
              couplings = {(0,0):C.GC_33})

V_58 = Vertex(name = 'V_58',
              particles = [ P.a, P.W__plus__, P.G__minus__, P.H ],
              color = [ '1' ],
              lorentz = [ L.VVSS1 ],
              couplings = {(0,0):C.GC_34})

V_59 = Vertex(name = 'V_59',
              particles = [ P.a, P.W__plus__, P.G__minus__ ],
              color = [ '1' ],
              lorentz = [ L.VVS1 ],
              couplings = {(0,0):C.GC_53})

V_60 = Vertex(name = 'V_60',
              particles = [ P.W__plus__, P.G0, P.G__minus__ ],
              color = [ '1' ],
              lorentz = [ L.VSS1 ],
              couplings = {(0,0):C.GC_25})

V_61 = Vertex(name = 'V_61',
              particles = [ P.W__plus__, P.G__minus__, P.H ],
              color = [ '1' ],
              lorentz = [ L.VSS1 ],
              couplings = {(0,0):C.GC_24})

V_62 = Vertex(name = 'V_62',
              particles = [ P.W__minus__, P.W__plus__, P.G0, P.G0 ],
              color = [ '1' ],
              lorentz = [ L.VVSS1 ],
              couplings = {(0,0):C.GC_21})

V_63 = Vertex(name = 'V_63',
              particles = [ P.W__minus__, P.W__plus__, P.G__minus__, P.G__plus__ ],
              color = [ '1' ],
              lorentz = [ L.VVSS1 ],
              couplings = {(0,0):C.GC_21})

V_64 = Vertex(name = 'V_64',
              particles = [ P.W__minus__, P.W__plus__, P.H, P.H ],
              color = [ '1' ],
              lorentz = [ L.VVSS1 ],
              couplings = {(0,0):C.GC_21})

V_65 = Vertex(name = 'V_65',
              particles = [ P.W__minus__, P.W__plus__, P.H ],
              color = [ '1' ],
              lorentz = [ L.VVS1 ],
              couplings = {(0,0):C.GC_50})

V_66 = Vertex(name = 'V_66',
              particles = [ P.a, P.a, P.W__minus__, P.W__plus__ ],
              color = [ '1' ],
              lorentz = [ L.VVVV2 ],
              couplings = {(0,0):C.GC_5})

V_67 = Vertex(name = 'V_67',
              particles = [ P.W__minus__, P.W__plus__, P.Z ],
              color = [ '1' ],
              lorentz = [ L.VVV1 ],
              couplings = {(0,0):C.GC_31})

V_68 = Vertex(name = 'V_68',
              particles = [ P.W__minus__, P.W__minus__, P.W__plus__, P.W__plus__ ],
              color = [ '1' ],
              lorentz = [ L.VVVV2 ],
              couplings = {(0,0):C.GC_22})

V_69 = Vertex(name = 'V_69',
              particles = [ P.ta__plus__, P.vt, P.G__minus__ ],
              color = [ '1' ],
              lorentz = [ L.FFS3 ],
              couplings = {(0,0):C.GC_96})

V_70 = Vertex(name = 'V_70',
              particles = [ P.a, P.Z, P.G__minus__, P.G__plus__ ],
              color = [ '1' ],
              lorentz = [ L.VVSS1 ],
              couplings = {(0,0):C.GC_41})

V_71 = Vertex(name = 'V_71',
              particles = [ P.Z, P.G0, P.H ],
              color = [ '1' ],
              lorentz = [ L.VSS1 ],
              couplings = {(0,0):C.GC_38})

V_72 = Vertex(name = 'V_72',
              particles = [ P.Z, P.G__minus__, P.G__plus__ ],
              color = [ '1' ],
              lorentz = [ L.VSS1 ],
              couplings = {(0,0):C.GC_39})

V_73 = Vertex(name = 'V_73',
              particles = [ P.W__minus__, P.Z, P.G0, P.G__plus__ ],
              color = [ '1' ],
              lorentz = [ L.VVSS1 ],
              couplings = {(0,0):C.GC_8})

V_74 = Vertex(name = 'V_74',
              particles = [ P.W__minus__, P.Z, P.G__plus__, P.H ],
              color = [ '1' ],
              lorentz = [ L.VVSS1 ],
              couplings = {(0,0):C.GC_9})

V_75 = Vertex(name = 'V_75',
              particles = [ P.W__minus__, P.Z, P.G__plus__ ],
              color = [ '1' ],
              lorentz = [ L.VVS1 ],
              couplings = {(0,0):C.GC_45})

V_76 = Vertex(name = 'V_76',
              particles = [ P.W__plus__, P.Z, P.G0, P.G__minus__ ],
              color = [ '1' ],
              lorentz = [ L.VVSS1 ],
              couplings = {(0,0):C.GC_8})

V_77 = Vertex(name = 'V_77',
              particles = [ P.W__plus__, P.Z, P.G__minus__, P.H ],
              color = [ '1' ],
              lorentz = [ L.VVSS1 ],
              couplings = {(0,0):C.GC_7})

V_78 = Vertex(name = 'V_78',
              particles = [ P.W__plus__, P.Z, P.G__minus__ ],
              color = [ '1' ],
              lorentz = [ L.VVS1 ],
              couplings = {(0,0):C.GC_44})

V_79 = Vertex(name = 'V_79',
              particles = [ P.a, P.W__minus__, P.W__plus__, P.Z ],
              color = [ '1' ],
              lorentz = [ L.VVVV5 ],
              couplings = {(0,0):C.GC_35})

V_80 = Vertex(name = 'V_80',
              particles = [ P.Z, P.Z, P.G0, P.G0 ],
              color = [ '1' ],
              lorentz = [ L.VVSS1 ],
              couplings = {(0,0):C.GC_43})

V_81 = Vertex(name = 'V_81',
              particles = [ P.Z, P.Z, P.G__minus__, P.G__plus__ ],
              color = [ '1' ],
              lorentz = [ L.VVSS1 ],
              couplings = {(0,0):C.GC_42})

V_82 = Vertex(name = 'V_82',
              particles = [ P.Z, P.Z, P.H, P.H ],
              color = [ '1' ],
              lorentz = [ L.VVSS1 ],
              couplings = {(0,0):C.GC_43})

V_83 = Vertex(name = 'V_83',
              particles = [ P.Z, P.Z, P.H ],
              color = [ '1' ],
              lorentz = [ L.VVS1 ],
              couplings = {(0,0):C.GC_59})

V_84 = Vertex(name = 'V_84',
              particles = [ P.W__minus__, P.W__plus__, P.Z, P.Z ],
              color = [ '1' ],
              lorentz = [ L.VVVV2 ],
              couplings = {(0,0):C.GC_23})

# V_85 = Vertex(name = 'V_85',
#               particles = [ P.t__tilde__, P.t, P.g ],
#               color = [ 'T(3,2,1)' ],
#               lorentz = [ L.FFV1, L.FFV2, L.FFV3, L.FFV7, L.FFV8, L.FFV9 ],
#               couplings = {(0,0):C.GC_12,(0,1):C.GC_68,(0,2):C.GC_64,(0,4):C.GC_65,(0,5):C.GC_66,(0,3):C.GC_67})


V_85 = Vertex(name = 'V_85',
              particles = [ P.t__tilde__, P.t, P.g ],
              color = [ 'T(3,2,1)' ],
              lorentz = [ L.FFV1, L.FFVNP1, L.FFVNP2, L.FFVNP3, L.FFVNP4 ],
              couplings = {(0,0):C.GC_12,(0,1):C.GC_103,(0,2):C.GC_103,(0,3):C.GC_104,(0,4):C.GC_103})

V_86 = Vertex(name = 'V_86',
              particles = [ P.e__plus__, P.e__minus__, P.a ],
              color = [ '1' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_3})

V_87 = Vertex(name = 'V_87',
              particles = [ P.mu__plus__, P.mu__minus__, P.a ],
              color = [ '1' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_3})

V_88 = Vertex(name = 'V_88',
              particles = [ P.ta__plus__, P.ta__minus__, P.a ],
              color = [ '1' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_3})

V_89 = Vertex(name = 'V_89',
              particles = [ P.u__tilde__, P.u, P.a ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_2})

V_90 = Vertex(name = 'V_90',
              particles = [ P.c__tilde__, P.c, P.a ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_2})

V_91 = Vertex(name = 'V_91',
              particles = [ P.t__tilde__, P.t, P.a ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV1, L.FFV3, L.FFV8 ],
              couplings = {(0,0):C.GC_2,(0,1):C.GC_63,(0,2):C.GC_73})

V_92 = Vertex(name = 'V_92',
              particles = [ P.d__tilde__, P.d, P.a ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_1})

V_93 = Vertex(name = 'V_93',
              particles = [ P.s__tilde__, P.s, P.a ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_1})

V_94 = Vertex(name = 'V_94',
              particles = [ P.b__tilde__, P.b, P.a ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_1})

V_95 = Vertex(name = 'V_95',
              particles = [ P.u__tilde__, P.u, P.g ],
              color = [ 'T(3,2,1)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_12})

V_96 = Vertex(name = 'V_96',
              particles = [ P.c__tilde__, P.c, P.g ],
              color = [ 'T(3,2,1)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_12})

V_97 = Vertex(name = 'V_97',
              particles = [ P.d__tilde__, P.d, P.g ],
              color = [ 'T(3,2,1)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_12})

V_98 = Vertex(name = 'V_98',
              particles = [ P.s__tilde__, P.s, P.g ],
              color = [ 'T(3,2,1)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_12})

V_99 = Vertex(name = 'V_99',
              particles = [ P.b__tilde__, P.b, P.g ],
              color = [ 'T(3,2,1)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_12})

V_100 = Vertex(name = 'V_100',
               particles = [ P.d__tilde__, P.u, P.W__minus__ ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFV2 ],
               couplings = {(0,0):C.GC_27})

V_101 = Vertex(name = 'V_101',
               particles = [ P.s__tilde__, P.c, P.W__minus__ ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFV2 ],
               couplings = {(0,0):C.GC_27})

V_102 = Vertex(name = 'V_102',
               particles = [ P.b__tilde__, P.t, P.W__minus__ ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFV2 ],
               couplings = {(0,0):C.GC_27})

V_103 = Vertex(name = 'V_103',
               particles = [ P.u__tilde__, P.d, P.W__plus__ ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFV2 ],
               couplings = {(0,0):C.GC_27})

V_104 = Vertex(name = 'V_104',
               particles = [ P.c__tilde__, P.s, P.W__plus__ ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFV2 ],
               couplings = {(0,0):C.GC_27})

V_105 = Vertex(name = 'V_105',
               particles = [ P.t__tilde__, P.b, P.W__plus__ ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFV2 ],
               couplings = {(0,0):C.GC_27})

V_106 = Vertex(name = 'V_106',
               particles = [ P.e__plus__, P.ve, P.W__minus__ ],
               color = [ '1' ],
               lorentz = [ L.FFV2 ],
               couplings = {(0,0):C.GC_27})

V_107 = Vertex(name = 'V_107',
               particles = [ P.mu__plus__, P.vm, P.W__minus__ ],
               color = [ '1' ],
               lorentz = [ L.FFV2 ],
               couplings = {(0,0):C.GC_27})

V_108 = Vertex(name = 'V_108',
               particles = [ P.ta__plus__, P.vt, P.W__minus__ ],
               color = [ '1' ],
               lorentz = [ L.FFV2 ],
               couplings = {(0,0):C.GC_27})

V_109 = Vertex(name = 'V_109',
               particles = [ P.ve__tilde__, P.e__minus__, P.W__plus__ ],
               color = [ '1' ],
               lorentz = [ L.FFV2 ],
               couplings = {(0,0):C.GC_27})

V_110 = Vertex(name = 'V_110',
               particles = [ P.vm__tilde__, P.mu__minus__, P.W__plus__ ],
               color = [ '1' ],
               lorentz = [ L.FFV2 ],
               couplings = {(0,0):C.GC_27})

V_111 = Vertex(name = 'V_111',
               particles = [ P.vt__tilde__, P.ta__minus__, P.W__plus__ ],
               color = [ '1' ],
               lorentz = [ L.FFV2 ],
               couplings = {(0,0):C.GC_27})

V_112 = Vertex(name = 'V_112',
               particles = [ P.u__tilde__, P.u, P.Z ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFV2, L.FFV6 ],
               couplings = {(0,0):C.GC_29,(0,1):C.GC_36})

V_113 = Vertex(name = 'V_113',
               particles = [ P.c__tilde__, P.c, P.Z ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFV2, L.FFV6 ],
               couplings = {(0,0):C.GC_29,(0,1):C.GC_36})

V_114 = Vertex(name = 'V_114',
               particles = [ P.t__tilde__, P.t, P.Z ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFV2, L.FFV3, L.FFV6, L.FFV8 ],
               couplings = {(0,0):C.GC_29,(0,2):C.GC_36,(0,1):C.GC_72,(0,3):C.GC_84})

V_115 = Vertex(name = 'V_115',
               particles = [ P.d__tilde__, P.d, P.Z ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFV2, L.FFV4 ],
               couplings = {(0,0):C.GC_28,(0,1):C.GC_36})

V_116 = Vertex(name = 'V_116',
               particles = [ P.s__tilde__, P.s, P.Z ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFV2, L.FFV4 ],
               couplings = {(0,0):C.GC_28,(0,1):C.GC_36})

V_117 = Vertex(name = 'V_117',
               particles = [ P.b__tilde__, P.b, P.Z ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFV2, L.FFV4 ],
               couplings = {(0,0):C.GC_28,(0,1):C.GC_36})

V_118 = Vertex(name = 'V_118',
               particles = [ P.ve__tilde__, P.ve, P.Z ],
               color = [ '1' ],
               lorentz = [ L.FFV2 ],
               couplings = {(0,0):C.GC_40})

V_119 = Vertex(name = 'V_119',
               particles = [ P.vm__tilde__, P.vm, P.Z ],
               color = [ '1' ],
               lorentz = [ L.FFV2 ],
               couplings = {(0,0):C.GC_40})

V_120 = Vertex(name = 'V_120',
               particles = [ P.vt__tilde__, P.vt, P.Z ],
               color = [ '1' ],
               lorentz = [ L.FFV2 ],
               couplings = {(0,0):C.GC_40})

V_121 = Vertex(name = 'V_121',
               particles = [ P.e__plus__, P.e__minus__, P.Z ],
               color = [ '1' ],
               lorentz = [ L.FFV2, L.FFV5 ],
               couplings = {(0,0):C.GC_28,(0,1):C.GC_37})

V_122 = Vertex(name = 'V_122',
               particles = [ P.mu__plus__, P.mu__minus__, P.Z ],
               color = [ '1' ],
               lorentz = [ L.FFV2, L.FFV5 ],
               couplings = {(0,0):C.GC_28,(0,1):C.GC_37})

V_123 = Vertex(name = 'V_123',
               particles = [ P.ta__plus__, P.ta__minus__, P.Z ],
               color = [ '1' ],
               lorentz = [ L.FFV2, L.FFV5 ],
               couplings = {(0,0):C.GC_28,(0,1):C.GC_37})

V_124 = Vertex(name = 'V_124',
               particles = [ P.t__tilde__, P.t, P.a, P.a ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFVV2 ],
               couplings = {(0,0):C.GC_74})

V_125 = Vertex(name = 'V_125',
               particles = [ P.t__tilde__, P.t, P.a, P.Z ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFVV2 ],
               couplings = {(0,0):C.GC_85})

V_126 = Vertex(name = 'V_126',
               particles = [ P.t__tilde__, P.t, P.Z, P.Z ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFVV2 ],
               couplings = {(0,0):C.GC_90})

V_127 = Vertex(name = 'V_127',
               particles = [ P.t__tilde__, P.t, P.a, P.a, P.a ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFVVV7 ],
               couplings = {(0,0):C.GC_75})

V_128 = Vertex(name = 'V_128',
               particles = [ P.t__tilde__, P.t, P.a, P.a, P.Z ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFVVV7 ],
               couplings = {(0,0):C.GC_86})

V_129 = Vertex(name = 'V_129',
               particles = [ P.t__tilde__, P.t, P.a, P.Z, P.Z ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFVVV7 ],
               couplings = {(0,0):C.GC_91})

V_130 = Vertex(name = 'V_130',
               particles = [ P.t__tilde__, P.t, P.Z, P.Z, P.Z ],
               color = [ 'Identity(1,2)' ],
               lorentz = [ L.FFVVV7 ],
               couplings = {(0,0):C.GC_93})

V_131 = Vertex(name = 'V_131',
               particles = [ P.t__tilde__, P.t, P.a, P.g ],
               color = [ 'T(4,2,1)' ],
               lorentz = [ L.FFVV2 ],
               couplings = {(0,0):C.GC_76})

V_132 = Vertex(name = 'V_132',
               particles = [ P.t__tilde__, P.t, P.g, P.Z ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFVV2 ],
               couplings = {(0,0):C.GC_87})

# V_133 = Vertex(name = 'V_133',
#                particles = [ P.t__tilde__, P.t, P.g, P.g ],
#                color = [ 'f(-1,3,4)*T(-1,2,1)', 'T(3,-1,1)*T(4,2,-1)', 'T(3,2,-1)*T(4,-1,1)' ],
#                lorentz = [ L.FFVV1, L.FFVV3, L.FFVV4, L.FFVV5, L.FFVV6 ],
#                couplings = {(2,1):C.GC_78,(1,2):C.GC_78,(0,0):C.GC_69,(0,3):C.GC_71,(0,4):C.GC_70})

V_133 = Vertex(name = 'V_133',
               particles = [ P.t__tilde__, P.t, P.g, P.g ],
               color = [ 'T(3,2,-1)*T(4,-1,1)', 'T(4,2,-1)*T(3,-1,1)' ],
               lorentz = [ L.FFVVNP1, L.FFVVNP2, L.FFVVNP3, L.FFVVNP4, L.FFVVNP5, L.FFVVNP6, L.FFVVNP7, L.FFVVNP8, L.FFVVNP9, L.FFVVNP10, 
                           L.FFVVNP11, L.FFVVNP12, L.FFVVNP13, L.FFVVNP14,                          
                           L.FFVVNP21, L.FFVVNP22, L.FFVVNP23, L.FFVVNP24, L.FFVVNP25, L.FFVVNP26, L.FFVVNP27, L.FFVVNP28, L.FFVVNP29, L.FFVVNP30 ],
               couplings = {(0,0):C.GC_100, (0,1):C.GC_100, (0,2):C.GC_100, (0,3):C.GC_100, (0,4):C.GC_100, (1,5):C.GC_100, (1,6):C.GC_100, (1,7):C.GC_100, (1,8):C.GC_100, (1,9):C.GC_100,
                            (0,10):C.GC_101,(0,11):C.GC_101,(1,12):C.GC_101,(1,13):C.GC_101,                            
                            (0,14):C.GC_102, (0,15):C.GC_102, (0,16):C.GC_102, (0,17):C.GC_102, (0,18):C.GC_102, (1,19):C.GC_102, (1,20):C.GC_102, (1,21):C.GC_102, (1,22):C.GC_102, (1,23):C.GC_102}
                            )


V_134 = Vertex(name = 'V_134',
               particles = [ P.t__tilde__, P.t, P.a, P.a, P.g ],
               color = [ 'T(5,2,1)' ],
               lorentz = [ L.FFVVV7 ],
               couplings = {(0,0):C.GC_77})

V_135 = Vertex(name = 'V_135',
               particles = [ P.t__tilde__, P.t, P.a, P.g, P.Z ],
               color = [ 'T(4,2,1)' ],
               lorentz = [ L.FFVVV7 ],
               couplings = {(0,0):C.GC_88})

V_136 = Vertex(name = 'V_136',
               particles = [ P.t__tilde__, P.t, P.g, P.Z, P.Z ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFVVV7 ],
               couplings = {(0,0):C.GC_92})

V_137 = Vertex(name = 'V_137',
               particles = [ P.t__tilde__, P.t, P.a, P.g, P.g ],
               color = [ 'T(4,-1,1)*T(5,2,-1)', 'T(4,2,-1)*T(5,-1,1)' ],
               lorentz = [ L.FFVVV7 ],
               couplings = {(1,0):C.GC_79,(0,0):C.GC_79})

V_138 = Vertex(name = 'V_138',
               particles = [ P.t__tilde__, P.t, P.g, P.g, P.Z ],
               color = [ 'T(3,-1,1)*T(4,2,-1)', 'T(3,2,-1)*T(4,-1,1)' ],
               lorentz = [ L.FFVVV7 ],
               couplings = {(1,0):C.GC_89,(0,0):C.GC_89})

V_139 = Vertex(name = 'V_139',
               particles = [ P.t__tilde__, P.t, P.g, P.g, P.g ],
               color = [ 'f(-1,-2,3)*f(4,5,-1)*T(-2,2,1)', 'f(-1,-2,4)*f(3,5,-1)*T(-2,2,1)', 'f(-1,-2,5)*f(3,4,-1)*T(-2,2,1)', 'f(-2,3,4)*T(-2,-1,1)*T(5,2,-1)', 'f(-2,3,4)*T(-2,2,-1)*T(5,-1,1)', 'f(-2,3,5)*T(-2,-1,1)*T(4,2,-1)', 'f(-2,3,5)*T(-2,2,-1)*T(4,-1,1)', 'f(-2,4,5)*T(-2,-1,1)*T(3,2,-1)', 'f(-2,4,5)*T(-2,2,-1)*T(3,-1,1)', 'T(3,-1,1)*T(4,-2,-1)*T(5,2,-2)', 'T(3,-1,1)*T(4,2,-2)*T(5,-2,-1)', 'T(3,-1,-2)*T(4,-2,1)*T(5,2,-1)', 'T(3,-1,-2)*T(4,2,-1)*T(5,-2,1)', 'T(3,2,-1)*T(4,-1,-2)*T(5,-2,1)', 'T(3,2,-1)*T(4,-2,1)*T(5,-1,-2)' ],
               lorentz = [ L.FFVVV1, L.FFVVV2, L.FFVVV3, L.FFVVV4, L.FFVVV5, L.FFVVV6 ],
               couplings = {(2,4):C.GC_82,(1,2):C.GC_82,(6,2):C.GC_83,(5,2):C.GC_80,(14,5):C.GC_81,(4,4):C.GC_83,(10,5):C.GC_81,(13,3):C.GC_81,(3,4):C.GC_80,(9,3):C.GC_81,(0,0):C.GC_82,(8,0):C.GC_83,(7,0):C.GC_80,(12,1):C.GC_81,(11,1):C.GC_81})

