

double complex function myFormFactor(S)

   double complex S ! higgs momentum squared (allows for off-shell Higgs)
   double complex r,mtop
   double complex ScalarC0
   include 'input.inc' ! include all external model parameter
   include 'coupl.inc' ! include other parameters
   
   
   if (MDL_CG > 0.0) then
       mtop = MDL_MT   
       ScalarC0 = (CDLOG((2*mtop**2 - S + CDSQRT(S*(-4*mtop**2 + S)))/(2.*mtop**2))**2)/(2.*S) ! Allows for off-shell higgs
!       ScalarC0 = (-2./S)*ASIN(SQRT(S/(4*mtop**2)))**2 ! Limit for on-shell Higgs
       myFormFactor = (3./2.)*(2.*mtop/S)*(2*mtop + mtop*(4*mtop**2-S)*ScalarC0)  
   else
       myFormFactor = 1.0 ! Limit for mtop >> S (controlled by sign of cG coupling)
   end if 
   
   return 

end function
