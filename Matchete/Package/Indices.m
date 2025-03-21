(* ::Package:: *)

Package["Matchete`"]


(* ::Title:: *)
(*Matchete`Indices`*)


(* ::Subtitle:: *)
(*Methods for all things indices *)


(* ::Chapter:: *)
(*Public:*)


(* ::Section:: *)
(*Scoping:*)


(* ::Subsubsection::Closed:: *)
(*Exported*)


PackageExport["Index"]


PackageExport["Lorentz"]
PackageExport["LCTensor"]
PackageExport["\[ScriptD]"]


PackageExport["RelabelIndices"]


PackageExport["Contract"]
PackageExport["Delta"]
PackageExport["Metric"]


PackageExport["FlavorSum"]


(* ::Subsubsection::Closed:: *)
(*Internal*)


PackageScope["ContractMetric"]
PackageScope["ContractDelta"]


PackageScope["ContractDeltaSingleTerm"]


PackageScope["FindDummyIndices"]
PackageScope["FindOpenIndices"]
PackageScope["FindDiagonalIndices"]


PackageScope["RelabelNonFlavorIndices"]


PackageScope["RelabelIndicesInTerm"]


PackageScope["BuildIndexAssoc"]
PackageScope["ResetIndexAlphabets"]
PackageScope["$IndexAlphabets"]
PackageScope["$UndefinedIndexAlphabet"]


PackageScope["RemovePower"]


PackageScope["DimRep"]


(* ::Section:: *)
(*Usage definitions*)


(* ::Subsubsection::Closed:: *)
(*Exported*)


Index::usage = "Index[label, representation] specifies an index with label 'label' belonging to certain representation. For representations of non-Abelian groups, the representation will often take the form group[rep].";


Lorentz::usage  = "Index[\[Mu],Lorentz] specifies the index \[Mu] belongs to the Lorentz group.";
LCTensor::usage = "LCTensor[\[Mu],\[Nu],\[Rho],\[Sigma]] is the Levi-Civita tensor \!\(\*SuperscriptBox[\(\[Epsilon]\), \(\[Mu]\[Nu]\[Rho]\[Sigma]\)]\), defined by \!\(\*SuperscriptBox[\(\[Epsilon]\), \(0123\)]\)=+1.";
\[ScriptD]::usage        = "\[ScriptD] represents the space-time dimension.";


RelabelIndices::usage = "RelabelIndices[expr] relabels all repeated indices in expr in a canonical way.
RelabelIndices[expr,Unique->True] relabels all repeated indices in expr using unique labels, if Unique->False is specified canonical labels are used instead.";


Contract::usage = "Contract[expr] contracts all Delta[a,b] functions and Metric[\[Mu],\[Nu]] tensors in the expression expr.";
Delta::usage    = "Delta[Index[a,rep],Index[b,rep]] denotes the delta function for the indices a and b of the same representation.";
Metric::usage   = "Metric[\[Mu],\[Nu]] denotes the Lorentz metric tensor \!\(\*SubscriptBox[\(g\), \(\[Mu]\[Nu]\)]\).";


FlavorSum::usage = "FlavorSum[index] represents a sum over the diagonal flavor index.";


(* ::Subsubsection::Closed:: *)
(*Internal*)


ContractDelta::usage  = "ContractDelta[expr] contracts all Delta[a,b] functions in the expression expr.";
ContractMetric::usage = "ContractMetric[expr] contracts all Metric[\[Mu],\[Nu]] tensors in the expression expr.";


FindDummyIndices::usage = "FindDummyIndices[expr] returns a list of all repeated indices in expr, where expr must be a single Term.";
FindOpenIndices::usage  = "FindOpenIndices[expr] returns a list of all non-repeated indices in expr, where expr must be a single Term.";


RelabelIndicesInTerm::usage = "RelabelIndicesInTerm[expr] relabels all repeated indices with canonical labels in expr, where expr must be a single term. RelabelIndicesInTerm[expr,bool] relabels all repeated indices in expr, where expr must be a single term. If the argument bool is True unique labels are be given to the dummy indices, if bool is False canonical labels are given instead.";


BuildIndexAssoc::usage         = "BuildIndexAssoc[alphList,n] builds an association of length n (default 20) with the index alphabet using the list of names alphList.";
$IndexAlphabets::usage         = "Association made of defined index alphabet associations.";
$UndefinedIndexAlphabet::usage = "Association made of undefined index alphabet associations.";


RemovePower::usage = "RemovePower[expr] expands out all powers and applies Hold to the result.";


DimRep::usage = "DimRep[rep] returns the dimension of the representation or flavor index 'rep'.";


(* ::Chapter:: *)
(*Private:*)


(* ::Subsubsection::Closed:: *)
(*Properties of Index*)


(* ::Text:: *)
(*Index is a wrapper around all dummy index labels to provide information about which representation they belong to*)


SetAttributes[Index,OneIdentity]


Index[lab_, Bar@ rep_]:= Bar@ Index[lab, rep];
Index[Index[a_, f_], f_] := Index[a, f]


(* ::Subsubsection::Closed:: *)
(*Related to CG implementation*)


(* ::Text:: *)
(*Delta contractions do not distinguish between conjugated indices*)


Delta[Bar@ a_, b_]:= Delta[a, b];
Delta[a_, Bar@ b_]:= Delta[a, b];


Delta/:Bar@Delta[a_,b_]:=Delta[a,b];


(* ::Section:: *)
(*Formatting*)


(* ::Subsubsection::Closed:: *)
(*Flag determining whether to print the full index or short version*)


$PrintFullIndices = True;


(* ::Subsubsection::Closed:: *)
(*The default alphabets used for printing indices*)


$IndexAlphabet = CharacterRange["a", "z"];
$LorentzAlphabet = {"\[Mu]", "\[Nu]", "\[Rho]", "\[Sigma]","\[Kappa]"};


(* ::Subsubsection::Closed:: *)
(*Build up association for index printing alphabet*)


BuildIndexAssoc[alph_List,n_:20]:=Association@Table[
	Module[
		{
			auxx=QuotientRemainder[c-1,Length@alph],
			aux,
			auxR,
			dummyIndexLabels="Global`d$$"
		},
		aux=auxx[[1]];
		auxR=auxx[[2]];
		If[aux==0,
			ToExpression[dummyIndexLabels<>ToString[c]]->alph[[c]],
			ToExpression[dummyIndexLabels<>ToString[c]]->SubscriptBox[ToString@alph[[auxR+1]],ToString[aux]]
		]
	],
	{c,n}
]


$UndefinedIndexAlphabet = BuildIndexAssoc[{"x","y","z"}];


ResetIndexAlphabets[]:= Block[{},
	$IndexAlphabets=<|Lorentz->BuildIndexAssoc[$LorentzAlphabet]|>;
];
ResetIndexAlphabets[];


(* ::Section:: *)
(*Dummy indices in any Expression*)


(* ::Subsection:: *)
(*Finding repeated indices (in single term)*)


(* ::Subsubsection::Closed:: *)
(*Auxiliary function to remove Power[_,n]*)


(* ::Text:: *)
(*Auxiliary function to remove powers in intermediate steps:*)


RemovePower[input_]:= input/. Power[x_, n_Integer? Positive]:> 
	(Hold@ Evaluate[Prod@@ ConstantArray[x, n] ]/.Prod->Times)


(* ::Subsubsection::Closed:: *)
(*FindDummyIndices/FindOpenIndices*)


FindDummyIndices::sum="Head of argument is Plus. FindDummyIndices cannot be called on a sum, but only on a single term.";
FindDummyIndices::trippleindex="`1` is appearing more than twice in the expression `2`.";


FindDummyIndices= First@* FindIndices;


(* Function to find all dummy indices in a single term *)
FindIndices[expression_]:=Block[
	{
		list,
		diagCouplReplacement,
		aux,
		expr
	},
	
	(* RemovePower must not be replaced by PseudoTimes here *)
	expr= RemovePower[expression/. $DropDiagonalCouplings];
	
	list= Cases[expr, _Index, All];

	(* get multiplicity of the other indices *)
	list= Tally[list];

	(* throw error if there is a tripple index *)
	FirstCase[list, {a_, b_/; b> 2}:>
		(Message[FindDummyIndices::trippleindex, a, expression]; Abort[];)];

	(* {dummy indices, open indices} *)
	(* FlavorSum indices are always dummy *)
	{Join[Cases[list, {x_, 2}:> x], Cases[expression, FlavorSum@ ind_:> ind, All] ], 
		Cases[list, {x_, 1}:> x]} (*treat summed flavor indices also as dummy indices*)
]


FindOpenIndices[expression_]:=Module[
	{
		expr=Expand[expression]
	 },
	 (* Throw error when expr is not a single term*)
	If[Head[expr]===Plus,
		Message[FindDummyIndices::sum];
		Abort[]
	];

	Last@ FindIndices[expr]
]


(* returns a list of indices in the expr that are from couplings with the "DiagonalCoupling -> True" flag *)
FindDiagonalIndices[expr_]:=If[
		Head[ Expand @ expr ]===Plus
	,
		(* we are allowing sums of terms with different numbers of indices, since we can have flavor-universal expressions added to non-universal ones - the final number of vector indices is the largest we find *)
		Last @ SortBy[ DeleteDuplicates [ DiagonalInidicesSingleTerm /@ List @@ Expand @ expr ], Length ],
		DiagonalInidicesSingleTerm @ expr
	]

(*
DiagonalInidicesSingleTerm[expr_]:=Module[{dummies,opens, all},
	{dummies,opens} = Echo@FindIndices[expr];
	(* we only allow flavor indices to be of this type *)
	all = Cases[ DeleteDuplicates @ Cases[ expr , _Index, Infinity], Index[_,f_]/;MemberQ[Keys[$FlavorIndices],f]];
	(* diagonal indices show up neither as dummies nor as open indices, so just return all flavor indices that  *)
	Complement[all, dummies, opens]
]
*)

DiagonalInidicesSingleTerm[expression_]:=Block[
	{
		list,
		diagCouplReplacement,
		(*Temporarly remove all powers*)
		expr=PseudoTimes@ expression,
		allInd
	},

	(* get list of all indices *)
	allInd = DeleteDuplicates@ Cases[expr, _Index, All];

	(* drop indices of flavor diagonal couplings *)
	expr = expr /. $DropDiagonalCouplings;

	(* list all indices found in expr that are not diagonal flavor indices *)
	list = DeleteDuplicates@ Cases[expr, _Index, All];

	(* all diagonal indices that are not contracted to anything *)
	Complement[allInd, list]
]


(* ::Subsection:: *)
(*Relabel repeated indices *)


(* ::Subsubsection::Closed:: *)
(*In Single term*)


(*RelabelIndicesInTerm::sum="Head of argument is Plus. RelabelIndicesInTerm cannot be called on a sum, but only on a single term.";*)


$canonicalLabels= Block[{n}, Table[Symbol["Global`d$$" <> ToString[n]], {n,100}]]


RelabelIndicesInTerm[expr_,unique_:False]:=Block[
	{
		ind,
		indexCounter,
		newInd,
		dummyIndices,
		openInds,
		rule
	},

	(* Unique | canonical dummy index labels*)
	If[unique,
		(*True: unique dummy indices are required:*)
		(*Find dummy indices*)
		dummyIndices = FindDummyIndices[expr];

		(*Find replacement rules*)
		rule= Table[
				ind-> Index[Unique["u"], ind[[2]]]
			, {ind, dummyIndices}];
	,
		(*False: canonically labled dummy indices are required:*)
		(*Find the new dummy indices*)
		{dummyIndices, openInds}= FindIndices@ expr;
		
		(*create a separate counter for every type of index*)
		(indexCounter[#[[2]]]= 1)&/@ dummyIndices;

		(*Find replacement rules*)
		(*The While loop ensures no duplicates labels with the open indices*)
		rule= Table[
				While[MemberQ[openInds, newInd= Index[$canonicalLabels[[indexCounter[ind[[2]]]++]], ind[[2]]]],
					0];
				ind-> newInd
			, {ind, dummyIndices}];
	];

	(*apply rules*)
	expr/.rule
]


(* ::Subsubsection::Closed:: *)
(*General*)


Options[RelabelIndices] = {Expand->True, Unique->False};


(* ::Text:: *)
(*When relabeling dummy indices in a list or matrix*)


RelabelIndices[l_List, opt:OptionsPattern[]]:= RelabelIndices[#, opt]&/@l;


(* ::Text:: *)
(*Function that replaces all dummy indices in a consistent manner*)


(* Performance improvements for long expressions *)
RelabelIndices[expr_Plus, opt:OptionsPattern[]] := RelabelIndices[#, opt]&/@expr

(*Relabel indices on HcTerms*)
RelabelIndices[HcTerms[expr_], opt:OptionsPattern[]]:=HcTerms[RelabelIndices[expr, opt]];

(*Relabel indices on Sqrt*)
RelabelIndices[Sqrt[expr_], opt:OptionsPattern[]]:=Sqrt[RelabelIndices[expr, opt]];

(* Relabel dummy indices *)
RelabelIndices[expression:Except[_Plus], OptionsPattern[]]:=Block[
	{
		expr = expression,
		(* determine whether to use unique or canonical index labels *)
		unique = OptionValue[Unique]
	},
	(* by default expand expression first *)
	If[OptionValue[Expand],
		expr = LagrangianExpand[expr]
	];

	(*treat every term in a sum separately*)
	If[Head[expr]===Plus,
		expr = List@@expr,
		expr = List@expr
	];

	(*relabel dummy indices in each term separately and sum them up*)
	Plus@@ (RelabelIndicesInTerm[#, unique]&/@ expr)
]


(* ::Subsection:: *)
(*Relabel repeated indices (except for flavor indices)*)


(* ::Text:: *)
(*This function is a duplicate of RelabelIndices, except that it ignores all kinds of flavor indices.*)
(*NOTE: Keep this functionality separate to avoid slowing down the default RelabelIndices.*)


(* ::Subsubsection::Closed:: *)
(*Relabel (single term)*)


RelabelNonFlavorIndicesInTerm[expr_,unique_:False]:=Block[
	{
		ind,
		indexCounter,
		newInd,
		dummyIndices,
		openInds,
		rule,
		dropFlavorInds= Index[_,Alternatives@@Keys[GetFlavorIndices[]]] -> Nothing
	},

	(* Unique | canonical dummy index labels*)
	If[unique,
		(*True: unique dummy indices are required:*)
		(*Find dummy indices*)
		dummyIndices = FindDummyIndices[expr]//.dropFlavorInds;

		(*Find replacement rules*)
		rule= Table[
				ind-> Index[Unique["u"], ind[[2]]]
			, {ind, dummyIndices}];
	,
		(*False: canonically labled dummy indices are required:*)
		(*Find the new dummy indices*)
		{dummyIndices, openInds}= FindIndices[expr];
		
		dummyIndices= dummyIndices//.dropFlavorInds;
		
		(*create a separate counter for every type of index*)
		(indexCounter[#[[2]]]= 1)&/@ dummyIndices;

		(*Find replacement rules*)
		(*The While loop ensures no duplicates labels with the open indices*)
		rule= Table[
				While[MemberQ[openInds, newInd= Index[$canonicalLabels[[indexCounter[ind[[2]]]++]], ind[[2]]]],
					0];
				ind-> newInd
			, {ind, dummyIndices}];
	];

	(*apply rules*)
	expr/.rule
]


(* ::Subsubsection::Closed:: *)
(*Relabel (general)*)


Options[RelabelNonFlavorIndices] = {Expand->True, Unique->False};


(* ::Text:: *)
(*When relabeling dummy indices in a list or matrix*)


RelabelNonFlavorIndices[l_List, opt:OptionsPattern[]]:= RelabelNonFlavorIndices[#, opt]&/@l;


(* ::Text:: *)
(*Function that replaces all dummy indices in a consistent manner*)


(* Performance improvements for long expressions *)
RelabelNonFlavorIndices[expr_Plus, opt:OptionsPattern[]] := RelabelNonFlavorIndices[#, opt]&/@expr

(*Relabel indices on HcTerms*)
RelabelNonFlavorIndices[HcTerms[expr_], opt:OptionsPattern[]]:=HcTerms[RelabelNonFlavorIndices[expr, opt]];

(*Relabel indices on Sqrt*)
RelabelNonFlavorIndices[Sqrt[expr_], opt:OptionsPattern[]]:=Sqrt[RelabelNonFlavorIndices[expr, opt]];

(* Relabel dummy indices *)
RelabelNonFlavorIndices[expression:Except[_Plus], OptionsPattern[]]:=Block[
	{
		expr = expression,
		(* determine whether to use unique or canonical index labels *)
		unique = OptionValue[Unique]
	},
	(* by default expand expression first *)
	If[OptionValue[Expand],
		expr = LagrangianExpand[expr]
	];

	(*treat every term in a sum separately*)
	If[Head[expr]===Plus,
		expr = List@@expr,
		expr = List@expr
	];
	(*If[OptionValue@Unique,Print[OptionValue@Unique]];*)
	(*relabel dummy indices in each term separately and sum them up*)
	Plus@@ (RelabelNonFlavorIndicesInTerm[#, unique]&/@ expr)
]


(* ::Section:: *)
(*Index contractions*)


(* ::Subsubsection::Closed:: *)
(*Combined*)


(* ::Text:: *)
(*Contract fully contracts delta functions and metrics within an expression, and relabels the indices in each term.*)


Contract@ expr_:= Module[{terms= TermsToList@LagrangianExpand[expr] (* if LagrangianExpand is removed, the Expand option below should be set to False *) },
	Plus@@ Table[
		ContractDeltaSingleTerm[ContractMetricSingleTerm@ term(*, Expand->False*)]// RelabelIndicesInTerm
	, {term, terms}]
]


(* ::Subsection:: *)
(*Delta*)


(* ::Subsubsection::Closed:: *)
(*Attributes*)


SetAttributes[Delta, Orderless]


(* ::Subsubsection::Closed:: *)
(*Properties*)


(* ::Text:: *)
(*Non of these properties hold if the Delta is contracted to a Coupling with a diagonal Flavor index.*)


(*Delta /: Delta[Index[a_,rep_:Except[_Pattern]],Index[b_,rep_]] * Delta[Index[b_,rep_],Index[c_,rep_]] :=
	Delta[Index[a,rep],Index[c,rep]]*)


(*Delta /: Delta[Index[a_,rep_:Except[_Pattern]],Index[b_,rep_]]^2 :=
	Delta[Index[a,rep],Index[a,rep]]*)


(*Delta[Index[a_,rep:Except[_Pattern]],Index[a_,rep_]] := DimRep[rep]*)


(* ::Text:: *)
(*Apply these rules for non-flavor indices*)


NotFlavorQ[x:Except[_Pattern]]:=!MemberQ[Keys[$FlavorIndices],x]
FlavorQ[x:Except[_Pattern]]:=MemberQ[Keys[$FlavorIndices],x]


Delta /: Delta[Index[a_,rep_?NotFlavorQ],Index[b_,rep_]] * Delta[Index[b_,rep_],Index[c_,rep_]] :=
	Delta[Index[a,rep],Index[c,rep]]


Delta /: Delta[Index[a_,rep_?NotFlavorQ],Index[b_,rep_]]^2 :=
	Delta[Index[a,rep],Index[a,rep]]


Delta[Index[a_,rep_],Index[a_,rep_]]/;NotFlavorQ[rep] := DimRep[rep]


(* ::Text:: *)
(*To capture this case the following rule must be used in ContractDelta instead.*)


(* THIS RULE IS TOO SLOW *)
(*
RuleToSimplifyFlavorDeltas[] := With[{pat = Alternatives@@Keys[$FlavorIndices]},
Dispatch@{
	Times[rest___, Delta[Index[a_,rep_(*:pat*)],Index[a_,rep_]]]:>(Times[rest,If[FreeQ[{rest},Index[a,rep],All],DimRep[rep],1]])
	,
	Times[rest___, Delta[Index[a_,rep_(*:pat*)],Index[b_,rep_]]^2](*/;(a=!=b)*):>(Times[rest,Delta[Index[a,rep],Index[a,rep]]]/.Index[b,rep]->Index[a,rep])
	,
	Times[rest___, Delta[Index[a_,rep_(*:pat*)],Index[b_,rep_]], Delta[Index[b_,rep_],Index[c_,rep_]]](*/;(a=!=c&&a=!=b&&b=!=c)*):>(Times[rest,Delta[Index[a,rep],Index[c,rep]]]/.Index[b,rep]->Index[a,rep])
}
]
*)


(* ::Subsubsection::Closed:: *)
(*Simplifications for Flavor Delta*)


(* ::Text:: *)
(*Apply the delta properties manually for flavor deltas*)


SimplifyFlavorDelta[arg_] := If[FreeQ[arg, Alternatives@@Keys[$FlavorIndices],All],
	arg,
	FixedPoint[SimplifyFlavorDeltaStep, arg]
]


SimplifyFlavorDeltaStep[arg_] := Block[{expr,subs},
	{expr,subs}= Reap[arg /. {
		delta:Delta[Index[a_,rep_],Index[a_,rep_]] :> If[FreeQ[arg/.delta->1,Index[a,rep],All],
			DimRep[rep]
			,
			FlavorSum[Index[a,rep]]
		]
		,
		Delta[Index[a_,rep_],Index[b_,rep_]]^2 :> (Sow[Index[b,rep]->Index[a,rep]]; Delta[Index[a,rep],Index[a,rep]])
		,
		Delta[Index[a_,rep_],Index[b_,rep_]]*Delta[Index[b_,rep_],Index[c_,rep_]] :> (Sow[Index[b,rep]->Index[a,rep]]; Delta[Index[a,rep],Index[c,rep]])
		(* this last line is moved to the regular ContractDelta, so that it is also applied if the expression is not expanded *)
		(*,
		Delta[Index[a_,rep_],Index[b_,rep_]]*FlavorSum[Index[b_,rep_]] :> (Sow[Index[b,rep]->Index[a,rep]]; Echo@FlavorSum[Index[a,rep]])*)
	}];
	subs= Flatten[subs];
	expr/.subs
]


(* make flavor sums real *)
FlavorSum/:Bar@FlavorSum[ind_Index]:=FlavorSum[ind]


(* ::Text:: *)
(*Give flavor indices that are not contracted to anything but that should be summed over a special name.*)


(*FlavorSumIndexLabel[arg_,rep_]:=Module[{inds=Cases[arg,Index[label_,rep]:>ToString[label],All]},
	(* find all FlavorSum indices already appearing *)
	inds= Select[inds,StringStartsQ[#,"FlavorSum$$"]&];
	(* if no such index is present return first label *)
	If[inds==={},Return[Global`FlavorSum$$1]];
	(* otherwise return next smallest label *)
	inds= ToExpression[StringTake[#,{12,-1}]]&/@inds;
	Symbol["Global`FlavorSum$$" <> ToString[Max[inds]+1]]
]*)


(* ::Subsubsection::Closed:: *)
(*Contractions*)


ContractDelta::duplicate = "Could not contract all Delta in the term: `1`.";


Options[ContractDelta] = {Expand->True};


(* Performance improvements for long expressions *)
ContractDelta[expr_Plus, OptionsPattern[]] := ContractDelta[#, Expand->OptionValue[Expand]]&/@expr

(* Contract *)
ContractDelta[arg:Except[_Plus], OptionsPattern[]] :=
	Module[
		{ expr = HcExpand[arg](*avoids error when applied so expression containing HcTerms*)}
		,
		(* By default expand the argument before contraction *)
		If[OptionValue[Expand],
			expr = LagrangianExpand[expr];
		];

		If[Head[expr]===Plus,
			expr = List@@expr;
			Plus@@ (ContractDeltaSingleTerm[#, Expand->OptionValue[Expand]]&/@ expr)
		,
			ContractDeltaSingleTerm[expr, Expand->OptionValue[Expand]]
		]
	]


Options[ContractDeltaSingleTerm] = {Expand->True, "overall-only"->False};


ContractDelta::notexpanded="Using ContractDelta without expanding might light to incorrect results due to flavor indices on diagonal couplings."


ContractDeltaSingleTerm[expr_, OptionsPattern[]] :=
	Module[
		{
			result=expr,
			indicesDelta,
			noDelta
		}
		,
		If[!OptionValue@Expand,Message[ContractDelta::notexpanded]];

		(*Match CG deltas to Matchete deltas*)
		result= result/. CG[_del, inds_]:> (Delta@@ inds/. Bar-> Identity);

		If[FreeQ[result, _Delta],
			Return[result]
		];

		If[OptionValue[Expand],
			(* correct results only guaranteed for expanded results *)
			result= SimplifyFlavorDelta[result]
		];
		
		(* The "overall-only" option must only be used if applied to a full Lagrangian term, but can yield inconsistent results on subexpressions *)
		If[OptionValue["overall-only"],
			indicesDelta = Cases[result//._Plus->1, Delta[Index[a_,rep_],Index[b_,rep_]]:>{Index[a,rep],Index[b,rep]},All];
			noDelta = result/.Delta[_,_]->1;
			,
			indicesDelta = Cases[result, Delta[Index[a_,rep_],Index[b_,rep_]]:>{Index[a,rep],Index[b,rep]},All];
			noDelta = (result /. Delta[_,_]->1) /. $DropDiagonalCouplings[[2;;]](* first entry is "_FlavorSum->1" which must be removed *);
			(* Deltas should not contract if there is only a diagonal flavor index *)
		];
		(*noDelta = result/.Delta[_,_]->1;*)
		(*noDelta = (result /. Delta[_,_]->1) /. $DropDiagonalCouplings[[2;;]]*)
		(* first entry is "_FlavorSum->1" which must be removed *);
		(* Deltas should not contract if there is only a diagonal flavor index *)

		If[!DuplicateFreeQ[Flatten[indicesDelta/.{a_,a_}:>{a}]],
			Message[ContractDelta::duplicate, Format[expr, NiceForm]];
			Return[expr]
		];

		Do[
			If[!FreeQ[noDelta,First@ind],
				result = (result /. Delta[First@ind,Last@ind]->1)/.First@ind->Last@ind,
				If[!FreeQ[noDelta,Last@ind],
					result = (result /. Delta[First@ind,Last@ind]->1)/.Last@ind->First@ind
				]
			]
			,
			{ind,indicesDelta}
		];
		
		Return[result]
	]


(* ::Subsubsection::Closed:: *)
(*DimRep*)


DimRep::NoRep   = "'`1`' is not an already defined represention or flavor index"


DimRep[rep_]:=Block[{},
	If[Head@$Representations[rep]===Missing && Head@$FlavorIndices[rep]===Missing,
		Message[DimRep::NoRep ,rep];
		Abort[]
	];

	If[Head@$Representations[rep]=!=Missing, Return[$Representations[rep][RepDimension]]];
	If[Head@$FlavorIndices[rep]=!=Missing, Return[$FlavorIndices[rep][IndexDimension]]];
]


(* ::Subsection:: *)
(*Metric*)


(* ::Subsubsection::Closed:: *)
(*Error message*)


Metric::args= "The arguments of Metric are expected to be 2 symbols or 2 Lorentz indices. The argument `1` was given."


(* ::Subsubsection::Closed:: *)
(*Attributes*)


SetAttributes[Metric, Orderless]


(* ::Subsubsection::Closed:: *)
(*Input  check*)


Metric[a_Symbol,b_]:= Metric[Index[a,Lorentz],b]


(* ::Text:: *)
(*Only 2 arguments of Symbol or Index[_, Lorentz] type are valid*)


Except[Metric@ Repeated[Index[_, Lorentz], {2}], 
	Metric[ind___]/; FreeQ[{ind}, Alternatives[_OrderlessPatternSequence, _Pattern, _Blank, _BlankSequence, _BlankNullSequence]]]:=
Block[{},
	Message[Metric::args, List@ ind];
	Abort[];
];


(* ::Subsubsection::Closed:: *)
(*Properties*)


Metric /: Metric[a_,b_] * Metric[b_,c_] := Metric[a,c]


Metric /: Metric[a_,b_]^2 := Metric[a,a]


Metric[a_,a_] := \[ScriptD]


(* ::Subsubsection::Closed:: *)
(*Contractions*)


ContractMetric@ expr_:= Plus@@ ContractMetricSingleTerm/@ TermsToList@ expr;


(* ::Text:: *)
(*In a single term the metrics will always occur at level 1. The automatic evaluation of metrics contracting into each other, ensures that no metric share any indices. Metric relies exclusively of indices of the type Index[<Symbol>, Lorentz] ensuring that they always have Depth 2.*)


ContractMetricSingleTerm@ term_Times:= Block[{res, mets},
	If[FreeQ[term, _Metric, {1}],
		Return[term]
	];
	{res, mets}= Reap[
		Replace[term, m_Metric:> (Sow[List@@ m]; 1), {1}]
	];
	
	Do[
		res= Which[
			!FreeQ[res, ind[[1]], {-2}],
				Replace[res, ind[[1]]-> ind[[2]], {-2}]
			,!FreeQ[res, ind[[2]], {-2}],
				Replace[res, ind[[2]]-> ind[[1]], {-2}]
			,True, 
				res* Metric@@ ind
			];
	, {ind, mets[[1]]}];
	res
];
ContractMetricSingleTerm@ obj_:= obj;


(* ::Subsection:: *)
(*Levi-Civita tensor*)


(* ::Subsubsection::Closed:: *)
(*Error message*)


LCTensor::args= "The arguments of LCTensor are expected to be 4 symbols or 4 Lorentz indices. The argument `1` was given."


(* ::Subsubsection::Closed:: *)
(*Input  check*)


LCTensor[ps:OrderlessPatternSequence[a_Symbol, __]]:=LCTensor@@({ps}/.a->Index[a,Lorentz]);


(* ::Text:: *)
(*Only 4 arguments of Symbol or Index[_, Lorentz] type are valid*)


Except[LCTensor@ Repeated[Index[_, Lorentz], {4}], 
	LCTensor[ind___]/; FreeQ[{ind}, Alternatives[_OrderlessPatternSequence, _Pattern, _Blank, _BlankSequence, _BlankNullSequence]]]:=
Block[{},
	Message[LCTensor::args, List@ ind];
	Abort[];
];


(* ::Subsubsection::Closed:: *)
(*Properties*)


LCTensor@ OrderlessPatternSequence[a_, a_, __]:= 0


LCTensor@ a__/; ! OrderedQ@ {a}:= Signature@ {a} LCTensor@@ Sort@ {a}
