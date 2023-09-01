


! ------------------------------------------------------------
! Directly uses COLLIER to compute all needed integrals
! ------------------------------------------------------------
!
!               p21               
!                |                
!                |                
!               / \               
!              /   \              
!       m12   /1   2\   m22       
!            /       \            
!           /    0    \           
! p10  ---------------------  p20 
!               m02               
!
! m02,m12,m22 -> masses squared
! p10 = p1^2, p20 = p2^2, p21 = p3^3 = s 

subroutine getCIntegrals(Ccoeff,s,p2sq,p1sq,mchi2,mst2,muR2,deltaUV)

    ! Return the 3-point integrals. Note that the normalization includes the 1/(2*pi)^4 factor!

    use collier

    implicit none

    ! Invariants s=(p1+p2)**2 (gluon momentum squared), p1sq  and p2sq (top and anti-top momenta squared)
    ! (we assume the physical amplitude is always symmetric under p1<->p2 (top<->anti-top), so the ordering does not matter)
    double complex s, p1sq, p2sq 
    double complex mchi2,mst2
    double precision muR2,deltaUV
    double complex Ccoeff(0:1,0:3,0:3),Ccoeffuv(0:1,0:3,0:3)
    double precision Cerr(0:3)
    integer N,rank
    double precision Pi
    parameter  (Pi=3.141592653589793D0)

    N = 3 ! Maximum number for loop (3-point function)
    rank = 3 ! Maximum rank for loop (=N)

    call Init_cll(N,rank,'',.true.)
    call InitCacheSystem_cll(1,N)
    call InitEvent_cll     
    call SetDeltaUV_cll(deltaUV) ! Remove the divergence (MSbar)
    call SetMuUV2_cll(muR2) ! Set the renormalization scale
    
    call C_cll(Ccoeff,Ccoeffuv,p1sq,s,p2sq,mchi2,mst2,mst2,rank,Cerr)    
    
    Ccoeff = Ccoeff/((2*Pi)**4)
    
end subroutine getCIntegrals


! ------------------------------------------------------------
! Define the form factors in terms of the loop functions:
! ------------------------------------------------------------
double complex function formFactorC00ren(s,p1sq,p2sq)

    use collier

    implicit none

    ! Invariants s=(p1+p2)**2 (gluon momentum squared), p1sq  and p2sq (top and anti-top momenta squared)
    ! (we assume the physical amplitude is always symmetric under p1<->p2 (top<->anti-top), so the ordering does not matter)
    double complex s, p1sq, p2sq, p1p2
    integer rank
    double complex mt2,mst2,mchi2
    double precision c00renvalue,deltaUV,muR2
    double complex C00,C1,C11,C12,ScalarC00ren,deltaCTR
    double complex loopIntegralC00,loopIntegralC1,loopIntegralC11,loopIntegralC12
    double complex Ccoeff(0:1,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE
    c00renvalue = MDL_C00REN ! Numerical value for C00ren, which should be replaced by the form factor
 
    if (c00renvalue == 0d0) then
        formFactorC00ren = 0.0 ! If the default C00ren value is zero, do nothing (it can be used to turn off this term) 
    else
        ! C00 = loopIntegralC00(s,p1sq,p2sq,mchi2,mst2,muR2,deltaUV)
        ! C1 = loopIntegralC1(s,p1sq,p2sq,mchi2,mst2,muR2,deltaUV)
        ! C11 = loopIntegralC11(s,p1sq,p2sq,mchi2,mst2,muR2,deltaUV)
        ! C12 = loopIntegralC12(s,p1sq,p2sq,mchi2,mst2,muR2,deltaUV)
        call getCIntegrals(Ccoeff,s,p2sq,p1sq,mchi2,mst2,muR2,deltaUV)
        C00 = Ccoeff(1,0,0)
        C1 = Ccoeff(0,1,0)
        C11 = Ccoeff(0,2,0)
        C12 = Ccoeff(0,1,1)
        deltaCTR = MDL_DELTACTR

        ! Compute renormalizable and effective C00 value:
        ! Note that:  
        ! C00ren = C_{00} - (p1^2 + p2^2)*C_{1}/2  + (p1.p2)*(C_{11} - C_{12}) - (p1^2 + p2^2)*C_{12} + deltaCTR
        p1p2 = (s-p1sq-p2sq)/2d0
        ScalarC00ren = C00 + deltaCTR + (C11-C12)*p1p2 - C1*(p1sq+p2sq)/2d0 - C12*(p1sq + p2sq)
                
        ! New value to be used to replace the default value:
        formFactorC00ren = ScalarC00ren/c00renvalue
    end if 

    return 

end function


double complex function formFactorC1(s,p1sq,p2sq)

    use collier

    implicit none

    ! Invariants s=(p1+p2)**2 (gluon momentum squared), p1sq  and p2sq (top and anti-top momenta squared)
    ! (we assume the physical amplitude is always symmetric under p1<->p2 (top<->anti-top), so the ordering does not matter)
    double complex s, p1sq, p2sq, p1p2
    double complex mt2,mst2,mchi2
    double precision c1value,deltaUV,muR2
    double complex C1,loopIntegralC1
    double complex Ccoeff(0:1,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE
    c1value = MDL_C1 ! Numerical value for C1, which should be replaced by the form factor

    if (c1value == 0.0) then
        formFactorC1 = 0.0 ! If the default C1 value is zero, do nothing (it can be used to turn off this term)
    else            
        ! C1 = loopIntegralC1(s,p1sq,p2sq,mchi2,mst2,muR2,deltaUV)
        call getCIntegrals(Ccoeff,s,p2sq,p1sq,mchi2,mst2,muR2,deltaUV)
        C1 = Ccoeff(0,1,0)
        
        ! New value to be used to replace the default value:
        formFactorC1 = C1/c1value
    end if 

    return 

end function


double complex function formFactorC11(s,p1sq,p2sq)

    use collier

    implicit none

    ! Invariants s=(p1+p2)**2 (gluon momentum squared), p1sq  and p2sq (top and anti-top momenta squared)
    ! (we assume the physical amplitude is always symmetric under p1<->p2 (top<->anti-top), so the ordering does not matter)
    double complex s, p1sq, p2sq, p1p2
    double complex mt2,mst2,mchi2
    double precision c11value,deltaUV,muR2
    double complex C11,loopIntegralC11
    double complex Ccoeff(0:1,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE
    c11value = MDL_C11 ! Numerical value for C11, which should be replaced by the loop integral

    if (c11value == 0.0) then
        formFactorC11 = 0.0 ! If the default C11 value is zero, do nothing (it can be used to turn off this term)
    else            
        ! C11 = loopIntegralC11(s,p1sq,p2sq,mchi2,mst2,muR2,deltaUV)
        call getCIntegrals(Ccoeff,s,p2sq,p1sq,mchi2,mst2,muR2,deltaUV)
        C11 = Ccoeff(0,2,0)
        
        ! New value to be used to replace the default value:
        formFactorC11 = C11/c11value
    end if 

    return 

end function


double complex function formFactorC12(s,p1sq,p2sq)

    use collier

    implicit none

    ! Invariants s=(p1+p2)**2 (gluon momentum squared), p1sq  and p2sq (top and anti-top momenta squared)
    ! (we assume the physical amplitude is always symmetric under p1<->p2 (top<->anti-top), so the ordering does not matter)
    double complex s, p1sq, p2sq, p1p2
    double complex mt2,mst2,mchi2
    double precision c12value,deltaUV,muR2
    double complex C12,loopIntegralC12
    double complex Ccoeff(0:1,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters

    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE
    c12value = MDL_C12 ! Numerical value for C12, which should be replaced by the loop integral

    if (c12value == 0.0) then
        formFactorC12 = 0.0 ! If the default C12 value is zero, do nothing (it can be used to turn off this term)
    else            
        ! C12 = loopIntegralC12(s,p1sq,p2sq,mchi2,mst2,muR2,deltaUV)
        call getCIntegrals(Ccoeff,s,p2sq,p1sq,mchi2,mst2,muR2,deltaUV)
        C12 = Ccoeff(0,1,1)
        
        ! New value to be used to replace the default value:
        formFactorC12 = C12/c12value
    end if 

    return 

end function