#-
#include generaldefs.h
#include /home/lessa/.local/lib/python3.10/site-packages/matchmakereft/core/procedures.h

#define NumParts "5"
#define NumDiags "0"
* max power of external momenta that we'll keep
#define Nmax "0"
* min inverse power of cutoff that is set to zero (equal to 3-maxdim)
#define LAMBDAINVERSEmax "-3"

v p1, ... , p`NumParts', pol1, ... , pol`NumParts';

#do i=1,`NumDiags';
 S diags'i';
#enddo;
.global;

*>>>>>>>>
#$counter = 0;
*<<<<<<<<

#if `NumDiags'

#do i=1,`NumDiags';
G expr'i'= diags'i';
#enddo
.sort

#include qLbar_uR_Phi_Phibar_Phibar.aux;


#include wcdimension.dat
id LAMBDA^`LAMBDAINVERSEmax' = 0;


#call doall(`NumParts',setlightmasses,`isnotEFT',`LoopOrder')

id LAMBDA = 1;
id LAMBDA^-1 = 1;
.sort

.store

G  amplqLbaruRPhiPhibarPhibar=expr1+...+expr`NumDiags';

#else
G amplqLbaruRPhiPhibarPhibar=0;

#endif

.sort


#call collectterms


#write <qLbar_uR_Phi_Phibar_Phibar.out> "%X"
print +f;

.end