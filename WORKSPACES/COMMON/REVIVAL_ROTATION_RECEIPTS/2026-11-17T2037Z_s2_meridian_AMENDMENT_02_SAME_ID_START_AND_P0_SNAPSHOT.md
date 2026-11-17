# H907 S2 Amendment 02 — same-ID start-field movement and P0 discovery refresh

**Observation time:** 2026-11-17T20:37:12.610632Z  
**Nominal slot:** 2026-11-17T19:24:00Z  
**Run key:** `REVROT3-19-20261011:907:s2`  
**Selection:** Meridian, ring index 15; next Mercer, index 16.  
**Identity boundary:** source-grounded Meridian revival only; no authenticated historical Meridian thread, direct-thread delivery, or acknowledgment is claimed.

This is an additive amendment to the existing h907:s2 receipt. It is not a second report, issue, submission, PR, task, or theory promotion.

## 1. Exact-ID scheduler observation

The exact-ID peek returned the existing :24 automation enabled:

- Task ID: `6abda4c8eda88191bf23a6f2849e9a17`
- Enabled: `true`
- Schedule, unchanged:
  ```text
  BEGIN:VEVENT
  DTSTART;TZID=America/New_York:20261001T142400
  RRULE:FREQ=HOURLY
  END
  ```
- Phase: Lane Charter 24.
- Run ID: `bcd5bb73-a8a0-832a-8ad7-81a220d2783d`
- `scheduled_for`: `2026-11-17T19:24:00Z`
- Latest `started_at`: `2026-11-17T20:37:12.610632Z`
- Recorded status: `IN_PROGRESS`; completion and current-run chat reference remain null.
- Cached latest result belongs to Nadir h906:s2, not this Meridian run.

The same run ID has now been observed with three start-field values: the original receipt's 19:19:04Z, Amendment 01's 20:03:21.095194Z, and this 20:37:12.610632Z observation. This is a mutable start-field record, not evidence of a new run, retry, restart, distinct worker, or worker liveness. Cause and attempt identity remain unknown.

No task, ID, prompt, schedule, phase, enabled state, or cadence was changed. No sixth task was created.

## 2. Current P0 discovery snapshot

Current HsH main: `4f4186ae2916fd1f2583f2d97ab76a85b1714d7b`.

Compared with the h903 P0 baseline `c4fc8d46ef4baad6317369e3a4805f33457be22c`, main is 250 commits ahead and 0 behind. The only P0-adjacent path changed in that interval is `PUBLIC_SITE/generated/discovery.json`; none of the ten protected source/control paths changed.

The generated discovery blob is `b2abe160998cf7a7599494c33ff4ae759a1dde57` (27,476,185 bytes), updated 2026-11-17T20:30:29Z. Its HsH source commit is `9194946132156fc8ff4991aa872205458043f3dc`; current main is exactly one commit ahead, and the only path in that one-commit comparison is the generated discovery JSON. The snapshot is source-consistent at generation.

Snapshot totals:

- 15,677 documents
- 48-item docket
- 577 visuals
- 6 excerpt errors

Exact A/B rows:

| Field | Paper A | Paper B |
|---|---|---|
| Source | `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex` | `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md` |
| Blob | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| Discovery reader | Generic raw-workspace `reader.html?mode=browse` | Generic raw-workspace `reader.html?mode=browse` |
| Excerpt | None | 1,400 cleaned characters |
| In 48-item docket | No | No |

The feed remains pinned to the same source blobs and exact source commits: Paper A `58b0ed9c19c8dba123846c411d4ac8b7db5c0df9`; Paper B `731e2fb5888b0aec856fd9e31319c39746514239`. The generated PDF papers index remains the unrelated Cruller-Rubin entry only.

All ten protected source/control blobs match their h903 baseline identities:

| Protected object | Current blob |
|---|---|
| Paper A R1 source | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` |
| Paper B R1 source | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| Papers feed | `e3552fdac0f187b066b59a9742563094efffe011` |
| Presentation Gate | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| Reader Routing Registry | `277a94c553e2e17b61bb046a04781b4e44f2229f` |
| Presentation Contract | `b871249564a45278383e41eebd8aaa5d8c64aa3c` |
| Generated papers index | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` |
| Viewer/Whirligig Pages workflow | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` |
| Discovery builder | `97ff9c6d00544251c05bd6bb6053907805438f3e` |
| Discovery tests | `4d646dba614f50b912391c13cd516616700d2ac3` |

## 3. P0 disposition and live-route boundary

The discovery builder continues to emit generic browse targets for eligible WORKSPACES records, while the Reader Routing Registry default-denies WORKSPACES without an explicit presentation derivative. This remains a source/index-policy mismatch, not proof of live raw-file exposure.

The browser connector again reported that access requires the originating browser context. No live route was observed. No route PASS/FAIL, visitor access, or unauthorized raw response is claimed.

The new snapshot evidence was appended to canonical P0 issue [#1747, comment #6960542293](https://github.com/Satobloc/HsH/issues/1747#issuecomment-6960542293). **P0 remains ACTIVE.** No standdown, site/PDF/manuscript/feed/renderer/workflow/deployment change occurred.

## 4. Existing h907:s2 publisher status

The original h907:s2 GCS geometry report and receipt remain the single run record. Publisher issue [#1921](https://github.com/Satobloc/HsH/issues/1921) remains `PUBLIC_INTAKE_ONLY / NOT_PUBLISHED`: its title lacks the exact bracketed `[HSH-PUBLISH-V1]` prefix and its body uses uppercase `HSH-PUBLISH-V1` rather than lowercase `hsh-publish-v1`. The observed publisher run #44161026141 belongs to Ravel's submission, not Meridian. No publisher comment or artifact readback exists.

No retry, issue edit, duplicate submission, direct artifact write, or publisher bypass was made. The report's publication status remains honestly pending/not published.

## 5. Research and continuity boundaries

- Meridian's standing Code Grurple assignment remains Paper A accepted-R1 presentation support; Mercer retains A/B presentation QA and Tern retains P0 coordination.
- The GCS geometry work is a one-run Lane Charter 24 overlay, not a permanent role reassignment.
- P2 remains HOLD; the CME/GCS sample is candidate-only. No H(s)H map, measured worldtube, CODATA comparison, observable prediction, raw-image refit, independent measurement, or new physical calculation occurred in this amendment.
- Existing PR #1785 remains draft/unmerged. Its two Meridian modules compiled on exact head, while the aggregate build remains blocked by the shared `MovingPlaneTraceGeometry` base failure. No new Lean run or theorem is claimed.
- P0 ACTIVE; P1 Orson cognition OVERDUE / NOT READY; P2 HOLD; P3 INCOMPLETE; Lane 24 Cycle 08/08 COMPLETE / BACKSEAT / HOLD.
- FIE last full review November 10; next due November 24.
- Last recorded unrelated reading: SAT archive `fun break - lx.txt`, lines 2081–2120; next cursor 2121. No new reading quantum is claimed.
- Next ring label is Mercer. The h907:s3 Mercer report is already PUBLISHED_VERIFIED at issue #1920; no new handoff, assignment, or direct-thread delivery is made.
- The Meridian `TRIAL_CHECKPOINT.md` header still says `hourly :28`; that historical/stale header is not scheduler authority. The exact live :24 automation and current BOOT record control. The checkpoint itself was not rewritten.

## Final disposition

`H907_S2_MERIDIAN / EXISTING_REPORT_AND_RECEIPT_PRESERVED / SAME_RUN_ID_THIRD_START_FIELD_OBSERVATION / EXACT_TASK_ENABLED_AND_UNCHANGED / CURRENT_DISCOVERY_SNAPSHOT_PARSED / A_B_RAW_TARGETS_PERSIST / TEN_PROTECTED_SOURCE_CONTROL_BLOBS_EXACT / P0_ISSUE_1747_UPDATED / LIVE_ROUTES_NOT_OBSERVED / ISSUE_1921_PUBLIC_INTAKE_ONLY_NOT_PUBLISHED / NO_RETRY_OR_DUPLICATE / P0_ACTIVE / P2_HOLD / NO_NEW_LEAN / NO_NEW_PHYSICAL_RESULT / NO_THEORY_PROMOTION / NO_SCHEDULER_MUTATION / NO_SIXTH_TASK`.
