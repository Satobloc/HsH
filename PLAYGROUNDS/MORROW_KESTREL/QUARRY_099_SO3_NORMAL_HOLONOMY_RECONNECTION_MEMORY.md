# QUARRY 099 — SO(3) normal-holonomy memory at reconnection

Status: SILOED SANDBOX / Morrow + Kestrel. Nothing here is a canonical physical claim.

## Provenance
Old SAT read substantially: `SAT-TO-STANDARD 2.txt`, blob `f32cca74bbb174bb95319d92d354abb6f368e373`, lines 1–1400 requested/read. Retained framed-curve, connection/holonomy, Lk/Tw/Wr, braid and finite-width concepts; historical particle labels/numerics not used.

Current H(s)H read substantially: `ledgers/FINITE_CORE_COMPARISON.md`, blob `21d079942c9cb0a41be2d646b9ca6bfe4279527b`, complete file read. Used only its local finite-core hierarchy: rank-3 normal bundle for a curve in R4, B3 core/S2 boundary/B2 support, isotropic local rotation as gauge, and normal-bundle holonomy as a representation invariant. The file carries a quarantine banner, so its model-selection statements are not authority; the local standard geometry is independently checkable.

## Independent construction
For a closed or returnable finite-core history, normal transport defines H in SO(3). Under normal-frame gauge change G, H -> G H G^{-1}. Therefore the conjugacy-class angle

theta_H = arccos[(Tr H - 1)/2]

is gauge invariant. This supplies a 4D successor to scalar twist bookkeeping without pretending ordinary 3D self-linking survives unchanged.

At a reconnection/branch-composition event, two normal transports A and B need not commute. The order-memory residual is the group commutator

C = A B A^{-1} B^{-1}.

For small rotations A=exp(alpha n.J), B=exp(beta m.J), BCH gives

log C = alpha beta (n x m).J + O(3),

hence

theta_C ~= |alpha beta| sin(gamma),

where gamma is the angle between rotation axes. Equal rotations give theta_C ~= alpha^2 sin(gamma).

Numerical SO(3) checks:
alpha=.05, gamma=pi/6: exact .0012497396 vs BCH .00125.
alpha=.05, gamma=pi/2: exact .0024994794 vs BCH .0025.
alpha=.2, gamma=pi/3: exact .0345261287 vs BCH .0346410162.

## Audacious completion
A 4D finite worldtube can retain topological/dynamical memory through the conjugacy class of its normal holonomy even when centerline knot type is not absolutely protected. Reconnection can create a non-Abelian residue whenever branch-frame transports are non-collinear. This residue is zero for parallel axes or either zero rotation and changes quadratically for equal small rotations.

## Attack / failure
1. If the physical core is perfectly isotropic and unmarked everywhere, local frame rotation is gauge; only a genuine global return map or relational marking can make H observable.
2. If the normal connection is flat/trivial on all admissible histories, theta_H and theta_C vanish.
3. A trace angle loses axis/chirality information; a signed observable needs an external/director orientation or a richer conjugacy invariant.
4. If reconnection destroys rather than transports the normal connection, group composition is the wrong local law.

## Solver discriminator
Construct two encounters with identical centerlines, core radii, contact spans and scalar integrated rotation, but reverse the order of two non-collinear normal-frame rotations. Measure the outgoing global return holonomy. Prediction of this sandbox mechanism:

theta_comm ~ |alpha beta| sin(gamma)

at small angles, with exact zero for gamma=0. If the outgoing state is order-insensitive after legitimate gauge quotienting, reject the mechanism.

Carry-forward coordinate:
C = A B A^{-1} B^{-1},  theta_C = arccos[(Tr C - 1)/2].
