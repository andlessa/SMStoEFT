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
    double complex Ccoeff(0:1,0:2,0:2),Ccoeffuv(0:1,0:2,0:2)
    double precision Cerr(0:2)
    integer N,rank
    double precision Pi
    parameter  (Pi=3.141592653589793D0)

    N = 3 ! Maximum number for loop (3-point function)
    rank = 2 ! Maximum rank for loop (=N)

    call Init_cll(N,rank,'',.true.)
    call InitCacheSystem_cll(1,N)
    call InitEvent_cll     
    call SetDeltaUV_cll(deltaUV) ! Remove the divergence (MSbar)
    call SetMuUV2_cll(muR2) ! Set the renormalization scale
    
    call C_cll(Ccoeff,Ccoeffuv,p1sq,s,p2sq,mchi2,mst2,mst2,rank,Cerr)    
    
    Ccoeff = Ccoeff/((2*Pi)**4)
    
end subroutine getCIntegrals


! ------------------------------------------------------------
! Directly uses COLLIER to compute all needed integrals
! ------------------------------------------------------------
!                  p31                  
!          ------------------           
!         /                   \         
!                  m22                  
!    p21  ---------------------  p32 \  
!              |    2    |            \ 
!              |         |             |
!          m12 |1       3| m32         | p20
!              |         |             |
!              |    0    |            / 
!    p10  ---------------------  p30 /  
!                  m02                  
!

subroutine getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)

    ! Return the 4-point integrals for the external momenta onshell.
    ! The order of the arguments is defined by the loop integrals provided by FeynCalc:
    ! D_{ijk} (0,t or u, MT^2, s, MT^2, 0, mST^2, mST^2, mChi^2, mST^2)

    ! The Collier function follows the same argument ordering as FeynCalc/PackageX
    ! (except that PackageX takes the propagator masses without squares)    
    ! Note that the normalization includes the 1/(2*pi)^4 factor!
    
    ! D0 = Dcoeff(0,0,0,0)
    ! D1 = Dcoeff(0,1,0,0)
    ! D2 = Dcoeff(0,0,1,0)
    ! D3 = Dcoeff(0,0,0,1)
    ! D00 = Dcoeff(1,0,0,0)
    ! D11 = Dcoeff(0,2,0,0)
    ! D12 = Dcoeff(0,1,1,0)
    ! D13 = Dcoeff(0,1,0,1)
    ! D22 = Dcoeff(0,0,2,0)
    ! D23 = Dcoeff(0,0,1,1)
    ! D33 = Dcoeff(0,0,0,2)
    ! D001 = Dcoeff(1,1,0,0)
    ! D002 = Dcoeff(1,0,1,0)
    ! D003 = Dcoeff(1,0,0,1)
    ! D111 = Dcoeff(0,3,0,0)
    ! D112 = Dcoeff(0,2,1,0)
    ! D113 = Dcoeff(0,2,0,1)
    ! D122 = Dcoeff(0,1,2,0)
    ! D123 = Dcoeff(0,1,1,1)
    ! D133 = Dcoeff(0,1,0,2)
    ! D222 = Dcoeff(0,0,3,0)
    ! D223 = Dcoeff(0,0,2,1)
    ! D233 = Dcoeff(0,0,1,2)
    ! D333 = Dcoeff(0,0,0,3)

    use collier

    implicit none

    ! Invariants s=(p1+p2)**2 (gluon momentum squared), p1sq  and p2sq (top and anti-top momenta squared)
    ! (we assume the physical amplitude is always symmetric under p1<->p2 (top<->anti-top), so the ordering does not matter)
    double complex p10,p21,p32,p30,p20,p31,m02,m12,m22,m32
    double complex s,t,mchi2,mst2,mt2
    double precision muR2,deltaUV
    double complex Dcoeff(0:1,0:3,0:3,0:3),Dcoeffuv(0:1,0:3,0:3,0:3)
    double precision Derr(0:3)
    integer N,rank
    double precision Pi
    parameter  (Pi=3.141592653589793D0)

    p10 = 0d0
    p21 = t
    p32 = mt2
    p30 = s
    p20 = mt2
    p31 = 0d0
    m02 = mst2
    m12 = mst2
    m22 = mchi2
    m32 = mst2


    N = 4 ! Maximum number for loop (3-point function)
    rank = 3 ! Maximum rank for loop (=N)

    call Init_cll(N,rank,'',.true.)
    call InitCacheSystem_cll(1,N)
    call InitEvent_cll     
    call SetDeltaUV_cll(deltaUV) ! Remove the divergence (MSbar)
    call SetMuUV2_cll(muR2) ! Set the renormalization scale
    
    call D_cll(Dcoeff,Dcoeffuv,p10,p21,p32,p30,p20,p31,m02,m12,m22,m32,rank,Derr)  
    
    Dcoeff = Dcoeff/((2*Pi)**4)
    
end subroutine getDIntegralsOnShell


! ------------------------------------------------------------
! Define the form factors in terms of the loop functions:
! ------------------------------------------------------------

double complex function formFactorCTOT(s,p1sq,p2sq)

    use collier

    implicit none

    ! Invariants s=(p1+p2)**2 (gluon momentum squared), p1sq  and p2sq (top and anti-top momenta squared)
    ! (we assume the physical amplitude is always symmetric under p1<->p2 (top<->anti-top), so the ordering does not matter)
    double complex s, p1sq, p2sq
    integer rank
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex c1value,c11value,c12value,ctotvalue
    double complex C1,C11,C12,CTOT
    double complex Ccoeff(0:1,0:2,0:2)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters

    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE
    c1value = MDL_C1 ! Numerical value for C1, which should be replaced by the form factor
    c11value = MDL_C11 ! Numerical value for C11, which should be replaced by the form factor
    c12value = MDL_C12 ! Numerical value for C12, which should be replaced by the form factor
    ctotvalue = c1value + c11value + c12value
    
    if (ctotvalue == 0d0) then
        formFactorCTOT = 0.0 ! If the default ctot value is zero, do nothing (it can be used to turn off this term) 
    else
        call getCIntegrals(Ccoeff,s,p2sq,p1sq,mchi2,mst2,muR2,deltaUV)
        C1 = Ccoeff(0,1,0)
        C11 = Ccoeff(0,2,0)
        C12 = Ccoeff(0,1,1)
        CTOT = C1+C11+C12
    endif 

    if (MDL_IDEBUG > 0d0) then
        call writedebug(s,p1sq,p2sq,Ccoeff,'CTOT')
    endif


    formFactorCTOT = CTOT

    return 

end function


double complex function formFactorC00ren(s,p1sq,p2sq)

    use collier

    implicit none

    ! Invariants s=(p1+p2)**2 (gluon momentum squared), p1sq  and p2sq (top and anti-top momenta squared)
    ! (we assume the physical amplitude is always symmetric under p1<->p2 (top<->anti-top), so the ordering does not matter)
    double complex s, p1sq, p2sq, p1p2
    integer rank
    double complex mt2,mst2,mchi2
    double precision c00renvalue,deltaUV,muR2
    double complex C00,ScalarC00ren,deltaCTR
    double complex Ccoeff(0:1,0:2,0:2)
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
        call getCIntegrals(Ccoeff,s,p2sq,p1sq,mchi2,mst2,muR2,deltaUV)
        C00 = Ccoeff(1,0,0)
        deltaCTR = MDL_DELTACTR

        ! Compute renormalizable and effective C00 value:
        ! Note that:  
        ! C00ren = C_{00} + deltaCTR
        ScalarC00ren = C00 + deltaCTR
                
        ! New value to be used to replace the default value:
        formFactorC00ren = ScalarC00ren/c00renvalue
    endif 

    if (MDL_IDEBUG > 0d0) then
        call writedebug(s,p1sq,p2sq,Ccoeff,'C00ren')
    endif


    return 

end function


double complex function formFactorC1(s,p1sq,p2sq)

    use collier

    implicit none

    ! Invariants s=(p1+p2)**2 (gluon momentum squared), p1sq  and p2sq (top and anti-top momenta squared)
    ! (we assume the physical amplitude is always symmetric under p1<->p2 (top<->anti-top), so the ordering does not matter)
    double complex s, p1sq, p2sq
    double complex mt2,mst2,mchi2
    double precision c1value,deltaUV,muR2
    double complex C1
    double complex Ccoeff(0:1,0:2,0:2)
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
        call getCIntegrals(Ccoeff,s,p2sq,p1sq,mchi2,mst2,muR2,deltaUV)
        C1 = Ccoeff(0,1,0)
        
        ! New value to be used to replace the default value:
        formFactorC1 = C1/c1value
    endif 

    if (MDL_IDEBUG > 0d0) then
        call writedebug(s,p1sq,p2sq,Ccoeff,'C1')
    endif


    return 

end function

double complex function formFactorC2(s,p1sq,p2sq)

    use collier

    implicit none

    ! Invariants s=(p1+p2)**2 (gluon momentum squared), p1sq  and p2sq (top and anti-top momenta squared)
    ! (we assume the physical amplitude is always symmetric under p1<->p2 (top<->anti-top), so the ordering does not matter)
    double complex s, p1sq, p2sq, p1p2
    double complex mt2,mst2,mchi2
    double precision c1value,deltaUV,muR2
    double complex Ccoeff(0:1,0:2,0:2),C2
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE
    c1value = MDL_C1 ! Numerical value for C1, which should be replaced by the form factor

    if (c1value == 0.0) then
        formFactorC2 = 0.0 ! If the default C1 value is zero, do nothing (it can be used to turn off this term)
    else            
        call getCIntegrals(Ccoeff,s,p2sq,p1sq,mchi2,mst2,muR2,deltaUV)
        C2 = Ccoeff(0,0,1)
        
        ! New value to be used to replace the default value:
        formFactorC2 = C2/c1value
    endif 

    if (MDL_IDEBUG > 0d0) then
        call writedebug(s,p1sq,p2sq,Ccoeff,'C2')
    endif

    return 

end function


double complex function formFactorC11(s,p1sq,p2sq)

    use collier

    implicit none

    ! Invariants s=(p1+p2)**2 (gluon momentum squared), p1sq  and p2sq (top and anti-top momenta squared)
    ! (we assume the physical amplitude is always symmetric under p1<->p2 (top<->anti-top), so the ordering does not matter)
    double complex s, p1sq, p2sq
    double complex mt2,mst2,mchi2
    double precision c11value,deltaUV,muR2
    double complex C11
    double complex Ccoeff(0:1,0:2,0:2)
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
        call getCIntegrals(Ccoeff,s,p2sq,p1sq,mchi2,mst2,muR2,deltaUV)
        C11 = Ccoeff(0,2,0)
        
        ! New value to be used to replace the default value:
        formFactorC11 = C11/c11value
    endif 

    if (MDL_IDEBUG > 0d0) then
        call writedebug(s,p1sq,p2sq,Ccoeff,'C11')
    endif

    return  

end function

double complex function formFactorC22(s,p1sq,p2sq)

    use collier

    implicit none

    ! Invariants s=(p1+p2)**2 (gluon momentum squared), p1sq  and p2sq (top and anti-top momenta squared)
    ! (we assume the physical amplitude is always symmetric under p1<->p2 (top<->anti-top), so the ordering does not matter)
    double complex s, p1sq, p2sq, p1p2
    double complex mt2,mst2,mchi2
    double precision c11value,deltaUV,muR2
    double complex C22
    double complex Ccoeff(0:1,0:2,0:2)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE
    c11value = MDL_C11 ! Numerical value for C11, which should be replaced by the loop integral

    if (c11value == 0.0) then
        formFactorC22 = 0.0 ! If the default C11 value is zero, do nothing (it can be used to turn off this term)
    else
        call getCIntegrals(Ccoeff,s,p2sq,p1sq,mchi2,mst2,muR2,deltaUV)
        C22 = Ccoeff(0,0,2)
        
        ! New value to be used to replace the default value:
        formFactorC22 = C22/c11value
    endif 

    if (MDL_IDEBUG > 0d0) then
        call writedebug(s,p1sq,p2sq,Ccoeff,'C11')
    endif


    return 

end function


double complex function formFactorC12(s,p1sq,p2sq)

    use collier

    implicit none

    ! Invariants s=(p1+p2)**2 (gluon momentum squared), p1sq  and p2sq (top and anti-top momenta squared)
    ! (we assume the physical amplitude is always symmetric under p1<->p2 (top<->anti-top), so the ordering does not matter)
    double complex s, p1sq, p2sq
    double complex mt2,mst2,mchi2
    double precision c12value,deltaUV,muR2
    double complex C12
    double complex Ccoeff(0:1,0:2,0:2)
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
        call getCIntegrals(Ccoeff,s,p2sq,p1sq,mchi2,mst2,muR2,deltaUV)
        C12 = Ccoeff(0,1,1)
        
        ! New value to be used to replace the default value:
        formFactorC12 = C12/c12value
    endif 

    if (MDL_IDEBUG > 0d0) then
        call writedebug(s,p1sq,p2sq,Ccoeff,'C12')
    endif


    return 

end function


double complex function D0(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D0 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D0 = Dcoeff(0,0,0,0)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D0')
    endif

    return 

end function

double complex function D1(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D1 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D1 = Dcoeff(0,1,0,0)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D1')
    endif

    return 

end function

double complex function D2(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D2 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D2 = Dcoeff(0,0,1,0)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D2')
    endif

    return 

end function

double complex function D3(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D3 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D3 = Dcoeff(0,0,0,1)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D3')
    endif

    return 

end function

double complex function D00(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D00 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D00 = Dcoeff(1,0,0,0)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D00')
    endif

    return 

end function

double complex function D11(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D11 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D11 = Dcoeff(0,2,0,0)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D11')
    endif

    return 

end function

double complex function D12(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D12 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D12 = Dcoeff(0,1,1,0)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D12')
    endif

    return 

end function

double complex function D13(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D13 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D13 = Dcoeff(0,1,0,1)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D13')
    endif

    return 

end function

double complex function D22(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D22 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D22 = Dcoeff(0,0,2,0)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D22')
    endif

    return 

end function

double complex function D23(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D23 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D23 = Dcoeff(0,0,1,1)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D23')
    endif

    return 

end function

double complex function D33(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D33 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D33 = Dcoeff(0,0,0,2)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D33')
    endif

    return 

end function

double complex function D001(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D001 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D001 = Dcoeff(1,1,0,0)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D001')
    endif

    return 

end function

double complex function D002(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D002 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D002 = Dcoeff(1,0,1,0)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D002')
    endif

    return 

end function

double complex function D003(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D003 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D003 = Dcoeff(1,0,0,1)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D003')
    endif

    return 

end function

double complex function D111(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D111 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D111 = Dcoeff(0,3,0,0)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D111')
    endif

    return 

end function

double complex function D112(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D112 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D112 = Dcoeff(0,2,1,0)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D112')
    endif

    return 

end function

double complex function D113(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D113 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D113 = Dcoeff(0,2,0,1)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D113')
    endif

    return 

end function

double complex function D122(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D122 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D122 = Dcoeff(0,1,2,0)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D122')
    endif

    return 

end function

double complex function D123(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D123 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D123 = Dcoeff(0,1,1,1)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D123')
    endif

    return 

end function

double complex function D133(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D133 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D133 = Dcoeff(0,1,0,2)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D133')
    endif

    return 

end function

double complex function D222(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D222 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D222 = Dcoeff(0,0,3,0)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D222')
    endif

    return 

end function

double complex function D223(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D223 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D223 = Dcoeff(0,0,2,1)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D223')
    endif

    return 

end function

double complex function D233(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D233 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D233 = Dcoeff(0,0,1,2)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D233')
    endif

    return 

end function

double complex function D333(s,t)

    use collier

    implicit none

    double complex s,t
    double complex mt2,mst2,mchi2
    double precision deltaUV,muR2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MST**2 ! The counter-terms were computing under this assumption 
    deltaUV = 0d0  ! deltaUV = 1/eps + log(4*Pi) - gammaE

    if (MDL_IBOX <= 0d0) then
        D333 = 0d0
    else            
        call getDIntegralsOnShell(Dcoeff,s,t,mst2,mchi2,mt2,muR2,deltaUV)
        D333 = Dcoeff(0,0,0,3)
    endif
    
    if (MDL_IDEBUG > 0d0) then
        call writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,'D333')
    endif

    return 

end function


subroutine writedebug(s,p1sq,p2sq,Ccoeff,header)

    implicit none
   
    double complex s,p1sq,p2sq
    double complex Ccoeff(0:1,0:2,0:2)
    character(len=99) :: fname
    character(len=*) :: header
    character(len=*) fmt1,fmt10
    parameter (fmt1 = '(A13,3(es11.3,SP,es9.1,A2))')
    parameter (fmt10 = '(A6,es12.4,SP,es12.4,A2)')

    fname='myLog.log'
    open(unit=50,file=trim(fname),action='WRITE',position='APPEND',status='unknown')
    write(50,*) '------------ ',trim(header),': -------------------------'
    write (50,fmt1) 's,p1sq,p2sq = ',s,'*i',p1sq,'*i',p2sq,'*i'
    write (50,fmt10) 'C00 = ',Ccoeff(1,0,0),'*i'
    write (50,fmt10) 'C1 = ',Ccoeff(0,1,0),'*i'
    write (50,fmt10) 'C2 = ',Ccoeff(0,0,1),'*i'
    write (50,fmt10) 'C11 = ',Ccoeff(0,2,0),'*i'
    write (50,fmt10) 'C12 = ',Ccoeff(0,1,1),'*i'
    write (50,fmt10) 'C22 = ',Ccoeff(0,0,2),'*i'
    write(50,*) '-------------------------------------'
    write(50,*)
    close(50)
    
end subroutine writedebug



subroutine writedebugD(s,t,mst2,mchi2,mt2,Dcoeff,header)

    implicit none
   
    double complex s,t,u
    double complex mst2,mchi2,mt2
    double complex Dcoeff(0:1,0:3,0:3,0:3)
    character(len=99) :: fname
    character(len=*) :: header
    character(len=*) fmt1,fmt10,fmt2
    parameter (fmt1 = '(A22,2(es11.3,SP,es9.1,A2))')
    parameter (fmt2 = '(A13,3(es11.3,SP,es9.1,A2))')
    parameter (fmt10 = '(A6,es12.4,SP,es12.4,A2)')

    u = -(s+t) + 2*mt2

    fname='myLogD.log'
    open(unit=50,file=trim(fname),action='WRITE',position='APPEND',status='unknown')
    write(50,*) '------------ ',trim(header),': -------------------------'
    write (50, fmt2) 'mst,mchi,mt = ',CDSQRT(mst2),'*i',CDSQRT(mchi2),'*i',CDSQRT(mt2),'*i'
    write (50,fmt1) 's,t,u = ',s,'*i',t,'*i',u,'*i'
    write (50,fmt10) 'D0 = ',Dcoeff(0,0,0,0),'*i'
    write (50,fmt10) 'D1 = ',Dcoeff(0,1,0,0),'*i'
    write (50,fmt10) 'D2 = ',Dcoeff(0,0,1,0),'*i'
    write (50,fmt10) 'D3 = ',Dcoeff(0,0,0,1),'*i'
    write (50,fmt10) 'D00 = ',Dcoeff(1,0,0,0),'*i'
    write (50,fmt10) 'D11 = ',Dcoeff(0,2,0,0),'*i'
    write (50,fmt10) 'D12 = ',Dcoeff(0,1,1,0),'*i'
    write (50,fmt10) 'D13 = ',Dcoeff(0,1,0,1),'*i'
    write (50,fmt10) 'D22 = ',Dcoeff(0,0,2,0),'*i'
    write (50,fmt10) 'D23 = ',Dcoeff(0,0,1,1),'*i'
    write (50,fmt10) 'D33 = ',Dcoeff(0,0,0,2),'*i'
    write (50,fmt10) 'D001 = ',Dcoeff(1,1,0,0),'*i'
    write (50,fmt10) 'D002 = ',Dcoeff(1,0,1,0),'*i'
    write (50,fmt10) 'D003 = ',Dcoeff(1,0,0,1),'*i'
    write (50,fmt10) 'D111 = ',Dcoeff(0,3,0,0),'*i'
    write (50,fmt10) 'D112 = ',Dcoeff(0,2,1,0),'*i'
    write (50,fmt10) 'D113 = ',Dcoeff(0,2,0,1),'*i'
    write (50,fmt10) 'D122 = ',Dcoeff(0,1,2,0),'*i'
    write (50,fmt10) 'D123 = ',Dcoeff(0,1,1,1),'*i'
    write (50,fmt10) 'D133 = ',Dcoeff(0,1,0,2),'*i'
    write (50,fmt10) 'D222 = ',Dcoeff(0,0,3,0),'*i'
    write (50,fmt10) 'D223 = ',Dcoeff(0,0,2,1),'*i'
    write (50,fmt10) 'D233 = ',Dcoeff(0,0,1,2),'*i'
    write (50,fmt10) 'D333 = ',Dcoeff(0,0,0,3),'*i'
    write(50,*) '-------------------------------------'
    write(50,*)
    close(50)
    
end subroutine writedebugD
