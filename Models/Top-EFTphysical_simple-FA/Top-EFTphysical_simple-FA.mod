(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)
(*                                                                             *)
(*         This file has been automatically generated by FeynRules.            *)
(*                                                                             *)
(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)


FR$ModelInformation={
  ModelName->"Top-EFT",
  Authors -> {"Andre Lessa"},
  Version -> "1.0",
  Date -> "28.08.2023"};

FR$ClassesTranslation={A -> V[1], Z -> V[2], W -> V[3], G -> V[4], ghA -> U[1], ghZ -> U[2], ghWp -> U[3], ghWm -> U[4], ghG -> U[5], ve -> F[1], vm -> F[2], vt -> F[3], e -> F[4], mu -> F[5], ta -> F[6], u -> F[7], c -> F[8], t -> F[9], d -> F[10], s -> F[11], b -> F[12], H -> S[1], G0 -> S[2], GP -> S[3], chi -> F[13], ST -> S[4]};

FR$InteractionOrderPerturbativeExpansion={{NP, 0}, {QCD, 0}, {QED, 0}};

FR$GoldstoneList={S[2], S[3]};

(*     Declared indices    *)

IndexRange[ Index[Gluon] ] = NoUnfold[ Range[ 8 ] ]

IndexRange[ Index[SU2W] ] = Range[ 3 ]

IndexRange[ Index[Generation] ] = Range[ 3 ]

IndexRange[ Index[Colour] ] = NoUnfold[ Range[ 3 ] ]

IndexRange[ Index[SU2D] ] = Range[ 2 ]

(*     Declared particles    *)

M$ClassesDescription = {
V[1] == {
    SelfConjugate -> True,
    PropagatorType -> Sine,
    PropagatorArrow -> None,
    Mass -> 0,
    Indices -> {},
    PropagatorLabel -> "A" },

V[2] == {
    SelfConjugate -> True,
    PropagatorType -> Sine,
    PropagatorArrow -> None,
    Mass -> MZ,
    Indices -> {},
    PropagatorLabel -> "Z" },

V[3] == {
    SelfConjugate -> False,
    QuantumNumbers -> {Q},
    PropagatorType -> Sine,
    PropagatorArrow -> Forward,
    Mass -> MW,
    Indices -> {},
    PropagatorLabel -> "W" },

V[4] == {
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
    Indices -> {},
    PropagatorLabel -> "ghA" },

U[2] == {
    SelfConjugate -> False,
    QuantumNumbers -> {GhostNumber},
    PropagatorType -> GhostDash,
    PropagatorArrow -> Forward,
    Mass -> MZ,
    Indices -> {},
    PropagatorLabel -> "ghZ" },

U[3] == {
    SelfConjugate -> False,
    QuantumNumbers -> {GhostNumber, Q},
    PropagatorType -> GhostDash,
    PropagatorArrow -> Forward,
    Mass -> MW,
    Indices -> {},
    PropagatorLabel -> "ghWp" },

U[4] == {
    SelfConjugate -> False,
    QuantumNumbers -> {GhostNumber, -Q},
    PropagatorType -> GhostDash,
    PropagatorArrow -> Forward,
    Mass -> MW,
    Indices -> {},
    PropagatorLabel -> "ghWm" },

U[5] == {
    SelfConjugate -> False,
    QuantumNumbers -> {GhostNumber},
    PropagatorType -> GhostDash,
    PropagatorArrow -> Forward,
    Mass -> 0,
    Indices -> {Index[Gluon]},
    PropagatorLabel -> "ghG" },

F[1] == {
    SelfConjugate -> False,
    QuantumNumbers -> {LeptonNumber},
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> 0,
    Indices -> {},
    PropagatorLabel -> "ve" },

F[2] == {
    SelfConjugate -> False,
    QuantumNumbers -> {LeptonNumber},
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> 0,
    Indices -> {},
    PropagatorLabel -> "vm" },

F[3] == {
    SelfConjugate -> False,
    QuantumNumbers -> {LeptonNumber},
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> 0,
    Indices -> {},
    PropagatorLabel -> "vt" },

F[4] == {
    SelfConjugate -> False,
    QuantumNumbers -> {-Q, LeptonNumber},
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> 0,
    Indices -> {},
    PropagatorLabel -> "e" },

F[5] == {
    SelfConjugate -> False,
    QuantumNumbers -> {-Q, LeptonNumber},
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> 0,
    Indices -> {},
    PropagatorLabel -> "mu" },

F[6] == {
    SelfConjugate -> False,
    QuantumNumbers -> {-Q, LeptonNumber},
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> MTA,
    Indices -> {},
    PropagatorLabel -> "ta" },

F[7] == {
    SelfConjugate -> False,
    QuantumNumbers -> {(2*Q)/3},
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> 0,
    Indices -> {Index[Colour]},
    PropagatorLabel -> "u" },

F[8] == {
    SelfConjugate -> False,
    QuantumNumbers -> {(2*Q)/3},
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> 0,
    Indices -> {Index[Colour]},
    PropagatorLabel -> "c" },

F[9] == {
    SelfConjugate -> False,
    QuantumNumbers -> {(2*Q)/3},
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> MT,
    Indices -> {Index[Colour]},
    PropagatorLabel -> "t" },

F[10] == {
    SelfConjugate -> False,
    QuantumNumbers -> {-Q/3},
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> 0,
    Indices -> {Index[Colour]},
    PropagatorLabel -> "d" },

F[11] == {
    SelfConjugate -> False,
    QuantumNumbers -> {-Q/3},
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> 0,
    Indices -> {Index[Colour]},
    PropagatorLabel -> "s" },

F[12] == {
    SelfConjugate -> False,
    QuantumNumbers -> {-Q/3},
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> MB,
    Indices -> {Index[Colour]},
    PropagatorLabel -> "b" },

S[1] == {
    SelfConjugate -> True,
    PropagatorType -> ScalarDash,
    PropagatorArrow -> None,
    Mass -> MH,
    Indices -> {},
    PropagatorLabel -> "H" },

S[2] == {
    SelfConjugate -> True,
    PropagatorType -> ScalarDash,
    PropagatorArrow -> None,
    Mass -> MZ,
    Indices -> {},
    PropagatorLabel -> "G0" },

S[3] == {
    SelfConjugate -> False,
    QuantumNumbers -> {Q},
    PropagatorType -> ScalarDash,
    PropagatorArrow -> None,
    Mass -> MW,
    Indices -> {},
    PropagatorLabel -> "GP" },

F[13] == {
    SelfConjugate -> True,
    QuantumNumbers -> {},
    PropagatorType -> Straight,
    PropagatorArrow -> None,
    Mass -> mChi,
    Indices -> {},
    PropagatorLabel -> "chi" },

S[4] == {
    SelfConjugate -> False,
    QuantumNumbers -> {(2*Q)/3},
    PropagatorType -> ScalarDash,
    PropagatorArrow -> Forward,
    Mass -> mST,
    Indices -> {Index[Colour]},
    PropagatorLabel -> "ST" }
}


(*        Definitions       *)

GaugeXi[ V[1] ] = GaugeXi[A];
GaugeXi[ V[2] ] = GaugeXi[Z];
GaugeXi[ V[3] ] = GaugeXi[W];
GaugeXi[ V[4] ] = GaugeXi[G];
GaugeXi[ U[1] ] = GaugeXi[A];
GaugeXi[ U[2] ] = GaugeXi[Z];
GaugeXi[ U[3] ] = GaugeXi[W];
GaugeXi[ U[4] ] = GaugeXi[W];
GaugeXi[ U[5] ] = GaugeXi[G];
GaugeXi[ S[1] ] = 1;
GaugeXi[ S[2] ] = GaugeXi[Z];
GaugeXi[ S[3] ] = GaugeXi[W];
GaugeXi[ F[13] ] = GaugeXi[F[16]];
GaugeXi[ S[4] ] = GaugeXi[S[5]];

MZ[ ___ ] := MZ;
MW[ ___ ] := MW;
MTA[ ___ ] := MTA;
MT[ ___ ] := MT;
MB[ ___ ] := MB;
MH[ ___ ] := MH;
mChi[ ___ ] := mChi;
mST[ ___ ] := mST;


TheLabel[ V[4, {__}] ] := TheLabel[V[4]];
TheLabel[ U[5, {__}] ] := TheLabel[U[5]];
TheLabel[ F[7, {__}] ] := TheLabel[F[7]];
TheLabel[ F[8, {__}] ] := TheLabel[F[8]];
TheLabel[ F[9, {__}] ] := TheLabel[F[9]];
TheLabel[ F[10, {__}] ] := TheLabel[F[10]];
TheLabel[ F[11, {__}] ] := TheLabel[F[11]];
TheLabel[ F[12, {__}] ] := TheLabel[F[12]];
TheLabel[ S[4, {__}] ] := TheLabel[S[4]];


(*      Couplings (calculated by FeynRules)      *)

M$CouplingMatrices = {

C[ S[2] , S[2] , S[2] , S[2] ] == {{(-6*I)*lam, 0}},

C[ S[2] , S[2] , S[3] , -S[3] ] == {{(-2*I)*lam, 0}},

C[ S[3] , S[3] , -S[3] , -S[3] ] == {{(-4*I)*lam, 0}},

C[ S[2] , S[2] , S[1] , S[1] ] == {{(-2*I)*lam, 0}},

C[ S[3] , -S[3] , S[1] , S[1] ] == {{(-2*I)*lam, 0}},

C[ S[1] , S[1] , S[1] , S[1] ] == {{(-6*I)*lam, 0}},

C[ S[2] , S[2] , S[1] ] == {{(-2*I)*lam*vev, 0}},

C[ S[3] , -S[3] , S[1] ] == {{(-2*I)*lam*vev, 0}},

C[ S[1] , S[1] , S[1] ] == {{(-6*I)*lam*vev, 0}},

C[ S[3] , -S[3] , V[1] , V[1] ] == {{(2*I)*EL^2, 0}},

C[ S[3] , -S[3] , V[1] ] == {{(-I)*gc11, 0}, {I*gc11, 0}},

C[ -U[1] , U[4] , V[3] ] == {{I*gc12, 0}, {I*gc12, 0}, {0, 0}},

C[ -U[1] , U[3] , -V[3] ] == {{I*gc13, 0}, {I*gc13, 0}, {0, 0}},

C[ -S[3] , -U[4] , U[1] ] == {{(EL^2*vev)/(2*sw), 0}},

C[ -U[4] , U[1] , -V[3] ] == {{I*gc15, 0}, {I*gc15, 0}, {0, 0}},

C[ S[2] , -U[4] , U[4] ] == {{-(EL^2*vev)/(4*sw^2), 0}},

C[ S[1] , -U[4] , U[4] ] == {{((-I/4)*EL^2*vev)/sw^2, 0}},

C[ -U[4] , U[4] , V[1] ] == {{I*gc18, 0}, {I*gc18, 0}, {0, 0}},

C[ -U[4] , U[4] , V[2] ] == {{I*gc19, 0}, {I*gc19, 0}, {0, 0}},

C[ -S[3] , -U[4] , U[2] ] == {{(EL^2*(cw - sw)*(cw + sw)*vev)/(4*cw*sw^2), 0}},

C[ -U[4] , U[2] , -V[3] ] == {{I*gc21, 0}, {I*gc21, 0}, {0, 0}},

C[ S[3] , -U[3] , U[1] ] == {{-(EL^2*vev)/(2*sw), 0}},

C[ -U[3] , U[1] , V[3] ] == {{I*gc23, 0}, {I*gc23, 0}, {0, 0}},

C[ S[2] , -U[3] , U[3] ] == {{(EL^2*vev)/(4*sw^2), 0}},

C[ S[1] , -U[3] , U[3] ] == {{((-I/4)*EL^2*vev)/sw^2, 0}},

C[ -U[3] , U[3] , V[1] ] == {{I*gc26, 0}, {I*gc26, 0}, {0, 0}},

C[ -U[3] , U[3] , V[2] ] == {{I*gc27, 0}, {I*gc27, 0}, {0, 0}},

C[ S[3] , -U[3] , U[2] ] == {{-(EL^2*(cw - sw)*(cw + sw)*vev)/(4*cw*sw^2), 0}},

C[ -U[3] , U[2] , V[3] ] == {{I*gc29, 0}, {I*gc29, 0}, {0, 0}},

C[ S[3] , -U[2] , U[4] ] == {{(EL^2*(cw^2 + sw^2)*vev)/(4*cw*sw^2), 0}},

C[ -U[2] , U[4] , V[3] ] == {{I*gc31, 0}, {I*gc31, 0}, {0, 0}},

C[ -S[3] , -U[2] , U[3] ] == {{-(EL^2*(cw^2 + sw^2)*vev)/(4*cw*sw^2), 0}},

C[ -U[2] , U[3] , -V[3] ] == {{I*gc33, 0}, {I*gc33, 0}, {0, 0}},

C[ S[1] , -U[2] , U[2] ] == {{((-I/4)*EL^2*(cw^2 + sw^2)^2*vev)/(cw^2*sw^2), 0}},

C[ -U[5, {e1x1}] , U[5, {e2x1}] , V[4, {e3x2}] ] == {{gc35*SUNF[e3x2, e1x1, e2x1], 0}, {gc35*SUNF[e3x2, e1x1, e2x1], 0}, {0, 0}},

C[ V[4, {e1x2}] , V[4, {e2x2}] , V[4, {e3x2}] ] == {{-(gc36*SUNF[e1x2, e2x2, e3x2]), 0}, {gc36*SUNF[e1x2, e2x2, e3x2], 0}, {gc36*SUNF[e1x2, e2x2, e3x2], 0}, {-(gc36*SUNF[e1x2, e2x2, e3x2]), 0}, {-(gc36*SUNF[e1x2, e2x2, e3x2]), 0}, {gc36*SUNF[e1x2, e2x2, e3x2], 0}},

C[ V[4, {e1x2}] , V[4, {e2x2}] , V[4, {e3x2}] , V[4, {e4x2}] ] == {{(-I)*gc37*(SUNF[e1x2, e2x2, e3x2, e4x2] + SUNF[e1x2, e3x2, e2x2, e4x2]), 0}, {I*gc37*(SUNF[e1x2, e2x2, e3x2, e4x2] - SUNF[e1x2, e4x2, e2x2, e3x2]), 0}, {I*gc37*(SUNF[e1x2, e3x2, e2x2, e4x2] + SUNF[e1x2, e4x2, e2x2, e3x2]), 0}},

C[ -F[12, {e1x2}] , F[9, {e2x2}] , -S[3] ] == {{gc38*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {-((gc38*yt*IndexDelta[e1x2, e2x2])/yb), 0}, {0, 0}},

C[ -F[12, {e1x2}] , F[12, {e2x2}] , S[2] ] == {{gc39*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {-(gc39*IndexDelta[e1x2, e2x2]), 0}, {0, 0}},

C[ -F[12, {e1x2}] , F[12, {e2x2}] , S[1] ] == {{I*gc40*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {I*gc40*IndexDelta[e1x2, e2x2], 0}, {0, 0}},

C[ -F[6] , F[3] , -S[3] ] == {{gc41, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[6] , F[6] , S[2] ] == {{gc42, 0}, {0, 0}, {-gc42, 0}, {0, 0}},

C[ -F[6] , F[6] , S[1] ] == {{I*gc43, 0}, {0, 0}, {I*gc43, 0}, {0, 0}},

C[ -F[9, {e1x2}] , F[12, {e2x2}] , S[3] ] == {{gc44*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {-((gc44*yb*IndexDelta[e1x2, e2x2])/yt), 0}, {0, 0}},

C[ -F[9, {e1x2}] , F[9, {e2x2}] , S[2] ] == {{gc45*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {-(gc45*IndexDelta[e1x2, e2x2]), 0}, {0, 0}},

C[ -F[9, {e1x2}] , F[9, {e2x2}] , S[1] ] == {{I*gc46*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {I*gc46*IndexDelta[e1x2, e2x2], 0}, {0, 0}},

C[ -F[9, {e1x2}] , F[13] , S[4, {e3x1}] ] == {{I*gc47*IndexDelta[e1x2, e3x1], 0}, {0, 0}, {0, 0}, {0, 0}},

C[ F[13] , F[9, {e2x2}] , -S[4, {e3x1}] ] == {{0, 0}, {0, 0}, {(-I)*yDM*IndexDelta[e2x2, e3x1], 0}, {0, 0}},

C[ S[4, {e2x1}] , -S[4, {e3x1}] , V[4, {e1x2}] ] == {{(-I)*gc49*SUNT[e1x2, e3x1, e2x1], 0}, {I*gc49*SUNT[e1x2, e3x1, e2x1], 0}},

C[ S[4, {e3x1}] , -S[4, {e4x1}] , V[4, {e1x2}] , V[4, {e2x2}] ] == {{I*GS^2*(SUNT[e1x2, e2x2, e4x1, e3x1] + SUNT[e2x2, e1x2, e4x1, e3x1]), 0}},

C[ S[2] , -S[3] , V[1] , V[3] ] == {{((-I/2)*EL^2)/sw, 0}},

C[ -S[3] , S[1] , V[1] , V[3] ] == {{-EL^2/(2*sw), 0}},

C[ -S[3] , V[1] , V[3] ] == {{-(EL^2*vev)/(2*sw), 0}},

C[ S[2] , -S[3] , V[3] ] == {{(-I)*gc54, 0}, {I*gc54, 0}},

C[ -S[3] , S[1] , V[3] ] == {{-gc55, 0}, {gc55, 0}},

C[ V[1] , V[3] , -V[3] ] == {{(-I)*gc56, 0}, {I*gc56, 0}, {I*gc56, 0}, {(-I)*gc56, 0}, {(-I)*gc56, 0}, {I*gc56, 0}},

C[ S[2] , S[3] , V[1] , -V[3] ] == {{((-I/2)*EL^2)/sw, 0}},

C[ S[3] , S[1] , V[1] , -V[3] ] == {{EL^2/(2*sw), 0}},

C[ S[3] , V[1] , -V[3] ] == {{(EL^2*vev)/(2*sw), 0}},

C[ S[2] , S[3] , -V[3] ] == {{(-I)*gc60, 0}, {I*gc60, 0}},

C[ S[3] , S[1] , -V[3] ] == {{-gc61, 0}, {gc61, 0}},

C[ S[2] , S[2] , V[3] , -V[3] ] == {{((I/2)*EL^2)/sw^2, 0}},

C[ S[3] , -S[3] , V[3] , -V[3] ] == {{((I/2)*EL^2)/sw^2, 0}},

C[ S[1] , S[1] , V[3] , -V[3] ] == {{((I/2)*EL^2)/sw^2, 0}},

C[ S[1] , V[3] , -V[3] ] == {{((I/2)*EL^2*vev)/sw^2, 0}},

C[ V[1] , V[1] , V[3] , -V[3] ] == {{(-I)*gc66, 0}, {(-I)*gc66, 0}, {(2*I)*gc66, 0}},

C[ V[3] , -V[3] , V[2] ] == {{(-I)*gc67, 0}, {I*gc67, 0}, {I*gc67, 0}, {(-I)*gc67, 0}, {(-I)*gc67, 0}, {I*gc67, 0}},

C[ V[3] , V[3] , -V[3] , -V[3] ] == {{(-I)*gc68, 0}, {(-I)*gc68, 0}, {(2*I)*gc68, 0}},

C[ -F[3] , F[6] , S[3] ] == {{0, 0}, {0, 0}, {-ytau, 0}, {0, 0}},

C[ S[3] , -S[3] , V[1] , V[2] ] == {{(I*EL^2*(cw - sw)*(cw + sw))/(cw*sw), 0}},

C[ S[2] , S[1] , V[2] ] == {{-gc71, 0}, {gc71, 0}},

C[ S[3] , -S[3] , V[2] ] == {{(-I)*gc72, 0}, {I*gc72, 0}},

C[ S[2] , -S[3] , V[3] , V[2] ] == {{((I/2)*EL^2)/cw, 0}},

C[ -S[3] , S[1] , V[3] , V[2] ] == {{EL^2/(2*cw), 0}},

C[ -S[3] , V[3] , V[2] ] == {{(EL^2*vev)/(2*cw), 0}},

C[ S[2] , S[3] , -V[3] , V[2] ] == {{((I/2)*EL^2)/cw, 0}},

C[ S[3] , S[1] , -V[3] , V[2] ] == {{-EL^2/(2*cw), 0}},

C[ S[3] , -V[3] , V[2] ] == {{-(EL^2*vev)/(2*cw), 0}},

C[ V[1] , V[3] , -V[3] , V[2] ] == {{(-2*I)*gc79, 0}, {I*gc79, 0}, {I*gc79, 0}},

C[ S[2] , S[2] , V[2] , V[2] ] == {{((I/2)*EL^2*(cw^2 + sw^2)^2)/(cw^2*sw^2), 0}},

C[ S[3] , -S[3] , V[2] , V[2] ] == {{((I/2)*EL^2*(cw - sw)^2*(cw + sw)^2)/(cw^2*sw^2), 0}},

C[ S[1] , S[1] , V[2] , V[2] ] == {{((I/2)*EL^2*(cw^2 + sw^2)^2)/(cw^2*sw^2), 0}},

C[ S[1] , V[2] , V[2] ] == {{((I/2)*EL^2*(cw^2 + sw^2)^2*vev)/(cw^2*sw^2), 0}},

C[ V[3] , -V[3] , V[2] , V[2] ] == {{(-I)*gc84, 0}, {(-I)*gc84, 0}, {(2*I)*gc84, 0}},

C[ -F[4] , F[4] , V[1] ] == {{I*gc85, 0}, {0, 0}, {I*gc85, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[5] , F[5] , V[1] ] == {{I*gc86, 0}, {0, 0}, {I*gc86, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[6] , F[6] , V[1] ] == {{I*gc87, 0}, {0, 0}, {I*gc87, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[8, {e1x2}] , F[8, {e2x2}] , V[1] ] == {{I*gc88*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {I*gc88*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[9, {e1x2}] , F[9, {e2x2}] , V[1] ] == {{I*gc89*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {I*gc89*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[7, {e1x2}] , F[7, {e2x2}] , V[1] ] == {{I*gc90*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {I*gc90*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[12, {e1x2}] , F[12, {e2x2}] , V[1] ] == {{I*gc91*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {I*gc91*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[10, {e1x2}] , F[10, {e2x2}] , V[1] ] == {{I*gc92*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {I*gc92*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[11, {e1x2}] , F[11, {e2x2}] , V[1] ] == {{I*gc93*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {I*gc93*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[8, {e1x2}] , F[8, {e2x2}] , V[4, {e3x2}] ] == {{I*gc94*SUNT[e3x2, e1x2, e2x2], 0}, {0, 0}, {I*gc94*SUNT[e3x2, e1x2, e2x2], 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[9, {e1x2}] , F[9, {e2x2}] , V[4, {e3x2}] ] == {{I*gc95*SUNT[e3x2, e1x2, e2x2], 0}, {0, 0}, {I*gc95*SUNT[e3x2, e1x2, e2x2], 0}, {0, 0}, {((-I)*A0*gc95*SUNT[e3x2, e1x2, e2x2])/GS, 0}, {0, 0}, {((-I)*A0*gc95*SUNT[e3x2, e1x2, e2x2])/GS, 0}, {0, 0}, {(I*A0*gc95*SUNT[e3x2, e1x2, e2x2])/GS, 0}, {0, 0}, {(I*A0*gc95*SUNT[e3x2, e1x2, e2x2])/GS, 0}, {0, 0}},

C[ -F[7, {e1x2}] , F[7, {e2x2}] , V[4, {e3x2}] ] == {{I*gc96*SUNT[e3x2, e1x2, e2x2], 0}, {0, 0}, {I*gc96*SUNT[e3x2, e1x2, e2x2], 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[12, {e1x2}] , F[12, {e2x2}] , V[4, {e3x2}] ] == {{I*gc97*SUNT[e3x2, e1x2, e2x2], 0}, {0, 0}, {I*gc97*SUNT[e3x2, e1x2, e2x2], 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[10, {e1x2}] , F[10, {e2x2}] , V[4, {e3x2}] ] == {{I*gc98*SUNT[e3x2, e1x2, e2x2], 0}, {0, 0}, {I*gc98*SUNT[e3x2, e1x2, e2x2], 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[11, {e1x2}] , F[11, {e2x2}] , V[4, {e3x2}] ] == {{I*gc99*SUNT[e3x2, e1x2, e2x2], 0}, {0, 0}, {I*gc99*SUNT[e3x2, e1x2, e2x2], 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[8, {e1x2}] , F[11, {e2x2}] , V[3] ] == {{I*gc100*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[9, {e1x2}] , F[12, {e2x2}] , V[3] ] == {{I*gc101*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[7, {e1x2}] , F[10, {e2x2}] , V[3] ] == {{I*gc102*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[12, {e1x2}] , F[9, {e2x2}] , -V[3] ] == {{I*gc103*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[10, {e1x2}] , F[7, {e2x2}] , -V[3] ] == {{I*gc104*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[11, {e1x2}] , F[8, {e2x2}] , -V[3] ] == {{I*gc105*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[1] , F[4] , V[3] ] == {{I*gc106, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[2] , F[5] , V[3] ] == {{I*gc107, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[3] , F[6] , V[3] ] == {{I*gc108, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[4] , F[1] , -V[3] ] == {{I*gc109, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[5] , F[2] , -V[3] ] == {{I*gc110, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[6] , F[3] , -V[3] ] == {{I*gc111, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[8, {e1x2}] , F[8, {e2x2}] , V[2] ] == {{I*gc112*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {((4*I)*gc112*sw^2*IndexDelta[e1x2, e2x2])/(-3*cw^2 + sw^2), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[9, {e1x2}] , F[9, {e2x2}] , V[2] ] == {{I*gc113*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {((4*I)*gc113*sw^2*IndexDelta[e1x2, e2x2])/(-3*cw^2 + sw^2), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[7, {e1x2}] , F[7, {e2x2}] , V[2] ] == {{I*gc114*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {((4*I)*gc114*sw^2*IndexDelta[e1x2, e2x2])/(-3*cw^2 + sw^2), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[12, {e1x2}] , F[12, {e2x2}] , V[2] ] == {{I*gc115*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {((-2*I)*gc115*sw^2*IndexDelta[e1x2, e2x2])/(3*cw^2 + sw^2), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[10, {e1x2}] , F[10, {e2x2}] , V[2] ] == {{I*gc116*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {((-2*I)*gc116*sw^2*IndexDelta[e1x2, e2x2])/(3*cw^2 + sw^2), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[11, {e1x2}] , F[11, {e2x2}] , V[2] ] == {{I*gc117*IndexDelta[e1x2, e2x2], 0}, {0, 0}, {((-2*I)*gc117*sw^2*IndexDelta[e1x2, e2x2])/(3*cw^2 + sw^2), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[1] , F[1] , V[2] ] == {{I*gc118, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[2] , F[2] , V[2] ] == {{I*gc119, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[3] , F[3] , V[2] ] == {{I*gc120, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[4] , F[4] , V[2] ] == {{I*gc121, 0}, {0, 0}, {((2*I)*gc121*sw^2)/(-cw^2 + sw^2), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[5] , F[5] , V[2] ] == {{I*gc122, 0}, {0, 0}, {((2*I)*gc122*sw^2)/(-cw^2 + sw^2), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[6] , F[6] , V[2] ] == {{I*gc123, 0}, {0, 0}, {((2*I)*gc123*sw^2)/(-cw^2 + sw^2), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[12, {e1x2}] , -F[9, {e3x2}] , F[12, {e2x2}] , F[9, {e4x2}] ] == {{0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {(-I)*gc124*(3*IndexDelta[e1x2, e4x2]*IndexDelta[e2x2, e3x2] - IndexDelta[e1x2, e2x2]*IndexDelta[e3x2, e4x2]), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {(-I)*gc124*(3*IndexDelta[e1x2, e4x2]*IndexDelta[e2x2, e3x2] - IndexDelta[e1x2, e2x2]*IndexDelta[e3x2, e4x2]), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[10, {e1x2}] , -F[9, {e3x2}] , F[10, {e2x2}] , F[9, {e4x2}] ] == {{0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {(-I)*gc125*(3*IndexDelta[e1x2, e4x2]*IndexDelta[e2x2, e3x2] - IndexDelta[e1x2, e2x2]*IndexDelta[e3x2, e4x2]), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {(-I)*gc125*(3*IndexDelta[e1x2, e4x2]*IndexDelta[e2x2, e3x2] - IndexDelta[e1x2, e2x2]*IndexDelta[e3x2, e4x2]), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[11, {e1x2}] , -F[9, {e3x2}] , F[11, {e2x2}] , F[9, {e4x2}] ] == {{0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {(-I)*gc126*(3*IndexDelta[e1x2, e4x2]*IndexDelta[e2x2, e3x2] - IndexDelta[e1x2, e2x2]*IndexDelta[e3x2, e4x2]), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {(-I)*gc126*(3*IndexDelta[e1x2, e4x2]*IndexDelta[e2x2, e3x2] - IndexDelta[e1x2, e2x2]*IndexDelta[e3x2, e4x2]), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[8, {e1x2}] , -F[9, {e3x2}] , F[8, {e2x2}] , F[9, {e4x2}] ] == {{0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {(-I)*gc127*(3*IndexDelta[e1x2, e4x2]*IndexDelta[e2x2, e3x2] - IndexDelta[e1x2, e2x2]*IndexDelta[e3x2, e4x2]), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {(-I)*gc127*(3*IndexDelta[e1x2, e4x2]*IndexDelta[e2x2, e3x2] - IndexDelta[e1x2, e2x2]*IndexDelta[e3x2, e4x2]), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[9, {e1x2}] , -F[9, {e3x2}] , F[9, {e2x2}] , F[9, {e4x2}] ] == {{(-I)*gc128*(3*IndexDelta[e1x2, e4x2]*IndexDelta[e2x2, e3x2] - IndexDelta[e1x2, e2x2]*IndexDelta[e3x2, e4x2]), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {I*gc128*(IndexDelta[e1x2, e4x2]*IndexDelta[e2x2, e3x2] - 3*IndexDelta[e1x2, e2x2]*IndexDelta[e3x2, e4x2]), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {I*gc128*(IndexDelta[e1x2, e4x2]*IndexDelta[e2x2, e3x2] - 3*IndexDelta[e1x2, e2x2]*IndexDelta[e3x2, e4x2]), 0}, {0, 0}, {(-I)*gc128*(3*IndexDelta[e1x2, e4x2]*IndexDelta[e2x2, e3x2] - IndexDelta[e1x2, e2x2]*IndexDelta[e3x2, e4x2]), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {(2*I)*gc128*(IndexDelta[e1x2, e4x2]*IndexDelta[e2x2, e3x2] - 3*IndexDelta[e1x2, e2x2]*IndexDelta[e3x2, e4x2]), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {(-2*I)*gc128*(3*IndexDelta[e1x2, e4x2]*IndexDelta[e2x2, e3x2] - IndexDelta[e1x2, e2x2]*IndexDelta[e3x2, e4x2]), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[9, {e1x2}] , -F[7, {e3x2}] , F[9, {e2x2}] , F[7, {e4x2}] ] == {{(-I)*gc129*(3*IndexDelta[e1x2, e4x2]*IndexDelta[e2x2, e3x2] - IndexDelta[e1x2, e2x2]*IndexDelta[e3x2, e4x2]), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {(-I)*gc129*(3*IndexDelta[e1x2, e4x2]*IndexDelta[e2x2, e3x2] - IndexDelta[e1x2, e2x2]*IndexDelta[e3x2, e4x2]), 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},

C[ -F[9, {e1x2}] , F[9, {e2x2}] , V[4, {e3x2}] , V[4, {e4x2}] ] == {{I*gc130*(SUNT[e3x2, e4x2, e1x2, e2x2] - SUNT[e4x2, e3x2, e1x2, e2x2]), 0}, {0, 0}, {I*gc130*(SUNT[e3x2, e4x2, e1x2, e2x2] - SUNT[e4x2, e3x2, e1x2, e2x2]), 0}, {0, 0}, {(-I)*gc130*(SUNT[e3x2, e4x2, e1x2, e2x2] - SUNT[e4x2, e3x2, e1x2, e2x2]), 0}, {0, 0}, {(-I)*gc130*(SUNT[e3x2, e4x2, e1x2, e2x2] - SUNT[e4x2, e3x2, e1x2, e2x2]), 0}, {0, 0}}

}

(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)

(* Parameter replacement lists (These lists were created by FeynRules) *)

(* FA Couplings *)

M$FACouplings = {
     gc11 -> -EL,
     gc12 -> EL,
     gc13 -> -EL,
     gc15 -> EL,
     gc18 -> -EL,
     gc19 -> -((cw*EL)/sw),
     gc21 -> (cw*EL)/sw,
     gc23 -> -EL,
     gc26 -> EL,
     gc27 -> (cw*EL)/sw,
     gc29 -> -((cw*EL)/sw),
     gc31 -> (cw*EL)/sw,
     gc33 -> -((cw*EL)/sw),
     gc35 -> GS,
     gc36 -> -GS,
     gc37 -> -GS^2,
     gc38 -> yb,
     gc39 -> -(yb/Sqrt[2]),
     gc40 -> -(yb/Sqrt[2]),
     gc41 -> ytau,
     gc42 -> -(ytau/Sqrt[2]),
     gc43 -> -(ytau/Sqrt[2]),
     gc44 -> yt,
     gc45 -> yt/Sqrt[2],
     gc46 -> -(yt/Sqrt[2]),
     gc47 -> -yDM,
     gc49 -> -GS,
     gc54 -> EL/(2*sw),
     gc55 -> -EL/(2*sw),
     gc56 -> EL,
     gc60 -> -EL/(2*sw),
     gc61 -> -EL/(2*sw),
     gc66 -> -EL^2,
     gc67 -> (cw*EL)/sw,
     gc68 -> EL^2/sw^2,
     gc71 -> -(EL*(cw^2 + sw^2))/(2*cw*sw),
     gc72 -> -(cw*EL)/(2*sw) + (EL*sw)/(2*cw),
     gc79 -> (cw*EL^2)/sw,
     gc84 -> -((cw^2*EL^2)/sw^2),
     gc85 -> -EL,
     gc86 -> -EL,
     gc87 -> -EL,
     gc88 -> (2*EL)/3,
     gc89 -> (2*EL)/3,
     gc90 -> (2*EL)/3,
     gc91 -> -EL/3,
     gc92 -> -EL/3,
     gc93 -> -EL/3,
     gc94 -> GS,
     gc95 -> GS,
     gc96 -> GS,
     gc97 -> GS,
     gc98 -> GS,
     gc99 -> GS,
     gc100 -> EL/(Sqrt[2]*sw),
     gc101 -> EL/(Sqrt[2]*sw),
     gc102 -> EL/(Sqrt[2]*sw),
     gc103 -> EL/(Sqrt[2]*sw),
     gc104 -> EL/(Sqrt[2]*sw),
     gc105 -> EL/(Sqrt[2]*sw),
     gc106 -> EL/(Sqrt[2]*sw),
     gc107 -> EL/(Sqrt[2]*sw),
     gc108 -> EL/(Sqrt[2]*sw),
     gc109 -> EL/(Sqrt[2]*sw),
     gc110 -> EL/(Sqrt[2]*sw),
     gc111 -> EL/(Sqrt[2]*sw),
     gc112 -> (cw*EL)/(2*sw) - (EL*sw)/(6*cw),
     gc113 -> (cw*EL)/(2*sw) - (EL*sw)/(6*cw),
     gc114 -> (cw*EL)/(2*sw) - (EL*sw)/(6*cw),
     gc115 -> -(EL*(3*cw^2 + sw^2))/(6*cw*sw),
     gc116 -> -(EL*(3*cw^2 + sw^2))/(6*cw*sw),
     gc117 -> -(EL*(3*cw^2 + sw^2))/(6*cw*sw),
     gc118 -> (EL*(cw^2 + sw^2))/(2*cw*sw),
     gc119 -> (EL*(cw^2 + sw^2))/(2*cw*sw),
     gc120 -> (EL*(cw^2 + sw^2))/(2*cw*sw),
     gc121 -> -(EL*(cw^2 - sw^2))/(2*cw*sw),
     gc122 -> -(EL*(cw^2 - sw^2))/(2*cw*sw),
     gc123 -> -(EL*(cw^2 - sw^2))/(2*cw*sw),
     gc124 -> -B0,
     gc125 -> -B0,
     gc126 -> -B0,
     gc127 -> -B0,
     gc128 -> -B0,
     gc129 -> -B0,
     gc130 -> A0*GS};

