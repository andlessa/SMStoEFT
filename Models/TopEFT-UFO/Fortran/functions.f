


double complex function formFactorC00eff(s)

    use collier

    implicit none

    double complex s ! invariant s=(p1+p2)**2 (gluon momentum squared)
    double complex mchi2,mst2,mt2
    double precision muR2,c00effvalue
    double complex A0a,A0b,B0a,B0b,C0a,ScalarC00eff
    double precision Pi
    parameter  (Pi=3.141592653589793D0)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = dcmplx(MDL_MUR)**2
    c00effvalue = MDL_C00EFF ! Numerical value for C00eff, which should be replaced by the loop integral
    
    ! Note that: C00eff = C_{00} - 2 MT^2 (C_{1} + C_{11} + C_{12}) - (s/2)*(C_{1} + 2 C_{12})

    ! Make sure the tops can be on-shell:
    if (real(s) < 4*real(mt2)) then
        formFactorC00eff = 0.0
        return
    end if

    if (c00effvalue == 0d0) then
        formFactorC00eff = 0.0 ! If the default C00eff value is zero, do nothing (it can be used to turn off this term) 
    else            
        call Init_cll(4,0,'',.true.)
        call InitCacheSystem_cll(1,4)
        call InitEvent_cll     
        call SetDeltaUV_cll(0d0) ! Remove the divergence (MSbar)
        call SetMuUV2_cll(muR2) ! Set the renormalization scale

        open(10,FILE='myLog.log',ACTION='WRITE',POSITION='APPEND')
        WRITE(10,*) 'INPUT-C00eff = ',mt2,mchi2,mst2,s


        ! Compute the scalar loop integrals:
        call A0_cll(A0a,mchi2)
        call A0_cll(A0b,mst2)
        call B0_cll(B0a,s,mst2,mst2)
        call B0_cll(B0b,mt2,mchi2,mst2)
        call C0_cll(C0a,mt2,mt2,s,mst2,mchi2,mst2)

        ! Collier definitions do not include the 1/(2*Pi)^4 factor in the integral
        A0a = A0a/((2.*Pi)**4)
        A0b = A0b/((2.*Pi)**4)
        B0a = B0a/((2.*Pi)**4)
        B0b = B0b/((2.*Pi)**4)
        C0a = C0a/((2.*Pi)**4)

        
        WRITE(10,*) 'A0a (coll) = ',A0a        
        WRITE(10,*) 'A0b (coll) = ',A0b
        WRITE(10,*) 'B0a (coll) = ',B0a
        WRITE(10,*) 'B0b (coll) = ',B0b
        WRITE(10,*) 'C0a (coll) = ',C0a

        ! Combine to get the value of the C00 loop integral:
        ScalarC00eff = 8*A0a*(-4*mt2 + s)  
        ScalarC00eff = ScalarC00eff + A0b*(32*mt2 - 8*s) 
        ScalarC00eff = ScalarC00eff - B0a*(6*mchi2 - 6*mst2 + 2*mt2 + s)*(4*mt2 + s) 
        ScalarC00eff = ScalarC00eff + B0b*(8*mt2*(7*mchi2 - 7*mst2 + 3*mt2) - 2*(mchi2 - mst2 + mt2)*s + 2*s**2)        
        ScalarC00eff = ScalarC00eff + 2*C0a*(-3*mchi2**2 + (2*mchi2 - mst2 + mt2)*(3*mst2 + mt2 - s))*(4*mt2 + s) 
        ScalarC00eff = ScalarC00eff/(4.*(-4*mt2 + s)**2)
        
        ! New value to be used to replace the default value:
        formFactorC00eff = ScalarC00eff/c00effvalue

        write(10,*) 'ScalarC0eff = ',ScalarC00eff
        write(10,*) 'C0eff value = ',c00effvalue
        write(10,*) 'Returning = ',formFactorC00eff
        write(10,*)
        write(10,*)
        write(10,*)


    end if 

    return 

end function



double complex function formFactorC1(s)

    use collier

    implicit none

    double complex s ! invariant s=(p1+p2)**2 (gluon momentum squared)
    double complex mchi2,mst2,mt2
    double precision muR2,c1value
    double complex xS,xT,xC,C0a,ScalarC1,lamb
    double precision Pi
    parameter  (Pi=3.141592653589793D0)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = dcmplx(MDL_MUR)**2
    c1value = MDL_C1 ! Numerical value for C1, which should be replaced by the loop integral

    ! Make sure masses and S are real 
    ! (divide by mST to deal with dimensionless quantities)
    xS = DCMPLX(real(s)/real(mst2),0d0)
    xT = DCMPLX(real(mt2)/real(mst2),0d0)
    xC = DCMPLX(real(mchi2)/real(mst2),0d0)

    ! Make sure the tops can be on-shell:
    if (real(xS) < 4*real(xT)) then
        formFactorC1 = 0.0
        return
    end if

    if (c1value == 0.0) then
        formFactorC1 = 0.0 ! If the default C1 value is zero, do nothing (it can be used to turn off this term)
    else            
        call Init_cll(4,0,'',.true.)
        call InitCacheSystem_cll(1,4)
        call InitEvent_cll     
        call SetDeltaUV_cll(0d0) ! Remove the divergence (MSbar)
        call SetMuUV2_cll(muR2) ! Set the renormalization scale

        open(10,FILE='myLog.log',ACTION='WRITE',POSITION='APPEND')
        WRITE(10,*) 'INPUT-C1 = ',mt2,mchi2,mst2,s

        ! Compute the scalar loop integrals:
        call C0_cll(C0a,mt2,mt2,s,mst2,mchi2,mst2)

        WRITE(10,*) 'C0a (coll) = ',C0a
        
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

        ! New value to be used to replace the default value:
        formFactorC1 = ScalarC1/c1value

        
        write(10,*) 'ScalarC1 = ',ScalarC1
        write(10,*) 'C1 value = ',c1value
        write(10,*) 'Returning = ',formFactorC1
        write(10,*)
        write(10,*)
        write(10,*)
        close(10)


    end if 

    return 

end function


double complex function formFactorC11(s)

    use collier

    implicit none

    double complex s ! invariant s=(p1+p2)**2 (gluon momentum squared)
    double complex mchi2,mst2,mt2
    double precision muR2,c11value
    double complex xS,xT,xC,C0a,ScalarC11,lamb
    double precision Pi
    parameter  (Pi=3.141592653589793D0)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = dcmplx(MDL_MUR)**2
    c11value = MDL_C11 ! Numerical value for C11, which should be replaced by the loop integral

    ! Make sure masses and S are real 
    ! (divide by mST to deal with dimensionless quantities)
    xS = DCMPLX(real(s)/real(mst2),0d0)
    xT = DCMPLX(real(mt2)/real(mst2),0d0)
    xC = DCMPLX(real(mchi2)/real(mst2),0d0)

    ! Make sure the tops can be on-shell:
    if (real(xS) < 4*real(xT)) then
        formFactorC11 = 0.0
        return
    end if

    if (c11value == 0.0) then
        formFactorC11 = 0.0 ! If the default C1 value is zero, do nothing (it can be used to turn off this term)
    else            
        call Init_cll(4,0,'',.true.)
        call InitCacheSystem_cll(1,4)
        call InitEvent_cll     
        call SetDeltaUV_cll(0d0) ! Remove the divergence (MSbar)
        call SetMuUV2_cll(muR2) ! Set the renormalization scale

        open(10,FILE='myLog.log',ACTION='WRITE',POSITION='APPEND')
        WRITE(10,*) 'INPUT-C11 = ',mt2,mchi2,mst2,s

        ! Compute the scalar loop integrals:
        call C0_cll(C0a,mt2,mt2,s,mst2,mchi2,mst2)

        WRITE(10,*) 'C0a (coll) = ',C0a
   
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

        ! New value to be used to replace the default value:
        formFactorC11 = ScalarC11/c11value

        
        write(10,*) 'ScalarC11 = ',ScalarC11
        write(10,*) 'C11 value = ',c11value
        write(10,*) 'Returning = ',formFactorC11
        write(10,*)
        write(10,*)
        write(10,*)
        close(10)


    end if 

    return 

end function


double complex function formFactorC12(s)

    use collier

    implicit none

    double complex s ! invariant s=(p1+p2)**2 (gluon momentum squared)
    double complex mchi2,mst2,mt2
    double precision muR2,c12value
    double complex xS,xT,xC,C0a,ScalarC12,lamb
    double precision Pi
    parameter  (Pi=3.141592653589793D0)
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = dcmplx(MDL_MUR)**2
    c12value = MDL_C12 ! Numerical value for C12, which should be replaced by the loop integral

    ! Make sure masses and S are real 
    ! (divide by mST to deal with dimensionless quantities)
    xS = DCMPLX(real(s)/real(mst2),0d0)
    xT = DCMPLX(real(mt2)/real(mst2),0d0)
    xC = DCMPLX(real(mchi2)/real(mst2),0d0)

    ! Make sure the tops can be on-shell:
    if (real(xS) < 4*real(xT)) then
        formFactorC12 = 0.0
        return
    end if

    if (c12value == 0.0) then
        formFactorC12 = 0.0 ! If the default C1 value is zero, do nothing (it can be used to turn off this term)
    else            
        call Init_cll(4,0,'',.true.)
        call InitCacheSystem_cll(1,4)
        call InitEvent_cll     
        call SetDeltaUV_cll(0d0) ! Remove the divergence (MSbar)
        call SetMuUV2_cll(muR2) ! Set the renormalization scale

        open(10,FILE='myLog.log',ACTION='WRITE',POSITION='APPEND')
        WRITE(10,*) 'INPUT-C12 = ',mt2,mchi2,mst2,s


        ! Compute the scalar loop integrals:
        call C0_cll(C0a,mt2,mt2,s,mst2,mchi2,mst2)

        WRITE(10,*) 'C0a (coll) = ',C0a

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

        ! New value to be used to replace the default value:
        formFactorC12 = ScalarC12/c12value
        
        write(10,*) 'ScalarC12 = ',ScalarC12
        write(10,*) 'C12 value = ',c12value
        write(10,*) 'Returning = ',formFactorC12
        write(10,*)
        write(10,*)
        write(10,*)
        close(10)


    end if 

    return 

end function