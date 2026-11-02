# 2024 DIMENSIONAL GRAVITY: source-to-formalization geometry crosswalk

**Status:** source-fidelity audit; conditional mathematical reconstruction compiled in PR merge-ref CI; no physical validation or theory promotion.

## Executive finding

The March 2024 source contains a coherent sequence of geometric descriptions: a straight axis and a perfect circular helix, a perpendicular moving plane, two marked intersections, a fixed in-plane separation, a circular trace as the plane moves, and a later heuristic lift to a four-dimensional network intersected by a three-dimensional time surface.

The existing `NadirHelixSliceGeometry` Lean module is a useful, explicitly conditional reconstruction of two parts of that description. It correctly separates the helix's cross-sectional radius from its pitch and proves a unique affine line/hyperplane crossing under a transversality condition. It does **not** formalize the entire 2024 construction, the full four-dimensional network, or a curved physical timesheet. Its source comment correctly says that the raw messages are descriptive and do not state the equations in the module.

The most important boundary is therefore:

**A compiled conditional model is not evidence that the early “string” picture is identical to the later SAT filament, current H(s)H worldtube, or a physical string-theory object.**

## 1. Primary-source cluster and provenance

Primary source:

- Repository: `Satobloc/HsH`
- Path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`
- Git blob SHA-1: `2cea1924266418e19b825b95ae51e6b7cbace7e1`
- Conversation ID: `252d05c0-22ed-4ea2-a474-7966ab13145a`
- Title: `DIMENSIONAL GRAVITY`
- Raw mapping: 466 nodes; the recovered source ledger identifies 138 outer-role user messages on the selected ancestry.
- Targeted raw-file line ranges were read directly; the line locators below are within this immutable blob.

| Direct user message | Raw line | Descriptive content |
|---|---:|---|
| `aaa28bd9-07f7-4740-b878-b485d4db44d0` | 41 | Two lines, one straight and one helical around it; a plane perpendicular to the straight line; mark each intersection as a point. |
| `aaa20670-fd77-4577-8e31-0a33a9e358c6` | 284 | Introduces a moving plane that retains perpendicularity to the straight line. |
| `aaa2d0b1-017d-453e-b95a-b23915f87d32` | 363 | In the plane's two-dimensional readout, S appears fixed and H traces a circular path; the rate depends on pitch and plane-motion rate. |
| `aaa2a1cc-e884-4f6a-800f-8afc29ab221a` | 527 | Corrects the radius: it is the distance from the straight axis to the helix, equal to the helix's cross-sectional radius, not its pitch. |
| `aaa28a9a-dcfc-4835-8359-e7da7b36911c` | 2,562 | Describes the early “strings” idea as a vague intuition; particle vibration in four-dimensional space is explicitly tentative; time is pictured as a three-dimensional surface intersecting strings, with “now” the current intersection, likened to a propagating wavefront. |
| `aaa26f3d-e831-49cd-976e-a85c5e3b749d` | 7,524 | Explicitly says spherical expansion is unnecessary, other time-surface geometries are possible, and the construction is an abstraction/heuristic rather than an assertion of the universe's true nature. |
| `aaa24791-27b2-4b58-8f1a-19ee7e30d650` | 10,062 | Clarifies that complexity arises from interactions among four-dimensional filaments/threads/ropes; time-surface intersection is their three-dimensional manifestation, not the cause of their complexity. |

These are outer-role `user` nodes in the raw export. Their literal wording, surrounding assistant turns, and parent/child edges were checked. The source is an early exploratory conversation, not a finished specification.

## 2. Nathan Direct geometry, with the mathematics temporarily bracketed

### 2.1 The three-dimensional toy

The directly described objects are:

- a straight line that supplies the long axis;
- a helical line wrapping around that axis;
- a plane perpendicular to the axis;
- two marked intersection points, S on the axis and H on the helix;
- a moving plane that preserves perpendicularity to the axis.

The source first asks about a fixed plane. The intended readout is two points on that plane, not a spiral of intersections within one plane. When the plane moves, S is stationary in the plane's two-dimensional description while H traces a circle around S.

The user later states the crucial scale distinction: the orbit radius is the helix's cross-sectional radius. Pitch controls how quickly the phase changes as the plane advances; it does not set the radius.

### 2.2 The four-dimensional heuristic

The later source describes “strings” as an early, explicitly vague intuition, not as a carefully defined adoption of string theory. The user tentatively imagines four-dimensional vibration and a three-dimensional time surface intersecting those structures. The current intersection is called “now” and compared to a propagating wavefront.

Two direct qualifications constrain interpretation:

1. The time surface need not expand spherically; other geometries are allowed.
2. The construction is acknowledged as a heuristic abstraction, not a declaration of the universe's true ontology.

A further direct correction says that complexity belongs to interactions among the four-dimensional structures. Their interaction with the time surface produces the three-dimensional manifestation; the surface is not asserted to generate the underlying complexity.

## 3. Historical assistant translation and fidelity assessment

The early assistant made several corrections necessary:

- Its first response suggested that a fixed plane would display a “spiral or helix-like pattern” of intersection points. That is wrong for one fixed plane intersecting one ideal helix: the plane selects one helix point.
- A later response described H's motion as a combination of linear motion along the helix and rotation in space. Nathan narrowed the intended observation to the two-dimensional plane: S fixed, H moving on a circle.
- The assistant initially failed to keep orbit radius separate from pitch. Nathan corrected this explicitly.
- Later assistant summaries tended to make the spherical expansion and time-surface interaction sound more ontologically central than the direct source permits. Nathan explicitly made the sphere optional and the model heuristic, and later located complexity in interactions among the four-dimensional structures.

The assistant's mathematical reconstruction is not intrinsically defective merely because it is an assistant reconstruction. Its value is conditional: it must preserve the direct geometry, expose its extra assumptions, and avoid silently promoting the result to physical ontology.

## 4. Existing Lean reconstruction

Existing PR: `Satobloc/HsH#262`, open and unmerged.

- PR head: `c7dc2c483f50ae03fc7a7c530829170135e18d92`
- File: `FORMAL_VERIFICATION/HsHVerification/NadirHelixSliceGeometry.lean`
- File blob SHA-1 at the PR head: `3e47ffa6d6bcd534abdedf18ea865fb2941a0947`
- Root aggregator: `FORMAL_VERIFICATION/HsHVerification.lean`
- Root aggregator blob SHA-1 at the PR head: `b0c1ce44da4c85e5a0853697b6a704813ac3c2fa`
- The root aggregator imports `HsHVerification.NadirHelixSliceGeometry`.

The module defines an all-plus Euclidean pairing on four coordinates, an affine line, and an affine three-dimensional hyperplane:

```lean
dot4 n x := ∑ i : Fin 4, n i * x i
linePoint x v t := fun i => x i + t * v i
onTimeSlice n c x := dot4 n x = c
sliceParameter n x v c := (c - dot4 n x) / dot4 n v
```

Under `dot4 n v ≠ 0`, the module proves existence and uniqueness of the line/hyperplane intersection parameter. If `dot4 n v = 0`, it proves that the slice coordinate is constant along the line. It does not yet prove the full tangent-case dichotomy: either no intersection, or the entire line lies in the hyperplane.

For the three-dimensional toy, the module uses the standard circular-helix parameterization:

```lean
circularHelix r pitch phase :=
  (r * cos phase, r * sin phase, pitch * phase / (2 * pi))
```

It proves that a horizontal slice selects the stated axial coordinate, that squared radial separation is `r^2` independently of pitch and slice height, and that a uniformly translating axial slice has constant phase rate `2*pi*speed/pitch`.

This matches the direct distinction between radius and pitch under the explicit “perfect helix” assumption. It is still incomplete as a point-to-point translation: the module does not explicitly define S as the axis point in the same plane and then prove the S–H distance. Its radial theorem gives distance from the axis in squared form. Identifying this with the S–H radius requires the axis-point map and a nonnegative-radius convention (or an absolute value). The `hpitch` argument in the squared-radius theorem is unused because the radial identity itself is independent of pitch.

The source's phrase “rate at which the plane moves along the lines” is interpreted by the module as constant axial slice speed. That is a reasonable choice, but it is a translation choice and should remain labeled as such.

## 5. Exact Lean verification status

Two successful GitHub Actions PR merge-reference builds include this module:

| Run | Job | Checked ref | Result |
|---|---|---|---|
| `#41301288857` | `#124832543107` | PR #262 synthetic merge ref; checkout log begins `7c12dff` | SUCCESS |
| `#41348936553` | `#124974692430` | PR #1133 synthetic merge ref, whose base includes PR #262 head | SUCCESS |

The first run built 8,944 targets; the second built 8,950. Both used Lean 4.34.0 / Lake 5.0.0. The module target appears in the logs. The six theorem `#print axioms` outputs report standard Lean foundations (`propext`, `Classical.choice`, `Quot.sound`); the complete logs contain no `sorryAx`, `admit`, or Lean `error:` match.

**Limit:** neither run is a standalone exact-head checkout. The separate test, lint, nanoda and automated axiom-audit steps were skipped. Therefore the status is `COMPILED_IN_SUCCESSFUL_PR_MERGE_REF_WITH_STANDARD_AXIOMS; EXACT_HEAD_NOT_RUN; SEPARATE_AXIOM_AUDIT_SKIPPED`, not an axiom-free or physical proof. PR #262 remains open/unmerged; its body still says compilation is unverified and is stale relative to these two merge-ref runs.

## 6. Related formalizations that must not be conflated

- **PR #262 — `NadirHelixSliceGeometry`:** an explicit affine line/hyperplane model in all-plus `Fin 4 → ℝ`, plus a separate three-dimensional circular-helix slice model. This is the actual conditional affine intersection proof.
- **PR #1133 — `RavelCarrierSheetDimensionGate` / `RavelCarrierSliceReconstruction`:** an abstract set-level pullback/retraction with an explicit `preservesSlice` condition, plus natural-number dimension bookkeeping. It is not a smooth-manifold or affine-transversality proof.
- **PR #1135 — `ScalarHessianAntisymZero`:** Hessian symmetry plus degree/intersection arithmetic. Its `transverseIntersectionDimension` function records the count; its own comment says it does not prove transversality.

The generic dimension helpers use natural subtraction. The specific `1 + 3 - 4 = 0` case is safe, but invalid combinations with negative expected dimension truncate to zero rather than preserving a signed result. The existing Aldus comment `#6573688058` on PR #1133 already records this limitation; no duplicate correction is needed here.

### 6.1 Related PR #1133: explicit set-level map, not an affine proof

PR #1133 (`d8579403952ca658cf5dd0547e8c181701d18145`) contains:

- `RavelCarrierSheetDimensionGate.lean`, blob `69c15e6dd9c7e4cb067e0706997f0b3a770b9ec4`;
- `RavelCarrierSliceReconstruction.lean`, blob `ee05b9b104cd69e922face1cf1beb072e380b429`;
- root aggregator blob `59b478bfcac5399e6d5dfb461a09178dbfbe22ff`.

The first module explicitly conditions expected-dimension bookkeeping on smooth embeddings, a normal complement, and transversality; it does not prove those hypotheses. Its `SliceCompatibleRetraction` supplies an explicit `preservesSlice` law and sheet reparameterization before the induced carrier/slice map exists. This is a useful abstract mapping contract, but it is set-level and does not construct an affine or smooth physical intersection.

The companion `RavelCarrierSliceReconstruction` proves set-level facts: if the indexed sheets cover a candidate core, the union of its sections recovers that core; if points are uncovered, the bare intersection readout is non-injective; and section-taking distributes over a labelled union. Its own comments explicitly deny that these are physical response/readout theorems. The index is retained so component multiplicity is not silently erased. This is a precise information-loss/coverage result, not a physical measurement model.

Run `#41348936553`, job `#124974692430`, successfully built the PR #1133 merge ref (8,950 targets). It included the PR #262 base and built `NadirHelixSliceGeometry`, `RavelCarrierSheetDimensionGate`, and `RavelCarrierSliceReconstruction`. It is a merge-ref build, not standalone exact-head verification.

The generic expected-dimension helper uses `Nat` subtraction. The particular `1 + 3 - 4 = 0` case is safe; invalid dimension combinations with a negative expected dimension truncate to zero. The existing Aldus comment `#6573688058` already records this limitation, so this report does not duplicate a correction.

### 6.2 Related PR #1135: scalar-Hessian and degree arithmetic

PR #1135 head `af66f06c6fcd842db7b72ff2c3aa66d3794d297d` contains `ScalarHessianAntisymZero.lean` (blob `432dfbc59721eca92ca6ad32be54ddff0235495f`). Its `transverseIntersectionDimension` is another natural-number arithmetic definition. The module proves scalar-Hessian symmetry under C² and symmetric-coordinate-connection assumptions and records degree counts; it does not construct a geometric intersection or prove transversality.

Run `#41164589389` / job `#124429317733` is a successful PR merge-ref build, not exact-head verification. Existing correction comment `#6554220281` already retracts the PR body's exact-head claim. This is not the affine line/hyperplane proof in PR #262.

## 7. Original-to-translation map

```text
2024 direct three-dimensional toy
  straight axis L + perfect circular helix H
                  |
                  | intersect with moving plane Π(z) ⟂ L
                  v
       S(z) on the axis; P(z) on the helix
                  |
                  | direct intended readout
                  v
       P(z) traces a circle about S(z)
       radius = helix cross-sectional radius
       phase rate depends on pitch and axial plane speed
                  |
                  | heuristic lift; no specified embedding
                  v
2024 direct four-dimensional intuition
  underdefined “strings” / structures F
                  |
                  | intersect a 3D time surface Σ³
                  v
       current “now” as an intersection readout
       (point-like only if F is 1D and the
        intersection is transverse)
                  |
                  | no recovered composition/projection map
                  v
2026 SAT/H(s)H filaments, worldtubes, finite cores
  distinct later source objects; not identified here
```

## 8. Glossary

| Term | Source-faithful meaning | Limit |
|---|---|---|
| Axis line L | Straight line around which the helix wraps | A toy geometric axis, not automatically a worldline |
| Helix H | Ideal helical line; later explicitly assumed perfect | Not a general superhelix |
| Slice plane Π | Plane perpendicular to the axis | Moving-plane model; not a global curved timesheet |
| S | Axis/plane intersection point | Appears stationary in the plane's 2D readout |
| H-point / P | Helix/plane intersection point | One point per fixed plane |
| Pitch p | Axial rise per complete turn in the later standard parameterization | Controls phase rate, not orbit radius |
| Cross-sectional radius r | Distance from axis to ideal helix | Nonnegative geometric radius; Lean proves squared form |
| Early “string” | Nathan's explicitly vague early intuition for a four-dimensional building-block structure | Not automatically string theory or current SAT filament |
| Time surface Σ³ | Three-dimensional surface intersecting the early strings | Sphere optional; global geometry unspecified |
| Now | Current intersection/readout | Analogy, not a complete causal or metric definition |
| Interaction complexity | Complexity arises among the four-dimensional structures | Time-surface readout is manifestation, not the asserted cause |

## 9. Discrepancy ledger

| # | Discrepancy | Resolution / status |
|---|---|---|
| 1 | Assistant's fixed-plane “spiral of intersections” | Rejected by the direct geometry: one fixed plane selects one helix point. |
| 2 | Assistant's spatial linear-plus-rotational motion | Direct source narrows to a circular path in the plane's two-dimensional readout. |
| 3 | Pitch confused with orbit radius | Direct correction: radius is cross-sectional radius; pitch controls phase/rate. |
| 4 | S–H distance not explicitly represented in Lean | Axis point S and point-to-point distance theorem remain missing. |
| 5 | Radius sign convention | Lean proves `r^2`; require `r ≥ 0` or use `|r|` to state radius. |
| 6 | 4D “string” treated as a defined filament | Direct source calls the early idea vague and tentative; current filament identity is unproved. |
| 7 | Time surface treated as necessarily spherical | Direct source explicitly allows other geometries. |
| 8 | Time-surface interaction treated as cause of complexity | Direct source locates complexity in interactions among the four-dimensional structures. |
| 9 | Affine hyperplane treated as full timesheet | PR #262 is a local flat-slice model; curved timesheet map is absent. |
| 10 | All-plus and Lorentzian models silently identified | PR #262 explicitly supplies no signature-change/Wick/projection map to the older `R^(3,1)` draft. Current BEDROCK's all-plus ambient convention does not itself complete that historical map. |
| 11 | Arithmetic dimension count treated as a geometric intersection proof | PR #1133/#1135 are bookkeeping; PR #262 is the conditional affine proof. |
| 12 | 2024 heuristic identified with 2026 finite-core/worldtube | No source-grounded embedding, projection or composition map recovered. |

## 10. Next deeper cursor

1. Extend the existing PR #262 formalization only if a bounded proof is useful: define the axis point S and helix point P on the same slice, then prove the point-to-point squared separation; state the radius sign convention explicitly.
2. Add the tangent-line classification to the affine model: constant slice coordinate implies either no intersection or the whole line is contained in the slice.
3. Recover the 2026 direct source definitions of filament, worldtube, finite core and timesheet, then determine whether any Nathan Direct map identifies them with the early 2024 “string.”
4. Specify any proposed 3D-to-4D lift, 4D-to-timesheet projection, and composition law with domains, codomains and conditions. Do not infer nesting from vocabulary.
5. Preserve the time-surface geometry as open; do not restore a spherical assumption.
6. Do not perform physical calculations, numerical examples, CODATA scoring or empirical claims in this source-fidelity phase.

**Final epistemic status:** the direct 2024 geometry is recoverable and internally coherent as an exploratory toy/heuristic. The existing Lean module successfully compiles its stated conditional affine and circular-helix mathematics in PR merge-ref builds. The translation adds explicit Euclidean, affine, circular-helix and constant-axial-speed assumptions. The full 4D ontology, curved timesheet, interaction dynamics, and map to current SAT/H(s)H finite-core/worldtube geometry remain unproved and source-dependent.
