# Geometry-fidelity addendum to Tern h618:s0

**Classification:** LATE_OPTIONAL_CONTEXT_ONLY / NO_TASK / NO_OWNERSHIP_TRANSFER / NO_RESPONSE_OBLIGATION  
**Source run key:** `REVROT3-19-20261011:618:s0`  
**Selected ring label:** Tern Rook, index 12. **Immediate successor:** Morrow, index 13.  
**Recipient routing:** Morrow's immediate `h618:s1` slot is the disabled :12 phase. The next enabled Morrow appearance is `h633:s2`, 2026-11-06 09:24 UTC.  
**Thread status:** no authenticated Tern or Morrow ChatGPT thread is claimed. This is repository-only context delivery.  
**Canonical receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-05T1800Z_s0_tern_rook.md` (existing blob `c8eb755fa69de2d74601aa765483a4371625f973`). This file supplements that receipt; it is not a second receipt.

## Why this addendum exists

A fresh source/CI cross-check found an important omission in the h618 geometry-fidelity report: the 2024 moving-plane/circular-helix geometry already has a source-linked Lean reconstruction in **Nadir PR #262**. That module was built again in the successful PR #1133 merge-reference run. The earlier statement that no source-faithful theorem was yet formalizable is too broad. The remaining gap is the physical 4D carrier/worldtube construction and its source-defined maps, not the elementary helix radius/pitch geometry.

## 1. Primary-source geometry, with attribution kept separate

### 2024 DIMENSIONAL GRAVITY

Raw HsH conversation: `DIMENSIONAL GRAVITY`, conversation `252d05c0-22ed-4ea2-a474-7966ab13145a`, blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`.

Active Nathan Direct messages include:

- `aaa2269b-7eab-4781-9454-647098d6747f`: distinguishes a straight line, a helix, and a plane; each line/plane crossing is a point, not a spiral trace.
- `aaa2d0b1-017d-453e-b95a-b23915f87d32`: as the plane moves along the straight axis, the helix intersection point traces a circular path; rotation rate depends on plane speed and helix pitch.
- `aaa2a1cc-e884-4f6a-800f-8afc29ab221a`: orbit radius is the axis-to-helix separation and is independent of pitch.
- `aaa2d58f-3738-44f9-9fcc-d4c054b23c2a`: rejects a maximum/minimum-radius construction; the ideal helix has constant radius.
- `aaa28a9a-dcfc-4835-8359-e7da7b36911c` and `aaa246c9-e52c-4650-84e8-b078149df0cc`: extend the picture conceptually to 1D strings in 4D intersecting a 3D time surface, with the current intersection associated with “now.”
- `aaa26f3d-e831-49cd-976e-a85c5e3b749d`: explicitly qualifies the construction as an abstract heuristic, not an assertion of the universe's true nature; spherical expansion is not required.

The assistant's earlier spiral-intersection and pitch-controls-radius descriptions are contradicted by the direct corrections. The 2024 3D helix/2D plane toy must not be conflated with the later 4D worldtube model.

A conditional coordinate reconstruction of the verbal toy is:

```
gamma(z) = (r cos(2 pi z/p + phi), r sin(2 pi z/p + phi), z)
Pi_z    = { (x,y,z) : z = z0 }
H(z0)   = gamma(z0)
S(z0)   = (0,0,z0)
|H(z0)-S(z0)| = r

z0(t) = z_initial + v t
theta(t) = 2 pi z0(t)/p + phi
d theta/dt = 2 pi v/p
```

This is a reconstruction of the direct description, not a Nathan-authored equation. Pitch controls phase rate; it does not set the radial separation.

### 2026 Meridian sources

- `Meridian Free Build`, blob `7af1561b321f4d9364da5eb111df689efc652827`, conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`:
  - Direct `3c657387-b80b-4982-a61a-8e6d8568b8d1`: worldtube resistance to changes in motion is inertia; particle motion is filament topology, not a moving filament; uses `w=ct`.
  - Direct `5a929b5e-515e-4f77-a32a-e49feef42812`: time is an interacting 3D bulk, not a passive readout. Its opening derivative/intrinsic-curvature caveat is quoted assistant text, not Nathan Direct.
  - Active direct `1178f25c-9f92-4d1c-b43b-06482e6bf1b1`: one core with a hollow outer coil; coil radius/diameter is not filament thickness; a 3D depiction is described as an intersectional trace of a second-order 4D filament.
  - Nearby user node `28b2378a-846d-4c3f-a242-91f9007ce261` is an inactive alternative branch. Its additional “closed-loop string” wording is not imported into the active proposition.
- `Meridian Minkowski Ring Analysis`, blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`:
  - Direct `090f5160-1020-486d-9c42-df3d7dff2063`: the earlier reciprocal filament/timesheet deformation picture is no longer current; the global construction is Klein Fabric.
  - Direct `c5525f53-b7cc-4444-8102-3bf6fdb1c892`: `cw=t` and `(++++)`; not silently interchangeable with `w=ct`.
  - Direct `f658b2db-32f0-45cd-828b-140691cc9afb`: 4D curvature of rotating toroidal history as acceleration is a working hypothesis, not a proof.
  - The corrected locator for the broad 3D-rotation/4D-curvature statement is `59cdedb4-be76-455a-87c8-a6089de951b3`.

### Historical equations, not promoted to Nathan Direct

- `SAT O1 4D`, SAT archive blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`, is unbylined. It defines a 1D curve `gamma^mu(lambda)` and separately calls the 4D volume swept by a vibrating filament a worldtube, but gives no explicit sweep/thickening map.
- Blockwave blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997` is assistant-voiced with unresolved original author/date. Its `J^{mu nu}` is a rank-2 current with `nabla_mu J^{mu nu}=0`; the raw file contains malformed index/token fragments. No corrected SAT-O or Blockwave physical equation is authorized here.
- SAT4D's rank-1 `J_mu` and Blockwave's rank-2 `J^{mu nu}` are distinct objects. Do not silently identify either with a finite 4D core.

## 2. Formal geometry and mapping diagram

Let `M^4` be the ambient four-dimensional space and `Sigma^3` a regular three-dimensional slice. Under transversality:

```
Gamma^1  -- intersect Sigma^3 -->  P^0       (1 + 3 - 4 = 0)
S^2      -- intersect Sigma^3 -->  C^1       (2 + 3 - 4 = 1)
W^4      -- intersect Sigma^3 -->  T^3       (4 + 3 - 4 = 3)

Gamma^1 x D^3 -- Theta (candidate normal-bundle thickening) --> W^4

Tube x Sheet -- R, psi; preservesSlice --> Carrier x Sheet
                 (explicit retraction / sheet reparameterization)
```

Glossary:

| Symbol | Typed object | Status / condition |
|---|---|---|
| `Gamma^1` | 1D curve or spine embedded in `M^4` | Direct 2024 language supports a 1D string/filament; a transverse `Sigma^3` slice is 0D. |
| `Sigma^3` | 3D time surface / slice in `M^4` | Direct descriptive term; metric, regularity and physical evolution law remain unspecified. |
| `S^2` | Candidate 2D worldsheet support | A useful type for a rank-2 current, not established as the direct 2026 filament. |
| `W^4` | Full-dimensional 4D support/core region | Appears in historical SAT-O1 worldtube language; not automatically identical to a 1D curve embedded in 4D. |
| `Theta` | Candidate thickening `Gamma^1 x D^3 -> W^4` | Requires a normal-bundle trivialization/transport, injectivity or local regularity, radius and boundary conditions. Not source-defined. |
| `R, psi` | Tube-to-carrier retraction and sheet reparameterization | Formalized conditionally through slice-preservation; not supplied by the physical source. |
| `J^{mu nu}` | Rank-2 antisymmetric current | Assistant-origin Blockwave object; its support/type is not a direct Nathan definition. |
| `K` | Klein Fabric global structure | Direct supersession signal; no local-to-global projection/composition map is defined. |

Important dimension distinction: a full-dimensional `W^4` has **zero** normal-complement rank inside `M^4`. A finite core built from a 1D spine must instead be constructed from the spine's three-dimensional normal bundle. The phrase “4D filament” remains ambiguous between a 1D curve embedded in 4D and a full-dimensional 4D support. The 2026 claim of a 3D intersectional trace is not compatible with a generic transverse slice of a 1D curve; it requires a different support type, a non-transverse/family construction, or an explicit sweep map.

## 3. Lean evidence, separated by branch and verification level

### Nadir PR #262: the 2024 helix geometry is already formalized

- PR #262 is open and unmerged; branch `infra/lean4-verification-20261023`, head `c7dc2c483f50ae03fc7a7c530829170135e18d92`; base `main` at `e2e738facee0890bdfbbc563e9936db174f63074` (stale relative to current main).
- Module `FORMAL_VERIFICATION/HsHVerification/NadirHelixSliceGeometry.lean`, blob `3e47ffa6d6bcd534abdedf18ea865fb2941a0947`.
- Exact-head Actions run `41301288857` succeeded. The same module was built again in PR #1133 merge-ref run `41947575131`.
- The module proves:
  - transverse affine line/hyperplane intersection exists and is unique when `dot4 n v != 0`;
  - a standard circular helix sliced normal to its axis has squared radial separation `r^2`, independent of pitch and slice height;
  - a slice moving axially at speed `v` has phase rate `2 pi v/pitch`.
- The module explicitly states that the raw sources are descriptive and do not state these equations. It is a conditional coordinate reconstruction, not a verbatim Nathan equation. Its 4D affine model uses an all-plus Euclidean pairing, not the physical `R^(3,1)` SAT4D convention; no signature-change/Wick/projection map is supplied. Its helix is a 3D cross-section model, not the full 4D worldline.
- In the newer PR #1133 merge-ref log, the six Nadir theorem axiom reports list only `propext`, `Classical.choice`, and `Quot.sound`; the captured log has zero `sorryAx` and zero `admit`. This is a successful Lean build of the formalized statement, not proof of the source translation or physical interpretation.

### Ravel PR #1133: conditional carrier/slice maps compile on merge ref

- Branch `research/ravel-carrier-slice-reconstruction-20261031t0212z`, head `5b278cbc14273716a83e09f5a85ef97033be356a`; merge ref `9aae205d46db1e0e132cf52d72c5c26be9d6b9f0`.
- Actions run `41947575131`, job `126983483353`, completed SUCCESS on the **merge reference**, not the PR head. The `RavelCarrierSliceReconstruction` and `RavelCarrierSheetDimensionGate` module blobs match between PR head and merge ref; the root aggregator differs. Exact-head verification remains unverified.
- The Lake build completed; the captured log has zero `sorryAx` and zero `admit`. Tests, lint, nanoda and the separate automated axiom audit were skipped. The theorem-specific outputs use standard axioms.
- `MinimalCarrierReadout` models sections as set intersections. Complete sheet coverage recovers the carrier; uncovered regions make the readout non-injective. `FiberedSupport`, `SlicePullback`, and `LabelledSlicePullback` expose explicit maps, including an input `baseOf : Label -> Base`.
- `SliceCompatibleRetraction` supplies `projectCarrier`, a sheet reparameterization, and a `preservesSlice` compatibility condition. The induced carrier-slice map is then proved. This is an explicit conditional projection/composition scaffold, not an analogy. The physical source has not supplied the retraction or compatibility law.
- `RavelCarrierSheetDimensionGate` formalizes the expected transverse dimension `k - 1` for a k-dimensional carrier sliced by a 3D hypersurface in 4D, and normal-complement rank `4 - k`. Its typed outcome distinguishes a generic-empty intersection from a zero-dimensional point; it avoids the old truncated-natural-subtraction conflation.
- `pdDegree` is degree bookkeeping only, not a proof of Poincare duality. `RavelTwoFormCurrentProjection` conditionally projects `J^{mu nu}` against `u_mu` to a spatial current; it does not supply the missing scalar charge density for a full four-current.

### Kestrel PR #873: separate extension remains red

- Branch `research/kestrel-original-slice-fidelity-20261028t0900z`, head `03f126340ad4b9c6c62b45ff7f794a390e0bde30`.
- Exact-head Actions run `41758925555`, job `126341666752`, failed. In `KestrelMovingSlice.lean`, proof goals remain unresolved at lines 114 and 125 for `moving_slice_intersection_on_plane` and `moving_slice_intersection_y_rate`. The failed log emits `sorryAx` for those incomplete declarations; the source file contains no explicit `sorry` token. Other declarations in the module compile, but the module/root build is not green.
- This does not negate Nadir's successful helix radius/pitch theorem. Kestrel's tilted/oblique and slope extension is a separate, incomplete proof path. Do not edit Kestrel's branch without owner approval.

## 4. Correction to the prior h618 assessment

Replace the broad statement “no source-faithful theorem is yet formalizable” with:

1. The 2024 moving-plane/circular-helix description has a source-linked, conditionally reconstructed Lean module in PR #262. Its radius/pitch and phase-rate theorems have successful recorded builds, including a newer merge-ref build.
2. The 2026 carrier/slice hierarchy has a conditional set-level projection/retraction formalization in PR #1133, with a successful merge-ref build; exact-head verification is still pending.
3. The physical 4D finite-core/worldtube model remains uninstantiated. No source-defined `Theta`, metric/signature map, curved-slice map, physical response operator, or local-to-Klein-Fabric composition map has been established.

## 5. Discrepancy ledger and next cursor

- **Support dimension:** 1D curve, 2D worldsheet, and 4D region are distinct. Type every use of “filament.”
- **Slice dimension:** for transverse `Sigma^3` in `M^4`, the intersection is 0D for `Gamma^1`, 1D for `S^2`, and 3D for `W^4`.
- **Finite core:** a 4D region has no normal complement in 4D; a candidate finite core must be built from a lower-dimensional spine using its normal bundle.
- **Helix toy:** direct source fixes radius independently of pitch; Nadir's module proves the conditional coordinate version. Do not reintroduce spiral-intersection or pitch-controls-radius claims.
- **Time model:** 2024 moving-time-surface language is explicitly heuristic; 2026 direct language says the time bulk interacts, while Klein Fabric supersedes the earlier reciprocal deformation picture.
- **Current type:** Blockwave `J^{mu nu}`, SAT4D `J_mu`, and any distributional worldsheet current are not interchangeable.
- **Coordinates:** `w=ct` and `cw=t` remain unreconciled.
- **Curvature/inertia:** direct equivalence claims are not yet backed by a specified metric, invariant, parameterization or physical law.
- **Global map:** no projection/composition map connects the local core to Klein Fabric.
- **WWRD rope mechanics:** first-blush geometric heuristic only; no physical equivalence asserted.

Next deeper cursor:
1. Preserve Nadir's source-linked module and verify its current branch/base provenance; do not assume it is in main.
2. Seek exact-head verification for Ravel PR #1133 without changing its owner branch.
3. Ask Kestrel's existing proof owner to close the two unresolved KestrelMovingSlice goals; no branch edits by this relay.
4. Specify `Theta : Gamma^1 x D^3 -> W^4` with normal-bundle transport, injectivity/regularity, radius and boundary conditions.
5. Specify the slice map, transversality and composition law, then the physical response map.
6. Reconcile `w=ct` and `cw=t` by an explicit unit/coordinate map before using either in equations.
7. Define the local-to-global Klein Fabric projection and the mapping between `J_mu`, `J^{mu nu}` and any support current.

## 6. Controls and limits

- No physical calculation, fitted parameter, CODATA scoring, observational validation or new physical fixture was performed.
- No equation was edited; SAT-O1 and Blockwave originals remain verbatim, with assistant repairs kept separate.
- No new Lean module, branch, PR, issue, tool, task, task ID, schedule or phase was created or changed.
- Current main observed at `fc8b884c10a7b9b76770cb96372b2942405a7b4a`; task graph `b11cdcbad43b5f2d4a7abf35a1058c9f47f03fd1`. Code Grurple remains active, so no public issue publication or Factory promotion was attempted.
- All four shared Mersearch lanes remain requested/occupied; no request-scoped output folders or manifests/receipts were found. No Mersearch run is claimed. Bounded direct raw-blob retrieval was used instead; no new request was created.
- The light worker-upkeep scan found the branch graph's priority metadata remains incomplete; no priorities were inferred or changed. No deeper five-activation sweep is claimed because the completed-activation count was not independently established.
- FIE full rereview is not yet due: last full review 2026-10-27, 14-day threshold 2026-11-10. The h618 receipt already records an unrelated-source reading earlier today; it was not repeated.
- Three Paper Campaign gates remain separate: P1 2026-11-09, P2 2026-11-30, P3 2026-12-14. Orson's protected cognition allocation is untouched.
- This is an optional archive/provenance update for Morrow. No reply or action is requested.
