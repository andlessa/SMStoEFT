finalruleordered = {alphaOkappas -> alphaOkappas + 6*alphaOms2*alphaRsbox, 
     alphaOkappasphi -> alphaOkappasphi + alphaOms2*alphaRphisbox + 
       alphaOmuH2*(alphaRsphibox + alphaRsphiboxbar), 
     alphaOlambda -> alphaOlambda + alphaOkappasphi*alphaRphisbox, 
     alphaOlambdas -> alphaOlambdas + 12*alphaOkappas*alphaRsbox, 
     alphaOlambdasphi -> alphaOlambdasphi + alphaOkappas*alphaRphisbox + 
       2*alphaOkappasphi*(alphaRsbox + alphaRsphibox + alphaRsphiboxbar), 
     alphaOms2 -> alphaOms2, alphaOmuH2 -> alphaOmuH2, 
     alphaOs -> alphaOs - alphaOlambdasphi*alphaRphisbox - 
       2*alphaOlambda*(alphaRsphibox + alphaRsphiboxbar), 
     alphaOs3 -> alphaOs3 - (alphaOlambdas*alphaRphisbox)/6 - 
       alphaOlambdasphi*(alphaRsbox + (alphaRsphibox + alphaRsphiboxbar)/2), 
     alphaOsB -> alphaOsB, alphaOsBt -> alphaOsBt, alphaOsG -> alphaOsG, 
     alphaOsGt -> alphaOsGt, alphaOsW -> alphaOsW, alphaOsWt -> alphaOsWt, 
     alphaOlambdau[fl97_, fl99_] -> alphaOlambdau[fl97, fl99], 
     alphaOlambdaubar[fl97_, fl99_] -> alphaOlambdaubar[fl97, fl99], 
     alphaOlambdad[fl97_, fl99_] -> alphaOlambdad[fl97, fl99], 
     alphaOlambdadbar[fl97_, fl99_] -> alphaOlambdadbar[fl97, fl99], 
     alphaOlambdae[fl97_, fl99_] -> alphaOlambdae[fl97, fl99], 
     alphaOlambdaebar[fl97_, fl99_] -> alphaOlambdaebar[fl97, fl99], 
     alphaOsuphi[fl97_, fl99_] -> 
      -(alphaRsphibox*alphaOlambdau[fl97, fl99]) + alphaOsuphi[fl97, fl99] + 
       alphaOlambdau[miF1, fl99]*alphaRsq[fl97, miF1] + 
       alphaOlambdau[fl97, miF1]*alphaRsubar[fl99, miF1], 
     alphaOsuphibar[fl97_, fl99_] -> 
      -(alphaRsphiboxbar*alphaOlambdaubar[fl97, fl99]) + 
       alphaOsuphibar[fl97, fl99] + alphaOlambdaubar[miF1, fl99]*
        alphaRsqbar[fl97, miF1] + alphaOlambdaubar[fl97, miF1]*
        alphaRsu[fl99, miF1], alphaOsdphi[fl97_, fl99_] -> 
      -(alphaRsphiboxbar*alphaOlambdad[fl97, fl99]) + 
       alphaOsdphi[fl97, fl99] + alphaOlambdad[fl97, miF1]*
        alphaRsdbar[fl99, miF1] + alphaOlambdad[miF1, fl99]*
        alphaRsq[fl97, miF1], alphaOsdphibar[fl97_, fl99_] -> 
      -(alphaRsphibox*alphaOlambdadbar[fl97, fl99]) + 
       alphaOsdphibar[fl97, fl99] + alphaOlambdadbar[fl97, miF1]*
        alphaRsd[fl99, miF1] + alphaOlambdadbar[miF1, fl99]*
        alphaRsqbar[fl97, miF1], alphaOsephi[fl97_, fl99_] -> 
      -(alphaRsphiboxbar*alphaOlambdae[fl97, fl99]) + 
       alphaOsephi[fl97, fl99] + alphaOlambdae[fl97, miF1]*
        alphaRsebar[fl99, miF1] + alphaOlambdae[miF1, fl99]*
        alphaRsl[fl97, miF1], alphaOsephibar[fl97_, fl99_] -> 
      -(alphaRsphibox*alphaOlambdaebar[fl97, fl99]) + 
       alphaOsephibar[fl97, fl99] + alphaOlambdaebar[fl97, miF1]*
        alphaRse[fl99, miF1] + alphaOlambdaebar[miF1, fl99]*
        alphaRslbar[fl97, miF1]}
