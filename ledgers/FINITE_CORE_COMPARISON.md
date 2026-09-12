# Finite-Core Representation Comparison Ledger

Status: **active discrimination ledger**. This compares model representations; it does not identify a physical object.

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

## Candidate comparison

| Candidate/view | Literal object and minimum data | ᚼ / ᚼᚼ requirement | Perturbations and residuals | Readout and limiting map | Topology/nesting support | Hidden freedom / freeze condition |
|---|---|---|---|---|---|---|
| Full `B^3` normal core | Radius/profile on the rank-three normal bundle; metric; connection or transported frame | A scalar ᚼ is insufficient until a rotation axis or one-parameter subgroup in `SO(3)` is fixed. ᚼᚼ also needs a radial/expansion variable and composition law. | Three principal radial strains, shear, frame holonomy, centerline curvature/torsion | Transverse slice gives filled `B^3`; `epsilon -> 0` gives the centerline | Can contain lower-rank supports and boundary modes; global knot/link data require the embedding | Isotropy can hide director data. Freeze only after frame, constitutive law, contact rule, and readout map are fixed. |
| `B^2` material support/subbundle | Oriented rank-two plane field `E_s subset N_s gamma`, disk scale/profile, and its transport | ᚼ may rotate/tilt the chosen plane relative to a transported reference; one scalar works only for a declared one-parameter motion. ᚼᚼ couples that motion to disk expansion. | Plane tilt, in-plane anisotropy, shear, twist, loss of orientability | Transverse readout is generically a `B^2` patch; collapse of disk scale gives centerline | Can carry ribbon/string-link framing and open-link data more directly than an unframed centerline | Choice of plane field is extra structure, not forced by the centerline. Freeze when the selector and transport law are derived. |
| `S^2` boundary carrier | Boundary of a `B^3` core, or a primitive sphere bundle; orientation and surface constitutive data | General boundary rotation is `SO(3)); ᚼ is one angle only after axis/reference selection. ᚼᚼ couples the selected rotation with radius/area expansion. | Shape modes, tangential flow, normal displacement, curvature anisotropy | Transverse readout is an `S^2`-type surface. A boundary-only model does not specify interior response. | Supports surface fields and contact geometry; open-Brunnian structure still needs embedded strands/supports | Primitive boundary and derived boundary are inequivalent until an interior extension theorem/dynamics is supplied. |
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

Choose whether the model's material degrees of freedom occupy the full rank-three normal core or a selected rank-two support. Without that choice, ᚼ cannot be typed beyond “inductive angle,” contact cannot be defined, and bulk deformation cannot be separated from resolver artifacts.
