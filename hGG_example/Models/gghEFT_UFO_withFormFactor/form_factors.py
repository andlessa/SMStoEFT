from object_library import all_form_factors, FormFactor

from function_library import complexconjugate



GGHFF = FormFactor(name = 'GGHFF',
                 type = 'real',
                 value = '((3./2.)*(4.*MT**2/MH**2)*(1. + (1.-4.*MT**2/MH**2)*(ASIN(MH/(2*MT))**2)))')
