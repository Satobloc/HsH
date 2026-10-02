# MERIDIAN SANDBOX — chiral SO(4) factorization as a compact H(s)H grammar
Date: 2026-10-01
Status: SILOED PLAYGROUND; not canonical theory.

## Fresh source intake
- SAT_THEORY_ARCHIVE_2023-25/HOLONOMY DRAFT.txt — read in full. Source fact used: old SAT explicitly promoted a non-trivial 3-cycle holonomy phase theta as a dynamical proxy, with a Chern–Simons/gravitational coupling. Its inflation phenomenology and historical numerical targets are NOT imported here.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/002 Forces Across Temporal Points - to 8-13-24.txt — read in full. Source fact used: an early filament/block-universe picture asks whether a localized encounter can alter an extended 4D filament; the contemporary-physics answer in that conversation correctly distinguishes global worldline shape from a literal force transmitted backward/forward in time.

## Independent construction
For a local SAT/UI rotation history R(lambda), define Omega = R^{-1} dR/dlambda in so(4). Use the Euclidean 4D Hodge star on bivectors:
Omega_+ = (Omega + *Omega)/2,
Omega_- = (Omega - *Omega)/2.
Then so(4) = su(2)_+ direct-sum su(2)_-, and [Omega_+,Omega_-]=0 identically.

Candidate compact H(s)H state:
C(lambda) = (eta, q_+, q_-, n_+, n_-),
eta=d ln r/dlambda,
q_± = ||Omega_±||,
with n_± unit axes inside the two commuting su(2) factors when q_± != 0.

This refines the previous (I,P) canonicalization:
I = q_+^2 + q_-^2 (normalization convention dependent),
P proportional to q_+^2 - q_-^2.
Thus the two principal SO(4) rates are equivalent to left/right chiral rotation content.

## New sandbox conjecture
Treat elementary Hagalaz as an update in ONE chiral SU(2) factor plus scale:
H_+ : (g_+,g_-,r) -> (h_+ g_+, g_-, e^sigma r)
H_- : (g_+,g_-,r) -> (g_+, h_- g_-, e^sigma r).

Opposite-chirality operations commute exactly:
[H_+,H_-]=0 in the pure rotation sector.
Same-chirality operations generally do not:
log(e^A e^B e^-A e^-B) = [A,B] + O(3), A,B in su(2)_+ (or both in su(2)_-).

Therefore a compact grammar can separate:
1. recursion-producing words = noncommuting updates within one chiral sector;
2. independently composable partner structure = the opposite chiral sector;
3. radial/finite-core readout = scale/tube variables.

This offers a precise replacement for the vague idea that an interaction at one time 'sends a force along the filament': the entire 4D worldtube is one geometric solution, while local encounters change boundary/holonomy data whose globally consistent solution is encoded by the ordered chiral word. No retrocausal signal is required.

## Scripted algebra check
Using explicit 4x4 antisymmetric generators J_ab and
S1=(J12+J34)/2, S2=(J13-J24)/2, S3=(J14+J23)/2,
A1=(J12-J34)/2, A2=(J13+J24)/2, A3=(J14-J23)/2,
a numerical matrix check gave max ||[S_i,A_j]||_F = 0 exactly at floating precision.
For Omega=0.7 J12+0.2 J34+0.3 J13:
||Omega_+||_F = 0.9486832981,
||Omega_-||_F = 0.5830951895,
||Omega||_F = 1.1135528726,
and sqrt(||Omega_+||^2+||Omega_-||^2)=||Omega||.

## Concrete discriminator / solver test
Build a word solver in the chiral basis. Generate equal-small-angle two-letter loops:
C_same(a,b)=e^(a S1)e^(b S2)e^(-a S1)e^(-b S2),
C_cross(a,b)=e^(a S1)e^(b A2)e^(-a S1)e^(-b A2).
Prediction of the grammar:
d(C_cross,1) = numerical zero for all a,b in the pure SO(4) model;
d(C_same,1) = K |ab| + O(3), with generated axis in the third same-chirality direction.
Then realize both words on the same finite-core tube and quotient global SO(4). Any surviving cross-sector effect measures coupling beyond the minimal grammar.

## Failure conditions
- If canonical H(s)H Hagalaz requires irreducible mixing of the + and - sectors at the rotation level, the one-sector elementary grammar is false.
- If physically distinct archive fixtures collapse to identical chiral histories even after adding scale and finite-core state, the grammar is incomplete.
- If opposite-sector words produce nonzero intrinsic effects after careful quotienting in a pure rotation implementation, either the solver is wrong or the assumed SO(4) representation is not the relevant one.

## Next calculation
Fit existing canonical helix/superhelix fixtures in the (q_+,q_-,n_+,n_-,eta) basis. Test whether recursion is predominantly same-sector axis precession while the partner sector behaves as an independently transported register. Do not tune to historical constants or particle labels.
