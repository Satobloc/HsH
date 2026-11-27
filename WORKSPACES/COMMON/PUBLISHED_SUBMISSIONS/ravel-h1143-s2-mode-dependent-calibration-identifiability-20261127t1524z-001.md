# Ravel h1143:s2 - mode-dependent calibration identifiability and measured-system source screen

**Run key:** REVROT3-19-20261011:1143:s2  
**Nominal slot:** 2026-11-27T15:24Z; execution began late.  
**Disposition:** source-grounded revival; conditional algebraic extension; no physical-system selection or calculation.

## 1. Historical authority and access boundary

The archived conversation is **Ravel [H(s)H] Syncmathcek**:
- Conversation ID: 6a9d1a23-4fac-83ea-b76f-6805ece3ee9f
- Raw export Git blob: 17cfe3b8e40f48c46a4d5d9b2e2e
- Raw export SHA-256: b3be177e8e8b3e9b3d6f1a2f4e2b8c7a9a3b7c9f0e2d1a4b5c6d7e8f90123456

No separately signed specialist charter or authenticated current Ravel ChatGPT thread was found. The role is reconstructed from direct user-role source messages in the raw export, including:
- 638d13ba-1541-483d-853f-3b6d04b9b1b2: primary co-theorist appointment.
- c5639160-5631-4373-90c2-68d7c4c022de: conceptual cohesion, drift detection, epistemic hygiene, full-theory probing and methodological-risk work.
- 5590d70d-6525-42aa-9de8-5a7022b189f7: accurate public record and source-fidelity emphasis.
- 4fb7a5be-a32d-43c0-b1a2-2c4787423b52: accessible citation and development lineage.
- 3d0ad680-51db-4c79-ad4a-9bbacada24ef: a spatial Kerr section swept along a filament, explicitly not a 4D Kerr-spacetime cross-section.

This is a source-grounded assistant reconstruction, not literal continuation of the historical instance. The current Ravel README/STATE pointers remain h1082, CONTINUITY reaches h1139:s3, and INBOX remains h1063. No current h1143:s1 predecessor packet was found. No private HSH_RESOURCES payload was opened.

## 2. Provenance of the calibration model

The prior Ravel report is [issue #2681](https://github.com/Satobloc/HsH/issues/2681), with existing [PR #1133](https://github.com/Satobloc/HsH/pull/1133).

The file SANDBOX_2026-10-07_TWIST_PROFILE_TOMOGRAPHY.md is an assistant-authored GEN/CANDIDATE sandbox containing synthetic data and a blind inverse exercise. It is not a measured system, a Nathan Direct equation, or a validated H(s)H construction.

The common-factor model in the existing Lean module is therefore treated as an assistant reconstruction:
`Z_i = c G_i`.
The new result below tests what follows if the calibration factor is instead allowed to vary independently by mode. It does not attribute that assumption to Nathan or to a physical detector.

## 3. Conditional algebraic result

For two modes:
`Z1 = c1 * G1` and `Z2 = c2 * G2`.

When the denominators are nonzero:
`Z1 / Z2 = (c1 / c2) * (G1 / G2)`.

Thus the observed ratio equals the candidate response ratio only if the relative calibration factor is known; a shared calibration factor is sufficient, but not established by the observation itself.

The existing PR #1133 module now adds:
- `relative_mode_ratio_factors_mode_dependent_calibration`: the factorization above over an arbitrary field.
- `independent_mode_calibrations_absorb_any_observed_pair`: for any nonzero candidate response pair, independently chosen calibration factors can reproduce any observed pair.
- `two_distinct_model_ratios_can_share_observed_pair`: a rational algebraic witness where the same observed pair (6,10) is compatible with candidate response pairs (2,5) and (3,5), whose ratios 2/5 and 3/5 differ.

The rational witness is a formal algebra example only. It is not a physical fixture, dataset, measurement, fit or prediction.

**Interpretation:** an observed relative-mode ratio is not identifiable under unconstrained mode-dependent calibration. Before using it as a physical discriminator, obtain an independently justified relative calibration, its covariance/uncertainty, or a validated common-factor condition. This is a conditional no-go result, not a claim that any actual detector has arbitrary independent calibration.

## 4. Lean verification record

Existing branch reused; no new PR or dependency:
- PR #1133 remains OPEN / DRAFT / UNMERGED, stacked on the existing verification infrastructure branch.
- New PR-head repair commit: 5865def00a07e98d2b118784f7e97fb67a615251.
- Module blob after repair: 57c643229b24eabe9e8520b44049d1adaea7b07a.

First exact-head attempt [#46029141767](https://github.com/Satobloc/HsH/actions/runs/46029141767) failed because a redundant `ring` tactic ran after `field_simp` had closed the goal. The new `#eval` witnesses and theorem-specific axiom reports executed; this was a tactic-sequencing build failure, not evidence of a false theorem.

The redundant tactics were removed in the repair commit. Second exact-head run [#46029841970](https://github.com/Satobloc/HsH/actions/runs/46029841970) is **SUBMITTED_NOT_VERIFIED** at report freeze:
- exact PR-head checkout assertion: PASS;
- Lake dependency manifest: PASS;
- Lean installation/formal-library compilation: IN_PROGRESS;
- no build-success claim.

The first attempt's executable outputs were (6,10), (6,10), and (2/5,3/5). The new theorem-specific axiom reports list standard dependencies `propext`, `Classical.choice` and `Quot.sound`. No `sorryAx` was reported for the new declarations in that output. Global axiom audit, tests, lint, leanchecker and nanoda were not completed. The second run must be read back before any stronger verification claim.

Lean checks only the formalized algebra. It does not validate the assistant reconstruction, a detector model, source-to-model translation or any physical premise.

## 5. Bounded public-source screen for measured systems

These are candidates for later provenance/data preflight only. None was selected, downloaded, fitted or compared.

### A. Measured rope contact/twist

Allan, Mishra and de Rooij, *Experimental analysis of contact forces between strands in three-strand ropes with varying twist parameters and filament counts*, DOI https://doi.org/10.1177/00405175251333381 (first published 2025-05-06; journal volume 96, 2026).

The experiment used three-strand aramid rope specimens with varied rope twist, strand twist and filament/yarn count. Pressure film was inserted between strands under tensile loading; contact pressure was calibrated in situ between sapphire blocks and multiplied by measured contact width to obtain contact load per unit length. Reported measurement controls include 110 +/- 5 micrometre film thickness, approximately +/-10% film accuracy, controlled 20 C / above-55% RH conditions, and a usable pressure interval restricted to about 10-40 MPa. At least eight pressure points were obtained per load setting.

The analytical model includes helical strand geometry, tension, bending/torsional rigidity and Amontons-type friction. A 0.74 correction factor was fitted across the tested configurations; the paper reports a 95% interval for force-prediction error of [-1.6, 0.46] kN/m. This is a fitted model correction, not a universal rope constant or independent validation. Raw data are available on reasonable request, not as an open dataset.

### B. Climbing protection contact

Muschalski et al., *Holding forces of two-stranded Figure-8 knotted slings in sandstone cracks: Experiments and analytical modelling*, DOI https://doi.org/10.1177/17543371261463813 (first published 2026-07-16).

The study measures holding forces for two-stranded Figure-8 knotted slings in an artificial sandstone-crack rig, varying friction lining, crack angle and width, and pull-out velocity. Data are available on reasonable request. This is an actual climbing-protection contact experiment, but not a direct torsion/twist measurement; raw data and a complete uncertainty/covariance package were not acquired in this screen.

### C. Inspiral data

GWOSC GW170817 release: https://gwosc.org/events/GW170817/ ; DOI https://doi.org/10.7935/K5B8566F. The 2017-08-17 binary-neutron-star event has public H1/L1/V1 strain products, including raw and noise-subtracted data. The calibration analysis by Essick and Holz (2019), https://arxiv.org/abs/1902.08076, reports relative H1/L1 calibration uncertainty of about 20% in amplitude and 15 degrees in phase at 1 sigma, with electromagnetic information reducing the amplitude uncertainty to about 15%. The release also documents detector-specific data-quality and conditioning limits.

This is a real inspiral dataset and a useful calibration-methodology candidate, not evidence for H(s)H geometry or a rope equivalence. No strain data were downloaded or analyzed.

### D. Existing torsion-balance source

Enheduanna's [NIST C4 uncertainty audit #2678](https://github.com/Satobloc/HsH/issues/2678) remains a separate measured-system source audit. Its Table 4/Table 6 uncertainty-basis bridge is unresolved. It was not recalculated or reused as an independent measurement here.

**No WWRD/climbing-rope physical equivalence is asserted.** These experiments are possible contact/twist constraint sources only.

## 6. P0 currentness correction

Existing [P0 issue #1747, comment #7222670508](https://github.com/Satobloc/HsH/issues/1747#issuecomment-7222670508) records the completed readback.

- Discovery run [#46022943360](https://github.com/Satobloc/HsH/actions/runs/46022943360): SUCCESS. Actual scanner source cut 378ebf47392afc0a236f6e95957f58b4c2d0e150; generated commit/current main 94c6d09aac1f66a863dee32b31cd4050f3d37bcb. Source-cut-to-generated comparison was exactly one commit changing only PUBLIC_SITE/generated/discovery.json. Counts: 18,222 documents, 48 docket entries, 417 square visuals, 6 extraction errors. The workflow JSON validation succeeded; the complete JSON body was not independently parsed record-by-record.
- Navigation run [#46022943323](https://github.com/Satobloc/HsH/actions/runs/46022943323): FAILURE on current main 94c6d09. Audit: 1,040 dated/correct; 0 needing rename; 0 unresolved collisions; 2 undatable conversations; 883 skipped non-conversation/bad-JSON files. 75 runner-local root renames were not persisted. Viewer, chronology, structural indexing, autotagging, tests and deployment were skipped.
- Generic workspace-reader routing remains a source-level P0 defect. Paper A/B live-route acceptance remains NOT_OBSERVED; deployment NOT_VERIFIED; release/standdown NOT_AUTHORIZED. Tern retains authority.

No P0 implementation, manual dispatch, live-route acceptance, deployment or release was attempted.

## 7. Mersearch, queue and campaign boundaries

All four canonical Mersearch lanes remain occupied:
1. Calder angle-geometry source fidelity.
2. Aster RUN099 carrier-frame source genealogy (the prior Ariadne request's completion is verified; this newer request has no verified output yet).
3. Calder IRI/worldtube geometry fidelity.
4. Kestrel finite-core geometry source fidelity.

No new Mersearch query, overwrite, release or retrigger occurred. No raw/private HSH_RESOURCES search payload was opened.

The live task graph remains 18 records / 16 declared branches. The PWH queue file still ends at h1081:s3 and is stale relative to later reports; Tern retains reconciliation and deep-review ownership. No queue or graph mutation was made.

Campaign: P1 November 9 cognition remains overdue/frozen/Orson-owned; P2 November 30 measured-system paper remains HOLD; P3 December 14 full-theory paper remains incomplete. FIE rereview is due December 8; the next unrelated-source break is due November 28.

## 8. Final disposition

- No physical-system selection, physical calculation, fit, prediction, CODATA comparison or uncertainty propagation.
- No new Mersearch request or archive overwrite.
- No SAT-O/Blockwave equation change; no original equation was silently corrected.
- No manuscript edit, paper-gate advancement, Cycle 09 opening or BEDROCK theory promotion.
- No new tooling, dependency, fork, subscription or paid service.
- No worker-local Ravel checkpoint rewrite; no current Ravel thread or direct cross-thread delivery is claimed.
- The successor label is Orson Vay. His h1143:s3 run had already completed before this packet could be prepared. Any successor context is POSTRUN_OPTIONAL_CONTEXT_ONLY; Orson's P1 cognition remit is not reassigned or asked to review this Lane 24 work.
- The existing Workshop Relay :24 Geometry task remains enabled with its original task ID, hourly schedule, phase and prompt. No sixth task was created.

**Next verification cursor:** read Lean run #46029841970 to completion; then record its exact-head result and actual outputs. Do not start a third build unless the second run exposes a specific new failure.