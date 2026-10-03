# SANDBOX — SO(4)/Lorentz compatibility gate for Hagalaz

Status: Meridian sandbox; noncanonical.

## Sources read
- SAT_THEORY_ARCHIVE_2023-25/PHONE_DUMP_23SEP26/1.SEP04 to 1.JAN.05.txt, lines 900–1800. This old-notebook tranche is predominantly creative/life material and supplied no usable SAT geometry; it was not forced into the derivation.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/10-20-25 FULL THEORY.txt, lines 1200–1500, especially the SAT_O 2.0 tetrad construction g_{mu nu}=eta_{IJ} E^I_mu E^J_nu with eta=diag(-1,1,1,1), plus the foliation/strain block.

## Independent result
If Hagalaz uses six ordinary SO(4) plane rotations in a Euclidean carrier space, they cannot all simultaneously be interpreted as internal tetrad gauge rotations of a Lorentzian metric. Spatial rotations R_ij (i,j=1,2,3) satisfy R^T eta R=eta, but ordinary circular time-space rotations R_0i(theta) do not. For the 01 plane,

g' = R_01(theta)^T eta R_01(theta)

has 2x2 block
[[-cos(2theta), sin(2theta)],
 [ sin(2theta), cos(2theta)]],

while retaining eigenvalues (-1,+1) and determinant -1. Thus the signature is preserved but the metric components change relative to the fixed tetrad/coframe interpretation.

By contrast, a Lorentz boost B_01(rapidity) obeys B^T eta B=eta and is hyperbolic, not an SO(4) circular rotation.

## Consequence
The six-plane Hagalaz compass needs a type gate:
1. SO(4) rotations are legitimate ambient/carrier geometry if H(s)H begins in Euclidean R4 and induces Lorentzian readout separately.
2. If a channel is interpreted directly as tetrad gauge, only the SO(3) spatial subgroup overlaps ordinary circular rotations; the three time-space channels must be converted to Lorentz boosts or treated as physical metric-changing deformations.
3. Therefore an SO(4) 01 rotation must never be silently identified with a Lorentz boost.

A compact compatibility scalar is
C_eta(A)=||A^T eta + eta A||_F.
For Lorentz-algebra generators C_eta=0. For an ordinary Euclidean time-space generator J_0i, C_eta>0; for spatial J_ij, C_eta=0.

## Tight solver test
For every local Hagalaz generator A, report both its Euclidean antisymmetry residual ||A^T+A|| and Lorentz compatibility C_eta. Classify channels as ambient rotation, Lorentz gauge, or metric-active. Then verify that any claimed spacetime-gauge operation satisfies C_eta -> 0 under mesh refinement.

## Failure condition
If the current H(s)H construction explicitly defines its SO(4) carrier rotations as pre-metric ambient operations and derives the Lorentzian metric only afterward, there is no contradiction; this result becomes a bookkeeping gate rather than a rejection. If instead the same six circular rotations are being used as local Lorentz/tetrad gauge transformations, the formulation is inconsistent until the time-space channels are retyped.
