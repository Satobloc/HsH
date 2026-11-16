# Jackson–Thomas PIV count-stage and aggregation audit

**Status:** Source-grounded measurement-workflow correction; additive CountStageWitness proposal; Lean exact-head build pending; no P2 selection or H(s)H physical prediction.

## 1. Primary source

Jackson, O. C. & Thomas, P. J. (2026), “An experimental study investigating the inertial-wave field accompanying vortex rings translating through a rotating fluid,” *Journal of Fluid Mechanics* 1029, A47. [DOI: 10.1017/jfm.2026.11199](https://doi.org/10.1017/jfm.2026.11199) · [Cambridge Core article](https://www.cambridge.org/core/journals/journal-of-fluid-mechanics/article/an-experimental-study-investigating-the-inertialwave-field-accompanying-vortex-rings-translating-through-a-rotating-fluid/F3D311C5F85E9F260F1612FFC1C2C2B6).

A direct read of §2 and §3.4.1 sharpens the earlier h853:s2 crosswalk:

- PIVlab generated a 149 × 239 grid, or 35,611 velocity-data points per video frame.
- The article states that 3,600 images were captured for each experiment, indexed 1 through 3,600.
- It describes each frequency-filtered velocity field as a 149 × 239 × 3,600 array.
- Ten runs were performed for each set of experimental conditions; the ten run-level propagation-angle values were averaged.
- The analysis also deduplicates repeated spatial point-pairs and averages correlations at equal separations.

The article therefore explicitly identifies both a 3,600-image count and a 3,600-time-index dimension in the filtered velocity-field array. This resolves part of the earlier uncertainty about the article's own use of 3,600. It does not establish the exact raw-image-to-PIV-field operator, endpoint convention, or article-to-thesis acquisition-version mapping.

## 2. Count arithmetic and aggregation ambiguity

The reported dimensions imply:

| Scope | Count | Evidence class |
|---|---:|---|
| Spatial velocity points per frame | 149 × 239 = 35,611 | Article-reported |
| Per-run array | 149 × 239 × 3,600 = 128,199,600 | Source-derived arithmetic |
| Ten-run aggregate | 10 × 128,199,600 = 1,281,996,000 | Conditional arithmetic |
| Article's printed magnitude | 12.8 × 10^8 = 1,280,000,000 | Article-reported approximation |

The ten-run aggregate is within approximately 0.156% of the article's rounded 12.8 × 10^8 magnitude. That is a plausible reconciliation of the factor-of-ten difference between the per-run product and the printed magnitude. It is not established that the article intended the ten-run aggregate in the sentence describing “each frequency-filtered velocity field.” No paper error is alleged. The aggregation scope remains unresolved pending an explicit source statement or run-level manifest.

The prior [h853:s2 source crosswalk](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ENHEDUANNA/2026-11-15T1324Z_H853_S2_ROTATING_FLUID_PIV_PUBLIC_DATA_ACCESS_AND_ACQUISITION_CROSSWALK.md) records the 2025 thesis Table 5.5 configurations: VLS wide FOV (60 fps, 3,600 frames, 111 × 69 points), VLS narrow FOV (90 fps, 2,800 frames, 239 × 149 points), and HLS (150 fps, 3,000 frames, 239 × 149 points). The article's 149 × 239 grid with 3,600 captured images does not match any single thesis-table row. The full 35 MB thesis PDF was not re-opened in this run; the earlier crosswalk remains the source for those table entries.

The thesis separately describes PIV using successive image pairs. The conditional N frames → N−1 pairs rule must not be projected onto the article's explicitly stated 3,600 time indices without a source-defined mapping.

## 3. Additive architecture: CountStageWitness

Existing [Calder contract #1602](https://github.com/Satobloc/HsH/issues/1602) and [Calder PR #1515](https://github.com/Satobloc/HsH/pull/1515) cover measurement mode, attempted and observed acquisition units, missingness, and whole-acquisition holdout. The count-stage witness is additive to [Nadir's paired comparison-freeze artifact](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/nadir-h826-s3-paired-evidence-freeze-20261114t1036z-001.md) and [Aldus's two-axis identifiability/discrimination issue #1820](https://github.com/Satobloc/HsH/issues/1820). The missing addition is a typed record for the processing stage and aggregation scope of each reported count.

Proposed witness fields:

- source artifact, locator, and source digest;
- parent attempted-acquisition/run identifier and measurement mode;
- input and output stages;
- input and output counts;
- transformation operator and processing/configuration version;
- index domain and boundary convention;
- aggregation scope;
- missing/excluded counts and reasons;
- input/output digests;
- evidence class: SOURCE_REPORTED, SOURCE_DERIVED_ARITHMETIC, PIPELINE_EXECUTED, INFERRED, or ASSUMED.

Suggested stage vocabulary:

`RAW_IMAGE → ADJACENT_IMAGE_PAIR → PIV_VECTOR_FIELD → FILTERED_VELOCITY_FIELD → SPATIOTEMPORAL_PAIR → CORRELATION_BY_SEPARATION → DISPERSION_POINT`

Aggregation scopes must distinguish `PER_FRAME`, `PER_RUN`, `PER_CONDITION`, and `ACROSS_RUNS`.

This composes with the existing measurement-mode × acquisition-unit contract, but it does not replace the statistical acquisition-unit map. Frames, spatial vectors, unique spatial point-pairs, FFT bins, and aggregate array entries are not automatically independent experimental replicates. The candidate independent unit remains the actual acquisition/run, subject to preparation, reset, synchronization, and shared-calibration evidence.

Fail closed if a count is reused across stages without an explicit transformation and scope. In particular, do not infer that the article's 3,600 images yield 3,599 fields from the thesis convention, or that 12.8 × 10^8 is a per-run rather than ten-run count.

## 4. Formalization

Draft [PR #1823](https://github.com/Satobloc/HsH/pull/1823) adds:

- typed count-stage and aggregation-scope types;
- a conditional theorem that complete adjacent pairing of N frames yields N−1 pairs;
- exact arithmetic for the source-reported per-run and ten-run array counts.

Current PR head: `a281706fce3bcf0ac76779c78c5dfa3b6a285212`. The PR is stacked on Calder PR #1515 and remains OPEN / DRAFT / UNMERGED.

Exact-head GitHub Actions run #43806243983 was in progress at the latest observation; the updated-head checkout identity and Lean compilation had not yet completed. No successful compilation or theorem-specific axiom audit is claimed. Even a successful build would prove only the formalized count statements, not the source-to-acquisition mapping, aggregation interpretation, statistical independence, or physical model.

## 5. H(s)H discrimination boundary

The article's standard comparator is the inertial-wave dispersion relation ω = ±2Ω cos θ (Eq. 1.2), with propagation angle inferred from correlation decorrelation distances (Eq. 3.5). A future H(s)H test must use the same measured VLS plane, PIV processing, filtered velocity field, correlation operator, calibration, uncertainty package, and acquisition-level holdout, then predict a held-out observable not absorbed by shared nuisance parameters.

This audit forces no particular worldtube thickness, twist, or contact surface. Those remain optional until a source-defined geometry-to-medium-to-instrument map produces an identifiable prediction distinct from the standard comparator.

**Disposition:** no raw PIV dataset or run-level manifest was retrieved; no physical calculation, fit, prediction, independent measurement, P2 system selection, or theory promotion. P2 remains HOLD.


## Internal execution record

- Run key: REVROT3-19-20261011:868:s3; selected ring label Enheduanna, next Tern Rook. Selection is not authentication of a historical/current worker thread.
- Historical role source: MARLOWE conversation 6aa8a2bf-8280-83e9-9d57-1e0af853b7f1, user-role message 11399ca2-5bd6-4203-9e19-e8e044fbc736, 2026-09-23T02:04:49.417Z. It supports archive-wide identity-family searching, not a specialist charter. The prior h864:s4 report records the materialized raw export hash; raw JSON was not re-materialized in this run.
- Main snapshot: 217ebdbd448a9195ed9bead6726c07e96bf6c332. BEDROCK blob 0253ace674764c602b5f618dfce528c0f97b0ef; Steering Charter blob be44c424674764c602b5f618dfce528c0f97b0ef; Three Paper Campaign blob 2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4; Revival Rotation v3 blob 7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14; task graph blob 5994a3952fbb0a2bc23aa4b4388c70b979ef1227; PWH queue blob b1600366334712f6966f4254a13470a7cd1a018f.
- All four Mersearch request files remain requested; all four request-scoped manifests and receipts were absent. No request was submitted, overwritten, or retriggered. No callable Mersearch action was exposed.
- HSH_RESOURCES root README was read; private payload was not opened. SAT archive root README was read.
- PWH: task graph unchanged; prior h861 report records 18 records vs 16 declared. WH-02 queue snapshot is stale relative to Kestrel h861's later PR #1710 rebase preflight (35 behind in queue vs 2,594 behind in later report). Calder retains WH-02 action; Tern retains coordination. No graph or queue mutation.
- :36 task ID 6a9f52b69ec08191b0a2ba24a074f781 remains enabled with exact VEVENT DTSTART;TZID=America/New_York:20261001T143600 / RRULE:FREQ=HOURLY. Current provider run e7bb47f1-c688-8325-9f36-b68a709fa7a1, scheduled 04:36Z, started 04:37:31.424796Z, latest status IN_PROGRESS, completion null, chat_ref null. Cached result 8880bfb2-7598-832e-a64d-27571f13c650 belongs to the prior Aldus run and was not used as current output. Task-level last_run_time remained 04:00:47.707823Z.
- :48 task ID 6aa6c3bc02b48191b0a2ba24a074f781 appears enabled in the active roster, but a later exact-ID peek returned NOT_FOUND / NOT_ACCESSIBLE after an earlier peek had returned its prior 03:48 completed run. This is NOT_OBSERVED, not evidence of deletion. No scheduler mutation.
- PR #1823 current head a281706fce3bcf0ac76779c78c5dfa3b6a285212, module blob f732f8e89c3c3aaeabe91bd7c1ed0aa9a219737d, stacked on Calder PR #1515. Updated exact-head Actions run #43806243983 remained in progress at checkout; compilation not yet observed.
- No new lateral-reading quantum was due; h866 recorded the project-wide reading cursor at line 1561. FIE next review November 24.
- P0 Code Grurple ACTIVE; P1 Orson cognition OVERDUE / NOT READY; P2 measured geometry HOLD; P3 full theory INCOMPLETE. No paper gate advanced.
- No task, ID, cadence, schedule, phase, prompt, or enabled-state change; no sixth task, signet, or conversation rename. No direct Tern-thread delivery or consumption is claimed.
