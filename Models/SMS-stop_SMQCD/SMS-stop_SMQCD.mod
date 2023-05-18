(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)
(*                                                                             *)
(*         This file has been automatically generated by FeynRules.            *)
(*                                                                             *)
(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)


FR$ModelInformation={
  ModelName->"SMS-stop",
  Authors -> {"Andre Lessa"},
  Version -> "1.0",
  Date -> "18.03.2023"};

FR$ClassesTranslation={G -> V[1], ghG -> U[1], u -> F[1], c -> F[2], t -> F[3], d -> F[4], s -> F[5], b -> F[6], chi -> F[7], ST -> S[1]};

FR$InteractionOrderPerturbativeExpansion={{NP, 0}, {QCD, 0}, {QED, 0}};

FR$GoldstoneList={};

(*     Declared indices    *)

IndexRange[ Index[Gluon] ] = NoUnfold[ Range[ 8 ] ]

IndexRange[ Index[Generation] ] = Range[ 3 ]

IndexRange[ Index[Colour] ] = NoUnfold[ Range[ 3 ] ]

(*     Declared particles    *)

M$ClassesDescription = {
V[1] == {
    SelfConjugate -> True,
    PropagatorType -> Cycles,
    PropagatorArrow -> None,
    Mass -> 0,
    Indices -> {Index[Gluon]},
    PropagatorLabel -> "G" },

U[1] == {
    SelfConjugate -> False,
    QuantumNumbers -> {GhostNumber},
    PropagatorType -> GhostDash,
    PropagatorArrow -> Forward,
    Mass -> 0,
    Indices -> {Index[Gluon]},
    PropagatorLabel -> "ghG" },

F[1] == {
    SelfConjugate -> False,
    QuantumNumbers -> {(2*Q)/3},
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> 0,
    Indices -> {Index[Colour]},
    PropagatorLabel -> "u" },

F[2] == {
    SelfConjugate -> False,
    QuantumNumbers -> {(2*Q)/3},
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> 0,
    Indices -> {Index[Colour]},
    PropagatorLabel -> "c" },

F[3] == {
    SelfConjugate -> False,
    QuantumNumbers -> {(2*Q)/3},
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> MT,
    Indices -> {Index[Colour]},
    PropagatorLabel -> "t" },

F[4] == {
    SelfConjugate -> False,
    QuantumNumbers -> {-Q/3},
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> 0,
    Indices -> {Index[Colour]},
    PropagatorLabel -> "d" },

F[5] == {
    SelfConjugate -> False,
    QuantumNumbers -> {-Q/3},
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> 0,
    Indices -> {Index[Colour]},
    PropagatorLabel -> "s" },

F[6] == {
    SelfConjugate -> False,
    QuantumNumbers -> {-Q/3},
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> MB,
    Indices -> {Index[Colour]},
    PropagatorLabel -> "b" },

F[7] == {
    SelfConjugate -> True,
    QuantumNumbers -> {},
    PropagatorType -> Straight,
    PropagatorArrow -> None,
    Mass -> mChi,
    Indices -> {},
    PropagatorLabel -> "chi" },

S[1] == {
    SelfConjugate -> False,
    QuantumNumbers -> {(2*Q)/3},
    PropagatorType -> ScalarDash,
    PropagatorArrow -> Forward,
    Mass -> mST,
    Indices -> {Index[Colour]},
    PropagatorLabel -> "ST" }
}


(*        Definitions       *)

GaugeXi[ V[1] ] = GaugeXi[G];
GaugeXi[ U[1] ] = GaugeXi[G];
GaugeXi[ F[7] ] = GaugeXi[F[16]];
GaugeXi[ S[1] ] = GaugeXi[S[5]];

MT[ ___ ] := MT;
MB[ ___ ] := MB;
mChi[ ___ ] := mChi;
mST[ ___ ] := mST;


TheLabel[ V[1, {__}] ] := TheLabel[V[1]];
TheLabel[ U[1, {__}] ] := TheLabel[U[1]];
TheLabel[ F[1, {__}] ] := TheLabel[F[1]];
TheLabel[ F[2, {__}] ] := TheLabel[F[2]];
TheLabel[ F[3, {__}] ] := TheLabel[F[3]];
TheLabel[ F[4, {__}] ] := TheLabel[F[4]];
TheLabel[ F[5, {__}] ] := TheLabel[F[5]];
TheLabel[ F[6, {__}] ] := TheLabel[F[6]];
TheLabel[ S[1, {__}] ] := TheLabel[S[1]];


(*      Couplings (calculated by FeynRules)      *)

M$CouplingMatrices = {

C[ V[1, {e1x2}] , V[1, {e2x2}] ] == {{0, I*FR$deltaZ[{G, G}, {{}}]*IndexDelta[e1x2, e2x2]}, {0, 0}, {0, (-I)*FR$deltaZ[{G, G}, {{}}]*IndexDelta[e1x2, e2x2]}},

C[ S[1, {e1x1}] , -S[1, {e2x1}] ] == {{0, (-I)*FR$deltaZ[{ST, ST}, {{}}]*IndexDelta[e1x1, e2x1]}, {0, (-I)*mST*(2*FR$delta[{mST}, {}] + mST*FR$deltaZ[{ST, ST}, {{}}])*IndexDelta[e1x1, e2x1]}},

C[ -F[6, {e1x2}] , F[6, {e2x2}] ] == {{0, (-I)*FR$deltaZ[{b, b}, {{}}, "L"]*IndexDelta[e1x2, e2x2]}, {0, I*FR$deltaZ[{b, b}, {{}}, "R"]*IndexDelta[e1x2, e2x2]}, {0, (-I/2)*(2*FR$delta[{MB}, {}] + MB*FR$deltaZ[{b, b}, {{}}, "L"] + MB*FR$deltaZ[{b, b}, {{}}, "R"])*IndexDelta[e1x2, e2x2]}, {0, (-I/2)*(2*FR$delta[{MB}, {}] + MB*FR$deltaZ[{b, b}, {{}}, "L"] + MB*FR$deltaZ[{b, b}, {{}}, "R"])*IndexDelta[e1x2, e2x2]}},

C[ F[7] , F[7] ] == {{0, (-I/2)*(FR$deltaZ[{chi, chi}, {{}}, "L"] + FR$deltaZ[{chi, chi}, {{}}, "R"])}, {0, (I/2)*(FR$deltaZ[{chi, chi}, {{}}, "L"] + FR$deltaZ[{chi, chi}, {{}}, "R"])}, {0, (-I/2)*(2*FR$delta[{mChi}, {}] + mChi*FR$deltaZ[{chi, chi}, {{}}, "L"])}, {0, (-I/2)*(2*FR$delta[{mChi}, {}] + mChi*FR$deltaZ[{chi, chi}, {{}}, "R"])}},

C[ -F[3, {e1x2}] , F[3, {e2x2}] ] == {{0, (-I)*FR$deltaZ[{t, t}, {{}}, "L"]*IndexDelta[e1x2, e2x2]}, {0, I*FR$deltaZ[{t, t}, {{}}, "R"]*IndexDelta[e1x2, e2x2]}, {0, (-I/2)*(2*FR$delta[{MT}, {}] + MT*FR$deltaZ[{t, t}, {{}}, "L"] + MT*FR$deltaZ[{t, t}, {{}}, "R"])*IndexDelta[e1x2, e2x2]}, {0, (-I/2)*(2*FR$delta[{MT}, {}] + MT*FR$deltaZ[{t, t}, {{}}, "L"] + MT*FR$deltaZ[{t, t}, {{}}, "R"])*IndexDelta[e1x2, e2x2]}},

C[ -U[1, {e1x1}] , U[1, {e2x1}] , V[1, {e3x2}] ] == {{gc6*SUNF[e3x2, e1x1, e2x1], -(GS*(FR$delta[{aS}, {}] + aS*FR$deltaZ[{G, G}, {{}}])*SUNF[e3x2, e1x1, e2x1])/(2*aS)}, {0, 0}},

C[ V[1, {e1x2}] , V[1, {e2x2}] , V[1, {e3x2}] ] == {{-(GS*SUNF[e1x2, e2x2, e3x2]), -(GS*(FR$delta[{aS}, {}] + 3*aS*FR$deltaZ[{G, G}, {{}}])*SUNF[e1x2, e2x2, e3x2])/(2*aS)}},

C[ V[1, {e1x2}] , V[1, {e2x2}] , V[1, {e3x2}] , V[1, {e4x2}] ] == {{(-I)*gc8*(SUNF[e1x2, e3x2, e2x2, e4x2] + SUNF[e1x2, e4x2, e2x2, e3x2]), ((-I)*GS^2*(FR$delta[{aS}, {}] + 2*aS*FR$deltaZ[{G, G}, {{}}])*(SUNF[e1x2, e3x2, e2x2, e4x2] + SUNF[e1x2, e4x2, e2x2, e3x2]))/aS}, {(-I)*gc8*(SUNF[e1x2, e2x2, e3x2, e4x2] - SUNF[e1x2, e4x2, e2x2, e3x2]), ((-I)*GS^2*(FR$delta[{aS}, {}] + 2*aS*FR$deltaZ[{G, G}, {{}}])*(SUNF[e1x2, e2x2, e3x2, e4x2] - SUNF[e1x2, e4x2, e2x2, e3x2]))/aS}, {I*gc8*(SUNF[e1x2, e2x2, e3x2, e4x2] + SUNF[e1x2, e3x2, e2x2, e4x2]), (I*GS^2*(FR$delta[{aS}, {}] + 2*aS*FR$deltaZ[{G, G}, {{}}])*(SUNF[e1x2, e2x2, e3x2, e4x2] + SUNF[e1x2, e3x2, e2x2, e4x2]))/aS}},

C[ -F[4, {e1x2}] , F[4, {e2x2}] ] == {{0, (-I)*FR$deltaZ[{d, d}, {{}}, "L"]*IndexDelta[e1x2, e2x2]}, {0, I*FR$deltaZ[{d, d}, {{}}, "R"]*IndexDelta[e1x2, e2x2]}, {0, 0}, {0, 0}},

C[ -F[5, {e1x2}] , F[5, {e2x2}] ] == {{0, (-I)*FR$deltaZ[{s, s}, {{}}, "L"]*IndexDelta[e1x2, e2x2]}, {0, I*FR$deltaZ[{s, s}, {{}}, "R"]*IndexDelta[e1x2, e2x2]}, {0, 0}, {0, 0}},

C[ -F[2, {e1x2}] , F[2, {e2x2}] ] == {{0, (-I)*FR$deltaZ[{c, c}, {{}}, "L"]*IndexDelta[e1x2, e2x2]}, {0, I*FR$deltaZ[{c, c}, {{}}, "R"]*IndexDelta[e1x2, e2x2]}, {0, 0}, {0, 0}},

C[ -F[1, {e1x2}] , F[1, {e2x2}] ] == {{0, (-I)*FR$deltaZ[{u, u}, {{}}, "L"]*IndexDelta[e1x2, e2x2]}, {0, I*FR$deltaZ[{u, u}, {{}}, "R"]*IndexDelta[e1x2, e2x2]}, {0, 0}, {0, 0}},

C[ -F[3, {e1x2}] , F[7] , S[1, {e3x1}] ] == {{I*gc13*IndexDelta[e1x2, e3x1], (-I/2)*(2*FR$delta[{yDM}, {}] + yDM*FR$deltaZ[{ST, ST}, {{}}] + yDM*FR$deltaZ[{chi, chi}, {{}}, "L"] + yDM*FR$deltaZ[{t, t}, {{}}, "R"])*IndexDelta[e1x2, e3x1]}, {0, 0}},

C[ F[7] , F[3, {e2x2}] , -S[1, {e3x1}] ] == {{0, 0}, {I*gc14R*IndexDelta[e2x2, e3x1], (-I/2)*(2*FR$delta[{yDM}, {}] + yDM*FR$deltaZ[{ST, ST}, {{}}] + yDM*FR$deltaZ[{t, t}, {{}}, "R"])*IndexDelta[e2x2, e3x1]}},

C[ -F[2, {e1x2}] , F[2, {e2x2}] , V[1, {e3x2}] ] == {{I*gc15*SUNT[e3x2, e1x2, e2x2], ((I/2)*GS*(FR$delta[{aS}, {}] + aS*FR$deltaZ[{G, G}, {{}}] + 2*aS*FR$deltaZ[{c, c}, {{}}, "L"])*SUNT[e3x2, e1x2, e2x2])/aS}, {I*gc15*SUNT[e3x2, e1x2, e2x2], ((I/2)*GS*(FR$delta[{aS}, {}] + aS*FR$deltaZ[{G, G}, {{}}] + 2*aS*FR$deltaZ[{c, c}, {{}}, "R"])*SUNT[e3x2, e1x2, e2x2])/aS}},

C[ -F[3, {e1x2}] , F[3, {e2x2}] , V[1, {e3x2}] ] == {{I*gc16*SUNT[e3x2, e1x2, e2x2], ((I/2)*GS*(FR$delta[{aS}, {}] + aS*FR$deltaZ[{G, G}, {{}}] + 2*aS*FR$deltaZ[{t, t}, {{}}, "L"])*SUNT[e3x2, e1x2, e2x2])/aS}, {I*gc16*SUNT[e3x2, e1x2, e2x2], ((I/2)*GS*(FR$delta[{aS}, {}] + aS*FR$deltaZ[{G, G}, {{}}] + 2*aS*FR$deltaZ[{t, t}, {{}}, "R"])*SUNT[e3x2, e1x2, e2x2])/aS}},

C[ -F[1, {e1x2}] , F[1, {e2x2}] , V[1, {e3x2}] ] == {{I*gc17*SUNT[e3x2, e1x2, e2x2], ((I/2)*GS*(FR$delta[{aS}, {}] + aS*FR$deltaZ[{G, G}, {{}}] + 2*aS*FR$deltaZ[{u, u}, {{}}, "L"])*SUNT[e3x2, e1x2, e2x2])/aS}, {I*gc17*SUNT[e3x2, e1x2, e2x2], ((I/2)*GS*(FR$delta[{aS}, {}] + aS*FR$deltaZ[{G, G}, {{}}] + 2*aS*FR$deltaZ[{u, u}, {{}}, "R"])*SUNT[e3x2, e1x2, e2x2])/aS}},

C[ -F[6, {e1x2}] , F[6, {e2x2}] , V[1, {e3x2}] ] == {{I*gc18*SUNT[e3x2, e1x2, e2x2], ((I/2)*GS*(FR$delta[{aS}, {}] + aS*FR$deltaZ[{G, G}, {{}}] + 2*aS*FR$deltaZ[{b, b}, {{}}, "L"])*SUNT[e3x2, e1x2, e2x2])/aS}, {I*gc18*SUNT[e3x2, e1x2, e2x2], ((I/2)*GS*(FR$delta[{aS}, {}] + aS*FR$deltaZ[{G, G}, {{}}] + 2*aS*FR$deltaZ[{b, b}, {{}}, "R"])*SUNT[e3x2, e1x2, e2x2])/aS}},

C[ -F[4, {e1x2}] , F[4, {e2x2}] , V[1, {e3x2}] ] == {{I*gc19*SUNT[e3x2, e1x2, e2x2], ((I/2)*GS*(FR$delta[{aS}, {}] + aS*FR$deltaZ[{G, G}, {{}}] + 2*aS*FR$deltaZ[{d, d}, {{}}, "L"])*SUNT[e3x2, e1x2, e2x2])/aS}, {I*gc19*SUNT[e3x2, e1x2, e2x2], ((I/2)*GS*(FR$delta[{aS}, {}] + aS*FR$deltaZ[{G, G}, {{}}] + 2*aS*FR$deltaZ[{d, d}, {{}}, "R"])*SUNT[e3x2, e1x2, e2x2])/aS}},

C[ -F[5, {e1x2}] , F[5, {e2x2}] , V[1, {e3x2}] ] == {{I*gc20*SUNT[e3x2, e1x2, e2x2], ((I/2)*GS*(FR$delta[{aS}, {}] + aS*FR$deltaZ[{G, G}, {{}}] + 2*aS*FR$deltaZ[{s, s}, {{}}, "L"])*SUNT[e3x2, e1x2, e2x2])/aS}, {I*gc20*SUNT[e3x2, e1x2, e2x2], ((I/2)*GS*(FR$delta[{aS}, {}] + aS*FR$deltaZ[{G, G}, {{}}] + 2*aS*FR$deltaZ[{s, s}, {{}}, "R"])*SUNT[e3x2, e1x2, e2x2])/aS}},

C[ S[1, {e2x1}] , -S[1, {e3x1}] , V[1, {e1x2}] ] == {{I*GS*SUNT[e1x2, e3x1, e2x1], ((I/2)*GS*(FR$delta[{aS}, {}] + aS*FR$deltaZ[{G, G}, {{}}] + 2*aS*FR$deltaZ[{ST, ST}, {{}}])*SUNT[e1x2, e3x1, e2x1])/aS}},

C[ S[1, {e3x1}] , -S[1, {e4x1}] , V[1, {e1x2}] , V[1, {e2x2}] ] == {{I*GS^2*(SUNT[e1x2, e2x2, e4x1, e3x1] + SUNT[e2x2, e1x2, e4x1, e3x1]), (I*GS^2*(FR$delta[{aS}, {}] + aS*FR$deltaZ[{G, G}, {{}}] + aS*FR$deltaZ[{ST, ST}, {{}}])*(SUNT[e1x2, e2x2, e4x1, e3x1] + SUNT[e2x2, e1x2, e4x1, e3x1]))/aS}}

}

(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)

(* Parameter replacement lists (These lists were created by FeynRules) *)

(* FA Couplings *)

M$FACouplings = {
     gc6 -> -GS,
     gc8 -> GS^2,
     gc13 -> -yDM,
     gc14R -> -yDM,
     gc15 -> GS,
     gc16 -> GS,
     gc17 -> GS,
     gc18 -> GS,
     gc19 -> GS,
     gc20 -> GS};

