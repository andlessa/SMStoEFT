#-
#include generaldefs.h
#include /home/lessa/.local/lib/python3.10/site-packages/matchmakereft/core/procedures.h

#define NumParts "2"
#define NumDiags "0"
* max power of external momenta that we'll keep
#define Nmax "3"
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

#include dRbar_dR.aux;


#include wcdimension.dat
id LAMBDA^`LAMBDAINVERSEmax' = 0;


#call doall(`NumParts',setlightmasses,`isnotEFT',`LoopOrder')

id LAMBDA = 1;
id LAMBDA^-1 = 1;
.sort

.store

G  ampldRbardR=expr1+...+expr`NumDiags';

#else
G ampldRbardR=0;

#endif

.sort


#call collectterms


#write <dRbar_dR.out> "%X"
print +f;

.end