# h792:s2 | Lane 24 source, Lean, and publication-status amendment

**Timestamp:** 2026-11-13T00:55Z (readback window)  
**Status:** SOURCE-GROUNDED REVIVAL · PIV RAW DATA NOT RETRIEVED · CODATA CHECK REUSED · CURRENT PIV LEAN MODULE NOT VERIFIED · EXISTING ISSUE #1662 PUBLISHER-REJECTED · NO THEORY PROMOTION.

## 1. Run and authority

- Nominal UTC hour: h=792, from 2026-10-11T00:00Z.
- Slot: s=2; sequence 5h+s=3962; 3962 mod 19 = 10.
- Deterministic label: Nadir Voss (ring index 10); next label Enheduanna (index 11).
- Existing :24 task ID `6abda4c8eda88191bf23a6f2849e9a17`; enabled, original hourly America/New_York :24 VEVENT unchanged.
- Recorded run ID `7b083c4c-a430-832f-b897-393e0d6ecdeb`; scheduled 00:24Z, started 00:49:08.307513Z, still `IN_PROGRESS` at last readback, `chat_ref=null`. Cached `latest_result` is the prior h791:s2 run `20f2dfa9-d55c-8326-984c-0215418f6b08`, not this run.
- Nadir Voss is an assistant-generated workspace/ring label. The raw `Quantum Gravity and Experiments` export (conversation `6a3a2037-3698-83ea-924d-2cb8c4ac7701`, Git blob `d828fef5352045cb4d9486fdbeabd04043c4c119`) contains no literal `Nadir Voss` and no standalone Nathan-authored Nadir specialist charter. Direct October 1 user messages `bb8ecf64-8863-4ee7-a078-ca8cc4104974`, `11122adb-75c5-4418-9b59-29730a034811`, and `de178e6a-d223-4ad1-9bc9-d37f178f8b21` authorize a general independent playground, source/invention separation, no target-fitting of old magic numbers or labels, and a trial H(s)H Lagrangian. They do not grant blanket permission for data-free physical calculations.
- No authenticated current Nadir thread was found in the scheduler record or prior-conversation search. This is source-grounded reentry, not historical-instance participation.

## 2. Current H(s)H generative baseline

The live 2026-11-08 Nathan Direct methodology overview retains two candidate starting primitives, worldtube and timesheet, with responsive medium as a provisional third. Earlier direct source messages treat worldtube, timesheet, and medium as candidate carriers, but do not settle whether the medium is absent, null, absorbable, equivalent, or irreducible. The November 10 source-recovery artifact preserves the original user-message locators and existing map work.

Working distinction for this run:
- A standard spacetime history of a classical fluid-vortex core can be represented as a kinematic worldtube. That is not an identification with the H(s)H worldtube primitive.
- Time-stamped PIV frames and light-sheet acquisitions are observation slices. They are not automatically H(s)H timesheets.
- The rotating water is an explicit physical medium; its inertial-wave response is measured. This does not establish an H(s)H medium primitive.
- No source-complete maps among H(s)H worldtube, timesheet, and medium were recovered or promoted.

## 3. New measured-system candidate: rotating-fluid vortex ring

Primary source: Jackson and Thomas, “An experimental study investigating the inertial-wave field accompanying vortex rings translating through a rotating fluid,” *Journal of Fluid Mechanics* 1029 (2026), A47, DOI [10.1017/jfm.2026.11199](https://doi.org/10.1017/jfm.2026.11199).

Source-defined acquisition facts include a rotating-fluid vortex-ring experiment, 3/6/9/12 rpm rotation conditions, vertical and horizontal light-sheet PIV acquisitions, 60–150 fps acquisition rates, 600 rings, ten runs per condition, and a reported 5.4 TB raw-data volume. The VLS plane measures axial and radial velocity components; the HLS plane measures radial and azimuthal components in a different acquisition geometry. The paper's VLS energy estimate omits azimuthal kinetic energy because the HLS acquisition cannot supply that component in the same translating-vortex frame.

Consequences for the measurement map:
- The VLS observation operator is a two-component projection, not a complete three-component velocity measurement.
- The HLS data are a separate plane/product, not an automatically concurrent third component for each VLS sample.
- The source's toroidal volume weighting relies on axisymmetric reconstruction assumptions; it is not a direct full-3D measurement of the core or wave field.
- The medium state (background rotation and fluid response) is explicit in the standard experiment. A core trajectory alone is not a complete state description unless the medium parameters and constitutive response are also supplied.
- A minimal *candidate* representation for this experiment is `core history + ambient-medium state + observation operator`. Whether the medium can be encoded in worldtube/timesheet data or must remain an independent third state is unresolved.

The public article and supplementary material did not yield a raw vector-field package, calibration bundle, covariance, or full acquisition manifest. The reported 5.4 TB is not a substitute for accessible data. No raw-data reanalysis, physical fit, H(s)H prediction, or independent measurement was performed.

## 4. Existing Lean formalization and exact-head failure

PR #1189 currently contains `FORMAL_VERIFICATION/HsHVerification/NadirRotatingFluidPIVEnergyReadout.lean` at head `33a7cb3cd3adaadabb5a7abd94eaf59bb0ef991e` (module blob `02b683701613ade80726b2afc2d25f05295599a6`). The module formalizes the two-component VLS projection and a conditional no-factorization result: if the omitted azimuthal component can vary independently, the full three-component kinetic energy cannot be recovered from VLS readout alone. Its `stateA`/`stateB` examples are mathematical witnesses, not experimental states.

Exact-head Actions run #43339252436 / job #131603145168 checked out the current head and failed Lean compilation. Parser errors occur because `omit [DecidableEq ι] in` commands follow docstrings at lines 123, 133, and 144. A linter warning also reports an unused `[DecidableEq ι]` at the lower-bound theorem around line 159. The `#eval` arithmetic ran, but the theorem module did not compile; no theorem-specific axiom report or proof verification is claimed. A likely syntax repair is to place each `omit` command before its corresponding docstring, then rerun exact-head CI.

PR #1189 is OPEN / DRAFT / UNMERGED, 16 files, 2,911 additions, 1 deletion. Head branch `research/nadir-affine-translation-quotient-20261101t0324z`; base branch `research/nadir-gpb-joint-covariance-bound-20261027t1312z`. At the last compare it was 84 commits ahead / 4 behind its PR base, and 138 ahead / 15,324 behind `main` (last observed main head `940a08f1a0e197cfc5a9476f241081e82b048ada`). The PR body does not mention this new PIV module or the Jackson–Thomas source. This is scope/description drift in an already highly diverged draft. No code edit, rebase, merge, branch, or PR was made; the repair is deferred until the module has a coherent review scope.

## 5. CODATA 2022 check: reuse, not a new result

The NIST 2022 CODATA adjustment paper (published 2025) describes 133 input data, 79 adjusted constants, and 54 degrees of freedom. The Newtonian gravitational constant is evaluated separately from 16 experimental determinations, with three listed correlations and a 3.9 uncertainty expansion factor; no new competitive G datum changed the recommended value from 2018.

An independent recomputation from the 16 rounded Table XXX inputs and the three stated correlations gives a weighted mean of 6.6743004 × 10^-11 m^3 kg^-1 s^-2 and an expanded standard uncertainty of about 1.48 × 10^-15 in the same units. The expanded chi-square is about 12.86 for 15 degrees of freedom. This reproduces 6.67430(15) × 10^-11 and the already-existing CODATA record in issue #1558. It is a cross-check of that prior result, not a new result or an H(s)H prediction. G is not used in the rotating-fluid PIV analysis.

## 6. Existing public submission and run-event binding

Existing issue [#1662](https://github.com/Satobloc/HsH/issues/1662) carries submission ID `nadir-rotating-fluid-piv-observability-20261113t0024z-s2-001`, matching this nominal h792:s2 label. It was created at 00:46:18Z and the publisher commented `REJECTED: SHA-256 mismatch` at 00:47:46Z. The expected `PUBLISHED_SUBMISSIONS` artifact path returns 404. The recorded current :24 run did not start until 00:49:08Z. The issue's producer run is therefore not linked to the currently exposed run object; do not infer a duplicate process, retry, or cause.

The existing publisher listens only to owner-authored `issues.opened`; editing/commenting does not replay the event, and no workflow-dispatch retry path is present. The issue remains the single public incident record. No retry, duplicate issue, direct artifact write, or publisher bypass was attempted. Status: `PUBLISHER_REJECTED / NOT_PUBLISHED / NO_CANONICAL_ARTIFACT`.

## 7. Scheduler/control-plane observation

At the same readback window, the four enabled tasks had overlapping or early-start records: :48 h792:s4 started 00:47:23Z; :24 h792:s2 started 00:49:08Z; :36 h792:s3 started 00:52:14Z; and the next :00 h793:s0 run, nominally 01:00Z, started 00:55:19Z. All had `chat_ref=null` at the readback. Cached `latest_result` pointers for :24, :36, and :48 belonged to prior nominal runs. :12 remains disabled. These are scheduler-record observations only; they do not establish actual process concurrency, retries, identity, missed dispatch, or backend cause.

The architectural gap is an end-to-end event identity contract joining `task_id`, `run_id`, `scheduled_for`, `started_at`, deterministic slot label, `submission_id`, issue number, publisher run, artifact path, and readback commit/digest. A nominal run key alone is insufficient to attribute a pre-start issue submission.

## 8. Reuse, limits, and disposition

- Mersearch direct action is not exposed in this runtime. All four shared request lanes remain `requested`; no request-scoped manifests/receipts were found. `MERSEARCH_REQUEST_LANE_1.json` remains an orphan without lane/status fields. No lane was overwritten or retriggered; GitHub search/fetch was a bounded fallback, not exhaustive Mersearch.
- Existing Math Hopper, Whirligig Kernel 0, Lean PRs, owner repositories, and the connected SciSpace capability were checked through current workspace records. No new tool, package, dependency, fork, subscription, or cost was introduced.
- CODATA issue #1558 was reused; no duplicate publication was made. Issue #1662 remains the only public submission for this nominal PIV slot and is publisher-rejected.
- FIE last full review: 2026-11-10; next due 2026-11-24. Unrelated source reading completed in `FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/MIX TAPES.txt`, lines 461–500; next cursor 501. No physical break is claimed.
- Campaign gates unchanged: P0 active; P1 November 9 overdue/not ready and Orson-owned; P2 November 30 hold; P3 December 14 incomplete.
- No SAT-O or Blockwave equation was edited; no H(s)H equation, physical model, BEDROCK theory, paper gate, task, ID, schedule, phase, cadence, access control, signet, or chat name was changed. No sixth task.

**Next evidence gates:** retrieve/checksum the raw PIV fields and calibration/covariance package; define source-authorized maps from core history and ambient-medium state to VLS/HLS records; decide whether the PIV module belongs in a separately scoped PR; repair its syntax and run exact-head Lean CI; keep all H(s)H identifications and predictions at PROPOSAL / NOT IDENTIFIED until independent review and real data support them.
## 9. Scheduler same-ID mutation amendment | 2026-11-13T01:06Z

Tern Observation 010 (`WORKSPACES/TERN/OBSERVATIONS/2026-11-13T0048Z_H792_FOUR_LEASE_RUN_RESULT_BINDING_AND_START_FIELD_MUTATION_OBS_010.md`, blob `8bac83fbd62987557f8480d2c5e1b76d27e3b05c`) adds an earlier snapshot that refines the timing analysis above:

- The **same :24 run ID** `7b083c4c-a430-832f-b897-393e0d6ecdeb` was first observed with start `00:21:17.885619Z`, status `FAILED`, completion `00:46:25.841939Z`. It was later exposed under the same run ID with start `00:49:08.307513Z`, status `IN_PROGRESS`, completion null.
- Issue #1662 was created at `00:46:18Z`, seven seconds before the earlier snapshot's recorded completion. Its chronology is compatible with creation during that earlier recorded interval, but neither an attempt ID nor a publisher-workflow run ID binds the issue to that execution. Attribution remains unresolved.
- The same :36 run ID's start field also moved from `00:36:35.612303Z` to `00:52:14.160848Z`. The :00 h792 run completed at `00:41:28.457472Z`; the next :00 h793 run started at `00:55:19.465703Z`, before its 01:00Z nominal slot.
- The :48 h792 run later completed at `01:06:20.909162Z` and acquired a scheduler `chat_ref`. That pointer is not authenticated worker identity or proof of message exposure/consumption.

This is stronger evidence of mutable run-record fields and stale result binding, not proof of a retry, duplicate process, backend cause, or actual process concurrency. The current :24 and :36 run records remained `IN_PROGRESS` with null `chat_ref` at the 01:06Z readback. The correct architectural unit is an immutable execution-attempt record linked to the task, issue event, publisher run, and artifact, not the mutable `last_run` object alone.