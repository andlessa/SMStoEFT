(* ::Package:: *)

Package["Matchete`"]


(* ::Title:: *)
(*Matchete`DiracAlgebra`*)


(* ::Subtitle:: *)
(*Implementation of the Dirac algebra used in Matchete.*)


(* ::Text:: *)
(*\[Gamma] matrices are all decomposed into the standard form (see e.g. https://arxiv.org/abs/physics/0703214, eq.  4.15) *)
(*DiracProduct[...,Gamma5,...] is interpreted as ...\[Gamma]_5... *)
(*DiracProduct[...,GammaM[Index[\[Alpha],Lorentz]],...] is interpreted as ...\[Gamma]_\[Alpha]...*)
(*GammaM[\[Mu]1, ..., \[Mu]n] denotes \[CapitalGamma]_n^{\[Mu]1, ..., \[Mu]n} = 1/n! (\[Gamma]_\[Mu]1 \[CenterDot] ... \[CenterDot] \[Gamma]_\[Mu]n \[PlusMinus] ... \[PlusMinus] \[Gamma]_\[Mu]n \[CenterDot] ... \[CenterDot] \[Gamma]_\[Mu]1 ), the normalized anti-symmetric sum of n gamma matrices.  *)


(* ::Chapter:: *)
(*Public:*)


(* ::Section:: *)
(*Scoping:*)


(* ::Subsubsection::Closed:: *)
(*Input variables*)


PackageExport["\[Gamma]"]
PackageExport["\[Sigma]"]


PackageExport["PL"]
PackageExport["PR"]


PackageExport["CC"]


PackageExport["Transp"]
PackageExport["CConj"]


(* ::Subsubsection::Closed:: *)
(*Exported*)


PackageExport["DiracProduct"]


PackageExport["GammaM"]
PackageExport["Gamma5"]
PackageExport["GammaCC"]
PackageExport["Proj"]


PackageExport["DiracTrace"]


PackageExport["EvaOp"]


PackageExport["GammaReduction"]
PackageExport["Fierz"]
PackageExport["RemoveLCTensor"]
PackageExport["RefineDiracProducts"]


PackageExport["Evanescent"]
PackageExport["Origin"]
PackageExport["RedundantOperator"]
PackageExport["BasisOperator"]
PackageExport["GetEvanescentTerm"]
PackageExport["ResetEvanescentOperators"]
PackageExport["ExpandEvanescentOperators"]
PackageExport["FindEvanescentOperator"]


(* ::Subsubsection::Closed:: *)
(*Internal*)


PackageScope["FermionQ"]
PackageScope["ClosedSpinChainQ"]
PackageScope["LOpenSpinChainQ"]
PackageScope["ROpenSpinChainQ"]
PackageScope["MajoranaQ"]
PackageScope["CumulativeSpin"]


PackageScope["CollectGammaMatrices"]


PackageScope["ASymGammaExpand"]
PackageScope["ProjExpand"]


PackageScope["\[Gamma]CommuteQ"]


PackageScope["FierzScore"]
PackageScope["FbasisQ"]


PackageScope["LC2Gamma5"]
PackageScope["Gamma52LC"]
PackageScope["LC2Delta"]
PackageScope["SchoutenID"]


(* ::Section:: *)
(*Usage definitions*)


(* ::Subsubsection::Closed:: *)
(*Input variables*)


\[Gamma]::usage = "\[Gamma][\[Mu]] is the shortcut for a Dirac matrix with Lorentz index \[Mu].
\[Gamma][5] is the shortcut for the Dirac matrix \!\(\*FormBox[SubscriptBox[\(\[Gamma]\), \(5\)],TraditionalForm]\).
\[Gamma][\!\(\*SubscriptBox[\(\[Mu]\), \(1\)]\),...,\!\(\*SubscriptBox[\(\[Mu]\), \(n\)]\)] is the shortcut for the anti-symmetrized product of n Dirac matrices \!\(\*SubscriptBox[\(\[Gamma]\), \([\*SubscriptBox[\(\[Mu]\), \(1,  ... , \)] \*SubscriptBox[\(\[Mu]\), \(n\)]]\)]\)";
\[Sigma]::usage = "\[Sigma][\[Mu],\[Nu]] is the shortcut for the hermitian anti-symmetric Dirac matrix combination \[Sigma][\[Mu],\[Nu]] = \!\(\*FractionBox[\(\[ImaginaryI]\), \(2\)]\) [\[Gamma][\[Mu]],\[Gamma][\[Nu]]].";


PL::usage = "PL is the shortcut for the chiral left projector \!\(\*FormBox[SubscriptBox[\(P\), \(L\)],TraditionalForm]\) in a Dirac product.";
PR::usage = "PR is the shortcut for the chiral right projector \!\(\*FormBox[SubscriptBox[\(P\), \(R\)],TraditionalForm]\) in a Dirac product.";


CC::usage = "CC is the shortcut for the charge conjugation matrix in a Dirac product."


Transp::usage = "Transp[arg] is used to denote the transposed of the object arg in the Dirac algebra.";
CConj::usage  = "CConj[field] is the charge conjugation operator and can only be used to act on fermion fields, for example CConj[\[Psi]]= \!\(\*SuperscriptBox[\(\[Psi]\), \(c\)]\)= \!\(\*TemplateBox[{\"C\"},\n\"RowDefault\"]\) \!\(\*SuperscriptBox[OverscriptBox[\(\[Psi]\), \(_\)], \(T\)]\).";


(* ::Subsubsection::Closed:: *)
(*Exported*)


DiracProduct::usage = "DiracProduct[seq] represents the (non-commutative) product of Dirac matrices, charge conjugation matrices and chiral projectors in the sequence seq.";


GammaM::usage  = "GammaM[\[Mu]] is a Dirac matrix with Lorentz index \[Mu] as written inside DiracProduct.
GammaM[\!\(\*FormBox[SubscriptBox[\(\[Mu]\), \(1\)],TraditionalForm]\), ...,\!\(\*FormBox[SubscriptBox[\(\[Mu]\), \(n\)],TraditionalForm]\)] is interpreted as  \!\(\*FormBox[SubscriptBox[SuperscriptBox[\(\[CapitalGamma]\), \(n\)], \(\(\*SubscriptBox[\(\[Mu]\), \(1\)] ... \) \*SubscriptBox[\(\[Mu]\), \(n\)]\)],TraditionalForm]\)=  \!\(\*FormBox[\(\(\*SubscriptBox[\(\[Gamma]\), \([\(\)\*SubscriptBox[\(\[Mu]\), \(1\)]\)] ... \)\\\ \*SubscriptBox[\(\[Gamma]\), \(\*SubscriptBox[\(\[Mu]\), \(n\)]\(]\)\)]\),TraditionalForm]\)  (full antisymmetrization with normalization factor 1/n!).
The associated shortcut is \[Gamma][\[Mu]] or \[Gamma][\!\(\*SubscriptBox[\(\[Mu]\), \(1\)]\),...,\!\(\*SubscriptBox[\(\[Mu]\), \(n\)]\)].";(*GammaM[LoopMom] represents p slash.*)
Gamma5::usage  = "Gamma5 is the Dirac matrix \!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\) as written inside DiracProduct.
In the NDR scheme, anti-commutativity with other gamma matrices is preserved but cyclicity of the Dirac trace is abandonned, adding a consistency requirement in the reading point choice.
The associated shortcut is \[Gamma][5].";
GammaCC::usage = "GammaCC is the charge conjugation matrix as written inside DiracProduct.
The associated shortcut is CC."
Proj::usage    = "Proj[+/-1] is the chiral right/left projectors \!\(\*SubscriptBox[\(P\), \(L/R\)]\) = \!\(\*FractionBox[StyleBox[RowBox[{\"1\", \" \", \"+\", RowBox[{\"/\", RowBox[{\"-\", \" \", SubscriptBox[\"\[Gamma]\", \"5\"]}]}]}], \"Code\"], \(2\)]\) as written inside DiracProduct.
The associated shortcut is PR/PL.";


DiracTrace::usage = "DiracTrace[expr] evaluates the Dirac trace of expr.";


EvaOp::usage                     = "EvaOp[label, (indices)] denotes the evanescent operator stored in the association $EvanescentTerms. To obtain the definition, use GetEvanescentTerm[label]."


GammaReduction::usage            = "GammaReduction[SP1 * SP2] returns the simplification of SP1 and SP2 current after a projection of the Dirac structures to the 4D basis.";
Fierz::usage                     = "Fierz[SP1 * SP2] returns the fierzing of the product of SP1 and SP2 by exchanging the second spinor in each closed spin chain."
RemoveLCTensor::usage            = "Get rid of Levi-Civita tensors either by combining with a Lorentz sigma to give a \!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\) or by expanding the product of two Levi-Civita tensor to give the fully antisymmetric product of metrics."


Evanescent::usage                = "Evanescent is an option for Fierz, GammaReduction and RemoveLCTensor. If set to True (default), it stores the evanescent operator (if generated) in an association and includes it in the result."
GetEvanescentTerm::usage         = "GetEvanescentTerm[label] outputs the informations (Operators, Origin) about the evanescent operator given as an argument.
									If no argument is given, it returns the full list of generated evanescent operators."
ResetEvanescentOperators::usage  = "ResetEvanescentOperators[] resets the association containing the definition of all evanescent operators generated."
ExpandEvanescentOperators::usage = "ExpandEvanescentOperators[expr] replaces EvaOp[label,(indices)] by the corresponding definition of the evanescent operator."
FindEvanescentOperator::usage    = "Identifies an evanescent operator already defined and replace it with an EvaOp object."


(* ::Subsubsection::Closed:: *)
(*Internal*)


FermionQ::usage         = "FermionQ[expr] returns True if a expr is a fermion or False otherwise.";
ClosedSpinChainQ::usage = "ClosedSpinChainQ[expr] returns True if a expr is a closed spin chain or False otherwise.";
LOpenSpinChainQ::usage  = "LOpenSpinChainQ[expr] returns True if a expr is a spin chain that is open from the left or False otherwise.";
ROpenSpinChainQ::usage  = "ROpenSpinChainQ[expr] returns True if a expr is a spin chain that is open from the right or False otherwise.";
MajoranaQ::usage        = "FermionQ[expr] returns True if a expr is a Majorana fermion or False otherwise.";
CumulativeSpin::usage   = "Returns the cumulative count of fermion spins along a NCM product. Counts +1 for R-open fermions and -1 for L-open.";


CollectGammaMatrices::usage = "CollectGammaMatrices[expr] collects all \[Gamma]-matrices in a DiracProduct and and moves them to the left inside of a NonCommutativeMultiply.";


ASymGammaExpand::usage = "ASymGammaExpand[DiracProduct[...]] performs the anti-symmetric expansion of the \[Gamma]-matrices inside the DiracProduct";
ProjExpand::usage      = "Expand the left/right handed projector into (1-/+\!\(\*SubscriptBox[\(\[Gamma]\), \(5\)]\))/2."


RefineDiracProducts::usage = "RefineDiracProducts[expr] simplifies all Dirac product and matches it into an expression to the basis of completely anti-symmetrized products.";


\[Gamma]CommuteQ::usage = "\[Gamma]CommuteQ[obj] checks if obj commutes with gamma matrices.";


LC2Gamma5::usage= "LC2Gamma5[expr] combines \[Epsilon]^\[Mu]\[Nu]\[Rho]\[Sigma] with gamma matrices in expr to obtain Subscript[\[Gamma], 5], using the relation Subscript[\[Gamma], 5] = -I/4! \[Epsilon]^\[Mu]\[Nu]\[Rho]\[Sigma] \[Gamma][\[Mu]]**\[Gamma][\[Nu]]**\[Gamma][\[Rho]]**\[Gamma][\[Sigma]].";
Gamma52LC::usage= "Gamma52LC[expr] decomposes Subscript[\[Gamma], 5] in expr as Subscript[\[Gamma], 5] = -I/4! \[Epsilon]^\[Mu]\[Nu]\[Rho]\[Sigma] \[Gamma][\[Mu]]**\[Gamma][\[Nu]]**\[Gamma][\[Rho]]**\[Gamma][\[Sigma]].";


RedundantOperator::usage         = "RedundantOperator is an attribute of evanescent operators. It stores the operator that generated the evanescent structure before the 4D operation."
BasisOperator::usage             = "BasisOperator is an attribute of evanescent operators. It stores the operator generated by RedundantOperator after applying the 4D operation."
Origin::usage                    = "Origin is an attribute of evanescent operators. It is either Fierz, GammaReduction or LCTensor."


(* ::Chapter:: *)
(*Private:*)


(* ::Section:: *)
(*SNDR scheme*)


(* ::Subsubsection::Closed:: *)
(*Convenient notation*)


PL= DiracProduct@ Proj@ -1;
PR= DiracProduct@ Proj@ 1;


\[Gamma]@ Sequence[\[Mu]_Symbol,\[Nu]___]:= DiracProduct@ GammaM@ Sequence[Index[\[Mu], Lorentz], Sequence@@(Index[#,Lorentz]&/@List[\[Nu]])];
\[Gamma]@ Sequence[\[Mu]: Index[_Symbol, Lorentz],\[Nu]___]:= DiracProduct@ GammaM@ Sequence[\[Mu],\[Nu]];
\[Gamma]@ 5:= DiracProduct@ Gamma5;
\[Sigma]@ Sequence[\[Mu]_Symbol,\[Nu]_Symbol]:= I DiracProduct@ GammaM@ Sequence[Index[\[Mu], Lorentz],Index[\[Nu], Lorentz]];
\[Sigma]@ Sequence[\[Mu]: Index[_Symbol, Lorentz],\[Nu]: Index[_Symbol, Lorentz]]:= I DiracProduct@ GammaM@ Sequence[\[Mu],\[Nu]];


CC = DiracProduct@ GammaCC;


(* ::Subsection:: *)
(*Properties of DiracProduct*)


(* ::Subsubsection::Closed:: *)
(*General properties*)


DiracProduct/: NonCommutativeMultiply[a___, x_DiracProduct, y_DiracProduct, b___]:=
	NonCommutativeMultiply[a, Join[x, y], b];


DiracProduct/: MomNCM[a___, x_DiracProduct, y_DiracProduct, b___]:=
	MomNCM[a, Join[x, y], b];


DiracProduct[a___, GammaM[] | Transp@ GammaM[], b___] := DiracProduct[a, b];
DiracProduct[a___, c_?NumberQ d_, b___]:= c DiracProduct[a, d, b];
DiracProduct[___,0,___]= 0;
DiracProduct[]= 1;


DiracProduct[A___,1,B___]:=DiracProduct[A,B];


(* ::Subsubsection::Closed:: *)
(*Properties of antisymmetrized \[Gamma] matrices*)


(* ::Text:: *)
(*Anti-symmetric in the indices.*)


GammaM@ OrderlessPatternSequence[\[Mu]_, \[Mu]_, ___]:= 0;


GammaM[a_, b__]/; !OrderedQ@ {a, b}:= Signature@{a, b} GammaM @@ Sort@{a, b}


(* ::Subsubsection::Closed:: *)
(*SNDR specific properties*)


(* ::Text:: *)
(*Subscript[\[Gamma], 5] : contract pairs (or with projectors) and move singles to the right.*)


DiracProduct[a___, Gamma5 | Transp@Gamma5 , b___/; FreeQ[List@ b, Gamma5| Transp@Gamma5| GammaCC| Proj| Transp@Proj], Gamma5 | Transp@Gamma5 , c___]:=
	(-1)^Length@ Flatten[List@ b/. Transp-> Identity/. GammaM-> List] * DiracProduct[a, b, c];
DiracProduct[a___, Gamma5 | Transp@Gamma5, b___/; FreeQ[List@ b, Gamma5 | Transp@Gamma5| GammaCC| Proj| Transp@Proj], p: Proj@s_ | Transp@Proj@s_ , c___]:=
	s (-1)^Length@ Flatten[List@ b/. Transp-> Identity/. GammaM-> List] * DiracProduct[a, b, p, c];
DiracProduct[a___, p: Proj@s_ | Transp@Proj@s_, b___/; FreeQ[List@ b, Gamma5 | Transp@Gamma5| GammaCC| Proj| Transp@Proj], Gamma5 | Transp@Gamma5, c___]:=
	s (-1)^Length@ Flatten[List@ b/. Transp-> Identity/. GammaM-> List] * DiracProduct[a, p, b, c];
DiracProduct[a___, g5: Gamma5 | Transp@Gamma5, b__/; FreeQ[List@ b, Gamma5 | Transp@Gamma5| GammaCC| Proj| Transp@Proj]]:=
	(-1)^Length@ Flatten[List@ b/. Transp-> Identity/. GammaM-> List] * DiracProduct[a, b, g5];


(* ::Text:: *)
(*Projectors: contract pairs and move singles to the right.*)


DiracProduct[a___, Proj@ r_ , b___/; FreeQ[List@ b, Gamma5| Transp@ Gamma5| GammaCC| Proj],  Proj@s_, c___]:=
	If[r s === (-1)^Length@ Flatten[List@ b/. Transp-> Identity/. GammaM-> List], DiracProduct[a, b, Proj@ s, c], 0];
DiracProduct[a___, Proj@ s_, b__/; FreeQ[List@ b, Gamma5| Transp@ Gamma5| GammaCC| Proj]]:=
	DiracProduct[a, b, Proj[s (-1)^Length@ Flatten[List@ b/. Transp-> Identity/. GammaM-> List] ] ];


(* ::Text:: *)
(*Subscript[\[Gamma], \[Mu]] : Contract adjacent gamma matrices with common indices.*)


DiracProduct[a___, GammaM@ \[Mu]_Index , GammaM@\[Mu]_Index, b___]:= \[ScriptD] DiracProduct[a, b];


DiracProduct[a___, Transp@GammaM@ \[Mu]_Index, Transp@GammaM@ \[Mu]_Index, b___]:= \[ScriptD] DiracProduct[a, b];


(* ::Text:: *)
(*p slash :  combine two into a propagator (using use {\[Gamma]_\[Mu], \[Gamma]_\[Nu]}= 2 g_{\[Mu]\[Nu]} if needed).*)


DiracProduct[a___, GammaM@ LoopMom, GammaM@ LoopMom, b___]:= Power[Prop[0], -1] DiracProduct[a, b];
DiracProduct[a___, gL: GammaM@ LoopMom, gn: GammaM@ \[Nu]_Index, b___, GammaM@ LoopMom, c___]:=
	2 LoopMom@ \[Nu] * DiracProduct[a, b, gL, c] - DiracProduct[a, gn, gL, b, gL, c];


DiracProduct[a___, Transp@ GammaM@ LoopMom, Transp@ GammaM@ LoopMom, b___]:= Power[Prop[0], -1] DiracProduct[a, b];
DiracProduct[a___, gL: Transp@ GammaM@ LoopMom, gn: Transp@ GammaM@ \[Nu]_Index, b___, Transp@ GammaM@ LoopMom, c___]:=
	2 LoopMom@ \[Nu] * DiracProduct[a, b, gL, c] - DiracProduct[a, gn, gL, b, gL, c];


(* ::Subsubsection::Closed:: *)
(*4D function to remove Levi-Civita tensor*)


LC2Gamma5[expr_Plus]:=LC2Gamma5/@expr;


(*Combine \[Epsilon]^\[Mu]\[Nu]\[Rho]\[Sigma] with tensor to obtain Subscript[\[Gamma], 5]*)
LC2Gamma5[exp_]:=Module[{LCind, LCt,Sigmaindpos, Sigmat, Compind, sign,res},
	If[Length[LCt=Cases[exp,_LCTensor ,Infinity]]=!=1,
		exp,
		LCind=List@@First@LCt;
		Sigmat=Cases[exp, GammaM[a___]/;(Length@{a}===2), Infinity];
		Catch[
		(Sigmaindpos=Flatten[Position[LCind,#]&/@(List@@#)];
		If[Length@Sigmaindpos===2,
			Compind=Complement[Range[4],Sigmaindpos];
			sign=Signature@Flatten@Join[Compind,Sigmaindpos];
			Compind=LCind[[Compind]];
			Throw[-2I* sign* exp/.{_LCTensor->1, #->Sequence[GammaM@@Compind, Gamma5] }];
			]
		)&/@Sigmat;
		Throw[exp]]
		]
	];
(*Expand Subscript[\[Gamma], 5]*)
Gamma52LC[exp_]:=exp/.DiracProduct[dp___,Gamma5]:> -I/4! LCTensor[\[Alpha],\[Beta],\[Delta],\[Eta]]DiracProduct[dp]**\[Gamma][\[Alpha]]**\[Gamma][\[Beta]]**\[Gamma][\[Delta]]**\[Gamma][\[Eta]] //RelabelIndices ;


(*Expand product of two Levi-Civita tensors into antisymmetric product of metric*)
LC2Delta[exp_]:=exp/.{LCTensor[a:Sequence[_Index..]] * LCTensor[b:Sequence[_Index..]] :> - Det[Outer[Metric,List@a,List@b]]};


(*Perform cyclic permutations of indices on the product of a Levi-Civita tensor with a metric*)
SchoutenID[exp_]:=Module[{tempind, Tind, LCt, LCind, LMind, newLind, out},
	If[Length[LCt=Cases[exp,_LCTensor ,Infinity]]=!=1,
		exp,
		LCt=First@LCt;
		LCind=List@@LCt;
		LMind=Cases[exp,Index[_,Lorentz],Infinity];
		LMind=Part[Select[Tally@LMind,Part[#,2]===2&],All,1];
		LMind=Complement[LMind, LCind];
		If[LMind==={},
			exp,
			(*If several indices, another than First might be prefered*)
			LMind=First@LMind;
			out= ReleaseHold[exp/.LMind->Index[HoldForm@Unique[],tempind]];
			Tind=Cases[out, Index[_,tempind],Infinity];
			newLind=Index[Unique[d], Lorentz];
			out= out/.Tind[[1]]->LMind/.Tind[[2]]->newLind;
			out= - Metric[LCind[[1]], LMind] (out /.{LCt->LCTensor[LCind[[2]],LCind[[3]],LCind[[4]],newLind]})
				 - Metric[LCind[[2]], LMind] (out /.{LCt->LCTensor[LCind[[3]],LCind[[4]],newLind,LCind[[1]]]})
				 - Metric[LCind[[3]], LMind] (out /.{LCt->LCTensor[LCind[[4]],newLind,LCind[[1]],LCind[[2]]]})
				 - Metric[LCind[[4]], LMind] (out /.{LCt->LCTensor[newLind, LCind[[1]],LCind[[2]],LCind[[3]]]});
			out //RelabelIndices//Contract
			]
		]
	]


(* ::Subsection:: *)
(*Dirac trace*)


(* ::Subsubsection::Closed:: *)
(*Trace of an expression*)


(* ::Text:: *)
(*Move the DiracTrace from acting on any expression to act on the DiracProduct inside the expression*)


Options@ DiracTrace= {Dimensions->\[ScriptD]};


DiracTrace[expr_, opt:OptionsPattern[]]:= Module[
		{allterms= TermsToList@ expr, term},
	Sum[
		Switch[Count[term, DiracProduct, Infinity, Heads-> True],
			0, 4 term,
			(*Prevent the result of the Diractrace from being inserted inside NonCommutativeMultiply,
				which is an expensive operation.*)
			1, term/.{NonCommutativeMultiply@ x_DiracProduct:> DiracTraceProduct@ x,
				x_DiracProduct:> DiracTraceProduct@ x},
			_, Message[DiracTrace::canteval]; term
		],
		{term, allterms}
	]/.\[ScriptD]-> OptionValue@ Dimensions
];


(* ::Text:: *)
(*Error Messages*)


DiracTrace::canteval= "Dirac trace encountered term with multiple Dirac products. No trace is applied.";


(* ::Subsubsection::Closed:: *)
(*Split of anti-symmetrized \[Gamma] matrices *)


(* ::Text:: *)
(*Anti-symmetric expansion of the \[Gamma]-matrices inside the DiracProduct*)


ASymGammaExpand@ DiracProduct[a___, GammaM[\[Mu]___]/; Length@{\[Mu]}>1, opt___]:=Module[{permutations= Permutations@{\[Mu]}},
	Signature@ {\[Mu]}/Length @permutations *
		Plus@@((Signature@ # * ASymGammaExpand@ DiracProduct[a, Sequence@@ (GammaM/@ #), opt]&)/@ permutations)//
	LagrangianExpand];
ASymGammaExpand@ x_= x;


(* ::Subsubsection::Closed:: *)
(*Dirac trace*)


(* ::Text:: *)
(*Expand projections inside DiracTraces*)


DiracTraceProduct@ 1= 4;


DiracTraceProduct[DiracProduct[a___, Proj@ s_]]:=
	DiracTraceProduct@ DiracProduct@ a/2+ s DiracTraceProduct@ DiracProduct[a, Gamma5]/2 ;


(* ::Text:: *)
(*Caching of traces*)


DiracTraceProduct@ prod:DiracProduct[___, _GammaM| Gamma5]:= Module[
		{len=Total[Length/@ List@@ prod]},
	If[OddQ@ len, Return@ 0];

	(*Cache expressions with less than 7 open indices*)
	If[2* Length@ DeleteDuplicates@ Cases[prod, _Index, {2}] - len < 7,
		Return@ With[{xPats= prod/. Index[a_, Lorentz]:> Index[Pattern[#, Blank[]]&@ a, Lorentz]},
			DiracTraceProduct@ xPats= ContractMetric@ DiracTraceEvaluate@ prod
		];
	];

	DiracTraceEvaluate@ prod
];


(* ::Text:: *)
(*Traces w/o gamma5*)


DiracTraceEvaluate@ prod:DiracProduct[_GammaM...]:= Module[
		{indPos, pairCombs},
	indPos= Flatten[Table[{m, n}, {m, Length@ prod}, {n, Length@ prod[[m]]}], 1];
	(*If[OddQ@ Length@ indPos, Return@ 0;];*)

	(*No metric with indices from the same GammaM: these indices are anti-symmetric*)
	pairCombs= NonOverlappingPairs@ indPos;
	If[!FreeQ[prod, GammaM[_, __]],
		pairCombs= DeleteCases[pairCombs,
			List@ OrderlessPatternSequence[{{a_, _}, {a_, _}}, ___]];
	];

	Sum[
		4* Signature[Join@@ pairs]* Product[Metric@@ Extract[p]@ prod, {p, pairs}]
	, {pairs, pairCombs}]
]


(* ::Text:: *)
(*Traces w/ gamma5*)
(*Inspired by https://inspirehep.net/literature/318268, we substitute the Gamma5 for Levi-Civita contracted with \[CapitalGamma]_4^{mu1,... mu4}, then refine the product of all remaining gammas. The Clifford algebra basis of \[CapitalGamma]_n is orthogonal in the trace. *)


DiracTraceEvaluate@ prod:DiracProduct[_GammaM..., Gamma5]:= Module[{aSym, indPos, len, pairCombs},
	indPos= Flatten[Table[{m, n}, {m, Length@ prod- 1}, {n, Length@ prod[[m]]}], 1];
	len= Length@ indPos;
	Which[(*OddQ@ len ||*) len < 4,
		Return@ 0;
	,len === 4,
		Return[-4I * LCTensor@@ Extract[indPos]@ prod];
	];

	Sum[
		aSym= Complement[indPos, set];
		(*No metric with indices from the same GammaM: these indices are anti-symmetric*)
		pairCombs= DeleteCases[NonOverlappingPairs@ set,
			List@ OrderlessPatternSequence[{{a_, _}, {a_, _}}, ___]];
		Sum[
			-4I* Signature@ Join[Sequence@@ pairs, aSym]* Product[Metric@@ Extract[p]@ prod, {p, pairs}]*
			LCTensor@@ Extract[aSym]@ prod
		, {pairs, pairCombs}]
	, {set, Subsets[indPos, {len - 4}]}]
]


(* ::Subsection:: *)
(*Expand to basis*)


(* ::Subsubsection::Closed:: *)
(*General Properties*)


RefineDiracProducts@ expr_:= expr/. x_DiracProduct:> RefineDiracProducts@ x// Expand;


(* ::Text:: *)
(*Move contracted \[Gamma]-matrices together*)


RefineDiracProducts[DiracProduct[a___, gm: GammaM@ \[Mu]_Index, gn: GammaM@\[Nu]_Index, b___, GammaM@ \[Mu]_Index, c___]/; FreeQ[List[b, c], \[Nu]]]:=
	ContractMetric@ RefineDiracProducts[2 Metric[\[Mu], \[Nu]] DiracProduct[a, b, gm, c]- DiracProduct[a, gn, gm, b, gm, c]];


RefineDiracProducts[DiracProduct[a___, gm: Transp@GammaM@ \[Mu]_Index, gn: Transp@GammaM@\[Nu]_Index, b___, Transp@GammaM@ \[Mu]_Index, c___]; FreeQ[List[b, c], \[Nu]]]:=
	ContractMetric@RefineDiracProducts[2 Metric[\[Mu], \[Nu]] DiracProduct[a, b, gm, c]- DiracProduct[a, gn, gm, b, gm, c]];


(* ::Subsubsection::Closed:: *)
(*SNDR specific properties*)


(* ::Text:: *)
(*Anti-symmetrize all the DiracProducts inside DiracTraces. Performance for repeated indices may be improvable with the techniques from [1905.00429, Sec 2.9.2].*)


RefineDiracProducts@ d:DiracProduct[_]:= d;


(* ::Text:: *)
(*Charge conjugation matrices, chiral projectors, and Subscript[\[Gamma], 5] are left  alone  *)


RefineDiracProducts@ DiracProduct[GammaCC, x__]:=
	DiracProduct@ GammaCC** RefineDiracProducts@ DiracProduct@x;


RefineDiracProducts@ DiracProduct[x__, chiral: (Gamma5| _Proj)]:=
	RefineDiracProducts@ DiracProduct@ x ** DiracProduct@ chiral;


(* ::Text:: *)
(*Expansion of Dirac product unto basis of anti-symmetric gamma matrices with the techniques of [1905.00429, Sec 2.9.2].*)


RefineDiracProducts[prod:DiracProduct[_GammaM, _GammaM..]]:= Module[{aSym, indPos, pairCombs},
	(* indPos is ordered by construction: its signature is +1 *)
	indPos= Flatten[Table[{m, n}, {m, Length@ prod}, {n, Length@ prod[[m]]}], 1];
	Sum[
		aSym= Complement[indPos, set];
		(*No metric with indices from the same GammaM: these indices are anti-symmetric*)
		pairCombs= DeleteCases[NonOverlappingPairs@ set,
			List@ OrderlessPatternSequence[{{a_, _}, {a_, _}}, ___]];
		Sum[
			Signature@ Join[Sequence@@ pairs, aSym]* Product[Metric@@ Extract[p]@ prod, {p, pairs}]*
			DiracProduct[GammaM@@ Extract[aSym]@ prod]
		, {pairs, pairCombs}]
	, {k, 0, Length@ indPos, 2}, {set, Subsets[indPos, {k}]}]
];


(* ::Text:: *)
(*Dealing with transposed matrices*)


RefineDiracProducts::transp= "Some, but not all, matrices in `1` was transp. Could not match to basis";
RefineDiracProducts@ x:DiracProduct[_Transp, ___]:= Module[{},
	If[!MatchQ[x, DiracProduct[_Transp..]],
		Message[RefineDiracProducts::transp, x];
		Return@ x;
	];

	RefineDiracProducts@ Reverse[x][[;;, 1]]/. d_DiracProduct:> Transp@ d
];


(* ::Subsection:: *)
(*Collecting and manipulating the gamma matrices*)


(* ::Subsubsection::Closed:: *)
(*\[Gamma]CommuteQ*)


(* ::Text:: *)
(*Check if something commutes with gamma matrices: *)


\[Gamma]CommuteQ[Xop| DiracProduct| MomNCM]= False;
\[Gamma]CommuteQ@ Field[_, Fermion, ___]= False;
\[Gamma]CommuteQ@ TransposeThisSpinChain= False;
\[Gamma]CommuteQ@x_NonCommutativeMultiply:=Nor[LOpenSpinChainQ@x, ROpenSpinChainQ@x];
\[Gamma]CommuteQ[f_?\[Gamma]CommuteQ[x___]]:=And@@ \[Gamma]CommuteQ/@ {x};
\[Gamma]CommuteQ[f:Except[NonCommutativeMultiply][x___]]:=  False;
\[Gamma]CommuteQ@ Alternatives[Pattern, _Blank, _BlankSequence, _BlankNullSequence, _Except] = False;
\[Gamma]CommuteQ[_]:= True;


(* ::Subsubsection::Closed:: *)
(*Collect gamma matrices*)


(* ::Text:: *)
(*Collect all gamma matrices in Dirac products on the left of the non-commutative multiply:*)


CollectGammaMatrices@expr_:=expr/.{
		x_DiracProduct :> Hold@ x
	}//.{
		MomNCM[a___, x_?\[Gamma]CommuteQ, Hold@ g_DiracProduct, b___]:>
		MomNCM[a, Hold@g, x, b]
	}//ReleaseHold;


(* ::Section:: *)
(*Operations*)


(* ::Subsection:: *)
(*Fermion test functions*)


(* ::Subsubsection::Closed:: *)
(*Type of fermions*)


FermionL= (Bar|Transp)@Field[_,Fermion,___];
FermionR= Field[_,Fermion,___] | Transp@Bar@Field[_,Fermion,___];


(* ::Subsubsection::Closed:: *)
(*FermionQ*)


FermionQ[FermionL | FermionR]:=True;
FermionQ[expr_]:=False;


(* ::Subsubsection::Closed:: *)
(*L/R OpenSpinChainQ*)


LOpenSpinChainQ@x_NonCommutativeMultiply:=LOpenSpinChainQ@ First@x
LOpenSpinChainQ[FermionL]:=False
LOpenSpinChainQ@x_:=!\[Gamma]CommuteQ@x


ROpenSpinChainQ@x_NonCommutativeMultiply:=ROpenSpinChainQ@ Last@x
ROpenSpinChainQ[FermionR]:=False
ROpenSpinChainQ@x_:=!\[Gamma]CommuteQ@x


(* ::Subsubsection::Closed:: *)
(*ClosedSpinChainQ*)


ClosedSpinChainQ@ x_NonCommutativeMultiply:= !FreeQ[x, Fermion
	] && Nor[
		LOpenSpinChainQ@ x,
		ROpenSpinChainQ@ x
	] && Last@ CumulativeSpin@ x === 0;
ClosedSpinChainQ@ _:= False;


(* ::Subsubsection::Closed:: *)
(*MajoranaQ *)


MajoranaQ@x_:=!FreeQ[x, Field[label_,Fermion,___]/;$FieldAssociation[label][SelfConjugate]]


(* ::Subsubsection::Closed:: *)
(*CumulativeSpin count*)


(* ::Text:: *)
(*Returns the cumulative count of fermion spins along an NCM product. Counts +1 for R-open fermions and -1 for L-open.*)


CumulativeSpin@ op:(_NonCommutativeMultiply|_MomNCM):= Module[{temp},
	temp= FermionCount/@ (List@@ op);
	FoldList[Plus, temp]
];


FermionCount@ FermionL= 1;
FermionCount@ FermionR= -1;
FermionCount@ x:(_NonCommutativeMultiply| _MomNCM| _Times):=
	Plus@@ FermionCount/@ (List@@ x);
FermionCount@ x:_Plus:= FermionCount@ First@ x;
FermionCount@_ = 0;


(* ::Subsection:: *)
(*Dirac structures*)


(* ::Subsubsection::Closed:: *)
(*GammaCC*)


DiracProduct[a___, GammaCC, GammaCC, b___]:= - DiracProduct[a, b];
DiracProduct[a___, s: _Proj | Gamma5, GammaCC, b___]:= DiracProduct[a, GammaCC, Transp@ s, b];
DiracProduct[a___, Transp@s: _Proj | Gamma5, GammaCC, b___]:= DiracProduct[a, GammaCC, s, b];
DiracProduct[a___, g_GammaM, GammaCC, b___]:= Power[-1, Ceiling[Length@ g/2]] DiracProduct[a, GammaCC, Transp@ g, b];
DiracProduct[a___, Transp@g_GammaM, GammaCC, b___]:= Power[-1, Ceiling[Length@ g/2]] DiracProduct[a, GammaCC, g, b];


(* ::Subsubsection::Closed:: *)
(*Transp*)


(* ::Text:: *)
(*Transp should work on closed NCM lines for convenience, although they are commutative*)


Transp@ expr_NonCommutativeMultiply:= (-1)^Floor[Count[expr, _?FermionQ]/2] Transp/@ Reverse@ expr;


Transp@ expr_?CommutativeQ:= expr/. ncm_NonCommutativeMultiply:> Transp@ ncm;


Transp[expr:(_Plus|_Times)]:= Transp/@ expr;


Transp@ Transp@ x_:= x;
Transp@ GammaCC= -GammaCC;
Transp[]:= 1;
Transp@ x_DiracProduct:= Transp/@ x/. y_DiracProduct:> Reverse@ y; (*Transp and Reverse can cuase multiplication with -1; hence, replacement rather than function call.*)


(* ::Text:: *)
(*Transp with multiple arguments (can occur in NCM rules for automatically transposing spinor lines).*)


Transp[x_, y__]:= Reverse[NonCommutativeMultiply[x, y]/. d_DiracProduct:> Transp@ d];


(* ::Subsubsection::Closed:: *)
(*CConj*)


(* ::Text:: *)
(*Properties of charge conjugation working on fermion fields *)


CConj::notfermion= "CConj is only supposed to act on a fermion field."


CConj@f:Field[label_,Fermion,_,_]/;$FieldAssociation[label][SelfConjugate]:= f;
CConj@f:Bar[Field[label_,Fermion,_,_]]/;$FieldAssociation[label][SelfConjugate]:= f;
CConj@f:Bar[Field[_,Fermion,_,_]]:= Transp@Bar@f ** DiracProduct@GammaCC;
CConj@f:Field[_,Fermion,_,_]:= DiracProduct@ GammaCC ** Transp@Bar@f;
CConj[DiracProduct[Proj[s_]]**(f:Field[_,Fermion,_,_])]:= DiracProduct[Proj[-s]]**CConj[f];
CConj[(f:Bar[Field[_,Fermion,_,_]])**DiracProduct[Proj[s_]]]:= CConj[f]**DiracProduct[Proj[-s]];
CConj@_:=(Message[CConj::notfermion]; Abort[]);


(* ::Subsection:: *)
(*Evanescent operators*)


(* ::Subsubsection::Closed:: *)
(*Handle functions*)


ResetEvanescentOperators[]:= Block[{},
	$EvanescentTerms= <||>;
	(* Set a counter for the naming of the operators *)
	EvaCounter=1;
];
ResetEvanescentOperators[];


ExpandEvanescentOperators[expr_]:= expr /.(EvaOp[x_,ind_]:>(($EvanescentTerms[x][RedundantOperator]-$EvanescentTerms[x][BasisOperator])/.AssociationThread[FindOpenIndices[$EvanescentTerms[x][RedundantOperator]],ind]))/.EvaOp[x_]:>(($EvanescentTerms[x][RedundantOperator]-$EvanescentTerms[x][BasisOperator]));
GetEvanescentTerm[EvLabel___]:= $EvanescentTerms[EvLabel];
GetEvanescentTerm[op_EvaOp]:= $EvanescentTerms[op[[1]]];
GetEvanescentTerm[]:= $EvanescentTerms;


FindEvanescentOperator[operator_]:= Module[{inputop,openind,indtemp, evaop, evaind, coeff=0,label=0, placeholder4coeff,selectoneop, evacoeff, opcoeff},
	inputop=MatchOperatorPatterns[CollectOperators@Contract@operator];
	coeff=(Catch[
		evaop=MatchOperatorPatterns[ExpandEvanescentOperators[EvaOp[#]]];
		If[MatchQ[Cases[evaop,_AtomicOp,All], {OrderlessPatternSequence@@(Cases[inputop,_AtomicOp,All])}],
			label=#;
			selectoneop=First@Cases[MatchOperatorPatterns[$EvanescentTerms[#][RedundantOperator]],_AtomicOp,All];
			opcoeff= Coefficient[inputop/.selectoneop->placeholder4coeff,placeholder4coeff];
			evacoeff= Coefficient[evaop/.selectoneop->placeholder4coeff,placeholder4coeff];
			openind=FindOpenIndices@RelabelIndices@AtomicToNormalForm@selectoneop;
			Throw[opcoeff/evacoeff],
			Throw[Nothing]]
		]&/@ (Keys@$EvanescentTerms));
	If[label=!=0, First@coeff*EvaOp[label, openind], 0]
]


(* ::Text:: *)
(*Only consider tree-level evanescent operators (otherwise it's a two loop contribution)*)


(*EvaOp/:(hbar*EvaOp[___]):=0;
EvaOp/:(hbar*Bar @ EvaOp[___]):=0;*)


(* ::Subsubsection::Closed:: *)
(*Helper functions*)


ProjExpand[exp_]:=exp/. DiracProduct[b___,Proj[s_]]:> (DiracProduct[b] + s  DiracProduct[b,Gamma5])/2 //Expand;


(* ::Subsubsection::Closed:: *)
(*Define evanescent operators*)


DefineEvanescentOperator[inioperator_,finoperator_(*,order_*),origin_]:=Module[{evaOperator, label(*,looporder*), result},
	evaOperator= inioperator-finoperator(*//ContractCGs//RefineDiracProducts//Contract*)//RelabelIndices;
	If[(evaOperator//RefineDiracProducts//ContractCGs//Contract//ProjExpand)===0 ,
		0,
		(*check if evaOperator already exists*)
		result=FindEvanescentOperator[evaOperator];
		If[result=!=0,
			result,
			(*looporder= order; *)
			label=EvaCounter;
			EvaCounter+=1;
			AppendTo[$EvanescentTerms, label-> <|RedundantOperator-> CollectOperators@Contract@RelabelIndices@inioperator , BasisOperator-> CollectOperators@Contract@RelabelIndices@finoperator, Origin-> origin (*, LoopOrder-> looporder*) |>];
			EvaOp[label,FindOpenIndices[inioperator]]
		   ]
	]
]


(* ::Subsection:: *)
(*Fierzing*)


(* ::Subsubsection::Closed:: *)
(*Error messages*)


Fierz::notFierzable= "The Fierz function can only be used on the product of two closed spin chains with head NonCommutativeMultiply containing Dirac structures with head DiracProduct (or nothing for scalar currents). ";
Fierz::Order = "Fierz function only support Fierz Order {1,3,4,2} or {1,4,3,2}."


(* ::Subsubsection::Closed:: *)
(*Property*)


Options[Fierz]={Order->{1,4,3,2},Evanescent-> True};
Options[Fierz4D]={Order->{1,4,3,2}};


(* ::Subsubsection::Closed:: *)
(*Helper functions*)


FieldLabel[f:_Field|Bar@_Field|Transp@_Field|Transp@Bar@_Field]:=First@Cases[{f}, Field[l_,_, _,_]:>l,Infinity];
FieldIndices[f:_Field|Bar@_Field|Transp@_Field|Transp@Bar@_Field]:=First@Cases[{f}, Field[_,_,ind_,_]:>ind,Infinity];


(* ::Subsubsection::Closed:: *)
(*4D Fierz function*)


Fierz4D[(SP1:NonCommutativeMultiply[field1_,G12___,field2_]),(SP2:NonCommutativeMultiply[field3_,G34___,field4_]), opt:OptionsPattern[]]:=
Fierz4D[SP1,SP2, opt]=
Module[
{Gbasisup, Gbasisdown, ind1, ind2, Gcoeff, i,j, C1=1, C2=1,
G1=G12*1, G2=G34*1, P1=1, P2=1, P3=1, P4=1, f1=field1, f2=field2, f3=field3, f4=field4, sgnO=1},

	ind1={Unique[],Unique[],Unique[],Unique[]};
	ind2={Unique[],Unique[],Unique[],Unique[]};

	Gbasisup[a_,b_,c_,d_]:={PL,PR,PR**\[Gamma][a],PL**\[Gamma][b],\[Sigma][c,d]/2}/.NonCommutativeMultiply[x_]:>x;
	Gbasisdown[a_,b_,c_,d_]:={PL,PR,PL**\[Gamma][a],PR**\[Gamma][b],\[Sigma][c,d]/2}/.NonCommutativeMultiply[x_]:>x;

	If[OptionValue@Order === {1,2,3,4}, Return[SP1*SP2]];
	If[!MemberQ[{{1,3,4,2},{1,4,3,2},{1,2,3,4}},OptionValue@Order], Message[Fierz::Order];Abort[]];
	If[OptionValue@Order==={1,3,4,2},
			f3=Transp@field4;
			f4=Transp@field3;
			sgnO=-1;
			If[G2=!=1,
				G2=Transp@G2;
				If[First@G2===-1, G2=-G2; sgnO=+1;]];
	];

	If[!ClosedSpinChainQ@SP1 || !ClosedSpinChainQ@SP2, Message[Fierz::notFierzable]; Abort[]];
	If[(Head[G1]=!= DiracProduct ||  Head[G2]=!= DiracProduct ) && (G1=!=1 ||G2=!=1  ), Message[Fierz::notFierzable]; Abort[]];

	If[Head[f1]===Transp, G1=(-CC)**G1; f1=f1**CC];
	If[Head[f2]===Transp, G1=G1**(-CC); f2=CC**f2];

	If[Head[f4]===Transp, G2=G2**(-CC); f4=CC**f4];
	If[Head[f3]===Transp, G2=(-CC)**G2; f3=f3**CC];

	If[!FreeQ[G1, _Proj],
		P1=DiracProduct@First@Cases[Transp@G1,_Proj,Infinity];
		P2=DiracProduct@First@Cases[G1,_Proj,Infinity];
	];

	If[!FreeQ[G2, _Proj],
		P3=DiracProduct@First@Cases[Transp@G2,_Proj,Infinity];
		P4=DiracProduct@First@Cases[G2,_Proj,Infinity];
	];

	G1 = G1 /._Proj->1;
	G2 = G2 /._Proj->1;

	If[!FreeQ[G1, x_GammaM/;(Length[x]===2)],
		sgnO*=-I;
		G1*=I;
	];
	If[!FreeQ[G2, x_GammaM/;(Length[x]===2)],
		sgnO*=-I;
		G2*=I;
	];

	Gcoeff=IdentityMatrix[5];
	For[j=1,j<6,++j,
		For[i=1,i<6,++i,
			Gcoeff[[i,j]]= -(1/4) DiracTrace[G1**(Gbasisdown@@ind1)[[i]]**G2**(Gbasisdown@@ind2)[[j]],Dimensions->4] //Contract;
		]
	];

	sgnO*(Sum[
			Gcoeff[[i,j]]
				* (f1**P1**(Gbasisup@@ind2)[[j]]**P4**f4) * (f3**P3**(Gbasisup@@ind1)[[i]]**P2**f2)
		,{i,1,5},{j,1,5}] //Expand//Contract //RelabelIndices //LC2Gamma5) /.GammaM[a_,b_]/;(!OrderedQ[{a,b}]):> -GammaM[b,a]
]


(* ::Subsubsection::Closed:: *)
(*Fierz score*)


FbasisQ[SP1_,SP2_]:=FreeQ[OperatorToNormalForm@Operator[SP1,SP2]//.Join[{_Field->1, GammaCC->1,Proj[1]->1,Proj[-1]->1},Thread[NonCommutativeMultiply/@{DiracProduct@GammaM[x_],DiracProduct@Transp@GammaM[x_],DiracProduct@GammaM[x_, y_],
DiracProduct@Transp@GammaM[x_, y_]}->1]],NonCommutativeMultiply];


FierzScore[op_Operator]:=FierzScore[OperatorToNormalForm@op];


FierzScore[(SP1 : NonCommutativeMultiply[field1_, G12___, field2_] ),(SP2 : NonCommutativeMultiply[field3_, G34___, field4_]),rest___] :=
 Module[
  {result = 0, fields = {field1, field2, field3, field4}, order = OptionValue@Order,
   GaugeGroups, gind, pos, posmax, epsrep, G1=G12*1,G2=G34*1},
      (*Replace SU(2) epsilon by delta for counting*)
      epsrep=Cases[List@rest, CG[eps[_] | Bar[eps[_]] ,ind_/;(Length[ind]===2)]:>ind, Infinity]/.Bar[x_]:>x;
      fields=fields/.((#[[1]]->#[[2]])& /@epsrep);
  	(*Default rules: same fields, higher groups together*)
  	result = Plus[0,
    	    (*same labels favored*)
    		If[FieldLabel[fields[[1]]] === FieldLabel[fields[[2]]], +1 , -1],
    		If[FieldLabel[fields[[3]]] === FieldLabel[fields[[4]]], +1 , -1],
    		(*many transposed fields penalized*)
    		If[Xor[Head[fields[[1]]] === Transp, Head[fields[[2]]] === Transp] && Xor[Head[fields[[3]]] === Transp, Head[fields[[4]]] === Transp] , -6 , +.5],
    		(*tensor currents  penalized*)
    		If[! FreeQ[G1, GammaM[a___] /; (Length[List@a] > 1)] && ! FreeQ[G2, GammaM[b___] /; (Length[List@b] > 1)], -7, 0],
    		(*scalar currents  preferred over vector currents*)
    		If[FreeQ[G1, _GammaM] && FreeQ[G2, _GammaM], 0, -0.06],
    		(*Dirac structures not part of the basis penalized*)
    		If[FbasisQ[SP1, SP2], 0, -10],
    		(*more projectors penalized*)
    		Count[SP1*SP2,_Proj,All]*(-0.04),
    		(*contracted indices in bilinears encouraged*)
    		Total[If[MemberQ[FieldIndices@fields[[2]],#],+0.01*(GroupDimension@ GetGaugeGroups[GroupFromRep@#[[2]]][Group]),0]&/@(FieldIndices@fields[[1]])],
    		Total[If[MemberQ[FieldIndices@fields[[4]],#],+0.01*(GroupDimension@ GetGaugeGroups[GroupFromRep@#[[2]]][Group]),0]&/@(FieldIndices@fields[[3]])]
    		];

  	(*same group in only two fields favored, starting from biggest group*)
  	GaugeGroups = Reverse@SortBy[Keys@GetGaugeGroups[], GroupDimension@* GetGaugeGroups[#][Group] &];
  	gind = Reverse[SortBy[Select[FieldIndices@#, (MemberQ[GaugeGroups, GroupFromRep@ #[[2]]] &)], GroupDimension@* GetGaugeGroups[#[[2]]][Group] & ]] & /@ fields;
      pos = Position[gind /. Index[_, g_] :> GroupFromRep@g, #] & /@ GaugeGroups /. {} -> Nothing;
    	If[pos =!= {} && pos =!= Nothing,
    		posmax = First@Transpose@First@pos;
    		If[Length[posmax]=!=2 && Length@pos>1,posmax=First@Transpose[pos[[2]]]];
     		result += If[MemberQ[{{1, 2}, {3, 4}}, posmax], +1 , 0];
     	];
    	result
    ]


FierzScore[expr_]:=(*FierzScore[expr]=*)(* cached identites can worsen performance significantly if expr is very complicated *)
Module[{NCMs,SP1,SP2, rest},
		NCMs=Cases[RemovePower@ expr, _NonCommutativeMultiply,All];
		If[Length@NCMs === 2,
			{SP1,SP2}=NCMs;
			rest=expr/._NonCommutativeMultiply->1;
			FierzScore[SP1,SP2,rest]
			,
			0
		]
	]


(* ::Subsubsection::Closed:: *)
(*Fierz function*)


Fierz[arg_, OptionsPattern[]]:=
Module[
{rest, NCMs, SP1, SP2, result, groupStruct, fieldsinop, coeff, evaOperator, iniOperator, expr=RelabelIndices[arg,Unique->True]},
	NCMs=Cases[RemovePower@ expr, _NonCommutativeMultiply,All];
	If[Length@NCMs =!= 2, Print[NCMs//NiceForm]; Message::notFierzable; Abort[]];

	{SP1,SP2}=NCMs;
	rest=expr/._NonCommutativeMultiply->1;

	iniOperator=rest *SP1*SP2//RefineDiracProducts//Contract//RelabelIndices;

	If[Head@iniOperator===Plus, Fierz[#]&/@iniOperator,
	result=Fierz4D[SP1,SP2,Order->OptionValue@Order];

	rest=Flatten@{rest/.Times->List};
	groupStruct=Times@@Cases[rest,_Delta|_CG];
	fieldsinop=Times@@Cases[rest,_Field|_FieldStrength|Bar[_Field]];
	rest=Times@@rest;
	
	evaOperator=If[OptionValue@Evanescent,
			DefineEvanescentOperator[groupStruct*fieldsinop*(SP1*SP2),groupStruct*fieldsinop*result,(*Exponent[rest*1,hbar]+1,*)Fierz]*rest/groupStruct/fieldsinop,
			0];
	evaOperator+result*rest//ReleaseHold//RelabelIndices//ContractCGs//Contract
	]
]


(* ::Subsection:: *)
(*Gamma Products Reduction*)


(* ::Subsubsection::Closed:: *)
(*4D GammaReduction function*)


(* ::Text:: *)
(*Projects two contracted spinor chains to the physical basis with gamma reduction. *)


Basis4D[]:=Module[{\[Mu],\[Nu]},
	{{PL,PL},{PR,PR},{PL,PR},{PR,PL},
	{\[Gamma]@\[Mu]**PL,\[Gamma]@\[Mu]**PL},{\[Gamma]@\[Mu]**PR,\[Gamma]@\[Mu]**PR},{\[Gamma]@\[Mu]**PL,\[Gamma]@\[Mu]**PR},{\[Gamma]@\[Mu]**PR,\[Gamma]@\[Mu]**PL},
	{\[Sigma][\[Mu],\[Nu]]**PL,\[Sigma][\[Mu],\[Nu]]**PL},{\[Sigma][\[Mu],\[Nu]]**PR,\[Sigma][\[Mu],\[Nu]]**PR}}
	]


InverseBasisTrace[]:=InverseBasisTrace[]=Simplify@Inverse@Table[
		bi[[1]]**bj[[1]]**bi[[2]]**bj[[2]]//DiracTrace//ContractMetric
		,{bi,Basis4D[]}, {bj,Basis4D[]}];


GammaReduction4D[(SP1:NonCommutativeMultiply[field1_,G12___,field2_]),(SP2:NonCommutativeMultiply[field3_,G34___,field4_])]:=
GammaReduction4D[SP1,SP2]=
Module[{Bcoeff,basis,f1=field1,f2=field2,f3=field3,f4=field4, G1= G12*1,G2= G34*1,invbastr},
	
	basis=Basis4D[];
	
	(*Check if in the basis*)
	If[MemberQ[basis,{G1,G2}],Return[SP1 * SP2]];
	If[Count[G1*G2,_GammaM,Infinity]<3 && Count[G1,_Index,Infinity]<3 && Count[G2,_Index,Infinity]<3 , Return[SP1 * SP2]];
	
	invbastr=InverseBasisTrace[];
	
	If[Head[f1]===Transp, G1=(-CC)**G1; f1=f1**CC];
	If[Head[f2]===Transp, G1=G1**(-CC); f2=CC**f2];

	If[Head[f4]===Transp, G2=G2**(-CC); f4=CC**f4];
	If[Head[f3]===Transp, G2=(-CC)**G2; f3=f3**CC];

	Bcoeff=invbastr . Table[
		DiracTrace[bj[[1]]**G1**bj[[2]]**G2]//ContractMetric
	,{bj,basis}]//Simplify;

	Sum[Bcoeff[[i]]*(f1**basis[[i,1]]**f2) * (f3**basis[[i,2]]**f4) , {i,1,Length@Bcoeff}]
]


(* ::Subsubsection::Closed:: *)
(*GammaReduction function*)


(* ::Text:: *)
(*Applies gamma reduction identities to any operator with exactly to spinor-chains*)


Options[GammaReduction]= {FourDimensional-> False, Evanescent-> True};


GammaReduction[expr_Plus, opt___]:= GammaReduction[#,opt]&/@expr;


GammaReduction[expr___:Except[Plus], opt:OptionsPattern[]]:=
Module[{coexpr=CollectOperators@expr, rest, NCMs, SP1, SP2, result, groupStruct, evaOperator, iniOperator},
	
	If[Head@coexpr === Plus, Return@ GammaReduction[coexpr, opt]];

	NCMs=Cases[RemovePower@ expr, _NonCommutativeMultiply, All];
	If[Length@ NCMs =!= 2, Return@ expr; ];
	
	{SP1, SP2}= NCMs;
	rest= expr/._NonCommutativeMultiply->1;
	
	result=GammaReduction4D[SP1,SP2];
	If[OptionValue@ FourDimensional,
		result= EpsExpand@ result;
	];
	
	evaOperator= If[OptionValue@Evanescent,
			groupStruct=Times@@Cases[{rest},_Delta|_CG,Infinity];
			DefineEvanescentOperator[groupStruct* SP1* SP2, groupStruct* result,
				(*Exponent[rest*1,hbar]+1,*) GammaReduction]* rest/ groupStruct
		,
			0
		];
	evaOperator+result*rest// ContractCGs// Contract
]


(* ::Subsection:: *)
(*Levi-Civita relations*)


(* ::Subsubsection::Closed:: *)
(*Remove LC tensor*)


RemoveLCTensor[expr_,opt___]/;FreeQ[expr,_LCTensor]:=expr;


RemoveLCTensor[expr_,opt___]:= Operator[expr]/.a_Operator:>OperatorToNormalForm[RemoveLCTensor[a,opt]];


RemoveLCTensor[op_Operator,OptionsPattern[{Evanescent-> True}]]:=Module[{opexp=OperatorToNormalForm@op, evaOperator, result},
	result=LC2Delta@LC2Gamma5@opexp;
	(*add SchoutenID?*)
	evaOperator=If[OptionValue@Evanescent,
				DefineEvanescentOperator[opexp,result,LCTensor],
				0];
	evaOperator+result//RelabelIndices//Contract
]
