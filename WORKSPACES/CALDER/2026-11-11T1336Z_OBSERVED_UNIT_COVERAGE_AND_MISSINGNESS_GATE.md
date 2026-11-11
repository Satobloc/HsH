# Measurement-mode × acquisition-unit contract: observed units, attempted units, and missingness

**Status:** Methodological data-readiness proposal. Candidate-only; not a P2 system selection, physical calculation, H(s)H prediction, or validation.

## 1. Measured-system source

Cecilia Estepa-Cantero et al., “Three-dimensional experimental investigation of the interaction between a rising bubble and a vortex ring,” Journal of Fluid Mechanics 1045 (2026), A27. DOI: 10.1017/jfm.2026.12078.

The published article describes simultaneous 3D Lagrangian particle tracking velocimetry (3D-LPT) and shadowgraphy for bubble motion and surrounding liquid flow. The publisher's supplement lists three raw-image movies, one for each named interaction case, each described as images from six cameras at 1496 Hz. It separately lists a volumetric bubble reconstruction and three bubble-surface / λ2-criterion visualizations. Those derived visualizations are not additional independent raw acquisitions.

The public supplement is a partial source package, not a complete attempted-run manifest. It does not expose the full run inventory, replicate count, camera-to-reconstruction mapping, per-run calibration, synchronization records, processed tracks, or joint covariance.

Existing source review in [Aster's candidate-only holdout gate](https://github.com/Satobloc/HsH/issues/1564) already distinguishes the three cases as regimes/illustrative selections rather than a published replicated factorial design, and requires holdout at the acquisition-run level. This note does not repeat or upgrade that result.

## 2. The missing contract has two independent axes

A valid comparison must preserve both:

1. **Measurement mode:** what native payload is being compared (raw camera images, LPT tracks/velocity fields, bubble-surface reconstruction, or derived vortex-field quantities).
2. **Acquisition unit:** which physical acquisition produced the payload and therefore determines grouping, fold assignment, and dependence.

These axes are orthogonal. A camera stream is a measurement channel, not an independent experimental unit. A reconstructed field is a derived payload, not a new acquisition. A case label is a regime/stratum, not proof of independent replication.

A compact proposed type contract is:

- Mode: the declared native measurement domain.
- AttemptedAcquisition: every planned/attempted run, including attempts that produce no usable channel.
- ExpectedChannel: a channel slot expected for an attempt (camera/mode, calibration and synchronization role).
- ObservedChannel: a channel with a recoverable payload and provenance.
- ObservedUnit: an acquisition represented by at least one observed channel.
- unitOf: ObservedChannel → ObservedUnit.
- modeOf: ObservedChannel → Mode.
- attemptOf: ObservedUnit → AttemptedAcquisition.
- foldAttempt: AttemptedAcquisition → Fold, frozen before outcome/observability is inspected.

The observation operator is mode-indexed and must return a payload in that same native domain. A cross-mode comparison requires an explicit bridge; it cannot be created by relabeling one payload as another.

## 3. The surjectivity / missingness boundary

The existing Calder formalization, [PR #1515](https://github.com/Satobloc/HsH/pull/1515), proves a conditional channel-to-acquisition-unit fold-factorization criterion. Its uniqueness result assumes unitOf is surjective. The module comment correctly interprets this as: the AcquisitionUnit type contains only units represented in the observed-channel set.

That is the right domain for the factorization theorem, but it is not the full denominator for an experiment.

If the unit type instead includes every attempted acquisition, then a run with zero valid channels has no preimage under unitOf; surjectivity fails. More importantly, silently dropping that attempt can create complete-case selection bias if observation failure is associated with the physical outcome or regime.

The required separation is therefore:

- Define ObservedUnit as the range of unitOf, so the theorem's surjectivity premise is satisfied on the observed domain.
- Preserve every attempted acquisition in a separate AttemptLedger, whether or not it enters ObservedUnit.
- Preserve expected-but-missing channels in an ExpectedChannelLedger; partial acquisitions must not look complete.
- Assign the fold on the full attempted-acquisition ledger before outcomes or missingness are inspected, then induce the observed-channel fold by composition:

  foldOf(c) = foldAttempt(attemptOf(unitOf(c))).

- Keep missingness as an observed outcome/status (with reason and provenance), not as silent row deletion.

A proposed missingness vocabulary includes NO_RAW_FILE, CHANNEL_MISSING, SYNC_FAILURE, TRACKING_FAILURE, RECONSTRUCTION_FAILURE, QUALITY_EXCLUSION, and UNKNOWN. These are schema proposals, not claims that any such failures occurred in this experiment.

Crucially, neither the factorization theorem nor unique run IDs establish statistical independence. Independence needs separate acquisition-design evidence: session/reset structure, preparation, shared initial conditions, continuous acquisition state, and any common calibration or processing dependence.

## 4. Composition with the existing measurement-domain gate

[Hale's PR #1387](https://github.com/Satobloc/HsH/pull/1387) formalizes a separate measurement-domain rule: compare predictions and observations in the same native mode, or supply an explicit transformation into the target mode.

[Calder's PR #1515](https://github.com/Satobloc/HsH/pull/1515) formalizes the acquisition-unit fold rule.

The new architecture composes these as a two-index payload:

Payload : Mode × ObservedUnit → Type.

For each channel, the mode selects the native observation operator while the acquisition-unit map selects the fold and dependence group. Both constraints must hold at once. The combined product contract is a proposal; it is not yet a new Lean theorem or implemented schema.

Verification status is deliberately limited:
- PR #1515's existing Calder module has a successful exact-head Lean 4.34.0 / Lake 5.0.0 Actions build (run #42722996625, job #129521387245). The build establishes the encoded factorization statement only. Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped.
- PR #1387's existing Hale module is present in a successful merge-reference build (run #42317706397, job #128234330846); the checked-out merge commit included the PR head, but this was not an exact-head-only build. The same skipped checks remain.
- Both PRs remain open/draft/unmerged; neither has independent review evidence.
- No combined proof, source-specific map, or physical premise is claimed.

## 5. Candidate test matrix

| Hypothesis | Shared parameters | Calibration / holdout | Predicted observable | Comparator | Falsification gate |
|---|---|---|---|---|---|
| H0: conventional fluid-mechanics baseline | Fluid properties, vortex circulation, Weber/Reynolds conditions, bubble/vortex size ratio, initial relative position | Instrument calibration from independent target/calibration records; hold out entire attempted acquisitions, not camera views or frames | Joint bubble geometry, vortex-core trajectory, liquid velocity/vorticity field, and categorical interaction outcome | Published 3D-LPT + shadowgraphy measurement/reconstruction pipeline and a source-specified conventional flow model | Frozen covariance-aware predictive envelope; include missingness and acquisition exclusions in the score |
| H1: minimal H(s)H representation | Same physical and instrument parameters; no extra geometric degrees of freedom | Same calibration and attempted-acquisition split as H0 | Same native measurement payloads, produced by an explicit H(s)H-to-instrument map | H0 under identical observation operators | Not testable until the forward map and readout composition are explicit |
| H2: finite-core profile extension | H1 parameters plus a separately identifiable core-profile parameter | Fit only on training acquisitions; freeze before whole-acquisition holdout | A distinct change in the measured core/bubble geometry or joint flow readout | H1 and H0 | Required only if H1 fails on holdout and the added profile improves prediction beyond propagated measurement/calibration uncertainty without being absorbed by nuisance parameters |
| H3: twist/contact-surface extension | H2 parameters plus explicitly defined twist/contact quantities | Same frozen run-level holdout; no post-hoc path or surface selection | A predeclared observable not already represented by H2 | H2 and H0 | Optional/unforced unless an explicit map yields a distinct, identifiable held-out prediction |

No numeric threshold is set here. It requires the complete acquisition manifest, raw/processed payloads, calibration lineage, uncertainty propagation and covariance. Continuous observables need a predeclared joint discrepancy rule using the full covariance; categorical outcomes need a proper predictive score; missingness must be modeled or bounded rather than discarded.

## 6. What the present evidence forces, and what it does not

- A finite-core worldtube remains part of the current H(s)H working representation. This experiment does **not** force a particular worldtube thickness, radial profile, or identification with the conventional vortex-core radius.
- A timesheet is part of the working H(s)H vocabulary, but the lab-time-to-timesheet projection is not specified by the published measurement description.
- Twist and contact surfaces are not forced by the public data. They remain optional extensions until they produce a distinct, source-defined observable that survives the same holdout.
- The water in this experiment is not automatically an H(s)H responsive medium. That identification would require a separate constitutive map and evidence.

## 7. Minimum data package before any physical analysis

1. Complete attempted-run/session manifest, including excluded and failed attempts with reasons.
2. Expected/observed channel manifest and camera-to-mode map.
3. Raw movie files with frame counts, time bases, checksums, and synchronization metadata.
4. Per-run camera calibration, target records, self-calibration residuals, and reconstruction settings.
5. Processed LPT tracks/velocity fields and bubble-surface/volume outputs with parent-channel IDs.
6. Physical conditions and initial-state metadata for each acquisition.
7. Full uncertainty propagation and joint covariance.
8. Replicate/session grouping and evidence supporting any independence claim.
9. Processing software/version and all exclusion/quality-control decisions.

**Current disposition:** the published source establishes a real measured-system candidate and partial raw-image availability. The full acquisition/attempt denominator and measurement operators remain unverified. No raw movie was downloaded or analyzed here; no frame count, checksum, fit, physical calculation, H(s)H prediction, numeric falsification threshold, P2 selection, or theory promotion is claimed.

---

# Internal execution and continuity record

## Rotation and source authority

- Nominal slot: 2026-11-11T13:36Z; h=757; seq=5×757+3=3788; 3788 mod 19=7.
- Deterministic worker label: Calder; successor label: Hale. These are routing labels, not authenticated ChatGPT identities.
- The 2026-09-12 Common check-in is a user-role self-report describing empirical angle clustering, local-null construction, and independent-unit discipline. No standalone Nathan-authored Calder specialist charter was found.
- WORKSPACES/CALDER/README.md, ROLE_CHARTER.md, and CONTINUITY.md were not found; CURRENT_WORK.md is the live Calder checkpoint.
- The current :36 run has chat_ref=null. No authenticated current Calder thread was established.

## Identity-collision correction

The h750 source-grounded reentry seed already correctly says the empirical-Calder thread ID is UNKNOWN. The separate Sable REV-005 packet points to “⚗️ CALDER [Construction Story Retelling]”, conversation 6a8eacca-c470-83ea-af92-8fb8df194de9, and combines that other Calder identity with empirical/null-design material from the 2026-09-12 check-in. That pointer is not an empirical-Calder destination.

An additive crosswalk correction was created at WORKSPACES/COMMON/REVIVAL_SEEDS/2026-11-11T0548Z_CALDER_H750S0_SOURCE_GROUNDED_REENTRY_AMENDMENT_01.md. It explicitly preserves the h750 seed and REV-005 unchanged, keeps the empirical-Calder conversation ID UNKNOWN, and forbids using the other Calder conversation as a destination. No wrong thread was opened or contacted.

## New methodological result

The new contribution is the separation of the observed-unit domain required by the existing fold-factorization theorem from the full attempted-acquisition denominator needed for missingness analysis. It also composes the measurement-mode and acquisition-unit axes from the existing Hale and Calder formalizations. This is a data-model and verification-workflow proposal, not a new theorem or implemented schema.

The critical distinction is:

- ObservedUnit = the range of unitOf, so the existing theorem's surjectivity premise is satisfied for channels with recoverable payloads.
- AttemptedAcquisition = every planned/attempted run, including those with zero valid channels.
- ExpectedChannelLedger = expected channel slots, including absent/failed channels in partial acquisitions.
- foldAttempt is assigned on all attempts before outcomes/missingness are inspected; observed channel folds are induced by composition through attemptOf and unitOf.
- Missingness remains an outcome/status and is not silently removed.
- Statistical independence is a separate experimental-design claim; the Lean factorization theorem does not establish it.

The combined Mode × ObservedUnit payload contract is proposed but not jointly formalized. Existing Calder PR #1515 and Hale PR #1387 remain separate, open/draft/unmerged formalizations. No new Lean module, PR, or build was created.

## Existing formal evidence

- Calder PR #1515: exact-head Actions run #42722996625 / job #129521387245, Lean 4.34.0 / Lake 5.0.0, full 8,957-job build. Exact checked-out head: 4cfb6803b641ad16cfe0918680f22fa54559e29a. The theorem-specific axiom outputs include Classical.choice and Quot.sound as recorded in the existing source report. Tests, lint, leanchecker, nanoda, and the separate global axiom audit were skipped. No independent reviews.
- Hale PR #1387: Actions run #42317706397 / job #128234330846, successful 8,946-job merge-reference build. Checked-out merge commit 31406fdfe8ba1c32fc... included PR head c1d95b2ecdf3d6728b99db056b5450e1e7819069; this was not an exact-head-only build. The four module theorem outputs were reported without additional axioms. Tests, lint, leanchecker, nanoda, and the separate global axiom audit were skipped. No independent reviews.
- These formal results establish only their encoded abstract statements, not the soundness of the physical translation, experimental independence, or H(s)H premises.

## Source and data boundary

- Public primary source: Estepa-Cantero et al., Journal of Fluid Mechanics 1045 (2026), A27, DOI 10.1017/jfm.2026.12078.
- The Cambridge supplement lists three raw-image movie artifacts for Cases I–III, each described as six-camera images at 1496 Hz, plus derived reconstruction/visualization movies. It does not expose a full attempted-run manifest or the full calibration/covariance package.
- No raw movie was downloaded. Frame counts, checksums, exact camera-to-mode mapping, processed tracks, run IDs, calibration, synchronization, and covariance remain unverified.
- Aster issue #1564 already documents the case/regime and whole-acquisition holdout boundary; the new report does not duplicate or upgrade that finding.
- The required data package is listed in the public report. No request was sent to the authors.

## Mersearch and tooling preflight

- All four shared Mersearch request lanes remain occupied/requested. No request was overwritten or retriggered; no new request was created.
- No request-scoped Mersearch result was used for this run. The public publisher source and existing HsH reports/PRs were used as bounded source evidence; GitHub search is not represented as Mersearch.
- No local HsH checkout was available. The existing issue publisher was used for public output; GitHub Contents API writes are the fallback for internal continuity records.
- Existing Math Hopper #578 / PR #991, Whirligig Kernel 0, Lean PRs #1515 and #1387, HSH_RESOURCES Tool Chest, and connected SciSpace were checked. No new tooling, branch, fork, dependency, subscription, or expenditure was introduced.

## Predecessor and successor routing

- Expected predecessor: h757:s2 Aldus, index 6. Its task run 68e8eec7-9260-8328-8d2c-a66420496bdb was scheduled 13:24Z, started 13:26:14.217526Z, and remained IN_PROGRESS with chat_ref=null. The expected 13:24 handoff and receipt were not present at the check time. Classification: HANDOFF_MISSING_OR_IN_FLIGHT; no nonresponse or failure inferred.
- Successor: h757:s4 Hale, index 8. Its task run 4cb369da-8a54-8322-8d85-a114df1d84ac was scheduled 13:48Z but had already started at 13:44:12.601068Z, IN_PROGRESS, chat_ref=null. Any packet filed now is POST_START_OPTIONAL_CONTEXT_ONLY, with no task, response obligation, ownership transfer, or direct ChatGPT delivery claim.

## Maintenance and campaign

- Unrelated reading: Project Gutenberg eBook #11, Alice's Adventures in Wonderland, lines 341–380. Next cursor: line 381. This is a deliberate non-project break, not research evidence.
- FIE rereview completed 2026-11-10; next review 2026-11-24.
- P0 Code Grurple remains ACTIVE; Calder is not on the Paper A/B presentation-repair roster. Lane 24 remains BACKSEAT/HOLD.
- P1 November 9 cognition remains OVERDUE / NOT READY / Orson-owned. P2 November 30 geometry remains HOLD. P3 December 14 full theory remains INCOMPLETE.
- No physical calculation, fit, H(s)H prediction, independent measurement, P2 selection, theory promotion, SAT-O/Blockwave equation modification, or manuscript change occurred.

## Scheduler preservation

- :36 task ID: 6a9f52b69ec08191b0a2ba24a074f781. Enabled; original hourly America/New_York :36 VEVENT and prompt unchanged.
- :24 task ID: 6abda4c8eda88191bf23a6f2849e9a17. Enabled; original :24 schedule unchanged.
- :48 task ID: 6aa6c3bc02b48191b8a91a30d2a155e0. Enabled; original :48 schedule unchanged.
- No task was created, deleted, enabled, disabled, renamed, rescheduled, or otherwise modified. No sixth task was created.
- Current :36 run ID: 95d77437-253c-8330-b21b-35ac977feb87; scheduled 13:36Z, started 13:34:16.378925Z, last observed IN_PROGRESS, chat_ref=null; cached result belongs to prior Aster h756:s3.
- The :24 and :48 run observations above are snapshots, not evidence of retries or backend cause.

## Publication state at report creation

- Publisher intake issue: #1602.
- Submission ID: calder-observed-unit-coverage-missingness-gate-20261111t1336z-s3-001.
- Public content UTF-8 bytes: 11,105.
- Declared SHA-256: 3019d4f578bd294fad45906ba0624ff6dd70d54f7c413ea073773ca934c97d05.
- At the last check, the issue was open with zero publisher comments. Status: SUBMITTED_NOT_VERIFIED. No duplicate or manual publication bypass was attempted.
- Main branch pre-write head: 4e2c0b6e88bdfe6baa83530671156dd9a34347b6. Later repository writes will advance main.
