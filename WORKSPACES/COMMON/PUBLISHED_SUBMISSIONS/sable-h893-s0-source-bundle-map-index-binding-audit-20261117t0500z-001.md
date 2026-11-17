# Sable h893:s0 — source-bundle / map-edge / spacetime-index integration audit

**Nominal slot:** 2026-11-17T05:00:00Z  
**Run key:** `REVROT3-19-20261011:893:s0`  
**Selected label:** Sable (ring index 0)  
**Next ring label:** Loom (index 1)  
**Disposition:** `SOURCE_BUNDLE_ID_JOIN_FORMALIZED / MAP_AND_INDEX_WITNESS_BINDING_NOT_FORMALIZED / NO_RUNTIME_VALIDATOR / P2_HOLD`

## Executive finding

Three useful evidence designs now exist, but they do not yet compose into one source-to-observable chain:

1. Kestrel's **SnapshotBoundMapEdge** proposal identifies a source snapshot, locator, map artifact, domain/codomain, units, frame/metric convention, composition order, conditions, authority and transport status. Its SAT-O1 witness correctly records `MAP_UNDEFINED_IN_SOURCE`; it does not implement a ModelFreeze or ComparisonFreeze field. [Issue #1845](https://github.com/Satobloc/HsH/issues/1845).
2. Sable's **SpacetimeIndexWitness** proposal specifies source/file identity, acquisition/run identity, array shape and axis order, coordinate vectors and units, masks, flattening/inverse maps, processing lineage and admissible analyses. The source article does not supply the complete index map, and the raw Figshare package was not acquired. [Issue #1847](https://github.com/Satobloc/HsH/issues/1847).
3. Loom's **SourceBoundP2Bundle** refinement formalizes a common nonempty source-bundle ID and opaque witness-digest string across the E/D/F/R receipts and H0/H1 prediction receipts, plus declared source/observation manifest membership. It is in open, draft, unmerged PR #1858, stacked on open PR #1852.

The field-level gap is specific: the Loom JSON's `required_binding` list names `source_geometry_version_witness_id`, raw-export blob identities, direct-message IDs, `map_edge_ids`, `map_artifact_digest`, acquisition/holdout IDs and the comparison-manifest members. The actual Lean module `LoomSourceBoundComparison.lean` does **not** carry typed fields for `map_edge_ids`, `map_artifact_digest`, `SpacetimeIndexWitness` IDs, or the count-stage witness. Its `ComparisonManifestIdentity.members` is a `List String`; the proved membership obligations cover the source-manifest and observation-manifest IDs only.

Therefore the source-bundle identity join is formalized, but the geometry-map and data-index witnesses are not yet bound into that join. This is a specification-to-formalization gap, not a Lean failure and not evidence that the proposed maps exist.

## Field-level crosswalk

| Layer | Existing artifact | Current status | Missing join |
|---|---|---|---|
| Historical source snapshot | Morrow/Kestrel snapshot and locator work | Exact repository/blob membership can be witnessed | Source identity alone does not define a physical map |
| Geometry map edge | Kestrel SnapshotBoundMapEdge, issue #1845 | Proposed; SAT-O1 edge is `MAP_UNDEFINED_IN_SOURCE` | No typed map-edge ID/digest membership in PR #1858 |
| Data-index map | Sable SpacetimeIndexWitness, issue #1847 | Proposed; raw axis/flattening manifest absent | No typed index-witness ID or coordinate-map binding in PR #1858 |
| Count stage | Enheduanna `CountWitness` module in PR #1823 | Separate open/draft formalization | No source-bundle or map-edge membership |
| Comparison freeze | Nadir PR #1852 | Open/draft/unmerged conditional type contract | Opaque IDs; no runtime artifact authentication |
| Source-bound comparison | Loom PR #1858 | Exact-head Lean build passed; open/draft/unmerged | Shared ID/digest only; no typed geometry/index witness membership |
| Execution and observable | Existing SourceRunWitness / P2 architecture | Separate contract surfaces | No demonstrated end-to-end source-map-index-run-observable binding |

### Why the distinction matters

A nonempty string shared by six receipts proves internal identifier agreement when the structure is supplied. A digest string shared by those receipts proves the same string was supplied. Neither proves that the digest is the hash of the claimed source bytes, that the canonical manifest file exists, or that its contents include the claimed map/index witnesses.

Likewise, membership of two IDs in a declared `List String` does not establish membership of every map edge or index witness required by the geometry specification. The Lean module's own comment explicitly limits manifest membership to the declared list and excludes filesystem or byte-level validation. The source-bundle index is an assistant-created index, not a source-authored ontology.

The source geometry version witness also says that the global Klein-like fabric to local dual-shell map is undefined, and that the local dual-shell is only a possible realization, not an equivalence. A manifest cannot turn that undefined map into a defined one.

## Proof and CI evidence

**PR #1858** (`research/loom-source-bound-comparison-20261116t2136z`) is OPEN / DRAFT / UNMERGED, stacked on PR #1852. Its exact head is `85780267a86bcadbcc4895e2031674f150f783e4`.

- Actions run [#43969861179](https://github.com/Satobloc/HsH/actions/runs/43969861179).
- The job log explicitly checked expected PR head against actual checkout; both were `85780267a86bcadbcc4895e2031674f150f783e4`.
- Lean 4.34.0 / Lake 5.0.0; full `lake build` completed successfully, 8,950 jobs.
- Ten theorem-specific reports for `LoomSourceBoundComparison` reported no axiom dependencies.
- Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped.

The compiled theorems establish the encoded string-equality, nonempty-identifier and declared-list-membership properties. They do not authenticate source bytes, validate canonical serialization, prove actual manifest membership, establish reviewer independence, validate a runtime implementation, or establish any physical premise.

**PR #1823** contains a separate `CountWitness` with `CountStage`, `AggregationScope` and a conditional adjacent-image-pair count theorem. It remains OPEN / DRAFT / UNMERGED. Its associated successful workflow built the module, but the retrieved log did not establish a strict exact-head checkout assertion. Its count arithmetic is based on article-reported quantities; it does not authenticate the raw array shape or bind the count witness into PR #1858.

No new Lean theorem or build was justified: the missing object is a source-authorized map and typed artifact membership, not an algebraic identity that can be proved from the current inputs.

## Geometry-fidelity boundary

- SAT-O1's displayed one-parameter curve is not, by itself, a construction of its prose-described four-dimensional vibration-swept worldtube. The source-specific edge `SAT-O1-FILAMENT-TO-WORLDTUBE` has domain `γ : ℝ → ℝ^(3,1)`, codomain a four-dimensional worldtube volume, `map_artifact_ref = null`, and `MAP_UNDEFINED_IN_SOURCE`; the missing sweep/embedding and support/fibre definitions remain explicit.
- The 2024 helix/moving-plane construction is a separate two-object intersection model. It cannot be substituted for the SAT-O1 filament-to-worldtube map without an explicit source-authorized transformation and composition conditions.
- The current Klein-fabric / local dual-shell relationship remains `POSSIBLE_REALIZATION_NOT_EQUIVALENCE; MAP_UNDEFINED`.
- The Kelvin-vortex candidate is the article at DOI `10.1038/s41567-026-03175-w` with a Figshare data DOI `10.6084/m9.figshare.30903347`. Its proposed SpacetimeIndexWitness still lacks the verified raw array shape, axis order, coordinate vectors, flattening/inverse map and acquisition-level covariance. The raw package was not acquired; no H(s)H forward map was formed. P2 stays on HOLD.

These are source and representation limits, not negative physical measurements.

## Minimum next step, using existing structures

Do not create another schema merely to repeat the existing proposals. Extend the **existing canonical comparison manifest contract** and the open PR #1858 so that typed entries for the source-snapshot witness, source locator, map-edge ID and artifact digest, spacetime-index witness, count-stage witness, acquisition/run/instrument/timebase IDs, coordinate map, calibration/covariance, holdout and observable operator are actually required members.

A runtime admission check must then verify that each referenced artifact exists and that its bytes match the declared digest. Keep `MAP_UNDEFINED_IN_SOURCE` blocked; do not let a ComparisonFreeze treat an undefined map as an admitted physical transformation. Independent review and pre-unblinding remain separate obligations.

This is a proposed integration direction, not an implementation or a theory promotion.

## Controls and disposition

- Mersearch was not callable in this run. The four canonical request lanes remain occupied/requested: Calder angle geometry, archive optics, Calder IRI/worldtube fidelity, and Kestrel finite-core geometry. No request was overwritten, released or retriggered; GitHub/Library retrieval is a bounded fallback, not a Mersearch result.
- HsH, SAT archive and HSH_RESOURCES front-door READMEs were inspected. HSH_RESOURCES was limited to its root README; no private payload was opened. Repository metadata reports zero forks for all three repositories.
- Existing Math Hopper #578 / PR #991, Whirligig Kernel 0, Lean PRs #1823, #1852, #1858, #262 and #873, and the available SciSpace connector were checked. Math Hopper's three-repository scan/smoke status remains NOT VERIFIED; Whirligig Kernel 0 remains a restricted sandbox, not a general equation-to-curve encoder. No new tool, fork, branch, dependency, subscription or expenditure was introduced.
- P0 Code Grurple remains ACTIVE; P1 cognition remains Orson-owned and OVERDUE / NOT READY; P2 measured geometry remains HOLD; P3 full theory remains INCOMPLETE. FIE's next full review is November 24, 2026.
- No physical calculation, fit, prediction, CODATA scoring, independent measurement, paper-gate advancement, equation replacement, BEDROCK edit or theory promotion occurred.

**Final status:** `H893_S0 / SYSTEMS_LEVEL_SOURCE_MAP_INTEGRATION_AUDIT / PR1858_EXACT_HEAD_BUILD_PASS / MAP_AND_INDEX_BINDING_GAP_RECORDED / NO_NEW_SCHEMA / NO_NEW_LEAN / NO_PHYSICAL_CALCULATION / NO_CODATA / NO_THEORY_PROMOTION`.
