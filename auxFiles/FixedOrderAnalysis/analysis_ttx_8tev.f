c
c This file contains the default histograms for fixed order runs: it
c only plots the total rate as an example. It can be used as a template
c to make distributions for other observables.
c
c This uses the HwU package and generates histograms in the HwU/GnuPlot
c format. This format is human-readable. After running, the histograms
c can be found in the Events/run_XX/ directory.
c
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine analysis_begin(nwgt,weights_info)
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c This subroutine is called once at the start of each run. Here the
c histograms should be declared. 
c
c Declare the histograms using 'HwU_book'.
c     o) The first argument is an integer that labels the histogram. In
c     the analysis_end and analysis_fill subroutines this label is used
c     to keep track of the histogram. The label should be a number
c     starting at 1 and be increased for each plot.
c     o) The second argument is a string that will apear above the
c     histogram. Do not use brackets "(" or ")" inside this string.
c     o) The third, forth and fifth arguments are the number of bis, the
c     lower edge of the first bin and the upper edge of the last
c     bin.
c     o) When including scale and/or PDF uncertainties, declare a
c     histogram for each weight, and compute the uncertainties from the
c     final set of histograms
c
      implicit none
c When including scale and/or PDF uncertainties the total number of
c weights considered is nwgt
      integer nwgt,i,l
c In the weights_info, there is an text string that explains what each
c weight will mean. The size of this array of strings is equal to nwgt.
      character*(*) weights_info(*)
      character*6 cc(1)
      data cc/'NLONP2'/
c Initialize the histogramming package (HwU). Pass the number of
c weights and the information on the weights:
      call HwU_inithist(nwgt,weights_info)
c declare (i.e. book) the histograms
      do i=1,1
        l=(i-1)*52

         call HwU_book(l+ 1,'total rate  '//cc(i), 1,0.5d0,1.5d0)

c        ATLAS_tt_8TeV_dilep_Mtt
         call HwU_book(l+ 2,'ATLAS_tt_8TeV_dilep_Mtt-250-450  '//cc(i), 1,250d0,450d0)
         call HwU_book(l+ 3,'ATLAS_tt_8TeV_dilep_Mtt-450-570  '//cc(i), 1,450d0,570d0)
         call HwU_book(l+ 4,'ATLAS_tt_8TeV_dilep_Mtt-570-700  '//cc(i), 1,570d0,700d0)
         call HwU_book(l+ 5,'ATLAS_tt_8TeV_dilep_Mtt-700-850  '//cc(i), 1,700d0,850d0)
         call HwU_book(l+ 6,'ATLAS_tt_8TeV_dilep_Mtt-850-1000  '//cc(i), 1,850d0,1000d0)
         call HwU_book(l+ 7,'ATLAS_tt_8TeV_dilep_Mtt-1000-2700  '//cc(i), 1,1000d0,2700d0)

c        ATLAS_tt_8TeV_ljets_Mtt
         call HwU_book(l+ 8,'ATLAS_tt_8TeV_ljets_Mtt-345-400  '//cc(i), 1,345d0,400d0)
         call HwU_book(l+ 9,'ATLAS_tt_8TeV_ljets_Mtt-400-470  '//cc(i), 1,400d0,470d0)
         call HwU_book(l+ 10,'ATLAS_tt_8TeV_ljets_Mtt-470-550  '//cc(i), 1,470d0,550d0)
         call HwU_book(l+ 11,'ATLAS_tt_8TeV_ljets_Mtt-550-650  '//cc(i), 1,550d0,650d0)
         call HwU_book(l+ 12,'ATLAS_tt_8TeV_ljets_Mtt-650-800  '//cc(i), 1,650d0,800d0)
         call HwU_book(l+ 13,'ATLAS_tt_8TeV_ljets_Mtt-800-1100  '//cc(i), 1,800d0,1100d0)
         call HwU_book(l+ 14,'ATLAS_tt_8TeV_ljets_Mtt-1100-1600  '//cc(i), 1,1100d0,1600d0)

c        CMS_tt_8TeV_ljets_Ytt
         call HwU_book(l+ 15,'CMS_tt_8TeV_ljets_Ytt--2.5--1.3  '//cc(i), 1,-2.5d0,-1.3d0)
         call HwU_book(l+ 16,'CMS_tt_8TeV_ljets_Ytt--1.3--0.9  '//cc(i), 1,-1.3d0,-0.9d0)
         call HwU_book(l+ 17,'CMS_tt_8TeV_ljets_Ytt--0.9--0.6  '//cc(i), 1,-0.9d0,-0.6d0)
         call HwU_book(l+ 18,'CMS_tt_8TeV_ljets_Ytt--0.6--0.3  '//cc(i), 1,-0.6d0,-0.3d0)
         call HwU_book(l+ 19,'CMS_tt_8TeV_ljets_Ytt--0.3-0.0  '//cc(i), 1,-0.3d0,0.0d0)
         call HwU_book(l+ 20,'CMS_tt_8TeV_ljets_Ytt-0.0-0.3  '//cc(i), 1,0.0d0,0.3d0)
         call HwU_book(l+ 21,'CMS_tt_8TeV_ljets_Ytt-0.3-0.6  '//cc(i), 1,0.3d0,0.6d0)
         call HwU_book(l+ 22,'CMS_tt_8TeV_ljets_Ytt-0.6-0.9  '//cc(i), 1,0.6d0,0.9d0)
         call HwU_book(l+ 23,'CMS_tt_8TeV_ljets_Ytt-0.9-1.3  '//cc(i), 1,0.9d0,1.3d0)
         call HwU_book(l+ 24,'CMS_tt_8TeV_ljets_Ytt-1.3-2.5  '//cc(i), 1,1.3d0,2.5d0)

c        ATLAS_CMS_tt_AC_8TeV
         call HwU_book(l+ 25,'ATLAS_CMS_tt_AC_8TeV_plus-0-420  '//cc(i), 1,0d0,420d0)
         call HwU_book(l+ 26,'ATLAS_CMS_tt_AC_8TeV_plus-420-500  '//cc(i), 1,420d0,500d0)
         call HwU_book(l+ 27,'ATLAS_CMS_tt_AC_8TeV_plus-500-600  '//cc(i), 1,500d0,600d0)
         call HwU_book(l+ 28,'ATLAS_CMS_tt_AC_8TeV_plus-600-750  '//cc(i), 1,600d0,750d0)
         call HwU_book(l+ 29,'ATLAS_CMS_tt_AC_8TeV_plus-750-900  '//cc(i), 1,750d0,900d0)
         call HwU_book(l+ 30,'ATLAS_CMS_tt_AC_8TeV_plus-900-inf  '//cc(i), 1,900d0,6000d0)

         call HwU_book(l+ 31,'ATLAS_CMS_tt_AC_8TeV_minus-0-420  '//cc(i), 1,0d0,420d0)
         call HwU_book(l+ 32,'ATLAS_CMS_tt_AC_8TeV_minus-420-500  '//cc(i), 1,420d0,500d0)
         call HwU_book(l+ 33,'ATLAS_CMS_tt_AC_8TeV_minus-500-600  '//cc(i), 1,500d0,600d0)
         call HwU_book(l+ 34,'ATLAS_CMS_tt_AC_8TeV_minus-600-750  '//cc(i), 1,600d0,750d0)
         call HwU_book(l+ 35,'ATLAS_CMS_tt_AC_8TeV_minus-750-900  '//cc(i), 1,750d0,900d0)
         call HwU_book(l+ 36,'ATLAS_CMS_tt_AC_8TeV_minus-900-inf  '//cc(i), 1,900d0,6000d0)

c     CMS_tt2D_8TeV_dilep
         call HwU_book(l+ 37,'mtt-340-400-absytt-0-0.35  '//cc(i), 1,0.5d0,1.5d0)
         call HwU_book(l+ 38,'mtt-340-400-absytt-0.35-0.75  '//cc(i), 1,0.5d0,1.5d0)
         call HwU_book(l+ 39,'mtt-340-400-absytt-0.75-1.15  '//cc(i), 1,0.5d0,1.5d0)
         call HwU_book(l+ 40,'mtt-340-400-absytt-1.15-2.5  '//cc(i), 1,0.5d0,1.5d0)
         call HwU_book(l+ 41,'mtt-400-500-absytt-0-0.35  '//cc(i), 1,0.5d0,1.5d0)
         call HwU_book(l+ 42,'mtt-400-500-absytt-0.35-0.75  '//cc(i), 1,0.5d0,1.5d0)
         call HwU_book(l+ 43,'mtt-400-500-absytt-0.75-1.15  '//cc(i), 1,0.5d0,1.5d0)
         call HwU_book(l+ 44,'mtt-400-500-absytt-1.15-2.5  '//cc(i), 1,0.5d0,1.5d0)
         call HwU_book(l+ 45,'mtt-500-650-absytt-0-0.35  '//cc(i), 1,0.5d0,1.5d0)
         call HwU_book(l+ 46,'mtt-500-650-absytt-0.35-0.75  '//cc(i), 1,0.5d0,1.5d0)
         call HwU_book(l+ 47,'mtt-500-650-absytt-0.75-1.15  '//cc(i), 1,0.5d0,1.5d0)
         call HwU_book(l+ 48,'mtt-500-650-absytt-1.15-2.5  '//cc(i), 1,0.5d0,1.5d0)
         call HwU_book(l+ 49,'mtt-650-1500-absytt-0-0.35  '//cc(i), 1,0.5d0,1.5d0)
         call HwU_book(l+ 50,'mtt-650-1500-absytt-0.35-0.75  '//cc(i), 1,0.5d0,1.5d0)
         call HwU_book(l+ 51,'mtt-650-1500-absytt-0.75-1.15  '//cc(i), 1,0.5d0,1.5d0)
         call HwU_book(l+ 52,'mtt-650-1500-absytt-1.15-2.5  '//cc(i), 1,0.5d0,1.5d0)

      enddo
      return
      end


cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine analysis_end(dummy)
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c This subroutine is called once at the end of the run. Here the
c histograms are written to disk. Note that this is done for each
c integration channel separately. There is an external script that will
c read the HwU data files in each of the integration channels and
c combines them by summing all the bins in a final single HwU data file
c to be put in the Events/run_XX directory, together with a gnuplot
c file to convert them to a postscript histogram file.
      implicit none
      double precision dummy
      call HwU_write_file
      return                
      end


cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine analysis_fill(p,istatus,ipdg,wgts,ibody)
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c This subroutine is called for each n-body and (n+1)-body configuration
c that passes the generation cuts. Here the histrograms are filled.
      implicit none
c This includes the 'nexternal' parameter that labels the number of
c particles in the (n+1)-body process
      include 'nexternal.inc'
c This is an array which is '-1' for initial state and '1' for final
c state particles
      integer istatus(nexternal)
c This is an array with (simplified) PDG codes for the particles. Note
c that channels that are combined (i.e. they have the same matrix
c elements) are given only 1 set of PDG codes. This means, e.g., that
c when using a 5-flavour scheme calculation (massless b quark), no
c b-tagging can be applied.
      integer iPDG(nexternal)
c The array of the momenta and masses of the initial and final state
c particles in the lab frame. The format is "E, px, py, pz, mass", while
c the second dimension loops over the particles in the process. Note
c that these are the (n+1)-body particles; for the n-body there is one
c momenta equal to all zero's (this is not necessarily the last particle
c in the list). If one uses IR-safe obserables only, there should be no
c difficulty in using this.
      double precision p(0:4,nexternal)
c The weight of the current phase-space point is wgts(1). If scale
c and/or PDF uncertainties are included through reweighting, the rest of
c the array contains the list of weights in the same order as described
c by the weigths_info strings in analysis_begin
      double precision wgts(*)
c The ibody variable is:
c     ibody=1 : (n+1)-body contribution
c     ibody=2 : n-body contribution (excluding the Born)
c     ibody=3 : Born contribution
c The histograms need to be filled for all these contribution to get the
c physics NLO results. (Note that the adaptive phase-space integration
c is optimized using the sum of the contributions, therefore plotting
c them separately might lead to larger than expected statistical
c fluctuations).
      integer ibody,i,l
c local variable
      double precision var
      double precision pttx(0:3),mtt,pt_t,pt_tx,pt_ttx,yt,ytx,yttx,dy,absyttx
      double precision getrapidity,dot
      external getrapidity,dot
      integer orders_tag_plot
      common /corderstagplot/ orders_tag_plot
c
c Fill the histograms here using a call to the HwU_fill()
c subroutine. The first argument is the histogram label, the second is
c the numerical value of the variable to plot for the current
c phase-space point and the final argument is the weight of the current
c phase-space point.

      do i=0,3
        pttx(i)=p(i,3)+p(i,4)
      enddo
      mtt    = dsqrt(dot(pttx, pttx))
      pt_t   = dsqrt(p(1,3)**2 + p(2,3)**2)
      pt_tx  = dsqrt(p(1,4)**2 + p(2,4)**2)
      pt_ttx = dsqrt((p(1,3)+p(1,4))**2 + (p(2,3)+p(2,4))**2)
      yt  = getrapidity(p(0,3), p(3,3))
      ytx = getrapidity(p(0,4), p(3,4))
      yttx= getrapidity(pttx(0), pttx(3))
      absyttx= abs(yttx)
      dy=abs(yt)-abs(ytx)
      var=1.d0

c always fill the total rate
       do i=1,1
        l=(i-1)*52
        if (mod(i,6).eq.1.and.orders_tag_plot.ne.400) cycle 
        if (mod(i,6).eq.2.and.orders_tag_plot.ne.202.and.orders_tag_plot.ne.402) cycle 
        if (mod(i,6).eq.3.and.orders_tag_plot.ne.4.and.orders_tag_plot.ne.404.and.orders_tag_plot.ne.204) cycle 
        if (mod(i,6).eq.4.and.(.not.(orders_tag_plot.eq.600.or.
     . orders_tag_plot.eq.400))) cycle 
        if (mod(i,6).eq.5.and.(.not.(orders_tag_plot.eq.402.or.
     .  orders_tag_plot.eq.202.or.orders_tag_plot.eq.602))) cycle
        if (mod(i,6).eq.0.and.(.not.(orders_tag_plot.eq.204.or.
     .  orders_tag_plot.eq.4.or.orders_tag_plot.eq.404.or.orders_tag_plot.eq.604))) cycle

         call HwU_fill(l+ 1,var, wgts)

         call HwU_fill(l+ 2,mtt,wgts)
         call HwU_fill(l+ 3,mtt,wgts)
         call HwU_fill(l+ 4,mtt,wgts)
         call HwU_fill(l+ 5,mtt,wgts)
         call HwU_fill(l+ 6,mtt,wgts)
         call HwU_fill(l+ 7,mtt,wgts)

         call HwU_fill(l+ 8,mtt,wgts)
         call HwU_fill(l+ 9,mtt,wgts)
         call HwU_fill(l+ 10,mtt,wgts)
         call HwU_fill(l+ 11,mtt,wgts)
         call HwU_fill(l+ 12,mtt,wgts)
         call HwU_fill(l+ 13,mtt,wgts)
         call HwU_fill(l+ 14,mtt,wgts)

         call HwU_fill(l+ 15,yttx,wgts)
         call HwU_fill(l+ 16,yttx,wgts)
         call HwU_fill(l+ 17,yttx,wgts)
         call HwU_fill(l+ 18,yttx,wgts)
         call HwU_fill(l+ 19,yttx,wgts)
         call HwU_fill(l+ 20,yttx,wgts)
         call HwU_fill(l+ 21,yttx,wgts)
         call HwU_fill(l+ 22,yttx,wgts)
         call HwU_fill(l+ 23,yttx,wgts)
         call HwU_fill(l+ 24,yttx,wgts)

         if (dy.gt.0d0) then
                   call HwU_fill(l+ 25,mtt,wgts)
                   call HwU_fill(l+ 26,mtt,wgts)
                   call HwU_fill(l+ 27,mtt,wgts)
                   call HwU_fill(l+ 28,mtt,wgts)
                   call HwU_fill(l+ 29,mtt,wgts)
                   call HwU_fill(l+ 30,mtt,wgts)
         endif
         
         if (dy.lt.0d0) then
                  call HwU_fill(l+ 31,mtt,wgts)
                  call HwU_fill(l+ 32,mtt,wgts)
                  call HwU_fill(l+ 33,mtt,wgts)
                  call HwU_fill(l+ 34,mtt,wgts)
                  call HwU_fill(l+ 35,mtt,wgts)
                  call HwU_fill(l+ 36,mtt,wgts)
         endif

         if (mtt.gt.340d0.and.mtt.le.400d0) then 
             if (absyttx.gt.0d0.and.absyttx.le.0.35) call HwU_fill(l+37,var,wgts)
             if (absyttx.gt.0.35.and.absyttx.le.0.75) call HwU_fill(l+38,var,wgts)
             if (absyttx.gt.0.75.and.absyttx.le.1.15) call HwU_fill(l+39,var,wgts)
             if (absyttx.gt.1.15.and.absyttx.le.2.5) call HwU_fill(l+40,var,wgts)
         endif

         if (mtt.gt.400d0.and.mtt.le.500d0) then 
             if (absyttx.gt.0d0.and.absyttx.le.0.35) call HwU_fill(l+41,var,wgts)
             if (absyttx.gt.0.35.and.absyttx.le.0.75) call HwU_fill(l+42,var,wgts)
             if (absyttx.gt.0.75.and.absyttx.le.1.15) call HwU_fill(l+43,var,wgts)
             if (absyttx.gt.1.15.and.absyttx.le.2.5) call HwU_fill(l+44,var,wgts)
         endif

         if (mtt.gt.500d0.and.mtt.le.650d0) then 
             if (absyttx.gt.0d0.and.absyttx.le.0.35) call HwU_fill(l+45,var,wgts)
             if (absyttx.gt.0.35.and.absyttx.le.0.75) call HwU_fill(l+46,var,wgts)
             if (absyttx.gt.0.75.and.absyttx.le.1.15) call HwU_fill(l+47,var,wgts)
             if (absyttx.gt.1.15.and.absyttx.le.2.5) call HwU_fill(l+48,var,wgts)
         endif

         if (mtt.gt.650d0.and.mtt.le.1500d0) then 
             if (absyttx.gt.0d0.and.absyttx.le.0.35) call HwU_fill(l+49,var,wgts)
             if (absyttx.gt.0.35.and.absyttx.le.0.75) call HwU_fill(l+50,var,wgts)
             if (absyttx.gt.0.75.and.absyttx.le.1.15) call HwU_fill(l+51,var,wgts)
             if (absyttx.gt.1.15.and.absyttx.le.2.5) call HwU_fill(l+52,var,wgts)
         endif

c only fill the total rate for the Born when ibody=3
c      if (ibody.eq.3) call HwU_fill(l+2,var,wgts)
      enddo
      return
      end

      function getrapidity(en,pl)
      implicit none
      real*8 getrapidity,en,pl,tiny,xplus,xminus,y
      parameter (tiny=1.d-8)
      xplus=en+pl
      xminus=en-pl
      if(xplus.gt.tiny.and.xminus.gt.tiny)then
         if( (xplus/xminus).gt.tiny.and.(xminus/xplus).gt.tiny)then
            y=0.5d0*log( xplus/xminus  )
         else
            y=sign(1.d0,pl)*1.d8
         endif
      else 
         y=sign(1.d0,pl)*1.d8
      endif
      getrapidity=y
      return
      end
