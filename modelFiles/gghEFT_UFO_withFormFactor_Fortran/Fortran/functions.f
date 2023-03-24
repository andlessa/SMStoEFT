

double complex function myFormFactor(S)

   double precision S ! higgs momentum squared
   double precision r
   include 'input.inc' ! include all external model parameter
   include 'coupl.inc' ! include other parameters
   
   if (MDL_CG > 0.0) then
       r = SQRT(S)/(2*MDL_MT)
       myFormFactor = (3./2.)*(1.0/(r**2))*(1. + (1.-1./(r**2))*(ASIN(r)**2))
   else
       myFormFactor = 1.0
   end if 
   
   return 

end function
