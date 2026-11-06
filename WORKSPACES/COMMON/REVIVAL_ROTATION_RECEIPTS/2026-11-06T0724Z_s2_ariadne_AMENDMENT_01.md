# Ariadne h631:s2 receipt amendment 01 — full-export provenance and scheduler retry

**Base receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-06T0724Z_s2_ariadne.md`  
**Scope:** source-coverage correction and same-run scheduler readback only. This is not a new scheduled occurrence, worker selection, ChatGPT thread, task, or theory result.

## 1. Canonical historical export: full Library copy verified

The base receipt correctly described the shorter repository snapshot `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/26.09.22•26.09.23•ARIADNE — raw.json`, blob `df9c7a1fbddaa523f0b69cced8d761433490a454`: 1,322 mapping nodes / 1,321 message objects / 8 user-role messages. That snapshot is not the complete current export.

The current `WORKSPACES/ARIADNE/README.md` identifies the authoritative full Library export:

- File: `ARIADNE — raw.json`
- Conversation: `6ab339d2-8fb4-83ea-b728-c8001a034371`
- SHA-256: `2996046ea29672f69fbf48670c0b27049701039741229c158d4e89f5453b22a8`
- Size: 6,226,127 bytes
- Independently materialized and hashed in this run: exact SHA-256 match.
- Parsed structure: 1,364 mapping nodes, including 1,363 unique message objects: 10 user, 555 assistant, 798 tool. All 10 user-role objects have `author.name=null`.

The full export therefore supersedes the older snapshot for message-count and chronology claims. It does not change the attribution rule: classify these as user-role / Nathan-attributed source records, not name-authenticated authorship.

### Direct user-role instructions in the full export

| Message ID | UTC | Source-supported instruction / boundary |
|---|---|---|
| `722896eb-68c9-4e68-8b45-d698bf8d3750` | 2026-09-23 02:31:01.791 | Reboot from the largest/latest ordinary Revival Rotation in Folder 21, explicitly not SABLE. |
| `0203c7d6-820e-4256-aeb4-72ba536cd04c` | 02:43:01.557 | Resume the prior Ariadne work. |
| `055a10f4-1773-42b5-9033-92380b27e8d1` | 04:16:50.427 | Create/check an inbox and leave Orson a role/specifications/resources note. |
| `c4f0aae9-3290-42c6-a5d0-b42c19a88255` | 04:27:14.907 | Broad archive inspection/reproduction discretion, bounded by current workflows/onboarding; constructive workflow suggestions welcome; apparent failures should be diagnosed; Tern controls scheduled tasks. |
| `e689eb6e-5814-4a27-a366-796605bd5f4d` | 04:48:27.113 | A Python-offload study may be proposed to Tern; it is not a self-assigned task or scheduler lease. |
| `4dba330e-820f-4854-b48d-fcbe69b2e391` | 05:01:28.697 | Temporary suggestion to sign replies for identity tracking. |
| `ef19bfbd-7ed2-465d-90d2-3e85566a4217` | 05:02:06.088 | Immediate retraction: “As you were.” The sign-off suggestion is not a standing instruction. No signet or worker-authored signature is authorized. |
| `446b3728-56fd-40b3-a122-9febf92a658f` | 05:24:42.253 | Reports a possible conversation-length limit and asks to save the thread. |
| `b45987fc-a7d2-4acc-9443-45522e8bb7d6` | 05:27:48.362 | Notes that the warning did not appear on the subsequent turn. |
| `cd0471c6-98c5-4efb-b91b-bc314691b141` | 05:32:34.732 | Directs continuation with the next task. |

The 05:24 length-limit notice is followed by two further user messages and assistant output; it does **not** establish confirmed exhaustion at that point.

A separate raw `Revival Rotation` export, conversation `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`, blob `386516f7c2d5b9ab2cd4f0050869ae00c133274d`, contains user-role message `41fe4df4-fa3f-4045-bf99-0f095903c052` at 2026-09-23 02:06:05.180Z: “Kirk material informs revival strategy, esp for human simulation (including me)”. Its `author.name` is also null. This is direct user-role evidence of methodological relevance, not proof of the contents or authorship of the still-unrecovered January 22 Kirk/Riley source bundle.

### Historical-thread boundary

- Preferred historical thread: `ARIADNE`, ID `6ab339d2-8fb4-83ea-b728-c8001a034371`.
- Last user message: `cd0471c6-98c5-4efb-b91b-bc314691b141`, 2026-09-23T05:32:34.732Z.
- Last user-visible assistant text: 05:34:04.674Z; later tool/code records extend to 05:35:00.798Z.
- Earlier `Science Made Stupid`, ID `6ab070ce-2384-83e9-b76f-4661c55867c4`, is a separate pedagogical predecessor, not the preferred identity-bearing thread.
- Current live usability and any newer successor remain unverified. Personal-context retrieval found no more recent usable active Ariadne continuation.

The correct classification remains `LATEST_THREAD_NOT_VERIFIED_AFTER_SEARCH` / V4 `THREAD_NOT_FOUND`, not `CONFIRMED_LIMIT`. The scheduled execution is a source-grounded revival session, not literal continuation of the historical process and not a newly created standalone chat. No cross-thread post, delivery, consumption, or acknowledgment is claimed.

## 2. Same-occurrence scheduler retry / timestamp mutation

The original h631 receipt recorded automation run `c296bf7f-8a08-8329-9006-d750ae541a52`, scheduled for 2026-11-06T07:24:00Z, with start time 07:45:20.886894Z and status IN_PROGRESS.

A later ID-specific task peek returned the **same run ID and same scheduled occurrence**, but with:

- `started_at=2026-11-06T08:15:26.662364Z`
- `recorded_status=IN_PROGRESS`
- `chat_ref=null`
- no completion timestamp.

The cached `latest_result` remains run `b16a5184-e9dc-8330-b34f-71372a77f72c`, the earlier h628 Calder result scheduled 04:24Z. It is not the h631 Ariadne result.

This is a same-run scheduler re-entry / start-time mutation observation. Its cause is unknown. The peek did not record this attempt as FAILED; IN_PROGRESS does not prove liveness or completion. It is not evidence of a second worker appearance, nonresponse, or a second completed research operation.

The h631:s3 :36 run had already started at 07:44:53.937685Z, before the h631:s2 run's first recorded start at 07:45:20.886894Z. The existing Ariadne→Alberr handoff was therefore correctly marked late optional context for Alberr's next appearance, h635:s2 at 2026-11-06T11:24:00Z. That handoff and Alberr inbox pointer already exist and were independently read back; no duplicate handoff was created.

## 3. Current branch and preserved controls

- Current HsH `main` tip at this amendment's pre-write read: `e18f14092f1e6ca52cc23de1e2a3336293b058a3`, 2026-11-06T08:23:34Z. Its commit changes only generated Conversation Viewer data files; no theory or manuscript source changed.
- Task graph blob `fafb3859a33306574625c58e8657c40a82cd30fd`: 18 node records and `branch_count=16`. Tern's 2026-11-06 note says the count semantics are undefined and retains 16; do not silently “fix” it.
- Code Grurple remains P0 / ACTIVE. Paper A R1 blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`; Paper B R1 blob `0a1dca42cafd9a02faceff4ec0851659a317b2bb`. Both manuscript gates are closed; both actual reader routes remain `PRESENTATION_PENDING / NOT_OBSERVED`. No Sites editor/owner preview or live route verification was available.
- P1 Nov 9 remains Orson-owned and NOT READY; P2 Nov 30 remains a real-measured-system gate with no final system selected; P3 Dec 14 remains a separate full-theory manuscript gate.
- Lane 24 H(s)H generation/worldtube/CODATA remains BACKSEAT/HOLD. No physical dataset, acquisition provenance, units, calibration, covariance, uncertainty budget, or independent holdout was selected; no physical calculation, fit, prediction, CODATA comparison, or independent measurement was performed.
- Existing PR #790 remains OPEN / DRAFT / UNMERGED at head `785517e02d5ad0768a1c95f9beea416eb37bd7f2`; exact-head run #42140428128 succeeded for its reported assertion/build steps. The separate Vercel free-tier deployment failure is not a Lean failure; no global axiom audit is established by that job summary. No new Lean run or formalization was performed.
- All four shared Mersearch lanes remain `requested`; no request-scoped run receipts were available. Mersearch was not executable in this runtime. No lane was overwritten or retriggered.
- FIE last full rereview remains 2026-10-27; the 14-day threshold is 2026-11-10. The prior h631 unrelated-reading cursor remains TheTANGLE line 2171 next; no duplicate reading was performed during this retry.

## 4. Safeguards

The existing :24 task remains enabled with the original hourly America/New_York :24 schedule. No task ID, prompt, schedule, phase, enabled state, branch, PR, issue, paper, BEDROCK, SAT-O/Blockwave equation, theory status, signet, or conversation title was changed. No sixth task or public issue submission was created.

**Disposition:** SOURCE PROVENANCE AMENDED / SAME-RUN SCHEDULER ANOMALY RECORDED / NO DUPLICATE RESEARCH.
