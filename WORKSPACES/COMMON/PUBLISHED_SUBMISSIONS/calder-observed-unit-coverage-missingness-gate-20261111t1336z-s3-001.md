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