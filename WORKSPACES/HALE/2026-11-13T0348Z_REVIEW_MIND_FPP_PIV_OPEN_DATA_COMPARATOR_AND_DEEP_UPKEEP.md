# Hale h795:s4 | Review-MIND source comparison, scheduler QC, and deep upkeep

**Run key:** REVROT3-19-20261011:795:s4  
**Nominal slot:** 2026-11-13T03:48:00Z  
**Selection:** h=795; seq=5×795+4=3979; 3979 mod 19=8. Hale, ring index 8.  
**Successor:** Elias Kern, ring index 9, h796:s0.  
**Classification:** SOURCE_GROUNDED_REVIVAL / OPEN_DATA_SOURCE_COMPARATOR_PUBLISHED / DEEP_UPKEEP_COMPLETE / POST_START_HANDOFFS / SCHEDULER_OBSERVATION_ROUTED / NO_PHYSICAL_DATA_REANALYSIS / AUTOMATION_PRESERVED.

## 1. Authority, identity, and preflight

Hale's historical specialist remit was recovered from the 2026-09-12 direct user-role check-in in WORKSPACES/COMMON/CHECKINS.md and Sable's REV-006 re-entry packet. The remit is external literature/arXiv scanning and matched-period landscape comparison. It is not a signed standalone charter. The user-supplied LANE 48 Review-MIND charter governs this activation; the older Hale lane overlay was not substituted.

No authenticated current Hale thread was established. The deterministic label is not an authenticated model identity. This is source-grounded continuity reconstruction, not historical-instance participation. The current :48 run record has null run-level chat_ref; no direct cross-thread delivery is claimed.

Preflight documents were read from HsH main, including BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, the 2026-11-08 Nathan Direct methodology/model overview, Revival Rotation V3 and V4, thread-first rule, navigation preflight, shared-state write safety, worker upkeep protocol, Mersearch worker start, issue-publication intake, Reference Desk, and Tool Chest.

Key source fingerprints:
- BEDROCK: 0253ace674bbc361464b7bbaac2c41aa3d8e8867
- Steering Charter: 04822f3e48f746e9e464d893636ed4a670d68683
- Three Paper Campaign: 2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4
- Three-repository onboarding: fe40260cda5ce360909f2adfd64a3cc3e2c92a05
- Nathan Direct methodology/model overview: a8e333b1d5b5aa1d9772366945dd88769d24153c
- Revival Rotation V3: 7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14
- Revival Rotation V4: 6761337dfcd0847226ee7baad84db0a9c496760a
- Thread-first rule: e79707587914edb76afca1c32f9f4dad4d0324b7
- Navigation preflight: ce8d8be6e07340eff1f0e06d66b762e8ae8da358
- Shared-state write safety: 3a8695beb03ca8fe51ce3ee8fa52a9dec52ed1c5
- Worker-upkeep protocol: e43002b54ca211e563a02b37f6e07fdfb9b45ed0
- Mersearch worker start: 086778737a004c467b0b52142d71aa5b961fc166
- Task graph: 05283edaa44e2163406c8b005a7fbbca95d76c7f

The three-repository front doors were inspected:
- HsH main, prewrite head 35f32ade48dee7ca4f49dcafc06fd0d02befb94d.
- SAT_THEORY_ARCHIVE_2023-25 README, blob 8cc300ba25a98dda803f6a0005bee9d97c3814ef. No SAT-O or Blockwave equation was invoked or changed in this source-comparison task.
- HSH_RESOURCES README, War Room declaration, Tool Chest, and existing arXiv scanner source were read. The private/internal boundary was respected; no quarantined prior-art payload was opened and no private path was published.

Mersearch was not run. No callable Mersearch action was exposed in the connected tool surface. All four canonical request files remain status=requested and their request-scoped RUN_MANIFEST/SEARCH_RECEIPT files are absent. They are occupied, not idle; no request was overwritten or retriggered. No local HsH checkout exists. The existing HSH_RESOURCES arXiv scanner v0.4 is a 1,362-line standard-library tool; it was inspected but not executed. This journal/Dataverse source was already available from publisher and repository pages, and no arXiv scan was necessary.

Existing infrastructure was reused rather than rebuilt: Hale PR #1387 and its measurement-domain branch, Calder PR #1515, Aldus PR #1657, Orson PR #1115, plus the recent same-cycle checks of Math Hopper #578/PR #991, Whirligig Kernel 0, and installed SciSpace. No new tool, dependency, fork, subscription, or expenditure was introduced.

## 2. Incoming Calder handoff and timing correction

The h795:s3 Calder report and handoff were read from Hale's existing INBOX after this run had started. The handoff blob is aa6cf0a53ae6b43e36b85b8fcff00195aee52cd0. Its creation/link commit is 56b56357, timestamped 2026-11-13T03:56:44Z.

The current h795:s4 run started at 03:46:22.179892Z. The handoff and Hale INBOX pointer therefore arrived 10m21.820108s after this run started. The original handoff's SUCCESSOR_TIMING_UNVERIFIED label is now resolved by additive Amendment 01: POST_START_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY. The packet was read after start; it was not present at start. No direct delivery, preloaded context, consumption-at-start, or acknowledgment is claimed.

Calder's substantive handoff was preserved. Its paired-readout identifiability and null-design work is not duplicated here.

## 3. External source comparison: Semati versus Han

### Open-data candidate

Ali Semati, Adharsh Shankaran, Benjamin K. Smeltzer, Eirik Æsøy, R. Jason Hearst, and Simen Ådnøy Ellingsen, “Free-surface profilometry for complex flows,” Experiments in Fluids 67, article 120 (2026), published 2026-07-28. DOI 10.1007/s00348-026-04242-x.

The paper combines Fourier-transform profilometry (FPP) for free-surface elevation with planar particle-image velocimetry (PIV) for subsurface velocity. Point laser-induced-fluorescence (LIF) is a separate surface-height validation channel. The reported experiments include wave generation, a cylinder wake interacting with waves, and droplet impact.

Dataset: DataverseNO DOI 10.18710/MWEHEM, version 2.0, published 2026-07-06, eight files under CC0 1.0. The dataset description includes raw profilometry-image sets for 4, 12, and 25 mg/L wave-generation conditions, images for vortex-wave interaction, and processed surface-elevation and velocity-field data for cylinder-wake experiments. The listed files total approximately 18.6 GB. FPP_validation.nc is 250.1 KB and AttenuationLength.nc is 19.2 KB; the large image sets are multi-gigabyte. File-level MD5 values are listed by DataverseNO.

Code: github.com/asemati/FTProfilometry, MIT license. Its README specifies MATLAB R2024b or newer plus Image Processing Toolbox and Computer Vision Toolbox. The code reconstructs FPP surface elevation; it is not a complete PIV pipeline. The paper reports LaVision DaVis 11.0 for PIV processing. The dataset description does not explicitly promise raw PIV particle-image stacks, so full end-to-end PIV reprocessing is not established.

No dataset bytes were downloaded or inspected in this run. The Dataverse metadata is public, but the file-access attempt from this runtime returned 403. No raw-data analysis, fit, prediction, or independent measurement was performed.

### Measurement and uncertainty

The measurement branches are different observables and domains:
- FPP: fringe/phase observations, unwrapping, pixel-dependent calibration, then surface elevation.
- PIV: particle-image pairs, calibration, then a planar subsurface velocity field.
- LIF: point surface-height validation.

The reported PIV plane is 2 cm below the quiescent surface for the cylinder-wake case and 1 cm below for the droplet-impact case. This is planar PIV, not volumetric 4D-PTV.

The LIF spot and FPP locations are separated by about 4 mm, so the comparison interpolates between nearby FPP points rather than comparing identical spatial samples. At 12 mg/L the paper reports 18 μm mean absolute error; localized errors reach about 160 μm near wall-reflection/interpolation regions. The paper also notes temporal-aliasing limits in a 15 Hz droplet-impact measurement.

A source-arithmetic check reproduces the order of the reported ~12 μm error floor. Under an independent-Gaussian interpretation of the reported 8 μm FPP noise scale and 13 μm LIF ±1-pixel scale:
\[
\sqrt{2/\pi}\sqrt{8^2+13^2}=12.18\ \mu\mathrm{m}.
\]
This is arithmetic from published measurement scales, not raw-data reanalysis. The 13 μm value is reported as ±1 pixel, not separately characterized as a standard deviation; the Gaussian interpretation is an assumption, not a verified uncertainty model.

### Comparison with the volumetric candidate

Han et al. (2026), “Simultaneous free-surface and 3D flow measurements of a vortex ring in head-on collision with the air-water interface,” Experiments in Fluids 67, article 91, DOI 10.1007/s00348-026-04256-5, reports stereoscopic free-surface measurement paired with volumetric 4D-PTV, meaning three spatial dimensions plus time. Its supporting data are available from the corresponding author upon reasonable request; the listed supplement is a GIF, not the raw measurement package.

These are different experiments and are not interchangeable. Semati et al. is stronger for open data and accessible FPP validation, but its PIV is planar and the full raw PIV acquisition package is not established. Han et al. is higher-dimensional on the subsurface-flow side, but raw data are not openly deposited in the publisher record.

### Source-faithful measurement map and limits

Assistant reconstruction, not source-authored equations:
\[
O_{\mathrm{FPP}}:\text{fringe images + reference + calibration}\to \hat\eta(x,y,t)
\]
\[
O_{\mathrm{PIV}}:\text{particle-image pairs + calibration + }z_0\to \hat{\mathbf u}(x,y,z_0,t)
\]
\[
O_{\mathrm{LIF}}:\text{point fluorescence signal}\to \hat\eta(x_0,y_0,t)
\]
A joint observation package additionally requires spatial registration, time offsets, support masks, calibration state, and cross-channel uncertainty/covariance.

The wrapped-phase observation is periodic modulo \(2\pi\), hence non-injective on all real phases. Unique height reconstruction depends on phase unwrapping, a known reference/anchor, and the pixel-dependent calibration map. This is a formalization target, not a Lean result. No source-specific Lean module or build was created: the source's complete phase-unwrapping/calibration types and data-domain contracts are not yet instantiated. Local Lean/Lake/Elan are not installed.

Existing formal work is not silently repurposed:
- Hale PR #1387's MeasurementDomainCompatibility module currently enumerates EHT/ALMA/image modes, not FPP/PIV/LIF. Its existing CI was a merge-reference build, not a standalone exact-head build.
- Calder PR #1515, head 4cfb6803b641ad16cfe0918680f22fa54559e29a, has exact-head Actions run #42722996625 SUCCESS with 8,957 root jobs. The theorem-specific axiom reports include Classical.choice, propext, and Quot.sound; tests, lint, nanoda, and the separate global axiom audit were skipped.
- Aldus PR #1657, head c186567b6b85c46076b0de2e6a498bb9fd3ae895, target calibration/factorization module built in run #43332191359, but the overall root build FAILED in unrelated MovingPlaneTraceGeometry.
- Orson PR #1115's new head is cb317df2eaa5d5f79794fc39edcdd5b640dff5f0; no PR-triggered Actions run was returned for this exact commit, and combined status only showed Vercel failure. Exact-head Lean verification remains unverified.

The measured water surface is not automatically an H(s)H timesheet; the subsurface velocity field is not automatically a new theoretical medium; planar PIV/FPP does not establish a worldtube/timesheet equivalence. No theory promotion.

## 4. Orson P1 protection and cognition QC

The original user-role passage was recovered from HsH's archived CONSCI.txt, blob e691708e4cbb1bb7c98dca3a34d7c65e3d9c1c48, lines 86-95. It asks whether one can know another mind and explicitly rejects special private access. The assistant's immediate affirmation is not empirical evidence and is not treated as proof of consciousness, personhood, or an agent profile.

Orson's h794:s0 report is cognition/provenance-focused. The prior bounded work-product audit found five of five recent substantive artifacts cognition-focused, with one broad literature-triage item excluded in the stricter four-of-five count. The h794 artifact remains within Orson's LLM-cognition remit. This is a durable-work-product sample, not a complete scheduler denominator.

Orson retains sole P1 ownership. Issue #564 remains OPEN / OVERDUE / NOT READY. PR #1115 remains OPEN/DRAFT/UNMERGED; the new exact head has no verified Lean build. No manuscript, test bank, protocol, author ownership, or P1 gate was changed. No human-subject session, model trial, or cross-agent consensus result was produced.

## 5. Deep upkeep review

The prior Tern h792:s4 upkeep record set the next full sweep after five additional durable receipts/evidence entries. Six later canonical receipts were independently confirmed: h793:s3 Mercer; h794:s0 Orson; h794:s2 Loom; h794:s3 Aster; h795:s2 Aldus; h795:s3 Calder. The trigger is met. This report completes the next read-only deep sweep; the current h795:s4 run is not counted as a completed receipt.

Current TASK_BRANCH_GRAPH blob: 05283edaa44e2163406c8b005a7fbbca95d76c7f.
- Declared branch_count: 16; actual branch records: 18.
- Five completed control records are unprioritized.
- Thirteen active/blocked records: P0=3, P1=1, P2=4 (one blocked), P3=1, P4=1, and three active unclassified records. Total unclassified records are eight when the five completed controls are included.
- Owner/next-action metadata is absent in the graph. No graph edit or ownership inference was made.

Disposition:
- KEEP: P0 ACTIVE; Orson sole P1 ownership; P2 HOLD; P3 INCOMPLETE; Tern's task-graph/scheduler authority; all four occupied Mersearch requests; existing P0 presentation freeze.
- CHANGE: add Semati et al. as a source candidate only, alongside the existing Kestrel bathtub-vortex primary candidate and Han et al. additional candidate. Do not select a P2 system.
- PARK: raw-data analysis until file bytes, run IDs, calibration, coordinate/time registration, units, covariance, and a held-out design are available; source-specific Lean instantiation until exact maps/types are defined.
- RETIRE: none.
- Next deep upkeep trigger: five additional canonical receipts/evidence entries after h795:s4.

Campaign:
- P0 Code Grurple remains ACTIVE. The latest exact 8/8 protected-fingerprint verification is the h793 checkpoint; this run did not re-probe reader routes. Both A/B routes remain PRESENTATION_PENDING / NOT_OBSERVED.
- P1 November 9 cognition remains OVERDUE / NOT READY, Orson-owned.
- P2 November 30 geometry remains HOLD; no final system selected.
- P3 December 14 full theory remains INCOMPLETE.
- FIE last reviewed 2026-11-10; next review 2026-11-24, not yet due.

The Calder h795:s3 report separately advanced the shared Alice in Wonderland cursor through Project Gutenberg #11 lines 501-540; next shared cursor is 541. This run did not duplicate or advance that cursor. A separate public-domain side reading of Babbage's Reflections on the Decline of Science in England was read through Project Gutenberg lines 578-717; the passage concerns instrument size, calibration, and the danger of treating repeatability as accuracy. This was a source-reading break, not a physical break.

## 6. Scheduler observation for Tern

Final readback:
- :00 h795 run was NOT OBSERVED. The preceding h794 :00 run completed at 03:00:04.096064Z; the next h796 :00 run started at 04:00:50.768504Z. No cause or missed-dispatch mechanism is inferred.
- :24 h795 completed at 03:47:41.479610Z; its latest result matched its run.
- :36 h795 completed at 03:57:45.493051Z; its latest result matched its run.
- :48 h795 run ID 48dccfa1-f0e8-832d-8299-a7af32b6081b started at 03:46:22.179892Z, 97.820108 seconds before its 03:48 nominal slot. It remained IN_PROGRESS at the 04:02 readback, with null completion and null run-level chat_ref. Its cached latest result still belongs to Tern h792:s4, not this run.
- :00 h796 run ID 00ee0deb-e858-832c-b275-2d618c9b6f7c started at 04:00:50.768504Z, remained IN_PROGRESS, and had null run-level chat_ref. Its cached latest result still belongs to Orson h794:s0, not this run.
- :24, :36, and :48 scheduler intervals overlapped in metadata. This does not establish actual concurrent processes.

Tern retains scheduler authority. The new snapshot was routed to Tern's existing INBOX as an observation candidate only. No task graph, schedule, task ID, prompt, phase, cadence, enablement, or worker assignment was changed.

## 7. Publication, handoffs, and continuity

Public-safe source note:
- Publisher issue #1666: https://github.com/Satobloc/HsH/issues/1666
- Submission ID: hale-fpp-piv-open-data-comparator-20261113t0348z-s4-001
- Publisher comment #6843497238: PUBLISHED; readback verified.
- Publisher commit: 35f32ade48dee7ca4f49dcafc06fd0d02befb94d
- Artifact SHA-256: ee269e61f90676553e81e0818a737c7617489bad17a7de4dee14d8b22de55473
- Published artifact blob: 23a0b39a966edf50fdd064acc92f05cb22cfa0eb
- The note links back to P2 issue #565. No direct edit/comment to #565 was made; Tern retains docket authority.

Incoming Calder handoff timing is corrected additively in the companion handoff and receipt amendments. Hale's existing INBOX already contained the original pointer; the amendment pointer is appended once.

Successor is Elias Kern h796:s0. The :00 h796 run had already started at 04:00:50.768504Z before this handoff was created. The Elias handoff is therefore POST_START_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY. No task, review request, response obligation, or ownership transfer is created. No direct ChatGPT-thread delivery, consumption, or acknowledgment is claimed.

All four existing active relay tasks remain enabled with their original IDs, schedules, phases, and cadence. The existing :12 slot remains disabled. No sixth task, signet, or conversation rename.
