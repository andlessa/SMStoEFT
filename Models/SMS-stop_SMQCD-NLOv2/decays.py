# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 12.1.0 for Linux x86 (64-bit) (March 18, 2020)
# Date: Fri 23 Jun 2023 17:23:51


from object_library import all_decays, Decay
import particles as P


Decay_P__tilde__ST = Decay(name = 'Decay_P__tilde__ST',
                           particle = P.P__tilde__ST,
                           partial_widths = {(P.t,P.P__tilde__chi):'((-3*mChi**2*yDM**2 + 3*mST**2*yDM**2 - 3*MT**2*yDM**2)*cmath.sqrt(mChi**4 - 2*mChi**2*mST**2 + mST**4 - 2*mChi**2*MT**2 - 2*mST**2*MT**2 + MT**4))/(48.*cmath.pi*abs(mST)**3)'})

Decay_P__tilde__chi = Decay(name = 'Decay_P__tilde__chi',
                            particle = P.P__tilde__chi,
                            partial_widths = {(P.P__tilde__ST__tilde__,P.t):'((3*mChi**2*yDM**2 - 3*mST**2*yDM**2 + 3*MT**2*yDM**2)*cmath.sqrt(mChi**4 - 2*mChi**2*mST**2 + mST**4 - 2*mChi**2*MT**2 - 2*mST**2*MT**2 + MT**4))/(32.*cmath.pi*abs(mChi)**3)',
                                              (P.P__tilde__ST,P.t__tilde__):'((3*mChi**2*yDM**2 - 3*mST**2*yDM**2 + 3*MT**2*yDM**2)*cmath.sqrt(mChi**4 - 2*mChi**2*mST**2 + mST**4 - 2*mChi**2*MT**2 - 2*mST**2*MT**2 + MT**4))/(32.*cmath.pi*abs(mChi)**3)'})

Decay_t = Decay(name = 'Decay_t',
                particle = P.t,
                partial_widths = {(P.P__tilde__ST,P.P__tilde__chi):'((3*mChi**2*yDM**2 - 3*mST**2*yDM**2 + 3*MT**2*yDM**2)*cmath.sqrt(mChi**4 - 2*mChi**2*mST**2 + mST**4 - 2*mChi**2*MT**2 - 2*mST**2*MT**2 + MT**4))/(96.*cmath.pi*abs(MT)**3)'})

