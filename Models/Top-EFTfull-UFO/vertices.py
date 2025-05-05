# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 14.1.0 for Linux x86 (64-bit) (July 16, 2024)
# Date: Mon 5 May 2025 18:50:11


from object_library import all_vertices, Vertex
import particles as P
import couplings as C
import lorentz as L


V_1 = Vertex(name = 'V_1',
             particles = [ P.H, P.H, P.H, P.H ],
             color = [ '1' ],
             lorentz = [ L.SSSS1 ],
             couplings = {(0,0):C.GC_38})

V_2 = Vertex(name = 'V_2',
             particles = [ P.H, P.H, P.H ],
             color = [ '1' ],
             lorentz = [ L.SSS1 ],
             couplings = {(0,0):C.GC_60})

V_3 = Vertex(name = 'V_3',
             particles = [ P.ghG, P.ghG__tilde__, P.g ],
             color = [ 'f(1,2,3)' ],
             lorentz = [ L.UUV1 ],
             couplings = {(0,0):C.GC_29})

V_4 = Vertex(name = 'V_4',
             particles = [ P.g, P.g, P.g ],
             color = [ 'f(1,2,3)' ],
             lorentz = [ L.VVV1, L.VVV2 ],
             couplings = {(0,1):C.GC_4,(0,0):C.GC_29})

V_5 = Vertex(name = 'V_5',
             particles = [ P.g, P.g, P.g, P.g ],
             color = [ 'f(-1,1,2)*f(3,4,-1)', 'f(-1,1,3)*f(2,4,-1)', 'f(-1,1,4)*f(2,3,-1)' ],
             lorentz = [ L.VVVV1, L.VVVV2, L.VVVV4, L.VVVV5, L.VVVV7, L.VVVV8 ],
             couplings = {(0,1):C.GC_31,(1,5):C.GC_31,(2,4):C.GC_31,(1,2):C.GC_33,(0,0):C.GC_33,(2,3):C.GC_33})

V_6 = Vertex(name = 'V_6',
             particles = [ P.g, P.g, P.g, P.g, P.g ],
             color = [ 'f(-2,1,2)*f(-1,-2,3)*f(4,5,-1)', 'f(-2,1,2)*f(-1,-2,4)*f(3,5,-1)', 'f(-2,1,2)*f(-1,-2,5)*f(3,4,-1)', 'f(-2,1,3)*f(-1,-2,2)*f(4,5,-1)', 'f(-2,1,3)*f(-1,-2,4)*f(2,5,-1)', 'f(-2,1,3)*f(-1,-2,5)*f(2,4,-1)', 'f(-2,1,4)*f(-1,-2,2)*f(3,5,-1)', 'f(-2,1,4)*f(-1,-2,3)*f(2,5,-1)', 'f(-2,1,4)*f(-1,-2,5)*f(2,3,-1)', 'f(-2,1,5)*f(-1,-2,2)*f(3,4,-1)', 'f(-2,1,5)*f(-1,-2,3)*f(2,4,-1)', 'f(-2,1,5)*f(-1,-2,4)*f(2,3,-1)', 'f(-2,2,3)*f(-1,-2,1)*f(4,5,-1)', 'f(-2,2,3)*f(-1,-2,4)*f(1,5,-1)', 'f(-2,2,3)*f(-1,-2,5)*f(1,4,-1)', 'f(-2,2,4)*f(-1,-2,1)*f(3,5,-1)', 'f(-2,2,4)*f(-1,-2,3)*f(1,5,-1)', 'f(-2,2,4)*f(-1,-2,5)*f(1,3,-1)', 'f(-2,2,5)*f(-1,-2,1)*f(3,4,-1)', 'f(-2,2,5)*f(-1,-2,3)*f(1,4,-1)', 'f(-2,2,5)*f(-1,-2,4)*f(1,3,-1)', 'f(-2,3,4)*f(-1,-2,1)*f(2,5,-1)', 'f(-2,3,4)*f(-1,-2,2)*f(1,5,-1)', 'f(-2,3,4)*f(-1,-2,5)*f(1,2,-1)', 'f(-2,3,5)*f(-1,-2,1)*f(2,4,-1)', 'f(-2,3,5)*f(-1,-2,2)*f(1,4,-1)', 'f(-2,3,5)*f(-1,-2,4)*f(1,2,-1)', 'f(-2,4,5)*f(-1,-2,1)*f(2,3,-1)', 'f(-2,4,5)*f(-1,-2,2)*f(1,3,-1)', 'f(-2,4,5)*f(-1,-2,3)*f(1,2,-1)' ],
             lorentz = [ L.VVVVV1, L.VVVVV10, L.VVVVV11, L.VVVVV12, L.VVVVV13, L.VVVVV14, L.VVVVV15, L.VVVVV2, L.VVVVV3, L.VVVVV4, L.VVVVV5, L.VVVVV6, L.VVVVV7, L.VVVVV8, L.VVVVV9 ],
             couplings = {(24,9):C.GC_35,(21,10):C.GC_34,(18,10):C.GC_35,(15,9):C.GC_34,(28,7):C.GC_35,(22,14):C.GC_35,(9,14):C.GC_34,(3,7):C.GC_34,(29,8):C.GC_35,(16,1):C.GC_35,(10,1):C.GC_34,(0,8):C.GC_34,(26,4):C.GC_34,(20,3):C.GC_34,(4,3):C.GC_35,(1,4):C.GC_35,(25,13):C.GC_35,(6,13):C.GC_34,(19,2):C.GC_35,(7,2):C.GC_34,(23,6):C.GC_34,(17,5):C.GC_34,(5,5):C.GC_35,(2,6):C.GC_35,(27,0):C.GC_35,(12,0):C.GC_34,(13,11):C.GC_35,(11,11):C.GC_34,(14,12):C.GC_34,(8,12):C.GC_35})

V_7 = Vertex(name = 'V_7',
             particles = [ P.g, P.g, P.g, P.g, P.g, P.g ],
             color = [ 'f(-3,1,2)*f(-2,3,4)*f(-1,-2,-3)*f(5,6,-1)', 'f(-3,1,2)*f(-2,3,5)*f(-1,-2,-3)*f(4,6,-1)', 'f(-3,1,2)*f(-2,3,6)*f(-1,-2,-3)*f(4,5,-1)', 'f(-3,1,2)*f(-2,4,5)*f(-1,-2,-3)*f(3,6,-1)', 'f(-3,1,2)*f(-2,4,6)*f(-1,-2,-3)*f(3,5,-1)', 'f(-3,1,2)*f(-2,5,6)*f(-1,-2,-3)*f(3,4,-1)', 'f(-3,1,3)*f(-2,2,4)*f(-1,-2,-3)*f(5,6,-1)', 'f(-3,1,3)*f(-2,2,5)*f(-1,-2,-3)*f(4,6,-1)', 'f(-3,1,3)*f(-2,2,6)*f(-1,-2,-3)*f(4,5,-1)', 'f(-3,1,3)*f(-2,4,5)*f(-1,-2,-3)*f(2,6,-1)', 'f(-3,1,3)*f(-2,4,6)*f(-1,-2,-3)*f(2,5,-1)', 'f(-3,1,3)*f(-2,5,6)*f(-1,-2,-3)*f(2,4,-1)', 'f(-3,1,4)*f(-2,2,3)*f(-1,-2,-3)*f(5,6,-1)', 'f(-3,1,4)*f(-2,2,5)*f(-1,-2,-3)*f(3,6,-1)', 'f(-3,1,4)*f(-2,2,6)*f(-1,-2,-3)*f(3,5,-1)', 'f(-3,1,4)*f(-2,3,5)*f(-1,-2,-3)*f(2,6,-1)', 'f(-3,1,4)*f(-2,3,6)*f(-1,-2,-3)*f(2,5,-1)', 'f(-3,1,4)*f(-2,5,6)*f(-1,-2,-3)*f(2,3,-1)', 'f(-3,1,5)*f(-2,2,3)*f(-1,-2,-3)*f(4,6,-1)', 'f(-3,1,5)*f(-2,2,4)*f(-1,-2,-3)*f(3,6,-1)', 'f(-3,1,5)*f(-2,2,6)*f(-1,-2,-3)*f(3,4,-1)', 'f(-3,1,5)*f(-2,3,4)*f(-1,-2,-3)*f(2,6,-1)', 'f(-3,1,5)*f(-2,3,6)*f(-1,-2,-3)*f(2,4,-1)', 'f(-3,1,5)*f(-2,4,6)*f(-1,-2,-3)*f(2,3,-1)', 'f(-3,1,6)*f(-2,2,3)*f(-1,-2,-3)*f(4,5,-1)', 'f(-3,1,6)*f(-2,2,4)*f(-1,-2,-3)*f(3,5,-1)', 'f(-3,1,6)*f(-2,2,5)*f(-1,-2,-3)*f(3,4,-1)', 'f(-3,1,6)*f(-2,3,4)*f(-1,-2,-3)*f(2,5,-1)', 'f(-3,1,6)*f(-2,3,5)*f(-1,-2,-3)*f(2,4,-1)', 'f(-3,1,6)*f(-2,4,5)*f(-1,-2,-3)*f(2,3,-1)', 'f(-3,2,3)*f(-2,1,4)*f(-1,-2,-3)*f(5,6,-1)', 'f(-3,2,3)*f(-2,1,5)*f(-1,-2,-3)*f(4,6,-1)', 'f(-3,2,3)*f(-2,1,6)*f(-1,-2,-3)*f(4,5,-1)', 'f(-3,2,3)*f(-2,4,5)*f(-1,-2,-3)*f(1,6,-1)', 'f(-3,2,3)*f(-2,4,6)*f(-1,-2,-3)*f(1,5,-1)', 'f(-3,2,3)*f(-2,5,6)*f(-1,-2,-3)*f(1,4,-1)', 'f(-3,2,4)*f(-2,1,3)*f(-1,-2,-3)*f(5,6,-1)', 'f(-3,2,4)*f(-2,1,5)*f(-1,-2,-3)*f(3,6,-1)', 'f(-3,2,4)*f(-2,1,6)*f(-1,-2,-3)*f(3,5,-1)', 'f(-3,2,4)*f(-2,3,5)*f(-1,-2,-3)*f(1,6,-1)', 'f(-3,2,4)*f(-2,3,6)*f(-1,-2,-3)*f(1,5,-1)', 'f(-3,2,4)*f(-2,5,6)*f(-1,-2,-3)*f(1,3,-1)', 'f(-3,2,5)*f(-2,1,3)*f(-1,-2,-3)*f(4,6,-1)', 'f(-3,2,5)*f(-2,1,4)*f(-1,-2,-3)*f(3,6,-1)', 'f(-3,2,5)*f(-2,1,6)*f(-1,-2,-3)*f(3,4,-1)', 'f(-3,2,5)*f(-2,3,4)*f(-1,-2,-3)*f(1,6,-1)', 'f(-3,2,5)*f(-2,3,6)*f(-1,-2,-3)*f(1,4,-1)', 'f(-3,2,5)*f(-2,4,6)*f(-1,-2,-3)*f(1,3,-1)', 'f(-3,2,6)*f(-2,1,3)*f(-1,-2,-3)*f(4,5,-1)', 'f(-3,2,6)*f(-2,1,4)*f(-1,-2,-3)*f(3,5,-1)', 'f(-3,2,6)*f(-2,1,5)*f(-1,-2,-3)*f(3,4,-1)', 'f(-3,2,6)*f(-2,3,4)*f(-1,-2,-3)*f(1,5,-1)', 'f(-3,2,6)*f(-2,3,5)*f(-1,-2,-3)*f(1,4,-1)', 'f(-3,2,6)*f(-2,4,5)*f(-1,-2,-3)*f(1,3,-1)', 'f(-3,3,4)*f(-2,1,2)*f(-1,-2,-3)*f(5,6,-1)', 'f(-3,3,4)*f(-2,1,5)*f(-1,-2,-3)*f(2,6,-1)', 'f(-3,3,4)*f(-2,1,6)*f(-1,-2,-3)*f(2,5,-1)', 'f(-3,3,4)*f(-2,2,5)*f(-1,-2,-3)*f(1,6,-1)', 'f(-3,3,4)*f(-2,2,6)*f(-1,-2,-3)*f(1,5,-1)', 'f(-3,3,4)*f(-2,5,6)*f(-1,-2,-3)*f(1,2,-1)', 'f(-3,3,5)*f(-2,1,2)*f(-1,-2,-3)*f(4,6,-1)', 'f(-3,3,5)*f(-2,1,4)*f(-1,-2,-3)*f(2,6,-1)', 'f(-3,3,5)*f(-2,1,6)*f(-1,-2,-3)*f(2,4,-1)', 'f(-3,3,5)*f(-2,2,4)*f(-1,-2,-3)*f(1,6,-1)', 'f(-3,3,5)*f(-2,2,6)*f(-1,-2,-3)*f(1,4,-1)', 'f(-3,3,5)*f(-2,4,6)*f(-1,-2,-3)*f(1,2,-1)', 'f(-3,3,6)*f(-2,1,2)*f(-1,-2,-3)*f(4,5,-1)', 'f(-3,3,6)*f(-2,1,4)*f(-1,-2,-3)*f(2,5,-1)', 'f(-3,3,6)*f(-2,1,5)*f(-1,-2,-3)*f(2,4,-1)', 'f(-3,3,6)*f(-2,2,4)*f(-1,-2,-3)*f(1,5,-1)', 'f(-3,3,6)*f(-2,2,5)*f(-1,-2,-3)*f(1,4,-1)', 'f(-3,3,6)*f(-2,4,5)*f(-1,-2,-3)*f(1,2,-1)', 'f(-3,4,5)*f(-2,1,2)*f(-1,-2,-3)*f(3,6,-1)', 'f(-3,4,5)*f(-2,1,3)*f(-1,-2,-3)*f(2,6,-1)', 'f(-3,4,5)*f(-2,1,6)*f(-1,-2,-3)*f(2,3,-1)', 'f(-3,4,5)*f(-2,2,3)*f(-1,-2,-3)*f(1,6,-1)', 'f(-3,4,5)*f(-2,2,6)*f(-1,-2,-3)*f(1,3,-1)', 'f(-3,4,5)*f(-2,3,6)*f(-1,-2,-3)*f(1,2,-1)', 'f(-3,4,6)*f(-2,1,2)*f(-1,-2,-3)*f(3,5,-1)', 'f(-3,4,6)*f(-2,1,3)*f(-1,-2,-3)*f(2,5,-1)', 'f(-3,4,6)*f(-2,1,5)*f(-1,-2,-3)*f(2,3,-1)', 'f(-3,4,6)*f(-2,2,3)*f(-1,-2,-3)*f(1,5,-1)', 'f(-3,4,6)*f(-2,2,5)*f(-1,-2,-3)*f(1,3,-1)', 'f(-3,4,6)*f(-2,3,5)*f(-1,-2,-3)*f(1,2,-1)', 'f(-3,5,6)*f(-2,1,2)*f(-1,-2,-3)*f(3,4,-1)', 'f(-3,5,6)*f(-2,1,3)*f(-1,-2,-3)*f(2,4,-1)', 'f(-3,5,6)*f(-2,1,4)*f(-1,-2,-3)*f(2,3,-1)', 'f(-3,5,6)*f(-2,2,3)*f(-1,-2,-3)*f(1,4,-1)', 'f(-3,5,6)*f(-2,2,4)*f(-1,-2,-3)*f(1,3,-1)', 'f(-3,5,6)*f(-2,3,4)*f(-1,-2,-3)*f(1,2,-1)' ],
             lorentz = [ L.VVVVVV1, L.VVVVVV10, L.VVVVVV11, L.VVVVVV12, L.VVVVVV13, L.VVVVVV14, L.VVVVVV15, L.VVVVVV2, L.VVVVVV3, L.VVVVVV4, L.VVVVVV5, L.VVVVVV6, L.VVVVVV7, L.VVVVVV8, L.VVVVVV9 ],
             couplings = {(65,9):C.GC_37,(71,11):C.GC_36,(77,11):C.GC_37,(83,9):C.GC_36,(41,7):C.GC_37,(53,1):C.GC_37,(76,1):C.GC_36,(88,7):C.GC_36,(35,8):C.GC_37,(52,4):C.GC_37,(64,4):C.GC_36,(87,8):C.GC_36,(34,3):C.GC_36,(40,2):C.GC_36,(69,2):C.GC_37,(81,3):C.GC_37,(17,8):C.GC_36,(23,3):C.GC_37,(80,3):C.GC_36,(86,8):C.GC_37,(11,7):C.GC_36,(22,2):C.GC_37,(68,2):C.GC_36,(85,7):C.GC_37,(9,1):C.GC_36,(15,4):C.GC_36,(61,4):C.GC_37,(73,1):C.GC_37,(4,9):C.GC_36,(14,4):C.GC_37,(49,4):C.GC_36,(78,9):C.GC_37,(3,11):C.GC_37,(19,2):C.GC_36,(37,2):C.GC_37,(72,11):C.GC_36,(2,11):C.GC_36,(8,1):C.GC_37,(48,1):C.GC_36,(66,11):C.GC_37,(1,9):C.GC_37,(18,3):C.GC_36,(31,3):C.GC_37,(60,9):C.GC_36,(6,7):C.GC_37,(12,8):C.GC_37,(30,8):C.GC_36,(36,7):C.GC_36,(47,13):C.GC_37,(82,13):C.GC_36,(46,5):C.GC_37,(70,5):C.GC_36,(33,6):C.GC_36,(39,14):C.GC_36,(63,14):C.GC_37,(75,6):C.GC_37,(29,6):C.GC_37,(74,6):C.GC_36,(28,14):C.GC_37,(62,14):C.GC_36,(10,13):C.GC_36,(16,5):C.GC_36,(67,5):C.GC_37,(79,13):C.GC_37,(25,14):C.GC_36,(38,14):C.GC_37,(13,5):C.GC_37,(43,5):C.GC_36,(24,6):C.GC_36,(32,6):C.GC_37,(7,13):C.GC_37,(42,13):C.GC_36,(59,0):C.GC_37,(89,0):C.GC_36,(51,10):C.GC_37,(58,10):C.GC_36,(21,10):C.GC_36,(55,10):C.GC_37,(5,0):C.GC_36,(20,10):C.GC_37,(50,10):C.GC_36,(84,0):C.GC_37,(0,0):C.GC_37,(54,0):C.GC_36,(45,12):C.GC_36,(57,12):C.GC_37,(27,12):C.GC_37,(56,12):C.GC_36,(26,12):C.GC_36,(44,12):C.GC_37})

V_8 = Vertex(name = 'V_8',
             particles = [ P.b__tilde__, P.b, P.H ],
             color = [ 'Identity(1,2)' ],
             lorentz = [ L.FFS2 ],
             couplings = {(0,0):C.GC_68})

V_9 = Vertex(name = 'V_9',
             particles = [ P.ta__plus__, P.ta__minus__, P.H ],
             color = [ '1' ],
             lorentz = [ L.FFS2 ],
             couplings = {(0,0):C.GC_70})

V_10 = Vertex(name = 'V_10',
              particles = [ P.t__tilde__, P.t, P.H ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFS1, L.FFS2 ],
              couplings = {(0,0):C.GC_63,(0,1):C.GC_69})

V_11 = Vertex(name = 'V_11',
              particles = [ P.t__tilde__, P.t, P.H, P.H, P.H ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFSSS1 ],
              couplings = {(0,0):C.GC_17})

V_12 = Vertex(name = 'V_12',
              particles = [ P.t__tilde__, P.t, P.H, P.H ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFSS1 ],
              couplings = {(0,0):C.GC_58})

V_13 = Vertex(name = 'V_13',
              particles = [ P.a, P.W__minus__, P.W__plus__ ],
              color = [ '1' ],
              lorentz = [ L.VVV1 ],
              couplings = {(0,0):C.GC_27})

V_14 = Vertex(name = 'V_14',
              particles = [ P.W__minus__, P.W__plus__, P.H, P.H ],
              color = [ '1' ],
              lorentz = [ L.VVSS1 ],
              couplings = {(0,0):C.GC_39})

V_15 = Vertex(name = 'V_15',
              particles = [ P.W__minus__, P.W__plus__, P.H ],
              color = [ '1' ],
              lorentz = [ L.VVS1 ],
              couplings = {(0,0):C.GC_61})

V_16 = Vertex(name = 'V_16',
              particles = [ P.a, P.a, P.W__minus__, P.W__plus__ ],
              color = [ '1' ],
              lorentz = [ L.VVVV3 ],
              couplings = {(0,0):C.GC_28})

V_17 = Vertex(name = 'V_17',
              particles = [ P.W__minus__, P.W__plus__, P.Z ],
              color = [ '1' ],
              lorentz = [ L.VVV1 ],
              couplings = {(0,0):C.GC_45})

V_18 = Vertex(name = 'V_18',
              particles = [ P.W__minus__, P.W__minus__, P.W__plus__, P.W__plus__ ],
              color = [ '1' ],
              lorentz = [ L.VVVV3 ],
              couplings = {(0,0):C.GC_40})

V_19 = Vertex(name = 'V_19',
              particles = [ P.a, P.W__minus__, P.W__plus__, P.Z ],
              color = [ '1' ],
              lorentz = [ L.VVVV6 ],
              couplings = {(0,0):C.GC_46})

V_20 = Vertex(name = 'V_20',
              particles = [ P.Z, P.Z, P.H, P.H ],
              color = [ '1' ],
              lorentz = [ L.VVSS1 ],
              couplings = {(0,0):C.GC_56})

V_21 = Vertex(name = 'V_21',
              particles = [ P.Z, P.Z, P.H ],
              color = [ '1' ],
              lorentz = [ L.VVS1 ],
              couplings = {(0,0):C.GC_66})

V_22 = Vertex(name = 'V_22',
              particles = [ P.W__minus__, P.W__plus__, P.Z, P.Z ],
              color = [ '1' ],
              lorentz = [ L.VVVV3 ],
              couplings = {(0,0):C.GC_41})

V_23 = Vertex(name = 'V_23',
              particles = [ P.e__plus__, P.e__minus__, P.a ],
              color = [ '1' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_26})

V_24 = Vertex(name = 'V_24',
              particles = [ P.mu__plus__, P.mu__minus__, P.a ],
              color = [ '1' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_26})

V_25 = Vertex(name = 'V_25',
              particles = [ P.ta__plus__, P.ta__minus__, P.a ],
              color = [ '1' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_26})

V_26 = Vertex(name = 'V_26',
              particles = [ P.u__tilde__, P.u, P.a ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_25})

V_27 = Vertex(name = 'V_27',
              particles = [ P.c__tilde__, P.c, P.a ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_25})

V_28 = Vertex(name = 'V_28',
              particles = [ P.t__tilde__, P.t, P.a ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_25})

V_29 = Vertex(name = 'V_29',
              particles = [ P.d__tilde__, P.d, P.a ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_24})

V_30 = Vertex(name = 'V_30',
              particles = [ P.s__tilde__, P.s, P.a ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_24})

V_31 = Vertex(name = 'V_31',
              particles = [ P.b__tilde__, P.b, P.a ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_24})

V_32 = Vertex(name = 'V_32',
              particles = [ P.u__tilde__, P.u, P.g ],
              color = [ 'T(3,2,1)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_30})

V_33 = Vertex(name = 'V_33',
              particles = [ P.c__tilde__, P.c, P.g ],
              color = [ 'T(3,2,1)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_30})

V_34 = Vertex(name = 'V_34',
              particles = [ P.t__tilde__, P.t, P.g ],
              color = [ 'T(3,2,1)' ],
              lorentz = [ L.FFV1, L.FFV5 ],
              couplings = {(0,0):C.GC_30,(0,1):C.GC_57})

V_35 = Vertex(name = 'V_35',
              particles = [ P.d__tilde__, P.d, P.g ],
              color = [ 'T(3,2,1)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_30})

V_36 = Vertex(name = 'V_36',
              particles = [ P.s__tilde__, P.s, P.g ],
              color = [ 'T(3,2,1)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_30})

V_37 = Vertex(name = 'V_37',
              particles = [ P.b__tilde__, P.b, P.g ],
              color = [ 'T(3,2,1)' ],
              lorentz = [ L.FFV1 ],
              couplings = {(0,0):C.GC_30})

V_38 = Vertex(name = 'V_38',
              particles = [ P.d__tilde__, P.u, P.W__minus__ ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV2 ],
              couplings = {(0,0):C.GC_42})

V_39 = Vertex(name = 'V_39',
              particles = [ P.s__tilde__, P.c, P.W__minus__ ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV2 ],
              couplings = {(0,0):C.GC_42})

V_40 = Vertex(name = 'V_40',
              particles = [ P.b__tilde__, P.t, P.W__minus__ ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV2 ],
              couplings = {(0,0):C.GC_42})

V_41 = Vertex(name = 'V_41',
              particles = [ P.b__tilde__, P.t, P.W__minus__ ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV2 ],
              couplings = {(0,0):C.GC_64})

V_42 = Vertex(name = 'V_42',
              particles = [ P.u__tilde__, P.d, P.W__plus__ ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV2 ],
              couplings = {(0,0):C.GC_42})

V_43 = Vertex(name = 'V_43',
              particles = [ P.c__tilde__, P.s, P.W__plus__ ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV2 ],
              couplings = {(0,0):C.GC_42})

V_44 = Vertex(name = 'V_44',
              particles = [ P.t__tilde__, P.b, P.W__plus__ ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV2 ],
              couplings = {(0,0):C.GC_42})

V_45 = Vertex(name = 'V_45',
              particles = [ P.t__tilde__, P.b, P.W__plus__ ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV2 ],
              couplings = {(0,0):C.GC_64})

V_46 = Vertex(name = 'V_46',
              particles = [ P.e__plus__, P.ve, P.W__minus__ ],
              color = [ '1' ],
              lorentz = [ L.FFV2 ],
              couplings = {(0,0):C.GC_42})

V_47 = Vertex(name = 'V_47',
              particles = [ P.mu__plus__, P.vm, P.W__minus__ ],
              color = [ '1' ],
              lorentz = [ L.FFV2 ],
              couplings = {(0,0):C.GC_42})

V_48 = Vertex(name = 'V_48',
              particles = [ P.ta__plus__, P.vt, P.W__minus__ ],
              color = [ '1' ],
              lorentz = [ L.FFV2 ],
              couplings = {(0,0):C.GC_42})

V_49 = Vertex(name = 'V_49',
              particles = [ P.ve__tilde__, P.e__minus__, P.W__plus__ ],
              color = [ '1' ],
              lorentz = [ L.FFV2 ],
              couplings = {(0,0):C.GC_42})

V_50 = Vertex(name = 'V_50',
              particles = [ P.vm__tilde__, P.mu__minus__, P.W__plus__ ],
              color = [ '1' ],
              lorentz = [ L.FFV2 ],
              couplings = {(0,0):C.GC_42})

V_51 = Vertex(name = 'V_51',
              particles = [ P.vt__tilde__, P.ta__minus__, P.W__plus__ ],
              color = [ '1' ],
              lorentz = [ L.FFV2 ],
              couplings = {(0,0):C.GC_42})

V_52 = Vertex(name = 'V_52',
              particles = [ P.u__tilde__, P.u, P.Z ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV2, L.FFV4 ],
              couplings = {(0,0):C.GC_44,(0,1):C.GC_47})

V_53 = Vertex(name = 'V_53',
              particles = [ P.c__tilde__, P.c, P.Z ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV2, L.FFV3 ],
              couplings = {(0,0):C.GC_52,(0,1):C.GC_49})

V_54 = Vertex(name = 'V_54',
              particles = [ P.t__tilde__, P.t, P.Z ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV2, L.FFV3 ],
              couplings = {(0,0):C.GC_52,(0,1):C.GC_49})

V_55 = Vertex(name = 'V_55',
              particles = [ P.d__tilde__, P.d, P.Z ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV2, L.FFV3 ],
              couplings = {(0,0):C.GC_51,(0,1):C.GC_48})

V_56 = Vertex(name = 'V_56',
              particles = [ P.s__tilde__, P.s, P.Z ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV2, L.FFV3 ],
              couplings = {(0,0):C.GC_51,(0,1):C.GC_48})

V_57 = Vertex(name = 'V_57',
              particles = [ P.b__tilde__, P.b, P.Z ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV2, L.FFV3 ],
              couplings = {(0,0):C.GC_51,(0,1):C.GC_48})

V_58 = Vertex(name = 'V_58',
              particles = [ P.b__tilde__, P.b, P.Z ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFV2 ],
              couplings = {(0,0):C.GC_67})

V_59 = Vertex(name = 'V_59',
              particles = [ P.ve__tilde__, P.ve, P.Z ],
              color = [ '1' ],
              lorentz = [ L.FFV2 ],
              couplings = {(0,0):C.GC_54})

V_60 = Vertex(name = 'V_60',
              particles = [ P.vm__tilde__, P.vm, P.Z ],
              color = [ '1' ],
              lorentz = [ L.FFV2 ],
              couplings = {(0,0):C.GC_54})

V_61 = Vertex(name = 'V_61',
              particles = [ P.vt__tilde__, P.vt, P.Z ],
              color = [ '1' ],
              lorentz = [ L.FFV2 ],
              couplings = {(0,0):C.GC_54})

V_62 = Vertex(name = 'V_62',
              particles = [ P.e__plus__, P.e__minus__, P.Z ],
              color = [ '1' ],
              lorentz = [ L.FFV2, L.FFV3 ],
              couplings = {(0,0):C.GC_53,(0,1):C.GC_50})

V_63 = Vertex(name = 'V_63',
              particles = [ P.mu__plus__, P.mu__minus__, P.Z ],
              color = [ '1' ],
              lorentz = [ L.FFV2, L.FFV3 ],
              couplings = {(0,0):C.GC_53,(0,1):C.GC_50})

V_64 = Vertex(name = 'V_64',
              particles = [ P.ta__plus__, P.ta__minus__, P.Z ],
              color = [ '1' ],
              lorentz = [ L.FFV2, L.FFV3 ],
              couplings = {(0,0):C.GC_53,(0,1):C.GC_50})

V_65 = Vertex(name = 'V_65',
              particles = [ P.b__tilde__, P.t, P.W__minus__, P.H, P.H ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFVSS1 ],
              couplings = {(0,0):C.GC_43})

V_66 = Vertex(name = 'V_66',
              particles = [ P.b__tilde__, P.t, P.W__minus__, P.H ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFVS1 ],
              couplings = {(0,0):C.GC_62})

V_67 = Vertex(name = 'V_67',
              particles = [ P.t__tilde__, P.b, P.W__plus__, P.H, P.H ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFVSS1 ],
              couplings = {(0,0):C.GC_43})

V_68 = Vertex(name = 'V_68',
              particles = [ P.t__tilde__, P.b, P.W__plus__, P.H ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFVS1 ],
              couplings = {(0,0):C.GC_62})

V_69 = Vertex(name = 'V_69',
              particles = [ P.b__tilde__, P.b, P.Z, P.H, P.H ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFVSS1 ],
              couplings = {(0,0):C.GC_55})

V_70 = Vertex(name = 'V_70',
              particles = [ P.b__tilde__, P.b, P.Z, P.H ],
              color = [ 'Identity(1,2)' ],
              lorentz = [ L.FFVS1 ],
              couplings = {(0,0):C.GC_65})

V_71 = Vertex(name = 'V_71',
              particles = [ P.d__tilde__, P.d, P.d__tilde__, P.d ],
              color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,1)*T(-1,4,3)', 'T(-1,2,3)*T(-1,4,1)' ],
              lorentz = [ L.FFFF1, L.FFFF10, L.FFFF3, L.FFFF5, L.FFFF6, L.FFFF7, L.FFFF8, L.FFFF9 ],
              couplings = {(1,0):C.GC_6,(0,2):C.GC_6,(2,3):C.GC_5,(3,6):C.GC_5,(3,4):C.GC_5,(1,5):C.GC_2,(2,7):C.GC_5,(0,1):C.GC_2})

V_72 = Vertex(name = 'V_72',
              particles = [ P.d__tilde__, P.d, P.d__tilde__, P.d ],
              color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)' ],
              lorentz = [ L.FFFF1, L.FFFF3 ],
              couplings = {(1,0):C.GC_10,(0,1):C.GC_10})

V_73 = Vertex(name = 'V_73',
              particles = [ P.s__tilde__, P.d, P.d__tilde__, P.s ],
              color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,3)*T(-1,4,1)' ],
              lorentz = [ L.FFFF1, L.FFFF10, L.FFFF3, L.FFFF6, L.FFFF7, L.FFFF8 ],
              couplings = {(1,0):C.GC_7,(0,2):C.GC_8,(2,5):C.GC_5,(2,3):C.GC_5,(1,4):C.GC_1,(0,1):C.GC_3})

V_74 = Vertex(name = 'V_74',
              particles = [ P.s__tilde__, P.d, P.d__tilde__, P.s ],
              color = [ 'Identity(1,2)*Identity(3,4)' ],
              lorentz = [ L.FFFF3 ],
              couplings = {(0,0):C.GC_10})

V_75 = Vertex(name = 'V_75',
              particles = [ P.b__tilde__, P.d, P.d__tilde__, P.b ],
              color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,3)*T(-1,4,1)' ],
              lorentz = [ L.FFFF1, L.FFFF10, L.FFFF3, L.FFFF6, L.FFFF7, L.FFFF8 ],
              couplings = {(1,0):C.GC_7,(0,2):C.GC_8,(2,5):C.GC_5,(2,3):C.GC_5,(1,4):C.GC_1,(0,1):C.GC_3})

V_76 = Vertex(name = 'V_76',
              particles = [ P.b__tilde__, P.d, P.d__tilde__, P.b ],
              color = [ 'Identity(1,2)*Identity(3,4)' ],
              lorentz = [ L.FFFF3 ],
              couplings = {(0,0):C.GC_10})

V_77 = Vertex(name = 'V_77',
              particles = [ P.s__tilde__, P.s, P.s__tilde__, P.s ],
              color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,1)*T(-1,4,3)', 'T(-1,2,3)*T(-1,4,1)' ],
              lorentz = [ L.FFFF1, L.FFFF10, L.FFFF2, L.FFFF3, L.FFFF5, L.FFFF6, L.FFFF7, L.FFFF8, L.FFFF9 ],
              couplings = {(1,0):C.GC_10,(0,3):C.GC_6,(1,2):C.GC_6,(2,4):C.GC_5,(3,7):C.GC_5,(3,5):C.GC_5,(1,6):C.GC_2,(2,8):C.GC_5,(0,1):C.GC_2})

V_78 = Vertex(name = 'V_78',
              particles = [ P.s__tilde__, P.s, P.s__tilde__, P.s ],
              color = [ 'Identity(1,2)*Identity(3,4)' ],
              lorentz = [ L.FFFF3 ],
              couplings = {(0,0):C.GC_10})

V_79 = Vertex(name = 'V_79',
              particles = [ P.b__tilde__, P.s, P.s__tilde__, P.b ],
              color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,3)*T(-1,4,1)' ],
              lorentz = [ L.FFFF1, L.FFFF10, L.FFFF3, L.FFFF6, L.FFFF7, L.FFFF8 ],
              couplings = {(1,0):C.GC_7,(0,2):C.GC_8,(2,5):C.GC_5,(2,3):C.GC_5,(1,4):C.GC_1,(0,1):C.GC_3})

V_80 = Vertex(name = 'V_80',
              particles = [ P.b__tilde__, P.s, P.s__tilde__, P.b ],
              color = [ 'Identity(1,2)*Identity(3,4)' ],
              lorentz = [ L.FFFF3 ],
              couplings = {(0,0):C.GC_10})

V_81 = Vertex(name = 'V_81',
              particles = [ P.b__tilde__, P.b, P.b__tilde__, P.b ],
              color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,1)*T(-1,4,3)', 'T(-1,2,3)*T(-1,4,1)' ],
              lorentz = [ L.FFFF1, L.FFFF10, L.FFFF3, L.FFFF5, L.FFFF6, L.FFFF7, L.FFFF8, L.FFFF9 ],
              couplings = {(1,0):C.GC_6,(0,2):C.GC_6,(2,3):C.GC_5,(3,6):C.GC_5,(3,4):C.GC_5,(1,5):C.GC_2,(2,7):C.GC_5,(0,1):C.GC_2})

V_82 = Vertex(name = 'V_82',
              particles = [ P.b__tilde__, P.b, P.b__tilde__, P.b ],
              color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)' ],
              lorentz = [ L.FFFF1, L.FFFF3 ],
              couplings = {(1,0):C.GC_10,(0,1):C.GC_10})

V_83 = Vertex(name = 'V_83',
              particles = [ P.u__tilde__, P.d, P.d__tilde__, P.u ],
              color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,3)*T(-1,4,1)' ],
              lorentz = [ L.FFFF1, L.FFFF3, L.FFFF6, L.FFFF7, L.FFFF8 ],
              couplings = {(1,0):C.GC_6,(0,1):C.GC_11,(2,4):C.GC_5,(2,2):C.GC_12,(2,3):C.GC_14})

V_84 = Vertex(name = 'V_84',
              particles = [ P.u__tilde__, P.d, P.d__tilde__, P.u ],
              color = [ 'Identity(1,4)*Identity(2,3)' ],
              lorentz = [ L.FFFF1 ],
              couplings = {(0,0):C.GC_9})

V_85 = Vertex(name = 'V_85',
              particles = [ P.c__tilde__, P.d, P.d__tilde__, P.c ],
              color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,3)*T(-1,4,1)' ],
              lorentz = [ L.FFFF1, L.FFFF3, L.FFFF6, L.FFFF7, L.FFFF8 ],
              couplings = {(1,0):C.GC_7,(0,1):C.GC_11,(2,4):C.GC_5,(2,2):C.GC_12,(2,3):C.GC_14})

V_86 = Vertex(name = 'V_86',
              particles = [ P.t__tilde__, P.d, P.d__tilde__, P.t ],
              color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,3)*T(-1,4,1)' ],
              lorentz = [ L.FFFF1, L.FFFF3, L.FFFF6, L.FFFF7, L.FFFF8 ],
              couplings = {(1,0):C.GC_7,(0,1):C.GC_11,(2,4):C.GC_5,(2,2):C.GC_12,(2,3):C.GC_14})

V_87 = Vertex(name = 'V_87',
              particles = [ P.t__tilde__, P.d, P.d__tilde__, P.t ],
              color = [ 'T(-1,2,3)*T(-1,4,1)' ],
              lorentz = [ L.FFFF6, L.FFFF7 ],
              couplings = {(0,0):C.GC_13,(0,1):C.GC_15})

V_88 = Vertex(name = 'V_88',
              particles = [ P.s__tilde__, P.d, P.u__tilde__, P.c ],
              color = [ 'Identity(1,2)*Identity(3,4)' ],
              lorentz = [ L.FFFF3 ],
              couplings = {(0,0):C.GC_8})

V_89 = Vertex(name = 'V_89',
              particles = [ P.s__tilde__, P.d, P.u__tilde__, P.c ],
              color = [ 'Identity(1,2)*Identity(3,4)' ],
              lorentz = [ L.FFFF3 ],
              couplings = {(0,0):C.GC_9})

V_90 = Vertex(name = 'V_90',
              particles = [ P.b__tilde__, P.d, P.u__tilde__, P.t ],
              color = [ 'Identity(1,2)*Identity(3,4)' ],
              lorentz = [ L.FFFF3 ],
              couplings = {(0,0):C.GC_8})

V_91 = Vertex(name = 'V_91',
              particles = [ P.b__tilde__, P.d, P.u__tilde__, P.t ],
              color = [ 'Identity(1,2)*Identity(3,4)' ],
              lorentz = [ L.FFFF3 ],
              couplings = {(0,0):C.GC_9})

V_92 = Vertex(name = 'V_92',
              particles = [ P.d__tilde__, P.s, P.c__tilde__, P.u ],
              color = [ 'Identity(1,2)*Identity(3,4)' ],
              lorentz = [ L.FFFF3 ],
              couplings = {(0,0):C.GC_8})

V_93 = Vertex(name = 'V_93',
              particles = [ P.d__tilde__, P.s, P.c__tilde__, P.u ],
              color = [ 'Identity(1,2)*Identity(3,4)' ],
              lorentz = [ L.FFFF3 ],
              couplings = {(0,0):C.GC_9})

V_94 = Vertex(name = 'V_94',
              particles = [ P.u__tilde__, P.s, P.s__tilde__, P.u ],
              color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,3)*T(-1,4,1)' ],
              lorentz = [ L.FFFF1, L.FFFF3, L.FFFF6, L.FFFF7, L.FFFF8 ],
              couplings = {(1,0):C.GC_7,(0,1):C.GC_11,(2,4):C.GC_5,(2,2):C.GC_12,(2,3):C.GC_14})

V_95 = Vertex(name = 'V_95',
              particles = [ P.c__tilde__, P.s, P.s__tilde__, P.c ],
              color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,3)*T(-1,4,1)' ],
              lorentz = [ L.FFFF1, L.FFFF3, L.FFFF6, L.FFFF7, L.FFFF8 ],
              couplings = {(1,0):C.GC_6,(0,1):C.GC_11,(2,4):C.GC_5,(2,2):C.GC_12,(2,3):C.GC_14})

V_96 = Vertex(name = 'V_96',
              particles = [ P.c__tilde__, P.s, P.s__tilde__, P.c ],
              color = [ 'Identity(1,4)*Identity(2,3)' ],
              lorentz = [ L.FFFF1 ],
              couplings = {(0,0):C.GC_9})

V_97 = Vertex(name = 'V_97',
              particles = [ P.t__tilde__, P.s, P.s__tilde__, P.t ],
              color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,3)*T(-1,4,1)' ],
              lorentz = [ L.FFFF1, L.FFFF3, L.FFFF6, L.FFFF7, L.FFFF8 ],
              couplings = {(1,0):C.GC_7,(0,1):C.GC_11,(2,4):C.GC_5,(2,2):C.GC_12,(2,3):C.GC_14})

V_98 = Vertex(name = 'V_98',
              particles = [ P.t__tilde__, P.s, P.s__tilde__, P.t ],
              color = [ 'T(-1,2,3)*T(-1,4,1)' ],
              lorentz = [ L.FFFF6, L.FFFF7 ],
              couplings = {(0,0):C.GC_13,(0,1):C.GC_15})

V_99 = Vertex(name = 'V_99',
              particles = [ P.b__tilde__, P.s, P.c__tilde__, P.t ],
              color = [ 'Identity(1,2)*Identity(3,4)' ],
              lorentz = [ L.FFFF3 ],
              couplings = {(0,0):C.GC_8})

V_100 = Vertex(name = 'V_100',
               particles = [ P.b__tilde__, P.s, P.c__tilde__, P.t ],
               color = [ 'Identity(1,2)*Identity(3,4)' ],
               lorentz = [ L.FFFF3 ],
               couplings = {(0,0):C.GC_9})

V_101 = Vertex(name = 'V_101',
               particles = [ P.d__tilde__, P.b, P.t__tilde__, P.u ],
               color = [ 'Identity(1,2)*Identity(3,4)' ],
               lorentz = [ L.FFFF3 ],
               couplings = {(0,0):C.GC_8})

V_102 = Vertex(name = 'V_102',
               particles = [ P.d__tilde__, P.b, P.t__tilde__, P.u ],
               color = [ 'Identity(1,2)*Identity(3,4)' ],
               lorentz = [ L.FFFF3 ],
               couplings = {(0,0):C.GC_9})

V_103 = Vertex(name = 'V_103',
               particles = [ P.s__tilde__, P.b, P.t__tilde__, P.c ],
               color = [ 'Identity(1,2)*Identity(3,4)' ],
               lorentz = [ L.FFFF3 ],
               couplings = {(0,0):C.GC_8})

V_104 = Vertex(name = 'V_104',
               particles = [ P.s__tilde__, P.b, P.t__tilde__, P.c ],
               color = [ 'Identity(1,2)*Identity(3,4)' ],
               lorentz = [ L.FFFF3 ],
               couplings = {(0,0):C.GC_9})

V_105 = Vertex(name = 'V_105',
               particles = [ P.u__tilde__, P.b, P.b__tilde__, P.u ],
               color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,3)*T(-1,4,1)' ],
               lorentz = [ L.FFFF1, L.FFFF3, L.FFFF6, L.FFFF7, L.FFFF8 ],
               couplings = {(1,0):C.GC_7,(0,1):C.GC_11,(2,4):C.GC_5,(2,2):C.GC_12,(2,3):C.GC_14})

V_106 = Vertex(name = 'V_106',
               particles = [ P.c__tilde__, P.b, P.b__tilde__, P.c ],
               color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,3)*T(-1,4,1)' ],
               lorentz = [ L.FFFF1, L.FFFF3, L.FFFF4, L.FFFF6, L.FFFF7 ],
               couplings = {(1,0):C.GC_7,(0,1):C.GC_11,(2,2):C.GC_5,(2,3):C.GC_12,(2,4):C.GC_14})

V_107 = Vertex(name = 'V_107',
               particles = [ P.t__tilde__, P.b, P.b__tilde__, P.t ],
               color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,3)*T(-1,4,1)' ],
               lorentz = [ L.FFFF1, L.FFFF3, L.FFFF6, L.FFFF7, L.FFFF8 ],
               couplings = {(1,0):C.GC_6,(0,1):C.GC_11,(2,4):C.GC_5,(2,2):C.GC_12,(2,3):C.GC_14})

V_108 = Vertex(name = 'V_108',
               particles = [ P.t__tilde__, P.b, P.b__tilde__, P.t ],
               color = [ 'Identity(1,4)*Identity(2,3)', 'T(-1,2,3)*T(-1,4,1)' ],
               lorentz = [ L.FFFF1, L.FFFF6, L.FFFF7 ],
               couplings = {(0,0):C.GC_9,(1,1):C.GC_13,(1,2):C.GC_15})

V_109 = Vertex(name = 'V_109',
               particles = [ P.u__tilde__, P.u, P.u__tilde__, P.u ],
               color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,1)*T(-1,4,3)', 'T(-1,2,3)*T(-1,4,1)' ],
               lorentz = [ L.FFFF1, L.FFFF10, L.FFFF3, L.FFFF5, L.FFFF6, L.FFFF7, L.FFFF8, L.FFFF9 ],
               couplings = {(1,0):C.GC_6,(0,2):C.GC_6,(2,3):C.GC_12,(3,6):C.GC_12,(3,4):C.GC_12,(1,5):C.GC_19,(2,7):C.GC_12,(0,1):C.GC_19})

V_110 = Vertex(name = 'V_110',
               particles = [ P.u__tilde__, P.u, P.u__tilde__, P.u ],
               color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)' ],
               lorentz = [ L.FFFF1, L.FFFF3 ],
               couplings = {(1,0):C.GC_10,(0,1):C.GC_10})

V_111 = Vertex(name = 'V_111',
               particles = [ P.c__tilde__, P.u, P.u__tilde__, P.c ],
               color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,3)*T(-1,4,1)' ],
               lorentz = [ L.FFFF1, L.FFFF10, L.FFFF3, L.FFFF6, L.FFFF7, L.FFFF8 ],
               couplings = {(1,0):C.GC_7,(0,2):C.GC_8,(2,5):C.GC_12,(2,3):C.GC_12,(1,4):C.GC_18,(0,1):C.GC_20})

V_112 = Vertex(name = 'V_112',
               particles = [ P.c__tilde__, P.u, P.u__tilde__, P.c ],
               color = [ 'Identity(1,2)*Identity(3,4)' ],
               lorentz = [ L.FFFF3 ],
               couplings = {(0,0):C.GC_10})

V_113 = Vertex(name = 'V_113',
               particles = [ P.t__tilde__, P.u, P.u__tilde__, P.t ],
               color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,3)*T(-1,4,1)' ],
               lorentz = [ L.FFFF1, L.FFFF10, L.FFFF3, L.FFFF6, L.FFFF7, L.FFFF8 ],
               couplings = {(1,0):C.GC_7,(0,2):C.GC_8,(2,5):C.GC_12,(2,3):C.GC_12,(1,4):C.GC_18,(0,1):C.GC_20})

V_114 = Vertex(name = 'V_114',
               particles = [ P.t__tilde__, P.u, P.u__tilde__, P.t ],
               color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,3)*T(-1,4,1)' ],
               lorentz = [ L.FFFF10, L.FFFF3, L.FFFF6, L.FFFF7 ],
               couplings = {(0,1):C.GC_10,(2,2):C.GC_13,(1,3):C.GC_21,(0,0):C.GC_22})

V_115 = Vertex(name = 'V_115',
               particles = [ P.c__tilde__, P.c, P.c__tilde__, P.c ],
               color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,1)*T(-1,4,3)', 'T(-1,2,3)*T(-1,4,1)' ],
               lorentz = [ L.FFFF1, L.FFFF10, L.FFFF3, L.FFFF5, L.FFFF6, L.FFFF7, L.FFFF8, L.FFFF9 ],
               couplings = {(1,0):C.GC_6,(0,2):C.GC_6,(2,3):C.GC_12,(3,6):C.GC_12,(3,4):C.GC_12,(1,5):C.GC_19,(2,7):C.GC_12,(0,1):C.GC_19})

V_116 = Vertex(name = 'V_116',
               particles = [ P.c__tilde__, P.c, P.c__tilde__, P.c ],
               color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)' ],
               lorentz = [ L.FFFF1, L.FFFF3 ],
               couplings = {(1,0):C.GC_10,(0,1):C.GC_10})

V_117 = Vertex(name = 'V_117',
               particles = [ P.t__tilde__, P.c, P.c__tilde__, P.t ],
               color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,3)*T(-1,4,1)' ],
               lorentz = [ L.FFFF1, L.FFFF10, L.FFFF3, L.FFFF6, L.FFFF7, L.FFFF8 ],
               couplings = {(1,0):C.GC_7,(0,2):C.GC_8,(2,5):C.GC_12,(2,3):C.GC_12,(1,4):C.GC_18,(0,1):C.GC_20})

V_118 = Vertex(name = 'V_118',
               particles = [ P.t__tilde__, P.c, P.c__tilde__, P.t ],
               color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,3)*T(-1,4,1)' ],
               lorentz = [ L.FFFF10, L.FFFF3, L.FFFF6, L.FFFF7 ],
               couplings = {(0,1):C.GC_10,(2,2):C.GC_13,(1,3):C.GC_21,(0,0):C.GC_22})

V_119 = Vertex(name = 'V_119',
               particles = [ P.t__tilde__, P.t, P.t__tilde__, P.t ],
               color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,1)*T(-1,4,3)', 'T(-1,2,3)*T(-1,4,1)' ],
               lorentz = [ L.FFFF1, L.FFFF10, L.FFFF3, L.FFFF5, L.FFFF6, L.FFFF7, L.FFFF8, L.FFFF9 ],
               couplings = {(1,0):C.GC_6,(0,2):C.GC_6,(2,3):C.GC_12,(3,6):C.GC_12,(3,4):C.GC_12,(1,5):C.GC_19,(2,7):C.GC_12,(0,1):C.GC_19})

V_120 = Vertex(name = 'V_120',
               particles = [ P.t__tilde__, P.t, P.t__tilde__, P.t ],
               color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)', 'T(-1,2,3)*T(-1,4,1)' ],
               lorentz = [ L.FFFF1, L.FFFF10, L.FFFF3, L.FFFF7, L.FFFF8 ],
               couplings = {(1,0):C.GC_10,(0,2):C.GC_10,(2,4):C.GC_13,(1,3):C.GC_21,(0,1):C.GC_22})

V_121 = Vertex(name = 'V_121',
               particles = [ P.t__tilde__, P.t, P.t__tilde__, P.t ],
               color = [ 'Identity(1,2)*Identity(3,4)', 'Identity(1,4)*Identity(2,3)' ],
               lorentz = [ L.FFFF10, L.FFFF7 ],
               couplings = {(1,1):C.GC_23,(0,0):C.GC_23})

V_122 = Vertex(name = 'V_122',
               particles = [ P.t__tilde__, P.t, P.g, P.H ],
               color = [ 'T(3,2,1)' ],
               lorentz = [ L.FFVS2 ],
               couplings = {(0,0):C.GC_16})

V_123 = Vertex(name = 'V_123',
               particles = [ P.t__tilde__, P.t, P.g, P.g, P.H ],
               color = [ 'f(-1,3,4)*T(-1,2,1)' ],
               lorentz = [ L.FFVVS1 ],
               couplings = {(0,0):C.GC_32})

V_124 = Vertex(name = 'V_124',
               particles = [ P.t__tilde__, P.t, P.g, P.g ],
               color = [ 'f(-1,3,4)*T(-1,2,1)' ],
               lorentz = [ L.FFVV1 ],
               couplings = {(0,0):C.GC_59})

