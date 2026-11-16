# Source-scoped particle-instantiation witness v0.1

**Run:** `REVROT3-19-20261011:866:s3`  
**Nominal slot:** 2026-11-16 02:36Z  
**Selected ring label:** Loom (index 1)  
**Next ring label:** Aster (index 2)  
**Status:** `WORKFLOW_CONTRACT_PROPOSED / NOT_IMPLEMENTED / NO_PHYSICAL_RESULT`

## 1. The missing edge is not another intersection theorem

The current geometry workflow already distinguishes source support, intersection, projection, instrument response, calibration, and comparison freeze. Existing contracts include:

- [#1737: source-typed coordinate-role witness](https://github.com/Satobloc/HsH/issues/1737)
- [#1341: geometry-to-observation map contract](https://github.com/Satobloc/HsH/issues/1341)
- [#1738: ordered coordinate-to-instrument composition](https://github.com/Satobloc/HsH/issues/1738)
- [#1301: map closure and joint-readout identifiability](https://github.com/Satobloc/HsH/issues/1301)
- [#1261: calibration and holdout requirements](https://github.com/Satobloc/HsH/issues/1261)
- [#1735: paired comparison freeze](https://github.com/Satobloc/HsH/issues/1735)
- [#1727: cross-version witness incompatibility](https://github.com/Satobloc/HsH/issues/1727)

The h865 source-fidelity report also distinguishes the 1D core, finite-core support, 3D boundary, possible 2D worldsheet, and timesheet. [Tern h865 report, published as #1817](https://github.com/Satobloc/HsH/issues/1817). [Aldus's source-fidelity addendum](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ALDUS/2026-11-12T1600Z_WORLDLINE_CORE_MAP_SOURCE_FIDELITY_ADDENDUM.md) records the remaining gap: no inspected source defines the observation map from a 3D core section to measured particle state.

The additional missing edge is more specific:

**Which support is selected for intersection, and what source-defined operation turns that intersection into a particle state or detector observable?**

An intersection is not automatically a particle. A readout must say whether its output is a point, a curve, a surface, a volume, a set of components, or a measure/distribution over states. A generic field called `particle_position` must not silently collapse these different types.

## 2. Source scope must be locked before composition

| Source scope | What the source supports | What it does not supply |
|---|---|---|
| 2024 `DIMENSIONAL GRAVITY`, raw conversation `252d05c0-22ed-4ea2-a474-7966ab13145a`, blob `2cea1924266418e19b825b95ae51e6b7cbace7e1` | Direct user turns `aaa2269b-7eab-4781-9454-647098d6747f`, `aaa2d0b1-017d-453e-b95a-b23915f87d32`, and `aaa2a1cc-e884-4f6a-800f-8afc29ab221a` describe a line/plane point intersection and a moving-slice trace. | A universal readout law for the later finite-core model. |
| June 2025 `SAT O1 4D.txt`, SAT archive blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc` | Unbylined file: a 1D filament `gamma` in `R^(3,1)`; its worldtube is described as the 4D volume swept by vibration. The file-index creation date is 2025-06-09; the later archive snapshot date is 2025-10-26. | A construction map from the 1D curve to the 4D support; a selector choosing core, boundary, or interior for a timesheet intersection; a particle extraction/readout map. |
| 2026 Meridian Free Build source, raw blob `7af1561b321f4d9364da5eb111df689efc652827` | Previously recovered direct-user material describes a one-core/finite-core worldtube and a 3D intersectional trace. The h865 Tern report preserves the relevant source locators. | A defined map from the 3D core section to measured particle state. The raw conversation was not re-parsed in this run; the prior source report is used as a navigation witness, not represented as a fresh raw-source read. |
| Blockwave worldsheet-current branch | A separate 2D worldsheet-current representation appears in an assistant-authored 2025 message. The attached historical artifact has blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d` and SHA-256 `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`; its content identity is distinct from authorship. | Nathan Direct authorship of the `J^{mu nu}` notation, or a source-authorized map identifying that current with the current finite-core particle readout. |

The 2024 point-intersection construction, the unbylined 2025 SAT-O1 file, the 2026 finite-core source, and the assistant-origin Blockwave worldsheet must remain separate source branches. Similar words do not establish a translation map.

No SAT-O or Blockwave equation was rewritten, normalized, corrected, or promoted in this run.

## 3. Conditional support-to-slice dimensions

The existing [KestrelIntersectionDimensionGate](https://github.com/Satobloc/HsH/blob/7dbcb5f18690232d921db74f25dfdf222ee51b8c/FORMAL_VERIFICATION/HsHVerification/KestrelIntersectionDimensionGate.lean) formalizes the finite-dimensional tangent-space identity under the explicit transversality condition. In a four-dimensional ambient tangent space, intersecting a 3D hypersurface gives these conditional cases:

| Selected carrier | Carrier dimension | Front dimension | Conditional intersection dimension |
|---|---:|---:|---:|
| Coreline/worldline | 1 | 3 | 0 |
| Worldsheet | 2 | 3 | 1 |
| Worldtube boundary | 3 | 3 | 2 |
| Full-dimensional worldtube support | 4 | 3 | 3 |

The 2024 line/plane example is a separate 3D-ambient case: a 1D line and 2D plane meet in dimension 0 when transverse.

These are conditional type results, not evidence that any particular physical carrier exists, is transverse, or is selected by the source. In particular, `W^4 intersect Sigma^3` is not automatically a point. If the full-dimensional support is selected, the generic slice is 3D. A point-valued particle readout requires another operation.

## 4. Proposed additive ModelFreeze component

Add a **ParticleInstantiationWitness** to the existing ModelFreeze/ComparisonFreeze. This is a workflow schema, not a new physical primitive, equation, or implementation.

```text
ParticleInstantiationWitness:
  source_scope:
    repository, path/blob, source date, conversation ID,
    exact message IDs, speaker/authorship status, branch/version

  carrier:
    carrier ID, carrier kind {coreline, worldsheet, boundary, interior, other},
    domain, dimension, support/inclusion relation, metric/signature

  front:
    front ID, front kind, local/global scope, domain, dimension,
    metric, time parameter, observer/synchronization convention

  intersection:
    selected carrier ID, intersection operator, common domain,
    regularity, transversality status, result type/dimension,
    component multiplicity, orientation, measure

  particle_selection:
    explicit selection/extraction operator, domain and codomain,
    output kind {point, set, curve, surface, volume, measure-valued},
    uniqueness condition, weighting/measure if used

  readout:
    map from selected intersection to particle state or observable,
    state/observable type, frame, units, observer, coarse-graining

  instrument:
    calibrated response map, instrument and acquisition IDs,
    raw-data identity, processing lineage, uncertainty/covariance

  comparison:
    comparison_freeze_id, H0 standard comparator, shared parameters,
    calibration set, locked holdout, predictive observable,
    pre-registered decision/falsification rule

  formalization:
    exact source-to-formal trace, module/blob, Lean/Lake version,
    exact checkout, Actions run/job, theorem scope, skipped checks
```

The required order is:

`source scope -> carrier selection -> intersection -> particle selection -> physical readout -> instrument -> frozen H0/H1 comparison`

Each arrow is a separately identified partial map with a declared domain, codomain, assumptions, and failure status. If two stages are collapsed, the composition must still be explicit and its intermediate types recoverable.

### Admission states

- `CARRIER_UNSELECTED`: the source names a filament/worldtube but does not identify which support is intersected.
- `INTERSECTION_ONLY`: an intersection type is available, but no particle-selection operator is defined.
- `PARTICLE_READOUT_DEFINED`: the source-grounded extraction/readout map and output type are explicit.
- `INSTRUMENT_BOUND`: the readout is composed with a calibrated instrument map and acquisition provenance.
- `PREDICTION_FROZEN`: H0/H1, shared parameters, calibration, holdout, uncertainty, and decision rule are bound to one immutable comparison identity.
- `PREDICTION_TESTED`: the locked holdout has been evaluated.
- `OBSERVATIONALLY_EQUIVALENT_AT_RESOLUTION`: alternative admissible carriers/readouts produce outputs indistinguishable within the frozen instrument uncertainty.
- `FALSIFIED`: the pre-registered holdout rule rejects this frozen model version.

Missing definitions are not automatically physical disproof. They block the relevant prediction claim.

## 5. Current feature disposition

| Feature | Source status in the inspected branches | What is still missing | Current status |
|---|---|---|---|
| Finite-core support | Explicit in the 2026 direct-source lineage; the 2025 SAT-O1 file separately describes a 4D volume. | A source-authorized core-to-support construction and selected support for readout. | Source-declared; construction/readout incomplete. |
| Numerical thickness/profile | Not fixed by the word `finite-core`; registered `SAT:ℓ_f` and historical `SAT:ε` remain distinct. | A source-defined profile/scale law or independently identifiable measurement. | Not determined. |
| Twist | No complete source-defined normal-frame/transport law in the readout chain examined here. | Frame, connection/transport, sign convention, and observable coupling. | Not forced by this readout evidence; this does not globally negate BEDROCK twist hypotheses. |
| Contact surfaces | No complete source-defined incidence/contact map and transfer law in the readout chain examined here. | Contact geometry, admissible domain, interaction law, and observable. | Not forced by this readout evidence; this does not globally negate interaction-surface hypotheses. |
| 2D worldsheet | Separate assistant-origin Blockwave branch. | Authorship/authority bridge and map to the current finite-core construction. | Keep separate; not a default reduction. |
| Particle point | Explicit in the historical 2024 line/plane construction. | A source-authorized map from the current 2026 finite-core intersection to a point-valued state. | Historical result; not transferable by analogy. |

The four statuses below must not be collapsed into one:

1. `SOURCE_DECLARED`: the exact source says the feature exists.
2. `CONSTRUCTION_FORCED`: every source-faithful admissible construction requires it.
3. `OBSERVATIONALLY_IDENTIFIABLE`: the frozen instrument/readout distinguishes it from alternatives.
4. `EMPIRICALLY_SUPPORTED`: independent held-out measurements favor it against the standard comparator.

A feature can be source-declared yet not identifiable, or mathematically necessary in one representation yet observationally equivalent to another at current resolution. "Not defined" is not the same as "optional"; "optional" is not the same as "empirically absent."

## 6. P2 test-matrix extension

| Hypothesis | Shared parameters | Calibration | Holdout | Predicted observable | Standard comparator | Falsification rule |
|---|---|---|---|---|---|---|
| H0: established model | Same physical-system and instrument nuisance parameters as H1 | Frozen once, before holdout | Independent acquisition/state | Standard-model prediction passed through the same instrument map | H0 itself | Pre-registered H0 predictive envelope |
| H1: source-faithful H(s)H | Same shared parameters plus only source-authorized geometry parameters | Same calibration data and instrument model | Same locked holdout | Output of the frozen carrier/intersection/particle-readout/instrument composition | Same H0, same observable | Reject this H1 version if holdout lies outside its pre-registered predictive envelope; no post-holdout selector or map tuning |

No numeric threshold is specified here. It must be derived from the actual dataset, units, covariance, map uncertainty, shared nuisance parameters, and declared confidence/error rule. No candidate system was selected and no raw physical dataset was processed in this run. P2 remains HOLD.

## 7. Proof-first disposition

Existing formal work was checked rather than duplicated:

- [PR #873](https://github.com/Satobloc/HsH/pull/873), head `7dbcb5f18690232d921db74f25dfdf222ee51b8c`, base `61cc8b65ffed70296e0121dbae067892a79c81d4`. Exact-head Actions run [#43202552666](https://github.com/Satobloc/HsH/actions/runs/43202552666), job `131129411360`, completed SUCCESS. The Lean verification job completed its library-compilation step. The PR base is older than current main; this is not current-main integration. The theorem is conditional tangent-space linear algebra and does not prove source carrier selection or physical readout.
- [PR #1189](https://github.com/Satobloc/HsH/pull/1189), head `8a6a0c288b0091a19b604ab96f94fec05adcc40e`, base `7a3add552cebd8a9fa7f2b758f729b3d72d58bcc`. Exact-head run [#43783028748](https://github.com/Satobloc/HsH/actions/runs/43783028748) completed SUCCESS with the formal-library build. Its fiber-factorization work is relevant only after a source-defined observation map exists. Its base is also older than current main.
- [PR #1133](https://github.com/Satobloc/HsH/pull/1133) remains a separate carrier/timesheet and O3-pairing audit; it is not treated as a completed physical readout map.

**No new Lean theorem was attempted.** The source-specific proposition cannot yet be stated without inventing the carrier selector and particle-extraction map. Status: `FORMALIZATION_BLOCKED_BY_SOURCE_DEFINITION`, not a Lean failure. The existing CI runs prove only their formalized statements. No local Lean/Lake/Elan execution is claimed.

## 8. Reuse and boundaries

This is an additive sub-interface to existing map and freeze contracts, not a replacement for them. It does not create a new solver, plugin, dependency, branch, PR, symbol, or physical primitive.

Mersearch was not available as a callable action in this runtime. All four shared request lanes remain occupied/requested; none was overwritten or retriggered. The 12 expected request-scoped manifest/receipt paths were absent. Bounded GitHub source retrieval is not represented as a Mersearch search. Existing Math Hopper #578, Lean PRs, Whirligig Kernel 0, installed SciSpace capability, repository forks, and free/current methods were checked before proposing this schema. No new tooling, paid service, subscription, API spend, or dependency was introduced.

HSH_RESOURCES root metadata/README was inspected only. Its private research payload was not opened. No external assumption was imported.

No physical calculation, fit, prediction, independent measurement, new SAT-O/Blockwave equation, BEDROCK edit, Factory Floor admission, or paper-gate advancement occurred. No theory promotion is claimed.

## 9. Run receipt and return

- Main branch before publication: `19368bea61d766c6c97e1fea1ddc1366ef30e274`.
- Nominal hour: `h=866`; sequence `5h+3=4333`; selected index `1` (Loom); next index `2` (Aster).
- Existing :36 task ID: `6a9f52b69ec08191b0a2ba24a074f781`; original hourly America/New_York :36 phase preserved.
- Observed current run: `5a6af084-02d4-8321-9ab1-ee2065df17fc`; scheduled 02:36Z; recorded start 02:31:32.728999Z; IN_PROGRESS; completion and run-level `chat_ref` null at the scheduler snapshot. Its cached task-level result belongs to an earlier 00:36Z execution, not this run.
- No task ID, schedule, prompt, phase, enabled state, ownership, signet, or conversation title changed. No sixth task.
- Next unrelated-reading cursor: `fun break - lx.txt`, lines 1561 onward. Lines 1521-1560 were read this run.
- FIE was last rereviewed 2026-11-10; next review due 2026-11-24.
- Next ring label: Aster. This report is repository/publication context only, not direct ChatGPT-thread delivery, consumption, or acknowledgment.

**Return pin:** `H866:S3 / LOOM / ASTER-NEXT / PARTICLE-INSTANTIATION-WITNESS-V0.1 / CARRIER-SELECTION-AND-PARTICLE-EXTRACTION-EDGE / PR873-CONDITIONAL-DIMENSION-BUILD-VERIFIED / PR1189-FIBER-FACTOR-REUSED / SOURCE-MAP-UNDEFINED / NO-NEW-LEAN / NO-P2-DATA / P2-HOLD / P0-ACTIVE / P1-OVERDUE / P3-INCOMPLETE / FIE-NOV24 / READING-1561 / AUTOMATION-UNCHANGED / NO-SIXTH-TASK`.

## Publication and internal-continuity amendment

The issue-publisher event was submitted once as issue [#1819](https://github.com/Satobloc/HsH/issues/1819), owner-authored by `Satobloc`. Action run [#43794007580](https://github.com/Satobloc/HsH/actions/runs/43794007580) completed with workflow conclusion `success`, but the publisher posted comment #6905864545: `REJECTED: SHA-256 mismatch`. The expected `PUBLISHED_SUBMISSIONS/loom-h866-s3-particle-instantiation-readout-witness-20261116t0236z-001.md` path returned 404. The explicit rejection controls; the artifact is NOT PUBLISHED_VERIFIED. No issue edit, retry, duplicate issue, or direct write to the publisher destination was attempted.

The declared digest in the issue envelope was `f0e9f683c5a49fd8acde18ec22d10e57a09194d82375540fbde3159f6fbbb58e`; the publisher rejected it. The internal report below is preserved separately for continuity and is not represented as the published artifact.
