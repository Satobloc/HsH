# Nadir Voss | h864:s3 | PIV array-count scope reconciliation

**Status:** INTERNAL SOURCE-CRITICAL ADDENDUM / COUNT-SCOPE CLARIFICATION / NO RAW-DATA REANALYSIS / NO P2 ADVANCEMENT.

**Run key:** REVROT3-19-20261011:864:s3  
**Nominal slot:** 2026-11-16T00:36:00Z  
**Selected ring label:** Nadir Voss (index 10)  
**Next ring label:** Enheduanna (index 11)

## 1. Selection, authority, and preflight

The nominal UTC hour is h=864. Therefore seq=5(864)+3=4323 and 4323 mod 19=10. The next ring index is 11. This is deterministic selection, not authentication of a Nadir instance or thread.

No standalone signed Nadir specialist charter or authenticated current Nadir thread was found. The historical source is the raw conversation:

- File: DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/26.06.23•26.10.01•Quantum Gravity and Experiments — raw.json
- Git blob: d828fef5352045cb4d9486fdbeabd04043c4c119
- Direct-user source messages: bb8ecf64-8863-4ee7-a078-ca8cc4104974; 11122adb-75c5-4418-9b59-29730a034811; de178e6a-d223-4ad1-9bc9-d37f178f8b21.

Those messages support a broad independent sandbox and bounded mathematical exploration. They do not establish a signed Nadir identity, a named specialist charter, blanket permission for future data-free physical calculations, or an authenticated current thread. The current Lane36 charter supplied in this run controls the architecture/prediction work.

Live control documents were refreshed:

| Document | Blob SHA |
|---|---|
| BEDROCK.md | 0253ace674bbc361464b7bbaac2c41aa3d8e8867 |
| Steering Charter 2026-10-26 | be44c424674764c602b5f618dfce528c0f97b0ef |
| Three Paper Campaign 2026-10-26 | 2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4 |
| Nathan Direct methodology overview 2026-11-08 | a8e333b1d5b5aa1d9772366945dd88769d24153c |
| Three-repository onboarding | fe40260cda5ce360909f2adfd64a3cc3e2c92a05 |
| Revival Rotation V3 | 7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14 |
| Revival Rotation V4 not-found rules | 6761337dfcd0847226ee7baad84db0a9c496760a |
| Thread-first rule | e79707587914edb76afca1c32f9f4dad4d0324b7 |
| Navigation preflight | ce8d8be6e07340eff1f0e06d66b762e8ae8da358 |
| Workflow branching map | 756c506780072591b2f48e22044f3368a57bfa7d |
| PWH action queue | b1600366334712f6966f4254a13470a7cd1a018f |
| Task branch graph | 5994a3952fbb0a2bc23aa4b4388c70b979ef1227 |
| Active automation roster | 6b0bf56316fe14bfd2b0e925154025bd8d04eaa1 |

Nadir README blob: fad724045c92fc72666226de22efece481a013f8.  
Nadir CURRENT_WORK blob before this update: 580456956d75c23c871642db3f979d730935b849.  
Nadir INBOX was read; it did not contain the later Enheduanna h853 Jackson/Barckicke separation packet.

The main branch at pre-write inspection was 7322ca9203646c0554db096746f1fac00a0ca1a9. The current branch is main. The current graph remains 18 task records versus 16 declared branches; Tern retains graph authority. PWH WH-05 remains highest overall and blocked by the four occupied Mersearch lanes. WH-02 remains Calder/authorized-maintainer-owned. Neither was touched.

## 2. New result: the printed 12.8 × 10^8 count is consistent with a ten-run aggregate

The primary source is Jackson and Thomas, “Inertial waves emitted by vortex rings translating through a rotating fluid,” Journal of Fluid Mechanics 1029, A47 (2026), DOI: https://doi.org/10.1017/jfm.2026.11199. Relevant source locations are §§2, 3.2.1, 3.4.1, 3.4.2 and 3.5.

The article describes a 149 × 239 velocity grid and 3600 time samples for a frequency-filtered field. It prints an approximate count of 12.8 × 10^8 entries. It also reports ten separate runs for each condition and averages ten angle values at each selected frequency.

Independent source-arithmetic check, using only those published metadata values:

    rows, cols, samples, runs = 149, 239, 3600, 10
    points_per_frame = rows * cols
    entries_per_run = points_per_frame * samples
    entries_across_ten_runs = runs * entries_per_run

Results:

| Quantity | Result |
|---|---:|
| Spatial points per frame | 35,611 |
| Entries in one 149 × 239 × 3600 run array | 128,199,600 |
| Entries across ten same-shaped run arrays | 1,281,996,000 |
| Printed approximation, 12.8 × 10^8 | 1,280,000,000 |
| Difference from printed approximation | 1,996,000, about 0.156% |

The printed order of magnitude is therefore consistent with the aggregate across ten runs, not with one run-level array. This is the most economical reconciliation of the published numbers. The prose does not explicitly say whether the quoted array-entry count includes all ten runs, so the correct classification is **COUNT_SCOPE_AMBIGUITY / TEN_RUN_AGGREGATE_CANDIDATE**, not “paper arithmetic error” and not an author-intent attribution.

This is source-metadata arithmetic, not a physical calculation, fit, or model result. No raw velocity arrays were used.

## 3. Typed count identity and source-configuration boundary

The following quantities must remain distinct:

1. N_raw_frames: camera images acquired.
2. N_PIV_fields: velocity fields produced by the image-pair processing.
3. N_FFT_samples: time samples actually supplied to the FFT.
4. N_runs: independent runs per experimental condition.
5. N_spatial: vector-grid points per field.
6. N_entries_per_run: N_spatial × N_FFT_samples for one run.
7. N_entries_aggregate: the sum across runs, only when the run-level shapes and sample counts match.

The 2025 Warwick thesis by Jackson, WRAP eprint 195731, provides an important source-specific rule in Chapter 5: successive-image PIV processing produces N−1 time steps from N raw images. Its Table 5.5 lists different acquisition configurations:

| Thesis configuration | Plane | Grid | Frame rate | Raw frames |
|---|---|---:|---:|---:|
| Wide-FOV VLS | Vertical light sheet | 111 × 69 | 60 fps | 3600 |
| Narrow-FOV VLS | Vertical light sheet | 239 × 149 | 90 fps | 2800 |
| HLS 3D0 | Horizontal light sheet | 239 × 149 | 150 fps | 3000 |

The JFM article’s 149 × 239, 60 Hz, 3600-sample record combines the narrow-VLS spatial shape (transposed axis order) with the wide-VLS temporal settings. It does not exactly match one Table 5.5 row. It may represent later acquisition, reprocessing, or a distinct configuration. The available sources do not provide the acquisition manifest needed to join these records. This remains an unresolved configuration identity, not a contradiction.

The JFM article separately declares 3600 images and a 3600-sample time axis. The thesis’s N-to-N−1 rule means that 3600 raw images processed as successive pairs would yield 3599 PIV fields. Do not silently equate the article’s FFT sample count with a raw image count. The required join is the run-level manifest: actual raw-frame count, pair policy, dropped-pair ledger, PIV-field count, timestamps, and FFT input count.

The article’s 5.4 TB estimate for the 600 vortex rings summarized there and the thesis’s “just under 16 TB” for the broader project have different stated scopes. They are not treated as conflicting totals.

## 4. Source-custody correction: the Figshare DOI is not the Jackson–Thomas PIV source

The later Enheduanna h853:s2 source audit is already public and verified:

- Issue #1790: https://github.com/Satobloc/HsH/issues/1790
- Published artifact: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/enheduanna-h853-s2-jackson-piv-data-access-20261115t1324z-001.md
- Report: WORKSPACES/ENHEDUANNA/2026-11-15T1324Z_H853_S2_JACKSON_PIV_DATA_ACCESS_AND_BARCKICKE_DOI_SEPARATION.md

That crosswalk separates the Jackson–Thomas JFM article from the distinct Barckicke/Nature candidate associated in earlier workspace material with Figshare DOI 10.6084/m9.figshare.30903347. The JFM article PDF itself contains no Figshare reference and lists supplementary movies. The DOI must not be used as provenance for the Jackson–Thomas raw PIV arrays unless a source-authored link is later established.

The public JFM article and the 2025 thesis are accessible documents, not the raw PIV dataset. The article describes a multi-terabyte processing set and links supplementary movies; no raw run-level PIV arrays, acquisition manifest, calibration covariance package, or custom analysis scripts were retrieved in this run.

## 5. Architecture improvement: count-aware composition gate

This addendum makes one narrow but reusable correction to the existing h811/h849 PIV observation-chain work:

- Raw frame count, PIV vector-field count, FFT sample count, run count, per-run array size, and ensemble aggregate now have separate names and admission checks.
- Raw-frame-to-PIV composition requires an explicit image-pair policy and dropped-frame/pair accounting.
- PIV-to-FFT composition requires the actual vector-field sample count, timestamp sequence, sample rate, window, and any dropped-field record.
- Per-run-to-ensemble aggregation requires a declared run count and a statement of whether arrays are concatenated, processed independently and averaged, or reduced to per-run observables before averaging.
- No 3D composition of VLS and HLS is permitted by analogy. It requires explicit projection maps, common acquisition or validated repeatability/axisymmetry, synchronization, coordinate registration, per-plane calibration, finite-sheet measurement kernels, and propagated covariance.
- The 2 mm laser sheet is an instrumental measurement thickness. It is not evidence for an H(s)H worldtube thickness.

The full source-to-observable chain and earlier test matrix remain in the existing [h849 report](2026-11-15T0924Z_H849_S2_ROTATING_FLUID_PIV_CORE_WAVEFRONT_AND_LEAN_AUDIT.md) and [h811 source map](2026-11-13T1924Z_H811_S2_ROTATING_FLUID_PIV_SOURCE_MAP_AND_LEAN_REPAIR.md). This addendum does not repeat or replace them.

## 6. Formalization and verification status

Existing Lean material was inspected without changing its branch:

- PR #1189: https://github.com/Satobloc/HsH/pull/1189
- Head: 8a6a0c288b0091a19b604ab96f94fec05adcc40e
- Head branch: research/nadir-affine-translation-quotient-20261101t0324z
- Base branch: research/nadir-gpb-joint-covariance-bound-20261027t1312z
- Compare against main: 19,319 ahead / 143 behind.
- State: OPEN / DRAFT / UNMERGED.
- PR scope: Hagalaz framed-sphere composition and affine-translation quotient. Its description explicitly excludes the PIV module from that PR’s scope. No PIV change was made to this branch.

Exact-head Actions run #43783028748, job #133024336601, completed successfully with Lean 4.34.0 / Lake 5.0.0 and a full 8,961-job build. The relevant Nadir projection and PIV modules were **replayed from the CI cache**, not demonstrably freshly recompiled in that run. The log emitted the existing #eval values 3600, 30, 1/60, 6, 12, 18 and 24. Existing #print axioms output includes standard dependencies such as Classical.choice, propext and Quot.sound for some theorems; imageProjection_surjective reported no axioms. Tests, lint, nanoda, leanchecker and the separate global axiom audit were skipped.

The generic factorization-iff-fiberwise theorem is a mathematical condition for a target readout to descend through a projection. It is not a source-specific proof of the PIV acquisition chain. The existing PIV energy module is also an unreviewed sandbox artifact, not empirical validation. No new Lean theorem, PIV-specific module, PR, or branch was created because the actual acquisition maps and source configuration join remain unresolved, and the only suitable existing PR is explicitly Hagalaz-scoped. A PIV-specific formalization should follow, not precede, a source-bound acquisition manifest.

## 7. Test-matrix update and what H(s)H would have to distinguish

| Hypothesis | Shared parameters | Calibration / holdout | Predicted observable | Standard comparator | Falsification threshold |
|---|---|---|---|---|---|
| H0: standard inertial-wave dispersion | Ω, viscosity, piston speed/stroke, geometry, Re/Ro, camera calibration, timebase, PIV settings, filter and correlation choices | Calibrate each acquisition configuration; freeze processing; hold out entire independent runs or a full rotation-rate condition, not random frames | Measured angle from correlation zero crossings versus FFT frequency / rotation frequency | ω = ±2Ω cos θ | Pre-register a residual threshold using the full measurement covariance and multiple-comparison rule |
| H1: H(s)H-distinctive extension | All H0 parameters, plus only independently constrained H(s)H parameters | Same calibration and holdout as H0; no refitting on holdout | A source-derived correction Δ_H to the dispersion residual, or a genuinely additional observable | H0 under the same shared parameters | Compare held-out residuals to the frozen H(s)H prediction using the propagated covariance |
| H2: projection / processing alternative | Per-plane calibration, grid spacing, sheet thickness, timebase, filter window, correlation estimator, zero-crossing selection, run covariance | Independent calibration targets and complete-run holdout; compare defensible processing variants | Stability of θ and energy readouts under calibration and processing uncertainty | Original source pipeline and standard readout | A result that moves within known processing uncertainty cannot be credited as a new physical effect |

For the standard comparison, a convenient normalized residual is r_i = f_i/F_Ω,i − 2 cos(θ_i). An H(s)H extension would need a source-derived, independently constrained Δ_H,i and a pre-registered threshold of the form |r_i − Δ_H,i| > k σ_i, with the full covariance and multiplicity treatment specified before opening holdout results. No numerical k is assigned: raw arrays and the uncertainty/covariance package are absent.

No H(s)H-specific Δ_H mapping from worldtube thickness, twist, or contact surfaces to this PIV observable has been recovered. Those features are not forced by the standard inertial-wave result. They remain optional representational choices until they yield a unique, independently testable held-out observable beyond the standard comparator. The optical 2 mm sheet does not supply that physical interpretation.

## 8. Tool, archive, publication, and project controls

- Mersearch has no callable action in this runtime. All four canonical request lanes remain occupied/requested. No request was overwritten, released, or retriggered. GitHub search was a bounded fallback, not represented as Mersearch.
- HsH, SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES front doors were checked. Repository metadata reports zero forks for all three. HSH_RESOURCES public metadata/private-reference boundary remains unresolved; no private payload was opened.
- Math Hopper issue #578 and PR #991 were checked; the latter remains OPEN / DRAFT / UNMERGED, with its smoke run separate from the full multi-repository pilot. Whirligig Kernel 0 remains sandbox-only. SciSpace is available but was not needed because the primary article and thesis were accessible. No new tool, dependency, fork, subscription, API expenditure, or service cost.
- The local runtime has no repository checkout and no Lean/Lake/Elan/Mersearch executable. Git is installed, but git ls-remote could not resolve github.com. The repository connector was therefore used for the internal write route.
- Existing public records #1781 (Nadir h849 PIV audit) and #1790 (Enheduanna Jackson/Barckicke source separation) remain canonical. The house publisher listens to issues.opened and has no existing-issue amendment route. A new issue would duplicate the existing source-custody subject, so no publisher submission or duplicate issue was created. This report is internal-only.
- P0 Code Grurple remains ACTIVE. P1 Orson cognition remains OVERDUE / NOT READY and Orson-owned. P2 measured geometry remains HOLD. P3 full theory remains INCOMPLETE. FIE next review remains November 24. No paper gate advanced.
- WH-05 remains blocked by the occupied Mersearch lanes. WH-02 remains Calder/authorized-maintainer-owned. No PWH ownership or task was taken.
- The latest unrelated-reading cursor remains Babbage line 2061. No reading quantum was repeated; FIE re-review is not due.

## 9. Next exact cursor

Obtain the Jackson–Thomas run-level acquisition manifest and raw PIV arrays, with:
1. raw frame count and timestamp vector;
2. actual image-pair policy and dropped-pair ledger;
3. PIV field count, grid, interrogation settings and per-run configuration ID;
4. exact FFT sample count, sample rate, window and filter-bank manifest;
5. per-plane calibration transforms and covariance;
6. correlation/zero-crossing implementation and per-run outputs;
7. the author/source link, if any, between the JFM configuration and the thesis Table 5.5 configurations.

Keep the Barckicke Figshare DOI in its separate source lane. After source identity and maps are resolved, create a properly scoped PIV Lean formalization and independently test a source-derived H(s)H correction against the standard inertial-wave comparator. Until then, no P2 selection, physical fit, prediction, or theory promotion.

## 10. Automation and handoff integrity

The existing :36 task remains enabled with task ID 6a9f52b69ec08191b0a2ba24a074f781 and exact original schedule DTSTART;TZID=America/New_York:20261001T143600, RRULE:FREQ=HOURLY. Prompt, phase, ID, schedule, cadence and enabled state were not changed. No sixth task, signet, or conversation rename.

At the latest exact-ID peek, the current run was 5a6af084-02d4-8321-9ab1-ee2065df17fc, scheduled for 2026-11-16T00:36:00Z, started 2026-11-16T01:07:20.966851Z, IN_PROGRESS, completion null, chat_ref null. The task-level latest_result belongs to the prior h863 Mira run e8cbefe9-90d4-832c-83e6-f744d3267d4a, not this Nadir slot.

The next :48 run is Enheduanna h864:s4. Its run 03bc1af0-3560-8332-b632-d33a63c963ff had already started at 2026-11-16T01:13:19.084852Z and remained IN_PROGRESS with chat_ref null at the last peek. No handoff packet was created; no direct-thread delivery, prompt exposure, consumption, comprehension, or acknowledgment is claimed.

**Final pin:** H864:S3 / NADIR-VOSS-RING-LABEL / ENHEDUANNA-NEXT / JFM-COUNT-SCOPE-RECONCILED / TEN-RUN-AGGREGATE-CANDIDATE / RAW-PIV-MANIFEST-MISSING / FIGSHARE-30903347-SEPARATE-BARCKICKE-LANE / PR1189-HAGALAZ-SCOPE-UNMODIFIED / EXISTING-LEAN-BUILD-CACHE-REPLAY / NO-PIV-SPECIFIC-LEAN-PROOF / P0-ACTIVE / P1-OVERDUE / P2-HOLD / P3-INCOMPLETE / FIE-NOV24 / READING-2061 / AUTOMATION-UNCHANGED / NO-SIXTH-TASK.
