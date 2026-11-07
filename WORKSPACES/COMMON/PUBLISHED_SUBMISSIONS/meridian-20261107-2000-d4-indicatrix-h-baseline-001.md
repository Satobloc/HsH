# D4 indicatrix and H baseline: source-fidelity supplement

**Date:** 2026-11-07  
**Status:** Additive to #1244 and #1292. This note does not repeat the March 7 phase/spin-space UI audit or the separate second-order superhelix/worldtube and 4D-curvature audits in #1120, #1292, and #1407.

## Finding

The archive contains three related but not yet mapped constructions:

1. A September 30 description of a fixed Euclidean four-dimensional unit hypersphere/grid and a coincident movable copy, pinned at the origin and transformed by rotation and scale. A marked point on the movable grid, tracked relative to a fixed point, is intended to trace a helical worldline.
2. A direct October 8 description of an H zero-deviation normalization baseline, H[0,0,0,0,0,0], for a regular second-order superhelix, with angle, displacement, and scale changes for each order.
3. An assistant-generated six-coordinate descriptor:
   H_candidate = (Δθ1, Δd1, Δln s1, Δθ2, Δd2, Δln s2).

The most conservative interpretation is that the indicatrix is a continuous geometric frame and the H vector is a proposed lower-dimensional descriptor. No source-defined projection from the full indicatrix transform to the six H coordinates has been recovered. The D4 lattice, continuous SO(4) rotations, marked-point readout, and H baseline remain distinct until that map is explicit.

## Primary sources and attribution

### September 30 indicatrix

Source: DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT BUILDING STORY.txt  
Blob: 5c4e20eb52043b655eb81496962133e0ffe33f04  
Relevant transcript range: lines 2559-2576.

This is a dialogue transcript, not a raw role-coded export. Attribution follows the surrounding turn sequence; no per-message timestamp is present.

The user describes a fixed coordinate system and unit hypersphere in Euclidean four-space, a coincident movable copy pinned at the origin, and relative rotation and scale. A point on the movable grid, tracked relative to a fixed point, is intended to trace a worldline. The transcript spells “helical word lines” once; context suggests “worldlines,” but the source spelling is preserved.

The geometry precedes the D4 name. The D4 root-lattice label had just been supplied by the assistant; the user then judged it a good fit. Thus the indicatrix geometry is direct, while D4 is an assistant-supplied name accepted by the user as a candidate coordinate scaffold, not a user-originated derivation of lattice equivalence.

### October 8-9 H baseline cluster

Raw conversation: Meridian Free Build  
Conversation ID: 6ac45d1f-17b0-83ea-ad1f-fa524602378b  
Raw blob: 7af1561b321f4d9364da5eb111df689efc652827.

- User ae5b9fd6-bb6f-4f08-97db-699c3bce0365, 2026-10-08T21:53:45.340Z: H as a zero-deviation normalization baseline for a regular second-order superhelix, with per-order angle, displacement, and scale changes.
- Assistant efa37313-a2a8-4f78-940d-673c69a29fd1, 2026-10-08T21:53:59.350Z: introduces the six-coordinate H feature vector. This is assistant reconstruction, not a verbatim direct equation.
- Assistant 5f860c83-ced3-484b-9a37-e3ad35578c4e, 2026-10-09T00:26:10.077Z: proposes a spectral fingerprint using a selected winding count.
- Assistant correction 561964be-5879-4bb5-81c4-16c7ae5b8811, 2026-10-09T01:00:27.267Z: clarifies that the winding count was an input, not a derived prediction.
- User 68ea28d0-7f74-4264-ace8-e910439eb327, 2026-10-09T01:08:00.959Z: proposes a probably constant first-order winding period and propagation near c; tentative.
- User 6f00a97a-aa84-45bf-9429-4ff70736014a, 2026-10-09T01:13:43.652Z: rejects a separate physical carrier. The intended geometry is one helical core whose own path has second-order superhelical structure.
- Assistant 8e09c212-fd7b-4adb-9af8-bad24c39dba2 moves to one curve but adds a responsive-medium scalar field and energy functional not defined by the direct source.
- User 3c657387-b80b-4982-a61a-8e6d8568b8d1, 2026-10-09T01:50:55.112Z: direct classical-limit statement relating worldtube curvature and inertia. That separate issue remains in #1292.

## Candidate maps, not source equations

A minimal continuous transformation family compatible with the indicatrix description is

G = R_{>0} × SO(4),   T_(s,R)(x) = s R x,

with composition

(s2,R2) o (s1,R1) = (s2 s1, R2 R1).

For S3 in R4, R preserves S3 and positive scale s maps it to the concentric sphere sS3. This captures the rotation/scale description without asserting a physical mechanism.

A candidate marked-point readout is

gamma_p(t) = s(t) R(t) p - p0,   p,p0 in S3.

The source does not decide whether the readout is a difference vector, projection, ray, or comparison of multiple marked points. This formula is a candidate only.

If the intended scaffold is the D4 root shell, a standard candidate is

D4 = {n in Z4 : sum_i n_i is even},
R(D4) = {n in D4 : ||n||^2 = 2},
n -> n/sqrt(2) in S3.

This gives a finite set of unit marker directions, but it is not a source-specified map. The full D4 lattice is discrete and infinite; its root shell is finite. Its finite symmetry group is not the full continuous SO(4). The source does not say whether the intended grid is the full lattice, the root shell, or a continuous sphere carrying lattice markers.

The H vector is a proposed feature map Phi(T1,T2), not a metric. The archive does not define how a general SO(4) element is reduced to Δθi, how point displacement is separated from scale, how the two orders are coupled, or what distance d_H or tensor g_H is used. Angle and log-scale are dimensionless, while displacement carries length; a strict metric needs a reference length or explicit weights. A general SO(4) element has six rotational degrees of freedom plus scale. The six H slots are two orders times three features; the matching count does not make them SO(4) coordinates. If each order has an independent full rotation and scale, the two-order space has fourteen continuous parameters, so the six-vector is constrained or lossy unless additional gauge conditions are supplied.

## Mapping diagram

Fixed indicatrix (S3, fixed frame)
  -> movable indicatrix s(t) R(t) S3
  -> marked-point / ray / projection map NOT DEFINED
  -> helical worldline
  -> per-order feature extraction NOT DEFINED
  -> (Δθi, Δdi, Δln si)
  -> assistant-proposed stacking into H in R6
  -> distance or metric tensor NOT DEFINED

D4 lattice
  -> candidate root-shell normalization n -> n/sqrt(2)
  -> finite markers on S3
  -> correspondence to fixed/movable grid NOT DEFINED

The March 7 Universal Indicatrix UI in #1244 shares a fixed/movable hypersphere motif but is not automatically the same model. Its direct source qualifies the helices as phase/spin-space objects and describes the UI as a mapping/translator apparatus. The September 30 passage describes a coordinate construction for helical worldlines in Euclidean four-space. Shared geometry does not prove equivalence.

## Glossary and proposition ledger

| Term | Controlled meaning | Status |
|---|---|---|
| Indicatrix | Fixed and movable coincident unit-hypersphere/grid construction in Euclidean four-space | Direct descriptive geometry |
| D4 root lattice | Candidate discrete coordinate scaffold named by assistant and accepted by user as a good fit | Candidate identification, not derived |
| Root shell | Norm-squared-2 D4 vectors normalized to unit directions on S3 | Standard construction, not source-mapped |
| Marked-point readout | Relative path of a point on the movable grid against the fixed copy | Direct intent; exact map unresolved |
| H baseline | Zero-deviation normalization reference for a regular second-order superhelix | Direct intent |
| H feature vector | Six assistant-generated angle/displacement/log-scale coordinates | Provisional descriptor, not a strict metric |
| Index sphere | Later direct term associated with each helical order | Not explicitly identified with the earlier indicatrix |
| Worldline / worldtube | Point history / extended support through history | Distinct object types |

Original direct proposition: the fixed/movable indicatrix and relative marked-point path are intended to encode helical worldlines. Translation: a positive-scale SO(4) action and a marked-point readout are plausible, but the readout map is not supplied.

Original direct proposition: H is a zero-deviation normalization baseline for two helical orders. Translation: the assistant six-vector is a candidate feature map, not a defined distance or metric tensor.

Original direct proposition: the geometric construction preceded the D4 name. Translation: D4 is a candidate scaffold, not an independently derived physical necessity.

## Lean 4 / Mathlib proof triage

- PR #752 has genuine proofs of an abstract stabilizer result: distinct transformations that both fix a marked seed can induce distinct full lifts with the same seed readout. The module is generic in R, Q, and seed; it does not instantiate a concrete SO(4) subgroup or prove the D4 indicatrix map. PR-triggered CI run #40521496151 succeeded.
- PR #750 has genuine conditional set/injection and zero-scale direction-loss lemmas. The zero-scale result applies only if scale reaches zero; the September 30 source starts from unit hyperspheres and does not require zero scale. PR-triggered CI run #40996878087 succeeded.
- PR #1245 has a genuine proof of the conditional Euclidean lifted-curve Gram-determinant identity and a circular-helix specialization. It does not prove the indicatrix-to-H map, D4 embedding, or extended worldtube physics. PR-triggered CI run #41410202260 succeeded.
- PR #1133 has genuine conditional dimension arithmetic and set-level carrier/slice results. Its SliceCompatibleRetraction assumes preservesSlice, so it is a projection interface, not a construction of the D4 or H map. PR-triggered CI run #41947575131 succeeded.
- These workflows use default checkout on pull_request, so the builds are PR merge-ref builds, not separately pinned head-only runs. CI establishes compilation of the formalized modules, not source-to-physics fidelity.
- No local lean, lake, or elan executable was available. No new Lean module, branch, PR, or CI dispatch was created.

## Discrepancy ledger

| ID | Open condition | Consequence |
|---|---|---|
| I1 | D4 name supplied by assistant after the geometry was described | Do not attribute lattice derivation to Nathan Direct. |
| I2 | Full D4 lattice, root shell, and continuous sphere are not distinguished | No unique lattice-to-sphere embedding can be assumed. |
| I3 | One marked point does not determine a full SO(4) frame | Multiple lifts can share a readout; a marker grid or frame constraint may be needed. |
| I4 | H vector is a feature map, not a distance/tensor | Do not call it a complete metric until normalization and metric axioms are supplied. |
| I5 | Six H slots are not automatically six SO(4) coordinates | Component semantics and gauge constraints remain undefined. |
| I6 | Indicatrix and later index sphere are not explicitly equated | Keep terms separate until the direct source identifies them. |
| I7 | March 7 phase/spin-space UI and September 30 Euclidean worldline indicatrix have different stated meanings | No equivalence without an explicit map. |
| I8 | Spectral winding count was selected, not derived | It is not a prediction or independent measurement. |
| I9 | One-core correction rejects the earlier two-curve carrier model | The assistant's initial carrier construction is historical, not current. |

## Source custody and controls

The verbatim SAT-O/Blockwave equation ledger and SHA/date provenance remain in #1073 and #1281. The source files were rechecked; no new version or equation correction was identified, so equations are not recopied. This note is additive to #1244 and #1292. Existing 4D-curvature/object-hierarchy reports #1120 and #1407 remain the records for the affine Euclidean lift and worldline/worldtube distinction. The separate H/transport object in #4 and curve H(lambda) in #559 are not identified with this H baseline.

All four current Mersearch request lanes are occupied. The completed three-repository source set loom-sato-blockwave-source-set-20261030-2017 was reused; no request was overwritten or newly submitted. Math Hopper PR #991 remains an open draft and its adapter is extraction-only, not a Lean runtime. Whirligig remains on hold. SciSpace is available, but no external literature search was needed. The three repositories have zero forks. No new tool, dependency, paid service, or external cost was introduced.

No physical calculation, CODATA scoring, invented fixture, Factory Floor admission, plot, paper-gate advancement, or BEDROCK theory promotion was performed. The November 9 minor, November 30 major, and December 14 full-theory paper gates remain separate and unchanged.

## Next deeper cursor

1. Recover an original diagram/source for the September 30 indicatrix so the fixed/movable point correspondence can be read rather than inferred from transcript prose.
2. Decide whether D4 means the full lattice, the 24-root shell, or another subset; define the embedding and marker correspondence explicitly.
3. Define the marked-point readout: difference vector, projection, ray, or multi-marker frame reconstruction.
4. Define the per-order map from (si,Ri) to (Δθi, Δdi, Δln si), including gauge choice and units.
5. Define d_H or g_H, including normalization weights, before treating H as a strict metric.
6. Only then formalize the continuous action, lattice embedding, and H projection in Lean, with source-to-formal translation recorded separately.

FIE re-review is due 2026-11-10 and is not yet due. Unrelated historical reading continued through lines 1908-2007; next cursor is line 2008.

**Epistemic status:** the fixed/movable indicatrix is direct descriptive geometry from a transcript; D4 is assistant-supplied and user-accepted; H baseline intent is direct; the six-coordinate H vector is assistant reconstruction; group action and D4-root normalization are proposals; existing Lean modules prove only their formalized conditional statements; no independent physical measurement or observational validation was performed.
