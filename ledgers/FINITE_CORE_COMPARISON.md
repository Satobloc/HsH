> **QUARANTINED — 2026-09-13:** Nathan halted this integration lane after identifying a category failure in its assessment process. This generated artifact is preserved only as history and must not control theory, predictions, papers, or future work. See [quarantine manifest](../QUARANTINE/2026-09-13_INTEGRATION_HALT/README.md).

# Finite-Core Representation Comparison Ledger

Status: **active discrimination ledger**. This compares model representations; it does not identify a physical object.

## Current Kerr-reference status

Ravel's 2026-09-12 direct check-in reopens every specific near-core/carrier assignment in `KERR_CORE_BASELINE.md`. The file mixed standard Kerr/Kerr-Newman/QNM research with forward H(s)H construction and is therefore provisionally quarantined pending dependency audit.

Keep three levels separate:

1. Nathan's active intended target: a Kerr/ER-type finite worldtube (`SRC/ACTIVE` as project direction);
2. standard Kerr/Kerr-Newman identities and coordinate anatomy (`STD/DERIVED` only in their standard domains);
3. the electron-scale assignment, surviving near-core shell, deformable carrier, and H(s)H coupling (`SAT/CANDIDATE`; package currently `QUARANTINED`).

`a = hbar/(2 m_e c)` algebraically fixes the listed diameter, circumference, circuit time, Zitterbewegung-frequency expression, and Compton-period relation once chosen. Those identities do not independently select `B^3`, `B^2`, `S^2`, a material director, or a resolver kernel. Ordinary subextremal horizon/ergosphere anatomy may not survive in the electron-like over-extreme regime; the proposed survival table is required before assigning layers.

**Comparison change:** Kerr/ER is now treated as a reference/anatomy overlay to be mapped onto the carrier ledger, not as an additional carrier type and not as evidence that the layered candidate is already realized.

## Frozen mathematical baseline FC-BASE-001

Let `gamma: I -> M^4` be a smooth embedded center history with rank-three normal bundle `N gamma`. For sufficiently small radius `epsilon`, a smooth tubular neighborhood has disk fiber `B^3`:

`T_epsilon(gamma) = { exp_gamma(s)(v) : v in N_s gamma, ||v|| <= epsilon }`.

Its boundary has fiber `S^2`. Therefore:

- full normal core: base `I` plus fiber `B^3`, total dimension 4;
- core boundary: base `I` plus fiber `S^2`, total dimension 3;
- rank-two material support: a selected disk subbundle `E subset N gamma` with fiber `B^2`, total dimension 3;
- boundary of that support: fiber `S^1`, total dimension 2.

For a three-dimensional resolving hypersurface `Sigma` transverse to the history, the local readouts are generically:

- `T_epsilon(gamma) intersect Sigma`: a filled three-dimensional `B^3`-type region;
- `partial T_epsilon(gamma) intersect Sigma`: a two-dimensional `S^2`-type surface;
- `E intersect Sigma`: a two-dimensional `B^2`-type support.

A finite-thickness resolving slab thickens the readout operation. Its thickness is not automatically the material-core radius.

**Status:** `STD/DERIVED/FROZEN` for smooth local tubular-neighborhood dimension bookkeeping, conditional on embeddedness, small radius, and transversality. It does not freeze topology, dynamics, Kerr/ER identity, material support, or readout physics.

## Frozen cross-section discriminator FC-BASE-002

For a measured fiber with centroid `c`, covariance `Q`, and normalized
trace-free shape tensor

`S = Q/tr(Q) - I/3`,

the quantities `I2 = tr(S^2)`, `I3 = det(S)`, and
`chi = E[||y||^4] / E[||y||^2]^2` are invariant under simultaneous normal-frame
rotation. For the canonical uniform fibers:

| Fiber | `(I2,I3,chi)` |
|---|---|
| `B^3` bulk | `(0,0,25/21)` |
| `S^2` boundary | `(0,0,1)` |
| `B^2` support | `(1/6,-1/108,4/3)` |
| `S^1` support boundary | `(1/6,-1/108,1)` |

Thus covariance alone is degenerate between `B^3/S^2` and `B^2/S^1`;
the fourth radial moment separates these canonical uniform pairs. The tuple is
not a complete shape invariant.

At a transverse linear crossing, the normal-fiber readout

`L_Sigma(y) = y - T (n_Sigma·y)/(n_Sigma·T)`

has `|det L_Sigma| = |n_Sigma·T|^-1`. It maps a full rank-three core to a
three-dimensional sheet patch; rank-two support and a boundary carrier give
two-dimensional support. Tangency requires higher-order intersection geometry.

**Gauge-null consequence for ᚼ:** rotating an isotropic, unmarked `B^3` fiber
changes no local moment. Observable local `ᚼ` therefore requires anisotropy,
material or boundary marking, an external relational direction, or a global
return map. This is a constraint on every carrier candidate, not carrier
selection.

**Status:** canonical moment values, invariance, linear transverse map, and
isotropic gauge-null result `STD/DERIVED/FROZEN` in their stated local model.
The curved-sheet remainder, constitutive dynamics, physical observable map, and
particle interpretation remain `OPEN`.

## Frozen finite-thickness baseline FC-BASE-003

Let `Y` be a centered carrier-fiber coordinate, `L_Sigma` the transverse linear map from FC-BASE-002, and `Z` an independent centered finite-thickness/reconstruction kernel in sheet coordinates. For

`X = L_Sigma Y + Z`,

the observed covariance is

`Q_X = L_Sigma Q_Y L_Sigma^T + Q_Z`.

Thus second moments alone do not identify projected core width separately from resolver width. Given only `Q_X`, every positive-semidefinite `A <= Q_X` yields an algebraic decomposition `L_Sigma Q_Y L_Sigma^T = A`, `Q_Z = Q_X - A`. In the isotropic scalar reduction,

`sigma_obs^2 = sigma_core,proj^2 + sigma_resolver^2`.

Independent cumulants add before normalization, so the canonical fourth-moment ratio `chi` in FC-BASE-002 is not generally preserved by finite-thickness convolution. It remains exact for the declared unblurred fibers and usable in a negligible-kernel limit or after a proved deconvolution.

**Status:** covariance composition and second-moment non-identifiability `STD/DERIVED/FROZEN` under affine, centered, independent finite-moment assumptions. Kernel calibration, correlated carrier-resolver coupling, nonlinear reconstruction, curved sheets, tangency, and finite-thickness recovery of `chi` remain `OPEN`. Source packet: `WORKSPACES/WORLDTUBE_LAB/FINITE_THICKNESS_READOUT_PACKET_001.md`.

## Frozen controlled-thickness baseline FC-BASE-004

If the centered resolver kernel is a known scale family `Z_delta = delta Z_1`, then

`Q_obs(delta) = Q_0 + delta^2 Q_K`,

where `Q_0 = L_Sigma Q_core L_Sigma^T`. Each covariance component and `tr(Q_obs)` must therefore be affine in `delta^2`; the zero-thickness intercept recovers the projected carrier covariance within this model. Non-affinity rejects the scaled independent-kernel/linear-readout assumptions, not automatically the carrier.

**Status:** affine scaling and intercept result `STD/DERIVED/FROZEN` conditional on the FC-BASE-003 assumptions and a controlled centered scale family. Physical availability and calibration of `delta` remain `OPEN`.

## Frozen transport-compatibility baseline FC-BASE-005

For a local constant-radius circular helix in an orthogonal Euclidean decomposition,

`U = wdot e_w + R omega e_perp`

and

`||U||^2 = wdot^2 + (R omega)^2`.

Thus, if `||U||=c`, then `R omega=sqrt(c^2-wdot^2)`; imposing `wdot=c` as well forces `R omega=0`. Axial propagation and transverse winding are not independent after fixing total speed.

**Status:** `STD/DERIVED/FROZEN` only for the declared constant-radius, orthogonal, Euclidean local ansatz. It does not select a carrier or establish that H(s)H uses total Euclidean speed `c`. Variable radius, nesting, nonorthogonal frames, phase velocity, and Lorentzian/null parametrizations require separate norm relations. Source packet: [FIXED_SPEED_HELIX_COMPATIBILITY_001.md](../WORKSPACES/WORLDTUBE_LAB/FIXED_SPEED_HELIX_COMPATIBILITY_001.md).

## Candidate comparison

| Candidate/view | Literal object and minimum data | ᚼ / ᚼᚼ requirement | Perturbations and residuals | Readout and limiting map | Topology/nesting support | Hidden freedom / freeze condition |
|---|---|---|---|---|---|---|
| Full `B^3` normal core | Radius/profile on the rank-three normal bundle; metric; connection or transported frame | A scalar ᚼ is insufficient until a rotation axis or one-parameter subgroup in `SO(3)` is fixed. ᚼᚼ also needs a radial/expansion variable and composition law. | Three principal radial strains, shear, frame holonomy, centerline curvature/torsion | Transverse slice gives filled `B^3`; `epsilon -> 0` gives the centerline | Can contain lower-rank supports and boundary modes; global knot/link data require the embedding | Isotropy can hide director data. Freeze only after frame, constitutive law, contact rule, and readout map are fixed. |
| `B^2` material support/subbundle | Oriented rank-two plane field `E_s subset N_s gamma`, disk scale/profile, and its transport | ᚼ may rotate/tilt the chosen plane relative to a transported reference; one scalar works only for a declared one-parameter motion. ᚼᚼ couples that motion to disk expansion. | Plane tilt, in-plane anisotropy, shear, twist, loss of orientability | Transverse readout is generically a `B^2` patch; collapse of disk scale gives centerline | Can carry ribbon/string-link framing and open-link data more directly than an unframed centerline | Choice of plane field is extra structure, not forced by the centerline. Freeze when the selector and transport law are derived. |
| `S^2` boundary carrier | Boundary of a `B^3` core, or a primitive sphere bundle; orientation and surface constitutive data | General boundary rotation is `SO(3)`; ᚼ is one angle only after axis/reference selection. ᚼᚼ couples the selected rotation with radius/area expansion. | Shape modes, tangential flow, normal displacement, curvature anisotropy | Transverse readout is an `S^2`-type surface. A boundary-only model does not specify interior response. | Supports surface fields and contact geometry; open-Brunnian structure still needs embedded strands/supports | Primitive boundary and derived boundary are inequivalent until an interior extension theorem/dynamics is supplied. |
| Finite resolving-intersection thickness | A resolver `Sigma`, thickness `delta`, kernel/weight, relative orientation, and intersection rule | ᚼ may be a measured slice angle; it is not automatically the bulk inductive angle. ᚼᚼ also mixes resolver expansion unless deconvolved. | Slice tilt, kernel width, temporal/spatial averaging, clipping, reconstruction residual | Readout of another object, not automatically a carrier. Thin limit is `delta -> 0`. | Can preserve or erase topology depending on kernel and sampling | Bulk/readout non-identifiability. Freeze only with an explicit forward operator and stated invertibility class. |
| Layered object | Inclusion chain such as `E subset T_epsilon`, `partial T_epsilon`, plus a resolver map | Each layer needs its own typed operator or a proved shared action; equal symbols do not establish equivalence | Cross-layer coupling and residual transfer must be explicit | Requires inclusion maps and `R_{Sigma,delta}`; centerline limit must commute with readout if claimed | Best candidate for carrying bulk, support, boundary, and observed views together | Most expressive and most underdetermined. Freeze only after eliminating unused layers and proving compatibility diagrams. |

## Representation invariants currently available

- fiber rank and total dimension;
- boundary relation `partial B^3 = S^2`;
- codimension under transverse intersection;
- centerline limit `epsilon -> 0`, when well defined;
- orientability and normal-bundle holonomy, once specified.

These survive smooth coordinate changes. Radius values, a chosen support plane, a displayed slice shape, and a single scalar angle generally do not.

## Earliest open dependency

Choose whether the model's material degrees of freedom occupy the full rank-three normal core or a selected rank-two support, and specify or calibrate the resolver kernel. Without those choices, ᚼ cannot be typed beyond “inductive angle,” contact cannot be defined, and bulk deformation/width cannot be separated from resolver artifacts.
