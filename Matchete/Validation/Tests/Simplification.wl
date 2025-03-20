(* ::Package:: *)

(* ::Chapter:: *)
(*Simplification tests*)


(* ::Section:: *)
(*Setup*)


If[!MemberQ[$ContextPath, "Matchete`PackageScope`"], PrependTo[$ContextPath,"Matchete`PackageScope`"];]


LoadModel@ "SM";


DefineField[\[Psi], Fermion];


(* ::Section:: *)
(*Tests*)


(* ::Subsection:: *)
(*Kinetic terms*)


VerificationTest[
	- Bar@ H@ i CD[{\[Mu],\[Mu]}, H@ i]// GreensSimplify
,
	Bar@ CD[d$$1, H@ d$$1] CD[d$$1, H@ d$$1]
, TestID-> "Higgs kinetic term"]


VerificationTest[
	- I CD[\[Mu], Bar@ l[i, p]] **\[Gamma]@\[Mu] ** l[i,p] //GreensSimplify //RelabelIndices
,
	I Bar@ l[d$$1, d$$1] ** \[Gamma]@ d$$1 ** CD[d$$1, l[d$$1, d$$1]]
, TestID-> "Lepton kinetic term"]


(* ::Subsection:: *)
(*Identities *)


(* ::Subsubsection::Closed:: *)
(*Group relations *)


(* ::Text:: *)
(*SU(2) identities with GroupFierz*)


VerificationTest[
	Block[{op1, op2, op3},
		op1=(CD[\[Nu],Bar@H@i]H@i Bar@H@j CD[\[Mu],H@k] - Bar@H@i CD[\[Nu],H@i] CD[\[Mu],Bar@H@j] H@k)CG[gen@SU2L@fund,{a,j,k}]FS[W,\[Mu],\[Nu],a];
		op2= CD[\[Mu],Bar@H@j] CD[\[Nu],H@k] Bar@H@i H@i CG[gen@SU2L@fund,{a,j,k}]FS[W,\[Mu],\[Nu],a];
		op3= CD[\[Mu],Bar@H@i] CD[\[Nu],H@i] Bar@H@j H@k CG[gen@SU2L@fund,{a,j,k}]FS[W,\[Mu],\[Nu],a];
		op1+op2+op3//GreensSimplify
	]
,
	0
, TestID-> "IdentitiesGroupFierz"]


(* ::Subsubsection::Closed:: *)
(*Symmetries*)


VerificationTest[
	Bar@ CG[eps@ SU2L, {i, j}] H@i H@ j// GreensSimplify
,
	0
, TestID-> "Higgs with eps[SU2L] 0"]


VerificationTest[
	Bar@ H@ i CD[\[Mu], H@ i]Bar@ H@ j CD[\[Nu], H@ j]LCTensor[\[Mu], \[Nu], \[Rho], \[Sigma]]FS[B, \[Rho], \[Sigma]]// GreensSimplify
,
	0
, TestID-> "Levi-Civita with derivatives 0"]


VerificationTest[
	Bar@CConj@\[Psi][]**\[Gamma][\[Mu],\[Nu]]**\[Psi][] Bar@\[Psi][]**\[Gamma][\[Mu],\[Nu]]**CConj@\[Psi][]// GreensSimplify
,
	0
, TestID-> "Spinor line transposition 0"]


(* ::Subsection:: *)
(*Compound operators*)


(* ::Text:: *)
(*Identifies symmetry in spin-chain transposition and identifies the flavor symmetry of Weinberg + dim-7 operators*)


VerificationTest[Module[{op5, op7, lag},
		DefineCoupling[Cll, Indices-> {Flavor, Flavor}, Symmetries-> {SymmetricIndices[1, 2]}];
		DefineCoupling[CllB, Indices-> {Flavor, Flavor}, Symmetries-> {AntisymmetricIndices[1, 2]}];
		op5= Bar@ CConj@ l[i, p]**l[j, r]H@ k H@ l Bar@CG[eps@ SU2L, {i, k}]Bar@ CG[eps@ SU2L, {j, l}];
		op7= FS[B, \[Mu], \[Nu]]Bar@ CConj@ l[i, p]** \[Sigma][\[Mu], \[Nu]]** l[j,r]H@ k H@ l Bar@ CG[eps@ SU2L, {i, k}]Bar@ CG[eps@ SU2L, {j, l}];
		lag= -Cll[p, r] op5- CllB[p, r] op7// PlusHc;
		lag= InternalSimplify[lag, InternalOpRepresentation-> True];
		{
			(*No composite operators*)
			FreeQ[lag, CompOp]
		, 
			(*The two starting operators + conjugates*)
			Sort@ Cases[lag, AtomicOp[type_, id_, _]-> {type, id}, Infinity]
		,
			(*op5 is symmetric. op7 is antisymmetric*)
			{$operators[{{H, H, l, l}, 0}, 1]@ Symmetries, $operators[{{H, H, l, l}, 2}, 1]@ Symmetries}
		}
	]
,
	{
		True
	,
		{
			{{{H, H, l, l}, 0}, 1}, 
			{{{H, H, l, l}, 2}, 1},
			{{{Conj[H], Conj[H], Conj[l], Conj[l]}, 0}, 1},
			{{{Conj[H], Conj[H], Conj[l], Conj[l]}, 2}, 1}
		}
	,
		{{{1, 2}-> 1, {2, 1}-> 1}, {{1, 2}-> 1, {2, 1}-> -1}}
	}
, TestID-> "Flavor symmetries of \[CapitalDelta]L=2 operators"]


(* ::Section:: *)
(*Cleanup*)


ResetAll[]
