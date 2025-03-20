(* ::Package:: *)

Package["Matchete`"]


(* ::Title:: *)
(*Matchete`Simplifications`*)


(* ::Subtitle:: *)
(*Paclet for simplifying and reducing EFT operators to an off-shell basis*)


(* ::Chapter:: *)
(*Public:*)


(* ::Section:: *)
(*Scoping*)


(* ::Subsubsection::Closed:: *)
(*Exported*)


PackageExport["GreensSimplify"]
PackageExport["IBPIdentities"]


PackageExport["CollectOperators"]
PackageExport["SelectOperatorClass"]
PackageExport["GetOperatorCoefficient"]


PackageExport["HcSimplify"]
PackageExport["HcExpand"]
PackageExport["HcTerms"]


PackageExport["ReductionIdentities"]
PackageExport["dDimensional"]
PackageExport["FourDimensional"]
PackageExport["EvanescenceFree"]


(* ::Subsubsection::Closed:: *)
(*Scoped*)


PackageScope["Operator"]
PackageScope["NormalToOperatorForm"]
PackageScope["OperatorToNormalForm"]
(*PackageScope["NormalForm"]
PackageScope["ReleaseOperators"]*)
PackageScope["ToAtomicForm"]
PackageScope["AtomicToOperatorForm"]
PackageScope["AtomicToNormalForm"]


PackageScope["EoM"]
PackageScope["SeparateOutConstants"]


PackageScope["InternalSimplify"]
PackageScope["InternalOpRepresentation"]
PackageScope["InequivalentPermutations"]
PackageScope["ConjugateIndexExchange"]


PackageScope["Conj"]
PackageScope["AtomicOp"]
PackageScope["CompOp"]
PackageScope["ConstructOperatorIdentities"]
PackageScope["ResetOperatorAssociations"]
PackageScope["MatchOperatorPatterns"]
PackageScope["LookupOperatorFlavorProperties"]
PackageScope["$operators"]
PackageScope["$compoundOperators"]
PackageScope["HcSimplifyInternal"]
PackageScope["CollectCoefficientsWithSyms"]


PackageScope["EOMDevs"]


PackageScope["CanonizeKinetic"]


PackageScope["SeparateInteractionTerm"]


(* ::Section:: *)
(*Usage messages*)


(* ::Subsubsection::Closed:: *)
(*Exported*)


CollectOperators::usage= "CollectOperators[expr] collects all identical operators (under index relabeling and obvious symmetries) in an expression."
SelectOperatorClass::usage= "SelectOperatorClass[expr, fields, devNo] selects all terms in the expression with operators consisting of the specified matter fields (including Bars) and number of derivatives. Field strength tensors count as 2 derivatives."
GetOperatorCoefficient::usage= "GetOperatorCoefficient[expr, operator] extracts the coefficient of the operator matching exactly (except for index names) the form given by operator."


GreensSimplify::usage= "GreensSimplify[expr] simplifies an expression with IBP identities and commutation relations."
IBPIdentities::usage= "IBPIdentities[fields, devNo] returns a list with all the integration-by-part identities used by GreensSimplify for the class of operators consisting of the exact matter fields (including Bars) and the specified number of derivatives. Field strength tensors count as 2 derivatives."


HcSimplify::usage="HcSimplify[Lagrangian] identifies terms with their hermitian conjugate and retains only one of them under the head HcTerms.";
HcExpand::usage="HcExpand[Lagrangian] expands the head HcTerms to return both the operators and their hermitian conjugate.";
HcTerms::usage="HcTerms[expr] is a placeholder that contain terms whose hermitian conjugate have been removed form the Lagrangian with HcSimplify.";


ReductionIdentities::usage="Option for GreensSimplify to decide whether or not to use the subset of identities valid only in 4 dimensions (fierz, gamma reduction and Levi-Civita relations) in the simplification.
				         The value can be dDimensional (4D identies are not included), FourDimensional (4D identities are included), Evanescent (4D identities are included with the corresponding evanescent operators) or EvanescenceFree (4D identities are included and evanescent contributions are evaluated)."


(* ::Subsubsection::Closed:: *)
(*Scoped*)


EoM::usage="EoM[A_] is a field operator in the form of the equations of motion of a field.";
Operator::usage="Operator[x] separates prefactors from field operators and puts the expressions into forms that can more easily be processed by the reduction algorithms.";


LookupOperatorFlavorProperties::usage= "LookupOperatorFlavorProperties[op] returns the flavor properties of the operator in question."


(* ::Chapter:: *)
(*Private:*)


(* ::Section:: *)
(*Operator part*)


(* ::Subsection:: *)
(*Operator object*)


(* ::Subsubsection::Closed:: *)
(*Properties*)


(* ::Text:: *)
(*Operator is separates prefactors from the fields and group structures of an object. It distributes over an expression, so after applying Operator to an expression, all operators are contained in an Operator object.*)


SetAttributes[Operator, {Orderless}];


(*Flat*)
HoldPattern@ Operator[Operator@ x___, y___]:= Operator[x, y];
(*Distributive *)
Operator@ l_List:= Operator/@ l;
op:Operator[_Plus, ___]:= Distribute@ Unevaluated@ op;

(*Operator@ prod_Times:= Operator@@ prod;*)
Operator[HoldPattern@ Times@ a__, b___]:= Operator[a, b];

Operator[a_/; FreeQ[a, Field| FieldStrength| CG| LCTensor], b___]:= a Operator@ b;

Operator[Power[a_, n_Integer? Positive], b___]:= Operator[Sequence@@ ConstantArray[a, n], b];

Operator[]:= 1;


(* ::Subsubsection::Closed:: *)
(*Recognize EoM*)


(* ::Text:: *)
(*Behavior of EoM under conjugation*)


EoM/: Bar@ EoM@ X_:=EoM@ Bar@X


(* ::Text:: *)
(*Structures occurring with Majorana fermions*)


EoM[(f:Transp@ Field[_, Fermion, _, {}])** CC]:= -EoM@ f **CC;
EoM[-CC** (f:Field[_, Fermion, _, {}])]:= CC** EoM@ f ;


(* ::Text:: *)
(*Recognize EoM-type structures... *)


(* Scalars *)
Operator[eom:(Field[_, Scalar, _, {mu_, mu_}]| Bar@ Field[_, Scalar, _, {mu_, mu_}]), rest___]:=
	Operator[eom/. Field[l_, Scalar, i_, {b_, b_}]:> EoM@ Field[l, Scalar, i, {}], rest];

(* Fermions *)
Operator[X___** DiracProduct[A___, GammaM[mu_]]** Field[f_, Fermion, i_, {mu_}], rest___]:=
	Operator[X** DiracProduct[A]** EoM[Field[f, Fermion, i, {}]], rest];
Operator[X___** DiracProduct[A___, GammaM[mu_], Proj@ p_]** Field[f_, Fermion, i_, {mu_}], rest___]:=
	Operator[X** DiracProduct[A, Proj[-p]]** EoM[Field[f, Fermion, i, {}]], rest];
(* Bar@ Fermions *)
Operator[Bar@ Field[f_, Fermion, i_, {mu_}]** DiracProduct[GammaM[mu_], A___]** X___, rest___]:=
	Operator[EoM[Bar@ Field[f, Fermion, i, {}]]** DiracProduct[A]** X, rest];
(* Transp@ Fermions *)
Operator[Transp@ Field[f_, Fermion, i_, {mu_}]** DiracProduct[GammaCC, GammaM[mu_], A___]** X___, rest___]:=
	- Operator[EoM[Transp@ Field[f, Fermion, i, {}]]** DiracProduct[GammaCC, A]** X, rest];
(*Transp@ Bar@ Fermions*)
Operator[X___** DiracProduct[A___, Transp@ GammaM[mu_]]** Transp@ Bar@ Field[f_, Fermion, i_, {mu_}], rest___]:=
	Operator[X** DiracProduct[A]** EoM[Transp@ Bar@ Field[f, Fermion, i, {}]], rest];
Operator[X___** DiracProduct[A___, Transp@ GammaM[mu_], Proj@ p_]** Transp@ Bar@ Field[f_, Fermion, i_, {mu_}], rest___]:=
	Operator[X** DiracProduct[A, Proj[-p]]** EoM[Transp@ Bar@ Field[f, Fermion, i, {}]], rest];

(*Vectors*)
Operator[FieldStrength[V_, linds:{OrderlessPatternSequence[a_, b_]}, ind_, {a_}], rest___]:=
	Signature@ linds Signature@ {a, b} Operator[EoM[Field[V, Vector[b], ind, {}]], rest];


(* ::Subsubsection::Closed:: *)
(*NormalForm, rewriting Operator and EoM objects*)


Options@ OperatorToNormalForm= {Unique-> False, CanonizeKinetic -> False};


OperatorToNormalForm[expr_,OptionsPattern[]]:= If[OptionValue@CanonizeKinetic,CanonizeKineticalOps[expr],expr]/.
					op_Operator:> Activate[If[OptionValue@Unique,
											RelabelNonFlavorIndices[(Inactive[Times]@@ op)/. EoM@ x_:> EoMStandardForm@ x, Unique -> True],
											RelabelNonFlavorIndices[(Inactive[Times]@@ op)/. EoM@ x_:> EoMStandardForm@ x, Unique -> False]
										]
									]


(* ::Text:: *)
(*Function for bringing Operator objects back into normal form while expanding any EoM objects. *)


(*Options@ NormalForm= {Unique-> True, CanonizeKinetic -> True};*)


(* ::Text:: *)
(*The call of OperatorFlavorSeparate is important to ensure a proper treatment of all diagonal flavor indices in the call of RelabelIndices. The final contract removes the deltas.*)


(*NormalForm[expr_, OptionsPattern[]]:= If[OptionValue@CanonizeKinetic,CanonizeKineticalOps[expr],expr] /.
		op_Operator:> Activate@ RelabelNonFlavorIndices[(Inactive[Times]@@ op)/. EoM@ x_:> EoMStandardForm@ x, Unique-> OptionValue@ Unique]*)


(*
NormalForm[expr_, OptionsPattern[]]:= (*ContractDelta[*)
	CanonizeKineticalOps[expr, OptionValue@CanonizeKinetic]/.
		op_Operator:> OperatorFlavorSeparate[op]/.
		op_Operator:> Activate@ RelabelIndices[(Inactive[Times]@@ op)/. EoM@ x_:> EoMStandardForm@ x,
			Unique-> OptionValue@ Unique]/.
		x: Times[_Operator, __]:> ContractDelta[x, Expand-> False]
(*,Expand->False]*) (* The overall ContractDelta can lead to incorrect reults when using the option Expand->False *)
*)


(* ::Text:: *)
(*Lightweight function for releasing operator form in a Lagrangian*)


(*ReleaseOperators[expr_]:= expr/.
	op_Operator:> Activate[Inactive[Times]@@ op/. EoM@ x_:> EoMStandardForm@ x]*)


(* ::Text:: *)
(*Rewrite EOMs as standard field expressions*)


EoMStandardForm[f:Field[_, Scalar, __]]:= Module[{a}, CD[{a, a}, f] ];
EoMStandardForm[Bar@ f:Field[_, Scalar, __]]:= Bar@ Module[{a}, CD[{a, a}, f] ];
EoMStandardForm[f: Field[_, Fermion, __]]:= Module[{a}, \[Gamma][a]**CD[a, f]];
EoMStandardForm[Bar@ f:Field[_, Fermion, __]]:= Bar@ Module[{a}, \[Gamma][a]**CD[a, f]];
EoMStandardForm[Transp@ f:Field[_, Fermion, __]]:= Transp@ Module[{a}, \[Gamma][a]**CD[a, f]];
EoMStandardForm[Transp@ Bar@ f:Field[_, Fermion, __]]:= Module[{a}, Transp@ \[Gamma][a]**Transp@ Bar@ CD[a, f]];
EoMStandardForm[Field[f_, Vector[mu_], ind_, {}]]:=
	Module[{nu}, FieldStrength[f, {Index[nu, Lorentz], mu}, ind, {Index[nu, Lorentz]}] ];


(* ::Text:: *)
(*To put scalar kinetic terms on textbook form *)


CanonizeKineticalOps[expr_] :=
	expr/. {
		Operator[Bar@ Field[f1_, Scalar, inds1_, {}], EoM@ Field[f2_, Scalar, inds2_, {}]]:>
			-Operator[Bar@ Field[f1, Scalar, inds1, {Index[Global`d$$1, Lorentz]}], Field[f2, Scalar, inds2, {Index[Global`d$$1, Lorentz]}]],
		Operator[Field[f1_, Scalar, inds1_, {}], EoM@ Field[f2_, Scalar, inds2_, {}]]:>
			-Operator[Field[f1, Scalar, inds1, {Index[Global`d$$1, Lorentz]}], Field[f2, Scalar, inds2, {Index[Global`d$$1, Lorentz]}]]
	};


(* ::Subsubsection::Closed:: *)
(*Converting to Operator Form*)


NormalToOperatorForm[expr_]:=Operator@expr;


(* ::Section:: *)
(*Operator construction*)


(* ::Subsubsection::Closed:: *)
(*Operator association*)


(* ::Text:: *)
(*Global associations with operator pattern substitutions (both ways)*)
(*$operators = <| opType -> <| operator ID -> OperatorProperties |> |>*)


$operators= <||>;
ResetOperatorAssociations[]:= Module[{class},
	Do[
		UnsetHermitianIdentities[class, _];
	,{class, Keys@ $operators}];
	$operators= <||>;
	$compoundOperators= <|dDimensional-> <||>, Evanescent-> <||>, FourDimensional-> <||> |>;
];
ResetOperatorAssociations[];


(* ::Subsection:: *)
(*Utility functions*)


(* ::Subsubsection::Closed:: *)
(*Separate a term by operator and coefficient, returns {coupling, operator}*)


SeparateInteractionTerm::IncompatibleForm = "The object `1` is not of the form (Operator[a]*b)"


SeparateInteractionTerm[dL_]:=Module[{L = Collect[Operator@Expand@dL,_Operator],cpl,op},
	If[MatchQ[L, _Operator b_:1],
		cpl= L/._Operator -> 1;
		op = L/cpl;
		Return[{cpl, (*RelabelIndices@*)OperatorToNormalForm[op,Unique->True,CanonizeKinetic->True]}];
	,
		Message[ SeparateInteractionTerm::IncompatibleForm ,Format[L,NiceForm]];
		Return[{1,dL}]
	];
]


(* ::Subsubsection::Closed:: *)
(*Find indices*)


(* ::Text:: *)
(*Return all open/contracted indices appearing in an object *)


OpenIndices@ obj_:= Cases[Tally@ Cases[obj, Index[__], All], {ind_, 1}-> ind];
ContractedIndices@ obj_:= Cases[Tally@ Cases[obj, Index[__], All], {ind_, 2}-> ind];


(* ::Subsubsection::Closed:: *)
(*FirstElementBy*)


(* ::Text:: *)
(*The performance of MinimalBy for finding a single smallest element is much worse than sort would be (at least for small examples)*)


FirstElementBy[list_, func_]:= First@ SortBy[list, func];
FirstElementBy[func_]@ list_:= FirstElementBy[list, func];


(* ::Subsubsection::Closed:: *)
(*Create canonical dummy indices*)


(* ::Text:: *)
(*Constructs canonical dummy indices of the given types *)


ConstructDummyIndices@ types_List:= ConstructDummyIndices@ types=
	MapIndexed[(Index[ToExpression["d$$"<> ToString[First@ #2]], #1]&), types];


(*FindPermutationOrder*)


(* ::Text:: *)
(*Returning the ordering list needed to make  permutation[[ordering list]] === target*)


FindPermutationOrder[permutation_List, target_List]:=
	Permute[Range@ Length@ target, FindPermutation[permutation, target]]


(*Complex conjugate _Operator *)


(* ::Text:: *)
(*Bar Does not work on operator, hence *)


OperatorBar@ op_Operator:= Bar/@ op;


(* ::Subsubsection::Closed:: *)
(*Conjugate operator class*)


(* ::Text:: *)
(*Returns the conjugate of an operator class*)


OpClassConjugate@ {fieldTypes_List, devs_}:= {Sort@ Conj@ fieldTypes, devs};


(* ::Subsubsection::Closed:: *)
(*Self-conjugate operator class *)


(* ::Text:: *)
(*Determines if the operator class is of the self-conjugate type*)


SelfConjugateClassQ@ {fieldTypes_List, _}:=
	Sort@ fieldTypes === Sort@ Conj@ fieldTypes;
SelfConjugateClassQ@ fieldTypes_List:= SelfConjugateClassQ@ {fieldTypes, 0};


(* ::Subsection:: *)
(*Construct operator matching patterns*)


(* ::Subsubsection::Closed:: *)
(*Construct op ID matching patterns from an operator *)


(* ::Text:: *)
(*Set up a pattern to identify an Operator object with its AtomicOp object*)


patternLabels= Table[Unique@ ordPat, 20];


OperatorMatchingPatterns[opClass_, opID_, op_Operator]:= Module[
		{indices, indReplace, pattern, signature},

	{pattern, signature}= MakeOperatorPattern@ op;
	
	(*Flavor indices *)
	indices= Flatten@ OperatorFieldsAndFlavors[op][[;;, ;;, 2]];
	indReplace= IndexPatternReplace/@ indices;
	
	(*Produce substitution rules from operator pattern*)
	{
		(*Replace operator with AtomicOp object*)
		With[{temp= signature,
				inds= indReplace[[;;, 2, 1]],
				pat= pattern/. indReplace},
			RuleDelayed[pat, Activate@ temp AtomicOp[opClass, opID, inds]]
		]
	,
		(*Function for matching operator with specific flavor indices*)
		With[{temp= signature,
				pat= pattern/. Thread@ Rule[indices, Slot/@ Range@ Length@ indices]},
			Function[Evaluate@ RuleDelayed[pat, Activate@ temp]]
		]
	}
];


IndexPatternReplace@ ind:Index[lab_, rep_]:= With[{temp= Unique@ lab},
	Rule[ind, temp:Index[_, rep]]
];


(* ::Subsubsection::Closed:: *)
(*Make operator matching pattern*)


(* ::Text:: *)
(*Function for creating pattern and associated signature from an Operator*)


MakeOperatorPattern@ op_Operator:= Module[{antisyms, cgsyms, indices, pattern, lorentzSign, counter= 1},
	(*Make pattern out of contracted indices*)
	indices= IndexPatternReplace/@ ContractedIndices@ op;
	pattern= op/. indices/. $lorentzSubs;
	lorentzSign= LorentzSign@ op;

	(*Name the antisymmetrized pattern indices*)
	pattern= pattern/. {obj: (_LCTensor|_FieldStrength|_GammaM):>
		(obj/. x_OrderlessPatternSequence:> Pattern[Evaluate@ patternLabels[[counter++]], x])};

	(*Provide sign signatures for all the anti-symmetric indices*)
	antisyms= Times@@ Cases[pattern,
			Verbatim[Pattern][name_, pats_OrderlessPatternSequence]:>
				Inactive[Signature]@ {name} Inactive[Signature][List@@ pats/. Verbatim[Pattern][x_, Blank[]]:>x]
		, All];

	(*Account for the symmetries of the CGs and spin-chain transposition (for identical fermions)*)
	cgsyms= Times@@ Reap[Sow@ Nothing;
			pattern= pattern/. cg_CG:> CGPattern@ cg;
			pattern= pattern/. spinChain_NonCommutativeMultiply:> SpinLinePattern@ spinChain;
		][[2, 1]];
	
	{pattern, lorentzSign* antisyms* cgsyms}
]


(* ::Text:: *)
(*Create orderless Patterns for the anti-symmetric Lorentz constructions*)


$lorentzSubs= {
	LCTensor[\[Mu]___]:> LCTensor@ OrderlessPatternSequence@ \[Mu],
	FieldStrength[A_, {\[Mu]__}, a__]:> FieldStrength[A, {OrderlessPatternSequence@ \[Mu]}, a],
	GammaM[\[Mu]_, \[Nu]__]:> GammaM@ OrderlessPatternSequence[\[Mu], \[Nu]]
};


(* ::Text:: *)
(*Compensate for the canonical ordering of patterns when creating OrderlessPatternSequence*)


LorentzSign@ op_:=
	Times@@ Cases[op, LCTensor[\[Mu]___]:> Signature@ List@ \[Mu], Infinity] *
	Times@@ Cases[op, FieldStrength[_, {\[Mu]__}, __]:> Signature@ List@ \[Mu], Infinity] *
	Times@@ Cases[op, GammaM[\[Mu]_, \[Nu]__]:> Signature@ {\[Mu], \[Nu]}, Infinity]


(* ::Text:: *)
(*Identify symmetric contractions of the CGPatterns *)


CGPattern@ CG[cg_, indsPat_]:= Module[{symsPat, inds, syms, x},
	syms= $CGproperties[cg/. Bar-> Identity, Symmetries];
	If[Length@ syms === 1,
		Return@ CG[cg, indsPat]
	];

	symsPat= GroupBy[KeyMap[indsPat[[#]]&, syms], Identity, Keys];
	(*Sow signature for the RHS of the AtomicOp if anti-symmetries are present*)
	If[KeyExistsQ[symsPat, -1],
		Sow@ Inactive[DidMatchSwitch][1, -1][x]
	];

	CG[cg, (x: Alternatives@@ Lookup[symsPat, 1, {}]) | Alternatives@@ Lookup[symsPat, -1, {}] ]
]


(* ::Text:: *)
(*Identify (anti-)symmetries from transposition of spin-chains with identical fermions *)


SpinLinePattern[spinLine:NonCommutativeMultiply[Transp@ Field[lab_, rest1__],
	dirac:RepeatedNull[DiracProduct[GammaCC,___], 1], Field[lab_, rest2__]] ]:= Module[{l},
		(l: spinLine)| NonCommutativeMultiply[Transp@ Field[lab, rest2], TranspDiracPattern[l, dirac], Field[lab, rest1]]
	];
SpinLinePattern[spinLine:NonCommutativeMultiply[Bar@ Field[lab_, rest1__],
	dirac:RepeatedNull[DiracProduct[GammaCC,___], 1], Bar@ Transp@ Field[lab_, rest2__]] ]:= Module[{l},
		(l: spinLine)| NonCommutativeMultiply[Bar@ Field[lab, rest2], TranspDiracPattern[l, dirac], Transp@ Bar@ Field[lab, rest1]]
	];
SpinLinePattern@ else_:= else;


TranspDiracPattern[symb_Symbol, DiracProduct[GammaCC, g___GammaM, p___Proj]]:= Module[{sign, gammas},
	gammas= Reverse@ {g};
	(*Include sign from transposing the antisymmetrized gammas*)
	sign= Times@@ Cases[gammas, GammaM@ Verbatim[Pattern][_, ind_OrderlessPatternSequence]:> Power[-1, Floor[Length@ ind/2]]];
	If[sign === -1, Sow@ Inactive[DidMatchSwitch][1, -1][symb]];

	DiracProduct[GammaCC, Sequence@@ gammas, p]
]


(* ::Text:: *)
(*Use any pattern variable, e.g., (x: a|...)| (b|...) to discriminate between a pattern match with pattern(s) a or pattern(s) b. x is a NullSequence if the b pattern(s) get matched.*)


DidMatchSwitch[t_, f_][]:= f;
DidMatchSwitch[t_, f_][___]:= t;


(* ::Subsubsection::Closed:: *)
(*Return Operator from AtomicOp *)


(* ::Text:: *)
(*Set up a pattern to expand an  AtomicOp object to the corresponding operator *)


OperatorExpansionPattern[class_, id_, op_Operator]:= Module[{indices},
	indices= Flatten@ OperatorFieldsAndFlavors[op][[;;, ;;, 2]];
	With[{inds= indices},
		RuleDelayed[AtomicOp[class, id, flavInds_], op/. Thread@ Rule[inds, flavInds] ]
	]
];


(* ::Subsection:: *)
(*Operator properties*)


(* ::Subsubsection::Closed:: *)
(*All operator properties *)


(* ::Text:: *)
(*Characterizes all properties of an operator object *)


OperatorProperties::nonop= "Passed a non-operator \"`1`\".";


OperatorProperties[_, _, x:Except[_Operator]]:= (Message[OperatorProperties::nonop, x]; Abort[];);


OperatorProperties[opClass_, opID_, op_Operator]:= Module[{count= 1, conjIndExchange, conjFieldExchange, equivClasses,
		fieldTypes, flavorInds, flavorPerms, indexGrouping, indexTypes, opIDpattern, permPattern, reexpPattern,
		selfConjugate, selfconjugateType, spinorLinePossibilities, symmetries},

	fieldTypes= OperatorFieldsAndFlavors@ op;
	flavorInds= fieldTypes[[;;, ;;, 2]]; fieldTypes= fieldTypes[[;;, ;;, 1]];
	indexTypes= Flatten@ flavorInds/. Index[_, type_]-> type;
	(*The (flavor) index grouping contains the fields by type and the enumerated the flavor indices for each field.
		{{{1,2},{3,4}},{{5},{6}}} means that there are two identical fields with indices {1,2} and {3,4}, and two identical fields with indices {5} and {6}.*)
	indexGrouping= flavorInds/. _Index:> count++;

	(*Get patterns for matching the operator*)
	{opIDpattern, permPattern}= OperatorMatchingPatterns[opClass, opID, op];
	reexpPattern= OperatorExpansionPattern[opClass, opID, op];

	(*Valid permutation of flavor indices*)
	flavorPerms= Flatten/@ Tuples[Permutations/@ indexGrouping];
	(*Flavor symmetries*)
	flavorInds= Flatten@ flavorInds;
	symmetries= DeleteCases[Rule[#1, op/. {permPattern@@ #2, _-> 0} ]& @@@ ({#, flavorInds[[#]]}&/@ flavorPerms),
		Rule[_, 0]];

	(*Equivalence classes for the flavor indices*)
	equivClasses= Sort/@ Outer[Part, flavorPerms, symmetries[[;;, 1]], 1];
	equivClasses= DeleteDuplicates@ equivClasses[[;;, 1]];

	(*Selfconjugate*)
	selfconjugateType= SelfConjugateClassQ@ Flatten@ fieldTypes;
	selfConjugate= !FreeQ[OperatorBar@ op, First@ opIDpattern];
	conjFieldExchange= If[selfconjugateType, FindPermutationOrder[fieldTypes, Conj@ fieldTypes], {}];
	conjIndExchange= If[selfConjugate,
			FindPermutationOrder@@ Cases[{op, OperatorBar@ op}/. opIDpattern, AtomicOp[__, inds_]-> inds, All]
		,
			(*For selfconjugate-type operators, the permutation order can only be found once the conjugate operator has been added.
			This information is then added after the fact.*)
			{}
		];

	<|
		AtomicOpExpansionPattern-> reexpPattern,
		ConjugateFieldExchange-> conjFieldExchange,
		ConjugateIndexExchange-> conjIndExchange,
		ID-> {opClass, opID},
		IndexGrouping-> indexGrouping,
		IndexType-> indexTypes,
		InequivalentPermutations-> equivClasses,
		OperatorMatchingPattern-> opIDpattern,
		SelfConjugate-> selfConjugate,
		SelfconjugateType-> selfconjugateType,
		Score-> OpScore[op, selfConjugate],
		Symmetries-> symmetries
	|>
]


(* ::Text:: *)
(*Gives the conjugate index permutation of an operator (may be inferrable from the properties in $operators now)*)


OpConjFlavorPermutation@ op_Operator:= Module[{},
	FindPermutationOrder@@ Cases[MatchOperatorPatterns@ {op, OperatorBar@ op}, AtomicOp[__, inds_]-> inds, All]
]


(* ::Subsubsection::Closed:: *)
(*Kinetic term *)


(* ::Text:: *)
(*Tests if an Operator is a canonical kinetic term*)


KineticOpQ= MatchQ[Alternatives[
		(*HoldPattern@ Operator[Bar@Field[_, Scalar, _, {\[Mu]_}], Field[_, Scalar, _, {\[Mu]_}]],
		HoldPattern@ Operator[Field[_, Scalar, _, {\[Mu]_}], Field[_, Scalar, _, {\[Mu]_}]],*)
		(*Scalars*)
		HoldPattern@ Operator[Bar@Field[_, Scalar, _, {}], EoM@ Field[_, Scalar, _, {}]],
		HoldPattern@ Operator[Field[_, Scalar, _, {}], EoM@ Field[_, Scalar, _, {}]],
		(*Fermions*)
		HoldPattern@ Operator[Bar@ Field[_, Fermion, _, {}]** EoM@ Field[_, Fermion, _, {}] ],
		HoldPattern@ Operator[Bar@ Field[_, Fermion, _, {}]** DiracProduct@ _Proj**
			EoM@ Field[_, Fermion, _, {}] ],
		HoldPattern@ Operator[Transp@ Field[_, Fermion, _, {}]** DiracProduct[GammaCC]** EoM@ Field[_, Fermion, _, {}] ],
		HoldPattern@ Operator[Transp@ Field[_, Fermion, _, {}]** DiracProduct[GammaCC, _Proj]**
			EoM@ Field[_, Fermion, _, {}] ],
		(*Vectors*)
		HoldPattern@ Operator[FieldStrength[_, {\[Mu]_, \[Nu]_}, {a_}, {}],
			FieldStrength[_, {\[Mu]_, \[Nu]_}, {a_}, {}]],
		HoldPattern@ Operator[Bar@ FieldStrength[_, {\[Mu]_, \[Nu]_}, {a_}, {}],
			FieldStrength[_, {\[Mu]_, \[Nu]_}, {a_}, {}]]
		] ];


(* ::Subsubsection::Closed:: *)
(*Operator Type*)


(* ::Text:: *)
(*Head for denoting Conjugate field type*)


Conj@ Conj@ f_:= f;
Conj@ l_List:= Conj/@ l;


(* ::Text:: *)
(*Operator class discriminator *)


OperatorClass@ op_Operator:= Module[{fields, temp,
		devs= 0, gaugeFields= List@@ Query[All, Key@ Field]@ $GaugeGroups},
	devs+= Plus@@ Cases[op, EoM@ (Bar|Transp)@ Field[_, type_, __]:> EOMDevs@ type, All];
	devs+= Plus@@ Cases[op, EoM@ Transp@ Bar@ Field[_, Fermion, __]:> EOMDevs@ Fermion, All];
	devs+= Plus@@ Cases[op, EoM@ Field[_, type_, __]:> EOMDevs@ type, All];
	devs+= Plus@@ Cases[op, FieldStrength[___, linds_]:>
		1+ Length@ linds, All];
	devs+= Plus@@ Cases[op, Field[___, linds_]:> Length@ linds, All];

	temp= op/. EoM-> Identity/. FieldStrength[lab_, inds_, rest__]:> Field[lab, Vector@ First@ inds, rest];
	devs+= Plus@@ Cases[temp, Field[lab_, _Vector, __]/; MemberQ[gaugeFields, lab]-> 1, All];
	temp= DeleteCases[temp, Field[lab_, _Vector, __]/; MemberQ[gaugeFields, lab], All];

	fields= Cases[temp, Bar@ Field[lab_, (Scalar|Fermion|_Vector),__]:> Conj@ lab, All];
	temp= DeleteCases[temp, Bar@ Field[_, (Scalar|Fermion|_Vector),__], All];
	fields= Join[fields, Cases[temp, Field[lab_, (Scalar|Fermion|_Vector),__]:> lab, All]];
	{Sort@ fields, devs}
];
EOMDevs[type_]:= Switch[type, Scalar, 2, Fermion, 1, _Vector, 2];


(* ::Text:: *)
(*Returns an ordered list of field types and corresponding flavor indices *)


OperatorFieldsAndFlavors@ op_Operator:= Module[{fields, flavorReps= Keys@ $FlavorIndices, temp= op},
	fields= Cases[temp, Bar@ Field[lab_, _, inds_, _]:>
		{Conj@ lab, Cases[inds, Index[_, rep_/; MemberQ[flavorReps, rep]] ]}, All];
	temp= DeleteCases[temp, Bar@ Field[_, _,__], All];
	fields= Join[fields,
		Cases[temp, Field[lab_, _, inds_, _]:>
			{lab, Cases[inds, Index[_, rep_/; MemberQ[flavorReps, rep]] ]}, All] ];
	GatherBy[SortBy[fields, First], First]
]


(* ::Subsubsection::Closed:: *)
(*Operator ranking*)


(* ::Text:: *)
(*Ranks operators by preference (higher is more preferable)*)


OpScore::unexp= "OpScore received unexpected argument `1`"


OpScore[op_Operator, selfConj_]:= Module[{score= 0, inds},
	(*Check for canonical kinetic term*)
	If[KineticOpQ@ op, Return@ 200];

	(*EoMs can be removed by field redefinitions and any EoM should always be included in the basis*)
	score+= 100 Count[op, _EoM, Infinity];
	(*Field strength tensors are preferable to more derivatives*)
	score+= 1 Count[op, _FieldStrength, Infinity];
	(*Penalize unrefined Dirac structures*)
	score+= -.5 Count[op, DiracProduct[___, _GammaM, _GammaM, ___], Infinity];
	score+= -.5 Count[op, DiracProduct[___, Transp@ _GammaM, Transp@ _GammaM, ___], Infinity];
	(*Penalize non-ordered CDs*)
	score+= -.1 Count[op, Field[__, {___, a_, __, a_, ___}], Infinity];
	(*Penalize CGs with derivative fields*)
	score+= -.01 If[(inds=Cases[op,CG[_gen,i_]:>i])=!={},
					Total[(Length@(Flatten@Join[Cases[op,(Bar@Field[_,_,fb_,gb_]/;MemberQ[fb,#[[2]]]):>gb],
												Cases[op,(Field[_,_,f_,g_]/;MemberQ[f,Bar@#[[3]]]):>g]]))
								 &/@inds],
					0];
	(*Penalize CGs*)
	score+= -.1 Count[op, CG[_eps|Bar@_eps, _], Infinity];
	(*Preferance of self-conjugate operators*)
	If[selfConj, score+= .05];
	(*Score for different combinations of fermions bilinears*)
	score+= FierzScore[op];

	score
]


OpScore@ x_:= (Message[OpScore::unexp, x]; Abort[];);


(* ::Subsection:: *)
(*Match all operators in an expression to patterns  *)


(* ::Subsubsection::Closed:: *)
(*Search expression*)


(* ::Text:: *)
(*Substitutes all operators in an expression with AtomicOp objects for further manipulations  *)


Options@ MatchOperatorPatterns= {ResetIdentities-> {dDimensional, FourDimensional, Evanescent}};


MatchOperatorPatterns[expr_, OptionsPattern[]]:= Module[{class, classes, ops, out, terms},
	(*Separate out flavor index contractions within each operator*)
	out= Operator/@ TermsToList@ expr;
	out= out/. op_Operator:> OperatorFlavorSeparate@ op;

	(*Groups all un-matched operators in expression*)
	classes= GroupBy[out, FirstCase[#, op_Operator:> OperatorClass@ op, {}, All]& ];

	(*Considering operator classes individually, the replacements are better targeted, which speeds up performance*)
	Sum[Catch[
		If[class === {}, (*Constants are kept unchanged*)
			Throw[Plus@@ classes@ class];
		];
		ops= Cases[classes@ class, _Operator, All];
		(*Construct new patterns out of any new operators encounterd in the sets*)
		MakeNewOperatorPatterns[class, ops, OptionValue@ ResetIdentities];

		Plus@@ classes@ class/. OpToAtomicReplacementPattern@ class
	], {class, Keys@ classes}]

];


(* ::Text:: *)
(*Separates flavor contracted indices within an operator to extract a delta*)


OperatorFlavorSeparate@ op_Operator:= Module[{flavInds, deltas, out= op},
	(*Find all internally contracted flavor indices*)
	flavInds= DeleteCases[ContractedIndices@ op,
		Index[_, type_/; !MemberQ[Keys@ $FlavorIndices, type]] ];

	(*Extract a delta for every contraction*)
	deltas= Delta[#, MapAt[Unique, #, 1]]& /@ flavInds;
	Do[
		out= ReplaceFirst[out,  replacement]
	, {replacement, Rule@@@ deltas}];
	out Times@@ deltas
];


(* ::Text:: *)
(*For matching patterns in IBP identities*)
(*identityTypeResets is a subset of {dDimensional, FourDimensional, Evanescent}*)


MatchOperatorPatternsInIdentities[opClass_, identities_List, identityTypeResets_List]:= Module[
		{len, newOps, ops, out, temp},
	out= Operator@ identities;

	(*Speed up replacements by first substituting in dummy symbols for each unique operator*)
	ops= DeleteDuplicates@ Cases[out, _Operator, All];
	ops= MapIndexed[Rule[#1, temp@@ #2]&, ops];
	out= out/. ops;
	
	(*Make replacements of dummies with atomic operators that are already known*)
	ops= ops[[;;, {2, 1}]]/. OpToAtomicReplacementPattern@ opClass;
	len= Length@ $operators[opClass];
	
	(*Construct new patterns out of any new operators encounterd*)
	newOps= Cases[ops, _Operator, All];
	MakeNewOperatorPatterns[opClass, newOps, identityTypeResets];
	
	(*Make replacements of the final dummies with the new replacement patterns*)
	ops= ops/. OpToAtomicReplacementPattern[opClass][[len+1;;]];
	
	out/.ops
];


(* ::Subsubsection::Closed:: *)
(*Creates new operator classes*)


(* ::Text:: *)
(*Makes new pattern rules for a list of operators of a given type.*)
(*resetIdentities is a subset of {dDimensional, Evanescent, FourDimensional}*)


MakeNewOperatorPatterns::outofsync= "Operator Class `1` and its conjugate is out of sync."


MakeNewOperatorPatterns[opClass_, opList_List, resetIdentities_List]:= Module[{conjOpClass, identifiers, newOps, nextID, op, perm,
		opBar, classAssociation, classAssociationConj, pat, notSelfConjugateClass, sign, remainingOps= opList, props, propsConj},
	(*Find patterns for the previously encountered operators*)
	classAssociation= Lookup[$operators, Key@ opClass, <||>];

	(*Remove operators that have already been added to $operators*)
	(*This has much better performance in some cases than the equivalent DeleteCases*)
	If[Length@ classAssociation =!= 0,
		remainingOps= Cases[DeleteDuplicates@ remainingOps/. OpToAtomicReplacementPattern[opClass], _Operator];
		If[Length@ remainingOps === 0, Return[];];
	];

	(*Check class is syncronized with its conjugate*)
	If[(notSelfConjugateClass= !SelfConjugateClassQ@ opClass),
		classAssociationConj= Lookup[$operators, Key[conjOpClass= OpClassConjugate@ opClass], <||>];
		If[Length@ classAssociation =!= Length@ classAssociationConj,
			Message[MakeNewOperatorPatterns::outofsync, opClass];
		];
	];

	(*Loops through the unidentitfied operators, creating new patterns for them*)
	nextID= Length@ classAssociation+ 1; pat= Alternatives[];
	newOps= Association@@ Reap[Do[
			If[MatchQ[pat]@ op, Continue[]; ];
			props= OperatorProperties[opClass, nextID, op];
			AppendTo[pat, First@ props@ OperatorMatchingPattern];
			opBar= OperatorBar@ op; (*May be +/- the Bar operator*)
			{sign, opBar}= Switch[opBar, _Operator, {+1, opBar}, Times[-1, _Operator], {-1, -opBar}];
			props@ ConjSign= sign;
			(*If valid, appends the conjugate operator to the conjugate class*)
			Which[notSelfConjugateClass,
				classAssociationConj[nextID]=
					OperatorProperties[conjOpClass, nextID, opBar];
				classAssociationConj[nextID, ConjSign]= sign;

				Sow[nextID++-> props];
			,!props@ SelfConjugate, (*Otherwise ensure the conjugate operator is added to present class*)
				propsConj= OperatorProperties[opClass, nextID+1, opBar];
				propsConj[ConjSign]= sign;
				AppendTo[pat, First@ propsConj@ OperatorMatchingPattern];

				(*Rectify the conjugate permutation order between the operator and its conjugate*)
				perm= FindPermutationOrder@@ Cases[{op/. props@ OperatorMatchingPattern, opBar/. propsConj@ OperatorMatchingPattern},
					AtomicOp[__, inds_]-> inds, All];
				props@ ConjugateIndexExchange= perm;
				propsConj@ ConjugateIndexExchange= InversePermutationOrder@ perm;

				Sow[nextID++-> props];
				Sow[nextID++-> propsConj];
			,True,
				Sow[nextID++-> props];
			];
		, {op, remainingOps}]][[2, 1]];

	(*Add the conjugate operators*)
	If[notSelfConjugateClass,
		$operators@ conjOpClass= classAssociationConj;
	];

	$operators@ opClass= classAssociation~ Join~ newOps;

	(*Reset simplification identities*)
	UnsetHermitianIdentities[opClass, Alternatives@@ resetIdentities];
];


(* ::Subsubsection::Closed:: *)
(*Conversion function*)


ToAtomicForm[expr_]:= MatchOperatorPatterns[expr];


(* ::Subsection:: *)
(*Replacement rules*)


(* ::Subsubsection::Closed:: *)
(*Replacement patterns *)


(* ::Text:: *)
(*Collect all patterns for substituting Operator objects for AtomicOp objects*)


OpToAtomicReplacementPattern[]:= Block[{},
	Flatten@ Apply[List, Query[All, All, Key@ OperatorMatchingPattern]@ $operators, {0, 1}]
]
OpToAtomicReplacementPattern[opType_]:= Block[{},
	Flatten@ Apply[List, Query[{Key@ opType}, All, Key@ OperatorMatchingPattern]@ $operators, {0, 1}]
]


(* ::Text:: *)
(*Collect all patterns for substituting AtomicOp objects back to Operator objects*)


AtomicToOpReplacementPattern[]:= Block[{},
	Flatten@ Apply[List, Query[All, All, Key@ AtomicOpExpansionPattern]@ $operators, {0, 1}]
]
AtomicToOpReplacementPattern[opType_]:= Block[{},
	Flatten@ Apply[List, Query[{Key@ opType}, All, Key@ AtomicOpExpansionPattern]@ $operators, {0, 1}]
]


(* ::Subsubsection::Closed:: *)
(*Operator Canonization*)


(* ::Text:: *)
(*Returns the signed canonical form of an AtomicOp with the given open indices, using the obvious symmetries of the operator*)


CanonizeAtomicOp@ AtomicOp[opClass_, opID_, inds_]:= Block[{perms},
	perms= $operators[opClass, opID, Symmetries];
	perms= FirstElementBy[inds[[First@ #]]-> Last@ #&/@ perms, First];
	Last@ perms AtomicOp[opClass, opID, First@ perms]
]
CanonizeAtomicOp@ expr_:= expr/. op_AtomicOp:> CanonizeAtomicOp@ op;


(* ::Subsubsection::Closed:: *)
(*Canonize flavor indices in expression*)


(* ::Text:: *)
(*Ensure that the AtomicOp/CompOp object in each terms of an expression carries canonical indices*)


ExprFlavorCanonize@ expr:HoldPattern@ Times[couplings__?(FreeQ[Operator]), op:((AtomicOp|CompOp)[__, inds_])]:= Block[
		{indReplace= Thread@ Rule[inds, ConstructDummyIndices@ inds[[;;, 2]]]},
	If[OpenIndicesQ@ expr, Return@ expr];
	RelabelIndices[RelabelIndices[Times@ couplings, Unique-> True]/. indReplace] (op/. indReplace)
];
ExprFlavorCanonize@ expr_:= Block[{out=BetterExpand@ expr},
	If[Head@ out === Plus, ExprFlavorCanonize/@ out, out]
];


(* ::Text:: *)
(*Checks if there are open indices in a single term (assumes that there is no sum over terms)*)


OpenIndicesQ@ expression_:= Block[{expr= PseudoTimes@ expression, list},
	expr = expr /. $DropDiagonalCouplings; (* We need to remove open indices *)
	list = Tally[Cases[expr, _Index, All]];
	Length@ Cases[list, {x_, 1}] > 0
]


(* ::Subsubsection::Closed:: *)
(*Expand all operators from AtomicOp/CompOp to Operator Form*)


(* ::Text:: *)
(*Puts AomicOp and CompOp on Operator form*)


AtomicToOperatorForm[expr_]:= Module[{class, out, reductionType, terms},
	(*The expression may be collected by operators, so we don't want to expand*)
	terms= If[Head@ expr === Plus, List@@ expr, {expr}];

	(*Consider adding a check that no terms has multiple operators, e.g., from nested collection*)

	(*Group terms by operator class*)
	terms= GroupBy[terms,
		FirstCase[#, AtomicOp[class_, __] | CompOp[_, class_, __] :> class, {}, All]& ];

	reductionType= FirstCase[expr, CompOp[redType_, __]:> redType, dDimensional, All];

	(*Perform the replacements by operator class for performance*)
	out= Sum[Catch[
			If[class === {}, (*Constants are kept unchanged*)
				Throw[Plus@@ terms@ class];
			];
			Plus@@ terms@ class/.
				Flatten@ Apply[List, Query[All, Key@ CompOpReplacement]@
					Lookup[$compoundOperators@ reductionType, Key@ class, <||>]]/.
				AtomicToOpReplacementPattern@ class
		], {class, Keys@ terms}];

	out
]


AtomicToNormalForm[expr_]:=OperatorToNormalForm[AtomicToOperatorForm@ expr,CanonizeKinetic->True];


(*Options@ OpsToFieldForm= {NormalForm-> True};*)


(*OpsToFieldForm[expr_, OptionsPattern[]]:= Module[{class, out, reductionType, terms},
	(*The expression may be collected by operators, so we don't want to expand*)
	terms= If[Head@ expr === Plus, List@@ expr, {expr}];

	(*Consider adding a check that no terms has multiple operators, e.g., from nested collection*)

	(*Group terms by operator class*)
	terms= GroupBy[terms,
		FirstCase[#, AtomicOp[class_, __] | CompOp[_, class_, __] :> class, {}, All]& ];

	reductionType= FirstCase[expr, CompOp[redType_, __]-> redType, dDimensional, All];

	(*Perform the replacements by operator class for performance*)
	out= Sum[Catch[
			If[class === {}, (*Constants are kept unchanged*)
				Throw[Plus@@ terms@ class];
			];
			Plus@@ terms@ class/.
				Flatten@ Apply[List, Query[All, Key@ CompOpReplacement]@
					Lookup[$compoundOperators@ reductionType, Key@ class, <||>]]/.
				AtomicToOpReplacementPattern@ class
		], {class, Keys@ terms}];

	If[OptionValue@ NormalForm, out /. op_Operator :> NormalForm[op, Unique-> False], out]
]*)


(* ::Subsection:: *)
(*Compound operators *)


(* ::Subsubsection::Closed:: *)
(*Construct relevant compound operators for a class *)


(* ::Text:: *)
(*Constructs all compound operators for an operator class and updates the global association for class *)


ConstructCompoundBasis[reductionType_, opClass_, opsToSymmetrize_]:= Module[{atomicOperators, compoundOperators, indexPattern, symmetryReps},
	If[KineticOpClassQ@ opClass,
		$compoundOperators[reductionType, opClass]= <||>;
		Return[];
	];
	atomicOperators= List@@ $operators@ opClass;

	compoundOperators= Join@@ MapIndexed[ConstructCompoundsForOp[#1, MemberQ[opsToSymmetrize, First@ #2]]&,
		atomicOperators];
	(*Remove duplicates (from H.c.) *)
	compoundOperators= DeleteDuplicatesBy[compoundOperators, First@ Sort@ {#, -#}& @*First];

	indexPattern= ConstructDummyIndices@ First[atomicOperators]@ IndexType;
	indexPattern= Index[Pattern[Evaluate@ First@ #, Blank[]], Last@ #]&/@ indexPattern;

	(*Save compounds in association*)
	$compoundOperators[reductionType, opClass]= Association@@
		MapIndexed[(First@ #2->
			Append[Last@ #1, CompOpReplacement-> (CompOp[reductionType, opClass, First@ #2, indexPattern]-> First@ #1)]&),
		compoundOperators];
]


(* ::Text:: *)
(*Determine if operator is of the Kinetic term class *)


KineticOpClassQ@ {{f1_, Conj@ f2_Symbol| f2_Symbol}, n_}:=
	Switch[List@@ Query[{Key@ f1, Key@ f2}, Key@ Type]@ $FieldAssociation
	,{Fermion..},
		MatchQ[n, 1]
	,{Scalar..},
		MatchQ[n, 2]
	]
KineticOpClassQ@ _:= False;


(* ::Subsubsection::Closed:: *)
(*Construct compounds from atomic operator*)


(* ::Text:: *)
(*Determine all relevant symmetrizations and/or (anti-)Hermitian combinations involving the operator, i.e., the compoundOperators*)


ConstructCompoundsForOp[opProperties_, flavorSymmetrization_]:= Block[{dummyInds, conjIndexOrder, conjIndexRplacement,
		conjugated, indexSyms, indexSymsFull, inequivPerms, n, pos, sym, symmetryCombinations, temp},

	If[(!opProperties@ SelfconjugateType || opProperties@ SelfConjugate)&& !flavorSymmetrization,
		Return@ {};
	];
	(*All flavor permutations of the original operator*)
	inequivPerms= Flatten/@ Tuples[Permutations/@ opProperties@ IndexGrouping];

	If[flavorSymmetrization,
		(*Find all relevant symmetrization of the flavor indices in the operator*)
		indexSymsFull= Tuples[FlavorSymmetryReps/@ opProperties[IndexGrouping]];
		(*Expand out the symmetrized indices*)
		indexSymsFull= Map[Map[Join@@ #[[;;, 1]]-> Times@@ #[[;;, 2]]& ]@* Tuples,
			ExpandSymmetrization@ indexSymsFull];

		(*Normalize symmetries*)
		indexSyms= Function[{perm}, MapAt[#/ Length@ perm&, perm, {All, 2}]]/@ indexSymsFull;
		(*Canonically sort indices in each term by the symmetries of the Op*)
		indexSyms= Outer[(Part[First@ #1, First@ #2]-> Last@#1 Last@#2&),
			indexSyms, opProperties@ Symmetries];
		indexSyms= Map[FirstElementBy[First], indexSyms, {2}];
		(*Combine identical elements*)
		indexSyms= DeleteCases[Normal@ Map[Merge[Total], indexSyms, {1}], Rule[_, 0], {2}];
		pos= Flatten@ Position[indexSyms, {__}, {1}];
		indexSymsFull= indexSymsFull[[pos]];
		indexSyms= indexSyms[[pos]];

		(*Expand with the herited symmetries from the parent operator*)
		indexSymsFull= MergeSymmetries[opProperties@ Symmetries, #]&/@ indexSymsFull;
	,
		indexSymsFull= {opProperties@ Symmetries};
		indexSyms= {{indexSymsFull[[1, 1]]}};
	];

	(*Construct operator form*)
	dummyInds= ConstructDummyIndices@ opProperties@ IndexType;
	symmetryCombinations= Plus@@@ Apply[#2* AtomicOp[Sequence@@ opProperties@ ID, dummyInds[[#1]]]&, indexSyms, {2}];

	(*Return the operator is not self-conjuagte type, we don't need to Hermitianize it*)
	If[!opProperties@ SelfconjugateType,
		(*Determine the unique flavor permutations, i.e., those that are not redundant by symmetry*)
		inequivPerms= Map[Sort, Transpose@ Outer[Part, inequivPerms, indexSymsFull[[;;, ;;, 1]], 1, 2], {2}];
		inequivPerms= DeleteDuplicates/@ inequivPerms[[;;, ;;, 1]];
		{#[[1]], <|
			InequivalentPermutations-> #[[3]],
			Score-> opProperties@ Score +.01,
			SelfConjugate-> False,
			Symmetries-> #[[2]]
		|>}&/@ Transpose@ {symmetryCombinations, indexSymsFull, inequivPerms}// Return;
	];

	(*Construct complex-conjugated version of the operators in hcCombinations*)
	conjugated= Bar[AtomicOp[Sequence@@ opProperties@ ID, dummyInds]/. AtomicToOpReplacementPattern@ First@ opProperties@ ID]/.
		Bar@ op_Operator:> OperatorBar@ op/. OpToAtomicReplacementPattern@ First@ opProperties@ ID;
	conjugated= Replace[conjugated, {Times[_, atom_AtomicOp]:> atom, atom_AtomicOp:> atom}];
	conjIndexRplacement= Thread@ Rule[Last@ conjugated, dummyInds];
	conjIndexOrder= FindPermutationOrder[Last@ conjugated, dummyInds];

	If[conjIndexOrder === Range@ Length@ dummyInds && conjugated[[2]] === Last@ opProperties@ ID,
		(*Operator is real: No need to Hermitianize operator*)
		symmetryCombinations= List/@ symmetryCombinations;
	,
		(*Construct the conjugated of the operator, with the proper index-permutations*)
		conjugated= Bar[symmetryCombinations/. AtomicToOpReplacementPattern@ First@ opProperties@ ID]/.
			Bar@ op_Operator:> OperatorBar@ op/. OpToAtomicReplacementPattern@ First@ opProperties@ ID/.
			conjIndexRplacement;
		symmetryCombinations= Table[
				CanonizeAtomicOp@ Replace[symmetryCombinations[[n]] + {1, -1}* conjugated[[n]],
					{___, 0, ___}-> {symmetryCombinations[[n]]}]
			, {n, Length@ symmetryCombinations}];

		(*Keep only the flavor symmetries of both the op and its h.c. part*)
		indexSymsFull= Table[
			temp= sym;
			temp[[;;, 1]]= conjIndexOrder[[#[[conjIndexOrder]] ]]&/@ temp[[;;, 1]];
			Intersection[temp, sym]
		, {sym, indexSymsFull}];
	];

	(*Determine the unique flavor permutations, i.e., those that are not redundant by symmetry*)
	inequivPerms= Map[Sort, Transpose@ Outer[Part, inequivPerms, indexSymsFull[[;;, ;;, 1]], 1, 2], {2}];
	inequivPerms= DeleteDuplicates/@ inequivPerms[[;;, ;;, 1]];
	(*Return the compunds*)
	Join@@ Table[
		{symmetryCombinations[[m, n]], <|
			InequivalentPermutations-> inequivPerms[[m]],
			Score-> opProperties@ Score + (3-n)* .01, (*Prioritze Hermitian over anti-Hermitian combinations*)
			SelfConjugate-> Power[-1, n+1],
			Symmetries-> indexSymsFull[[m]]
		|>}
	, {m, Length@ symmetryCombinations}, {n, Length@ symmetryCombinations[[m]]}]
]


(* ::Text:: *)
(*Flavor symmetries: *)
(*To be expanded with multi-index representations *)


(*FlavorSymmetryReps@ inds_List:= Symmetrization[inds, #]&/@ IntegerPartitions@ Length@ inds;*)
FlavorSymmetryReps@ {}:= {Symmetrization[{}, {}]}
FlavorSymmetryReps@ {ind_}:= {Symmetrization[{ind}, {1}]};
FlavorSymmetryReps@ {i1_, i2_}:= {Symmetrization[{i1, i2}, {2}], Symmetrization[{i1, i2}, {1, 1}]};
FlavorSymmetryReps@ inds_List:= {Symmetrization[inds, {}]};


(*To be generalized*)
ExpandSymmetrization@ expr_:= expr/. {
		Symmetrization[inds_, {}]:> {Flatten@ inds-> 1},
		Symmetrization[inds_, {1}]:> {Flatten@ inds-> 1},
		Symmetrization[{inds1_, inds2_}, {2}]:> {Flatten@ {inds1, inds2}-> 1, Flatten@ {inds2, inds1}-> 1},
		Symmetrization[{inds1_, inds2_}, {1, 1}]:> {Flatten@ {inds1, inds2}-> 1, Flatten@ {inds2, inds1}-> -1}
	}


MergeSymmetries::incmp= "The symmetries are incompatible.";
MergeSymmetries[sym1_, sym2_]:= Module[{newSym},
	newSym= DeleteDuplicates@ Flatten@ Outer[#1[[1, #2[[1]]]]-> #1[[2]]* #2[[2]]&, sym1, sym2];
	If[!DuplicateFreeQ[First/@ newSym], Message[MergeSymmetries::incmp]; Abort[]; ];
	newSym
];


(* ::Subsubsection::Closed:: *)
(*Construct compound basis*)


ConstructConjugateCompounds[reductionType_, opClass_]:= Block[{},
	$compoundOperators[reductionType, OpClassConjugate@ opClass]=
		Association@@ KeyValueMap[#1->
			 ConjugateCompound[reductionType, opClass, #1, #2]&, $compoundOperators[reductionType, opClass]];
]


(* ::Text:: *)
(*Constructs the conjugate compound operator from a compound operator*)


ConjugateCompound[reductionType_, opClass_, compID_, compProps_]:= Module[{atomicID, compReplacement,
		dummies, indPermutation},
	(*Determines the atomic operator ID used in the definition
	(NB. there is only one atomicID for compounds of a complex class)*)
	{atomicID, dummies}= FirstCase[compProps@ CompOpReplacement,
		AtomicOp[_, id_, inds_]:> {id, ConstructDummyIndices@ inds[[;;, 2]]},
		0, Infinity];
	(*Determines the index permutation associated with the conjugation of the operator*)
	indPermutation= FindPermutationOrder[dummies,
			FirstCase[{OperatorBar[AtomicOp[opClass, atomicID, dummies]/. AtomicToOpReplacementPattern@ opClass]/.
				OpToAtomicReplacementPattern@ OpClassConjugate@ opClass}, AtomicOp[__, inds_]:> inds, {}, All]
		];

	(*Adjust the indices and operatorIDs used in the conjugate compound operator*)
	$compoundOperators[reductionType, opClass, compID, ConjugateIndexPermutation]= indPermutation;
	<|
		Symmetries->
			MapAt[Ordering[indPermutation][[#[[indPermutation]]]]&, compProps@ Symmetries, {All, 1}],
		Score-> compProps@ Score,
		SelfConjugate-> False,
		CompOpReplacement-> compProps@ CompOpReplacement/.{
			CompOp[__, indPats_]:> CompOp[reductionType, OpClassConjugate@ opClass, compID, indPats[[indPermutation]]],
			AtomicOp[__, inds_]:> $operators[opClass, atomicID, ConjSign]*
				AtomicOp[OpClassConjugate@ opClass, atomicID, inds[[indPermutation]]]
		},
		ConjugateIndexPermutation-> Ordering@ indPermutation
	|>
]


(* ::Subsection:: *)
(*Manipulate expression *)


(* ::Subsubsection::Closed:: *)
(*Separate out constants *)


(* ::Text:: *)
(*Splits constants off from a Lagrangian. *)
(*	Return: {constants, remaining expression}*)


SeparateOutConstants@ expr_:= Module[{consts, remainder},
	consts= Last[Last@ Reap[
		remainder= Replace[expr,
			a_/;FreeQ[a, _Field| _FieldStrength, All]:> (Sow[a]; 0),
			If[Head@ expr === Plus, 1, 0] ]
	],{}];
	{Plus@@ consts, remainder}
]


(* ::Subsubsection::Closed:: *)
(*Collect atomic operators in expr*)


(* ::Text:: *)
(*Collects all identical operators in an expression to the same form *)


Options@ CollectOperators= {NormalForm-> True};


CollectOperators[arg_, OptionsPattern[]]:= Block[{expr=HcExpand@BetterExpand[arg], out, consts},
	(*subtract off constants*)
	If[FreeQ[expr, _Field| _FieldStrength, All], Return[expr]];
	{consts, expr}= SeparateOutConstants@ expr;

	LagrangianLikeCheck@ expr;

	out= MatchOperatorPatterns@ expr;

	out= CollectCoefficientsWithSyms@ ExprFlavorCanonize@ out;

	out=out/. AtomicToOpReplacementPattern[];

	If[OptionValue@ NormalForm, out=OperatorToNormalForm[out,CanonizeKinetic->True],out] + consts
];


(* ::Subsubsection::Closed:: *)
(*Collect atomic operators in expr [internal version without contracting overall flavor deltas back into the operator]*)


(* ::Text:: *)
(*Collects all identical operators in an expression to the same form *)


CollectOperatorsWithGenricFlavorStructure[arg_]:= Block[{expr=HcExpand@BetterExpand[arg], out, consts},
	(*subtract off constants*)
	If[FreeQ[expr, _Field| _FieldStrength, All], Return[expr]];
	{consts, expr}= SeparateOutConstants@ expr;

	LagrangianLikeCheck@ expr;

	out= MatchOperatorPatterns@ expr;

	out= CollectCoefficientsWithSyms[ExprFlavorCanonize@out, "ContractOverallDelta" -> False];

	out=out/. AtomicToOpReplacementPattern[];

	If[OptionValue@ NormalForm, out=OperatorToNormalForm[out,CanonizeKinetic->True],out] + consts
];


(* ::Subsubsection::Closed:: *)
(*Extract operator class*)


(* ::Text:: *)
(*Extract all operators of a certain class from an expression*)


SelectOperatorClass::args= "SelectOperatorClass[expr, fields, devNo] takes three arguments.";


SetAttributes[SelectOperatorClass, HoldAll];

SelectOperatorClass[expr_ /; MemberQ[expr, _HcTerms],fields_,devs_] := SelectOperatorClass[ HcExpand @ expr , fields, devs];

SelectOperatorClass[arg_, fields_, devs_]:= Block[{gaugeFields, matterFields, out, opType, conjType, FSCount, FSPower, pw, derivatives, expr=arg, consts, \[Psi]irrelevant },
	(* First, set all fields not appearing in fields_ to zero, for better performance *)
	\[Psi]irrelevant= Alternatives@@ Complement[
		DeleteDuplicates@Cases[expr, (Field[label_,___]|FieldStrength[label_,___]):>label, All],
		DeleteDuplicates[fields/.Bar->Identity]
	];
	(* FS also count as derivatives here *)
	If[devs>1,
		expr= expr/.{Field[\[Psi]irrelevant,___]->0}
	,
		expr= expr/.{Field[\[Psi]irrelevant,___]->0, FieldStrength[\[Psi]irrelevant,___]->0}
	];


	(* subtract off constants *)
	If[FreeQ[expr,_Field,All]&&FreeQ[expr,_FieldStrength,All], Return[expr]];
	expr=HcExpand@BetterExpand@expr;
	consts= Last[Last@Reap[
		expr= Replace[
			expr,
			a_/;(FreeQ[a,_Field,All]&&FreeQ[a,_FieldStrength,All]):>(Sow[a]; 0),
			If[Head@expr===Plus,1,0]
		]
	],{}];

	LagrangianLikeCheck@ expr;

	opType= Hold@ fields/. Bar-> Conj// ReleaseHold;
	MatterFieldListCheck@ opType;
	DevNoCheck@ devs;

	gaugeFields= List@@ Query[All, Key@ Field]@ $GaugeGroups;
	FSPower=Product[pw[gLabel]^Count[opType, gLabel], {gLabel, gaugeFields}];
	FSCount=2 Sum[Count[opType, gLabel], {gLabel, gaugeFields}];
	opType=DeleteCases[opType, Alternatives@@ gaugeFields];
	derivatives=devs+Total@FSCount;

	opType= {Sort@ opType, derivatives};
	conjType= OpClassConjugate@ opType;
	out= MatchOperatorPatterns@ expr;
	out= out/. AtomicOp[class_, _, _]/; !MatchQ[class, opType|conjType]-> 0;
	out= CollectCoefficients@ ExprFlavorCanonize@ out/. AtomicToOpReplacementPattern[];
	out= If[FSPower===1, out, Coefficient[out/.FieldStrength[label_,rest___]:>pw[label] FieldStrength[label,rest], FSPower]/._pw:>0];
	out= (*NormalForm[out, Unique-> False]*)OperatorToNormalForm[out,CanonizeKinetic->True]
]


SelectOperatorClass@ ___:= (Message[SelectOperatorClass::args]; Abort[];);


General::devNo= "`1` is not a valid number of derivatives. A non-negative integer is expected.";
General::fields= "`1` is not a valid list of matter fields. A list of matter field labels (allowing for Bar) is expected.";


MatterFieldListCheck@ fields_:= Block[{matterFields},
	matterFields= Keys@ Query[Select[(MatchQ[#[Type], Scalar|Fermion|Vector]&)]]@ $FieldAssociation;
	If[!MatchQ[fields, f_List /; SubsetQ[matterFields, f/. Conj-> Identity]],
		Message[General::fields, fields];
		Abort[];
	];
]


DevNoCheck@ devs_:=
	If[!MatchQ[devs, _Integer? NonNegative],
		Message[General::devNo, devs];
		Abort[];
	];



(* ::Subsubsection::Closed:: *)
(*GetOperatorCoefficient*)


(* ::Text:: *)
(*Function the extracts the coefficients of an operator matching exactly the form specified*)


GetOperatorCoefficient::unkwnop= "`1` is not regonized as an operator";


GetOperatorCoefficient[lagrangian_, operator_]:= Module[{expr, atomOp, preFact, class, id},
	(*Cast to atomic operators to compare operators*)
	atomOp= MatchOperatorPatterns@ operator;
	Switch[atomOp
	,_AtomicOp,
		preFact= 1;
	,Times[_? NumberQ, _AtomicOp],
		{preFact, atomOp}= Replace[atomOp, Times[x_, a_AtomicOp]:> {1/x, a}];
	,_,
		Message[GetOperatorCoefficient::unkwnop, operator];
		Abort[];
	];
	{class, id}= Replace[atomOp, AtomicOp[c_, i_, _]:> {c, i}];

	expr= TermsToList@ MatchOperatorPatterns@ HcExpand@ lagrangian;

	(*Tests if flavor indices are present:*)
	preFact* Plus@@ If[Length@ Last@ atomOp === 0,
		Cases[expr, Times[couplings__?(FreeQ[Operator]), AtomicOp[class, id, {}]]| AtomicOp[class, id, {}]:>
			Times@ couplings]
	,
		Cases[expr, Times[couplings__?(FreeQ[Operator]), op:(AtomicOp[class, id, currentInds_])]:>
			TransformCouplingFlavors[Times@ couplings, currentInds, Last@ atomOp]]
	]// Simplify
]


(* ::Text:: *)
(*Change the labels of the open flavor indices of a coupling term to some new ones*)


TransformCouplingFlavors[couplings_, currentInds_, newInds_]:= Module[{replacement},
	replacement= Thread@ Rule[currentInds, newInds];
	RelabelIndices[couplings, Unique-> True]/. replacement// RelabelIndices
]


(* ::Subsubsection::Closed:: *)
(*Lookup operator properties*)


(* ::Text:: *)
(*Extracts the operator information *)


LookupOperatorProperties[operator_Operator]:= Module[{op},
	op= MatchOperatorPatterns@ operator;
	FirstCase[op, AtomicOp[class_, id_, _]:> $operators[class, id], <||>, All]
]


LookupOperatorProperties[operator_AtomicOp]:= Module[{op},
	op= operator;
	FirstCase[{op}, AtomicOp[class_, id_, _]:> $operators[class, id], <||>, All]
]


(* ::Text:: *)
(*Looks op flavor properties of an operator*)


LookupOperatorFlavorProperties[operator:_AtomicOp|_Operator]:= Module[{props, selfConj, selfConjExchange},
	props= LookupOperatorProperties@ operator;

	selfConj= props@ SelfConjugate;
	selfConjExchange= If[selfConj,
			If[Length@ First@ props@ InequivalentPermutations > 0,
				OpConjFlavorPermutation@ FirstCase[Operator@ operator, _Operator|_AtomicOp, Operator[], All]
			,
				True
			]
		,
			False
		];
	<|
		SelfConjugate-> selfConj,
		ConjugateIndexExchange-> selfConjExchange,
		InequivalentPermutations-> props@ InequivalentPermutations,
		Symmetries-> props@ Symmetries
	|>
]


(* ::Text:: *)
(*Special treatment for CompOp*)


LookupOperatorFlavorProperties[operator_CompOp]:= Module[{selfConj,inequivPerms, selfConjExchange},
	selfConj = $compoundOperators[Sequence@@ operator[[;;3]], SelfConjugate];

	(* take inequivalent permutations from one of the AtomicOp that make up this CompOp *)
	inequivPerms = LookupOperatorFlavorProperties[FirstCase[ToAtomicForm@RelabelIndices@AtomicToNormalForm@operator,_AtomicOp,Nothing,All]]@ InequivalentPermutations;

	selfConjExchange= If[TrueQ@ selfConj || selfConj === -1,
			If[Length@ First@ inequivPerms > 0,
				OpConjFlavorPermutation@ operator
			,
				True
			]
		,
			False
		];

	<|
		SelfConjugate-> selfConj,
		ConjugateIndexExchange-> selfConjExchange,
		InequivalentPermutations-> inequivPerms,
		Symmetries-> $compoundOperators[Sequence@@ operator[[;;3]], Symmetries]
	|>
]


(*OpConjFlavorPermutation@ op_AtomicOp:= OpConjFlavorPermutation@ FirstCase[Operator@ RelabelIndices@AtomicToNormalForm@ op, _Operator, Operator[], All]*)
OpConjFlavorPermutation@ AtomicOp[class_, id_, _]:= $operators[class, id, ConjugateIndexExchange];


OpConjFlavorPermutation@ op_CompOp:= Module[{bop},
	bop = InternalSimplify[Bar@RelabelIndices@AtomicToNormalForm@op, InternalOpRepresentation->True];
	FindPermutationOrder@@ Cases[{op, bop} , CompOp[__, inds_]-> inds, All]
]


OpConjFlavorPermutation@ op_Operator:= Module[{},
	FindPermutationOrder@@ Cases[MatchOperatorPatterns@ {op, OperatorBar@ op}, AtomicOp[__, inds_]-> inds, All]
]


(* ::Section:: *)
(*IbP Simplify*)


(* ::Text:: *)
(*Exact simplification procedure*)


(* ::Subsubsection::Closed:: *)
(*ConstructOperatorIdentities*)


(* ::Text:: *)
(*Function to make a minimal viable set of identities (in the form of substitution rules) governing an operator class*)
(*reduction= <dDimensional| Evanescent| FourDimensional> determines the type of identities used *)


ConstructOperatorIdentities::basis= "Somethings gone terribly wrong: we could not map the operators into the simplification vector space. "


Options[ConstructOperatorIdentities]={ShowScores->False};


ConstructOperatorIdentities[opClass_, reduction_,OptionsPattern[]]:= Module[
	{opID= 1, dummies, fourDIdentities, identities, indexToPattern, lhs, op, opIdentities, ordering,
		operators, indPerms, opsToSymmetrize, revOrdering, rhs, evaOperators, evaopt},
	If[!KeyExistsQ[$operators, opClass], Return@ {}; ];

	evaopt= reduction === Evanescent;
	fourDIdentities= (reduction === FourDimensional) || evaopt;

	(*Initial set of operators to generate identities from*)
	dummies= ConstructDummyIndices@ First[$operators@ opClass]@ IndexType;
	indexToPattern= #-> Index[Pattern[Evaluate@ First@ #, Blank[]], Last@ #]&/@ dummies;

	(*Loop to make all identities of the operator class*)

	identities= Flatten@ Reap[While[opID <= Length@ $operators@ opClass,
		op= AtomicOp[opClass, opID, dummies]/.
			$operators[opClass, opID, AtomicOpExpansionPattern];
		indPerms= $operators[opClass, opID, InequivalentPermutations];
		indPerms= Thread[dummies-> dummies[[#]]]&/@ indPerms;
		opID++;

		(*Construct all identities generated from the operator*)
		opIdentities= RelabelIndices/@ Join@@ Through[{
				IdentitiesIBP,
				IdentitiesCDCommutation,
				IdentitiesJacobi,
				IdentitiesSpinorLineDerivatives,
				IdentitiesSpinorLineTransposition,
				IdentitiesDiracCommutation,
				IdentitiesSymmetry,
				IdentitiesCGs,
				IdentitiesGroupFierz,
				If[fourDIdentities, IdentitiesFierz[#, Evanescent-> evaopt]&, Nothing],
				If[fourDIdentities, IdentitiesSchouten[#, evaopt]&, Nothing]
			}@ op];

		(*Identify operators in the identities with the canonical form ones*)
		(*opIdentities= MatchOperatorPatterns[opIdentities,
			ResetIdentities-> Complement[{dDimensional, FourDimensional, Evanescent}, {reduction}]];*)
		opIdentities= MatchOperatorPatternsInIdentities[opClass, opIdentities,
			Complement[{dDimensional, FourDimensional, Evanescent}, {reduction}]];
		
		(*Use identiteis with all inequivalent index permutations of the original operator*)
		Sow@ Flatten@ CanonizeAtomicOp[opIdentities/. indPerms];
	]][[2, 1]];

	(*Remove trivial identities (not involving any operators)*)
	identities= DeleteDuplicates@ DeleteCases[identities, 0]/. _Coupling-> 1; (*Temporary gauge coupling removal*)

	(*Determnine operators with non-trivial flavor permutations*)
	opsToSymmetrize= DeleteDuplicates@ Flatten@ Table[
			Select[Tally[DeleteDuplicates@ Cases[id, _AtomicOp, All]/. AtomicOp[_, no_, _]-> no], #[[2]] > 1 &][[;;, 1]]
		, {id, identities}];

	(*Add compound identities with all inequivalent flavor permutations*)
	ConstructCompoundBasis[reduction, opClass, opsToSymmetrize];
	identities= Join[identities, Join@@ KeyValueMap[
		Function[{id, prop}, Table[
			CompOp[reduction, opClass, id, dummies]- (CompOp[reduction, opClass, id, dummies]/. prop@ CompOpReplacement)/.
				Thread@ Rule[dummies, dummies[[perm]]]
			, {perm, prop@ InequivalentPermutations}]
			],
		$compoundOperators[reduction, opClass] ] ];

	If[Length@ identities === 0,
		Return@ {};
	];

	(*Determine non-redundant set of operators and indexpermutations*)
	operators= Join[
		Join@@ KeyValueMap[Function[{id, prop},
				Thread@ {AtomicOp[opClass, id, dummies[[#]]]&/@ prop@ InequivalentPermutations, prop@ Score}],
			$operators@ opClass],
		Join@@ KeyValueMap[Function[{id, prop},
				Thread@ {CompOp[reduction, opClass, id, dummies[[#]]]&/@ prop@ InequivalentPermutations, prop@ Score}],
			$compoundOperators[reduction, opClass] ]
		];

	evaOperators=DeleteDuplicates@Cases[identities, _EvaOp,Infinity];
	evaOperators= {#, Max[LookupOperatorProperties[Operator[GetEvanescentTerm[#][RedundantOperator]]][Score],
						   Min[#[Score]&/@(LookupOperatorProperties/@Cases[{Operator[GetEvanescentTerm[#][BasisOperator]]},_Operator, Infinity])]
						   ]-0.05
				}& /@evaOperators;

	operators= operators~ Join~ evaOperators;
	If[OptionValue@ShowScores,
		Echo@NiceForm@(MatrixForm@(operators//AtomicToNormalForm//RelabelIndices));];

	(*Order the operators according to IBPScore*)
	{operators, ordering}= Transpose@ operators;
	ordering= Ordering@ ordering;
	operators= operators[[ordering]];

	(*Canonize flavor indices in operators so that they match the inequivalent permutations*)
	identities= identities/. AtomicOp[opClass, id_, inds_]:>
		FirstCase[List@@@ MapAt[inds[[#]]&, $operators[opClass, id, Symmetries], {All, 1}],
			{i:Alternatives@@ (dummies[[#]]&/@ $operators[opClass, id, InequivalentPermutations]), sign_}->
			sign* AtomicOp[opClass, id, i] ];
	(*Echo@NiceForm@(MatrixForm@ProjExpand@(identities//AtomicToNormalForm//RelabelIndices));*)

	(*Identify the operators with basis vectors in a vectorspace*)
	identities= (identities/. MapIndexed[(#1-> UnitVector[Length@ operators, First@ #2]&), operators]);

	(*Verify that the mapping into vector space was succesfull*)
	If[!MatchQ[identities, {{(_Integer| _Rational| _Complex)..}..}],
		Message[ConstructOperatorIdentities::basis];
		Print[opClass];
		EchoFunction[Iconize]@identities;
	];

	(*Use row reduction to generate a list of substitution rules for redundant operators*)
	identities= DeleteCases[RowReduce@ identities, {0..}];

	(*Recast the identities of the redundant operators in terms of patterns for AtomicOp/CompOp objects*)
	Table[
		lhs= operators[[First@ FirstPosition[identity, 1]]];
		rhs= lhs- identity . operators;
		(lhs/. indexToPattern)-> rhs
	, {identity, identities}]
];


(* ::Subsection:: *)
(*Operator Identities *)


(* ::Text:: *)
(*Functions returning the results of applying various identities to an operator*)


(* ::Text:: *)
(*With every identity that (may introduce) introduces new CGs locally, it  is important to apply a ContractCG to ensure complete contractions of CGs in all operators. Otherwise the assumption of CG reduction as part of identifying identical operators is violated. *)


(* ::Subsubsection::Closed:: *)
(*IdentitiesIBP*)


(* ::Text:: *)
(*Gives identities from IBP relations *)


IdentitiesIBP@ op_Operator:= Module[{positions, \[Mu]ind},
	positions= Join[#, {-1, 1}]&/@ Position[op, (Field|FieldStrength)[___, {__}], All, Heads-> False];
	Table[
		CD[op[[Sequence@@ pos]], Delete[op, pos]]
	, {pos, positions}]
	(*Account for EoMs...*)
	~ Join~
	(CD[\[Mu]ind, #]&/@ ReplaceListSubExprs[op, EoM[f_]:> EoMSplitter[\[Mu]ind, f]])
]


(* ::Text:: *)
(*Remove derivative with index \[Mu] from EoM (for IbP)*)


EoMSplitter::unexp= "EoMSplitter applied to unexpected expression `1`.";
EoMSplitter[\[Mu]_, f:Field[_, Scalar, __] ]:= CD[\[Mu], f];
EoMSplitter[\[Mu]_, f:Bar@ Field[_, Scalar, __] ]:= CD[\[Mu], f];
EoMSplitter[\[Mu]_, f:Field[_, Fermion, __] ]:= \[Gamma]@ \[Mu]** f;
EoMSplitter[\[Mu]_, f:Bar@ Field[_, Fermion, __] ]:= f** \[Gamma]@ \[Mu];
EoMSplitter[\[Mu]_, f:Transp@ Field[_, Fermion, __] ]:= f** Transp@ \[Gamma]@ \[Mu];
EoMSplitter[\[Mu]_, f:Transp@ Bar@ Field[_, Fermion, __] ]:= Transp@ \[Gamma]@ \[Mu]** f;
EoMSplitter[\[Mu]_, Field[f_, Vector@ \[Nu]_, inds_, {}] ]:= FieldStrength[f, {Index[\[Mu], Lorentz], \[Nu]}, inds, {}];
EoMSplitter[\[Mu]_, Bar@ Field[f_, Vector@\[Nu]_, inds_, {}] ]:=Bar@ FieldStrength[f, {Index[\[Mu], Lorentz], \[Nu]}, inds, {}];
EoMSplitter[\[Mu]_, x_]:= (
	Message[EoMSplitter::unexp, x];
	Abort[];
);


(* ::Subsubsection::Closed:: *)
(*IdentitiesCDCommutation*)


(* ::Text:: *)
(*Commutation relations from commuting CD on fields/field strengths*)


IdentitiesCDCommutation@ op_Operator:= Block[{positions},
	positions= Position[op, (Field|FieldStrength)[___, {_, __}], All, Heads-> False];
	Flatten@ Table[
		pos= Sequence@@ pos;
		Table[
			If[op[[pos, -1, n]] === op[[pos, -1, n+ 1]],
				Nothing
			,
				OperatorToNormalForm[ReplacePart[op, {pos}-> CommuteCDs[op[[pos]], n] ]- op]// 
					ContractCGs// ContractDelta// Operator
			]
		, {n, Length@ op[[pos, -1]] -1}]
	, {pos, positions}]
]


(* ::Subsubsection::Closed:: *)
(*IdentitiesJacobi*)


(* ::Text:: *)
(*Jaccobi identities: D_a A_{bc} + D_b A_{ca} + D_c A_{ab} = 0*)


IdentitiesJacobi@ op_Operator:= Block[{positions, indices},
	positions= Position[op, FieldStrength[___, {__}], All, Heads-> False];
	Table[
		pos= Sequence@@ pos;
		indices= op[[pos, 2]]~ Join~ op[[pos, -1, {-1}]];
		If[DuplicateFreeQ@ indices,
			indices= Thread@ Rule[indices, #]&/@ NestList[RotateRight, indices, 2];
			ReplacePart[op, {pos}-> CD[op[[pos, -1, ;;-2]],
				Plus@@ (op[[pos, ;;-2]]~ Join~ op[[pos, {-1}, {-1}]]/. indices)] ]
		,
			Nothing
		]
	, {pos, positions}]
]


(* ::Subsubsection::Closed:: *)
(*IdentitiesSpinorLineDerivatives*)


(* ::Text:: *)
(*The application of GAction on the fermion field may create new CGs that may be contractable with other CGs*)


IdentitiesSpinorLineDerivatives@ op_Operator:=
	ReplaceListSubExprs[op, f: Field[_, Fermion, _, {a_, a_}]:> D2Fermion@ f]// 
		OperatorToNormalForm// ContractCGs// Operator


(* ::Text:: *)
(*D2 identity on a fermion (D2 = Dslash Dslash -  F_ab sigma_ab)*)


D2Fermion[f:Field[lab_, Fermion, inds_, {\[Mu]_, \[Mu]_}] ]:= Module[{\[Nu]= Index[Unique[lInd], Lorentz]},
	- f +
	\[Gamma]@ \[Nu] ** \[Gamma]@ \[Mu] ** Field[lab, Fermion, inds, {\[Nu], \[Mu]}] +
	I/2 \[Gamma][\[Mu], \[Nu]] ** GAction[{\[Mu], \[Nu]}, Field[lab, Fermion, inds, {}]]
]


(* ::Subsubsection::Closed:: *)
(*IdentitiesSpinorLineTransposition*)


(* ::Text:: *)
(*Identities from all possible transpositions of spinor lines involving identical spinors (but potentially different flavor indices).*)


IdentitiesSpinorLineTransposition@ op_Operator:= Module[{positions},
	positions= Position[op, NonCommutativeMultiply[Bar@ Field[lab_, __], _, Transp@ Bar@ Field[lab_, __] ] |
		NonCommutativeMultiply[Transp@ Field[lab_, __], _, Field[lab_, __] ]];
	Table[
		op- MapAt[Transp, op, lines]
	, {lines, Subsets@ positions}]
]


(* ::Subsubsection::Closed:: *)
(*IdentitiesDiracCommutation*)


(* ::Text:: *)
(*We might need more identities here *)


IdentitiesDiracCommutation@ op_Operator:=
	If[Count[op,_NonCommutativeMultiply,Infinity]=!=2,
	Join[
		ReplaceListSubExprs[op, d: DiracProduct[___, GammaM[_, __], ___]:>
			ASymGammaExpand@ d] -op,
		ReplaceListSubExprs[op, d: DiracProduct[___, Transp@ GammaM[_, __], ___]:>
			Transp@ ASymGammaExpand@ Transp@ d] -op,
		ContractMetric/@ ReplaceListSubExprs[op,
			DiracProduct[a___, GammaM@ \[Mu]_, GammaM@ \[Nu]_, b___]:>
			-DiracProduct[a, GammaM@ \[Nu], GammaM@ \[Mu], b] + 2 Metric[\[Mu], \[Nu]] DiracProduct[a, b]] -op,
		ContractMetric/@ ReplaceListSubExprs[op,
			DiracProduct[a___, Transp@ GammaM@ \[Mu]_, Transp@ GammaM@ \[Nu]_, b___]:>
			-DiracProduct[a, Transp@ GammaM@ \[Nu], Transp@ GammaM@ \[Mu], b] + 2 Metric[\[Mu], \[Nu]] DiracProduct[a, b]] -op,
		(*Additional*)
		ContractMetric/@ ReplaceListSubExprs[op,
			DiracProduct[a___, GammaM[\[Mu]_, \[Nu]_], b___]:>
			DiracProduct[a, GammaM@ \[Mu], GammaM@ \[Nu], b] - Metric[\[Mu], \[Nu]] DiracProduct[a, b]] -op,
		ContractMetric/@ ReplaceListSubExprs[op,
			DiracProduct[a___, GammaM[\[Mu]_, \[Nu]_], b___]:>
			Metric[\[Mu], \[Nu]] DiracProduct[a, b] - DiracProduct[a, GammaM@ \[Nu], GammaM@ \[Mu], b]] -op,
		ContractMetric/@ ReplaceListSubExprs[op,
			DiracProduct[a___, Transp@GammaM[\[Mu]_, \[Nu]_], b___]:>
			DiracProduct[a, Transp@GammaM@ \[Nu], Transp@GammaM@ \[Mu], b] - Metric[\[Mu], \[Nu]] DiracProduct[a, b]] -op,
		ContractMetric/@ ReplaceListSubExprs[op,
			DiracProduct[a___, Transp@GammaM[\[Mu]_, \[Nu]_], b___]:>
			Metric[\[Mu], \[Nu]] DiracProduct[a, b] - DiracProduct[a, Transp@GammaM@ \[Mu], Transp@GammaM@ \[Nu], b]] -op
		],
		Nothing
	]


(* ::Subsubsection::Closed:: *)
(*IdentitiesSymmetry*)


(* ::Text:: *)
(*Identifies identically vanishing operators from anti-symmetry of Levi-Civita, e.g., H_i eps_ij H_j in the SM.*)


IdentitiesSymmetry@ op_Operator:= Module[{patterns},
	(*Create all patterns from from anti-symmetric exchanges of indices for various objects*)
	(*Mark potential places for these anti-symmetric exchanges*)
	patterns= ReplaceListSubExprs[op, {
			cg:CG[lab_, inds_]/; MemberQ[$CGproperties[lab/. Bar-> Identity, Symmetries], -1]:> MapAt[Inactive, cg, 0],
			x:(_LCTensor | _FieldStrength | _GammaM):> MapAt[Inactive, x, 0] 
		}];
	If[Length@ patterns === 0, Return@ {};];
	
	(*Create full operator matching patterns (w/o the symmetry of the marked Inactive head)*)
	patterns= MakeOperatorPattern/@ patterns;
	
	(*Create full pattern replacement rules *)
	patterns[[;;, 1]]= patterns[[;;, 1]]/. x:Inactive[_][__]:> AntiPattern@ x;
	patterns= MapAt[Activate, RuleDelayed@@@ patterns, {All, 2}];
	
	Catch[
		Do[
			(*Try all matches of each pattern. Signature 1 indicates incompatible symmetries of the operator*)
			If[MemberQ[ReplaceList[op, pat], 1],
				Throw@ {op}
			];
		, {pat, patterns}];
		{}
	]
];


AntiPattern@ Inactive[CG][lab_, inds_]:= Module[{syms},
	syms= Keys@ Select[# === -1 &]@ $CGproperties[lab/. Bar-> Identity, Symmetries];
	syms= Alternatives@@ (inds[[#]]&)/@ syms;
	CG[lab, syms]
];


AntiPattern@ Inactive[head:LCTensor|GammaM][inds__]:= Module[{syms, sig},
	sig= Signature@ List@ inds;
	syms= Alternatives@@ PatternSequence@@@ Select[Permutations@ List@ inds, sig* Signature@ # === -1 &];
	HoldPattern@ head[syms]
];


AntiPattern@ Inactive[FieldStrength][lab_, lor_, gr_, devs_]:= HoldPattern@ FieldStrength[lab, lor[[{2, 1}]], gr, devs];


(* ::Subsubsection::Closed:: *)
(*IdentitiesCGs*)


(* ::Text:: *)
(*Identity related to CG coefficients that can simplify even without any contraction *)
(*\[Epsilon][i1, i2,...] \[Epsilon][j1, j2,...] = \[CapitalSigma] \[Sigma](perm) \[Delta][i1, j1] \[Delta][i2, j2] ...*)


IdentitiesCGs@ op_Operator:= Block[{},
	ReplaceList[op,
		o: HoldPattern@ Operator[CG[ep_eps, inds1_], CG[Bar@ ep_eps, inds2_], rest__]:>
		o- Contract[(Signature@ inds2 Plus@@ (Signature@ # Times@@ Thread@ Delta[inds1, #]&/@ Permutations@ inds2) *
			Operator@ rest)]
	]
]


(* ::Subsubsection::Closed:: *)
(*IdentitiesFierz*)


(* ::Text:: *)
(*Identity related to Fierzing of two fermions bilinears*)


IdentitiesFierz[ op_Operator, opt:OptionsPattern[]]:=
	Join[
		ReplaceList[op, o: HoldPattern@Operator[SP1_NonCommutativeMultiply,SP2_NonCommutativeMultiply, rest___/;FreeQ[{rest},_NonCommutativeMultiply]]/;FbasisQ[SP1,SP2]:>
		o- Operator[Fierz[OperatorToNormalForm@o, Order->{1,4,3,2},opt]]],
		ReplaceList[op, o: HoldPattern@Operator[SP1_NonCommutativeMultiply,SP2_NonCommutativeMultiply, rest___/;FreeQ[{rest},_NonCommutativeMultiply]]/;FbasisQ[SP1,SP2]:>
		o- Operator[Fierz[OperatorToNormalForm@o, Order->{1,3,4,2},opt]]]
	]


(* ::Subsubsection::Closed:: *)
(*IdentitiesSchouten*)


IdentitiesSchouten[op_Operator, evanecentOp_:True]:= Module[{ind, indices, positions, subset},
	indices= DeleteDuplicates@ Cases[op, Index[_, Lorentz], All];
	If[Length@ indices < 5, Return@ {};];

	(*Anti-symmetrize accross all subsets 5 unique Lorentz indices*)
	Table[
		positions= Table[FirstPosition[op, ind], {ind, subset}];
		Sum[
			Signature@ perm * ReplacePart[op, Thread@ Rule[positions, perm]]
		, {perm, Permutations@ subset}]
	, {subset, Subsets[indices, {5}]} ]

	(*Add evanescent operators*)
]


(* ::Subsubsection::Closed:: *)
(*IdentitiesGroupFierz*)


(* ::Text:: *)
(*Identities shuffling around singular fundamental SU(2) generators*)
(*	0= \[Delta]^i_j t^{ak}_l + \[Delta]^k_l t^{ai}_j - \[Delta]^k_j t^{ai}_l - \[Delta]^i_l t^{ak}_j*)
(*or alternatively*)
(*	0 = f_i g^i t^{ak}_l + f_i g^j t^{ai}_j \[Delta]^k_l - f_i g^k t^{ai}_l - f_l g^i t^{ak}_i*)
(*TODO:*)
(*Expand this identity to SU(N) by relying on *)
(*	\[Delta]^i_j t^{ak}_l = N {t_a, t_b}^i_j t^{bk}_l - N d_{abc} t^{ci}_j t^{bk}_l*)
(*and the ordinary SU(N) Fierz identity to simplify the generator contractions where possible*)


IdentitiesGroupFierz@ operator_Operator:= Module[
		{fundInds, otherInds, genPos, op, out, su2Groups, 
			iInd, jInd, kInd, lInd, iBarPos, iPos, kPos, lPos},
	su2Groups= Keys@ Select[$Groups, # === Alg["A", 1]&];
	(*Ensure that indices on fields are Bared or not locally*)
	op= operator/. Bar@ (f:Field|FieldStrength)[lab_, t_, inds_, devs_]:> 
		f[Conj@ lab, t, Bar/@ inds, devs];
	
	out= Flatten@ Table[Catch[
		(*Determine positions of prospective SU(2) generators*)
		genPos= Position[op, CG[gen@ gr@ fund, _]];
		If[Length@ genPos === 0, Throw@ Nothing;];
		
		(*Determine all fundamental SU(2) indices of same group*)
		fundInds= DeleteDuplicates@ Cases[op, Index[_, gr@ fund], All];
		If[Length@ fundInds < 3, Throw@ Nothing;];
		
		jInd= Index[Unique[j], gr@ fund];
		
		(*Loop over generators and 3rd prospective index*)
		Table[
			{kInd, lInd}= op[[Sequence@@ gPos]][[2, 2;;]];
			{kPos, lPos}= {Join[gPos, {2, 2}], Join[gPos, {2, 3}]};
			
			otherInds= Complement[fundInds, {kInd, lInd}/.Bar->Identity];
			Table[
				iBarPos= FirstPosition[op, Bar@ iInd];
				iPos= First@ DeleteCases[Position[op, iInd], Append[iBarPos, 1]];
				(*Identity*)
				op- ReplacePart[op, {kPos-> iInd, iPos-> kInd}]- ReplacePart[op, {iBarPos-> lInd, lPos-> Bar@ iInd}] + 
					ContractDelta[Delta[kInd, lInd]ReplacePart[op, {kPos-> iInd, lPos-> Bar@ jInd, iPos-> jInd}]]
			, {iInd, otherInds}]
		, {gPos, genPos}]
	], {gr, su2Groups}];
	
	(*Restore ordinary Bar notation for Field and FieldStrength objects in output identities*)
	out= out/. (f:Field|FieldStrength)[Conj@ lab_, t_, inds_, devs_]:> 
		Bar@ f[lab, t, Bar/@ inds, devs];
	
	out// OperatorToNormalForm// ContractCGs// Operator
]


(* ::Subsection:: *)
(*Simplify  using  rules*)


(* ::Text:: *)
(*Apply the simplification identities to a Lagrangian expression*)


(* ::Subsubsection::Closed:: *)
(*Construct Hermitian identities*)


(* ::Text:: *)
(*To ensure the same ordering between Hermitian operator types, the corresponding identities are simultaneously constructed*)
(*reduction= <dDimensional| Evanescent| FourDimensional> determines the type of identities used *)


ConstructHermitianSimplificationIdentities[opClass_, reduction_]:=
		ConstructHermitianSimplificationIdentities[opClass, reduction]= Module[{identities},
	identities= ConstructOperatorIdentities[opClass, reduction];

	If[SelfConjugateClassQ@ opClass, Return@ identities];

	(*For complex-type classes the conjugate identities are constructed*)
	ConstructConjugateCompounds[reduction, opClass];
	
	Join[identities,
		identities/.
			atom_AtomicOp:> ConjugateAtomicOp@ atom/.
			eva_EvaOp:> Bar@ eva/.
			c_Complex:> Conjugate@ c/.
			CompOp[reduction, opClass, id_, inds_]:> CompOp[reduction, OpClassConjugate@ opClass, id,
				inds[[$compoundOperators[reduction, opClass, id, ConjugateIndexPermutation]]]]/.
			HoldPattern[Times[-1, x_]-> y_] :> Rule[x, -y] (*account for posibility of -1 from conjugation*)
	]
]


ConjugateAtomicOp@ atom:AtomicOp[class_, id_, inds_]:= 
	Replace[atom, $operators[class, id, AtomicOpExpansionPattern]]/.
		op_Operator:> OperatorBar@ op/.
		op_Operator:> op/. $operators[OpClassConjugate@ class, id, OperatorMatchingPattern]


(* ::Subsubsection::Closed:: *)
(*Unset the identities*)


(* ::Text:: *)
(*Remove all memoized values of ConstructHermitianSimplificationIdentities associated to the operator class and its conjugate*)


UnsetHermitianIdentities[opClass_, reduction_] := Block[{},
	With[{class= opClass},
		RemoveAssociatedDownValues[ConstructHermitianSimplificationIdentities[class, reduction]];
	];
	If[!SelfConjugateClassQ@ opClass,
		With[{class= OpClassConjugate@ opClass},
			RemoveAssociatedDownValues[ConstructHermitianSimplificationIdentities[class, reduction]];
		];
	];
]


(* ::Subsubsection::Closed:: *)
(*IBP Simplification function*)


(* ::Text:: *)
(*Applies the operator identities to a given pattern *)


Options[IBPSimplify]={ReductionIdentities->dDimensional, Verbose->True};


IBPSimplify[expr_, OptionsPattern[]]:= Module[{class, out, subs, terms, evaopt, redID},
	{redID, evaopt}= Switch[OptionValue@ ReductionIdentities
		,dDimensional,
			{dDimensional, False}
		,Evanescent|EvanescenceFree,
			{Evanescent, True}
		,FourDimensional,
			{FourDimensional, False}
	];
	out= If[redID === dDimensional,
			expr
		,
			(*Reduce Lorentz/Dirac structures that should always be reduced, i.e.,
			structures that are never part of the basis.*)
			RemoveLCTensor[GammaReduction[OperatorToNormalForm@ expr, 
				Evanescent-> evaopt, FourDimensional-> redID === FourDimensional], Evanescent-> evaopt]
		];

	out= MatchOperatorPatterns@ out;

	(*Determine identities for each group of operator types*)
	(*Collect terms by Hermitian operator class*)
	terms= Normal@ GroupBy[TermsToList@ out, FirstCase[#, AtomicOp[class_, __] :> class, {}, All]& ];
	terms= Merge[MapAt[If[# === {}, {}, First@ Sort@ {#, OpClassConjugate@#}] &,
		terms, {All, 1}], Apply@ Join];
	(*Perform the replacements by operator class for performance*)
	out= Sum[Catch[
			If[class === {}, (*Constants are kept unchanged*)
				Throw[Plus@@ terms@ class];
			];
			subs= ConstructHermitianSimplificationIdentities[class, redID];
			Plus@@ terms@ class/. subs// ExprFlavorCanonize
		], {class, Keys@ terms}];

	If[redID === Evanescent,
		out= out/. {hbar* _EvaOp-> 0, hbar* Bar@ _EvaOp-> 0};
	];

	(*Calculate the finite shift from the evanescent operators*)
	If[OptionValue@ ReductionIdentities === EvanescenceFree && !FreeQ[out, _EvaOp],
		out= RelabelIndices@AtomicToNormalForm@ CollectCoefficientsWithSyms@ out;
		out= OptionalMonitor[OptionValue@ Verbose,
				EvanescentContribution[out, Verbose-> False]
			, "Computing evanescent shifts"];
		out= IBPSimplify[out, ReductionIdentities-> OptionValue@ ReductionIdentities];
		(*out= MatchOperatorPatterns@ out;*)
	];
	
	(*Expands the dimensional dependence from the Dirac/Lorentz identities*)
	If[OptionValue@ ReductionIdentities =!= FourDimensional && !FreeQ[out, \[ScriptD]],
		out= EpsExpand@ out;
	];
	
	out
]


(* ::Subsection:: *)
(*Output functions*)


(* ::Subsubsection::Closed:: *)
(*Scoped simplification functions*)


(* ::Text:: *)
(*Simplification function outputting the Lagrangian either in Operator form or in the internal representation (e.g. AtomicOp) *)


Options@ InternalSimplify= {InternalOpRepresentation-> False, ReductionIdentities->dDimensional}


InternalSimplify[expr_, OptionsPattern[]]:= Module[{out},
	out= CollectCoefficientsWithSyms@ IBPSimplify[ ContractDelta@ ContractCGs@ expr,ReductionIdentities->OptionValue@ReductionIdentities];

	If[OptionValue@ InternalOpRepresentation,
		out
	,
		AtomicToOperatorForm[out]
	]
];


(* ::Subsubsection::Closed:: *)
(*Main Exported simplification function*)


(* ::Text:: *)
(*Output to NormalForm for the operators *)


Options[GreensSimplify]={ReductionIdentities->dDimensional};


GreensSimplify[arg_,OptionsPattern[]]? OptionsCheck:= Block[{expr=BetterExpand@HcExpand[arg], consts, redID=OptionValue@ReductionIdentities},
	If[redID === EvanescenceFree,
		AddToBibliography["EvanescentTreatment", "Simplified expression to evanescent-free scheme (with GreensSimplify)"]
	];

	(* subtract off constants *)
	{consts, expr}= SeparateOutConstants@ expr;

	(* simplifications *)
	LagrangianLikeCheck@ expr;

	expr= (*RelabelIndices@*)AtomicToNormalForm@ CollectCoefficientsWithSyms@ IBPSimplify[ ContractDelta@ ContractCGs@ expr, ReductionIdentities->redID];

	(* add back the constants *)
	expr + consts
]


(* ::Subsubsection::Closed:: *)
(*Return simplification identities *)


(* ::Text:: *)
(*Returns simplifications rules determined by ConstructOperatorIdentities to reduce operators from an operator class to the basis*)


Options[IBPIdentities]={ReductionIdentities->dDimensional, ShowScores->False};


IBPIdentities::args= "IBPIdentities[fields, devNo] takes two arguments.";


SetAttributes[IBPIdentities, HoldFirst];
IBPIdentities[fields_List, devs_Integer, OptionsPattern[]]? OptionsCheck:= Module[{opClass, identities},
	opClass= Hold@ fields/. Bar-> Conj// ReleaseHold;
	MatterFieldListCheck@ opClass;
	DevNoCheck@ devs;

	opClass= {opClass// Sort, devs};
	If[!MemberQ[Keys@ $operators, opClass],
		Return@ {};
	];

	(*Remove compound definitions:*)
	identities= DeleteCases[ConstructOperatorIdentities[ opClass, OptionValue@ReductionIdentities, ShowScores->OptionValue@ShowScores], Rule[_CompOp, _]];

	identities/. Verbatim[Pattern][x_, Blank[]]-> x// AtomicToNormalForm //RelabelIndices
]


IBPIdentities@ ___:= (Message[IBPIdentities::args]; Abort[];);


(* ::Subsection:: *)
(*HcSimplification*)


(* ::Subsubsection::Closed:: *)
(*HcTerms and HcExpand*)


(* ::Text:: *)
(*Collect Hermitian conjugate terms in a Lagrangian*)


HcTerms@ 0= 0;
Bar@HcTerms[arg___]:=HcTerms[arg]


HcExpand[Lag_]:= Lag /.{HcTerms[expr_]:> expr + Bar@expr} ;


(* ::Subsubsection::Closed:: *)
(*HcSimplify*)


HcSimplify::nothermitian = "The Lagrangian is not hermitian. The non-Hermitian part \[ScriptCapitalL]-\[ScriptCapitalL]\[ConjugateTranspose] is given by: `1`"


(* ::Text:: *)
(*This implementation of HcSimplify proceeds under the assumption that the Lagrangian is explicitly Hermitian after application of InternalSimplify*)


HcSimplify[arg_]:=HcSimplifyInternal[arg, InternalOpRepresentation -> False]


Options[HcSimplifyInternal]={InternalOpRepresentation -> False};


HcSimplifyInternal[arg_,OptionsPattern[]]:= Module[{complex, out, real, expr=arg, hermite, hermiteManifest},
	(* check hermiticity and manifest hermiticity *)
	{hermite, hermiteManifest} = HermitianQ[expr,"manifest"->True];
	If[!hermite,
		Message[HcSimplify::nothermitian, Format[GreensSimplify[expr- Bar@ expr],NiceForm]];
		Abort[];
	];
	(* if the Lagrangian is Hermitian, but not manifestly Hermitian, manifestly Hermitianize it *)
	If[!hermiteManifest,
		expr = (expr+Bar[expr])/2;
	];

	out= InternalSimplify[expr, InternalOpRepresentation-> True];
	If[out === 0, Return@ 0;];
	out= If[Head@ out =!= Plus, {out}, List@@ out];

	real= Cases[out, (Times[op:(_AtomicOp|_CompOp), rest__]|op:(_AtomicOp|_CompOp) )/; RealOpQ@ op:>
		{op, Times@ rest}];
	complex= Cases[out, (Times[op:(_AtomicOp|_CompOp), rest__]|op:(_AtomicOp|_CompOp))/; !RealOpQ@ op:>
		{op, Times@ rest}];

	complex= DeleteDuplicatesBy[SortBy[complex,Count[#,_Bar,Infinity]&], (Sort@ {#, MapAt[OpClassConjugate, #, 1]}&@* First)];

	If[TrueQ@ OptionValue[InternalOpRepresentation],
		out= Plus@@ Times@@@ real + HcTerms[Plus@@ Times@@@ complex]
		,
		out= AtomicToNormalForm[Plus@@ Times@@@ real] + HcTerms[AtomicToNormalForm[Plus@@ Times@@@ complex]] //RelabelIndices
	];

	out
]


(* ::Text:: *)
(*Test if an AtomicOp is real or complex (exception if the operator is a kinetic term)*)


RealOpQ@ op:AtomicOp[opClass_, id_, _]:= $operators[opClass, id, SelfConjugate] ||
	KineticOpQ@ AtomicToOperatorForm[op];
RealOpQ@ CompOp[red_, opClass_, id_, _]:=
	$compoundOperators[red, opClass, id, SelfConjugate] =!= False; (*can also be +/-1*)


(* ::Section:: *)
(*Coupling collection*)


(* ::Subsubsection::Closed:: *)
(*Collect all couplings in a Pattern*)


(* ::Text:: *)
(*Provides methods to collect groups of couplings accounting for naming of repeated indices and coupling symmetries*)


nonTrivCouplingPattern= Coupling[_, {__}, _]| Bar@ Coupling[_, {__}, _]| Power[Coupling[_, {_}, _], _]|
	_Delta| Bar[_Delta]| Log[Times[_, Power[Coupling[_, {_}, _], _]]]|
	LF[{___, Coupling[_, {_}, _], ___}, _];


(* ::Text:: *)
(*Makes a replacement pattern corresponding to a given combination of the couplings. *)


CoefficientPattern[coups:PseudoTimes[nonTrivCouplingPattern..]]:= Module[
		{indices, out, couplingRules},
	(*Replace repeated indicies with patterns*)
	indices= DeleteCases[Tally@ Cases[coups, Index[__], All], {i_, 1}][[;;, 1]];
	indices= With[{temp= Unique@ First@ #}, Rule[#, Pattern[temp, Blank[]]] ]&/@ indices;
	out= coups/. indices;

	(*Build a signed replacement rule*)
	(*couplingRules= Cases[out, c_Coupling-> CouplingPattern@ c];*)
	couplingRules= CouplingPattern/@ List@@ out;
	AppendTo[couplingRules, 1:> coups];
	MapAt[ReleaseHold, RuleDelayed@@ MapThread[PseudoTimes, List@@@ couplingRules], -1]
]


(* ::Text:: *)
(*Constructs a substitution rule with all symmetry permutations of the indices in a coupling pattern -> the sign of the permutation *)


CouplingPattern@ Coupling[lab_, indsPat_, ord_]:= Module[{symsPat, inds, syms, x},
	syms= $CouplingAssociation[lab, Symmetries];
	symsPat= KeyMap[indsPat[[#]]&, syms];
	inds= indsPat/. Verbatim[Pattern][i_, Blank[]]:> i;
	With[{rhs= Normal@ KeyMap[inds[[#]]&, syms],
			lhs= Coupling[lab, x:Alternatives@@ Keys@ symsPat, ord]},
		lhs:> Hold@ (Association@@ rhs)@ x
	]
]

CouplingPattern@ Bar@ Coupling[lab_, indsPat_, ord_]:= Module[{symsPat, inds, syms, x},
	syms= $CouplingAssociation[lab, Symmetries];
	symsPat= KeyMap[indsPat[[#]]&, syms];
	inds= indsPat/. Verbatim[Pattern][i_, Blank[]]:> i;
	With[{rhs= Normal@ KeyMap[inds[[#]]&, syms],
			lhs= Bar@ Coupling[lab, x:Alternatives@@ Keys@ symsPat, ord]},
		lhs:> Hold@ (Association@@ rhs)@ x
	]
]

CouplingPattern@ pow:Power[_Coupling, _]:= pow:> 1;
CouplingPattern@ log_Log:= log:> 1;


(*Account for the symmetries of the Loop functions*)
CouplingPattern@ LF[masses_, subscripts_]:= Module[{perms, n},
	perms= Transpose@ {masses, Most@ subscripts, Table[n, {n, Length@ masses}]};
	perms= GroupBy[perms, {#[[1, 1]], #[[2]]} &];
	perms= KeyValueMap[If[GetCouplings[#1, DiagonalCoupling] === {}, {#2[[;;, -1]]}, Permutations@ #2[[;;, -1]]]&,
		perms];

	With[{lhs= Alternatives@@ Table[LF[masses[[n]], Append[subscripts[[n]], subscripts[[-1]]]], {n, Join@@@ Tuples@ perms}]},
		lhs:> 1]
];


(*Put couplings with flavor indices on the same form*)
CouplingPattern@ Delta[indsPat__]:= Delta@ OrderlessPatternSequence@ indsPat:> 1;
CouplingPattern@ Bar@Delta[indsPat__]:= Bar@Delta@ OrderlessPatternSequence@ indsPat:> 1;


(* ::Text:: *)
(*Collect couplings in expression*)


IdentifyCouplings@ coef_:= Module[{out= PseudoTimes@ Expand@ coef, couplingContractions, pats= {}},
	(*If only one term, nothing to collect*)
	If[Head@ out =!= Plus, Return@ ReleasePseudoTimes@ out];
	(*All non-trivial coupling contractions*)
	couplingContractions= Cases[out, _PseudoTimes, All];
	couplingContractions= PseudoTimes@@@ DeleteCases[Cases[#,
		nonTrivCouplingPattern]&/@ couplingContractions, {}];

	(*Construct patterns*)
	(*Optimization may be required*)
	While[Length@ couplingContractions> 0,
		AppendTo[pats, CoefficientPattern@ First@ couplingContractions];
		couplingContractions= DeleteCases[couplingContractions, pats[[-1, 1]]];
	];
	(*Remove everything but the coupling patterns from PseudoTimes*)
	out= out//. PseudoTimes[a___, b: Except[nonTrivCouplingPattern]]:>
		b PseudoTimes@ a;
	out/. pats// ReleasePseudoTimes
]


(* ::Subsubsection::Closed:: *)
(*Collect couplings in operator expression *)


(* ::Text:: *)
(*Collect all operators and organizes their coefficients on canonical form *)


CollectCoefficients@ expr_:= Quiet[Collect[expr, {_AtomicOp|_CompOp, hbar, \[Epsilon]},
	Collect[RelabelIndices@IdentifyCouplings[#], {Power[_Coupling,_?Negative],_LF,_Log}, Simplify[#,TimeConstraint->0.1]&]&
	(* This seems to be the best compromise between simplified coefficients and computation time *)
],Simplify::time]


(* ::Text:: *)
(*Try the following options instead of Simplify here:*)
(* - Use Factor*)
(* - Use Expand*)
(* - Add TimeConstraint*)
(* - Use Simplify[_,TransformationFunctions->{Factor,Expand}] possibly with other functions?*)


(* ::Subsubsection::Closed:: *)
(*Collect  couplings  with  operator  symmetries*)


(* ::Subsubsection::Closed:: *)
(*Collect coefficient of operators*)


Options[CollectCoefficientsWithSyms] = {"ContractOverallDelta" -> True}


CollectCoefficientsWithSyms[expr_, OptionsPattern[]]:= Module[{out},
	out=  Collect[CanonizeLoopFunctions@ expr, {_AtomicOp|_CompOp}];

	(*Should be updated when we implement flavor symmetries in the simplification module*)
	out= out/. {
		Times[coef___, op:AtomicOp[class_, id_, inds_]]:> op*
			IdentifyCouplingsWithSyms[Times@ coef, inds, $operators[class, id, Symmetries]],
		Times[coef___, op:CompOp[red_, class_, id_, inds_]]:> op*
			IdentifyCouplingsWithSyms[Times@ coef, inds, $compoundOperators[red, class, id, Symmetries]]
	};
	
	out= Collect[out, {_AtomicOp|_CompOp, hbar, \[Epsilon]},
		(*Simplify@* RelabelIndices*) (* Simplify is very slow for large expressions *)
		Quiet[
			Collect[RelabelIndices[#], {Power[_Coupling,_?Negative],_LF,_Log}, Simplify[#,TimeConstraint->0.1]&]
			,
			Simplify::time
		]&
	];
	
	If[OptionValue["ContractOverallDelta"],
		(* convert output to list without expanding it -> do NOT use TermsToList here! *)
		out= If[Head@ out === Plus, List@@ out, List@ out];
	
		(* contract back overall deltas *)
		out= Plus@@( ContractDeltaSingleTerm[#,"overall-only"->True]&/@ out )
	];
	
	out
]


IdentifyCouplingsWithSyms[coef_, opInds_, syms_]:= Module[
		{out= PseudoTimes@ BetterExpand@ coef, couplingContractions, pats= {}},
	(*If only one term, nothing to collect*)
	If[Head@ out =!= Plus, Return@ ReleasePseudoTimes@ out];
	(*All non-trivial coupling contractions*)
	couplingContractions= Cases[out, _PseudoTimes, All];
	couplingContractions= PseudoTimes@@@ DeleteCases[Cases[#,
		nonTrivCouplingPattern]&/@ couplingContractions, {}];

	(*Construct patterns*)
	(*Optimization may be required*)
	(*n=0;*)
	While[Length@ couplingContractions> 0,
		AppendTo[pats, CoefficientPatternWithSyms[First@ couplingContractions, opInds, syms]];
		couplingContractions= DeleteCases[couplingContractions, pats[[-1, 1]]];
		(*n++;*)
	];

	(*Remove everything but the coupling patterns from PseudoTimes*)
	out= out//. PseudoTimes[a___, b: Except[nonTrivCouplingPattern]]:>
		b PseudoTimes@ a;
	out/. pats// ReleasePseudoTimes
]


(* ::Subsubsection::Closed:: *)
(*Construct coefficient patterns*)


CoefficientPatternWithSyms[coups:PseudoTimes[nonTrivCouplingPattern..], opInds_, syms_]:= Module[
		{openInds, perm, repInds, out, couplingRules, openSign, symmetrizeDeltas, deltaSubs, LHS, myPattern},
	(*Replace repeated indicies with patterns*)
	repInds= Tally@ Cases[coups/. $DropDiagonalCouplings, Index[__], All];
	repInds= DeleteCases[repInds, {i_, 1}][[;;, 1]];

	repInds= With[{temp= Unique@ First@ #}, Rule[#, Pattern[temp, Blank[]] ] ]&/@ repInds;
	openInds= With[{temp= Unique@ First@ #}, Rule[#, Pattern[temp, Blank[]] ] ]&/@ opInds;

	out= coups/. repInds/. openInds;

	openSign= KeyMap[opInds[[#]]&, Association@ syms];
	openInds= openInds[[;;, 2, 1]];


	(* above the symmetries of the operator are considered *)
	(* below we add symmetries due to delta functions appearing in the coupling *)
	(* we assume that one of the two indices of the delta is contracted only to the operator and does not appear anywhere else in the coupling *)
	(* this is ensured by ContractDelta and OperatorFlavorSeparate *)
	Do[
		openSign = Join[openSign, KeyMap[(#/.{First[delta]->Last[delta],Last[delta]->First[delta]})&,openSign]]
		,
		{delta,Cases[coups,_Delta]}
	];


	(*Build a signed replacement rule*)
	couplingRules= CouplingPattern/@ List@@ out;

	With[{os= openSign, oi= openInds},
		AppendTo[couplingRules, 1:> coups* Hold[os@ oi]];
	];

	out= MapAt[ReleaseHold, RuleDelayed@@ MapThread[PseudoTimes, List@@@ couplingRules], -1];

	(*
	(* below code does not work in, since CouplingPattern relies on fixed flavor index names and does not know about the external deltas *)

	(* use custom Symbol for Pattern to treat them like symbols *)
	out = out /. Pattern->myPattern;

	(* construct a rule to symmetrize the expression in all indices appearing in deltas on the lhs of the rule *)
	symmetrizeDeltas= ((First[#]|Last[#])->First[#]|Last[#]) &/@ Cases[First[out],\[Delta]_Delta:>(\[Delta]/.OrderlessPatternSequence->Sequence)];

	(* drop all Delta from the LHS of the rule and construct the corresponding rule for resubstituting them *)
	{LHS, deltaSubs} = Reap[First[out]/.{delt_Delta:>First@Sow[Unique["\[Delta]$"]->delt]}];
	deltaSubs = First[deltaSubs,{}];

	(* symmetrize the remaining LHS and resubstitute the Delta afterwards *)
	LHS = LHS /. symmetrizeDeltas /. deltaSubs;

	(* use the new LHS for the output *)
	out[[1]] = LHS;

	(* replace all Pattern *)
	out = out /. myPattern->Pattern;
	*)

	With[{os= Keys@ openSign, oi= openInds},
		MapAt[(Condition[#, MemberQ[os, oi]]&), out, 1]
	]
]
