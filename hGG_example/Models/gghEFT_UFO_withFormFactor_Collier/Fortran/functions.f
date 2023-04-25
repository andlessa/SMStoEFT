





double complex function myFormFactor(S)

   use collier

   double complex S ! higgs momentum squared (allows for off-shell Higgs)
   double complex r,mtop,p1sq,p2sq,msq
   double complex ScalarC0
   double complex :: MomInv(3), masses2(0:2)
   include 'input.inc' ! include all external model parameter
   include 'coupl.inc' ! include other parameters
   
   
   if (MDL_CG > 0.0) then
       mtop = MDL_MT
          
       call Init_cll(4,0,'') 
       call InitCacheSystem_cll(1,4)
       call InitEvent_cll     

       p1sq = 0d0
       p2sq = 0d0
       msq = mtop**2
       
       MomInv(1:3) = (/p1sq,p2sq,S/)
       masses2(0:2) = (/msq,msq,msq/)
       ! ScalarC0 contains the integral result
       call C0_cll(ScalarC0,MomInv(1:3),masses2(0:2))
   
!       ScalarC0 = (CDLOG((2*mtop**2 - S + CDSQRT(S*(-4*mtop**2 + S)))/(2.*mtop**2))**2)/(2.*S) ! Allows for off-shell higgs
!       ScalarC0 = (-2./S)*ASIN(SQRT(S/(4*mtop**2)))**2 ! Limit for on-shell Higgs
       myFormFactor = (3./2.)*(2.*mtop/S)*(2*mtop + mtop*(4*mtop**2-S)*ScalarC0)  
   else
       myFormFactor = 1.0 ! Limit for mtop >> S (controlled by sign of cG coupling)
   end if 
   
   return 

end function
