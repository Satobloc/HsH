# SANDBOX — Projector-gradient curvature from Householder metric

Status: speculative H(s)H geometry checkpoint; not canonical physics.

## Sources read
- SAT_THEORY_ARCHIVE_2023-25/Early Misc/4D_THINKING.txt — first 500 lines/full returned segment: old worldtube/time-as-active-interface discussion; retained only the structural idea that 4D matter is extended and that a time-like activation/flow variable may be geometric.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/002. Discreet Space and Dark Matter.txt — first 500 lines: early question whether dark-matter-like gravity could arise from properties of space rather than unseen matter; no empirical dark-matter fit imported.

## Independent construction
Let u be Euclidean unit and P=uu^T. Define induced Lorentzian metric
g = I - 2P.

Because P is sign-blind, u~ -u and the metric-level flow state lies in RP^3.

For a unit field,
Tr[(∂P)^2] = 2 |∂u|^2,
and
∂g = -2∂P,
so
||∂g||_F^2 = 8 |∂u|^2.
Thus gradients of the projective preferred-flow direction are directly metric gradients.

Exact fixture:
u(y)=(cos ky, sin ky,0,0).
Then
g_00=-cos 2ky,
g_11= cos 2ky,
g_01=-sin 2ky,
g_22=g_33=1.

A symbolic Christoffel/Ricci calculation gives
Ric = diag(0,0,2k^2,0)
in these coordinates and
R = 2 k^2.

Einstein tensor:
G =
[[ k^2 cos2ky,  k^2 sin2ky, 0, 0],
 [ k^2 sin2ky, -k^2 cos2ky, 0, 0],
 [ 0, 0, k^2, 0],
 [ 0, 0, 0,-k^2]].

Therefore constant metric eigenvalues do NOT imply flat geometry: spatial variation of the preferred-flow projector alone can create curvature.

## Sandbox inference
If SAT's Euclidean-primary Householder map is retained, H(s)H can separate:
1. amplitude/density-like variables,
2. projective flow orientation P,
3. gradients/covariant derivatives of P.

The third sector can source effective curvature without inserting an extra local mass-density variable by hand. This is geometry only, not a dark-matter model.

## Failure / discriminator
The lane fails physically if g=I-2uu^T is not the H(s)H metric map, or if allowed u-fields are constrained so strongly that such projector gradients cannot occur. It also fails as a dark-sector explanation unless derived profiles satisfy lensing, dynamics, cosmology, and conservation simultaneously.

Solver test: prescribe u(y), compute g, Christoffels, Ricci, and Einstein tensor independently; require R→2k^2 under mesh refinement and R→0 quadratically as k→0. Then solve the inverse problem: given a target weak curvature profile, ask whether a smooth unit/projective u-field can generate it without pathologies.
