# Hale h795:s4 Amendment 01 | 2026-11-13T04:17Z

**Status:** ADDITIVE EXACT-ID READBACK / SCHEDULER-RECORD MUTATION / ORSON P1 CI EVIDENCE RECONCILED. The original h795 report, canonical receipt, public issue #1666, and Elias handoff are preserved. This is not a new activation or a second run identity.

## 1. Selection and historical authority

The controlling nominal slot remains 2026-11-13T03:48:00Z:

- h=795; seq=5*795+4=3979; 3979 mod 19=8.
- Selected label: Hale, index 8.
- Successor: Elias Kern, index 9, h796:s0.
- Run key: `REVROT3-19-20261011:795:s4`.
- Task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`.

Hale's strongest historical remit source remains the 2026-09-12 Common check-in (blob `886069e71d4aec7a3f8d199d6d889b930a05c17e`): external-literature/arXiv landscape scanning, matched-period comparison, code/scoring/statistical analysis, controls, calibration and explicit exposure accounting. It is an assistant self-report/roster record, not Nathan Direct. Sable's REV-006 re-entry packet (blob `2840500bec1873fc634e564f83d7eda7d1da74f0`) is an assistant-maintained reconstruction, not a signed specialist charter. No authenticated current Hale thread was established; the current run-level `chat_ref` remains null.

## 2. Same-run-ID scheduler mutation

The canonical h795 receipt recorded the same :48 run ID with start `2026-11-13T03:46:22.179892Z`. A later exact-ID readback now reports:

| Field | Earlier receipt snapshot | Later exact-ID readback |
|---|---|---|
| Run ID | `48dccfa1-f0e8-832d-8299-a7af32b6081b` | Same |
| Scheduled for | 03:48:00Z | 03:48:00Z |
| Started | 03:46:22.179892Z | 04:12:28.779919Z |
| Status | IN_PROGRESS | IN_PROGRESS |
| Completion | null | null |
| run-level chat_ref | null | null |

The recorded start moved forward by **26m06.600027s** under the same run ID. Relative to the nominal slot, the earlier snapshot was 1m37.820108s early; the later snapshot is 24m28.779919s late.

The :48 task-level fields did not reconcile with the run object: `last_run_time=03:12:44.468417Z` and `next_run_time=2026-11-12T22:48:00-05:00` (03:48Z) remained stale. The task itself remains enabled with its exact original VEVENT:

```
BEGIN:VEVENT
DTSTART;TZID=America/New_York:20261001T144800
RRULE:FREQ=HOURLY
END:VEVENT
```

The latest cached result remains run `7270c22b-c6a4-8320-b14e-44c0750dfca4`, scheduled 00:48Z and completed 01:06:20.909162Z. It belongs to prior Tern h792:s4, not this Hale h795:s4 execution.

### Successor :00 h796:s0

The Elias-labelled :00 run has also changed under the same ID:

- Run ID: `00ee0deb-e858-832c-b275-2d618c9b6f7c`; scheduled 04:00Z.
- Earlier readback: started 04:00:50.768504Z, IN_PROGRESS.
- Intermediate readback: FAILED, completion 04:17:13.810249Z.
- Later exact-ID readback: start moved to 04:20:01.281747Z; status returned to IN_PROGRESS; completion cleared to null.
- Start-field movement from the first snapshot: **19m10.513243s**.
- The later start is 20m01.281747s after its nominal slot.
- run-level chat_ref remains null.
- Cached latest result remains prior Orson h794:s0 run `5cdf887c-0c58-832a-b190-a24b0069be15`, not this Elias-labelled run.

The :24 h795 run `a71e7ed6-7fc0-8328-9580-67d25fc6e457` and :36 h795 run `53dc6d61-42f4-8330-aecc-9584ca28c83b` both completed with matching latest-result run IDs. This is a useful control: the mismatch is not universal across the four active leases.

These are scheduler-record observations only. No retry, restart, duplicate process, worker substitution, actual process concurrency, backend mechanism, or causal explanation is inferred. Tern retains scheduler authority.

## 3. Orson P1 exact-head Lean verification recovered

PR [#1115](https://github.com/Satobloc/HsH/pull/1115) is still OPEN / DRAFT / UNMERGED. Its current head is `cb317df2eaa5d5f79794fc39edcdd5b640dff5f0`.

A push-triggered Actions run was found through the commit's check-runs, rather than a PR-only workflow-run lookup:

- [Actions run #43355012975](https://github.com/Satobloc/HsH/actions/runs/43355012975).
- Event: push; exact `head_sha` equals the current PR head.
- Job `verify`, ID `131654873176`: SUCCESS.
- Lean 4.34.0 / Lake 5.0.0.
- Full build: **8,976 jobs**, completed successfully.
- `HsHVerification.ObservableProjection` built at 8974/8976; root `HsHVerification` built and the full build completed.

The run log exposes the new theorem-specific `#print axioms` results:

| Theorem | Reported dependencies |
|---|---|
| `evidence_invariant_assessment_factors_through_observation` | `Classical.choice` |
| `evidence_invariant_assessment_iff_factors_through_observation` | `Classical.choice` |
| `noninjective_observation_implies_assessment_collision` | `propext, Classical.choice, Quot.sound` |

The exact module contains no `sorry`, `admit`, or `sorryAx` token; the captured build log contains no `sorryAx` or bare `admit`. This is a successful compile of the formalized conditional statements, not proof that a real system's observation map is complete/incomplete or that an empirical cognitive effect occurred.

Tests, lint, leanchecker, nanoda and the separate axiom-audit action were skipped. The PR body still says `LEAN_NOT_RUN` and says no run is associated with the new head. That documentation is stale: the successful run is push-triggered and attached to the exact commit, not surfaced by the PR-triggered-run query. A separate Vercel status failure is not a Lean build failure. No PR edit was made; Orson retains ownership.

Issue [#564](https://github.com/Satobloc/HsH/issues/564) remains OPEN / OVERDUE / NOT READY. This CI result does not advance the November 9 paper gate. Source translation, empirical validation, independent review, readable paper/reader and author disposition remain separate.

## 4. Cross-lane evidence QC

- Aldus's and Calder's recent Han SVS/4D-PTV candidate reports use the same primary paper/DOI, `10.1007/s00348-026-04256-5`. Their agreement is concordant reading of one source, not independent empirical corroboration. Neither report inspected raw measurement bytes or established a P2 system selection. No physical calculation or measurement is claimed.
- The FPP/PIV comparator in issue [#1666](https://github.com/Satobloc/HsH/issues/1666) remains PUBLISHED_VERIFIED. A fresh comparison found the 6,032-character issue-envelope body exactly equals the repository artifact; artifact blob `23a0b39a966edf50fdd064acc92f05cb22cfa0eb`; publisher comment #6843497238. The Dataverse metadata is public, but the prior review did not inspect the dataset file bytes. The note remains a source-reviewed candidate, not a P2 selection or independent physical measurement.
- The term 4D-PTV denotes time-resolved 3D tracking plus time; it does not establish a fourth spatial dimension or an H(s)H equivalence.
- The current-main delta from the h793 checkpoint contains no protected P0 artifact path. The latest direct 8/8 fingerprint verification remains h793; both A/B reader routes remain PRESENTATION_PENDING / NOT_OBSERVED.
- P1 remains Orson-owned. P2 issue #565 remains HOLD; P3 issue #566 remains INCOMPLETE. No gate or ownership changed.

## 5. Tools, source and maintenance boundaries

Mersearch was not run: all four shared request descriptors remain `requested`, no request lane was free, no callable Mersearch action or local executable was available, and no local HsH checkout was present. Direct GitHub reads in this amendment were limited to already identified HsH source/report/CI records; they are not represented as three-archive Mersearch coverage. No HSH_RESOURCES private payload or quarantined source was opened.

No new Lean theorem, physical calculation, fit, prediction, human-subject session, model trial, API expenditure, tool, branch, PR, public issue, or theory promotion occurred. The shared unrelated-reading cursor remains Alice lines 541 onward; it was not advanced again. FIE next review remains 2026-11-24. No physical break is claimed.

## 6. Handoff and automation

The existing Hale-to-Elias h796:s0 handoff remains POST_START_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY. The Elias-labelled run has the same-ID start/status mutations above. Its inbox pointer is repository delivery only; no direct ChatGPT-thread delivery, consumption or acknowledgment is claimed. No new handoff, task, response obligation, review request, or ownership transfer was created.

All four existing relay tasks remain enabled with their original schedules; the :12 slot remains disabled. The :48 task ID, VEVENT, prompt, phase and cadence are unchanged. No sixth task, reassignment, signet or conversation rename.

**Disposition:** SAME_RUN_ID_START_MUTATION / SUCCESSOR_SAME_ID_STATUS_REVERSAL / ORSON_EXACT_HEAD_LEAN_BUILD_VERIFIED / PR_DESCRIPTION_STALE / PUBLISHED_ISSUE_1666_READBACK_MATCHED / NO_P2_SELECTION / ORSON_P1_PROTECTED / AUTOMATION_PRESERVED.
