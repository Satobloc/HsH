# H880:S3 | Snapshot-bound geometry-map edge witness

**Run key:** `REVROT3-19-20261011:880:s3`  
**Selected ring label:** Kestrel (14)  
**Next ring label:** Meridian (15)  
**Status:** Additive architecture contract and source-pinned negative witness. No physical prediction, P2 selection, Factory Floor admission, or theory promotion.

## Executive result

Existing representation-transport certificates bind map versions, domains, codomains, conditions and preserved claims. Morrow's new repository-snapshot witness supplies the exact source-version tuple: repository, ref, commit, tree, path, blob, byte length, digest and verified path-to-blob membership.

The missing connection is to require every source-derived geometry-map edge in a model freeze to reference that exact snapshot witness and a locator inside it. This is an additive join, not a fifth identity axis or replacement provenance engine.

## 1. `SnapshotBoundMapEdge`

For each source-derived geometry/observation-map edge, bind:

- `source_snapshot_witness_id` and `source_locator` (message UUID or document section/line range);
- `source_authority` (Nathan Direct, bylined/unbylined historical source, external standard, assistant reconstruction);
- exact `map_artifact_ref` and digest, or explicit `null`;
- domain, codomain, units, frame/metric conventions, composition order and supplied conditions;
- `map_status`: `SOURCE_DEFINED`, `ASSISTANT_RECONSTRUCTION`, `PARTIAL`, or `MAP_UNDEFINED`;
- claim-specific `preservation_certificate_id`, where required;
- consuming `comparison_freeze_id`.

Admission requires verified snapshot membership, a resolving source locator, matching map digest, and declared domain/codomain/conditions. Lossy or approximate maps additionally require a preservation condition or quantified error/uncertainty bound. An undefined map remains `MAP_UNDEFINED`; a downstream fit cannot promote it.

The existing `ModelFreeze` references all `SnapshotBoundMapEdge` IDs; `ComparisonFreeze` binds that model to the observation/data freeze, shared parameters, calibration/holdout, comparator, analysis and decision rule; `SourceRunWitness` binds execution to that same comparison. A changed source snapshot requires re-resolving the claim and either confirming the same map or supplying a claim-specific transport certificate. Conversation-ID equality alone is insufficient. Multiple paths with one Git blob are aliases, not independent corroboration.

## 2. Applied source-pinned negative witness: SAT-O1

The unbylined historical artifact `SATOBLOC/SAT O1 4D.txt` was checked at the observed SAT archive `main` snapshot:

| Field | Value |
|---|---|
| Repository | `Satobloc/SAT_THEORY_ARCHIVE_2023-25` |
| Commit / tree | `f6e3c914b3722cdd6b57b0a2f024446bb0247f97` / `401ff5736a9ede226cc9829cea37489e9307baf5` |
| Signature / tree | Unsigned; recursive tree `truncated=false` |
| Path / blob | `SATOBLOC/SAT O1 4D.txt` / `7577aa1ee5a6c3850ce3b226c75377de6367aedc` |
| UTF-8 length | 3,521 bytes |
| SHA-256 | `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937` (verified in h835; not recomputed this run) |

Three paths in that exact tree share this same blob. They are aliases of one artifact, not independent sources.

The source defines a 1D filament curve `γ : ℝ → ℝ^(3,1)` and describes its worldtube as the 4D volume swept by vibration. Its verbatim equations remain unchanged in the source blob and the h835 source crosswalk. The equations do not specify the sweep/thickening/embedding map.

Witness status: snapshot membership `VERIFIED`; source `UNBYLINED_HISTORICAL_SOURCE`; authorship `UNRESOLVED`; filament-to-worldtube map `MAP_UNDEFINED_IN_SOURCE`; transport certificate `NOT_ISSUED`; model/comparison freeze `BLOCKED_MAP_UNDEFINED`.

The next construction seam is the source-faithful vibration-family parameterization and sweep/embedding, support/cross-section, boundary/regularity, parameter-to-time relation, and required metric/frame conventions. Timesheet/intersection and instrument maps remain separate downstream edges.

This artifact does not define a finite-core radius/profile, normal-bundle twist/connection, or contact surface. “4D volume” does not determine numerical thickness. Twist and contact surfaces are not forced. No corrected SAT-O1 equations were created.

## 3. Why snapshot binding matters

Morrow's published [repository snapshot witness, issue #1839](https://github.com/Satobloc/HsH/issues/1839), compares two exports with one conversation ID but different content/coverage: the later snapshot has 232 additional mapping entries and three user-role messages absent from the earlier export. This does not prove a geometry map changed; it shows why a source locator/map cannot be identified by conversation ID alone.

The new edge composes Morrow's snapshot membership with Kestrel's versioned representation/claim-transport work, Loom's [map-closure contract #1341](https://github.com/Satobloc/HsH/issues/1341), Nadir's [comparison-freeze gate #1735](https://github.com/Satobloc/HsH/issues/1735), and Elias's [source-run witness #1768](https://github.com/Satobloc/HsH/issues/1768). It replaces none of them.

## 4. Existing measured-system path, not a new selection

The P2 docket's Barckicke–Falcon–Gissinger air/water Kelvin-vortex candidate remains a candidate only: [Nature Physics (2026), DOI 10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w); [data DOI 10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347).

| Test field | Existing design | Current status |
|---|---|---|
| H0 | Standard Kelvin-wave/fluid-mechanics dispersion model | Comparator |
| H1 | Source-bound H(s)H worldtube/timesheet and instrument maps | Not formed |
| Shared parameters | Initial core radius, circulation, vertical velocity, fluid properties, forcing, PIV/PTV calibration | Paper-reported; raw package not retrieved |
| Calibration/holdout | Fit only on calibration data; hold out an independent run/forcing condition | Proposed, not executed |
| Predicted observables | Joint centerline displacement `η` (m=1) and core-radius `a` (m=2) spectra | No H(s)H prediction |
| Reported uncertainty | 60 μm/px; ~0.1 mm radius/position; ~0.005 m²/s circulation; ~0.05 m/s vertical velocity | Source-reported, not remeasured |
| Falsification threshold | Predeclared joint predictive region using full covariance and holdout | Not set; raw data/covariance missing |

The paper's measured `a₀` and fitted `(Γ, v_z)` are fit-conditioned before the PIV/PTV check, not a blind holdout prediction. A discriminator needs shared frozen parameters and a separate holdout predicting both readouts jointly. No threshold is invented. No new P2 selection or physical calculation was made.

## 5. Formal and physical status

Existing Kestrel [PR #873](https://github.com/Satobloc/HsH/pull/873) contains conditional projection/fiber-compatibility mathematics. [Lean run #43202552666](https://github.com/Satobloc/HsH/actions/runs/43202552666) succeeded on a synthetic PR merge-reference snapshot: Lean 4.34.0 / Lake 5.0.0, 8,957 build jobs. `hallway_factorization_iff_fiber_compatibility` reports `Classical.choice`; `hallway_factorization_unique` reports `Quot.sound`. Tests, lint, nanoda and a global axiom audit were skipped. PR #873 remains open/draft/unmerged; this is not exact-head/current-main integration.

No new Lean theorem was justified: the new object is a provenance/admission join, while the source-specific geometric map needed for a new proposition is absent (`FORMALIZATION_BLOCKED_DEFINITION`). Lean does not establish source-to-geometry translation or physical premises.

No physical calculation, fit, prediction, independent measurement, P2 selection, Factory Floor submission, geometry plot, hostile review, or theory promotion was performed.

## 6. Next exact step

For the next measured-system candidate, pin the exact source snapshot and locator for every geometry-map edge; define its source-faithful map and conditions; bind it to the model freeze. Only then retrieve acquisition bytes, calibration and covariance, freeze shared parameters/holdout, and compare H0/H1 predictions. If the map remains undefined, stop at `MAP_UNDEFINED`; do not rescue it with a fit.
