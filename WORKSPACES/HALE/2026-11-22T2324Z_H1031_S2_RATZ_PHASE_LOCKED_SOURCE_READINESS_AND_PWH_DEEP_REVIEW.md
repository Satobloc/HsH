# Hale h1031:s2 | Ratz phase-locked rotor dataset source-readiness delta and PWH deep review

**Run key:** `REVROT3-19-20261011:1031:s2`  
**Nominal slot:** 2026-11-22T23:24Z  
**Deterministic label:** Hale, ring index 8  
**Next label:** Elias Kern, ring index 9  
**Disposition:** `SOURCE_READINESS_ONLY / LANE24_P0_HOLD / CYCLE_08_OF_08_COMPLETE / NO_PHYSICAL_CALCULATION`

## 1. Authority, identity and preflight

The current user-supplied Lane Charter 24 governs this :24 activation. The older Hale :48 Review-MIND overlay remains :48-specific.

Historical Hale remit is reconstructed from the 2026-09-12 CHECKINS entry and Sable REV-006: external-literature scanning, matched-period comparison, statistical analysis, calibration, uncertainty and source/evidence provenance. These are historical self-report and assistant-maintained re-entry records, not a signed Nathan-authored specialist charter. Hale was externally exposed by design and is not a blind theory reviewer.

No authenticated current Hale thread or conversation ID was recovered. The exact :24 task run observed at preflight was `d518a6c5-4f3c-8327-8275-465a784234fb`, scheduled for 23:24:00Z and started at 23:22:45.978Z. It was `IN_PROGRESS` with `chat_ref=null`. The task's cached latest result belonged to the preceding Ariadne h1030:s2 run and was not attributed to this activation. Deterministic selection is routing only.

The :12 predecessor task is disabled, so no h1031:s1 predecessor run or packet was expected. The next :36 identity is Elias Kern. His documented Track A switchboard-prototype remit does not make this Lane24 source-readiness packet an assignment; no handoff, inbox write, response obligation or ownership transfer was created.

Preflight source set was read from current main: BEDROCK `2629ab29a5838d933c31727455553d206577a258`; Steering Charter `9e6a3615f3b83e0ab8a6c530dc2613d3d4693d89`; Three Paper Campaign `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`; Nathan Direct methodology `a8e333b1d5b5aa1d9772366945dd88769d24153c`; three-repository onboarding `fe40260cda5ce360909f2adfd64a3cc3e2c92a05`; current workflow orientation `bd37743d5a70e14a74db64a5fde7a6d9d13f368a`; revival V2/V3/V4 and thread-routing controls; duplicate-run-key guard `14531964363c1fa3e6bf1e493a6d744d8a02d4da`; boot/reboot preflight; Lane24 capsule `4cf70bd530dfe1d620abc2ce10b9d5503993a3c6`; current main branch and prior Hale Lane24/Lane36 receipts.

Lane24 capsule remains `P0-HOLD / CYCLE 08/08 COMPLETE`. No Cycle 09 is authorized without the positive P0 trigger or explicit standdown.

## 2. Ratz dataset: new source-readiness delta, not a new candidate

The Ratz propeller dataset was already present as a candidate in P2 issue #565 and the Hale h1012:s2 carry-forward. This turn did not rediscover or select it. The new work was a second source pass focused on the actual observation operator, time/phase coordinates, instantaneous detection fields, uncertainty limits and license provenance.

Primary data record: https://zenodo.org/records/23083730, DOI `10.5281/zenodo.23083730`, version 1.0.0, published 2026-10-05. The associated arXiv v1 paper is https://arxiv.org/abs/2611.07862v1, by Ratz, Schram, Sciacchitano and Mendez. The paper's bibliography points to the same dataset and to the 2026 VFS experimental-characterization paper.

The Zenodo README describes processed data: ensemble statistics are supplied, but raw images and instantaneous PIV velocity fields are not. The release includes thrust, blade-section PIV and slipstream PIV HDF5 files, an example loader and an experimental-setup PDF. The package listing is about 430 MB; the record's separate data-volume statistic is not the package size.

### 2.1 What is actually observed

- The test uses a two-bladed Holybro X500 V2 1045 propeller with custom holders, diameter 310.5 mm and radius 155.25 mm.
- Pitch offsets are 0, 5 and 10 degrees. Steady speeds span 2750 to 5250 RPM; transient step-up and step-down commands span 3000 to 5000 RPM, with nominal rise/fall durations of 0.3 s and 0.4 s.
- Thrust is measured for all cases. Transient thrust data are 10 kHz ensemble averages over 500 repetitions, acquired in five batches of 100. Speed is interpolated to the thrust time base and filtered; unfiltered ensemble arrays are also listed.
- PIV is 2D-2C planar and phase-locked, not time-resolved. The laser rate is 15 Hz, every sixth revolution at maximum speed. Repeated step responses are triggered at selected revolution counts to assemble phase-locked ensembles.
- Blade-section PIV is in a blade frame at r/R = 0.4, 0.6 and 0.8, with x and y normalized by projected chord c_x. Slipstream PIV is in the laboratory meridian plane at r/R = 0 and Psi = 0 degrees, with X and Y normalized by rotor radius R.
- The two measurement regions are separate planar observations. The surface-normal coordinates (xi, eta) used in the paper's unwrapped surface analysis are not included in the data release. The README does not supply a common 3D registration/composition map joining the blade-frame planes to the lab-frame meridian plane.
- The slipstream file does include x_tip_inst and y_tip_inst arrays: instantaneous tip-vortex detections with shape (number of vortices, number of snapshots), rows ordered by vortex age and padded with NaN. It also supplies mean tip-vortex positions, positional scatter, normalized circulation and circulation scatter at selected vortex ages.
- These are per-snapshot detections, not a material-identity track linking the same vortex through continuous time. The underlying instantaneous PIV velocity fields used for Gamma2 detection are not distributed, so the detection pipeline cannot be independently rerun from this release.
- No core-radius variable is listed in the documented schema. The strongest direct vortex observables are position and circulation, not an independently calibrated finite-core radius.

### 2.2 Time, revolution, phase and vortex-age are distinct coordinates

The source distinguishes physical time t in seconds, rotational speed n in RPM, discrete revolutions M since the step command, propeller phase Psi, vortex age xi/zeta in degrees, and the derived nondimensional travel coordinate tau.

The paper's source-defined equation (1) is a reparameterization by local blade travel in chord lengths:

\[
\langle \tau \rangle(t) = \frac{1}{c}\int_0^t \langle u\rangle_{\mathrm{blade}}(t')\,dt',
\qquad \langle u\rangle_{\mathrm{blade}} = \langle \Omega \rangle r.
\]

This tau is not an independent physical time dimension or an H(s)H timesheet. It is derived from the measured/ensemble-mean blade speed and local radius. M is a discrete revolution count; Psi is a phase; xi/zeta is vortex age. They must not be collapsed into one temporal coordinate.

A future forward observation map would have to take a specified flow state and map it separately to (a) the blade-frame spanwise PIV ensemble and (b) the lab-frame meridian-plane PIV ensemble, preserving their distinct coordinate frames, phase-lock points, ensemble statistics and uncertainty. The current release does not uniquely invert those two sparse planar observation operators to a continuous 3D flow or worldtube. A unique reverse worldtube reconstruction would require additional measurements or explicit regularizing/physical assumptions.

### 2.3 Calibration and uncertainty boundary

The README identifies a FUTEK QMA150 biaxial thrust/torque cell, CUI AMT11 capacitive encoder and LaVision/Quantel 2D-2C PIV system. The paper reports in-situ load-cell calibration with weights corresponding to maximum measured thrust, thermal-offset mitigation and encoder pulse-loss checks. The package inventory does not list a separate calibration certificate or raw calibration-weight record.

Reported uncertainties in the inspected paper appendix:

- The 95% expanded uncertainty on the derived relative thrust-coefficient difference Delta CT is 0.07% to 1.58%. Its budget combines random errors of steady/transient averages and low-pass-filter sensitivity. Temperature effects on load-cell sensitivity and density are neglected because steady and transient data for each pitch offset were acquired within 30 minutes.
- PIV velocity uncertainty is 0.9% to 1.3% near rotor-disk midspan, 0.5% to 1.9% downstream, and 7.2% to 17.2% in the slipstream shear layer. Spanwise uncertainty is 1.1% to 5.3% in the shear layer and 6.6% to 12.1% in the immediate blade wake.
- RMS uncertainty is 6.2% to 10.5%. A 1.24% local blade-velocity noise floor is applied; fluctuations below it are excluded.
- PIV timing jitter reaches 0.7 ms for step-up and 1.2 ms for step-down. Transient phase-lock bias reaches 2.5 degrees, with maximum offset 3 degrees. Slipstream phase-lock jitter cannot be quantified from the missing blade-contour reflection; the paper expects a similar spread with greater bias.
- The inspected paper/README sections do not provide a full cross-channel covariance matrix or cycle-level raw records. The published thrust series is an ensemble mean and RMS over 500 repetitions, not 500 separately exposed cycle histories.

Delta CT is not a model-independent raw observable: it is defined relative to a second-order polynomial fit of steady thrust versus RPM. A future prediction test must either predict the raw measured T(t) and n(t), or freeze the steady baseline and its fit before evaluating transient holdout data. The present release does not expose the individual 500 cycle records needed for a within-condition random split.

### 2.4 License provenance

The primary Zenodo landing page's visible Rights/License field was blank in the inspected view. A secondary NLM catalog entry reports CC BY 4.0 for the same DOI. This discrepancy is not sufficient to authenticate the primary record's license field. Reuse rights remain UNVERIFIED pending direct Zenodo/DataCite metadata confirmation. No HDF5 files were downloaded, no package checksum was recomputed and no data were modified.

### 2.5 Candidate disposition

Ratz is a useful candidate for a bounded rotational-response and ensemble-vortex-observable benchmark. It is not yet a selected P2 system, an independent measurement, a finite-core-radius dataset, or a complete worldtube reconstruction. A valid future test could compare a precommitted model's predicted ensemble thrust and phase-locked vortex observables at the published sampling points. It cannot claim to recover a unique material vortex worldtube from these data alone.

No physical calculation, fit, prediction, null test, raw-data acquisition, H(s)H model fit or numerical comparison was performed. No SAT-O or Blockwave equation was changed. No corrected source equation was introduced.

## 3. CODATA custody

NIST's current public constants site identifies CODATA 2022 Web Version 9.0 as the latest recommended set. The 2026 adjustment is underway and accepts inputs published or preprinted before 2026-12-31. The 2022 adjustment is a least-squares evaluation of theoretical and experimental inputs, with correlation coefficients available for pairs of constants.

No CODATA constant was used in this source-readiness pass. The rotor dataset's stated air density and measured rotor dimensions are experimental inputs, not a reason to introduce fundamental-constant values. No numerical CODATA comparison was made.

## 4. P0 currentness and protected-object readback

Pre-write current main was `da7314db0ef20438b0229a99829cb0932129dd92`. Compared with the previous P0 snapshot `b1b6eae49b9fea99daa19e25ad93dac3875b62cb`, main had advanced by 159 commits. The comparison showed no protected Paper A/B or discovery-control paths changed.

All eight protected Paper A/B/presentation objects matched their exact pinned Git blob identities, and all three discovery source/control objects matched:

| Object | Exact pinned blob |
|---|---|
| Paper A accepted R1 | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` |
| Paper B reviewed R1 | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| Papers feed | `e3552fdac0f187b066b59a9742563094efffe011` |
| Presentation Gate | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| Reader Routing Registry | `277a94c553e2e17b61bb046a04781b4e44f2229f` |
| Presentation Contract | `b871249564a45278383e41eebd8aaa5d8c64aa3c` |
| Generated papers index | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` |
| Viewer Pages workflow | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` |
| Discovery generator | `97ff9c6d00544251c05bd6bb6053907805438f3e` |
| Discovery tests | `4d646dba614f50b912391c13cd516616700d2ac3` |
| Discovery policy | `36b2669c328466f0f579e188fbec5796d6ca44dc` |

Issue #1747 remains OPEN / ACTIVE. PR #2009 remains OPEN / DRAFT / UNMERGED at head `ee582b8de93f88f49445c211892529c40b47fded`, 3 commits ahead and 4,740 behind current main, with no exact-head Actions runs or formal reviews. No live-reader acceptance, independent browser acceptance, deployment or explicit standdown was established. No route probe, merge, rebase, manuscript change or source repair occurred.

## 5. PWH deep review and priority upkeep

The last recorded deep PWH review was Tern h971:s2 on 2026-11-20T11:24Z. More than five actual completed worker receipts have since accumulated, so the five-activation deep-review trigger was due and was completed here.

The exact current-main source `WORKSPACES/COMMON/task_upkeep_triage.py` has Git blob `49d2fdd8f36b6091a3b06e0a65ad6c5d4e69ed01` (6,601 bytes). Its self-test passed in Python. `build_report` was run against a field-complete projection of all 18 current graph records; blocker presence was preserved, and absent optional numeric fields remained absent. The graph itself was not mutated.

Triage result as of 2026-11-22: 13 active/blocked candidates; priority counts P0=3, P1=2, P2=3, P3=1, P4=1, unclassified=3. Ordered candidates begin with the P0 Code Grurple parent, Paper A, Paper B; P1 Orson cognition (13 days overdue) and clone census; P2 measured-system paper (due 2026-11-30), blocked M87 readout and workflow upkeep; P3 full theory (due 2026-12-14); P4 exploration; then three unclassified branches. Metadata gaps among active candidates: priority 3, owner 7, due date 10, last-reviewed 10. No explicit low-hanging candidate exists because effort/value fields are absent.

Current graph blob is `71b6bbb977a9acb7c578cf5a100a4c3595ba412b`: 18 records versus `branch_count=16`; 5 completed, 12 active, 1 blocked; 7 roots, 11 parent references, 10 child edges, 17 reachable records and one unreachable blocked M87 polarimetry record. One parent-only edge remains; no dangling child references or cycles were found. Tern retains graph ownership. No graph edit or ownership change occurred.

### 5.1 Existing PWH queue dispositions

- WH-01 / issue #1703 remains open. The original 100-run snapshot was not retained, so the run-list cursor remains held at 2026-11-15T18:00Z. Current clone ledger is 457 rows, 454 unique populated event IDs and 3 preserved legacy rows, with zero parse errors or duplicate populated IDs. This does not substitute for the missing run-ID partition.
- WH-02 / issue #1702 remains open and Calder-owned. PR #1710 is open at head `a967e908ceab048d219831ec799343643870daf3`, 7 commits ahead and 10,150 behind current main. Six of seven touched files match the merge base; only `.github/workflows/conversation-json-content-ci.yml` differs. No exact-head Actions run or formal review was returned. Smallest next action remains Calder/authorized maintainer reconciliation of that single workflow difference, followed by exact-head CI. No rebase was performed.
- WH-03/WH-04 / Factory Floor issues #16-18 remain open without a verified executable intake scanner or lifecycle transition.
- WH-05 / issue #1704 remains open. All four canonical Mersearch request files remain `requested`. Lane 2 has a run manifest and compact receipt, but raw results remain withheld. The request-index directory has no output folders for lanes 1, 3 or 4. No request was released, overwritten or retriggered.
- WH-06 / issue #1705 remains open; the full issue/fork census was not refreshed. The prior 2026-11-19 snapshot remains the last verified broad census.
- WH-07 / issue #1706 remains open with no verified pickup. The Old Plan Recovery Sweep remains NOT YET EXECUTED; last substantive progress recorded 2026-11-08.
- WH-08 / Factory Floor issue #19 remains open with no verified pickup.
- WH-09 / issue #1712 remains open. Conversation migration remains partial at 5,155 of 13,793 records, with no verified new pickup.

### 5.2 Old Plan Recovery Sweep: field-complete intake/fallow note

- `intake_at`: UNKNOWN pending recovery; no source timestamp was recovered.
- `last_substantive_progress_at`: 2026-11-08, as recorded in the standing queue.
- `fallow_age`: 14 days as of 2026-11-22.
- `priority_authority`: Nathan Direct 2026-11-21 intake/fallow control; no numeric P0-P4 priority assigned. Do not infer one.
- `pickup_state`: NOT YET EXECUTED / NO VERIFIED THREE-REPOSITORY PICKUP ROUTE.
- `owner`: UNASSIGNED. `coordination_lane`: Tern, which retains PWH and task-graph authority.
- `blocker`: no named bounded source sample, no existing enabled worker identified for pickup, and no verified receipt/return path across HsH, Glass and HSH_RESOURCES.
- `smallest next action`: Tern selects one bounded source sample and one already-enabled worker, records the exact existing inbox/queue route, and verifies a receipt. No new task, automation, recurrence or graph node is created.
- `review trigger`: next actual completed activation after a verified pickup, or 24 hours after that pickup, whichever occurs first. This is a review checkpoint, not a new scheduled automation.
- `return route`: this PWH queue, Tern's existing inbox and the partial Project Portfolio Register. No direct-thread delivery or acknowledgment is claimed.
- `outcome`: remains OPEN / UNRESOLVED; no ownership, priority or task-graph status changed.

The Project Portfolio Register remains a partial scan last updated 2026-11-13 and is not a task graph or owner registry. No separate Old Plan Recovery Sweep graph node was found or created.

## 6. Other protected work and operating boundaries

- P1 cognition remains overdue, frozen and Orson-owned. No manuscript, dataset, protocol, experiment, PR or ownership change.
- P2 first-draft checkpoint is 2026-11-23 and the major gate is 2026-11-30; both remain HOLD. No measured system is selected. P3 full theory remains a separate 2026-12-14 gate and is incomplete.
- FIE last full review: 2026-11-20; next review: 2026-12-04. No premature rereview. Unrelated-reading break was completed 2026-11-21; no duplicate break.
- All four Mersearch lanes remain occupied/requested. No callable Mersearch action was available; no new query or lane mutation.
- HSH_RESOURCES access remained limited to public/navigation/toolkit surfaces; no private research payload was opened.
- No full repository clone or local checkout occurred. GitHub API reads/writes and web source reading only; no clone-ledger append was warranted.
- No new tooling, dependency, fork, subscription, cost, physical calculation, fit, prediction, CODATA comparison, Lean module, paper advancement, theory promotion, SAT-O/Blockwave correction, task/ID/cadence/phase change, sixth task, signet or conversation rename.

## 7. Next research cursor

Keep P0 ACTIVE and Lane24 HOLD. Do not start Cycle 09. If P0 clears, first confirm the official Zenodo/DataCite license metadata and retrieve the exact HDF5 package with cryptographic checksums. Then establish calibration traceability, the explicit map among t, n, M, tau, Psi and vortex age, and a valid independent holdout. Only after that should a source-grounded forward map from a candidate geometry to the published ensemble observables be formalized and run in Lean. The reverse map from the current sparse planar ensemble data to a unique 3D worldtube remains underdetermined.

**No public publication was made.** This is an internal source-readiness and control-plane delta; the existing P2 issue #565 already carries the Ratz candidate and no new public claim or independent measurement warrants a duplicate issue.
## Amendment 01 | Existing Lane24 formalization status

Existing Hale PR #1487 remains OPEN / DRAFT / UNMERGED at head `98e0a086e5620428fa4d872d6337364cfaafa7f2`, with two commits and four changed files. No formal reviews were returned.

Actions run #44968816552 succeeded, but the job log shows checkout of `refs/remotes/pull/1487/merge` at synthetic merge commit `20be9a7...`, merging PR head `98e0a086...` into base `2214b0c...`. This is a successful merge-reference build, not an exact-head-only checkout.

The existing MeasurementDomainCompatibility theorems for native-domain holdout, explicit cross-mode bridge and transformed target-domain comparison report no axioms. The FactorialContrastIdentifiability recovery/bijection theorems report `propext`. The workflow's separate leanchecker, nanoda and global axiom audit were not established by this run.

No new Lean module or code change was justified in this activation. The source-defined tau reparameterization and the distinct t/M/Psi/vortex-age coordinates are the next formalization target only after the P2 system is selected and the measurement/observation maps are fully typed. No physical premise is proved by the existing Lean build.
## Amendment 02 | Scheduler readback correction

A later exact-ID automation peek resolved the previously incomplete run-envelope fields. The :00 h1031:s0 last-run record and latest result identify run `212fb49c-ed70-8320-9a1f-245bc9283be7` as `completed`, with a non-null thread reference and a later start/completion envelope. The canonical Aldus receipt for that same run ID instead reports `failed`, `chat_ref=null`, and earlier start/completion times. Preserve both observations as an unresolved same-run record conflict; do not infer retry, distinct attempt or delivery success from either alone.

The current :24 h1031:s2 last-run record is `d518a6c5-4f3c-8327-8275-465a784234fb`, `in_progress`, `chat_ref=null`. The current :36 h1031:s3 last-run record is `85033e7a-0c90-832f-bb56-9515e0c336c9`, `in_progress`, `chat_ref=null`. The :36 identifier corrects the earlier mistyped value in the PWH supplement. The :24 and :36 run records overlap, but this is scheduler-envelope evidence only, not proof of simultaneous model computation or cross-thread delivery.