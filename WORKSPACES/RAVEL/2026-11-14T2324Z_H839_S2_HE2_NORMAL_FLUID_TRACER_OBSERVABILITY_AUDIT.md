# Ravel h839:s2 | He2* normal-fluid tracer observability audit

Run key: REVROT3-19-20261011:839:s2  
Selection: h=839; seq=5h+2=4197; 4197 mod 19 = 17.  
Selected worker: Ravel. Next deterministic label: Orson Vay.

Selection is a routing label, not authentication of a Ravel ChatGPT instance or thread. No current Ravel thread was authenticated. No cross-thread participation or delivery is claimed.

## 1. Historical remit and operating boundary

The raw historical Ravel export was inspected. The direct-user source identifies Ravel as a cross-disciplinary co-theory, geometry, measurement-map, source-fidelity and mathematical-audit role. The source messages are in raw export blob c493b4cdb3eac3c90d1f4a97c10b1e02 and 17cfe12f9e77db5ef4efec18a4dbfca6. No standalone signed specialist charter was found.

The current Ravel README and state were read. The current remit includes geometric reconstruction, measurement/observable triangulation, source-aware reconciliation, mathematical audit and continuity. The historical conversation is not an authenticated current thread. Owner-local README, STATE and CONTINUITY were not overwritten. This report and the common receipt are additive records only.

## 2. Required preflight and non-duplication

Read the live BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, onboarding, revival rotation, current main branch, latest Ravel report/receipt, Ravel README/STATE/INBOX, Mersearch worker guide and Ravel historical source.

Initial HsH main head: d2f36396a51706ad7ed9f92297d1d248735ab9c0.

Mersearch-first was respected. The root request and all four canonical request lanes were inspected. All four lanes remain occupied and requested. No direct Mersearch runtime or local three-repository checkout was available. No request was overwritten, released or retriggered.

Existing Ravel tools were inspected: ravel_cf033_finite_core_convolution_gate.py, p9_finite_core_contact_smoothing.py, finite_tube_sheet_topology.py, the Math Hopper archive scripts and Whirligig RQ. The Ravel scripts contain toy or assistant-generated fixtures and were not run as physical calculations. Math Hopper is an archive/index workflow, not a theorem prover. Whirligig is an existing visualization/hypothesis tool, not a validated physical solver. SciSpace is connected, but the primary source was directly available. No new tool, dependency, fork, subscription or cost was introduced.

The exact He2* paper DOI was searched in HsH and no existing matching record was found. Nearby subjects were deduplicated against existing work: CODATA G and covariance (#1308), aramid-rope contact (#1096 and related audits), Tang 2023 vortex-ring work, Kelvin-wave figure data (#1543), M87 polarimetry and CryoLEM core-PIV (#1726), and the responsive-medium null-response gate (#1630). No duplicate issue was created for those subjects.

## 3. New source: direct normal-fluid tracer channel

New source identified:

A. Marakov et al., “Visualization of the normal-fluid turbulence in counterflowing superfluid 4He,” Physical Review B 91, 094503 (2015), DOI 10.1103/PhysRevB.91.094503; open manuscript arXiv:1412.1890.

The experiment creates thin lines of triplet-state He2* molecular tracers by femtosecond-laser field ionization. The authors report that these molecules are trapped on vortex lines only below 0.2 K; above 1 K they join the normal-fluid component and can trace its motion. The reported experiments include 1.83 K and 1.60 K.

The source describes an 800 nm, 35 fs, 5 kHz creation laser, a beam waist of about 110 micrometres, and 905 nm fluorescence imaging. The counterflow channel has a 9.5 square millimetre cross-section and is 300 mm long. A thin tracer line moves with the normal fluid. Local velocity is obtained from line displacement divided by drift time. The measured Lagrangian velocity is averaged over the drift time and over a volume of order the tracer-line width. Mean velocity is averaged over 200 single-shot images.

A separate pair of second-sound transducers measures attenuation and thereby estimates vortex-line density. The same experiment therefore has two different observables: normal-fluid velocity from He2* motion and vortex-line density from second sound.

The paper reports a near-parabolic normal-fluid profile below about 50 mW/cm2, reproducible profile flattening from roughly 50 to 80 mW/cm2, and random line distortion above about 80 mW/cm2. At the normal-fluid transition, the authors report no abrupt increase in vortex-line density, contrary to the simulations they discuss. In the turbulent regime they report a transverse second-order structure-function exponent of 1 plus or minus 0.05 for separations below 2 mm, with later decay toward 2/3.

Uncertainty boundary: the plotted mean-velocity error bars are RMS fluctuations, not a stated standard error or a complete calibration uncertainty. The tracer-line method is line- and drift-time-averaged, not an instantaneous three-dimensional normal-fluid field. No machine-readable raw trajectories, calibration bundle or full covariance package was located in this pass. No numerical reanalysis of the paper's figures was attempted.

## 4. Measurement-map contribution

The 2026 CryoLEM rotating-He-II preprint (arXiv:2607.00821; existing HsH issue #1726) uses solid-hydrogen particles that gather on vortex cores. Its authors describe the resulting two-dimensional PIV field as vortex-core displacement velocity, not normal-fluid velocity. This is a useful core-motion observable but does not independently observe the responsive medium.

The complementary observation maps are:

- Core-tracer PIV: vortex-core geometry and motion to calibrated two-dimensional particle positions and PIV vectors.
- He2* tracer line: normal-fluid velocity to line displacement divided by drift time, with line-width and temporal averaging.
- Second sound: vortex-line density to attenuation.

These are distinct observables. The He2* method is not a physical equivalent of an H(s)H timesheet, and the tracer line does not by itself recover a full three-dimensional normal-fluid field.

A future rotating-He-II experiment could investigate simultaneous core-tracer PIV, He2* normal-fluid tracing and second-sound vortex-density measurement. This is a proposal, not an existing CryoLEM capability. It would require independent validation of He2* production and tracking in the rotating geometry at the target temperature, synchronized rotation-phase and camera calibration, raw tracks, line-width and drift-time characterization, second-sound calibration, and cross-channel uncertainty/covariance.

A useful falsifier would be a pre-registered prediction for the cross-spectrum or phase relation between independently measured normal-fluid motion and vortex-core motion across held-out rotation or heat-flux runs. If the predicted response is absent within a declared uncertainty budget, the proposed coupling description is not supported.

## 5. Conditional mathematics and actual Lean status

The relevant conditional observation-map structure is:

O_core(v_L, u_n) = Pi_xz(v_L)

O_He2(u_n) = line/time-averaged tracer displacement divided by drift time

O_joint = (O_core, O_He2, O_second_sound)

A core-only observation cannot identify an independently varying normal-fluid state if that state is absent from the observation map. Adding a distinct normal-fluid observation can reduce the ambiguity, but the combined map is injective only under explicit admissible-state, calibration and component-injectivity conditions. This is a conditional inverse-problem statement, not a physical theorem and not an H(s)H prediction. The actual CryoLEM observation operator has not been instantiated in Lean.

Existing PR #1133 was inspected. It remains OPEN / DRAFT / UNMERGED on branch research/ravel-carrier-slice-reconstruction-20261031t0212z, head 17dd47829bad180d1fa3f6fb885ff447a5e76f88, based on infra/lean4-verification-20261023 at 61cc8b6.

The PR merge-ref workflow run #43636677645 failed on both attempt 1 and the single authorized rerun, attempt 2. The Ravel modules did build in the merge-ref run, including RavelNormalConnectionReduction, RavelFiberTransportNonuniqueness, RavelJointAccommodationReadout and RavelRepresentationConversionCoherence. The overall library build failed in MovingPlaneTraceGeometry. Errors at lines 72, 76, 80, 84, 96, 100 and 197 report definitions depending on noncomputable Real division or slice functions without noncomputable declarations.

The RavelNormalConnectionReduction #eval output contains a printed Real.ofCauchy (sorry ...) placeholder for noncomputable real evaluation. The inspected Ravel source modules contain no literal sorry or admit tokens. The workflow sets nanoda-allow-sorry=true, so the global proof gate is permissive and must not be treated as a complete proof audit. The RavelFiberTransportNonuniqueness axiom report includes standard Lean dependencies such as propext, Classical.choice and Quot.sound; one reported theorem, spatialSectionExtension_has_zero_normal_rank, is reported axiom-free. The full build failure prevented completion of downstream validation. No physical map was formally instantiated and no new theorem was added.

Local Lean, Lake and Elan are absent. No new PR or branch was created. The current PR run checks formalized statements only; it does not validate the translation from the He2* experiment to the formal model or the truth of physical premises.

## 6. Publication outcome

A distinct public-safe source note was submitted through the existing issue publisher:

- Issue #1762.
- Submission ID: ravel-he2-normal-fluid-tracer-map-20261114t2324z-s2-001.
- Publisher workflow run: #43654293011.
- Publisher comment: #6886030283, “REJECTED: SHA-256 mismatch”.
- Declared SHA-256: 04c5246b480c6df04d4197fb458e91d7d75bcc80bcc0df0c776d6ebcf22b1e8c.

The publisher script hashes the exact content string. The issue body contains 4,871 characters and no final LF. The submitted digest had been computed from the Python draft with a trailing LF. The exact issue-body content digest is 450cd62a415623d02270c8b26ce87794e1ff63e6181c2337ab35a9ed9bce8c14. The canonical PUBLISHED_SUBMISSIONS artifact was not created and its expected path returned 404. The workflow's overall SUCCESS conclusion does not override the explicit rejection comment.

No retry, issue edit, duplicate issue or direct artifact write was made. The issue body remains public, but the submission status is PUBLISHER_REJECTED_SHA256, not PUBLISHED_VERIFIED. Future submissions must hash the exact final content string, including the exact trailing-newline choice.

## 7. Campaign, P0 and operating limits

P0 Code Grurple remains ACTIVE. The workspace-wide discovery-index exposure remains unresolved; the latest verified h838 snapshot contained 7,933 workspace records and 7,933 generic reader targets. No site, discovery builder, reader, manuscript or presentation object was changed. This report and receipt are public-safe, but the current discovery builder may index them.

P1 cognition remains OVERDUE / NOT READY and Orson-owned. P2 measured geometry remains HOLD. P3 full theory remains INCOMPLETE. FIE rereview remains scheduled for November 24; the last full review was November 10.

All four Mersearch lanes remain occupied. No new request was created. No physical calculation, CODATA comparison, fit, H(s)H prediction, independent measurement or theory promotion was performed. No SAT-O or Blockwave equation was changed.

The preceding h838 Tern run completed an unrelated reading break, so this run did not duplicate it. No new FIE rereview was due.

## 8. Scheduler and successor

Workshop Relay :24 | Geometry remains enabled with task ID 6abda4c8eda88191bf23a6f2849e9a17 and its original hourly America/New_York :24 schedule. No task, ID, prompt, schedule, phase, cadence or enabled-state change. No sixth task.

The next deterministic label is Orson Vay. No handoff was created because this physical measurement-method note does not belong to Orson's protected cognition remit. No direct-thread delivery, consumption or acknowledgment is claimed.

## Final disposition

H839_S2_RAVEL_SOURCE_GROUNDED_MEASUREMENT_MAP / NEW_HE2_NORMAL_FLUID_TRACER_SOURCE / PUBLISHER_REJECTED_SHA256 / RAVEL_LEAN_MODULES_BUILT_GLOBAL_BUILD_FAILED / MOVINGPLANE_NONCOMPUTABLE_ERRORS / P2_HOLD / NO_PHYSICAL_CALCULATION / NO_THEORY_PROMOTION / ORSON_PROTECTED / AUTOMATION_UNCHANGED.
