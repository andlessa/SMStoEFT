

! ------------------------------------------------------------
! Define the relevant loop integrals:
! ------------------------------------------------------------
double complex function loopIntegralC00(s,mt2,mchi2,mst2,muR2,deltaUV)

    use collier

    implicit none

    double complex s ! invariant s=(p1+p2)**2 (gluon momentum squared)
    double complex mchi2,mst2,mt2
    double precision muR2,deltaUV
    double complex a,b,c,d,e,f
    double complex xS,xT,xC,C0a,ScalarC00,lamb
    double precision Pi
    parameter  (Pi=3.141592653589793D0)

    ! Make sure masses and S are real 
    ! (divide by mST to deal with dimensionless quantities)
    xS = DCMPLX(real(s)/real(mst2),0d0)
    xT = DCMPLX(real(mt2)/real(mst2),0d0)
    xC = DCMPLX(real(mchi2)/real(mst2),0d0)

    ! Make sure the tops can be on-shell:
    if (real(xS) < 4*real(xT)) then
        loopIntegralC00 = 0.0
        return
    end if

    call Init_cll(4,0,'',.true.)
    call InitCacheSystem_cll(1,4)
    call InitEvent_cll     
    call SetDeltaUV_cll(deltaUV) ! Remove the divergence (MSbar)
    call SetMuUV2_cll(muR2) ! Set the renormalization scale

    ! open(10,FILE='myLog.log',ACTION='WRITE',POSITION='APPEND')
    ! WRITE(10,*) 'INPUT-C00 = ',mt2,mchi2,mst2,s

    ! Compute the scalar loop integrals:
    call C0_cll(C0a,mt2,mt2,s,mst2,mchi2,mst2)

    ! WRITE(10,*) 'C0a (coll) = ',C0a
    
    ! Square-root of Kallen function:
    lamb = CDSQRT(xC**2 - 2*xC*(xT+1) + (xT-1)**2)
    ! Multiply by mst2 to make the coefficient dimensionless
    C0a = C0a*mst2
    ! Compute the C00 integral (expression obtained with Package-X)
    ! (Note that the integral is divergent and the renormalization scheme is MSbar, 
    ! so,following the Collier definitions we set deltaUV =  (1/epsilon +log(4*pi) - gamma_E) = 0
    ! in the expression below. This should be consistent with the C0 result using SetDeltaUV_cll(0d0))
    ScalarC00 = deltaUV
    ScalarC00 = ScalarC00 + 2*(xC**2 + xC*(xS-2*(xT+1)) + (xT-1)**2)*C0a/(xS-4*xT)
    ScalarC00 = ScalarC00 + CDLOG(muR2/mst2)
    ScalarC00 = ScalarC00 + lamb*(xC+xT-1)*(CDLOG(4*xC) - 2*CDLOG(lamb + xC - xT + 1))/(xT*(xS-4*xT))
    ScalarC00 = ScalarC00 + ((xC+xT-1)**2)*CDLOG(xC)/(xT*(xS-4*xT))
    ScalarC00 = ScalarC00 + CDSQRT(xS*(xS-4))*CDLOG((2-xS + CDSQRT(xS*(xS-4)))/2)*(2*xC+xS-2*(xT+1))/(xS*(xS-4*xT))
    ScalarC00 = ScalarC00 + 3d0
    ScalarC00 = ScalarC00/(64*pi**4)

    ! Loop integral value:
    loopIntegralC00 = ScalarC00
    
    ! write(10,*) 'ScalarC00 = ',ScalarC00
    ! write(10,*) 'Returning = ',loopIntegralC00
    ! write(10,*)
    ! write(10,*)
    ! write(10,*)
    ! close(10) 

    return

end function


double complex function loopIntegralC1(s,mt2,mchi2,mst2,muR2,deltaUV)

    use collier

    implicit none

    double complex s ! invariant s=(p1+p2)**2 (gluon momentum squared)
    double complex mchi2,mst2,mt2
    double precision muR2,deltaUV
    double complex xS,xT,xC,C0a,ScalarC1,lamb
    double precision Pi
    parameter  (Pi=3.141592653589793D0)

    ! Make sure masses and S are real 
    ! (divide by mST to deal with dimensionless quantities)
    xS = DCMPLX(real(s)/real(mst2),0d0)
    xT = DCMPLX(real(mt2)/real(mst2),0d0)
    xC = DCMPLX(real(mchi2)/real(mst2),0d0)

    ! Make sure the tops can be on-shell:
    if (real(xS) < 4*real(xT)) then
        loopIntegralC1 = 0.0
        return
    end if
     
    call Init_cll(4,0,'',.true.)
    call InitCacheSystem_cll(1,4)
    call InitEvent_cll     
    call SetDeltaUV_cll(deltaUV) ! Remove the divergence (MSbar)
    call SetMuUV2_cll(muR2) ! Set the renormalization scale

    ! open(10,FILE='myLog.log',ACTION='WRITE',POSITION='APPEND')
    ! WRITE(10,*) 'INPUT-C1 = ',mt2,mchi2,mst2,s

    ! Compute the scalar loop integrals:
    call C0_cll(C0a,mt2,mt2,s,mst2,mchi2,mst2)

    ! WRITE(10,*) 'C0a (coll) = ',C0a
    
    ! Square-root of Kallen function:
    lamb = CDSQRT(xC**2 - 2*xC*(xT+1) + (xT-1)**2)
    ! Multiply by mst2 to make the coefficient dimensionless
    C0a = C0a*mst2
    ! Compute the C12 integral (expression obtained with Package-X)
    ScalarC1 = 2*xS*xT*(xC+xT-1)*C0a
    ScalarC1 = ScalarC1 + xS*lamb*(CDLOG(4*xC) - 2*CDLOG(lamb+xC-xT+1))
    ScalarC1 = ScalarC1 + xS*(xC+xT-1)*CDLOG(xC)
    ScalarC1 = ScalarC1 + 2*xT*CDSQRT(xS*(xS-4))*CDLOG((CDSQRT(xS*(xS-4)) + 2 - xS)/2)
    ScalarC1 = ScalarC1/(32*Pi**4*mst2*xS*xT*(xS-4*xT))

    ! Loop integral value:
    loopIntegralC1 = ScalarC1

    
    ! write(10,*) 'ScalarC1 = ',ScalarC1
    ! write(10,*) 'Returning = ',loopIntegralC1
    ! write(10,*)
    ! write(10,*)
    ! write(10,*)
    ! close(10)

    return 

end function

double complex function loopIntegralC11(s,mt2,mchi2,mst2,muR2,deltaUV)

    use collier

    implicit none

    double complex s ! invariant s=(p1+p2)**2 (gluon momentum squared)
    double complex mchi2,mst2,mt2
    double precision muR2,deltaUV
    double complex xS,xT,xC,C0a,ScalarC11,lamb
    double precision Pi
    parameter  (Pi=3.141592653589793D0)

    ! Make sure masses and S are real 
    ! (divide by mST to deal with dimensionless quantities)
    xS = DCMPLX(real(s)/real(mst2),0d0)
    xT = DCMPLX(real(mt2)/real(mst2),0d0)
    xC = DCMPLX(real(mchi2)/real(mst2),0d0)

    ! Make sure the tops can be on-shell:
    if (real(xS) < 4*real(xT)) then
        loopIntegralC11 = 0.0
        return
    end if

    call Init_cll(4,0,'',.true.)
    call InitCacheSystem_cll(1,4)
    call InitEvent_cll     
    call SetDeltaUV_cll(deltaUV) ! Remove the divergence (MSbar)
    call SetMuUV2_cll(muR2) ! Set the renormalization scale

    ! open(10,FILE='myLog.log',ACTION='WRITE',POSITION='APPEND')
    ! WRITE(10,*) 'INPUT-C11 = ',mt2,mchi2,mst2,s

    ! Compute the scalar loop integrals:
    call C0_cll(C0a,mt2,mt2,s,mst2,mchi2,mst2)

    ! WRITE(10,*) 'C0a (coll) = ',C0a

    ! Square-root of Kallen function:
    lamb = CDSQRT(xC**2 - 2*xC*(xT+1) + (xT-1)**2)
    ! Multiply by mst2 to make the coefficient dimensionless
    C0a = C0a*mst2
    ! Compute the C12 integral (expression obtained with Package-X)
    ScalarC11 = 4*xS*C0a*xT**2*(xS*(xC**2 + xC*(4*xT-2) + (xT-1)**2) + 2*xT*(xC**2 - 2*xC*(xT+1) + (xT-1)**2))
    ScalarC11 = ScalarC11 - xS*CDLOG(xC)*(-4*xS*xT*(2*xC**2 + xC*(xT-4) + 2*(xT-1)**2) + 4*xT**2*(xC**2 - 2*xC*(xT+1) + (xT-1)**2) + xS**2*(xC*(xC-2) + (xT-1)**2))
    ScalarC11 = ScalarC11 + 2*xS*(xC+xT-1)*lamb*(xS**2-8*xS*xT + 4*xT**2)*CDLOG((1+xC-xT + lamb)/(2*CDSQRT(xC)))
    ScalarC11 = ScalarC11 - 2*CDSQRT(xS*(xS-4))*xT**2*CDLOG((2-xS + CDSQRT(xS*(xS-4)))/2)*(-2*xS*(xC+4*xT-1) + 4*xT*(1+xT-xC) +xS**2)
    ScalarC11 = ScalarC11 + 2*xS*xT*(xS-4*xT)*(xS*(xC-1) + 2*xT*(1+xT-xC))
    ScalarC11 = ScalarC11/(64*Pi**4*mst2*xS**2*xT**2*(xS-4*xT)**2)

    ! Loop integral value:
    loopIntegralC11 = ScalarC11
    
    ! write(10,*) 'ScalarC11 = ',ScalarC11
    ! write(10,*) 'Returning = ',loopIntegralC11
    ! write(10,*)
    ! write(10,*)
    ! write(10,*)
    ! close(10)

    return 

end function

double complex function loopIntegralC12(s,mt2,mchi2,mst2,muR2,deltaUV)

    use collier

    implicit none

    double complex s ! invariant s=(p1+p2)**2 (gluon momentum squared)
    double complex mchi2,mst2,mt2
    double precision muR2,deltaUV
    double complex xS,xT,xC,C0a,ScalarC12,lamb
    double precision Pi
    parameter  (Pi=3.141592653589793D0)
    include 'input.inc' ! include all external model parameter

    
    ! Make sure masses and S are real 
    ! (divide by mST to deal with dimensionless quantities)
    xS = DCMPLX(real(s)/real(mst2),0d0)
    xT = DCMPLX(real(mt2)/real(mst2),0d0)
    xC = DCMPLX(real(mchi2)/real(mst2),0d0)

    ! Make sure the tops can be on-shell:
    if (real(xS) < 4*real(xT)) then
        loopIntegralC12 = 0.0
        return
    end if

    call Init_cll(4,0,'',.true.)
    call InitCacheSystem_cll(1,4)
    call InitEvent_cll     
    call SetDeltaUV_cll(deltaUV) ! Remove the divergence (MSbar)
    call SetMuUV2_cll(muR2) ! Set the renormalization scale

    ! open(10,FILE='myLog.log',ACTION='WRITE',POSITION='APPEND')
    ! WRITE(10,*) 'INPUT-C12 = ',mt2,mchi2,mst2,s


    ! Compute the scalar loop integrals:
    call C0_cll(C0a,mt2,mt2,s,mst2,mchi2,mst2)

    ! WRITE(10,*) 'C0a (coll) = ',C0a

    ! Square-root of Kallen function:
    lamb = CDSQRT(xC**2 - 2*xC*(xT+1) + (xT-1)**2)
    ! Multiply by mst2 to make the coefficient dimensionless
    C0a = C0a*mst2
    ! Compute the C12 integral (expression obtained with Package-X)
    ScalarC12 = 2*xS*xT*C0a*(2*xS*(xC**2 - xC*(xT+2) + (xT-1)**2) -2*xT*(xC**2 - 2*xC*(xT+1) + (xT-1)**2) + xC*xS**2)
    ScalarC12 = ScalarC12 + 2*xS*(1-xC-xT)*lamb*(xS+2*xT)*CDLOG((lamb+xC-xT+1)/(2*CDSQRT(xC)))
    ScalarC12 = ScalarC12 + xS*CDLOG(xC)*(xS*(xC**2 + xC*(4*xT-2) + (xT-1)**2) + 2*xT*(xC**2 - 2*xC*(xT+1) + (xT-1)**2))
    ScalarC12 = ScalarC12 + xS*xT*(xS-4*xT)*(2*xC+xS-2*(xT+1))
    ScalarC12 = ScalarC12 + 2*xT*CDSQRT(xS*(xS-4))*CDLOG((2+CDSQRT(xS*(xS-4))-xS)/2)*(xS*(2*xC+xT-2) + 2*xT*(1+xT-xC))
    ScalarC12 = ScalarC12/(32*Pi**4*mst2*xS**2*xT*((xS-4*xT)**2))

    ! Loop integral value:
    loopIntegralC12 = ScalarC12
    
    ! write(10,*) 'ScalarC12 = ',ScalarC12
    ! write(10,*) 'Returning = ',loopIntegralC12
    ! write(10,*)
    ! write(10,*)
    ! write(10,*)
    ! close(10)

    return 

end function



! ------------------------------------------------------------
! Define the form factors in terms of the loop functions:
! ------------------------------------------------------------
double complex function formFactorC00eff(s)

    use collier

    implicit none

    double complex s ! invariant s=(p1+p2)**2 (gluon momentum squared)
    integer rank
    double complex mt2,mst2,mchi2
    double precision c00effvalue,deltaUV,muR2
    double complex C00,C1,C11,C12,ScalarC00eff
    double complex loopIntegralC00,loopIntegralC1,loopIntegralC11,loopIntegralC12
    double complex, allocatable :: Ccoeff(:,:,:),Ccoeffuv(:,:,:)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MUR**2
    deltaUV = MDL_DELTAUV  ! deltaUV = 1/eps + log(4*Pi) - gammaE
    c00effvalue = MDL_C00EFF ! Numerical value for C00eff, which should be replaced by the form factor
 
    if (c00effvalue == 0d0) then
        formFactorC00eff = 0.0 ! If the default C00eff value is zero, do nothing (it can be used to turn off this term) 
    else
        C00 = loopIntegralC00(s,mt2,mchi2,mst2,muR2,deltaUV)
        C1 = loopIntegralC1(s,mt2,mchi2,mst2,muR2,deltaUV)
        C11 = loopIntegralC11(s,mt2,mchi2,mst2,muR2,deltaUV)
        C12 = loopIntegralC12(s,mt2,mchi2,mst2,muR2,deltaUV)
        

        ! call Init_cll(6,6,'',.true.)
        ! call InitCacheSystem_cll(1,4)
        ! call InitEvent_cll     
        ! call SetDeltaUV_cll(deltaUV) ! Remove the divergence (MSbar)
        ! call SetMuUV2_cll(muR2) ! Set the renormalization scale
    
        ! rank = 1
        ! allocate(Ccoeff(0:rank/2,0:rank,0:rank))
        ! allocate(Ccoeffuv(0:rank/2,0:rank,0:rank))
        ! call C_cll(Ccoeff,Ccoeffuv,mt2,s,mt2,mchi2,mst2,mst2,rank) 
        ! open(10,FILE='myLog.log',ACTION='WRITE',POSITION='APPEND')
        ! WRITE(10,*) 'INPUT-C00 = ',mt2,mchi2,mst2,s
        ! write(10,*) 'C00 (loop) = ',C00
        ! write(10,*) 'C11 (loop) = ',C11
        ! write(10,*) 'C12 (loop) = ',C12
        ! write(10,*) 'C1 (loop) = ',C1
        ! write(10,*)
        ! write(10,*) 'COEFF=',Ccoeff
        ! close(10)




        ! Compute effective C00 value:
        ! Note that: C00eff = C_{00} - 2 MT^2 (C_{1} + C_{11} + C_{12}) - (s/2)*(C_{1} + 2 C_{12})
        ScalarC00eff = C00 - 2*mt2*(C1 + C11 + C12) - (s/2)*(C1 + 2*C12)
                
        ! New value to be used to replace the default value:
        formFactorC00eff = ScalarC00eff/c00effvalue
    end if 

    return 

end function


double complex function formFactorC1(s)

    use collier

    implicit none

    double complex s ! invariant s=(p1+p2)**2 (gluon momentum squared)
    double complex mt2,mst2,mchi2
    double precision c1value,deltaUV,muR2
    double complex C1,loopIntegralC1
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MUR**2
    deltaUV = MDL_DELTAUV  ! deltaUV = 1/eps + log(4*Pi) - gammaE
    c1value = MDL_C1 ! Numerical value for C1, which should be replaced by the form factor

    if (c1value == 0.0) then
        formFactorC1 = 0.0 ! If the default C1 value is zero, do nothing (it can be used to turn off this term)
    else            
        C1 = loopIntegralC1(s,mt2,mchi2,mst2,muR2,deltaUV)
        
        ! New value to be used to replace the default value:
        formFactorC1 = C1/c1value
    end if 

    return 

end function


double complex function formFactorC11(s)

    use collier

    implicit none

    double complex s ! invariant s=(p1+p2)**2 (gluon momentum squared)
    double complex mt2,mst2,mchi2
    double precision c11value,deltaUV,muR2
    double complex C11,loopIntegralC11
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MUR**2
    deltaUV = MDL_DELTAUV  ! deltaUV = 1/eps + log(4*Pi) - gammaE
    c11value = MDL_C11 ! Numerical value for C11, which should be replaced by the loop integral

    if (c11value == 0.0) then
        formFactorC11 = 0.0 ! If the default C11 value is zero, do nothing (it can be used to turn off this term)
    else            
        C11 = loopIntegralC11(s,mt2,mchi2,mst2,muR2,deltaUV)
        
        ! New value to be used to replace the default value:
        formFactorC11 = C11/c11value
    end if 

    return 

end function


double complex function formFactorC12(s)

    use collier

    implicit none

    double complex s ! invariant s=(p1+p2)**2 (gluon momentum squared)
    double complex mt2,mst2,mchi2
    double precision c12value,deltaUV,muR2
    double complex C12,loopIntegralC12
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters

    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = MDL_MUR**2   
    deltaUV = MDL_DELTAUV  ! deltaUV = 1/eps + log(4*Pi) - gammaE
    c12value = MDL_C12 ! Numerical value for C12, which should be replaced by the loop integral

    if (c12value == 0.0) then
        formFactorC12 = 0.0 ! If the default C12 value is zero, do nothing (it can be used to turn off this term)
    else            
        C12 = loopIntegralC12(s,mt2,mchi2,mst2,muR2,deltaUV)
        
        ! New value to be used to replace the default value:
        formFactorC12 = C12/c12value
    end if 

    return 

end function