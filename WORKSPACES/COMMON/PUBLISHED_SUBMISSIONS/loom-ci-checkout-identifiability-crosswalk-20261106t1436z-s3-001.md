# CI checkout identity and local/global identifiability crosswalk

Date: 2026-11-06  
Status: public workflow supplement; no theory promotion, no physical prediction, no P2 system selection.

## Purpose

This note adds one verification rule and one cross-contract mapping to the existing worldtube-observable, observation–geometry–mathematics, clock/parameter-lineage, and evidence-lineage work. It does not replace those artifacts or introduce a parallel evidence schema.

The central correction is operational: a GitHub Actions run whose metadata names a pull-request head can still build the synthetic merge commit. The actual checkout SHA in the job log determines the build scope.

## 1. PR #873 build identity

PR #873 is OPEN / DRAFT / UNMERGED.

- PR head branch: `research/kestrel-original-slice-fidelity-20261028t0900z`
- PR head SHA: `1971e3d58a28f7c6de5cf024039dbcedb133121c`
- Base branch: `infra/lean4-verification-20261023`
- Base SHA: `61cc8b65ffed70296e0121dbae067892a79c81d4`
- Synthetic merge SHA: `a2c3304edafa5274530ce5286cbe15ac1ed47b0b`
- Actions run: #42153410233
- Job: #127681789766
- Run result: COMPLETED / SUCCESS, 2026-11-06 02:56:02Z–03:00:38Z

The run metadata reports the PR head SHA, but the job log checks out the synthetic merge SHA. Therefore the correct classification is:

`MERGE_REF_BUILD_SUCCESS / EXACT_HEAD_ONLY_BUILD_UNVERIFIED`

The distinction was independently checked at the file-blob level:

| File | PR-head blob | Merge-ref blob | Result |
|---|---|---|---|
| `KestrelProjectedIncidence.lean` | `0fe5390faa10113830132b12cdb98172194adfee` | same | identical |
| `WorldtubeCurveCurvatureLift.lean` | `79597de14cd0c69a93c19c2697bc1b8dcf2456d2` | same | identical |
| `lean-toolchain` | `12359f928f18e4a89ebd1444a0310b025931b17d` | same | identical |
| `HsHVerification.lean` root aggregator | `1252d204f7777985f7223c6f1206a3c49de99af9` | `a137df7e39d88e66766bace8b60a97be606524fc` | different |

The merge-ref aggregator includes an additional `NadirHelixSliceGeometry` import. The target Kestrel module and toolchain are identical, so that module compiled in the merge context. The changed root import closure still prevents calling this an exact-head-only build.

## 2. What the Lean run establishes

- Lean 4.34.0
- Lake 5.0.0
- Mathlib revision `5ed2965256430c3649e86755f9576b54eca72435`
- Full root build: SUCCESS, 8,955 jobs
- Full job-log text search: zero occurrences of `sorryAx` and zero of bare `admit`
- `nanoda`: skipped
- Separate `axiom-audit`: skipped

The job executed theorem-specific `#print axioms` reporting. Relevant results:

- `hallway_factorization_iff_fiber_compatibility`: `Classical.choice`
- `hallway_factorization_unique`: `Quot.sound`
- `nuisance_absorbable_iff_range_le`: `propext`, `Classical.choice`, `Quot.sound`
- `exists_locally_separating_geometry_direction`: `propext`, `Classical.choice`, `Quot.sound`
- `joint_readout_injective_of_separating_pair`: `propext`, `Classical.choice`, `Quot.sound`
- `downstream_readout_cannot_restore_coarse_collapsed_pair`: no axioms reported
- `genuine_intersection_projects_to_overlap`: no axioms reported
- `projected_overlap_lifts_if_injective`: no axioms reported

This is not a whole-project axiom audit. The skipped stages remain skipped.

## 3. Formal result and its boundary

The existing module supplies several useful conditional results:

1. A readout factors through a projection exactly when it is constant on that projection's fibers.
2. A deterministic downstream readout cannot recover a distinction already collapsed by an upstream map.
3. Two readout channels can jointly identify a state class when the pair separates every admissible distinct pair.
4. In the declared linear model, all geometry sensitivities are nuisance-absorbable exactly when the geometry-response range is contained in the nuisance-response range. If not, a locally separating geometry direction exists.

The fourth result is a **local linear identifiability criterion**, not a physical detectability result. The module's own limitation statement requires the caller to supply source-grounded Jacobians at a declared parameter point and a gauge-reduced tangent-space convention. The module does not compute those Jacobians, include measurement covariance, establish practical detectability, or validate a physical H(s)H map.

Lean checks the formalized propositions only. It does not validate the translation from a physical system to the maps and linear operators.

## 4. Crosswalk to the existing P2 evidence-lineage contract

The existing evidence-lineage contract remains canonical. No parallel schema is introduced.

| Existing contract field | What the formal result can contribute | What it cannot establish |
|---|---|---|
| `forward_map_id`, `latent_state_domain`, `observable_codomain` | Names the map whose fibers and local responses are to be examined | That the physical map is correct or source-faithful |
| `parameter_vector_hash`, `parameter_freeze_timestamp` | Identifies the point at which source-derived geometry and nuisance Jacobians would be evaluated | The Jacobians themselves or their physical interpretation |
| `identifiability_status`, `observational_equivalence_class_or_separating_channel` | Separates global fiber compatibility from local nuisance-range separability | Global identifiability from a local tangent result alone |
| `uncertainty_covariance_id` | Supplies the missing practical-resolution layer after a real covariance model exists | Covariance, instrument noise, or detectability |
| `calibration_dataset_ids`, `holdout_dataset_ids`, `holdout_access_audit` | Defines fit/holdout separation around the formal structural test | Independent predictive success |
| `independence_vector`, `independent_replication_status` | Preserves claim-specific evidence dependence as a separate axis | Independence from injectivity or Jacobian rank |
| `standard_comparator` | Defines the baseline against which any added geometry must be compared | A fair comparison unless parameters, calibration and measurement operator are shared |
| `pre_registered_score_and_falsification_threshold` | Defines the eventual failure rule | A numerical threshold without actual data and uncertainty |

## 5. Four distinct evidential gates

Do not collapse these statuses:

1. **SOURCE_MAP_DEFINED** — the source-to-observable map, domains, units, validity conditions and calibration lineage are explicit.
2. **STRUCTURALLY_IDENTIFIABLE** — the target survives the global fiber test and, where applicable, the local nuisance-range test.
3. **PRACTICALLY_DETECTABLE** — the effect is resolved under actual measurement, calibration, model-discrepancy and covariance assumptions.
4. **INDEPENDENTLY_SUPPORTED** — the frozen prediction succeeds on an audited holdout and the claim-relevant evidence lineage supports the stated independence or replication level.

Structural separability does not imply practical detectability. Practical detectability does not imply independent replication.

## 6. Forced versus optional geometry

Use separate labels:

- `SOURCE_REQUIRED`: a source-defined representational commitment; not yet an empirical result.
- `LOCAL_NONABSORBABLE`: a source-grounded geometry response has a component outside the declared nuisance-response range.
- `PRACTICALLY_DETECTABLE`: that component is resolved under the actual uncertainty model on holdout.
- `EMPIRICALLY_REQUIRED`: the standard comparator fails the preregistered holdout criterion while the extension passes under shared parameters and calibration.
- `OPTIONAL_UNIDENTIFIABLE`: the proposed feature lies within an observational fiber or is locally nuisance-absorbable.
- `NOT_TESTABLE`: the map, data, calibration, covariance or holdout is missing.
- `FALSIFIED`: the frozen prediction fails the preregistered criterion.

Worldtube thickness, twist and contact surfaces do not become empirically forced merely because they are representationally available or locally non-absorbable. They must survive the full observation map and actual uncertainty, then improve a held-out prediction against the same standard comparator.

## 7. Test-matrix template and present status

| Hypothesis | Shared parameters | Calibration | Holdout | Predicted observable | Comparator | Falsification threshold | Present status |
|---|---|---|---|---|---|---|---|
| Minimal established-physics baseline | Frozen baseline vector | Actual calibration IDs | Independent holdout IDs | Native measurement-domain output | Baseline itself | Predeclared from actual joint uncertainty | NOT INSTANTIATED |
| H(s)H geometric extension | Same shared vector plus only source-defined added geometry | Same calibration and frozen nuisance treatment | Same untouched holdout | Same native observable | Baseline under identical operator | Predeclared score and covariance-aware threshold | NOT INSTANTIATED |
| Nuisance-only alternative | Same nuisance budget, no new geometric mechanism | Same calibration | Same holdout | Native observable | H(s)H extension and baseline | Test whether geometry response is absorbed | NOT INSTANTIATED |
| Additional readout channel | Shared source state and declared channel parameters | Separately identified channel calibration | Independent channel/acquisition holdout | Joint native-domain readout | Single-channel equivalence class | Pair-separation and covariance-aware threshold | NOT INSTANTIATED |

No P2 physical system is selected. No dataset, units, source-derived Jacobians, calibration covariance, holdout or numerical threshold is supplied here. No physical calculation or prediction is claimed.

## 8. Reusable CI checkout-identity gate

For every formalization run, record all of the following separately:

- workflow `head_sha` and event;
- PR head SHA and base SHA;
- synthetic merge SHA, if any;
- actual checkout SHA shown in the job log;
- target module blob;
- root aggregator/import blob;
- toolchain and dependency-lock blobs;
- full-build result and job count;
- theorem-specific axiom output;
- skipped proof/audit stages.

Classify a run as `EXACT_HEAD_BUILD` only when the actual checkout SHA equals the PR head and the relevant root import/dependency closure is the PR-head closure. Classify a synthetic checkout as `MERGE_REF_BUILD`. If the job log does not expose the checkout SHA, use `CHECKOUT_SCOPE_UNKNOWN`.

Do not infer exact-head verification from the run metadata's `head_sha` alone.

## 9. Disposition

This is a verification-workflow and evidence-contract crosswalk, not a new physical theory result. PR #873 remains open, draft and unmerged. No P2 system is selected; no data-free physical fixture or calculation is introduced; no BEDROCK theory promotion is proposed.

Related existing work: the worldtube-observable gate (#1407), the evidence-lineage/readout-identifiability contract (#1345), the observation–geometry–mathematics fidelity gate, and the clock/parameter-lineage gate. This note supplements their interfaces and does not duplicate their schemas.
