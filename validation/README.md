## Validation of Models


Below we present the validation of the distinct implementations of the SMS model:

 1. UV Simplified Model (SMS-stop): UV simplified model
 1. Top Couplings with Form Factors (Top-FormFactors):
    - OnShell: assumes on-shell tops (valid for $q + q \to \bar{t} + t$ production)
    - OneLoop: assumes off-shell tops for the $t-t-g$ vertex and the 1 loop calculation for the $t-t-g-g$ vertex with on-shell tops and gluons (valid for $g + g \to \bar{t} + t$ production)
  1. Top EFT physical (Top-EFTphysical): EFT matched model in the physical Basis.


### Top Pair Production: $q + q \to \bar{t} + t$


| Model     | Diagrams  |
|-----------|-----------|
| SMS-stop 1 loop | <img src="../mathematicaNBs/matching/SMS-stop-uutt-loop.png" width="300" height="150"> |
| FormFactors | <img src="../mathematicaNBs/matching/Top-FormFactors-uutt-loop.png" width="150" height="150"> |
| EFT | <img src="../mathematicaNBs/matching/Top-EFTphysical_simple-uutt-loop.png" width="300" height="150"> |

#### Results

All the results below take $y_{DM} =1$ and $m_{t} = 172$ GeV.

  | Term        | $m_{T}$ (GeV) | $m_{\chi}$ (GeV) | OneLoop (pb) | OnShell (pb) |   EFT (pb)  | NLO-MG5  (pb) |
  | ----------- | ------------- | ---------------- | ------- | ------- | ------ | --------- |
  |$\mathcal{M}^*_{\rm born} \mathcal{M}_1^{NP}$ |      400      |         100      |   $(1.756 \pm 0.009)\times10^{-2}$   |   $(1.756 \pm 0.009)\times10^{-2}$   |   $(1.101 \pm 0.006)\times10^{-2}$  | --- |
  |$\lvert \mathcal{M}_1^{NP} \rvert^2$ |     400      |         100     |   $(3.785 \pm 0.013)\times10^{-5}$   |   $(3.785 \pm 0.013)\times10^{-5}$   |   $(1.431 \pm 0.005)\times10^{-5}$  | $(3.800 \pm 0.006)\times10^{-5}$  |
  |  |  |  |  |   |   |  |
  |$\mathcal{M}^*_{\rm born} \mathcal{M}_1^{NP}$ |      5000      |         1000      |   $(9.156 \pm 0.05)\times10^{-5}$   |   $(9.156 \pm 0.05)\times10^{-5}$   |   $(9.212 \pm 0.01)\times10^{-5}$  | --- |
  |$\lvert \mathcal{M}_1^{NP} \rvert^2$ |     5000      |         1000     |   $(4.31 \pm 0.005)\times10^{-10}$   |   $(4.30 \pm 0.02)\times10^{-10}$   |   $(4.236 \pm 0.006)\times10^{-10}$  | $(4.326 \pm 0.012)\times10^{-10}$  |
  



### Top Pair Production: $g + g \to \bar{t} + t$


| Model     | Diagrams  |
|-----------|-----------|
| SMS-stop 1 loop | <img src="../mathematicaNBs/matching/SMS-stop-ggtt-loop.png" width="450" height="600"> |
| FormFactors | <img src="../mathematicaNBs/matching/Top-FormFactors-ggtt-loop.png" width="600" height="150"> |
| EFT | <img src="../mathematicaNBs/matching/Top-EFTphysical_simple-ggtt-loop.png" height="150"> |

#### Results

  All the results below take $y_{DM} =1$ and $m_{t} = 172$ GeV.

  | Term        | $m_{T}$ (GeV) | $m_{\chi}$ (GeV) | OneLoop (pb) | OnShell (pb) |   EFT (pb)  | NLO-MG5  (pb) |
  | ----------- | ------------- | ---------------- | ------- | ------- | ------ | --------- |
  |$\mathcal{M}^*_{\rm born} \mathcal{M}_1^{NP}$ |      400      |         100      |  $(-4.755 \pm 0.009)\times10^{-1}$   |   $(-0.372 \pm 0.008)\times10^{-1}$    |  $(-2.188 \pm 0.004)\times10^{-1}$   | --- |
  |$\lvert \mathcal{M}_1^{NP} \rvert^2$ |     400      |         100     |  $(33.91 \pm 0.007)\times10^{-5}$    |   $(131.4 \pm 0.4)\times10^{-5}$   |  $(6.005 \pm 0.01)\times10^{-5}$   | $(11.94 \pm 0.02)\times10^{-5}$  |
  |$\lvert \mathcal{M}_{\rm box}^{NP} \rvert^2$ |     400      |         100     |  $(18.41 \pm 0.002)\times10^{-5}$    |   $( 191.8 \pm 0.2)\times10^{-5}$   |  ---   | $(18.46 \pm 0.05)\times10^{-5}$  |
  |  |  |  |  |   |   |  |
  |$\mathcal{M}^*_{\rm born} \mathcal{M}_1^{NP}$ |      5000      |         4000      |  $(-13.31 \pm 4.7)\times10^{-4}$    | $(-8.257 \pm 0.02)\times10^{-4}$     |  $(-9.005 \pm 0.02)\times10^{-4}$   | --- |
  |$\lvert \mathcal{M}_1^{NP} \rvert^2$ |     5000      |         4000     |  $(34.56 \pm 0.1)\times10^{-10}$    |   $(49.12 \pm 0.1)\times10^{-10}$   | $(10.26 \pm 0.02)\times10^{-10}$  |  $(8.593 \pm 0.01)\times10^{-10}$  |
  |$\lvert \mathcal{M}_{\rm box}^{NP} \rvert^2$ |     5000      |         4000     |  $(16.66 \pm 0.05)\times10^{-10}$    |   $( \pm )\times10^{-10}$   |  ---   | $(20.83 \pm 0.03)\times10^{-10}$  |
  |  |  |  |  |   |   |  |
  |$\mathcal{M}^*_{\rm born} \mathcal{M}_1^{NP}$ |      10000      |         9000      |  $(3.457 \pm 0.9)\times10^{-4}$    | $(-1.911 \pm 0.004)\times10^{-4}$     |  $(-2.083 \pm 0.02)\times10^{-4}$   | --- |
  |$\lvert \mathcal{M}_1^{NP} \rvert^2$ |     10000      |         9000     |  $(22.69 \pm 5)\times10^{-11}$    |   $(25.95 \pm 0.05)\times10^{-10}$   | $(5.441 \pm 0.009)\times10^{-11}$  |  $(4.533 \pm 0.03)\times10^{-11}$  |
  |$\lvert \mathcal{M}_{\rm box}^{NP} \rvert^2$ |     10000      |         9000     |  $(9.593 \pm 1.3)\times10^{-11}$    |   $( \pm )\times10^{-11}$   |  ---   | $(11.48 \pm 0.02)\times10^{-11}$  |


  

