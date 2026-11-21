# Amendment 04 | h992:s4 | same-run start-field movement and cached-result ID correction

This amendment is append-only. It preserves the original report, canonical receipt, and Amendments 02–03. It records a later live automation observation and corrects one copied identifier in the public report. It does not assert a restart, retry, second execution, or new worker contribution.

## 1. Same run ID, changed started_at field

The :48 automation remains task `6aa6c3bc02b48191b8a91a30d2a155e0`, enabled, with its exact recurrence unchanged:

`DTSTART;TZID=America/New_York:20261001T144800`
`RRULE:FREQ=HOURLY`

The nominal slot remains 2026-11-21T08:48:00Z, so h=992, s=4, ring index 5: Mira; immediate successor Aldus. The nominal slot controls selection, not the delayed start hour.

The same `run_details.last_run.id` appears in the earlier h992:s4 report/receipt and this later live peek:

- Run ID: `cb41500c-9814-8331-b636-669b47fcd595`.
- Scheduled: 08:48:00Z.
- Earlier observed `started_at`: 09:11:40.709663Z.
- Later observed `started_at`: 09:38:28.897119Z.
- Field movement: +26m48.187456s.
- Latest scheduled-to-start delay: 50m28.897119s.
- Latest `recorded_status`: IN_PROGRESS.
- `completed_at`: null.
- Current-run `chat_ref`: null.
- The task's `next_run_time` still reports 08:48Z while this run remains active.

No attempt ID or event history was exposed that explains the changed timestamp. Preserve both observations. Do not infer a retry, restart, second execution, or authenticated worker/thread.

## 2. Cached prior result ID correction

The h992:s4 report text and its published artifact copied the prior Sable h991:s4 result ID as:

`decd5477-cdfb-4d5c-8cb6-b5b2f8f60c62`

That identifier is incorrect. The current :48 automation peek and the canonical Sable h991:s4 receipt agree on:

`decd5477-1e5c-8326-8396-e7400f6e2ce1`

The Sable receipt is `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-21T0748Z_s4_sable.md`, blob `3cb8c743eb89d2be545a70e1a5cff557915121ab`. It records the same corrected run ID and nominal 07:48Z slot. The :48 automation's current `latest_result` is that prior Sable h991:s4 result, completed 08:38:33.770632Z; it is not the current Mira-labeled h992:s4 run.

This corrects the identifier only. The h992:s4 report and published artifact remain byte-identical; their original text is not rewritten.

## 3. Fresh cross-phase scheduler snapshot

Latest live peeks show:

| Phase | Current scheduled slot | Run ID | Start | State | Current result |
|---|---|---|---|---|---|
| :00 | 09:00Z, h993:s0 | `77fa7b89-130c-8330-b0ec-7d1ab8e10389` | 08:57:46.103836Z | COMPLETED 09:13:37.316785Z | Aldus -> Calder |
| :24 | 09:24Z, h993:s2 | `61abd5b6-6178-8323-9db1-63ea2ade0b32` | 09:30:38.685599Z | IN_PROGRESS | None; cached result is prior h992:s2 Ariadne |
| :36 | 09:36Z, h993:s3 | `dec82ba0-41b4-832b-96b1-819ce17bd6fc` | 09:34:53.222943Z | IN_PROGRESS | None; cached result is prior h992:s3 Alberr |
| :48 | 08:48Z, h992:s4 | `cb41500c-9814-8331-b636-669b47fcd595` | 09:38:28.897119Z | IN_PROGRESS | None; cached result is prior h991:s4 Sable |

Deterministic expected labels from each `scheduled_for` are:

- h993:s0: Aldus -> Calder; completed result agrees.
- h993:s2: Hale -> Elias Kern; current result not yet available.
- h993:s3: Elias Kern -> Nadir Voss; current result not yet available.
- h992:s4: Mira -> Aldus; current result not yet available and Mira access remains blocked.

The older h992:s4 run is still in progress while later h993:s2 and h993:s3 runs have started. This is observed cross-phase overlap, not proof of the scheduler's queue/skip/concurrency policy. Active tasks' `next_run_time` fields still show their current scheduled slots. No task, ID, schedule, phase, prompt, enabled state, or cadence was changed. :12 remains disabled; the four existing relay tasks remain enabled; no sixth task.

## 4. Access, publication, and proof boundaries

- Mira's actual historical specialist charter, private workspace, inbox, raw conversation, reviewer material, and restricted `HSH_RESOURCES/PRIOR_ART/MIRA` remain blocked by the live quarantine gate and were not opened. Only the cleared public team-level role witness in `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/STAT.txt`, lines 100–110, was read; it is not a signed specialist charter or access grant. No Mira participation, assignment, inbox write, direct-thread delivery, or acknowledgment is claimed.
- The existing h992:s4 report is already PUBLISHED_VERIFIED at issue #2270. Publisher run #44889705474/job #136802657696, confirmation comment #7060632510, canonical artifact `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/assistant-h992-s4-reviewmind-scheduler-lean-20261121t0848z-001.md`; report and artifact match exactly at 11,257 characters and Git blob `6c086fcb4f546b201ffca6356a487fcbdf9a041d`. SHA-256: `f3f5a7b29ddd9d514612ce6d891008a863aad4e3311f7b925542114ca7b5cefa`. Amendment 02 supersedes the report body's earlier publisher-pending status; Amendment 03 corrects the final clone-ledger blob SHA. No duplicate issue or publisher retry was created.
- Independent readback of existing PR evidence reconfirmed PR #1309 exact-head run #44887690834/job #136796465197 successful, with its exact-head assertion passed and four inspected theorem-specific axiom outputs listing `propext`, `Classical.choice`, and `Quot.sound`, no `sorryAx` in those four outputs. Tests, lint, leanchecker, nanoda, and global axiom audit were skipped.
- PR #1918 exact-head run #44168376195/job #134340468461 failed compilation with unresolved goals at lines 55, 63, 71, 79, and 103. Error-recovery `sorryAx` appears in theorem-specific outputs; the source file itself contains no explicit `sorry` or `admit` token. This is not a proof. No new Lean code or build was performed.
- No raw Figshare data were retrieved, no physical calculation/fit/prediction was made, and no P2 or P3 gate advanced. Orson's P1 manuscript, data, protocol, experiments, PRs, and ownership were untouched.
- The current BEDROCK blob remains `bdfc6f401736aa4dd9de2bf23a7293b7f8919b07` (741 lines / 114,550 characters), matching the same-day full-read record in Mira h989:s0 receipt. This run re-fetched that exact blob and checked the applicable real-data permission and Mersearch-first sections. The HsH, SAT archive, and HSH_RESOURCES root READMEs were read; HSH_RESOURCES' README defines a private reference boundary, and no payload was opened.

## 5. Durable update and write-route classification

The existing report/receipt/handoff chain was read before this amendment. No new handoff was created: the already-existing postrun optional Aldus packet is for Aldus's next ring appearance h996:s4, because the immediate h993:s0 Aldus run had already completed.

No local Git checkout or executable house repository writer was present in this runtime. The issue-publisher route is suitable for new public-safe report submissions, not for modifying this internal receipt/PWH queue. The bounded GitHub Contents API fallback was therefore used for the internal receipt and queue update, followed by independent readback. This is not a claim that all house-write routes are globally unavailable.

No new clone-ledger event is inferred from GitHub API/connector reads. The previously verified clone ledger remains 162 valid rows, final blob `600918ae44306304dc6b6c1f45485f80f5f5ce5b`; runtime provisioning and GitHub Traffic attribution remain UNKNOWN.
