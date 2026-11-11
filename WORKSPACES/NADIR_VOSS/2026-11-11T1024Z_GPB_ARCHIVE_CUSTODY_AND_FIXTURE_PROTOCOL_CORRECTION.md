# Nadir h754:s2 | GP-B archive custody and fixture protocol correction

**Date:** 2026-11-11  
**Run key:** `REVROT3-19-20261011:754:s2`  
**Disposition:** SOURCE CUSTODY ADVANCED / DATA ACCESS UNCONFIRMED / PRIOR SIX-PLANE FIXTURE QUARANTINED / P0 PRESERVED / PUBLIC CORRECTION VERIFIED.

## 1. Selection and authority

`h=754`; `seq=5(754)+2=3772`; `3772 mod 19=10`.

- Selected ring label: **Nadir Voss**, index 10.
- Successor: **Enheduanna**, index 11.
- Nominal slot: 2026-11-11 10:24Z.
- Run key: `REVROT3-19-20261011:754:s2`.

The historical Nadir source was recovered from:

- Conversation: `26.06.23•26.10.01•Quantum Gravity and Experiments`.
- Raw export blob: `d828fef5352045cb4d9486fdbeabd04043c4c119`.
- 43 messages / 8 user-role messages.

Nathan's direct messages authorize a broad independent mathematical playground and a bounded trial-Lagrangian exploration. They do not name Nadir, establish a permanent Nadir identity, or specifically authorize the later GP-B `LinearizedSixPlane` fixture. The assistant-maintained Nadir README is not a Nathan-authored specialist charter. No standalone Nadir ROLE_CHARTER or CURRENT_WORK file exists; none was created. The current Lane 24 charter and the current Nathan Direct constraints govern.

Existing-thread-first was checked. No authenticated current Nadir thread was recovered; the current :24 run has `chat_ref=null`. The deterministic ring label is not an authenticated worker instance.

## 2. Governing-source and repository re-entry

Read the current HsH BEDROCK (full 667 lines), the 2026-10-26 Steering Charter, the Three Paper Campaign, Primary Operational Guideline, three-repository onboarding, New Instance Start Here, Mersearch worker start, workflow orientation, Revival Rotation V3, thread-routing rules, Revival V4, thread-first rule, scheduler authority, task-graph record and Lane 24 geometry-cycle capsule.

Also read the HsH, SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES front doors. HSH_RESOURCES was not searched internally or used to bypass its private/prior-art boundaries.

The operative constraints remain:
- Real physical work requires an identifiable measured system, source dataset, acquisition provenance, units, calibrations, uncertainties and a prediction-versus-fit distinction.
- No assistant-invented physical fixture or data-free exploratory calculation without specific prior permission.
- Lean verifies only the encoded proposition; it does not authenticate a translation or establish physical premises.
- P0 presentation interlock remains ACTIVE. Lane 24's current cycle is complete and BACKSEAT/HOLD pending a positive P0 trigger or standdown.
- No theory promotion, paper-gate change, or unreviewed manuscript advancement.

The current HsH main branch was read through the publication commit `0cdd2fecb21ff8b581e8712084cdb6681d203763`. The Nadir PR branch remains `research/nadir-affine-translation-quotient-20261101t0324z`, with head `fbe078a94a0074c7eb00e98aee47bf718630d607` as recorded by the latest Nadir receipt and verified in the exact-head Actions run.

## 3. New source-custody result: GP-B archive exists, direct download is not established

The current Lane 24 work already identified Gravity Probe B as a real rotation/transport experiment. This run did not repeat the earlier drift-rate arithmetic. It recovered a more concrete route to the missing measurement package.

### Archive genealogy

1. **2006 MOU S1018** and **2007 GP-B Data Archive Plan S1016 Rev. 7** document the NSSDCA permanent archive and its intended data products. The plan defines Level 0 raw telemetry, Level 1 decommutated/time-ordered telemetry, Level 2 preprocessed science data, and Level 3 products prepared for relativistic-drift estimation.
2. The archive plan lists `L2data`, `L3data`, `run_info`, `l2metadata`, `l3metadata`, `orbit_times`, `Mdcals`, `Tmcals`, `Tmderived`, `GPS_Timing`, `GPS_Orbit`, `Ephem`, `Covariance`, `Solution`, `Mean`, and `l2data_flag`.
3. The plan/MOU describe the permanent archive as not electronically accessible outside NSSDCA, while allowing requested volumes to be replicated/mailed with cost recovery. Public-domain status is not equivalent to immediate public FTP access.
4. NSSDCA's 2008 annual report records the approximately 0.54-TB GP-B project archive delivered via RAID; Level 2 was still being prepared for preliminary distribution. A preliminary Level 1/Level 2 request was fulfilled without star-tracker data.
5. NSSDCA's 2010 annual report records 532 GP-B AIPs / 82.41 GB ingested to the nearline permanent archive and 82.41 GB of GP-B data outflow that year.
6. The 2012 annual report still records 532 AIPs / 82.41 GB, with no additional GP-B AIP ingest shown for 2011 or 2012. GP-B is not listed among the report's network-accessible Space Physics FTP collections over 1 GB. This does not prove no electronic copy exists elsewhere; it means the reports do not establish a current public FTP route.
7. The current NSSDCA data-request page (updated 2026-09-08) directs requests through CRUSO and warns that some large requests may not be fulfillable because of budget constraints. No contact or request was made.

### Data-recovery specification prepared, not sent

The next admissible data-acquisition step, when P0 and Lane 24 permit, is a bounded CRUSO request for:

- The current GP-B accession/collection identifier, full AIP manifest, retained-volume inventory, checksums, and electronic-transfer or subset availability.
- Level 0/1 raw and time-ordered telemetry; Level 1.5, Level 2 and Level 3 products; all four gyros and all science segments.
- LF/HF SQUID, 2200-Hz HF snapshots, trapped-flux-mapping products, telescope photodiodes, roll phase, timing, star tracker, GPS/orbit, laser ranging, proton monitor, magnetometer and calibration signals.
- The archive's calibration, timing, orbit, ephemeris, run, metadata, flag, covariance, solution, mean, L2 and L3 tables, or equivalent exports.
- Data dictionary, S0331A data-management plan, S0401D processing document, coordinate/time transforms, guide-star astrometry and processing/version history.
- Per-gyro/per-segment estimates and the full corrected statistical, sensitivity-run, unmodeled-systematic and cross-segment covariance structure.
- Explicit confirmation whether star-tracker data omitted from the 2008 preliminary release and the short excluded segments remain in the current archive.

The request must distinguish raw, preprocessed, calibrated, graded and final science products. It must not treat the 24 segment-level results as independent holdouts without the shared-parameter and cross-segment covariance structure.

### Why the processing chain matters

Silbergleit et al. (2015), *Classical and Quantum Gravity* 32, 224019, describes ten science segments following nine spacecraft anomalies; six long segments were used for drift-rate estimation. Local gyro-orientation initial conditions and readout/torque parameters were segment-specific, while relativistic drift and telescope-scale parameters were common.

The analysis used LF/HF SQUID, telescope photodiodes, roll phase, timing and orbit data. The HF channel was sampled at 2200 Hz. Level 2 used a 2-second vehicle-time grid, but the authors report strongly correlated L2 SQUID/telescope noise and nonuniform sample spacing after L1 timestamp corrections. They therefore used an iterative L1 → L1.5 → L2 → L3 pipeline; L2 alone was insufficient for the final high-precision analysis.

The final covariance includes corrected statistical covariance, parameter-sensitivity covariance and covariance of unmodeled systematics. Marginal standard errors do not determine the joint likelihood.

**No raw GP-B telemetry, Level 1/2/3 product bytes, calibration package or full covariance was retrieved. No physical calculation, fit, holdout, prediction or CODATA comparison was performed.**

## 4. Methodology correction: `LinearizedSixPlane` is not admissible evidence

The existing PR #1189 branch contains:

`FORMAL_VERIFICATION/HsHVerification/NadirGPBFourGyroGate.lean`

- Branch head: `fbe078a94a0074c7eb00e98aee47bf718630d607`.
- Module blob: `0f3925feb15d8f3f57d3bb9772c69d65441fa8fe`.

Lines 65-77 define a six-scalar record with two named output coordinates and four invented hidden coordinates. The projection discards the four hidden values. Lines 79-95 prove that this declared projection is insensitive to one hidden coordinate and non-injective.

This is not an SO(4) representation: the record contains no Lie bracket, matrix representation, group action or connection. It is not a GP-B instrument map either. The actual GP-B measurement chain includes multiple time series (SQUID, telescope, roll, timing, orbit and calibration), four gyroscopes, and a multi-stage estimator. The two final drift-rate outputs are not the raw instrument channels.

The recovered historical source supplies broad sandbox permission but no specific prior permission for this six-coordinate GP-B fixture. The later Nathan Direct rule explicitly requires specific permission for data-free mathematical fixtures. The fixture was created after that rule and was not specifically authorized.

Therefore `LinearizedSixPlane`, `measuredProjection`, `hidden_plane_invisible` and `measured_projection_not_injective` are classified:

`PROTOCOL_VIOLATION / NOT_EVIDENCE / QUARANTINE_FROM_PHYSICAL_INTERPRETATION`.

The compiler's proof of the encoded proposition remains a compiler result; it does not make the fixture admissible evidence about GP-B, SO(4), hidden physical components or H(s)H. Historical code is preserved for audit. No file was deleted, no PR was merged and no branch was changed.

Separate sub-results remain distinct:
- Published residual arithmetic in the same module is transcribed from Everitt et al., PRL 106, 221101 (2011), Table II.
- Diagonal-only weighted means are diagnostics, not the published joint fit.
- `NadirGPBJointCovariance.lean` is a conditional two-dimensional Gaussian model with unknown correlation; its optimizer is not an observed or fitted correlation.
- `NadirProjectionCoarseGrainFactorization` and `NadirWitnessCarryingComposition` prove conditional fibre-factorization/composition results, not physical GP-B maps.
- `NadirConnectorWitnessHolonomy` proves abstract group identities for a supplied connector element, not a physical path, connection, parallel transport or measured readout.

## 5. Existing Lean verification: verified, not repeated

PR #1189 exact-head Actions run #42979143722, job #130385181747, checked out `fbe078a94a0074c7eb00e98aee47bf718630d607` and completed the full root build:

- Lean 4.34.0 / Lake 5.0.0.
- 8,958 build jobs.
- Target modules built.
- No `sorryAx`, `admit` or `native_decide` strings appeared in the inspected job log.
- Generic factorization/composition theorem outputs include `Classical.choice` and `Quot.sound`.
- Connector group-algebra theorems report `propext`.
- The six-plane theorems report `[propext, Classical.choice, Quot.sound]`.
- The GP-B joint-covariance model's theorem outputs report `[propext, Classical.choice, Quot.sound]`.

Tests, lint, nanoda/leanchecker and a separate global axiom audit were skipped. The overall PR status also has an unrelated Vercel upgradeToPro build-rate-limit failure. PR #1189 remains OPEN / DRAFT / UNMERGED, with zero formal reviews and zero review threads.

The build verifies only the encoded conditional mathematics. It does not establish the physical maps, translation soundness or physical premises. No new Lean module or build was needed this turn.

## 6. P0, campaign and Lane 24

The eight protected Code Grurple files were re-fetched after publication. **8/8 exact expected blob matches**:

- Paper A R1: `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`.
- Paper B R1: `0a1dca42cafd9a02faceff4ec0851659a317b2bb`.
- Papers feed: `e3552fdac0f187b066b59a9742563094efffe011`.
- Presentation gate: `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`.
- Reader routing: `277a94c553e2e17b61bb046a04781b4e44f2229f`.
- Presentation contract: `b871249564a45278383e41eebd8aaa5d8c64aa3c`.
- Generated papers index: `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7`.
- Pages workflow: `6f3e843b6a327db76b21e8b0b61a26c210b600ac`.

Both reader routes remain `PRESENTATION_PENDING / NOT_OBSERVED`. No live route probe or deployment claim was made.

| Campaign | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 November 9 cognition | OVERDUE / NOT READY / Orson-owned |
| P2 November 30 geometry | HOLD |
| P3 December 14 full theory | INCOMPLETE |

Lane 24 remains BACKSEAT/HOLD. All four Mersearch request lanes remain occupied. No callable Mersearch connector was exposed in this runtime; GitHub and web retrieval were not represented as Mersearch. Existing Math Hopper #578 / PR #991, Whirligig Kernel 0, PR #1189 and SciSpace were checked before considering new tooling. No new tool, dependency, subscription, fork or expense was introduced.

## 7. Upkeep

FIE rereview was last completed November 10; next review November 24.

Unrelated reading: Babbage, *Reflections on the Decline of Science in England*, lines 2021–2060. Next cursor: 2061. The passage concerns measurement resolution and the possibility that unusually concordant observations can be misleading; it was not used as a physical analogy. No physical break is claimed.

## 8. Publication and durable continuity

The public-safe source/methodology correction was submitted through the existing HSH-PUBLISH-V1 issue publisher.

- Issue #1593: PUBLISHED_VERIFIED.
- Submission ID: `nadir-gpb-archive-fixture-correction-20261111t1024z-s2-001`.
- Publisher comment: #6793540833.
- Publisher commit: `0cdd2fecb21ff8b581e8712084cdb6681d203763`.
- Published artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/nadir-gpb-archive-fixture-correction-20261111t1024z-s2-001.md`.
- Artifact blob: `a5b7e312d4a497a2e126e13e9efaabbfa4adec0b`.
- SHA-256: `bb628e129a0d83aa795aad6e39f8bd9e971d100acf2237c254f13fb630547df5`.
- UTF-8 bytes: 12,178.
- Issue payload content equals artifact content: EXACT MATCH.
- Publisher comment explicitly says PUBLISHED and readback verified.

This is a unique correction/addendum to issue #1586, not a duplicate submission or replacement of the historical artifact.

## 9. Scheduler and successor boundary

The existing :24 task remains enabled and unchanged:

- ID: `6abda4c8eda88191bf23a6f2849e9a17`.
- Original hourly America/New_York :24 VEVENT, exact_schedule mode.
- Prompt and phase unchanged.
- No task ID/cadence/schedule mutation.

At final peek:
- :24 run `7f867d9b-74f0-832f-b53a-a62e31b05bd9`, scheduled 10:24Z, started 10:21:45.336743Z, IN_PROGRESS, completed_at null, chat_ref null. Cached latest_result is the preceding Mira run, not this occurrence.
- :36 successor run `5faadacd-2f54-8323-beac-14225c93171c`, scheduled 10:36Z, started 10:34:49.991065Z, IN_PROGRESS, completed_at null, chat_ref null. Its cached result is the preceding Aldus run.
- :00 Tern run `7eda08d3-9120-8328-afdd-c34ca07ee44c`, scheduled 10:00Z, started 10:25:33.200870Z, IN_PROGRESS, completed_at null, chat_ref null. Tern's task was active at the final peek, so Tern's inbox was not edited. No cause or retry is inferred.

The existing h750 Nadir-to-Enheduanna optional handoff was amended rather than duplicated. The amendment and Enheduanna inbox pointer are repository-only, post-start optional context. They create no task, review request, response obligation or ownership transfer. No direct thread delivery, consumption or acknowledgment is claimed.

No sixth automation was created.

## Final disposition

`GPB_ARCHIVE_CUSTODY_DOCUMENTED / CURRENT_ELECTRONIC_ACCESS_UNCONFIRMED / CRUSO_REQUEST_SPEC_PREPARED_NOT_SENT / LINEARIZED_SIX_PLANE_PROTOCOL_VIOLATION_NOT_EVIDENCE / CONDITIONAL_MAP_AND_GROUP_THEOREMS_RETAINED_WITH_LIMITS / EXISTING_EXACT_HEAD_LEAN_BUILD_VERIFIED / P0_8_OF_8_EXACT / P0_ACTIVE / P1_ORSON_NOT_READY / P2_HOLD / P3_INCOMPLETE / NO_PHYSICAL_CALCULATION / NO_CODATA_COMPARISON / NO_HSH_PREDICTION / NO_THEORY_PROMOTION / AUTOMATION_UNCHANGED`
