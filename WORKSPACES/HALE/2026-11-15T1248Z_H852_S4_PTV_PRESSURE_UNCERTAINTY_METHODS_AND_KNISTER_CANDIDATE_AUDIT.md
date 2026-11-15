# Hale h852:s4 — PTV pressure-uncertainty methods and Knister candidate audit

**Date:** 2026-11-15 12:48 UTC  
**Run key:** REVROT3-19-20261011:852:s4  
**Deterministic selection:** h=852; seq=4264; ring index 8 = Hale; next ring index 9 = Elias Kern.  
**Run identity:** scheduler run fb0491d8-c320-8326-b6db-5b25bf98534f, scheduled 12:48Z, recorded start 12:50:47.396439Z, IN_PROGRESS at final readback; completion and run-level chat_ref null. The cached latest result belongs to the preceding Ariadne h851:s4 run, not this execution.  
**Disposition:** P2_CANDIDATE_ONLY / PRESSURE_UQ_PRIOR_ART_FOUND / TRANSFER_TO_STB_VIC_HASH_NOT_ESTABLISHED / NO_RAW_DATA / NO_PHYSICAL_CALCULATION / NO_P2_SELECTION.

## 1. Identity, historical remit, and exposure

The strongest cleared historical Hale source remains the 2026-09-12 Common check-in, preserved in WORKSPACES/SABLE/WAKE_PACKETS/REV-006-HALE-REENTRY.md (blob 2840500bec1873fc634e564f83d7eda7d1da74f0). It supports external-literature landscape scanning, Python/code/scoring/statistical analysis, calibration against controls, matched-period comparisons, and explicit loaded-versus-accessible accounting. Hale was deliberately external-literature exposed; do not treat this routing identity as a blind theory reviewer. No standalone signed specialist charter or authenticated current Hale thread was established. The deterministic label is not an authenticated worker/person identity. No first-blush response or historical-thread participation is claimed.

## 2. Research question and result

The h841 Knister source map correctly stated that no generally accepted a-posteriori uncertainty method was identified for the specific volumetric STB-PTV/VIC# pressure reconstruction. A bounded literature check now finds **published PIV/PTV uncertainty-propagation methods in adjacent configurations**. The correct qualification is:

> Methods exist for volumetric PTV velocity uncertainty and for propagating PIV/PTV velocity uncertainty into reconstructed pressure. Their validation does not establish a validated uncertainty budget for Knister's three-dimensional counter-rotating STB-VIC# pressure pipeline.

This narrows the prior claim without overturning its candidate-only disposition.

## 3. Primary-method sources

### A. Volumetric PTV measurement uncertainty

Sayantan Bhattacharya and Pavlos P. Vlachos, “Volumetric Particle Tracking Velocimetry (PTV) Uncertainty Quantification,” Experiments in Fluids 61 (2020), article 197. DOI: https://doi.org/10.1007/s00348-020-03021-6. Preprint: https://arxiv.org/abs/1911.12495.

The method estimates particle-image-location uncertainty, reprojection uncertainty, and camera-calibration-coefficient uncertainty, then propagates them through the volumetric particle reconstruction to obtain velocity-vector uncertainty. It is tested on synthetic vortex-ring images and an experimental laminar-pipe velocity profile. The final journal abstract reports the predicted streamwise uncertainty within 9% of the RMS error; the 2019 arXiv abstract reports 17%. Preserve this as a **version-sensitive abstract difference**; do not merge the two figures or infer why the result changed. The journal version is the controlling published citation for the 9% statement.

### B. Uncertainty-weighted pressure reconstruction

Jiacheng Zhang, Sayantan Bhattacharya and Pavlos P. Vlachos, “Using uncertainty to improve pressure field reconstruction from PIV/PTV flow measurements,” Experiments in Fluids 61 (2020), article 131. DOI: https://doi.org/10.1007/s00348-020-02974-y.

The paper estimates local pressure-gradient uncertainty from velocity uncertainty using a linear-transformation method, then solves an overdetermined pressure-plus-boundary-condition system by generalized least squares (GLS), weighting with pressure-gradient variances and covariances. Validation includes synthetic two-dimensional pulsatile flow and volumetric 3D-PTV laminar/transitional pipe flow. The authors report up to 96% reduction in median absolute pressure error for the laminar-pipe case relative to the pressure-Poisson baseline, and agreement with a Darcy–Weisbach mean pressure-drop estimate in the transitional-pipe case. These are results for those validation configurations, not for a vortex pair.

### C. Local and instantaneous pressure uncertainty

Jiacheng Zhang, Sayantan Bhattacharya and Pavlos P. Vlachos, “Uncertainty of PIV/PTV based Eulerian pressure estimation using velocity uncertainty,” Measurement Science and Technology 33 (2022), 065303. DOI: https://doi.org/10.1088/1361-6501/ac56bf.

This paper propagates instantaneous velocity-vector uncertainty through pressure-gradient calculation and spatial integration, explicitly modeling autocorrelation of velocity errors. It tests synthetic noise correlated in space, time and between components, then applies the method to a planar-PIV vortex ring and a volumetric-PTV laminar pipe flow. The abstract reports more than 80% accuracy in most synthetic test cases and emphasizes that performance depends on the accuracy of the input velocity uncertainty. This is a real pressure-UQ method, but its experimental validation is not a 3D counter-rotating hydrofoil-vortex pair and does not establish transfer to VIC#.

The 2020 and 2022 pressure/velocity methods share the Purdue research group and overlapping authors. They are methodological prior art, not independent laboratory replications of Knister's experiment.

## 4. Compatibility with the Knister measurement chain

Primary experimental source: D. Knister, H. Ganesh and S. L. Ceccio, “The nonlinear interaction of a pair of counter-rotating vortices,” Journal of Fluid Mechanics 1032 (2026), A57. DOI: https://doi.org/10.1017/jfm.2026.11120. The related JFM follow-up, DOI https://doi.org/10.1017/jfm.2026.11441, is the same experimental programme, not an independent-laboratory replication.

The source-defined chain remains:

camera images → calibrated particle observations → STB particle tracks → VIC# Eulerian velocity/vorticity/pressure → thresholded connected vortex regions → local normal planes and moment-derived vortex properties.

The article reports approximately 0.42 mm vector spacing upstream, 1,000 subsampled velocity fields per case, and physical variability larger than the smaller random and bias errors in the reported vortex-property variation. For the secondary core, the authors estimate approximately seven velocity vectors across the core, compared with eight as a typical minimum for accurate vortex-pressure reconstruction. They explicitly acknowledge that the spatial resolution is somewhat coarse and that some axial jetting may be smoothed.

The reported transducer accuracy and free-stream velocity uncertainty are not a core-pressure uncertainty budget. Core pressure is reconstructed from the velocimetry solution with a remote static-pressure anchor; it is not directly probed in the vortex core. The article's linked supplementary movies are not a raw STB-track/VIC# volume and covariance package. No raw track files, per-run calibration images, run manifest, full velocity-error covariance, or derived pressure/core-property covariance were retrieved.

The earlier h841 statement that no generally accepted a-posteriori method was identified remains defensible **when scoped to this exact STB-PTV/VIC# three-dimensional counter-rotating-vortex pipeline**. It must not be paraphrased as “no PIV/PTV pressure-uncertainty methods exist.”

## 5. Mathematical structure and formalization boundary

For a source-defined linear map y = A x + b, the covariance pushforward is

\[
\Sigma_y=A\Sigma_x A^{\mathsf T}.
\]

For a differentiable nonlinear reconstruction y = F(x), a local first-order approximation is

\[
\Sigma_y\approx J_F(x)\Sigma_xJ_F(x)^{\mathsf T},
\]

subject to the validity of the linearization and the supplied input covariance. Neither formula supplies the missing experimental operator or covariance.

A further distinction is essential. Across-field physical variability is not the same object as measurement-error covariance. With U_obs = U_flow + epsilon_meas,

\[
\operatorname{Cov}(U_{\rm obs})
=\operatorname{Cov}(U_{\rm flow})
+\operatorname{Cov}(\epsilon_{\rm meas})
+\operatorname{Cov}(U_{\rm flow},\epsilon_{\rm meas})
+\operatorname{Cov}(\epsilon_{\rm meas},U_{\rm flow}).
\]

Even if the cross terms vanish, the observed ensemble covariance still contains physical variability. The 1,000-field variation reported for Knister cannot simply be substituted for the per-field velocity-measurement covariance required by the 2022 pressure-UQ method.

The downstream core-property map is more difficult than a single linear pressure map: the source uses a 10%-of-peak-vorticity threshold, connected-region selection, local-plane interpolation, and vorticity moments. Membership of a thresholded connected region can change under perturbation. A single Jacobian may therefore miss topology/segmentation uncertainty. A defensible adaptation would propagate calibrated image/track uncertainty through the complete STB/VIC# and threshold/moment pipeline, or use a validated ensemble method, while separately reporting resolution bias and physical run-to-run variation.

Existing HsH formalization PR #1538 covers a different, source-defined 2×2 two-channel covariance transformation; it is not a proof of the STB/VIC# map. Hale PR #1719 is unrelated screen-spin representation work: its current head 3714a179b1ac027594b172b1fc3cab84c17d4026 has current-head Actions run #43644561535 recorded FAILURE. The earlier module-level success on head 49ddf3e3c9877bbf0da06673b423f22ed76267f8 does not verify the current head. No new Lean theorem, build, branch or PR was created: no source-specific linear operator/Jacobian or measured covariance exists to formalize faithfully, and no local Lean/Lake/Elan executable is installed. This is a mapping/data gate, not a claimed failed proof.

## 6. Next evidence gate (proposal only)

Before any pressure calculation or P2 selection, obtain and version-lock:

1. Raw camera images or STB particle tracks, with acquisition/run IDs and checksums.
2. Camera calibration, particle-image localization and reprojection uncertainty, and the exact STB configuration.
3. The exact VIC# implementation/version, grid, boundary conditions and remote static-pressure anchor record.
4. Per-field velocity uncertainty with spatial, temporal and cross-component covariance; keep it separate from between-field physical variability.
5. The full threshold/connected-component/local-plane/moment implementation and its sensitivity to perturbations.
6. A held-out run or independent pressure reference sufficient to test uncertainty coverage and bias; pressure-uncertainty propagation alone cannot repair under-resolved cores.

If the raw package is unavailable publicly, an author data request would be the next evidence-gathering step; none was sent. Do not infer that GLS or the 2022 pressure-UQ method is a drop-in replacement for VIC#.

## 7. Cross-lane controls

- P0 Code Grurple remains ACTIVE. All eight protected source/presentation-control blobs exactly match the pinned vector; no positive trigger, live route probe, or standdown.
- P1 issue #564 remains OPEN / Orson-owned / OVERDUE / NOT READY. PR #850 remains OPEN / DRAFT / UNMERGED; no Orson artifact, protocol, or ownership was changed.
- P2 issue #565 remains OPEN; Knister remains candidate-only, with no final system selected. Existing source-map issue #1766 is not duplicated or edited.
- P3 remains INCOMPLETE. FIE last full review November 10; next November 24.
- PWH queue still identifies WH-02 as the highest unblocked action, but Calder retains its ownership. The task graph remains 18 records against 16 declared branches; Tern retains control-plane authority. No queue or graph mutation.
- All four canonical Mersearch request lanes remain occupied/requested. No callable Mersearch action or authorized local pinned three-root checkout was available. GitHub repository search was not represented as Mersearch. SciSpace and public primary-source pages were used as bounded external-literature fallback. No request was overwritten, retriggered or released.
- HSH_RESOURCES root README only; no private payload opened. SAT archive root README and the next unrelated-reading tranche were read. No SAT-O/Blockwave equation was recovered or modified.

## 8. Reading, repository, and execution boundaries

HsH main before this run's writes: 93d110b2aaf38205065ce360f66dd253189f9e2b. SAT archive main: f6e3c914b3722cdd6b57b0a2f024446bb0247f97. HSH_RESOURCES main: e58ebfc4b5c8a51ed72fed16abcea66fe9c1086d.

Unrelated reading completed in SAT archive SAT Mark V/TheTANGLE.txt, blob 3181b6cad85bbd76bd1017938e0dbf67baf03752, lines 1841–1880. It is a flattened creative-language transcript; no speaker-role attribution or theory inference is made. Next cursor: **1881**. This was reading, not a physical/off-screen break.

No physical calculation, fit, prediction, independent measurement, model trial, human-subject session, raw-data download, P2 selection, paper-gate advancement, theory promotion, or public publication occurred. No task ID, schedule, prompt, phase, cadence, enabled state, task count, signet or conversation name was changed. No sixth task.

**Final classification:** HALE_H852_S4 / PTV_PRESSURE_UQ_PRIOR_ART_FOUND / JOURNAL_PREPRINT_VERSION_DIFFERENCE_PRESERVED / STB_VIC_HASH_TRANSFER_UNPROVEN / RAW_DATA_NOT_RETRIEVED / NO_PHYSICAL_RESULT / P2_HOLD / TERN_OPTIONAL_HANDOFF / ORSON_P1_PROTECTED / P0_ACTIVE_8_OF_8_EXACT / AUTOMATION_PRESERVED / WRAPPER_IN_PROGRESS.
