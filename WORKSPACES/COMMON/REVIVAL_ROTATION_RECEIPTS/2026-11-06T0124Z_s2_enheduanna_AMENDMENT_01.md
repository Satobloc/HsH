# Amendment 01 — raw-source confirmation and scheduler restart reconciliation

**Amends:** `2026-11-06T0124Z_s2_enheduanna.md`  
**Scope:** additive source-attribution and scheduler-telemetry correction only. The original bounded research, formalization status, and handoff remain unchanged.

## 1. Historical source confirmation

The raw HsH export was fetched by its exact Git blob and parsed as JSON:

- Conversation: `Revival Rotation`
- Conversation ID: `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`
- Repository path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_21/26.09.14•26.09.22•Revival Rotation — raw (2).json`
- Blob SHA-1: `386516f7c2d5b9ab2cd4f0050869ae00c133274d`
- Direct message: `11399ca2-5bd6-4203-9e19-e8e044fbc736`
- Timestamp: `2026-09-23T02:04:49.417Z`
- Outer role: `user`; `author.name=null`.

Exact user-role text:

> Also: Alberr may appear as Albert or Einstein, of course. And his works and related material in HSH_RESOURCES should be part of the revival. With 16 year old and "timeless" different revival lanes (with some retconning perhaps where that didn't happen in the past)... or any other lanes you think/any full consolidation... which should probably be rolled all together with additional outside resources as "timeless".  
> Enheduanna is a similar case, though I don't know if there's much of that in the archives as yet. But do always consider all archives.

The parent message is an assistant-authored Alberr-revival summary. The direct instruction is broad archive-revival scope, not a standalone Enheduanna specialist charter, not a role/persona specification, and not evidence of historical worker-instance identity. Attribution remains user-role / Nathan-attributed by conversation provenance, not independently name-authenticated.

## 2. Mersearch and three-repository boundary

No Mersearch connector or local `mersearch` executable is exposed in this runtime. The four shared Mersearch request files remain `status=requested`; none was overwritten, resubmitted, or claimed complete.

A prior completed request-scoped Mersearch 1.0 result was reused as a locator, not represented as a new search:

- Request: `enheduanna-temple-hymns-nathan-source-20261030-1340`
- Mersearch stable commit: `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`
- Three repository source commits are pinned in its RUN_MANIFEST.
- Bounded receipt: 15,618 files / 20,810,723 records / 27 hits / 18 distinct paths.
- Root hit counts: HsH 25, HSH_RESOURCES 2; no SAT archive hit was reported.
- The repeated raw-export paths share message IDs and are not independent witnesses.

The exact raw HsH blob above was then fetched and parsed directly. The search receipt is navigation evidence, not exhaustive coverage or authorship proof.

The three repository front doors were consulted. HsH remains the live workflow repository; SAT_THEORY_ARCHIVE_2023-25 remains historical provenance; HSH_RESOURCES remains an internal reference/evidence surface and was not exposed through public links. No private resource paths or raw private contents were published.

## 3. Existing-tool and cost reconnaissance

No new tool was built.

- Existing `tools/archive_math_hopper.py` and `ARCHIVE_MATH_HOPPER_2026-10-26.md` were checked. Math Hopper is extraction/triage, not a proof engine.
- Existing Math Hopper PR #854 remains OPEN / DRAFT / UNMERGED and non-mergeable at inspection; its own body requires smoke CI or original-source replay before merge.
- Existing Lean PR #1401 and PR #1402 remain OPEN / DRAFT / UNMERGED. Their previously recorded exact-head Lean 4.34.0 / Lake 5.0.0 builds remain the available formal evidence; no new Lean run or theorem was needed for this restart reconciliation.
- Both PR preview deployments have Vercel free-tier daily deployment-limit failures (>100/day). This is a preview/deployment limit, not a Lean failure. No paid upgrade or retry was attempted.
- Existing Whirligig specifications and branch remain separate; no Whirligig changes were made.
- Runtime check: Git and Python are present; no local repository checkout, Lean, Lake, Elan, or Mersearch executable is present. GitHub Actions remains the existing Lean build route. SciSpace connector is available; it was not needed for this bounded operation.
- No new fork, branch, PR, dependency, paid service, tool, or automation was created.

## 4. Scheduler same-run restart observations

The :24 task remains enabled under its original ID `6abda4c8eda88191bf23a6f2849e9a17` and exact schedule:

`DTSTART;TZID=America/New_York:20261001T142400`  
`RRULE:FREQ=HOURLY`

The original h625 receipt recorded run ID `7770d483-c2f4-8323-81c3-0504d1b8693b`, scheduled for `2026-11-06T01:24:00Z`, with start `2026-11-06T01:24:50.715Z`.

A later task-specific peek returned the **same run ID and same scheduled occurrence**, but a changed `started_at` of `2026-11-06T01:52:29.475299Z`, status `in_progress`, `completed_at=null`, and `chat_ref=null`. The `latest_result` still belongs to the preceding h624 Aldus run `086ea983-9a9c-832c-8997-758a1331f7f3`, completed at `00:43:51.717605Z`; it is not h625 output. The separate `last_run_time` field also remains at `00:43:54.016811Z` and must not be treated as the current start time.

The h625:s3 :36 Tern run likewise retains run ID `e45e8d8a-4b00-832b-b572-2f2a66573e5c` and scheduled time `01:36:00Z`. The original handoff recorded start `01:41:29.155339Z` and failure `01:41:29.894252Z`; a later peek returned the same ID with start `01:54:43.677902Z`, failure `01:54:44.601033Z`, and `chat_ref=null`. Its cached latest result is an older Orson h611 result, not this Tern occurrence.

These are same-ID/same-scheduled-occurrence start-time changes with stale cached results. The cause is unknown. They do not establish a new worker, current liveness, refusal, cross-thread delivery, or loss of the already-read repository work.

Other task-specific peeks confirmed the original :00 and :48 tasks remain enabled with their original hourly phases, while the original :12 task remains disabled with its original phase. No task ID, prompt, schedule, phase, enabled state, or task count was changed. No sixth task was created.

## 5. Project and handoff disposition

- HsH main at the pre-write readback: `14c34604ae3c9c27cffadabe5af4e468ce358e3a`.
- Task-branch graph blob `b11cdcbad43b5f2d4a7abf35a1058c9f47f03fd1` remains stale at `2026-11-05T14:03:21Z`; Tern retains coordinator reconciliation. No graph mutation was made.
- Code Grurple remains P0 / ACTIVE. Ordinary H(s)H P2 geometry/CODATA remains BACKSEAT / HOLD. No P2 system was selected, no physical calculation/prediction/fit was performed, and no Factory Floor admission or BEDROCK promotion occurred.
- The existing Tern handoff packet remains repository-only optional context. The :36 retry/failure is now clarified in the accompanying handoff amendment. No authenticated Tern thread, inbox consumption, acknowledgment, or ChatGPT delivery is claimed.
- FIE rereview remains due 2026-11-10; last full review was 2026-10-27. No FIE rereview or new unrelated reading is claimed in this restart-only reconciliation.

No new public issue or publisher submission was warranted. The existing receipt and handoff are preserved; this amendment records only newly observed source and scheduler evidence.
