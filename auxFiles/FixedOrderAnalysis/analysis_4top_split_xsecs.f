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
      character*6 cc(4)
      data cc/'LOQCD ','NLOQCD','NLONP2','NLONP4'/
c Initialize the histogramming package (HwU). Pass the number of
c weights and the information on the weights:
      call HwU_inithist(nwgt,weights_info)
c declare (i.e. book) the histograms
      do i=1,4
         call HwU_book(i,'total cross-section  '//cc(i), 1,0.5d0,1.5d0)
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
      integer orders_tag_plot
      common /corderstagplot/ orders_tag_plot
c
c Fill the histograms here using a call to the HwU_fill()
c subroutine. The first argument is the histogram label, the second is
c the numerical value of the variable to plot for the current
c phase-space point and the final argument is the weight of the current
c phase-space point.

       var = 1d0

c SMS-stop_NLO-UFO model: (NP+QCD*100+QED*10000)
c LO:     QCD^2 = 8 -> orders_tag_plot = 800
c NLOQCD: QCD^2 = 10 -> orders_tag_plot = 1000
c NLONP2: QCD^2 = 8, NP^2 = 2 -> orders_tag_plot = 802
c NLONP4: QCD^2 = 6, NP^2 = 4 -> orders_tag_plot = 604

c SM_NLO-UFO model: (QCD+QED*100)
c LO:     QCD^2 = 8 -> orders_tag_plot = 8
c NLOQCD: QCD^2 = 10 -> orders_tag_plot = 10

       do i=1,4
c First decide on the model based on the value of orders_tag_plot
c orders_tag_plot < 100 -> SM_NLO, otherwise SMS-stop_NLO
         if (orders_tag_plot.lt.100) then
             if (i.eq.1.and.orders_tag_plot.ne.8) cycle
             if (i.eq.2.and.orders_tag_plot.ne.10) cycle
             if (i.eq.3) cycle
             if (i.eq.4) cycle
         else
             if (i.eq.1.and.orders_tag_plot.ne.800) cycle
             if (i.eq.2.and.orders_tag_plot.ne.1000) cycle
             if (i.eq.3.and.orders_tag_plot.ne.802) cycle
             if (i.eq.4.and.orders_tag_plot.ne.604) cycle
         endif
         call HwU_fill(i,var, wgts)
      enddo
      return
      end


