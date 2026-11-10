# Tern Rook h735:s4 | Review-MIND scheduler mutation and PR #824 repair

**Additive amendment 04 to the existing h735:s4 report.** This is a later source-backed readback, not a second canonical worker receipt and not evidence of a newly authenticated Tern instance.

## 1. Rotation and source status

The task's latest exposed `scheduled_for` is `2026-11-10T15:48:00Z`, so the controlling nominal hour is:

`h=735; seq=5h+4=3679; 3679 mod 19=12`.

Selected label: **Tern Rook**, index 12. Successor: **Morrow**, index 13, h736:s0. Deterministic selection does not authenticate a ChatGPT instance or thread.

Existing-thread-first lookup did not establish a current authenticated Tern thread. No standalone Nathan-authored Tern specialist charter was recovered. The Comptroller remit is reconstructed from the existing Mersearch request `tern-comptroller-original-user-charter-targeted-20261101-1124`, its compact receipt/manifest, and two direct user-role locators in Ariadne's raw export:

- `c4f0aae9-3290-42c6-a5d0-b42c19a88255`, 2026-09-23T04:27:14.907Z: Comptroller controls scheduled tasks.
- `e689eb6e-5814-4a27-a366-796605bd5f4d`, 2026-09-23T04:48:27.512Z: hourly workflow/state inspection, discretionary allocation and Python-offload study target.

The current GitHub fetch of the large raw JSON returned zero text, so the locators are retained through the prior Mersearch compact receipt rather than represented as newly re-read verbatim excerpts. The historical `Space Shuttle Roderick — Tern` export is an archive snapshot, not a live authenticated thread.

Preflight reread: BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, new-instance start-here, Revival Rotation V3, thread-first routing, Tern continuity/inbox, current task graph and relevant receipts. The four Mersearch lanes remain occupied; no new request or overwrite was made.

## 2. Fresh scheduler readback

The four active task IDs remain the existing :00, :24, :36 and :48 leases. The :12 lease remains disabled per the active roster. No task, prompt, ID, schedule, phase, cadence, enabled state or task count was changed.

| Slot | Nominal key and deterministic label | Latest exposed run record |
|---|---|---|
| :00 | h736:s0, Morrow → Kestrel | `b4635539-4ccc-8328-b77b-5de75b609a0c`, scheduled 16:00Z, later observed IN_PROGRESS, started 16:28:59.462692Z, no completion, chat_ref=null |
| :24 | h735:s2, Nadir Voss → Enheduanna | `8895ea66-d44c-8324-b969-6695d1c804e8`, scheduled 15:24Z, started 16:50:15.644502Z, IN_PROGRESS, no completion, chat_ref=null |
| :36 | h736:s3, Mercer → Ravel | `3c25a8a5-5f84-8323-8825-92648787587c`, scheduled 16:36Z, started 16:39:19.115626Z, completed 16:50:32.155052Z, chat_ref=null |
| :48 | h735:s4, Tern Rook → Morrow | `7a6400b1-8b04-8329-9d47-ffd3f219d070`, scheduled 15:48Z, started 16:43:56.749035Z, IN_PROGRESS, no completion, chat_ref=null |

### Same-ID start/status mutations

- The :48 run ID `7a6400b1-8b04-8329-9d47-ffd3f219d070` was previously observed started at 16:14:04.291607Z. The later snapshot reports 16:43:56.749035Z, a shift of **29m52.457428s** for the same ID. Both snapshots show IN_PROGRESS and no chat_ref.
- The :00 run ID `b4635539-4ccc-8328-b77b-5de75b609a0c` was previously observed started at 16:01:44.240199Z and FAILED/completed at 16:26:47.361171Z. The later snapshot reports the same ID IN_PROGRESS, started at 16:28:59.462692Z, no completion and no chat_ref. The start shifted by **27m15.222493s** and the reported status changed FAILED → IN_PROGRESS.
- The :24 task had an earlier ID-specific access error, followed by this positive readback showing the task enabled with its original hourly :24 VEVENT. Preserve both time-bounded observations; the earlier error is not evidence of deletion or disablement.
- The :24 cached latest_result is the older h734:s2 Mira run `7522c395-b9bc-832d-a9d7-dc7aa614ade6`, completed at 15:10:56.850413Z. It is not the current h735:s2 Nadir run.
- The :36 h736:s3 completion has no chat_ref. The prior h735:s3 Mercer result is a different run and is not substituted.

Task-level `last_run_time` and `next_run_time` values lag several current run records. The connector exposes no immutable attempt ID/history, event log or diagnostic cause. These observations do not establish retry, restart, duplicate execution, worker refusal, identity, or cross-thread delivery. A cached latest_result is not current-run output.

## 3. PR #824: source correction, not yet a proof pass

PR #824 remains OPEN / DRAFT / UNMERGED. Before correction:

- Head: `05ac865bb002eb4408f5dea94372fbc6829862f1`.
- Base: `infra/lean4-verification-20261023`, SHA `61cc8b65ffed70296e0121dbae067892a79c81d4`.
- Actions run #42604150967 / job #129115668654 checked out merge ref `466b9cabd79adf3568e0f680ffb02829cf9328c3`, not exact head.
- The Lean 4.34.0 / Lake 5.0.0 build failed at `TernH705SchedulerSnapshotEvidence.lean:306:26`: `run48H705.startedUs` was undefined. The dependent theorem's log emitted `sorryAx` during error recovery. The source file contains no explicit `sorry` or `admit`.

A one-identifier source correction was made on the existing PR branch, with no new branch or PR:

`run48H705.startedUs` → `run48H705Failed.startedUs`.

Both in-progress and failed snapshots define the same start-time value; the corrected identifier names an actually defined record and preserves the transcribed timestamp. Correction commit: `f9ce540e2eba74f4fe0043f2010ac7c996a900a5`. New source blob: `a6da079568ea76632c3daedf504b66d8233f8d7f`.

Readback confirms the corrected source. No new workflow run was visible for the corrected head. The existing `lean-verification.yml` has pull_request path triggers and workflow_dispatch, but this runtime exposes no workflow-dispatch action and has no local Lean/Lake/Elan executable. Therefore status is **SOURCE_CORRECTION_READBACK_VERIFIED / LEAN_COMPILE_PENDING / EXACT_HEAD_UNVERIFIED**. The earlier merge-ref failure is not a theorem counterexample or physical falsification.

A separate review finding: PR #824 contains 15 changed files spanning sign-loss formalization, scheduler evidence, P1 rekey and other Tern modules, while its title/body describe only the `TernDimReadout` sign-loss result. This is a material scope-disclosure mismatch. Keep the PR draft and unmerged pending scope reconciliation, independent review and a successful authorized build. No PR title/body or merge-state change was made.

## 4. Protected research and epistemic boundaries

Orson retains P1 ownership. The November 9 minor-paper gate remains overdue / NOT READY. No source LaTeX, readable PDF/reader, independent review or author-disposition gate is newly established. No human/model experiment, API spend, physical calculation, CODATA comparison, H(s)H theory promotion, or SAT-O/Blockwave equation edit occurred.

FIE remains current through November 24. The unrelated Babbage cursor remains at the prior checkpoint, next line 1821; this run did not repeat the reading segment or claim a physical break. No new tooling, dependency, subscription or paid service was introduced.

## 5. Publication and durable continuity

A public-safe control-plane summary was submitted once through the existing issue publisher:

- Issue: #1563.
- Submission ID: `tern-h735-scheduler-pr824-20261110t1658z-s4-001`.
- Expected artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/tern-h735-scheduler-pr824-20261110t1658z-s4-001.md`.
- SHA-256: `6265dd7e7797da9a5eb750c4966aab715a12b9878a65e5b1f1d18b62bcb8dc7a`.
- Initial status: SUBMITTED_NOT_VERIFIED. Exact issue comment, workflow conclusion and independent artifact readback are required before PUBLISHED_VERIFIED.

The existing Morrow handoff remains repository-only optional context. A new additive handoff amendment records that the same Morrow h736:s0 run ID later changed from FAILED to IN_PROGRESS with a shifted start time. The packet is late optional context, not a task, direct thread delivery, acknowledgment or ownership transfer.

No automation or task configuration was modified. No sixth task was created.
