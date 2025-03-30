C ************************************************************
C Source for the library implementing a bias function that 
C populates the large pt tale of the leading jet. 
C
C The two options of this subroutine, that can be set in
C the run card are:
C    > (double precision) mtt_bias_target_mtt : target mtt value
C    > (double precision) mtt_bias_enhancement_power : exponent
C
C Schematically, the functional form of the enhancement is
C    bias_wgt = [mtt(evt)/mean_mtt]^enhancement_power
C ************************************************************
C
C The following lines are read by MG5aMC to set what are the 
C relevant parameters for this bias module.
C
C  parameters = {'mtt_bias_target_mtt': 1000.0,
C               'mtt_bias_enhancement_power': 4.0}
C

      subroutine bias_wgt_custom(p, original_weight, bias_weight)
      implicit none
C
C Parameters
C
          include '../../maxparticles.inc'          
          include '../../nexternal.inc'

C
C Arguments
C
          double precision p(0:3,nexternal)
          double precision pTot(0:3)
          double precision mtt
          double precision original_weight, bias_weight
C
C local variables
C
          integer i,j
          integer ipdg(nexternal)
          double precision pt(nexternal)
          double precision max_mtt
c
c local variables defined in the run_card
c
          double precision mtt_bias_target_mtt
          double precision mtt_bias_enhancement_power
C
C Global variables
C
C
C Mandatory common block to be defined in bias modules
C
          double precision stored_bias_weight
          data stored_bias_weight/1.0d0/          
          logical impact_xsec, requires_full_event_info
C         We only want to bias distributions, but not impact the xsec. 
          data impact_xsec/.False./
C         Of course this module does not require the full event
C         information (color, resonances, helicities, etc..)
          data requires_full_event_info/.False./ 
          common/bias/stored_bias_weight,impact_xsec,
     &                requires_full_event_info


C
C    Setup the value of the parameters from the run_card    
C
c      include '../bias.inc'

C --------------------
C BEGIN IMPLEMENTATION
C --------------------
          
          bias_weight = 1.0d0
          mtt = 0d0
          pTot = (/ 0d0, 0d0, 0d0, 0d0 /)
          do i=1,nexternal
            ! if (is_heavy(i)) then
            if (abs(ipdg(i)).eq.6) then
              do j =0,3
                pTot(j) = pTot(j)+p(j,i)
              enddo 
            endif
          enddo

          mtt = dsqrt(pTot(0)**2 - pTot(1)**2 - pTot(2)**2 - pTot(3)**2)

          if (mtt.gt.0.0d0) then
            bias_weight = (mtt/mtt_bias_target_mtt)**mtt_bias_enhancement_power
          endif

       return

      end subroutine bias_wgt_custom
