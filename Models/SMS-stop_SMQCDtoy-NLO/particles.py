# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 12.1.0 for Linux x86 (64-bit) (March 18, 2020)
# Date: Tue 16 May 2023 14:12:33


from __future__ import division
from object_library import all_particles, Particle
import parameters as Param

import propagators as Prop

g = Particle(pdg_code = 21,
             name = 'g',
             antiname = 'g',
             spin = 3,
             color = 8,
             mass = Param.ZERO,
             width = Param.ZERO,
             texname = 'g',
             antitexname = 'g',
             charge = 0,
             GhostNumber = 0)

ghG = Particle(pdg_code = 82,
               name = 'ghG',
               antiname = 'ghG~',
               spin = -1,
               color = 8,
               mass = Param.ZERO,
               width = Param.ZERO,
               texname = 'ghG',
               antitexname = 'ghG~',
               charge = 0,
               GhostNumber = 1)

ghG__tilde__ = ghG.anti()

u = Particle(pdg_code = 2,
             name = 'u',
             antiname = 'u~',
             spin = 2,
             color = 3,
             mass = Param.MU,
             width = Param.ZERO,
             texname = 'u',
             antitexname = 'u~',
             charge = 2/3,
             GhostNumber = 0)

u__tilde__ = u.anti()

t = Particle(pdg_code = 6,
             name = 't',
             antiname = 't~',
             spin = 2,
             color = 3,
             mass = Param.MT,
             width = Param.WT,
             texname = 't',
             antitexname = 't~',
             charge = 2/3,
             GhostNumber = 0)

t__tilde__ = t.anti()

P__tilde__chi = Particle(pdg_code = 5000012,
                         name = '~chi',
                         antiname = '~chi',
                         spin = 2,
                         color = 1,
                         mass = Param.mChi,
                         width = Param.wChi,
                         texname = '~chi',
                         antitexname = '~chi',
                         charge = 0,
                         GhostNumber = 0)

P__tilde__ST = Particle(pdg_code = 5000002,
                        name = '~ST',
                        antiname = '~ST~',
                        spin = 1,
                        color = 3,
                        mass = Param.mST,
                        width = Param.wST,
                        texname = '~ST',
                        antitexname = '~ST~',
                        charge = 2/3,
                        GhostNumber = 0)

P__tilde__ST__tilde__ = P__tilde__ST.anti()

