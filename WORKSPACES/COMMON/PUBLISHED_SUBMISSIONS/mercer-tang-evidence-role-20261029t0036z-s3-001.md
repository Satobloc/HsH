# Mercer :36 | Tang 2023 evidence-role gate

Status: SOURCE-CRITICAL WORKFLOW FORMALIZATION / REAL PUBLISHED SYSTEM / LEAN CI PENDING AT SUBMISSION / NO H(s)H PHYSICAL VALIDATION.

## Primary source and provenance

Tang et al., *Nature Communications* 14, 2941 (23 May 2023), DOI 10.1038/s41467-023-38787-w, two deuterium tracers on a quantized vortex ring in helium II at 1.65 K. The paper reports image-derived projected initial half-separation d_p(0)/2 = 140.6 micrometres. It states that the S2W model reproduces d_p(t)/2 and u_p(t) at the optimal fitted initial radius R(0) = 140.8 micrometres, and interprets their closeness as evidence that the particles were nearly across the ring diameter. The 140.8 micrometre value is a same-event model fit, not an independent prediction of the 140.6 micrometre observation.

The source-data workbook and per-value covariance were not recovered here. Therefore no uncertainty-weighted residual, confidence interval, likelihood ratio, or empirical H(s)H validation is claimed.

## Repository audit

Connected GitHub default-branch searches for 140.6, 140.8, the DOI, and Tang vortex-ring terms found the active reports consistently labeling 140.8 micrometres as fitted/model-fitted. This run found no definite repository mislabel to correct. Duplicate summaries are not independent witnesses.

Shared Mersearch request state was occupied by an existing Indicatrix request and was not overwritten. This is a bounded direct-Git/primary-paper fallback, not a complete three-root Mersearch run and not a new SAT-O/Blockwave source claim.

## Formal proposition

The new Lean module defines:

- QuantityKind = projectedHalfSeparation | ringRadius
- EvidenceRole = imageDerivedObservation | sameEventModelFit | independentPrediction
- TaggedQuantity = rational value in micrometres plus kind and role
- AdmissibleIndependentComparison(prediction, observation) requires independent-prediction provenance, image-derived-observation provenance, and matching quantity kind.

It encodes the source-rounded values 703/5 and 704/5 micrometres and proves five statements:

1. the printed numerical gap is exactly 1/5 micrometre;
2. the fitted radius is not tagged as an independent prediction;
3. ring radius and projected half-separation are distinct quantity kinds;
4. the source pair is not an admissible independent prediction-versus-observation comparison;
5. numerical nearness does not retag the evidence role.

The module is FORMAL_VERIFICATION/HsHVerification/MercerTangEvidenceRole.lean on existing draft PR #897, commit 49bbb9fdf1e08725ea5b15dbb806fabf79561096, source blob bede302dbe796c1afe97e243bb26a76020ef02d0. Root import blob 2659c13c561adf3dc305f4c3776e5418eeb3a53b was read back.

## Epistemic limit and failure discriminator

Lean checks only this encoded source-role workflow. It does not establish that the translation is sound, that S2W or H(s)H is physically true, or that the two printed numbers agree within uncertainty.

An independent H(s)H test would require, before seeing the holdout outcomes: (a) a same-kind observable, (b) a frozen prediction rule and shared parameters calibrated elsewhere, (c) the measurement covariance/uncertainty model, (d) a standard comparator, and (e) a predeclared rejection threshold. A same-event fit or cross-kind numerical proximity fails this gate before residual calculation.

Historical-instance access is not claimed. This is current-assistant work under Mercer's source-identity and retrieval-QA remit. No BEDROCK promotion, automation change, signet, or cross-chat delivery is claimed.
