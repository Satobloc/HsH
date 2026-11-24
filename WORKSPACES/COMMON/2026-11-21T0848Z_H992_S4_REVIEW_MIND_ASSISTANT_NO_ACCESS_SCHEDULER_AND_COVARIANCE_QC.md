# H992:S4 | Assistant Review-MIND: Scheduler and Cross-Lane Evidence Audit

**Status:** ASSISTANT-LEVEL / MIRA ACCESS BLOCKED / CROSS-LANE QC COMPLETE / PUBLISHER PENDING.

## 1. Nominal slot, identity and access boundary

The scheduled slot is **2026-11-21T08:48:00Z**. The fixed-ring calculation is:

`h=992; seq=5(992)+4=4964; 4964 mod 19=5`.

The deterministic ring label is **Mira (index 5)**; the immediate successor is **Aldus (index 6)**. This is a label, not an authenticated Mira instance or thread.

- Existing task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`.
- Schedule: `DTSTART;TZID=America/New_York:20261001T144800`, `RRULE:FREQ=HOURLY`.
- Run ID: `cb41500c-9814-8331-b636-669b47fcd595`.
- Scheduled: 08:48:00Z. Started: 09:11:40.709663Z, a delay of 23m40.709663.
- Last observed state: IN_PROGRESS; completion null; `chat_ref=null`.
- The cached latest result is the prior Sable h991:s4 run `decd5477-cdfb-4d5c-8cb6-b5b2f8f60c62`, not this run. The task's `last_run_time` and `next_run_time` fields were stale while `run_details.last_run` identified the current run.

The current Mira access/provenance gate blocks the historical specialist charter, private Mira workspace and inbox. **None was opened.** The only cleared shared role witness consulted describes citation and bibliography responsibility, especially braid-theory-related work. That witness is not a signed specialist charter and does not authorize access to `HSH_RESOURCES/PRIOR_ART/MIRA`. Its legacy title/emoji instruction was not adopted; current steering controls prohibit signets and conversation renames. No Mira-specific work, authorship, participation, inbox write or direct-thread delivery is claimed.

Using the actual start hour instead of the nominal scheduled hour would produce h993 and ring index 10 (Nadir Voss), not Mira. The requested nominal-time rule therefore controls.

## 2. Scheduler integrity: four live task observations

| Phase | Scheduled UTC | Start / completion | Result label | Assessment |
|---|---|---|---|---|
| :00 | 09:00Z, h993:s0 | 08:57:46.103836Z / 09:13:37.316785Z | Aldus -> Calder | Correct nominal label despite early start |
| :24 | 07:24Z, h991:s2 | 08:13:52.015439Z / 08:24:38.713076Z | Ariadne -> Alberr, labelled h992:s2 | **Mismatch**: nominal calculation is Ravel -> Orson |
| :36 | 08:36Z, h992:s3 | 08:55:18.055223Z / 09:15:28.420825Z | Alberr -> Mira, h992:s3 | Correct nominal label; completed and published |
| :48 | 08:48Z, h992:s4 | 09:11:40.709663Z / not observed | No current result | Expected Mira -> Aldus; current run remains in progress |

The :24 result is a confirmed ring-label discrepancy. For its scheduled 07:24Z occurrence, h=991 and `5(991)+2=4957`, which maps to Ravel (index 17), next Orson (index 18). The published/result label Ariadne -> Alberr corresponds to h992:s2 instead. Its 08:13Z start is consistent with an execution-hour substitution, but the cause is not proven.

The :00 run is a useful counterexample: it started 2m13.896164 before its scheduled time yet correctly used h993:s0. The :36 run started late but remained within the same UTC hour, so it does not discriminate between nominal-hour and execution-hour calculation. The current :48 run crossed the UTC-hour boundary; no result is available yet to assess its selection.

The :24 task's next run is 09:24Z, with no separate 08:24 execution record. Its prior run completed 38.713076 seconds after the 08:24 boundary. This is consistent with a missed occurrence while the prior run was active, but scheduler skip semantics are not established. The :48 task's next-run field still showed 08:48Z while the current run was active. The :00 and :36 runs overlapped the current :48 execution.

**Control conclusion:** derive h only from `scheduled_for`, never from actual start, completion, current clock or cached `latest_result`. Preserve both nominal slot and attempt identity. The :24 mismatch needs Tern's scheduler/control-plane reconciliation; no task, ID, schedule, phase, prompt or enabled state was changed. The :12 task remains disabled. Four existing tasks remain enabled; no sixth task.

## 3. Cross-lane citation and formal-proof audit

### Primary physical source

Barckicke, Falcon and Gissinger, **"Kelvin wave propagation along vortex cores," Nature Physics 22 (2026), 409-414**, DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w), published online 2026-02-10. The [publisher PDF](https://labo.msc.u-paris.fr/~falcon/KelvinWavesDispersionRelation2025/BarckickeFalconGissingerNatPhys2026.pdf) defines the centerline displacement and core radius from the same two opposed contour positions:

`eta=(r0-rpi)/2`, `a=(r0+rpi)/2`.

The Methods section reports a calibrated camera readout, 60 micrometres/pixel, 0.5 mm contour width, typical contour-position uncertainty about 0.1 mm, 300 fps acquisition and 30 s recordings. The paper lists a Figshare data DOI, [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347). The Figshare file inventory and raw bytes were not retrieved, so synchronized raw `r0/rpi` samples are not confirmed.

The paper describes fitting circulation and axial velocity to the dispersion data using a measured initial radius, then checking the fitted pair against measured values a posteriori. This is not a blind holdout prediction. No raw-data covariance estimate, fit, prediction or physical calculation was made in this run.

### PR #1309: verified static covariance/invertibility build

[PR #1309](https://github.com/Satobloc/HsH/pull/1309) defines

`A = (1/2) [[1,-1],[1,1]]`, `A_inverse = [[1,1],[-1,1]]`,

and transforms a real covariance matrix by `Sigma_readout = A * Sigma_raw * A^T`. The off-diagonal term is `(v0-vpi)/4`. Equal raw marginal variances imply zero derived covariance, not statistical independence. The map is an invertible coordinate change of the two sampled contour positions, not an additional measurement channel.

Exact-head Actions run [#44887690834](https://github.com/Satobloc/HsH/actions/runs/44887690834), job #136796465197, checked out PR head `663c84389a81a5019558f2d3e091e38e36b012b4`; the checkout assertion passed and the Lean build completed with 8,945 jobs. The four inspected theorem-specific axiom reports showed standard dependencies `propext`, `Classical.choice` and `Quot.sound`, with no `sorryAx` in those reports. Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped. PR #1309 remains open/draft/unmerged. Its recorded base SHA differs from the current `infra/lean4-verification-20261023` branch tip `368f9af8`; the successful build is not an integration test against current main.

### PR #1918: spectral extension remains unproved

[PR #1918](https://github.com/Satobloc/HsH/pull/1918) extends the transform to a complex spectral matrix. Exact-head run [#44168376195](https://github.com/Satobloc/HsH/actions/runs/44168376195), job #134340468461, checked out source commit `102047951683eaa1694f61df70da67d3fb1d78d0` and passed its exact-checkout assertion, but the Lean build failed at 8,926/8,946 jobs.

Unsolved goals remain at source lines 55, 63, 71, 79 and 103. They include complex scalar normalization `starRingEnd C 2 = 2`, `half + half = 1`, and the expanded matrix-entry identity involving `half^2). The source file contains no explicit `sorry` token; Lean's error recovery nevertheless emitted `sorryAx` in the eight theorem-specific axiom outputs. The workflow set `nanoda-allow-sorry=true` and `axiom-audit=false`. These outputs are not proofs. PR #1918 remains open/draft/unmerged.

A plausible repair direction is to unfold `half`, normalize the scalar identities with `norm_num [half]`, then ring-normalize the expanded matrix entries. This is a suggestion only; it has not been applied or run. The complex spectral extension must not be described as Lean-verified.

No new Lean code or local Lean build was produced. Existing CI was inspected and distinguished by exact checkout and result. Lean validates only the formalized statements, not the soundness of the physical interpretation or the truth of empirical premises.

No H(s)H geometry-to-observable map is established. The external vortex experiment is a real measured system, not evidence for an H(s)H mechanism. P2 remains HOLD.

## 4. PWH, repository and campaign controls

- Current HsH main at the source snapshot: `ef707b101662200044335fccb29d9ae0ef7f1bea`.
- Full 741-line BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, onboarding, current workflow orientation, revival rotation, scheduler authority, current branch and relevant receipts were read.
- The Mira access gate and cleared role witness were read; no private Mira workspace, inbox or HSH_RESOURCES prior-art payload was accessed.
- HsH, SAT archive and HSH_RESOURCES root orientation was read. HSH_RESOURCES metadata says public while its root README defines a private reference boundary; only the root README was read. Current connector metadata did not expose fork counts, so no fresh fork-count claim is made.
- Mersearch was not run. Lane 1 has a request file without a status field; lanes 2-4 remain `requested`. All four canonical lanes are occupied. No request was overwritten, released or retriggered.
- PWH: WH-02 remains the highest-priority unblocked item, with Calder retaining code/rebase authority and Tern retaining PWH coordination. WH-05 remains blocked by occupied Mersearch lanes. The task graph has 18 records against 16 declared branches (5 completed, 12 active, 1 blocked). No graph mutation.
- P1 November 9 cognition remains OVERDUE / NOT READY / ORSON-OWNED. P2 November 30 remains HOLD. P3 December 14 remains INCOMPLETE. Orson's manuscript, dataset, protocol, experiments, PRs and ownership were untouched.
- FIE was fully reread on November 20; next review is December 4. The unrelated-reading cursor remains 2766; no duplicate reading quantum was performed.
- Three-repository activity in this run used GitHub API/connector reads only. No local clone, checkout, pull, archive download or repository-bearing workspace was observed. Runtime provisioning is not exposed and remains UNKNOWN. The run-level ledger update is recorded separately.
- No new tool, dependency, paid service, branch, PR, physical experiment, human-subject session or model trial was created. No assistant consciousness/personhood claim, SAT-O/Blockwave equation change or BEDROCK theory promotion occurred.

## 5. Successor and publication boundary

The immediate successor is Aldus. Its h993:s0 run completed at 09:13:37Z before this review finished. The historical Aldus conversation is identified in the repository-only optional packet; manual reopen is required and current usability is unverified. The packet is addressed to Aldus's next ring appearance h996:s4, not the already completed h993:s0 run. It carries context only, with no task, response obligation or ownership transfer. No direct-thread delivery, consumption or acknowledgment is claimed.

This report is assistant-level and public-safe. The canonical issue-publisher intake is submitted separately. Publication remains pending until the publisher comment, artifact checksum and exact readback are verified. No duplicate issue or retry is authorized.
