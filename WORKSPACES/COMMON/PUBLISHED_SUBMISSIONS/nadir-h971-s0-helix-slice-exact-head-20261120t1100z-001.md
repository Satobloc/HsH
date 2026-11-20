# Nadir h971:s0 | Exact-head Lean verification of the moving-plane helix module

**Status:** ADDITIVE_PROOF_STATUS / EXACT_HEAD_BUILD_VERIFIED / NO_NEW_GEOMETRY / NO_PHYSICAL_VALIDATION / NO_THEORY_PROMOTION

This is a proof-status addendum to [the existing early-geometry report, issue #1677](https://github.com/Satobloc/HsH/issues/1677). It does not replace or repeat that source-fidelity analysis. The canonical glossary, mapping diagram, original-versus-translated propositions, and full discrepancy ledger remain in the [h800 published artifact](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/nadir-early-geometry-lineage-20261113t0800z-s0-001.md). Later cross-era typing work remains in the [Aster h844 report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ASTER/2026-11-15T0400Z_H844_S0_SPIN_TIMESHEET_CURVATURE_SOURCE_FIDELITY.md), [Tern h865 report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/TERN/2026-11-16T0212Z_H865_S0_NATHAN_DIRECT_GEOMETRY_FIDELITY.md), and [Nadir h914 report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/NADIR_VOSS/2026-11-18T0200Z_H914_S0_SOURCE_LOCATOR_CORRECTION_AND_GEOMETRY_FIDELITY.md).

## 1. New evidence: exact-head Lean build

The existing [PR #262](https://github.com/Satobloc/HsH/pull/262) contains FORMAL_VERIFICATION/HsHVerification/NadirHelixSliceGeometry.lean (blob 3e47ffa6d6bcd534abdedf18ea865fb2941a0947).

- PR head: 368f9af8d95d061b4581688759ed3eda309e9886, branch infra/lean4-verification-20261023.
- Existing Actions run: [#43948452979](https://github.com/Satobloc/HsH/actions/runs/43948452979), verification job 133584241306.
- The job log records matching expected and actual checkout identities at the PR head. This is an exact-head build, not a synthetic merge-reference build.
- Lean 4.34.0 / Mathlib 4.34.0.
- Build completed successfully with 8,947 jobs.

The six compiled declarations are:

1. transverse_line_intersection_exists
2. transverse_line_intersection_unique
3. tangent_line_has_constant_slice_coordinate
4. circularHelix_slice_z
5. circularHelix_slice_radius_sq
6. movingSlice_phase_rate

The theorem-specific #print axioms output lists the standard Lean axioms propext, Classical.choice, and Quot.sound. No sorryAx or admit marker appeared in the retrieved job log. The separate axiom-audit, tests, lint, and nanoda steps were skipped; this is not a global axiom-free or repository-wide verification claim.

At the current branch read, PR #262 remained open and unmerged. Its base is e2e738facee0890bdfbbc563e9936db174f63074, older than the observed main head 4dd983a2bd2147ace4d55e7cf0f1edd0acee2e4d. The exact-head result therefore does not establish integration against current main or merge readiness.

## 2. What the formalization actually proves

The module explicitly describes itself as a conditional reconstruction: the recovered Nathan Direct messages do not state its equations. It uses a specific all-plus Euclidean four-coordinate model and a selected circular-helix / moving-slice parameterization.

Within that formalized model, it proves:

- existence and uniqueness of a line/slice intersection under the stated nonzero transverse-component condition;
- constancy of the slice coordinate for the tangent-line case;
- the circular helix's slice coordinate;
- radial squared distance equal to the chosen radius squared, independent of pitch;
- the moving-slice phase-rate relation under the selected parameterization.

Lean checks those formalized statements. It does not establish that the model is a faithful translation of Nathan Direct, that the physical premises are true, or that the Euclidean toy is the correct H(s)H metric or causal structure.

The proof does not cover the two-parabola / multiple-intersection proposal, a 4D finite-core tube, a 3D tube boundary, a timesheet mouth, a pair-of-pants cobordism, or a reduction to a 2D worldsheet. Those remain separate source and mapping questions.

## 3. Source-to-formalization map

The early moving-plane construction and the later tube description must remain distinct until a typed map is supplied.

    EARLY SLICE READOUT
    
    Γ¹ (carrier curve)
           |
           | intersect with moving Π³_s
           v
    I_s = Γ¹ ∩ Π³_s
           |
           | readout
           v
    one or more plane-relative points; ν(s) = #I_s
    
    
    LATER CARRIER DESCRIPTION
    
    T⁴ (tube region) around C¹ (core), with boundary B³
           |
           | ? mouth / projection / reduction ?
           v
    Σ³ (timesheet) and/or W² (worldsheet)

| Term | Working type | Source status |
|---|---|---|
| Γ¹ | One-dimensional curve or filament | Early direct geometry |
| Π³_s | Moving three-dimensional slice in a four-dimensional ambient setting | Early direct geometry; sweep normal must be specified |
| I_s | Incidence set Γ¹ ∩ Π³_s | Derived readout object |
| ν(s) | Number of intersections in a slice | Bookkeeping; not by itself a particle-count or creation theorem |
| T⁴, C¹, B³ | Tube, core, and boundary | Later direct description; embedding and metric remain unspecified |
| Σ³, W² | Timesheet and worldsheet | Proposed roles; no identity or reduction map established |
| Pair-of-pants | Particular two-dimensional cobordism | One special split, not a general tube or particle-splitting mechanism |

The useful distinction is between **slice-readout multiplicity** and **carrier-topology change**. A family of slices can change the number of observed intersections without the underlying curve or carrier changing topology. A pair-of-pants split is a different topological operation and requires its own cobordism or branch map. No equivalence between these operations is established.

## 4. Original propositions versus translated mathematics

| Source proposition | Historical or formal translation | Fidelity status |
|---|---|---|
| A fixed perpendicular plane intersects an ideal line and helix at one point each; moving the plane makes the helix point trace a circle. | The first assistant response described a spiral of intersections in one fixed plane. | Directly corrected by Nathan. |
| Orbit radius is the helix cross-sectional radius; pitch controls phase rate. | The later circular-helix equations in NadirHelixSliceGeometry.lean. | Correct conditional reconstruction, not a verbatim Nathan equation. |
| Two oppositely opening parabolas may make two readout points approach, meet, and separate. | The assistant selects a negative-y sweep and asserts contact at the origin. | Extra coordinate choice; the direct source does not define the sweep normal or complete curve/slice equations. |
| A later 4D tube surrounds a 1D core and has a 3D boundary; a mouth may meet the timesheet. | Assistant reconstruction as a four-dimensional spacetime with a rank-three normal bundle. | Mathematically plausible under added embedding assumptions, not a direct definition. |
| The worldtube may be modelable as a 2D worldsheet, possibly as a simplification. | Blockwave's assistant-voiced two-form worldsheet current. | No source-defined projection, quotient, or equivalence map. |

## 5. Discrepancy and proof-gap ledger

1. The initial assistant's fixed-plane spiral description was wrong; the direct source specifies one intersection point per ideal line for a fixed slice.
2. Radius and pitch were initially conflated. The corrected direct distinction is preserved; the Lean theorem proves it only in the chosen circular-helix model.
3. The two-parabola proposal remains under-specified. Its plane normal, sweep coordinate, and complete curve equations are not recovered, so no new fixture or theorem was invented.
4. The later M⁴ spacetime and rank-three normal-bundle construction adds ambient-space, embedding, and normal-space assumptions not supplied by the direct description.
5. No map has been supplied from the early curve/slice readout to the later tube/core/boundary, timesheet, or worldsheet.
6. The exact-head build proves the formalized Euclidean toy, not the soundness of the translation or any physical premise.

## 6. SAT-O1 and Blockwave custody

The existing [h800 report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/nadir-early-geometry-lineage-20261113t0800z-s0-001.md) preserves the verbatim source equations. The source identities remain:

- **SAT-O1 4D:** Git blob 7577aa1ee5a6c3850ce3b226c75377de6367aedc; SHA-256 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937. Unbylined. FileIndex creation metadata: 2025-10-26; last-write metadata: 2025-06-09, timezone unspecified; first extant Git commit: 2025-10-27 00:40:28Z.
- **Blockwave attachment:** Git blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d; SHA-256 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664. User-supplied attachment event: 2025-09-16 16:31:26.687Z. Its embedded prose is assistant-voiced; equation authorship remains unresolved.
- The separate compact Blockwave action in the raw conversation is assistant-role material, not the same artifact as the user-supplied attachment.

**Corrected SAT-O1 equations: none. Corrected Blockwave equations: none.** The notation/transcription amendment does not alter either source equation set.

## 7. Next deeper cursor

Recover the exact direct source for the two-parabola sweep direction and define the carrier, slice family, incidence set, and any multiplicity-changing condition before formalizing that proposal. Separately, obtain an explicit typed projection/composition map from the later tube/core/boundary to the timesheet or worldsheet, including domain, codomain, regularity, and conditions for composition.

No new Lean module or build was created in this pass. No data-free fixture or calculation, physical calculation, fit, prediction, independent measurement, CODATA scoring, or theory promotion occurred. The next formalization requires the missing definitions and specific permission for any data-free fixture.
