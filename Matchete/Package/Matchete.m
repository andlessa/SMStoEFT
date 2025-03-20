(* ::Package:: *)

Package["Matchete`"]


(* ::Title:: *)
(*Matchete`*)


(* ::Subtitle:: *)
(*Paclet for routines options and utility functions*)


(* ::Chapter:: *)
(*Public:*)


(* ::Section:: *)
(*Scoping*)


(* ::Subsubsection::Closed:: *)
(*Exported*)


PackageExport["$MatchetePath"]
PackageExport["CheckForUpdate"]
PackageExport["SuggestBibliography"]


(* ::Text:: *)
(*Deprecated*)


PackageExport["DefineGroupRepresentation"]
PackageExport["DefineGroup"]


(* ::Subsubsection::Closed:: *)
(*Internal*)


PackageScope["OptionsCheck"]
PackageScope["OptionTest"]
PackageScope["OptionMessage"]


PackageScope["Defined"]
PackageScope["OptionalMonitor"]
PackageScope["PrintMessages"]
PackageScope["RemoveAssociatedDownValues"]
PackageScope["RemoveAssociatedUpValues"]


PackageScope["SubscriptStyle"]


PackageScope["PseudoTimes"]
PackageScope["ReleasePseudoTimes"]


PackageScope["FindPermutationOrder"]
PackageScope["InversePermutationOrder"]


PackageScope["ReplaceListSubExprs"]
PackageScope["ReplaceFirst"]
PackageScope["ReplaceShieldSubexpressions"]


PackageScope["SelectAndDelteCases"]


PackageScope["TermsToList"]


PackageScope["IntegerSets"]
PackageScope["NonOverlappingPairs"]


PackageScope["BetterExpand"]
PackageScope["LagrangianExpand"]
PackageScope["FastExpand"]
PackageScope["LayeredExpand"]


PackageScope["MyPrint"]


PackageScope["$PrintMessages"]


PackageScope["$tally"]
PackageScope["IncreaseTally"]
PackageScope["AppendTally"]


PackageScope["AddToBibliography"]


PackageScope["$ValidationRun"]
PackageScope["ValidateCurrentVersion"]
PackageScope["UpdateValidation"]
PackageScope["ActivateValidationMode"]
PackageScope["RunUnitTests"]
PackageScope["SaveValidationResults"]


(* ::Section:: *)
(*Usage messages*)


(* ::Subsubsection::Closed:: *)
(*Exported*)


$MatchetePath::usage  = "$MatchetePath is the path to the Matchete package."


CheckForUpdate::usage = "CheckForUpdate[] compares the local Matchete version to the one in the git repository."


SuggestBibliography::usage = "SuggestBibliography[] automatically collects and prints the suggested bibliography based on the usage of functions in the current Matchete session. Option \"Explanation\"-> True can be used to get the reason behind the suggestion of the individual papers. Option \"References\"-> All can be used to get a list of all papers associated with the Matchete package.";


(* ::Text:: *)
(*Deprecated*)


DefineGroupRepresentation::usage= "\"DefineGroupRepresentation\" is deprecated as of v0.3.0. Please refer to \"DefineRepresentation\" instead."
DefineGroup::usage= "\"DefineGroup\" is deprecated as of v0.3.0. Please refer to \"DefineCGGroup\" instead."


(* ::Subsubsection::Closed:: *)
(*Internal*)


OptionsCheck::usage  = "OptionsCheck can be applied on any function with optional arguments and checks the validity of optional arguments.";
OptionTest::usage    = "OptionTest[opt,func,val] must be implemented such that it returns True if val is an allowed value for the option opt in the function func, and False otherwise. ";
MyPrint::usage       = "MyPrint[message,Verbose -> True/False] is a printing function that can be deactivated when Verbose is set to False. The Verbose option is set to the global flag $PrintMessages, which can be changed using the PrintMessages routine."


PrintMessages::usage  = "PrintMessages[True/False] sets whether information messages are displayed by some of the routines."


$ValidationRun::usage= "Global flag for vor validation mode."
ActivateValidationMode::usage= "SaveForValidation[\"model name\", bool] specifies that the next time the Match routine is called, the results are saved to an internal database for comparison. The String argument \"model name\" should match the shorthand name used for the model. The boolean argument \"reset\" specifies whether the derived results should replace the previous results or be treated as the new reults.";
UpdateValidation::usage= "Saves matching results for all model files to an internal directory for later comparison.";
ValidateCurrentVersion::usage= "Compares the current version of the code for a preset list of models to results obtainde on an earlier version of the code. Use option \"Tests\"-> <file name(s)> to specify which test files to use (default `All`). Use option \"Detail\"-> True to see the individual results of all tests.";


(* ::Chapter:: *)
(*Private:*)


$MatchetePath=DirectoryName[$InputFileName,2];


(* ::Section:: *)
(*Version*)


(* ::Subsubsection::Closed:: *)
(*Version information*)


$MatcheteVersionURL = "https://gitlab.com/matchete/matchete/-/raw/master/version";


GetVersionString[]:=StringTrim[First@StringSplit[Import@FileNameJoin[{$MatchetePath,"version"}],"\n"]]


CheckForUpdate[]:=Module[{importString,nrOnly,yn},
	importString = Import[$MatcheteVersionURL];
	If[importString === $Failed || Head[importString]=!=String, Print["Could not fetch version number from repository."]; Return[]];
	nrOnly = First @ StringSplit[importString, "\n"];

	If[StringTrim[nrOnly] === GetVersionString[],
		MessageDialog["Matchete is up-to-date.\nYour version: "<>GetVersionString[]],
		yn = ChoiceDialog["A new Matchete version is available!\nYour version: "<> GetVersionString[]<>"\nNew version: "<>StringTrim@nrOnly<>" ("<>StringSplit[importString, "\n"][[2]]<>")\n\n"<>"Do you want to update?",{"Yes"->True,"No"->False}];
		If[yn,UpdateMatchete[]]
	];
]


UpdateMatchete[]:=Module[{},
	Import["https://gitlab.com/matchete/matchete/-/raw/master/install.m"]
]


(* ::Section:: *)
(*Meta level functions*)


(* ::Subsection:: *)
(*OptionsChecker*)


(* ::Subsubsection::Closed:: *)
(*General constructions*)


(* ::Text:: *)
(*General function for checking Options of functions*)


SetAttributes[OptionsCheck, HoldFirst];
OptionsCheck @ func_[___, opts : OptionsPattern[]] := And[
	And@@ (Message[General::invalidopt, #1, func] &)@@@ FilterRules[List@ opts, Except@ Options@ func],
	And@@ (OptionTest[func, #1][#2] || OptionMessage[#1, func, #2] &)@@@ FilterRules[List@ opts, Options@ func]
];


General::invalidopt = "Invalid option `1` given for function `2`.";
General::invalidarg = "Option `1` for function `2` received invalid value `3`.";
General::optexpectsval = "Option `1` for function `2` received invalid value `3`. A `4` is expected.";
OptionMessage[opt_, func_, val_] := Message[General::invalidarg, opt, func, val];


(* ::Subsubsection::Closed:: *)
(*Option tests*)


(* ::Text:: *)
(*Specific tests for options*)


(*KEEP ALPHABETICAL in option name please*)
OptionTest[_, AdjAlphabet]                   = #===None||(ListQ[#]&&And@@(Head[#1]===String&/@#))&;
OptionTest[_, AppendEffectiveCouplingsDefs]  = BooleanQ;
OptionTest[_, CanonicallyNormalized]         = BooleanQ;
OptionTest[_, ChargeNeutral]                 = BooleanQ;
OptionTest[_, Chiral]                        = MatchQ[False|LeftHanded|RightHanded];
OptionTest[_, ClosedSpinChains]              = BooleanQ;
OptionTest[_, ContractedIndices]             = BooleanQ;
OptionTest[_, DetailedOutput]                = BooleanQ;
OptionTest[_, DummyCoefficients]             = BooleanQ;
OptionTest[_, EffectiveCouplingSymbol]       = StringQ;
OptionTest[EOMSimplify, EFTOrder]            = MatchQ[All| a_Integer/; a>= 4];
OptionTest[_, EFTOrder]                      = MatchQ[{_Integer?Positive}| (_Integer?Positive)];
OptionTest[_, FundAlphabet]                  = #===None||(ListQ[#]&&And@@(Head[#1]===String&/@#))&;
OptionTest[_, FreeOfGaugeFields]             = BooleanQ;
OptionTest[_, FreeOfHeavyTadpoles]           = BooleanQ;
OptionTest[_, GaugeAnomalies]                = BooleanQ;
OptionTest[_, HeavyMassBasis]                = BooleanQ;
OptionTest[_, Hermiticity]                   = BooleanQ;
OptionTest[_, IndexAlphabet]                 = #===None||(ListQ[#]&&And@@(Head[#1]===String&/@#))&;
OptionTest[_, KeepTrivalReplacements]        = BooleanQ;
OptionTest[_, LoopOrder]                     = MatchQ[0| 1| {1}];
OptionTest[_, ModelParameters]               = (ListQ[#] && And@@(Head[#1]===Rule &/@#))&;
OptionTest[_, Path]                          = BooleanQ;
OptionTest[_, ReductionIdentities]           = MatchQ[dDimensional|Evanescent|EvanescenceFree|FourDimensional];
OptionTest[_, Rules]                         = BooleanQ;
OptionTest[_, SelfConjugate]                 = Or[BooleanQ[#],VectorQ[#,Positive]]&;
OptionTest[_, Simplifications]               = MatchQ[All| None];
OptionTest[_, SortByEFTOrder]                = BooleanQ;
OptionTest[_, Symmetries]                    = ListQ;
OptionTest[_, UndefinedObject]               = BooleanQ;
OptionTest[Match, Verbose]                   = MatchQ[Print|Monitor|None];
OptionTest[_, Verbose]                       = BooleanQ;
OptionTest[_, WhichTraces]                   = MatchQ[{_List..}|All];


(* ::Subsubsection::Closed:: *)
(*Error messages*)


(* ::Text:: *)
(*Error messages for the options*)


(*KEEP ALPHABETICAL in option name please*)
OptionMessage[AdjAlphabet, func_, val_]                  := Message[General::optexpectsval, AdjAlphabet, func, val, "list of strings or None"];
OptionMessage[AppendEffectiveCouplingsDefs, func_, val_] := Message[General::optexpectsval, Verbose, func, val, "Boolean"];
OptionMessage[Chiral, func_, val_]                       := Message[General::optexpectsval, Chiral, func, val, "value False, LeftHanded, or RightHanded"];
OptionMessage[DummyCoefficients, func_, val_]            := Message[General::optexpectsval, DummyCoefficients, func, val, "Boolean"];
OptionMessage[EffectiveCouplingSymbol, func_, val_]      := Message[General::optexpectsval, EffectiveCouplingSymbol, func, val, "String"];
OptionMessage[EFTOrder, EOMSimplify, val_]               := Message[General::optexpectsval, EFTOrder, EOMSimplify, val, "integer >=4 or the value All"];
OptionMessage[EFTOrder, func_, val_]                     := Message[General::optexpectsval, EFTOrder, func, val, "positive integer or List with one positive integer"];
OptionMessage[FundAlphabet, func_, val_]                 := Message[General::optexpectsval, FundAlphabet, func, val, "list of strings or None"];
OptionMessage[IndexAlphabet, func_, val_]                := Message[General::optexpectsval, IndexAlphabet, func, val, "list of strings or None"];
OptionMessage[KeepTrivalReplacements, func_, val_]       := Message[General::optexpectsval, Verbose, func, val, "Boolean"];
OptionMessage[LoopOrder, func_, val_]                    := Message[General::optexpectsval, LoopOrder, func, val, "value 0, 1 or {1}"];
OptionMessage[ModelParameters, func_, val_]              := Message[General::optexpectsval, ModelParameters, func, val, "list of replacement rules"];
OptionMessage[Path, func_, val_]                         := Message[General::optexpectsval, Path, func, val, "Boolean"];
OptionMessage[ReductionIdentities, func_, val_]          := Message[General::optexpectsval, ReductionIdentities, func, val, "value dDimensional, Evanescent, EvanescenceFree, or FourDimensional"];
OptionMessage[SelfConjugate, func_, val_]                := Message[General::optexpectsval, SelfConjugate, func, val, "boolean (True or False) or a list of positive integers indicating the index positions"];
OptionMessage[Simplifications, func_, val_]              := Message[General::optexpectsval, Simplifications, func, val, "value All or None"];
OptionMessage[SortByEFTOrder, func_, val_]               := Message[General::optexpectsval, Verbose, func, val, "Boolean"];
OptionMessage[Symmetries, func_, val_]                   := Message[General::optexpectsval, Symmetries, func, val, "a list of index symmetries"];
OptionMessage[Verbose, Match, val_]                      := Message[General::optexpectsval, Verbose, Match, val, "Print, Monitor or None"];
OptionMessage[Verbose, func_, val_]                      := Message[General::optexpectsval, Verbose, func, val, "Boolean"];


(* ::Subsection:: *)
(*Check and change functions*)


(* ::Subsubsection::Closed:: *)
(*Defined*)


(* An auxiliary function that determines if a variable has already been defined *)
Defined[label_] := ValueQ[label] ||
               Head@label =!= Symbol ||
               Attributes[label] =!= {} ||
               DownValues[label] =!= {} ||
               SubValues[label] =!= {} ||
               Head[label::usage]=!=MessageName


(* ::Subsubsection::Closed:: *)
(*Remove associated DownValues and UpValues*)


(* ::Text:: *)
(*Selectively unsets all DownValues of a symbol, whose arguments matches the given pattern*)


SetAttributes[RemoveAssociatedDownValues, HoldAllComplete];


RemoveAssociatedDownValues[func_[arg___]]:= Module[{values},
	values= Cases[DownValues@ func, 
		HoldPattern[Verbatim[HoldPattern][func[p:PatternSequence@ arg]]:> _]:> {p}];
	func[##]=. & @@@ values;
];


(* ::Text:: *)
(*Selectively unsets all UpValues of a symbol, whose arguments matches the given pattern*)


SetAttributes[RemoveAssociatedUpValues, HoldAllComplete];


RemoveAssociatedUpValues[func_[arg___]]:= Block[{},
	UpValues@ func= DeleteCases[UpValues@ func, 
		HoldPattern[Verbatim[HoldPattern][_[___, func[PatternSequence@ arg], ___]]:> _]];
];


(* ::Subsection:: *)
(*Print function that can be globally deactivated*)


(* ::Subsubsection::Closed:: *)
(*OptionalMonitor*)


(* ::Text:: *)
(*A version of monitor that can be disabled (while still executing the code), controlled by the 3rd Boolean argument*)


SetAttributes[OptionalMonitor, HoldRest];
OptionalMonitor[True, expr_, mon_]:= Monitor[expr, mon];
OptionalMonitor[False, expr_, mon_]:= expr;


(* ::Subsubsection::Closed:: *)
(*Setter function for the printing flag*)


PrintMessages::flag="The flag '`1`' is not a boolean. Please use either True or False."


$PrintMessages=False;
PrintMessages[flag_]:=Module[{},
	If[!BooleanQ[flag],
		Message[PrintMessages::flag,flag];
		Abort[]
	];

	$PrintMessages=flag;
]


(* ::Subsubsection::Closed:: *)
(*Options*)


Options[MyPrint]={Verbose :> $PrintMessages}


(* ::Subsubsection::Closed:: *)
(*MyPrint*)


MyPrint[string__,OptionsPattern[]]? OptionsCheck:=Module[{},
	If[OptionValue@Verbose,Print[string]];
];


(* ::Subsection:: *)
(*Other*)


(* ::Subsubsection::Closed:: *)
(*Tally function*)


(* ::Text:: *)
(*Function to keep a tally. For debugging purposes*)


$tally= <||>;
IncreaseTally[h_, n_:1]:= If[KeyExistsQ[$tally, h], $tally[h]+= n, $tally[h]= n];
AppendTally[h_, elem_]:= If[KeyExistsQ[$tally, h], AppendTo[$tally[h], elem], $tally[h]= {elem}];


(* ::Subsubsection::Closed:: *)
(*Auto-completion function*)


AddAutoCompletion[function_String][args___]:=Module[{processed},
	processed=ReplaceAll[{args},
	{
		None->0,
		"AbsoluteFileName"->2,
		"RelativeFileName"->3,
		"Color"->4,
		"PackageName"->7,
		"DirectoryName"->8,
		"InterpreterType"->9
	}
	];
	Function[FE`Evaluate@FEPrivate`AddSpecialArgCompletion@#][function->processed]
]


(* ::Section:: *)
(*Utility functions*)


(* ::Subsection:: *)
(*Expansion*)


(* ::Text:: *)
(*Smarter versions of the Expand function, which can be incredibly slow at times *)


(* ::Subsubsection::Closed:: *)
(*BetterExpand*)


(* ::Text:: *)
(*BetterExpand distributes over Plus, for MUCH better performance on long expressions. Why is this  not default Mathematica behaviour?*)


BetterExpand@ expr_Plus:= Expand/@ expr;
BetterExpand@ expr_:= Expand@ expr;


(* ::Subsubsection::Closed:: *)
(*LagrangianExpand*)


(* ::Text:: *)
(*Distributes all sums that may appear in Lagrangian terms (including positive powers)*)


LagrangianExpand@ expr_Plus:= LagrangianExpand/@ expr;
LagrangianExpand@ expr_Times:= Block[{out,n},
	out= expr/. pwr:Power[_Plus, _Integer? Positive]:> Expand@ pwr;
	(*FixedPoint[Dist, out]*)
	out//. x_Times:> Distribute@ x
	(*Do[
		out= Replace[out, x_Times:> Distribute@ x, {n}];
	, {n, Depth@ out, 0, -1}];
	out*)
]
LagrangianExpand[expr:Power[_, _Integer? Positive]]:= Expand@ expr;
LagrangianExpand@ expr_:= expr;


(*Dist@ expr_Plus:= Dist/@ expr;
Dist@ term_Times:= Distribute[term, Plus, Times];*)


(* ::Subsubsection::Closed:: *)
(*FastExpand (experimental)*)


(* ::Text:: *)
(*Fast expansion on all levels for very large expressions (with several layers of Times & Plus) *)


(* ::Text:: *)
(*Can throw an error if $RecursionLimit is set too low, but might crash the Wolfram kernel if $RecursionLimit is set too high.*)


FastExpand[arg_]:=Module[{res,myPlus,recLimit=$RecursionLimit},
	$RecursionLimit=5000; (* this function is fast but uses many recursions *)
	(* Wrap all sums on all level with a MultiplicationBox *)
	res=arg//.sum_Plus:>MultiplicationBox[myPlus@@sum];
	(* the change Plus <-> myPlus is necessary for ReplaceRepeated to terminate *)
	res=res//.myPlus->Plus;
	(* remove MultiplicationBox after all UpValues triggered *)
	$RecursionLimit=recLimit;
	res//.MultiplicationBox->Identity
]


(* fast multiplication of 2 sums *)
MultiplicationBox/:MultiplicationBox[sum1_Plus]*MultiplicationBox[sum2_Plus]:=MultiplicationBox[
	Plus@@ListConvolve[List@@sum1,List@@sum2,1]
]

(* fast expansions of powers of sums *)
MultiplicationBox/:Power[MultiplicationBox[sum_Plus],pow_/;(IntegerQ[pow]&&pow>=2)]:=Power[MultiplicationBox[sum],pow-2]*MultiplicationBox[Plus@@ListConvolve[List@@sum,List@@sum,1]]

(* fast multiplication with prefactors *)
MultiplicationBox/:(coeff:Except[_MultiplicationBox|_Plus|Power[_MultiplicationBox|_Plus,_]])*MultiplicationBox[sum_Plus]:=MultiplicationBox[
	Plus@@ListConvolve[{coeff},List@@sum,1]
]

(* combine sums - should never be necessary *)
MultiplicationBox/:x_+MultiplicationBox[sum_Plus]:=MultiplicationBox[x+sum]

(* flatten MultiplicationBox *)
MultiplicationBox@MultiplicationBox[x_]:=MultiplicationBox[x]

(* simplify vanishing expressions *)
MultiplicationBox[0]=0;

(* some additional definitions *)
MultiplicationBox/:Bar[MultiplicationBox[arg_]]:=MultiplicationBox[Bar[arg]]
MultiplicationBox/:Transp[MultiplicationBox[arg_]]:=MultiplicationBox[Transp[arg]]
MultiplicationBox/:CConj[MultiplicationBox[arg_]]:=MultiplicationBox[CConj[arg]]


(* ::Subsubsection::Closed:: *)
(*LayeredExpand (very experimental)*)


(* thread over sums *)
LayeredExpand[arg_Plus]:=LayeredExpand/@arg

(* determine depth of expression *)
LayeredExpand[arg_]:=LayeredExpand[arg,Depth[arg]]

(* expand sums starting from deepest level *)
LayeredExpand[arg_,depth_]:=LayeredExpand[
	Replace[arg,{Times[coeff__,sum_Plus]:>Plus@@ListConvolve[{coeff},List@@sum,1]},{depth}],
	depth-1
]

(* stop expansion once level 0 is reached *)
LayeredExpand[arg_,-1]:=arg


(* ::Subsection:: *)
(*Permutations*)


(* ::Subsubsection::Closed:: *)
(*FindPermutationOrder*)


(* ::Text:: *)
(*Returning the ordering list needed to make  permutation[[ordering list]] === target*)


FindPermutationOrder[permutation_List, target_List]:=
	Permute[Range@ Length@ target, FindPermutation[permutation, target]]


(* ::Subsubsection::Closed:: *)
(*InversePermutation*)


(* ::Text:: *)
(*Produces the inverse of the given permutation*)


InversePermutationOrder[permutation_List]:= Ordering@ permutation;


(* ::Subsection:: *)
(*Replacement functions*)


(* ::Subsubsection::Closed:: *)
(*ReplaceListSubExprs*)


(* ::Text:: *)
(*Function mimicking ReplaceList but on all subexpressions*)


(*This implementation does not apply the rules in all posible ways at each subexpression*)
(*ReplaceListSubExprs[expr_, rule_Rule|rule_RuleDelayed]:=
	MapAt[Function[{x}, x/. rule], expr, #]&/@ Position[expr, First@ rule, Infinity];*)


ReplaceListSubExprs[expr_, rule_Rule|rule_RuleDelayed]:= Module[{op, pos, rep},
	Flatten[Table[
			op= expr;
			op[[Sequence@@ pos]]= rep;
			op
		, {pos, Position[expr, First@ rule]}
		, {rep, ReplaceList[expr[[Sequence@@ pos]], rule]}]
	, 1]
]


ReplaceListSubExprs[expr_, rules:{_Rule|_RuleDelayed...}]:= Module[{rule},
	Join@@ Table[ReplaceListSubExprs[expr, rule], {rule, rules}]
]


(* ::Subsubsection::Closed:: *)
(*ReplaceFirst*)


(* ::Text:: *)
(*Function applying a replacement rule once on the first match to the rule*)


ReplaceFirst[expr_, rule_Rule|rule_RuleDelayed]:=
	MapAt[Function[{x}, x/. rule], expr, FirstPosition[expr, First@ rule, {}] ];


(* ::Subsubsection::Closed:: *)
(*ReplaceShieldSubexpressions*)


ReplaceShieldSubexpressions[expr_, rule_Rule|rule_RuleDelayed, shieldPattern_]:=
	ReplaceShieldSubexpressions[expr, {rule}, shieldPattern]; 


ReplaceShieldSubexpressions[expr_, rules:{(_Rule|_RuleDelayed)..}, shieldPattern_]:= Module[{shieldPos, replacePos},
	shieldPos= Position[expr, shieldPattern];
	shieldPos= Alternatives@@ (Append[#, ___]&)/@ shieldPos;
	replacePos= Position[expr, Alternatives@@ First/@ rules];
	(*Remove all replacement positions that are in the shielded part of the expression*)
	replacePos= Select[replacePos, Not@* MatchQ[shieldPos]];
	ReplaceAt[expr, rules, replacePos]
]


(* ::Subsection:: *)
(*Combinatorics function*)


(* ::Subsubsection::Closed:: *)
(*IntegerSet*)


(* ::Text:: *)
(*IntegerSet[s,n] returns all ordered sets of n integers {Subscript[\[Mu], 1],...,Subscript[\[Mu], n]}, such that Subscript[\[CapitalSigma], k] Subscript[\[Mu], k]=s and Subscript[\[Mu], k]>=0.*)


IntegerSets[sum_, ints_]:= Flatten[Permutations@ PadRight[#, ints]&/@
	DeleteCases[IntegerPartitions@ sum, _?(Length@ # > ints &)], 1];


(* ::Subsubsection::Closed:: *)
(*Non-overlapping pairs*)


(* ::Text:: *)
(*NonOverlappingPairs returns all possible ways of splitting a set into an unordered set non-overlapping unordered pairs. For a set of size n there are (n-1)!! such splittings. There are no ways for set of an odd size. *)


NonOverlappingPairs@ {}:= {{}};
NonOverlappingPairs@ set_List:= Block[{len= Length@ set},
	(*If[OddQ@ len, Abort[]];*)
	Flatten[Table[
		Join[{set[[{1, n}]]}, #]&/@ NonOverlappingPairs@ Join[set[[2;; n-1]], set[[n+1;; len]]]
	,{n, 2, len}], 1]
]


(* ::Subsection:: *)
(*Other*)


(* ::Subsubsection::Closed:: *)
(*PseudoTimes*)


(* ::Text:: *)
(*A Times-like head to expand out powers *)


SetAttributes[PseudoTimes, {Orderless}];
PseudoTimes@ expr_Plus:= PseudoTimes/@ expr;
PseudoTimes@ expr_Times:= PseudoTimes@@ expr;
PseudoTimes[a___, PseudoTimes@ b___]:= PseudoTimes[a, b]
PseudoTimes[a___, n_Integer]:= n PseudoTimes@ a;
PseudoTimes[a___, b_Plus]:= PseudoTimes[a, #]&/@ b;
PseudoTimes[a___, Power[b_, n_Integer/; n > 1]]:= PseudoTimes[a, Sequence@@ ConstantArray[b, n]];


ReleasePseudoTimes@ expr_:= expr/. PseudoTimes-> Times;


(* ::Subsubsection::Closed:: *)
(*Select and delete cases in an expression *)


SelectAndDelteCases[expr_, rule:(Rule|RuleDelayed)[lhs_, _], args___]:=
	{Cases[expr, rule, args], DeleteCases[expr, lhs, args]};
SelectAndDelteCases[expr_, args__]:= {Cases[expr, args], DeleteCases[expr, args]};


(* ::Subsubsection::Closed:: *)
(*TermsToList*)


(* ::Text:: *)
(*Transform a sum of terms into a list, or convert a single term into a list*)


TermsToList@ expr_:= Module[{temp= LagrangianExpand@ expr},
	If[Head@ temp === Plus, List@@ temp, List@ temp]
];


(* ::Section:: *)
(*Generate bibliography*)


(* ::Subsubsection::Closed:: *)
(*SuggestBibliography function*)


(* ::Text:: *)
(*Function to generate a suggested bibliography to the user  *)


Options@ SuggestBibliography= {
		"References"-> Default,
		"Explanation"-> False
	};


OptionTest[SuggestBibliography, "Explanation"]= BooleanQ;
OptionTest[SuggestBibliography, "References"]= MatchQ[All| Default];


OptionMessage["References", SuggestBibliography, val_]:= 
	Message[General::optexpectsval, "References", SuggestBibliography, val, "value 'All' or 'Default'"];


SuggestBibliography[OptionsPattern[]] ? OptionsCheck:= Module[{abbreviation, reasons, bib, refs},
	(*What references should be included in the bibliography*)
	refs= If[OptionValue@ "References" === All,
			Keys@ MatchetePapers
		,
			Keys@ $RelevantCitations
		];
	
	(*What are the reasons behind the suggestions of the individual references*)
	If[OptionValue@ "Explanation",
		reasons= Table[
			abbreviation= StringReplace[MatchetePapers@ ref, 
				RegularExpression["(^.*\\s)*@article\\{(.*),(.|\\s)*"]:> "$2"];
			abbreviation= "Reference '" <> abbreviation <> "' is suggested for the following reasons:";
			StringJoin@@ Riffle[Prepend[$RelevantCitations@ ref, abbreviation], "\n - "]
		, {ref, refs}];
		
		StringJoin@@ Riffle[reasons, "\n\n"]// Echo
	];
	
	(*Merge the references and present the result*)
	bib= StringJoin@@ Riffle[Lookup[MatchetePapers, refs], "\n\n"];
	CellPrint[Cell[bib, "Output", "PageWidth"-> Infinity]];
	Button["Copy to clipboard", CopyToClipboard@ bib]
];


(* ::Subsubsection::Closed:: *)
(*Function for collecting the bibliography*)


(* ::Text:: *)
(*Function for adding references to the suggested bibliography *)


AddToBibliography[paper_String, reason_String]:= Block[{},
	If[!KeyExistsQ[$RelevantCitations, paper], 
		$RelevantCitations@ paper= {};
	];
	
	If[FreeQ[$RelevantCitations@ paper, reason],
		AppendTo[$RelevantCitations@ paper, reason];
	];
];


$RelevantCitations= <||>;
AddToBibliography["ProofOfConcept", "Use of the core Matchete functionality"];


(* ::Subsubsection::Closed:: *)
(*Collection of all Matchete papers  *)


MatchetePapers= <|
	"EvanescentTreatment"-> 
"%General treatment of evanescent operators in EFT matching (particularly to the SMEFT)
@article{Fuentes-Martin:2022vvu,
    author = {Fuentes-Mart\\'\\i{}n, Javier and K\\\"onig, Matthias and Pag\\`es, Julie and Thomsen, Anders Eller and Wilsch, Felix},
    title = \"{Evanescent operators in one-loop matching computations}\",
    eprint = \"2211.09144\",
    archivePrefix = \"arXiv\",
    primaryClass = \"hep-ph\",
    reportNumber = \"MITP-22-091, TUM-HEP-1428/22, ZU-TH-48/22\",
    doi = \"10.1007/JHEP02(2023)031\",
    journal = \"JHEP\",
    volume = \"02\",
    pages = \"031\",
    year = \"2023\"
}",
	"ProofOfConcept"-> 
"%Introduction of the core Matchete package and v0.1
@article{Fuentes-Martin:2022jrf,
    author = {Fuentes-Mart\\'\\i{}n, Javier and K\\\"onig, Matthias and Pag\\`es, Julie and Thomsen, Anders Eller and Wilsch, Felix},
    title = \"{A proof of concept for matchete: an automated tool for matching effective theories}\",
    eprint = \"2212.04510\",
    archivePrefix = \"arXiv\",
    primaryClass = \"hep-ph\",
    reportNumber = \"MITP-22-105, TUM-HEP-1443/22, ZU-TH-58/22\",
    doi = \"10.1140/epjc/s10052-023-11726-1\",
    journal = \"Eur. Phys. J. C\",
    volume = \"83\",
    number = \"7\",
    pages = \"662\",
    year = \"2023\"
}",
	"SuperTracer"->
"%Early implementation of the functional tools at the heart of Matchete
@article{Fuentes-Martin:2020udw,
    author = {Fuentes-Martin, Javier and K\"onig, Matthias and Pag\`es, Julie and Thomsen, Anders Eller and Wilsch, Felix},
    title = \"{SuperTracer: A Calculator of Functional Supertraces for One-Loop EFT Matching}\",
    eprint = \"2012.08506\",
    archivePrefix = \"arXiv\",
    primaryClass = \"hep-ph\",
    reportNumber = \"MITP-20-076, TUM-HEP-1302/20, ZU-TH-54/20\",
    doi = \"10.1007/JHEP04(2021)281\",
    journal = \"JHEP\",
    volume = \"04\",
    pages = \"281\",
    year = \"2021\"
}"
|>;


(* ::Section:: *)
(*Validation*)


(* ::Subsubsection::Closed:: *)
(*Functionality for the validation of the code*)


(* If True, the Match routine writes its results to an internal database *)
$ValidationRun= False;


(* If True, the results of Match that are saved replace the previous results used for comparisson *)
$UpdateValidationResults= False;


(* ::Text:: *)
(*Function to activate the validation mode*)


ActivateValidationMode[str_String, reset_:False]:=Module[{},
	$ValidationRun= True;
	$UpdateValidationResults= reset;
	$ValidationModelName= str;
];


(* ::Text:: *)
(*Function calling the validation module*)


Options@ ValidateCurrentVersion= {
		"Tests"   -> All,
		"Details" -> False,
		"Models"  -> {"VLF_toy_model", "Singlet_Scalar_Extension", "E_VLL", "S1S3LQs"}
	};


ValidateCurrentVersion[opt:OptionsPattern[]]:= Module[{},
	ResetAll[];
	CheckDocumentation[];
	RunUnitTests["Tests"->OptionValue["Tests"],"Details"->OptionValue["Details"]];
	(*RunUnitTests@ opt;*)
	(* choose models to validate *)
	BranchValidation`$UVmodels= OptionValue["Models"];
	Get@ FileNameJoin[{$MatchetePath, "Validation", "Validation.m"}];
]


(* ::Text:: *)
(*Function to update the matching results used for the validation*)


Options@ UpdateValidation= {
		"Models" -> {"VLF_toy_model", "Singlet_Scalar_Extension", "E_VLL", "S1S3LQs"}
	};


UpdateValidation[OptionsPattern[]]:= Module[{},
	(* choose models to update *)
	UpdateBranchValidation`$UVmodels= OptionValue["Models"];
	Get@ FileNameJoin[{$MatchetePath, "Validation", "UpdateValidation.m"}]
]


(* ::Subsubsection::Closed:: *)
(*Routine to save the matching result for later comparison*)


(* ::Text:: *)
(*Function that writes the matching results to an internal database*)


SaveValidationResults[strResults_, LagrangianEFT_, time_, lag_]:= Module[{traceResults=strResults, Loff, tGreensSimplify, Lon, tEOMSimplify, tMapEffectiveCouplings=None, matchingCond=None,\[ScriptCapitalL]SMEFT},
		(* transform results of individual traces to a rule *)
		traceResults= Apply[Rule, Partition[traceResults,2], {1}];
		(* simplify all traces *)
		traceResults= traceResults /. {(Rule[a_,b_]:>Rule[a,b//ContractCGs//MatchReduce//GreensSimplify])};
		traceResults= Association@@ traceResults;

		(* simplify Lagrangian and save the computation time *)
		{tGreensSimplify, Loff} = Timing@GreensSimplify[LagrangianEFT];

		{tEOMSimplify, Lon}     = Timing@EOMSimplify[LagrangianEFT,DummyCoefficients->False, ReductionIdentities->dDimensional];
		
		(* check MapEffectiveCouplings only for SMEFT like theories*)
		If[!StringMatchQ[$ValidationModelName,"VLF_toy_model"],
			(* need to change context so SMEFT definitions match model definitions *)
			Begin["Global`"];
			\[ScriptCapitalL]SMEFT=LoadModel["SMEFT"];
			End[];
			
			{tMapEffectiveCouplings, matchingCond} = Timing@MapEffectiveCouplings[
				ReplaceEffectiveCouplings@EOMSimplify[LagrangianEFT,ReductionIdentities->EvanescenceFree], 
				ReplaceEffectiveCouplings@EOMSimplify[\[ScriptCapitalL]SMEFT,ReductionIdentities->FourDimensional]
				,
				SortByEFTOrder               -> True,
				KeepTrivalReplacements       -> True,
				AppendEffectiveCouplingsDefs -> True,
				EOMSimplify                  -> False,
				ShiftRenCouplings            -> False,
				ReductionIdentities          -> dDimensional
			];
		];

		(* save all relevant information to an internal directory *)
		SaveForComparison[<|
			"Model"                        -> $ValidationModelName,
			"Version"                      -> Global`$MatcheteVersion,
			"Date"                         -> Today,
			"Time (Match)"                 -> time,
			"Time (GreensSimplify)"        -> tGreensSimplify,
			"Time (EOMSimplify)"           -> tEOMSimplify,
			"Time (MapEffectiveCouplings)" -> tMapEffectiveCouplings,
			"UV Lagrangian"                -> lag,
			"Off-shell EFT Lagrangian"     -> Loff,
			"On-shell EFT Lagrangian"      -> ReplaceEffectiveCouplings[Lon],
			"SuperTraces"                  -> traceResults,
			"Matching Conditions"          -> matchingCond
		|>];

		(* end the validation run mode *)
		$UpdateValidationResults= False;
		$ValidationRun= False;
]


SaveForComparison[expr_Association]:=Module[
	{aux= If[$UpdateValidationResults, "previous", "current"]},
	Export[FileNameJoin@{$MatchetePath, "Validation", "MatchingResults", aux, ToString[expr["Model"]]<>"-EFT.m"}, expr];
];


(* ::Subsubsection::Closed:: *)
(*Run unit tests*)


Options@ RunUnitTests= {
		"Tests"-> All,
		"Details"-> False
	};


RunUnitTests[OptionsPattern[]]:= Module[{results, summary, test, testDi,  testFiles, testNames, testTally},
	testDir= FileNameJoin@{$MatchetePath, "Validation", "Tests"};
	testFiles= FileNames[{testDir <> "/*.wl", testDir <> "/*.m"}];
	(*Filter files*)
	If[(testNames= OptionValue@ "Tests") =!= All,
		testFiles= Cases[testFiles, str_String/; StringContainsQ[str, testNames]];
	];
	Monitor[
		results= Association@@ Table[
			FileNameTake@ file-> TestReport@ file
		, {file, testFiles}];
	, StringForm["Evaluating tests \"`1`\"...", FileNameTake@ file]];
	
	Print["____________________________"];
	If[OptionValue@ "Details",
		KeyValueMap[PrintTestResults[#1,#2] &, results]
	,
		testTally= 0;
		summary= Table[
			summary= SummarizeTestReport@ results@ test;
			If[Length@ summary[[2]] === 0, 
				testTally += summary[[1]];
				Nothing
			,
				test-> summary[[2]]
			]
		, {test, Keys@ results}];
		
		If[Length@ summary === 0, 
			Print[Style["\[CheckmarkedBox] ", Bold, Darker@ Green], Style["All "<> ToString@ testTally <> " unit tests succeeded!", Bold]];
			Print["From the file(s) ", Sequence@@ Flatten@ Table[{Style[test, "Code"], ", "} ,{test, Keys@ results}]];
		,
			Print[Style["\[WarningSign] " <> ToString@ Length@ Flatten@ summary <> " test(s) failed!", Bold, Darker@ Red]];
			summary= Association@@ summary;
			KeyValueMap[Print[Style[#1, "Code"], ":\t",  TableForm@ #2]&, summary] 
		];
	];
	Print["____________________________"];
	
]


SummarizeTestReport[testReport_TestReportObject]:= Module[{failures},
	failures= Table[
			If[test@ "Outcome" === "Success", 
				Nothing
			,
				test
			]
		, {test, testReport["Results"]}];
	{Length@ testReport["Results"], failures}
];


GetTestResults[tr_TestReportObject]:= Module[{abbreviations, fields, results},
	fields= {"TestID", "AbsoluteTimeUsed", "MemoryUsed", "Outcome"};
	abbreviations= {"AbsoluteTimeUsed"-> "Time [s]"};
	results= ReplaceRepeated[Outer[#1[#2]&, Values[tr["TestResults"]], fields],
		{x_Quantity:> QuantityMagnitude[x], x_Real:> Round[x, 0.001]}];
	Join[{fields/. abbreviations}, results]
]


PrintTestResults[name_String,testReport_TestReportObject]:= Module[{list, indx, noTests, time}, 
	list= GetTestResults@ testReport;
	indx= MapIndexed[If[MemberQ[#1, "Failure"|"MessagesFailure"|"Error"], First[#2], Nothing]&, list];
	time= Round[QuantityMagnitude[testReport["TimeElapsed"]], 0.01];
	noTests= Length[testReport["TestResults"]];
	If[TrueQ@ testReport["AllTestsSucceeded"], 
		Print[Style[name, "Code"], ":\t", Style["All tests succeeded! \[CheckmarkedBox]", Bold, Darker@ Green]], 
		Print[Style[name, "Code"], ":\t", 
			Style[ToString@ testReport["TestsFailedCount"] <> " tests failed! \[WarningSign]", Darker@ Red, Bold]];
	];
	Print@ Grid[list, Alignment->Left, Dividers-> {None, {2-> True}}, Background-> {None, Thread[indx->Pink]}];
]


(* ::Subsubsection::Closed:: *)
(*Check documentation*)


CheckDocumentation[]:=Module[{deprecatedSymbs,docuFiles,exportedSymb,missingDocu},
	deprecatedSymbs= {"DefineGroup", "DefineGroupRepresentation"};
	docuFiles= FileNameTake/@ FileNames@FileNameJoin[{$MatchetePath,"DocumentationSource","Documentation","English","ReferencePages","Symbols","*.nb"}];
	docuFiles= FileBaseName/@ docuFiles;
	exportedSymb= Names["Matchete`*"];
	exportedSymb= exportedSymb /. {
		"\[ScriptD]"->"ScriptD",
		"\[Gamma]"->"Gamma",
		"\[Epsilon]"->"Epsilon",
		"\[Mu]bar2"->"Mubar2",
		"\[Sigma]"->"Sigma"
	};
	missingDocu= Complement[exportedSymb,docuFiles,deprecatedSymbs];
	If[Length[missingDocu]>0,
		Print@Style["Warning:",Orange,Bold];
		Print["Missing documentation notebooks for the following exported symbols:"];
		Do[
			Print@Style[ToString[doc],Bold],
			{doc,missingDocu}
		];
		Print["Please add the missing documentation notebooks to the directory "<>FileNameJoin[{$MatchetePath,"DocumentationSouce"}]<>", and then rebuilt the documentation."];
	];
]


(* ::Section:: *)
(*Documentation*)


(* ::Subsubsection::Closed:: *)
(*Names  and  Paths*)


(* ::Text:: *)
(*Fix name and path of the paclet:*)


PacletName= "Matchete"
PacletPath= $MatchetePath


(* ::Text:: *)
(*Path to documentation of the paclet:*)


$PacletDocumentationPath= FileNameJoin[{PacletPath,"Documentation"}]


(* ::Text:: *)
(*Path to where the source of the documentation will be stored:*)


$PacletDocumentationSourcePath= FileNameJoin[{PacletPath,"DocumentationSource","Documentation"}]


(* ::Text:: *)
(*Path to where the HTML version of the documentation will be stored:*)


$PacletDocumentationHTMLPath= FileNameJoin[{PacletPath,"DocumentationHTML","Documentation"}]


(* ::Subsubsection::Closed:: *)
(*Create Template Documentation Notebook*)


PackageScope["CreateTemplateDocumentation"]


CreateTemplateDocumentation::usage="CreateTemplateDocumentation[func] generates a template documentation notebook for the function func.";


CreateTemplateDocumentation[function_String]:=Module[{create=True},
	(* Load DocumentationTools` *)
	Needs["DocumentationTools`"];
	DocumentationTools`DocumentationToolsLoader[];
	
	If[("CurrentPaclet"/.DocumentationTools`SetDocumentationToolsParameters[])=!="Matchete",
		Print["Please first add the Matchete paclet to the DocumentationTools. For details see ", Hyperlink["this link","https://reference.wolfram.com/language/DocumentationTools/workflow/ConfigureAPacletForUseWithDocumentationTools.html"]];
		DocumentationTools`OpenDocumentationToolsPalette[];
		Print["Then run this command again"];
		,
		(* Check if documentation for the given function is already present *)
		If[FileExistsQ@FileNameJoin[{$PacletDocumentationPath,"English","ReferencePages","Symbols",function<>".nb"}],
			DialogInput@DialogNotebook[{
				TextCell["The function "<>function<>" is already documented. Do you want to overwrite the documentation?",16],
				ChoiceButtons[{"Overwrite","Cancel"},{DialogReturn@Nothing,DialogReturn[create=False;NotebookClose[];]}]
			}]
		];
		
		(* create interactive window to create new documentation template *)
		If[create,
			DocumentationTools`CreateNewPageDialog[PacletName,PacletPath,"Reference",function]
			,
			Print["No documentation was generated."];
			Return[];
		];
		
		Print["Please click ok on all notebooks that are opened and then close the template documentation notebook."];
		Print["This will generate a template documentation notebook for the function "<>function<>" in the directory "<>FileNameJoin[{PacletPath,"Documentation","English","ReferencePages","Symbols",function<>".nb"}]];
		Print["Please use the function CopyDocumentationToSourceDirectory[] next to copy the file to the source directory."];
	];
]


(* ::Subsubsection::Closed:: *)
(*Copy documentation to source directory*)


PackageScope["CopyDocumentationToSourceDirectory"]


CopyDocumentationToSourceDirectory::usage="CopyDocumentationToSourceDirectory[] copies newly generated documentation notebooks to the source directory if it does not yet exsit there.
CopyDocumentationToSourceDirectory[\"func\"] copies the documentation notebooks for the function \"func\" to the source directory. If the file already exists, it is asked if the file should be overwritten.";


CopyDocumentationToSourceDirectory[]:=Module[{existingDocs, copiedDocs={}},
	(* Check for existing documentation files *)
	existingDocs= FileNameTake/@FileNames@FileNameJoin[
		{$PacletDocumentationSourcePath,"English","ReferencePages","Symbols","*.nb"}
	];
	
	(* copy all non existing documentation files to the source directory *)
	Do[
		If[FreeQ[existingDocs,FileNameTake[file]],
			AppendTo[copiedDocs, FileNameTake[file]];
			CopyFile[
				file,
				FileNameJoin[{$PacletDocumentationSourcePath,"English","ReferencePages","Symbols",FileNameTake[file]}]
			]
		]
		,
		{file,FileNames@FileNameJoin[{$PacletDocumentationPath,"English","ReferencePages","Symbols","*.nb"}]}
	];
	
	Print["The following files were copied to the documentation source diractory at "<>$PacletDocumentationSourcePath<>":"];
	Print[copiedDocs];
	Print["You can now complete the information in this file in the source directory."];
	Print["Afterwards please call the function BuildDocumentation[] to rebuild the Matchete documentation."];
]


CopyDocumentationToSourceDirectory[func_String]:=Module[
	{
		existing, 
		overwrite = False, 
		fileStart = FileNameJoin[{$PacletDocumentationPath, "English", "ReferencePages", "Symbols", func <> ".nb"}],
		fileEnd   = FileNameJoin[{$PacletDocumentationSourcePath, "English", "ReferencePages", "Symbols", func <> ".nb"}]
	}
	,
	(* Check for existing documentation files *)
	existing= FileExistsQ@ fileEnd;
	
	If[existing,
		DialogInput@DialogNotebook[{
			TextCell["A documentation source file for the function "<>func<>" already exists. Do you want to overwrite the source documentation?",16],
			ChoiceButtons[
				{"Overwrite","Cancel"},
				{DialogReturn[overwrite=True; NotebookClose[];], DialogReturn[overwrite=False; NotebookClose[]; ]}
			]
		}];
		If[overwrite,
			DeleteFile[fileEnd];
			CopyFile[fileStart, fileEnd];
			Print["Overwriting existing documentation."];
			,
			Print["Existing documentation was not overwritten."];
			Return[]
		];
		,
		CopyFile[fileStart, fileEnd];
	];
	Print["You can now complete the information in the documentation notebook in the source directory."];
	Print["Afterwards please call the function BuildDocumentation[] to rebuild the Matchete documentation."];
]


(* ::Subsubsection::Closed:: *)
(*Build documentation*)


PackageScope["BuildDocumentation"]


BuildDocumentation::usage="BuildDocumentation[] builds the documentation of Matchete from its source and links it. Takes the Option \"HTML\" which can be True or False and determines whether to also build the HTML documentation.";


Options[BuildDocumentation] = {"HTML" -> False};


BuildDocumentation[OptionsPattern[]]:=Module[{builtPath=FileNameJoin[{PacletPath,"built"}]},
	(* load PacletTools` *)
	Needs["PacletTools`"];
	
	(* delete old documentation and copy the new source of the documentation*)
	Quiet@DeleteDirectory[$PacletDocumentationPath,DeleteContents->True];
	CopyDirectory[$PacletDocumentationSourcePath,$PacletDocumentationPath];
	
	(* build documentation *)
	PacletTools`PacletDocumentationBuild[PacletPath,builtPath];
	
	(* build HTML documentation if required*)
	If[OptionValue["HTML"],
		PacletTools`PacletDocumentationBuild[PacletPath,$PacletDocumentationHTMLPath,"HTML"];
	];
	
	(* 
	copy newly built documentation: 
		1)  delete old directory again
		2)  copy the built
		3)  delete old directory of built
	*)
	DeleteDirectory[$PacletDocumentationPath,DeleteContents->True];
	CopyDirectory[FileNameJoin[{builtPath,PacletName,"Documentation"}],$PacletDocumentationPath];
	DeleteDirectory[builtPath,DeleteContents->True];
	
	(* expose Matchete to Mathematica *)
	If[Length@PacletFind["Matchete"]===0,PacletDirectoryLoad[PacletPath]];
	
	(* link documentation *)
	PacletDataRebuild[]; (* this links again the documentation of all paclets that can be found by Matchete *)
]


(* ::Subsubsection::Closed:: *)
(*Link documentation*)


PackageScope["LinkDocumentation"]


LinkDocumentation::usage="LinkDocumentation[] link the documentation of Matchete from its build.";


LinkDocumentation[]:=Module[{},
	(* expose Matchete to Mathematica *)
	If[Length@PacletFind["Matchete"]===0,PacletDirectoryLoad[PacletPath]];
	
	(* link documentation *)
	PacletDataRebuild[]; (* this links again the documentation of all paclets that can be found by Matchete *)
]


(* ::Section:: *)
(*DumpSave*)


(* ::Subsubsection::Closed:: *)
(*W.I.P.*)


(*SetAttributes[SaveMatcheteSession, HoldRest]*)


(*SaveMatcheteSession[fileName_String, symbols_List:{}]:=Module[
	{
		(* For some reason averything crashes when you DumpSave GroupMagic`... *)
		builtInDefs={"Matchete`", (*"GroupMagic`",*) Hold[Global`$MatcheteVersion], NonCommutativeMultiply, Format, NiceForm},
		file,
		mySymbols,
		$DumpSave,
		tmp
	}
,
	(* determine file for saving *)
	Switch[FileExtension[fileName],
		"",   file=fileName<>".mx",
		"mx", file=fileName,
		_,    (Print["Changing file extension from \"",FileExtension[fileName],"\" to \"mx\"."];file=DirectoryName[fileName]<>FileBaseName[fileName]<>".mx")
	];

	(* keep symbols unevaluated *)
	mySymbols= Map[Hold, Hold@symbols, {2}][[1]];

	(* list of everything that must be saved *)
	mySymbols= Echo@Join[builtInDefs, mySymbols];

	(* dummy function that does not evaluate and keeps its arguments unevaluated *)
	SetAttributes[$DumpSave, HoldRest];

	(* save Matchete session *)
	With[{symb= mySymbols}, (* needds a dummy function to remove Hold *)
		tmp= $DumpSave[file,symb]/.Hold[arg_]:>arg;
	];
	Echo[tmp];
	tmp/.$DumpSave->DumpSave;

	Print["Saved the current Matchete session to the file: ", Style[file,"Code"],". \[Rule] Symbols included: ",HoldForm[symbols],"."
	];
	Print["It can be loaded again at a later point using: ",Style["Get["<>file<>"];","Code"],". This overrides the definitions of any Matchete session that might be active at this later point."];
]*)


(* ::Section:: *)
(*Deprecated symbols*)


(* ::Subsubsection::Closed:: *)
(*Functions/symbols that used to be used *)


DefineGroupRepresentation[___]:= Block[{},
	Message[DefineGroupRepresentation::usage];
	Abort[];
]


DefineGroup[___]:= Block[{},
	Message[DefineGroup::usage];
	Abort[];
]
