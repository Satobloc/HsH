# Mercer h888:s3 Amendment 03 | Kelvin-vortex two-axis identifiability crosswalk

**Status:** additive measurement-architecture clarification to the already published h888:s3 note.  
**Run key:** REVROT3-19-20261011:888:s3 (continuation/readback amendment; not a second run).  
**Scope:** instantiate the existing two-axis identifiability/discrimination contract on the Kelvin-vortex observation chain. No physical calculation, new measurement, H(s)H prediction, or theory promotion.

## 1. Why this amendment is needed

The h888:s3 note correctly states the structural condition for a deterministic observable to descend through a measurement map: the target must be constant on every exact fiber of that map. That is a **structural identifiability** condition. It does not by itself establish practical recoverability from finite, noisy observations, or discrimination between H(s)H and a standard comparator.

Aldus h867:s3, public issue [#1820](https://github.com/Satobloc/HsH/issues/1820), already separates two evidence axes:

- **Axis A, within-model identifiability:** MAP_INCOMPLETE, STRUCTURAL_NONIDENTIFIABILITY, LOCAL_RANK_DEFICIENT, PRACTICAL_UNIDENTIFIABILITY, IDENTIFIABLE_AT_DECLARED_SCOPE.
- **Axis B, between-model discrimination:** PREDICTION_NOT_FORMED, UNSCORABLE, NONDISCRIMINATING_AT_DECLARED_RESOLUTION, CALIBRATION_ONLY_SEPARATION, HOLDOUT_DISCRIMINATED, model rejection, or JOINT_MISFIT.

This amendment applies that existing taxonomy to the measured Kelvin-vortex candidate. It does not create a competing gate or alter P2's E-D-F-R admission structure.

## 2. Scope-sensitive Axis A classification

Every status names the exact map and admitted domain. The two-point subchannel must not be confused with the complete experiment.

| Object / scope | Status | Established | Not established |
|---|---|---|---|
| Final paired readout L:(r0,rπ) ↦ (η,a), with η=(r0-rπ)/2 and a=(r0+rπ)/2 | IDENTIFIABLE_AT_DECLARED_SCOPE | The inverse r0=a+η, rπ=a-η makes this a bijective reparameterization of the two sampled radii. | It does not reconstruct the unsampled contour or prove upstream camera/contour maps injective. |
| Antipodal sampling P2:r(θ) ↦ (r(0),r(π)), restricted to the paper's single-harmonic radial ansatz | STRUCTURAL_NONIDENTIFIABILITY for the mode label | The existing conditional Lean result gives the m↔m+2 alias for this two-sample channel. Distinct mode labels can have the same paired readout. | This does not establish non-identifiability of the complete experiment, which may use additional image, spectral, PIV/PTV, or other information. |
| Full source-to-instrument-to-observable chain for an H(s)H target | MAP_INCOMPLETE | The h888 note identifies the stages and the missing H(s)H-to-laboratory forward map. | No full H(s)H observable has been shown to factor through the actual measured channels. |
| Local nuisance-adjusted sensitivity of a proposed H(s)H parameter | NOT_ASSESSED | No candidate-specific Jacobian, nuisance-response range, or measured reference point was supplied. | No local-rank or local-separation result is claimed. |
| Practical identifiability for the actual Kelvin dataset | UNSCORABLE / not assessed | The paper reports instrument and contour uncertainty scales. | The exact Figshare version/file inventory, raw bytes, acquisition IDs, calibration records and paired-channel covariance were not retrieved. Marginal uncertainty values do not determine the joint likelihood or practical identifiability. |

**Important interpretation:** the structural alias belongs to the declared two-point subchannel under the stated ansatz. It is not a criticism or refutation of the paper's full m=1/m=2 experimental separation. The remaining camera, contour, spectral, PIV and PTV paths must be mapped before their information can be credited or ruled out.

## 3. Axis B classification for H0 versus H1

| Question | Current state | Reason |
|---|---|---|
| Has H(s)H formed a source-authorized forward prediction through a complete measurement map? | PREDICTION_NOT_FORMED | The H(s)H geometry-to-laboratory map and candidate-specific observable remain undefined. |
| Can the candidate comparison be scored? | UNSCORABLE | Raw acquisition package, paired covariance, calibration lineage and an independent whole-run holdout are unavailable in this review. |
| Are H0 and H1 nondiscriminating at the instrument's declared resolution? | Not established | Neither a frozen H1 predictive distribution nor the required joint uncertainty model is available. |
| Has either model been rejected or discriminated on holdout? | No | No held-out prediction or score was performed. |

Do **not** substitute NONDISCRIMINATING_AT_DECLARED_RESOLUTION for UNSCORABLE. Missing predictions and missing covariance do not demonstrate overlap. Likewise, the two-point structural alias does not by itself show that the full H0/H1 experiment is nondiscriminating.

## 4. Corrected operational sequence

1. Retrieve the exact Figshare dataset version and file inventory; preserve raw bytes, checksums, acquisition IDs, calibration files, analysis scripts and provenance.
2. Resolve the full source-to-instrument chain for each camera/view, contour, PIV and PTV channel, including units, coordinate frames, clock/synchronization, calibration and uncertainty.
3. State the admitted state domain and any gauge/quotient convention. Test the exact fiber-constancy condition for each proposed H(s)H observable on the actual channel claimed to identify it.
4. Only with a justified model and real observations, assess local sensitivity after nuisance projection. A local full-rank result is not a global injectivity proof.
5. Assess practical identifiability with the actual likelihood/profile and calibrated covariance. Do not assume missing channel correlations are zero or replace unknown covariance with a diagonal approximation.
6. Freeze matched H0/H1 parameters, calibration, model versions, observable operators, decision rule and a genuinely independent whole-acquisition holdout before unblinding. Set a numerical falsification threshold only from the actual uncertainty model and predeclared decision procedure.

This ordering prevents a mathematically valid decoder on a restricted channel from being mistaken for practical recoverability, and prevents parameter identifiability within H1 from being mistaken for discrimination against H0.

## 5. Existing proof and verification boundary

Existing PR [#1189](https://github.com/Satobloc/HsH) contains the relevant conditional mathematics:

- NadirVortexTwoChannelReadout.lean: exact invertibility of the paired (r0,rπ) ↔ (η,a) readout and the conditional antipodal m↦m+2 alias under the declared radial ansatz.
- NadirProjectionCoarseGrainFactorization.lean: an induced map on Set.range P exists uniquely exactly when the downstream composite is constant on every fiber of P.
- NadirWitnessCarryingComposition.lean: two-stage composition with intermediate image witnesses.

The three module blobs at current PR head 8a6a0c288b0091a19b604ab96f94fec05adcc40e are byte-identical to their blobs at the last successful exact-head build commit 4d426c45a9782a409bf049d5ff65a3c7896f8261. Exact-head Actions run [#43314038015](https://github.com/Satobloc/HsH/actions/runs/43314038015) succeeded with 8,960 build jobs under Lean 4.34.0 / Lake 5.0.0.

The **current full PR head** is later than that verified commit and has not been independently built in this review. The unchanged module blobs retain the cited prior exact-head evidence; this amendment does not claim a fresh build of the current PR head. Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped in the cited run.

Lean establishes only the formalized map/fiber statements. It does not verify the paper-to-instrument translation, source bytes, actual dataset, covariance, physical premises, or an H(s)H correspondence. No new theorem was needed for this workflow crosswalk, and no new Lean run was triggered.

## 6. BEDROCK compatibility and physical status

BEDROCK's real-data-first rule remains controlling: no invented fixture, data-free numerical calculation, fit, covariance propagation or physical prediction was performed. The Kelvin experiment remains a standard-fluid-mechanics measured-system candidate, not H(s)H validation.

BEDROCK also retains Kelvin-vortex mechanics, or a demonstrably equivalent mechanism, as an important **last-resort working hypothesis** in the responsive-medium/electrogravity construction. This air-water vortex experiment does not establish that correspondence, but neither does the absence of a demonstrated correspondence delete or reset the existing working hypothesis. A source-faithful map and cross-sector evidence would be required.

No finite 4D worldtube thickness, normal-bundle twist/connection, additional contact surface, or distinct physical timesheet is forced by the present experiment. P2 remains HOLD; no theory or BEDROCK promotion is proposed.

## 7. Provenance and run boundary

- Parent public note: [Mercer h888:s3, issue #1867](https://github.com/Satobloc/HsH/issues/1867).
- Two-axis methodological source: [Aldus h867:s3, issue #1820](https://github.com/Satobloc/HsH/issues/1820), an assistant-authored workflow proposal, not Nathan Direct and not a physical premise.
- Standard experimental source: Barckicke, Falcon & Gissinger, Nature Physics (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w); public data locator DOI [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347).
- No manuscript, renderer, site, route, P0 source, feed, or presentation-policy object was changed. P0 remains ACTIVE with no new route-reentry trigger; P2 remains HOLD.
- No new PR, branch, tool, dependency, subscription, expenditure, task, or automation was created.

## 8. Archive reading cursor

The SAT archive file 000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt was read at lines 1801–1840 (blob f33eb29fbac65efa1db054239bb9c28a04a13a42); next cursor 1841. The passage is an informal language-association game and contains an archived assistant error claiming Assamese is Dravidian and related to Kannada. That historical assistant statement is not authoritative linguistic evidence; the archive was not edited.

**Disposition:** TWO_AXIS_CROSSWALK_ADDED / TWO_POINT_STRUCTURAL_ALIAS_SCOPED / FULL_EXPERIMENT_MAP_INCOMPLETE / PRACTICAL_IDENTIFIABILITY_UNSCORABLE / H0_H1_PREDICTION_NOT_FORMED / NO_PHYSICAL_RESULT / P2_HOLD.
