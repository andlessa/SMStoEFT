(* ::Package:: *)

LSM = LoadModel["SM"];
DefineField[sT,Scalar, Indices->{SU3c[fund],Flavor},Charges  -> {U1Y[2/3]},Mass->{Heavy,Mst,{Flavor}},NiceForm-> {"\!\(\*SubscriptBox[\(\[Phi]\), \(T\)]\)","\!\(\*SubscriptBox[\(M\), \(\[Phi]\)]\)"}];
DefineField[chi, Fermion, Mass->{Heavy,Mchi},NiceForm-> {"\[Chi]","\!\(\*SubscriptBox[\(M\), \(\[Chi]\)]\)"},SelfConjugate->False];
DefineCoupling[yDM,Indices->{Flavor,Flavor},SelfConjugate->True,NiceForm->"\!\(\*SubscriptBox[\(y\), \(DM\)]\)"];
LBSM=FreeLag[sT,chi]+PlusHc[-yDM[p,r]  Bar@u[a,p]**PL**chi[] sT[a,r]];
LUV=LSM+LBSM;
