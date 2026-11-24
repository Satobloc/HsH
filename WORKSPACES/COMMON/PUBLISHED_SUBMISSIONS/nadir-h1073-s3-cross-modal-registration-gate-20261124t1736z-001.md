# H1073:S3 - Cross-modal registration gate for vortex observables

**Run key:** REVROT3-19-20261011:h1073:s3  
**Nominal UTC slot:** 2026-11-24T17:36:00Z  
**Routing:** Nadir Voss, ring index 10. Next label: Enheduanna, index 11. These are deterministic routing labels, not authenticated ChatGPT instances or threads.  
**Lane:** 36, architecture, workflow and prediction.  
**Repository snapshot:** HsH main observed at 490e331 (2026-11-24T17:41:28Z); formal work remains on the existing Nadir sandbox PR branch.

## 1. Authority and source custody

The recovered 2026-06-23 to 2026-10-01 raw conversation export is stored in HsH with blob SHA `d828fef5352045cb4d9486fdbeabd04043c4c119`. Its 2026-10-01 direct assignment names Ravel as the original :36 finite-core/worldtube lab and authorizes theorizing, invention and derivation while requiring source/invention separation and forbidding target-fitting old magic numbers or particle labels. That historical Ravel remit is not a Nadir Voss charter. The export contains no Nadir Voss identity or standalone Nadir specialist charter; the Nadir workspace role description is assistant-maintained, not historical authority. The current user-supplied 19-person ring and Lane 36 charter are the operative instructions for this run.

The historical export is not an authenticated current Nadir thread. No current Nadir thread was authenticated. Work was performed in the current scheduled context; no cross-thread delivery, acknowledgment or consumption is claimed. Nadir Cycle 08 remains complete and on hold; Cycle 09 was not started.

The Mersearch action is not callable in this runtime. The four existing request lanes remain occupied; lane 2 has a manifest and receipt but no release, while lanes 1, 3 and 4 lack complete manifests/receipts. No request was overwritten or retriggered. Direct GitHub source retrieval was used as a limited fallback, not represented as a Mersearch run. HSH_RESOURCES root documentation was read; no private payload was opened.

## 2. New source reconciliation

Primary source: Barckicke, Falcon and Gissinger, "Kelvin wave propagation along vortex cores", Nature Physics 22, 409-414 (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w), published 2026-02-10. Source data are identified by [Figshare DOI 10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347). The data files, raw arrays and file checksums were not downloaded or inspected in this run.

The apparent camera-count conflict can be narrowed. The Methods describe a Basler side-view camera normal to the vortex axis, with two lens configurations, plus a separate top-view Phantom V1840 camera for PIV. The Results refer to two orthogonal cameras in the m=1 handedness discussion. These descriptions are compatible at the instrument-inventory level, but the paper does not provide a clock-registration record, spatial-registration transform, common overlap window, or evidence that the PIV camera is the same second view used for the handedness check. No 3D triangulation or synchronized cross-view reconstruction is established.

Source-reported acquisition channels:

| Channel | Source-reported support | What it measures | Current admission |
|---|---|---|---|
| Side-view contour | Basler 2064 x 1564; 60 micrometres/pixel; typical contour/core uncertainty about 0.1 mm; 300 fps for 30 s | Left/right core contours, then displacement eta(z,t) and radius a(z,t) | Within-view paired samples only when the same acquisition, frame and axial sample are authenticated |
| PIV | Separate top-view Phantom V1840; 6000 fps for 0.1 s; 37 x 23 grid; 2.7 mm spatial resolution | Azimuthal velocity and circulation Gamma; reported delta-Gamma about 0.005 m^2/s | Cross-modal window join blocked until clock and spatial registration evidence exists |
| PTV | Particle tracking along the core; reported delta-v_z about 0.05 m/s | Vertical velocity v_z | Cross-modal join blocked until its acquisition and registration lineage is explicit |
| Long PDF streams | Radius: 100 fps for 10 min. Displacement: 360 fps for 3 min. Each stream is sliced over 1000 axial samples in 2.5 cm and concatenated | Separate marginal distributions | Not a paired eta-a time series; no joint covariance or phase relation without sample-level alignment |

The 300 fps side-view record supports the source's same-frame left/right contour construction. The separate 100 fps and 360 fps PDF streams have different temporal support and are concatenated across axial slices. They cannot be treated as paired samples merely because they belong to the same experiment. PIV and PTV are additional measurement channels, not automatically synchronized extensions of the contour record.

The earlier description of a camera-count discrepancy is therefore superseded by a more precise classification: **instrument inventory is reconcilable; cross-view timing, spatial registration and sample-level correspondence remain unverified.**

The source-to-observable composition is now stated explicitly:

- Fluid configuration and boundary -> side-view optical image -> left/right contour samples -> displacement eta(z,t) and radius a(z,t) -> Fourier spectra.
- Fluid velocity field -> top-view PIV images -> calibrated velocity vectors -> circulation Gamma.
- Tracer trajectories -> PTV processing -> vertical velocity v_z.
- The three branches may be joined at window level only after clock and spatial registration; sample-level covariance or phase analysis additionally requires a sample-alignment record tied to those exact registrations.

The corresponding H(s)H chain would have to be: H(s)H finite-core geometry -> a source-derived fluid-response law -> predicted centerline, cross-section and velocity fields -> the same instrument projections and calibration maps -> held-out observables. The measurement projections are partly documented; the H(s)H-to-fluid response law and its composition with those projections are not. This is the missing model edge, not a license to invent a response equation.

## 3. Shape hierarchy and H(s)H implications

The measured fluid object has a finite core in ordinary continuum fluid mechanics. Its time evolution can be represented as a spacetime history, but that fact is not an H(s)H-specific prediction and the experiment does not reconstruct a full 4D support.

The source distinguishes two geometric degrees of freedom:

- m=1: helical displacement of the vortex-core axis with approximately constant core radius. This is a centerline/axis deformation.
- m=2: a double-helical radius modulation without corresponding axis displacement. This is a cross-section/boundary deformation.

This distinction matters for a finite-core H(s)H representation: centerline deformation and cross-section deformation must not be collapsed into one undifferentiated twist variable. They are separate candidate readouts. The experiment does not by itself establish an H(s)H normal-bundle twist, a new contact law, a new contact surface, or a particular 4D support dimension.

The live H(s)H Kelvin-vortex mechanism remains a tentative operative hypothesis under BEDROCK, not a mere analogy. However, the classical Kelvin/Rankine fluid model is the standard comparator, not evidence that the H(s)H mechanism is already validated. No source-defined forward map from H(s)H geometry to the measured contour, PIV or PTV channels has yet been supplied.

## 4. Substantive architecture improvement: two-tier cross-modal admission

The existing Nadir within-view sample-key gate admits the two opposing side-view contour radii only when their sample identities match. Its source comment explicitly leaves cross-view fusion to a separate registered-view contract. This run added that missing contract on the existing Nadir PR branch.

New module: `FORMAL_VERIFICATION/HsHVerification/NadirVortexCrossModalJoinGate.lean`  
Existing PR: [#1189](https://github.com/Satobloc/HsH/pull/1189)  
Branch: `research/nadir-affine-translation-quotient-20261101t0324z`  
Latest branch commit: `b7db224151f9339c9b89f17543b5c73daba5d707`

The new type-level gate separates:

1. **Window-level cross-modal join.** Requires the same run identity, explicit source/target clock IDs and time windows, a nonempty overlap window, explicit source/target coordinate frames, calibration IDs and spatial regions, a nonempty overlap region, evidence references, and externally supplied validation flags. Different cameras, lenses and acquisition IDs are permitted; equality of camera identity is not required.
2. **Sample-level join.** Requires a separate sample-alignment record bound to the exact window-join ID and to the same clock- and spatial-registration evidence references. Source and target sample IDs and an alignment evidence reference must be present, with an external validation flag.

The module encodes the intended rejection rules: no window join without clock and spatial registration, same-run identity and matching evidence fields; no sample-level join without sample-alignment evidence bound to the exact window join and registration records. These are proposed theorem statements, not verified results, because the first exact-head build exposed elaboration failures.

The Boolean external-check fields are ingestion attestations. Lean proves only that the gate requires those flags and matching identifiers. It does not validate the actual clock transform, camera calibration, spatial registration, evidence contents, dataset provenance or physical interpretation. No synthetic acquisition fixture or physical data were instantiated.

This is an architecture/schema improvement, not a new physical model. It prevents a same-run label from being mistaken for synchronized, spatially registered or sample-paired evidence.

## 5. Test matrix and prediction boundary

| Observable | Standard comparator | Shared/calibrated quantities | H(s)H status | Holdout and failure condition |
|---|---|---|---|---|
| eta(z,t), m=1 | Source's Kelvin/Rankine vortex description | Measured core scale and instrument calibration | No forward map from H(s)H centerline geometry | Hold out a complete acquisition; require a preregistered residual outside the standard nuisance and uncertainty envelope |
| a(z,t), m=2 | Source's finite-core/Rankine description | Measured a0 and contour calibration | No forward map from H(s)H cross-section geometry | Hold out a complete acquisition; require a non-absorbed radius-mode residual |
| Dispersion spectra | Source Eq. (1) long-wavelength hollow-core limit; Eq. (2) finite-core Rankine model with uniform vertical flow | a0 measured; Gamma and v_z fitted to Eq. (2), then checked a posteriori against PIV/PTV | No H(s)H dispersion equation or parameter map | A new independent run is needed; the paper's fit plus a posteriori check is not a blind holdout |
| PIV velocity/circulation | Standard Rankine/Kelvin fluid model | PIV calibration and reported delta-Gamma | No H(s)H map to azimuthal velocity | Require registered time/space support and an independent held-out acquisition |
| PTV vertical velocity | Standard uniform-vertical-flow parameter in Eq. (2) | PTV calibration and reported delta-v_z | No H(s)H map to v_z | Require registered time/space support and an independent held-out acquisition |
| Joint eta-a-PIV/PTV relation | Standard coupled fluid model, with measured channel covariance | Same-run identity plus clock, spatial and sample registration | Candidate discriminator not yet predicted | Joint covariance/phase test remains blocked until sample-level alignment and raw data are available |

A distinctive H(s)H result must not be merely a refit of the standard dispersion relation. Its predicted difference must survive the measured nuisance parameters and instrument maps. In particular, a proposed H(s)H residual that can be absorbed by changing Gamma, v_z, a0, calibration or registration is not independently identifiable in this experiment.

The source reports typical measurement uncertainties but the raw data and joint covariance were not retrieved. No numerical sensitivity rank, covariance-weighted distance, fit, prediction or falsification threshold was calculated. The next empirical step is to freeze one exact source-data bundle, preserve its acquisition/timebase/calibration provenance, and split by whole acquisition or independent run rather than randomly splitting correlated frames.

## 6. Lean status

The prior exact-head build [#45284099363](https://github.com/Satobloc/HsH/actions/runs/45284099363) succeeded on the earlier PR head `9e563ee330c8bdbdcf16f746eb1baff931751677` and covers the prior within-view sample-identity and two-channel readout modules only. It does not cover the new cross-modal gate.

The exact-head Actions run [#45452881326](https://github.com/Satobloc/HsH/actions/runs/45452881326) checked out commit `a2de6a48570a3e756c0d94e0f97fa28db43b6b9e` under Lean 4.34.0 / Lake 5.0.0 and failed in the new module. The first error was failure to synthesize `Decidable` for the window-admissibility proposition; downstream goals then remained unsolved, and the recovery log reported `sorryAx` for affected declarations. The authored source contained no explicit `sorry` or `admit`; the `sorryAx` came from Lean's error recovery after elaboration failed. Tests, lint, leanchecker, nanoda and the global axiom audit were skipped.

A narrowly scoped correction was committed at the existing branch head `b7db224151f9339c9b89f17543b5c73daba5d707`: the two assembly definitions are now explicitly noncomputable with classical decidability, and the proof blocks use the corresponding classical context. Exact-head Actions run [#45453990100](https://github.com/Satobloc/HsH/actions/runs/45453990100) is now in progress for that corrected head; no compile result is available yet. The corrected module therefore remains `SUBMITTED_NOT_VERIFIED`; do not treat any new theorem as compiled or proved.

PR #1189 remains open, draft and unmerged. No rebase, merge, theory promotion or main-branch formalization write was made.

## 7. Boundaries and next cursor

- P1 remains overdue, frozen and Orson-owned. P2 remains HOLD; no physical system was selected. P3 remains incomplete. No paper gate advanced.
- FIE review was completed 2026-11-24; next 14-day review is 2026-12-08. The unrelated-source break is next due 2026-11-28; neither was due in this run.
- PWH deep-review timing and queue authority remain Tern-owned. The latest Nadir h1069 reconciliation verified four completions after Tern h1066:s2 and did not verify the fifth. Later h1070-h1072 receipts exist, but this run did not reconcile the cross-task run ledger. No PWH review, counter reset or ownership change was made; the existing Tern optional packet remains the continuity pointer.
- No SAT-O or Blockwave equation was changed. No corrected canonical equation or new canonical symbol was issued. The external fluid equations remain standard-comparator source equations.
- No physical calculation, data reanalysis, numerical prediction, fitted parameter, or threshold was produced.
- No new tooling, fork, subscription or paid service was introduced. Existing PR #1189 was extended; Math Hopper and Whirligig were not modified.
- No direct-thread handoff, acknowledgment or consumption is claimed. The next ring label is Enheduanna; any repository-only optional context remains nonbinding.
- Existing task ID `6a9f52b69ec08191b0a2ba24a074f781` remains enabled with its original hourly America/New_York :36 schedule and Worldtube phase. No task mutation or sixth task occurred. No signet or conversation rename occurred.

**Next cursor:** inspect exact-head run #45453990100 for corrected branch head `b7db224...`; if it succeeds, inspect every new theorem's `#print axioms`, then run the skipped global axiom audit, tests and lint where available. If it fails, correct only the demonstrated error in the existing branch and obtain another exact-head run. Do not rerun or cite the failed `a2de6a...` build as verification. Only after the gate compiles should actual clock/spatial transforms be implemented from real acquisition metadata. Keep the H(s)H geometry-to-observable map open until a source-derived model supplies it.
