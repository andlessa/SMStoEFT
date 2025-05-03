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
      character*6 cc(6)
      data cc/'LO NP0','LO NP2','LO NP4','NLONP0','NLONP2','NLONP4'/
c Initialize the histogramming package (HwU). Pass the number of
c weights and the information on the weights:
      call HwU_inithist(nwgt,weights_info)
c declare (i.e. book) the histograms
      do i=1,6
        l=(i-1)*104

         call HwU_book(l+ 1,'total rate  '//cc(i), 1,0.5d0,1.5d0)

c        CMS_tt_13TeV_ljets_2015_Mtt
         call HwU_book(l+ 2,'CMS_ljets_2015_mtt-300-375  '//cc(i), 1,300d0,375d0)
         call HwU_book(l+ 3,'CMS_ljets_2015_mtt-375-450  '//cc(i), 1,375d0,450d0)
         call HwU_book(l+ 4,'CMS_ljets_2015_mtt-450-530  '//cc(i), 1,450d0,530d0)
         call HwU_book(l+ 5,'CMS_ljets_2015_mtt-530-625  '//cc(i), 1,530d0,625d0)
         call HwU_book(l+ 6,'CMS_ljets_2015_mtt-625-740  '//cc(i), 1,625d0,740d0)
         call HwU_book(l+ 7,'CMS_ljets_2015_mtt-740-850  '//cc(i), 1,740d0,850d0)
         call HwU_book(l+ 8,'CMS_ljets_2015_mtt-850-1100  '//cc(i), 1,850d0,1100d0)
         call HwU_book(l+ 9,'CMS_ljets_2015_mtt-1100-2000  '//cc(i), 1,1100d0,2000d0)

c        CMS_tt_13TeV_dilep_2015_Mtt
         call HwU_book(l+ 10,'CMS_dilep_2015_mtt-340-380  '//cc(i), 1,340d0,380d0)
         call HwU_book(l+ 11,'CMS_dilep_2015_mtt-380-470  '//cc(i), 1,380d0,470d0)
         call HwU_book(l+ 12,'CMS_dilep_2015_mtt-470-620  '//cc(i), 1,470d0,620d0)
         call HwU_book(l+ 13,'CMS_dilep_2015_mtt-620-820  '//cc(i), 1,620d0,820d0)
         call HwU_book(l+ 14,'CMS_dilep_2015_mtt-820-1100  '//cc(i), 1,820d0,1100d0)
         call HwU_book(l+ 15,'CMS_dilep_2015_mtt-1100-1600  '//cc(i), 1,1100d0,1600d0)

c        CMS_tt_13TeV_ljets_2016_Mtt
         call HwU_book(l+ 16,'CMS_ljets_2016_mtt-300-360  '//cc(i), 1,300d0,360d0)
         call HwU_book(l+ 17,'CMS_ljets_2016_mtt-360-430  '//cc(i), 1,360d0,430d0)
         call HwU_book(l+ 18,'CMS_ljets_2016_mtt-430-500  '//cc(i), 1,430d0,500d0)
         call HwU_book(l+ 19,'CMS_ljets_2016_mtt-500-580  '//cc(i), 1,500d0,580d0)
         call HwU_book(l+ 20,'CMS_ljets_2016_mtt-580-680  '//cc(i), 1,580d0,680d0)
         call HwU_book(l+ 21,'CMS_ljets_2016_mtt-680-800  '//cc(i), 1,680d0,800d0)
         call HwU_book(l+ 22,'CMS_ljets_2016_mtt-800-1000  '//cc(i), 1,800d0,1000d0)
         call HwU_book(l+ 23,'CMS_ljets_2016_mtt-1000-1200  '//cc(i), 1,1000d0,1200d0)
         call HwU_book(l+ 24,'CMS_ljets_2016_mtt-1200-1500  '//cc(i), 1,1200d0,1500d0)
         call HwU_book(l+ 25,'CMS_ljets_2016_mtt-1500-2000  '//cc(i), 1,1500d0,2000d0)

c        CMS_tt_13TeV_dilep_2016_Mtt
         call HwU_book(l+ 26,'CMS_dilep_2016_mtt-300-380  '//cc(i), 1,300d0,380d0)
         call HwU_book(l+ 27,'CMS_dilep_2016_mtt-380-470  '//cc(i), 1,380d0,470d0)
         call HwU_book(l+ 28,'CMS_dilep_2016_mtt-470-620  '//cc(i), 1,470d0,620d0)
         call HwU_book(l+ 29,'CMS_dilep_2016_mtt-620-820  '//cc(i), 1,620d0,820d0)
         call HwU_book(l+ 30,'CMS_dilep_2016_mtt-820-1100  '//cc(i), 1,820d0,1100d0)
         call HwU_book(l+ 31,'CMS_dilep_2016_mtt-1100-1500  '//cc(i), 1,1100d0,1500d0)
         call HwU_book(l+ 32,'CMS_dilep_2016_mtt-1500-2500  '//cc(i), 1,1500d0,2500d0)

c        ATLAS_tt_13TeV_ljets_2016_Mtt
         call HwU_book(l+ 33,'ATLAS_ljets_2016_mtt-300-380  '//cc(i), 1,300d0,380d0)
         call HwU_book(l+ 34,'ATLAS_ljets_2016_mtt-380-470  '//cc(i), 1,380d0,470d0)
         call HwU_book(l+ 35,'ATLAS_ljets_2016_mtt-470-620  '//cc(i), 1,470d0,620d0)
         call HwU_book(l+ 36,'ATLAS_ljets_2016_mtt-620-820  '//cc(i), 1,620d0,820d0)
         call HwU_book(l+ 37,'ATLAS_ljets_2016_mtt-820-1100  '//cc(i), 1,820d0,1100d0)
         call HwU_book(l+ 38,'ATLAS_ljets_2016_mtt-1100-1500  '//cc(i), 1,1100d0,1500d0)
         call HwU_book(l+ 39,'ATLAS_ljets_2016_mtt-1500-2500  '//cc(i), 1,1500d0,2500d0)
         call HwU_book(l+ 40,'ignore-ATLAS_ljets_2016_mtt-1500-2500  '//cc(i), 1,1500d0,2500d0)
         call HwU_book(l+ 41,'ignore-ATLAS_ljets_2016_mtt-1500-2500  '//cc(i), 1,1500d0,2500d0)

c        CMS_tt_13TeV_2021_Mtt
         call HwU_book(l+ 42,'CMS_2021_mtt-250-400  '//cc(i), 1,250d0,400d0)
         call HwU_book(l+ 43,'CMS_2021_mtt-400-480  '//cc(i), 1,400d0,480d0)
         call HwU_book(l+ 44,'CMS_2021_mtt-480-560  '//cc(i), 1,480d0,560d0)
         call HwU_book(l+ 45,'CMS_2021_mtt-560-640  '//cc(i), 1,560d0,640d0)
         call HwU_book(l+ 46,'CMS_2021_mtt-640-720  '//cc(i), 1,640d0,720d0)
         call HwU_book(l+ 47,'CMS_2021_mtt-720-800  '//cc(i), 1,720d0,800d0)
         call HwU_book(l+ 48,'CMS_2021_mtt-800-900  '//cc(i), 1,800d0,900d0)
         call HwU_book(l+ 49,'CMS_2021_mtt-900-1000  '//cc(i), 1,900d0,1000d0)
         call HwU_book(l+ 50,'CMS_2021_mtt-1000-1150  '//cc(i), 1,1000d0,1150d0)
         call HwU_book(l+ 51,'CMS_2021_mtt-1150-1300  '//cc(i), 1,1150d0,1300d0)
         call HwU_book(l+ 52,'CMS_2021_mtt-1300-1500  '//cc(i), 1,1300d0,1500d0)
         call HwU_book(l+ 53,'CMS_2021_mtt-1500-1700  '//cc(i), 1,1500d0,1700d0)
         call HwU_book(l+ 54,'CMS_2021_mtt-1700-2000  '//cc(i), 1,1700d0,2000d0)
         call HwU_book(l+ 55,'CMS_2021_mtt-2000-2300  '//cc(i), 1,2000d0,2300d0)
         call HwU_book(l+ 56,'CMS_2021_mtt-2300-3500  '//cc(i), 1,2300d0,3500d0)

c        ATLAS_tt_AC_13TeV
         call HwU_book(l+ 57,'ATLAS_AC_plus-0-500  '//cc(i), 1,0d0,500d0)
         call HwU_book(l+ 58,'ATLAS_AC_plus-500-750  '//cc(i), 1,500d0,750d0)
         call HwU_book(l+ 59,'ATLAS_AC_plus-750-1000  '//cc(i), 1,750d0,1000d0)
         call HwU_book(l+ 60,'ATLAS_AC_plus-1000-1500  '//cc(i), 1,1000d0,1500d0)
         call HwU_book(l+ 61,'ATLAS_AC_plus-1500-inf  '//cc(i), 1,1500d0,6000d0)

         call HwU_book(l+ 62,'ATLAS_AC_minus-0-500  '//cc(i), 1,0d0,500d0)
         call HwU_book(l+ 63,'ATLAS_AC_minus-500-750  '//cc(i), 1,500d0,750d0)
         call HwU_book(l+ 64,'ATLAS_AC_minus-750-1000  '//cc(i), 1,750d0,1000d0)
         call HwU_book(l+ 65,'ATLAS_AC_minus-1000-1500  '//cc(i), 1,1000d0,1500d0)
         call HwU_book(l+ 66,'ATLAS_AC_minus-1500-inf  '//cc(i), 1,1500d0,6000d0)

c        CMS_tt_AC_13TeV
         call HwU_book(l+ 67,'CMS_AC_plus-0-750  '//cc(i), 1,0d0,750d0)
         call HwU_book(l+ 68,'CMS_AC_plus-750-900  '//cc(i), 1,750d0,900d0)
         call HwU_book(l+ 69,'CMS_AC_plus-900-inf  '//cc(i), 1,750d0,6000d0)

         call HwU_book(l+ 70,'CMS_AC_minus-0-750  '//cc(i), 1,0d0,750d0)
         call HwU_book(l+ 71,'CMS_AC_minus-750-900  '//cc(i), 1,750d0,900d0)
         call HwU_book(l+ 72,'CMS_AC_minus-900-inf  '//cc(i), 1,750d0,6000d0)

c        HLLHC_tt_13TeV_Mtt
         call HwU_book(l+ 73,'HLLHC_mtt-250-400  '//cc(i), 1,250d0,400d0)
         call HwU_book(l+ 74,'HLLHC_mtt-400-480  '//cc(i), 1,400d0,480d0)
         call HwU_book(l+ 75,'HLLHC_mtt-480-560  '//cc(i), 1,480d0,560d0)
         call HwU_book(l+ 76,'HLLHC_mtt-560-640  '//cc(i), 1,560d0,640d0)
         call HwU_book(l+ 77,'HLLHC_mtt-640-720  '//cc(i), 1,640d0,720d0)
         call HwU_book(l+ 78,'HLLHC_mtt-720-800  '//cc(i), 1,720d0,800d0)
         call HwU_book(l+ 79,'HLLHC_mtt-800-900  '//cc(i), 1,800d0,900d0)
         call HwU_book(l+ 80,'HLLHC_mtt-900-1000  '//cc(i), 1,900d0,1000d0)
         call HwU_book(l+ 81,'HLLHC_mtt-1000-1150  '//cc(i), 1,1000d0,1150d0)
         call HwU_book(l+ 82,'HLLHC_mtt-1150-1300  '//cc(i), 1,1150d0,1300d0)
         call HwU_book(l+ 83,'HLLHC_mtt-1300-1500  '//cc(i), 1,1300d0,1500d0)
         call HwU_book(l+ 84,'HLLHC_mtt-1500-1700  '//cc(i), 1,1500d0,1700d0)
         call HwU_book(l+ 85,'HLLHC_mtt-1700-2000  '//cc(i), 1,1700d0,2000d0)
         call HwU_book(l+ 86,'HLLHC_mtt-2000-2300  '//cc(i), 1,2000d0,2300d0)
         call HwU_book(l+ 87,'HLLHC_mtt-2300-2600  '//cc(i), 1,2300d0,2600d0)
         call HwU_book(l+ 88,'HLLHC_mtt-2600-3000  '//cc(i), 1,2600d0,3000d0)
         call HwU_book(l+ 89,'HLLHC_mtt-3000-3500  '//cc(i), 1,3000d0,3500d0)
         call HwU_book(l+ 90,'HLLHC_mtt-3500-4000  '//cc(i), 1,3500d0,4000d0)

c        HLLHC_tt_AC_13TeV
         call HwU_book(l+ 91,'HLLHC_AC_plus-0-500  '//cc(i), 1,0d0,500d0)
         call HwU_book(l+ 92,'HLLHC_AC_plus-500-750  '//cc(i), 1,500d0,750d0)
         call HwU_book(l+ 93,'HLLHC_AC_plus-750-1000  '//cc(i), 1,750d0,1000d0)
         call HwU_book(l+ 94,'HLLHC_AC_plus-1000-1500  '//cc(i), 1,1000d0,1500d0)
         call HwU_book(l+ 95,'HLLHC_AC_plus-1500-2000  '//cc(i), 1,1500d0,2000d0)
         call HwU_book(l+ 96,'HLLHC_AC_plus-2000-2500  '//cc(i), 1,2000d0,2500d0)
         call HwU_book(l+ 97,'HLLHC_AC_plus-2500-3000  '//cc(i), 1,2500d0,3000d0)

         call HwU_book(l+ 98,'HLLHC_AC_minus-0-500  '//cc(i), 1,0d0,500d0)
         call HwU_book(l+ 99,'HLLHC_AC_minus-500-750  '//cc(i), 1,500d0,750d0)
         call HwU_book(l+ 100,'HLLHC_AC_minus-750-1000  '//cc(i), 1,750d0,1000d0)
         call HwU_book(l+ 101,'HLLHC_AC_minus-1000-1500  '//cc(i), 1,1000d0,1500d0)
         call HwU_book(l+ 102,'HLLHC_AC_minus-1500-2000  '//cc(i), 1,1500d0,2000d0)
         call HwU_book(l+ 103,'HLLHC_AC_minus-2000-2500  '//cc(i), 1,2000d0,2500d0)
         call HwU_book(l+ 104,'HLLHC_AC_minus-2500-3000  '//cc(i), 1,2500d0,3000d0)

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
      double precision pttx(0:3),mtt,pt_t,pt_tx,pt_ttx,yt,ytx,yttx,dy
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
      dy=abs(yt)-abs(ytx)
      var=1.d0

c always fill the total rate
       do i=1,6
        l=(i-1)*104
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
         call HwU_fill(l+ 15,mtt,wgts)

         call HwU_fill(l+ 16,mtt,wgts)
         call HwU_fill(l+ 17,mtt,wgts)
         call HwU_fill(l+ 18,mtt,wgts)
         call HwU_fill(l+ 19,mtt,wgts)
         call HwU_fill(l+ 20,mtt,wgts)
         call HwU_fill(l+ 21,mtt,wgts)
         call HwU_fill(l+ 22,mtt,wgts)
         call HwU_fill(l+ 23,mtt,wgts)
         call HwU_fill(l+ 24,mtt,wgts)
         call HwU_fill(l+ 25,mtt,wgts)

         call HwU_fill(l+ 26,mtt,wgts)
         call HwU_fill(l+ 27,mtt,wgts)
         call HwU_fill(l+ 28,mtt,wgts)
         call HwU_fill(l+ 29,mtt,wgts)
         call HwU_fill(l+ 30,mtt,wgts)
         call HwU_fill(l+ 31,mtt,wgts)
         call HwU_fill(l+ 32,mtt,wgts)

         call HwU_fill(l+ 33,mtt,wgts)
         call HwU_fill(l+ 34,mtt,wgts)
         call HwU_fill(l+ 35,mtt,wgts)
         call HwU_fill(l+ 36,mtt,wgts)
         call HwU_fill(l+ 37,mtt,wgts)
         call HwU_fill(l+ 38,mtt,wgts)
         call HwU_fill(l+ 39,mtt,wgts)
         call HwU_fill(l+ 40,mtt,wgts)
         call HwU_fill(l+ 41,mtt,wgts)

         call HwU_fill(l+ 42,mtt,wgts)
         call HwU_fill(l+ 43,mtt,wgts)
         call HwU_fill(l+ 44,mtt,wgts)
         call HwU_fill(l+ 45,mtt,wgts)
         call HwU_fill(l+ 46,mtt,wgts)
         call HwU_fill(l+ 47,mtt,wgts)
         call HwU_fill(l+ 48,mtt,wgts)
         call HwU_fill(l+ 49,mtt,wgts)
         call HwU_fill(l+ 50,mtt,wgts)
         call HwU_fill(l+ 51,mtt,wgts)
         call HwU_fill(l+ 52,mtt,wgts)
         call HwU_fill(l+ 53,mtt,wgts)
         call HwU_fill(l+ 54,mtt,wgts)
         call HwU_fill(l+ 55,mtt,wgts)
         call HwU_fill(l+ 56,mtt,wgts)

         call HwU_fill(l+ 73,mtt,wgts)
         call HwU_fill(l+ 74,mtt,wgts)
         call HwU_fill(l+ 75,mtt,wgts)
         call HwU_fill(l+ 76,mtt,wgts)
         call HwU_fill(l+ 77,mtt,wgts)
         call HwU_fill(l+ 78,mtt,wgts)
         call HwU_fill(l+ 79,mtt,wgts)
         call HwU_fill(l+ 80,mtt,wgts)
         call HwU_fill(l+ 81,mtt,wgts)
         call HwU_fill(l+ 82,mtt,wgts)
         call HwU_fill(l+ 83,mtt,wgts)
         call HwU_fill(l+ 84,mtt,wgts)
         call HwU_fill(l+ 85,mtt,wgts)
         call HwU_fill(l+ 86,mtt,wgts)
         call HwU_fill(l+ 87,mtt,wgts)
         call HwU_fill(l+ 88,mtt,wgts)
         call HwU_fill(l+ 89,mtt,wgts)
         call HwU_fill(l+ 90,mtt,wgts)

         if (dy.gt.0d0) then
                   call HwU_fill(l+ 57,mtt,wgts)
                   call HwU_fill(l+ 58,mtt,wgts)
                   call HwU_fill(l+ 59,mtt,wgts)
                   call HwU_fill(l+ 60,mtt,wgts)
                   call HwU_fill(l+ 61,mtt,wgts)

                   call HwU_fill(l+ 67,mtt,wgts)
                   call HwU_fill(l+ 68,mtt,wgts)
                   call HwU_fill(l+ 69,mtt,wgts)

                   call HwU_fill(l+ 91,mtt,wgts)
                   call HwU_fill(l+ 92,mtt,wgts)
                   call HwU_fill(l+ 93,mtt,wgts)
                   call HwU_fill(l+ 94,mtt,wgts)
                   call HwU_fill(l+ 95,mtt,wgts)
                   call HwU_fill(l+ 96,mtt,wgts)
                   call HwU_fill(l+ 97,mtt,wgts)
         endif
         
         if (dy.lt.0d0) then
                   call HwU_fill(l+ 62,mtt,wgts)
                   call HwU_fill(l+ 63,mtt,wgts)
                   call HwU_fill(l+ 64,mtt,wgts)
                   call HwU_fill(l+ 65,mtt,wgts)
                   call HwU_fill(l+ 66,mtt,wgts)

                   call HwU_fill(l+ 70,mtt,wgts)
                   call HwU_fill(l+ 71,mtt,wgts)
                   call HwU_fill(l+ 72,mtt,wgts)

                   call HwU_fill(l+ 98,mtt,wgts)
                   call HwU_fill(l+ 99,mtt,wgts)
                   call HwU_fill(l+ 100,mtt,wgts)
                   call HwU_fill(l+ 101,mtt,wgts)
                   call HwU_fill(l+ 102,mtt,wgts)
                   call HwU_fill(l+ 103,mtt,wgts)
                   call HwU_fill(l+ 104,mtt,wgts)
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
