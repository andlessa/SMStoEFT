double complex function cdli2(z)
  implicit none
  double complex :: z, rest, u, u2, u4, sum, fast_cdlog
  double precision :: rz, iz, nz, sgn, dli2
  double precision, parameter :: PI = 3.14159265358979324D0
  double precision, parameter :: bf(10) = (/ - 1.0D0/4.0D0, &
    & + 1.0D0/36.0D0, &
    & - 1.0D0/3600.0D0, &
    & + 1.0D0/211680.0D0, &
    & - 1.0D0/10886400.0D0, &
    & + 1.0D0/526901760.0D0, &
    & - 4.0647616451442255D-11, &
    & + 8.9216910204564526D-13, &
    & - 1.9939295860721076D-14, &
    & + 4.5189800296199182D-16 /)

  rz = real(z)
  iz = aimag(z)

  ! special cases
  if (iz .eq. 0) then
     if (rz .le. 1) cdli2 = dcmplx(dli2(rz), 0)
     if (rz .gt. 1) cdli2 = dcmplx(dli2(rz), -PI*log(rz))
     return
  endif

  nz = rz**2 + iz**2

  if (nz .lt. EPSILON(1D0)) then
     cdli2 = z*(1 + 0.25D0*z)
     return
  endif

  ! transformation to |z| < 1, Re(z) <= 0.5
  if (rz .le. 0.5D0) then
     if (nz .gt. 1) then
        u = -fast_cdlog(1 - 1/z)
        rest = -0.5D0*fast_cdlog(-z)**2 - PI**2/6
        sgn = -1
     else ! nz <= 1
        u = -fast_cdlog(1 - z)
        rest = 0
        sgn = 1
     endif
  else ! rz > 0.5D0
     if (nz .le. 2*rz) then
        u = -fast_cdlog(z)
        rest = u*fast_cdlog(1 - z) + PI**2/6
        sgn = -1
     else ! nz > 2*rz
        u = -fast_cdlog(1 - 1/z)
        rest = -0.5D0*fast_cdlog(-z)**2 - PI**2/6
        sgn = -1
     endif
  endif

  u2 = u**2
  u4 = u2**2
  sum =                                                    &
     u +                                                   &
     u2 * (bf(1) +                                         &
     u  * (bf(2) +                                         &
     u2 * (                                                &
         bf(3) +                                           &
         u2*bf(4) +                                        &
         u4*(bf(5) + u2*bf(6)) +                           &
         u4*u4*(bf(7) + u2*bf(8) + u4*(bf(9) + u2*bf(10))) &
     )))

  cdli2 = sgn*sum + rest

end function cdli2


double complex function formFactorC00eff(s)

    use collier

    implicit none

    double complex s ! invariant s=(p1+p2)**2 (gluon momentum squared)
    double complex mchi2,mst2,mt2,c00effvalue
    double precision muR2
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

    if (c00effvalue == 0.0) then
        formFactorC00eff = 0.0 ! If the default C00eff value is zero, do nothing (it can be used to turn off this term)
    else            
        call Init_cll(4,0,'',.true.)
        call InitCacheSystem_cll(1,4)
        call InitEvent_cll     
        call SetDeltaUV_cll(0d0) ! Remove the divergence (MSbar)
        call SetMuUV2_cll(muR2) ! Set the renormalization scale

        ! Compute the scalar loop integrals:
        ! call A0_cll(A0a,mchi2)
        ! call A0_cll(A0b,mst2)
        ! call B0_cll(B0a,s,mst2,mst2)
        ! call B0_cll(B0b,mt2,mchi2,mst2)
        call C0_cll(C0a,mt2,mt2,s,mst2,mchi2,mst2)


        A0a = mchi2*CDLOG(muR2/mchi2)/(16*Pi**4)
        A0b = mst2*CDLOG(muR2/mst2)/(16*Pi**4)
        
        B0a = CDLOG(muR2/mst2) 
        B0a = B0a + CDSQRT(s*(s-4*mst2))*CDLOG((CDSQRT(s*(s-4*mst2)) + 2*mst2-s)/(2*mst2))
        B0a = B0a/(16*s*Pi**4)

        B0b = 2*CDLOG(muR2/mst2)+CDLOG(mst2/mchi2) 
        B0b = B0b - (mchi2*CDLOG(mchi2/mst2) - mst2*CDLOG(mchi2/mst2) + CDSQRT(mchi2**2 + (mst2 - mt2)**2 - 2*mchi2*(mst2 + mt2))*(CDLOG(4*mchi2*mst2) - 2*CDLOG(mchi2 + mst2 - mt2 + CDSQRT((mchi2 - mst2)**2 - 2*(mchi2 + mst2)*mt2 + mt2**2))))/mt2
        B0b = B0b/(32*Pi**4)
        

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
    double precision Pi
    parameter  (Pi=3.141592653589793D0)
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
        call Init_cll(4,0,'',.true.)
        call InitCacheSystem_cll(1,4)
        call InitEvent_cll     
        call SetDeltaUV_cll(0d0) ! Remove the divergence (MSbar)
        call SetMuUV2_cll(muR2) ! Set the renormalization scale

        ! Compute the scalar loop integrals:
        ! call B0_cll(B0a,s,mst2,mst2)
        ! call B0_cll(B0b,mt2,mchi2,mst2)
        call C0_cll(C0a,mt2,mt2,s,mst2,mchi2,mst2)

        
        B0a = CDLOG(muR2/mst2) 
        B0a = B0a + CDSQRT(s*(s-4*mst2))*CDLOG((CDSQRT(s*(s-4*mst2)) + 2*mst2-s)/(2*mst2))
        B0a = B0a/(16*s*Pi**4)

        B0b = 2*CDLOG(muR2/mst2)+CDLOG(mst2/mchi2) 
        B0b = B0b - (mchi2*CDLOG(mchi2/mst2) - mst2*CDLOG(mchi2/mst2) + CDSQRT(mchi2**2 + (mst2 - mt2)**2 - 2*mchi2*(mst2 + mt2))*(CDLOG(4*mchi2*mst2) - 2*CDLOG(mchi2 + mst2 - mt2 + CDSQRT((mchi2 - mst2)**2 - 2*(mchi2 + mst2)*mt2 + mt2**2))))/mt2
        B0b = B0b/(32*Pi**4)        

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
    double precision Pi
    parameter  (Pi=3.141592653589793D0)
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
        call Init_cll(4,0,'',.true.)
        call InitCacheSystem_cll(1,4)
        call InitEvent_cll     
        call SetDeltaUV_cll(0d0) ! Remove the divergence (MSbar)
        call SetMuUV2_cll(muR2) ! Set the renormalization scale

        ! Compute the scalar loop integrals:
        ! call A0_cll(A0a,mchi2)
        ! call A0_cll(A0b,mst2)
        ! call B0_cll(B0a,s,mst2,mst2)
        ! call B0_cll(B0b,mt2,mchi2,mst2)
        call C0_cll(C0a,mt2,mt2,s,mst2,mchi2,mst2)


        A0a = mchi2*CDLOG(muR2/mchi2)/(16*Pi**4)
        A0b = mst2*CDLOG(muR2/mst2)/(16*Pi**4)
        
        B0a = CDLOG(muR2/mst2) 
        B0a = B0a + CDSQRT(s*(s-4*mst2))*CDLOG((CDSQRT(s*(s-4*mst2)) + 2*mst2-s)/(2*mst2))
        B0a = B0a/(16*s*Pi**4)

        B0b = 2*CDLOG(muR2/mst2)+CDLOG(mst2/mchi2) 
        B0b = B0b - (mchi2*CDLOG(mchi2/mst2) - mst2*CDLOG(mchi2/mst2) + CDSQRT(mchi2**2 + (mst2 - mt2)**2 - 2*mchi2*(mst2 + mt2))*(CDLOG(4*mchi2*mst2) - 2*CDLOG(mchi2 + mst2 - mt2 + CDSQRT((mchi2 - mst2)**2 - 2*(mchi2 + mst2)*mt2 + mt2**2))))/mt2
        B0b = B0b/(32*Pi**4)        

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
    double precision Pi
    parameter  (Pi=3.141592653589793D0)
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
        call Init_cll(4,0,'',.true.)
        call InitCacheSystem_cll(1,4)
        call InitEvent_cll     
        call SetDeltaUV_cll(0d0) ! Remove the divergence (MSbar)
        call SetMuUV2_cll(muR2) ! Set the renormalization scale

        ! Compute the scalar loop integrals:
        ! call A0_cll(A0a,mchi2)
        ! call A0_cll(A0b,mst2)
        ! call B0_cll(B0a,s,mst2,mst2)
        ! call B0_cll(B0b,mt2,mchi2,mst2)
        call C0_cll(C0a,mt2,mt2,s,mst2,mchi2,mst2)

        A0a = mchi2*CDLOG(muR2/mchi2)/(16*Pi**4)
        A0b = mst2*CDLOG(muR2/mst2)/(16*Pi**4)
        
        B0a = CDLOG(muR2/mst2) 
        B0a = B0a + CDSQRT(s*(s-4*mst2))*CDLOG((CDSQRT(s*(s-4*mst2)) + 2*mst2-s)/(2*mst2))
        B0a = B0a/(16*s*Pi**4)

        B0b = 2*CDLOG(muR2/mst2)+CDLOG(mst2/mchi2) 
        B0b = B0b - (mchi2*CDLOG(mchi2/mst2) - mst2*CDLOG(mchi2/mst2) + CDSQRT(mchi2**2 + (mst2 - mt2)**2 - 2*mchi2*(mst2 + mt2))*(CDLOG(4*mchi2*mst2) - 2*CDLOG(mchi2 + mst2 - mt2 + CDSQRT((mchi2 - mst2)**2 - 2*(mchi2 + mst2)*mt2 + mt2**2))))/mt2
        B0b = B0b/(32*Pi**4)

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