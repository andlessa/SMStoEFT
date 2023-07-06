


double complex function formFactorC00eff(s)

    use collier

    implicit none

    double complex s ! invariant s=(p1+p2)**2 (gluon momentum squared)
    double complex mchi2,mst2,mt2,c00effvalue
    double precision muR2
    double complex A0a,A0b,B0a,B0b,C0a,ScalarC00eff
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

    if (c00effvalue == 0.0) then
        formFactorC00eff = 0.0 ! If the default C00eff value is zero, do nothing (it can be used to turn off this term)
    else            
        call Init_cll(4,0,'')
        call InitCacheSystem_cll(1,4)
        call InitEvent_cll     
        call SetDeltaUV_cll(0d0) ! Remove the divergence (MSbar)
        call SetMuUV2_cll(muR2) ! Set the renormalization scale

        ! Compute the scalar loop integrals:
        call A0_cll(A0a,mchi2)
        call A0_cll(A0b,mst2)
        call B0_cll(B0a,s,mst2,mst2)
        call B0_cll(B0b,mt2,mchi2,mst2)
        call C0_cll(C0a,mt2,mt2,s,mst2,mchi2,mst2)

        ! Combine to get the value of the C00 loop integral:
        ScalarC00eff = 8*A0a*(-4*mt2 + s)  
        ScalarC00eff = ScalarC00eff + A0b*(32*mt2 - 8*s) 
        ScalarC00eff = ScalarC00eff - B0a*(6*mchi2 - 6*mst2 + 2*mt2 + s)*(4*mt2 + s) 
        ScalarC00eff = ScalarC00eff + B0b*(8*mt2*(7*mchi2 - 7*mst2 + 3*mt2) - 2*(mchi2 - mst2 + mt2)*s + 2*s**2)        
        ScalarC00eff = ScalarC00eff + 2*C0a*(-3*mchi2**2 + (2*mchi2 - mst2 + mt2)*(3*mst2 + mt2 - s))*(4*mt2 + s) 
        ScalarC00eff = ScalarC00eff/(4.*(-4*mt2 + s)**2)
        
        ! New value to be used to replace the default value:
        formFactorC00eff = ScalarC00eff/c00effvalue

    end if 

    return 

end function



double complex function formFactorC1(s)

    use collier

    implicit none

    double complex s ! invariant s=(p1+p2)**2 (gluon momentum squared)
    double complex mchi2,mst2,mt2,c1value
    double precision muR2
    double complex B0a,B0b,C0a,ScalarC1
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = dcmplx(MDL_MUR)**2
    c1value = MDL_C1 ! Numerical value for C1, which should be replaced by the loop integral


    ! Make sure the tops can be on-shell:
    if (real(s) < 4*real(mt2)) then
        formFactorC1 = 0.0
        return
    end if

    if (c1value == 0.0) then
        formFactorC1 = 0.0 ! If the default C1 value is zero, do nothing (it can be used to turn off this term)
    else            
        call Init_cll(4,0,'')
        call InitCacheSystem_cll(1,4)
        call InitEvent_cll     
        call SetDeltaUV_cll(0d0) ! Remove the divergence (MSbar)
        call SetMuUV2_cll(muR2) ! Set the renormalization scale

        ! Compute the scalar loop integrals:
        call B0_cll(B0a,s,mst2,mst2)
        call B0_cll(B0b,mt2,mchi2,mst2)
        call C0_cll(C0a,mt2,mt2,s,mst2,mchi2,mst2)

        ! Combine to get the value of the C1 loop integral:
        ScalarC1 = -B0a
        ScalarC1 = ScalarC1 + B0b
        ScalarC1 = ScalarC1 - C0a*(mchi2 - mst2 + mt2)
        ScalarC1 = ScalarC1/(4*mt2 - s)

        ! New value to be used to replace the default value:
        formFactorC1 = ScalarC1/c1value

    end if 

    return 

end function


double complex function formFactorC11(s)

    use collier

    implicit none

    double complex s ! invariant s=(p1+p2)**2 (gluon momentum squared)
    double complex mchi2,mst2,mt2,c11value
    double precision muR2
    double complex A0a,A0b,B0a,B0b,C0a,ScalarC11
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = dcmplx(MDL_MUR)**2
    c11value = MDL_C11 ! Numerical value for C11, which should be replaced by the loop integral


    ! Make sure the tops can be on-shell:
    if (real(s) < 4*real(mt2)) then
        formFactorC11 = 0.0
        return
    end if

    if (c11value == 0.0) then
        formFactorC11 = 0.0 ! If the default C1 value is zero, do nothing (it can be used to turn off this term)
    else            
        call Init_cll(4,0,'')
        call InitCacheSystem_cll(1,4)
        call InitEvent_cll     
        call SetDeltaUV_cll(0d0) ! Remove the divergence (MSbar)
        call SetMuUV2_cll(muR2) ! Set the renormalization scale

        ! Compute the scalar loop integrals:
        call A0_cll(A0a,mchi2)
        call A0_cll(A0b,mst2)
        call B0_cll(B0a,s,mst2,mst2)
        call B0_cll(B0b,mt2,mchi2,mst2)
        call C0_cll(C0a,mt2,mt2,s,mst2,mchi2,mst2)

        ! Combine to get the value of the C11 loop integral:
        ScalarC11 = -2*A0a*(2*mt2 - s)*(4*mt2 - s) 
        ScalarC11 = ScalarC11 + 2*A0b*(2*mt2 - s)*(4*mt2 - s) 
        ScalarC11 = ScalarC11 + 2*B0b*(mchi2 - mst2 + mt2)*(4*mt2**2 - 8*mt2*s + s**2) 
        ScalarC11 = ScalarC11 - 2*B0a*mt2*(4*mt2**2 - 8*mt2*s + s**2 - 2*mchi2*(2*mt2 + s) + 2*mst2*(2*mt2 + s))
        ScalarC11 = ScalarC11 + 4*C0a*mt2*(mchi2**2*(2*mt2 + s) + (mst2 - mt2)**2*(2*mt2 + s) - 2*mchi2*(2*mt2*(mt2 - s) + mst2*(2*mt2 + s)))
        ScalarC11 = ScalarC11/(4.*mt2*s*(-4*mt2 + s)**2)

        ! New value to be used to replace the default value:
        formFactorC11 = ScalarC11/c11value
    end if 

    return 

end function


double complex function formFactorC12(s)

    use collier

    implicit none

    double complex s ! invariant s=(p1+p2)**2 (gluon momentum squared)
    double complex mchi2,mst2,mt2,c12value
    double precision muR2
    double complex A0a,A0b,B0a,B0b,C0a,ScalarC12
    include 'input.inc' ! include all external model parameter
    include 'coupl.inc' ! include other parameters
   
    mchi2 = MDL_MCHI**2
    mst2 = MDL_MST**2
    mt2 = MDL_MT**2
    muR2 = dcmplx(MDL_MUR)**2
    c12value = MDL_C12 ! Numerical value for C12, which should be replaced by the loop integral


    ! Make sure the tops can be on-shell:
    if (real(s) < 4*real(mt2)) then
        formFactorC12 = 0.0
        return
    end if

    if (c12value == 0.0) then
        formFactorC12 = 0.0 ! If the default C1 value is zero, do nothing (it can be used to turn off this term)
    else            
        call Init_cll(4,0,'')
        call InitCacheSystem_cll(1,4)
        call InitEvent_cll     
        call SetDeltaUV_cll(0d0) ! Remove the divergence (MSbar)
        call SetMuUV2_cll(muR2) ! Set the renormalization scale

        ! Compute the scalar loop integrals:
        call A0_cll(A0a,mchi2)
        call A0_cll(A0b,mst2)
        call B0_cll(B0a,s,mst2,mst2)
        call B0_cll(B0b,mt2,mchi2,mst2)
        call C0_cll(C0a,mt2,mt2,s,mst2,mchi2,mst2)

        ! Combine to get the value of the C11 loop integral:
        ScalarC12 = -(A0a*(4*mt2 - s))
        ScalarC12 = ScalarC12 + A0b*(4*mt2 - s) 
        ScalarC12 = ScalarC12 + B0a*(2*mchi2*(mt2 - s) - 2*mst2*(mt2 - s) - mt2*(2*mt2 + s))         
        ScalarC12 = ScalarC12 + B0b*(mchi2 - mst2 + mt2)*(2*mt2 + s) 
        ScalarC12 = ScalarC12 + C0a*(2*mchi2**2*(mt2 - s) + 2*(mst2 - mt2)**2*(mt2 - s) - mchi2*(4*mt2**2 + 4*mst2*(mt2 - s) - 2*mt2*s + s**2))
        ScalarC12 = -ScalarC12/(s*(-4*mt2 + s)**2)

        ! New value to be used to replace the default value:
        formFactorC12 = ScalarC12/c12value
    end if 

    return 

end function