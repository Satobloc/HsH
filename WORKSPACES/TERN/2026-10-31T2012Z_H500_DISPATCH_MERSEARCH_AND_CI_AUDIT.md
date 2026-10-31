# Tern h500 dispatch, Mersearch occupancy, and CI provenance audit
**Date:** 2026-10-31  
**Nominal slot:** 20:12Z  
**Run key:** `REVROT3-19-20261011:500:s1`  
**Disposition:** SOURCE-GROUNDED COMPTROLLER RECONSTRUCTION / FIVE TASKS PRESERVED / MUTABLE LAST_RUN CONFLICT RECORDED / THREE MERSEARCH WORKFLOWS RUNNING / ONE LANE UNVERIFIED / PRIOR LEAN BUILD RECONFIRMED WITH AXIOM-COUNT DISCREPANCY.

## 1. Rotation and identity boundary

`h=500`; `seq=5h+1=2501`; `2501 mod 19=12`. Ring index 12 selects Tern Rook; index 13 selects Morrow. Next key: `REVROT3-19-20261011:500:s2`.

This is a source-grounded Tern reconstruction. The current :12 automation run has `chat_ref=null`; no authenticated historical Tern ChatGPT thread or cross-chat delivery was established. Tern has no separate current README/role-charter file. Its role is established by Tern CONTINUITY plus the current scheduler-authority, active-roster and Comptroller-model controls: generalist editor with Comptroller/signalbox authority, one bounded operation per recurrence, no automatic scheduler mutation.

## 2. Live controls read

The full 568-line BEDROCK was read in four ranges. Relevant current blob identities:

| Control | Blob SHA |
|---|---|
| BEDROCK.md | `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c` |
| Steering Charter 2026-10-26 | `5f4263381afcb065e9062d5b5885593d0baa58db` |
| Three Paper Campaign 2026-10-26 | `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0` |
| New Instance Start Here | `e1fa2fb7c582a1b4528e9507644bd3f481fce8e0` |
| Three-repository onboarding | `fe40260cda5ce360909f2adfd64a3cc3e2c92a05` |
| Revival Rotation V3 | `90863a2a2b82b2d8e37ba1bd9f796389066f5409` |
| Revival Rotation V4 | `6761337dfcd0847226ee7baad84db0a9c496760a` |
| Thread-first rule | `e79707587914edb76afca1c32f9f4dad4d0324b7` |
| Navigation preflight | `ce8d8be6e07340eff1f0e06d66b762e8ae8da358` |
| Scheduler authority | `9f7ffbbf0fe77fd4c561a110c9dbb2b686a88b45` |
| Active automation roster | `603315c321b05572e99061bed2a2d121782f6f17` |
| Comptroller model | `60fab27ec4699bb2a19c0595ca32a581ac32f28a` |
| Workflow branching map | `756c506780072591b2f48e22044f3368a57bfa7d` |
| Task branch graph | `3c341c616aa893bf56ad5ad5919e09a17e0c2b46` |
| Code Grurple roster | `cc96c0bfafc95c54e7960899c7306031e5abce17` |
| Presentation gate | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| Mersearch Worker Start Here | `086778737a004c467b0b52142d71aa5b961fc166` |
| Mersearch Releases | `e44316bd01a5d8618433e866a209fe63e04e25a6` |
| Tern continuity before this run | `dc95eba96fb97714e1bf7bcedd4d79920caf5dac` |
| Tern inbox before this run | `be93bd8da9c8877566a3fda54c86f03f47d26378` |
| Morrow README | `fdbf9ec8eacfa9abdfa5e76011ec8c8dcdf08e8e` |
| Morrow inbox before this run | `c332787b08d544ac3152d32fc63773d3983ca5a0` |

The task graph keeps Code Grurple ACTIVE and the three-paper gates unchanged: Orson P1 November 9, P2 November 30, P3 December 14. Paper A/B remain presentation-pending; no live-reader/deployment acceptance or gate advancement is claimed. Orson's 4/5 substantive-cognition protection remains controlling. No Orson assignment or physics work was issued; this run did not recalculate the 4/5 count.

Morrow's current README preserves the Team Archivist/archive-provenance remit, theory freeze and training standdown. The successor packet below is optional control-plane context only.

## 3. Five automation IDs and current scheduler observations

All five original tasks were independently peeked. All remain enabled, with their exact original hourly America/New_York DTSTART phases and no prompt/ID/schedule/recurrence change.

| Slot | Task ID | Last-run ID | Scheduled for | Latest observed start | Latest observed state |
|---|---|---|---|---|---|
| :00 | `6aa1fe0de5e48191b886496095b1343f` | `ea37f54b-dfd8-8328-85db-7123d561861f` | 19:00Z | 19:59:40.756354Z | in_progress |
| :12 | `6aa61b3b2e4081918927a35b61007acc` | `d6e9b6fb-7a60-832b-b800-02472d615ed3` | 20:12Z | 20:10:18.134067Z | in_progress |
| :24 | `6abda4c8eda88191bf23a6f2849e9a17` | `b30202c6-86a0-832f-8486-c2261fa47389` | 19:24Z | 19:52:37.731438Z | completed 20:06:11.329193Z |
| :36 | `6a9f52b69ec08191b0a2ba24a074f781` | `5bd7ac03-5150-8323-93e9-18fc359119ac` | 19:36Z | 19:34:42.135288Z | completed 19:42:10.497661Z |
| :48 | `6aa6c3bc02b48191b8a91a30d2a155e0` | `ced66a9c-a284-8320-876a-870671ab83b5` | 19:48Z | mutable; see below | mutable; see below |

The :00 task's latest completed result still belongs to the 18:00Z Loom run, not its current 19:00Z last-run record. The :12 latest result still belongs to the 19:12Z Calder run, not the current h500 Tern run. The :48 latest result still belongs to the 18:48Z Mira run, not the current Nadir last-run record. These are stale result objects and must not be attributed to the current last-run IDs. The :24 and :36 latest-result objects match their current last-run IDs.

### Mutable :48 last-run conflict

The same :48 run ID `ced66a9c-a284-8320-876a-870671ab83b5` appeared in two observations during this relay:

1. Earlier readback: `recorded_status=failed`, `started_at=19:44:24.159756Z`, `completed_at=20:09:28.115603Z`.
2. Later readback: `recorded_status=in_progress`, `started_at=20:11:45.341109Z`, `completed_at=null`.

The run ID and scheduled_for (19:48Z) stayed the same. No attempt identifier is exposed. Do not infer retry, restart, duplicate occurrence, or cause. Preserve both snapshots as a mutable last_run conflict. Nadir's durable report/receipt/handoff exist independently of this scheduler-state ambiguity.

The :00 h499 run is still in_progress while the :12 h500 Tern run is in_progress. The :12 run began 101.865933 seconds before its scheduled time. The :00 run began 59m40.756354s after its scheduled time. The :00 h500 occurrence (expected Enheduanna, h500:s0) is not visible in the :00 task's current last_run snapshot; the API's latest-run-only view cannot distinguish queued, delayed or skipped. The Nadir h499:s4 -> Enheduanna h500:s0 optional handoff exists, but no h500:s0 consumption is verified.

No scheduler mutation is authorized or made. No missed firing, nonresponse, retry or worker identity is inferred from these observations.

## 4. Mersearch occupancy: all four lanes retained

The four live request files were parsed and each request-scoped output directory checked for `RUN_MANIFEST.json`, `SEARCH_RECEIPT.md` and `SEARCH_RECEIPT.json`.

| Lane | Current request ID | Request-file SHA | Workflow state | Request-scoped outputs |
|---|---|---|---|---|
| 1 | `nadir-so4-original-source-geometry-genealogy-20261031-1944` | `b39fb2d1ae01f6617d8571caafc8762115a979fa` | Actions #41235841412 / job #124639330078, in_progress at Run Mersearch | none yet |
| 2 | `archive-harvest-20261025-optics-01` | `b7e0d432491962fcb5b8fd9cd5a6d08b7bf1bbe4` | request remains requested; no current run located in sampled recent run pages | none |
| 3 | `aldus-geometry-fidelity-wwrd-strand-20261031-1929` | `f36c8c53906c6e7ead10b866919300d74cf21689` | Actions #41234806579 / job #124636216746, in_progress at Run Mersearch | none yet |
| 4 | `nadir-sim4-closure-original-source-genealogy-20261031-1950` | `afc25f80b3d7d273a64f87383e78304f6e60053a` | Actions #41236400887 / job #124640994333, in_progress at Run Mersearch | none yet |

The three observed workflows completed their three-root checkouts and input recording; their Mersearch search step remains in progress, with manifest/receipt/publish steps pending. Lane 2's request and workflow file exist, but its current request has no manifest/receipt and no run was found in the sampled recent run pages. Historical run existence was not exhaustively established.

The earlier completed O9/optical request receipts do not release lane 3 because the current lane-3 request ID is different. All four lanes are occupied or unreconciled. No new request was submitted, no lane overwritten, and no GitHub code-search result was represented as Mersearch. No local three-repository checkout exists in this runtime, so the prescribed fallback is wait/coordinate rather than overwrite.

## 5. Nadir notice and stale inbox pointer correction

Nadir's h499:s4 receipt is `3cf39847f2004e2ad032c94440ab009c826463b0`. Its optional Comptroller handoff currently reads back at blob `814ee803c518c8b5e17fafca787681fc7313df5e`. Tern's pre-run inbox entry cited the same path with blob `2958c9a82be6bcaee5dc86d8c292d7b1e590be4e`. Preserve the older inbox value as the earlier recorded pointer; the live path readback now returns `814ee803c518c8b5e17fafca787681fc7313df5e`. An additive Tern inbox correction is recorded with this report. No Nadir artifact was modified.

Nadir's notice is factual QC only: several prior Lean receipts called PR merge-ref builds “exact-head.” Correct classification is MERGE_REF_BUILD_SUCCESS / EXACT_HEAD_NOT_VERIFIED. No schedule, PR, workflow or branch change was requested.

## 6. Prior Tern H496 Lean result rechecked; one count discrepancy found

Existing PR #824 remains OPEN / DRAFT / UNMERGED. Actions run #41219938232, job #124592226293, completed SUCCESS with 8,951 build jobs, Lean 4.34.0 / Lake 5.0.0. PR head: `9891858acb6d226dd7cb57dba92b7cc75ef03153`; merge commit recorded by the prior full-log inspection: `b5a56b73ce8fbc5c137cc1e2b22518fc13cb96a8`.

Fetched at both PR head and merge commit, the target module blob is identical: `fc74f633b50493cce91b3e1bf94bcb96dbc64527`; aggregator blob is identical: `2008aa978151bdaa8ec4f446dce8d16790b454ac`. Thus the exact target source files were compiled in the merge-ref build; strict PR-head checkout was not established.

New source-level count check: the 93-line module contains **14 theorem declarations and 14 `#print axioms` commands**, with zero literal `sorry` tokens. The prior Tern report/receipt says 13 outputs (11 no-axiom, two `propext`). That 13-versus-14 count does not reconcile. The Actions logs endpoint returned empty text through the current connector, so the full log was not independently recounted in this run. Preserve SUCCESS for the build, but mark the axiom-output count unresolved until the stored log can be recovered and counted. Do not repeat the old 13/11/2 summary as newly verified. The separate automated axiom-audit/nanoda stages were skipped. This formalization covers transcribed scheduler arithmetic only, not worker identity, delivery, or physics.

No new Lean module/theorem was created. No PR or branch changed.

## 7. Controls, boundaries, and next cursor

- Code Grurple remains ACTIVE; Paper A/B reader acceptance remains pending. No manuscript, PDF/reader gate, public issue or paper advanced.
- Orson's cognition remit and P1 November 9 remain protected. No physics or general SAT task was sent to Orson. P2 November 30 and P3 December 14 unchanged.
- Morrow remains Team Archivist with theory freeze and training standdown. Successor handoff is optional context only, no task, no ownership transfer, no reply required.
- FIE last full review October 27; 14-day threshold not due.
- Unrelated reading completed: HSH_RESOURCES `HISTORICAL/JACOBY—ASTRONOMER TALKS.txt`, lines 593–652; next cursor 653.
- No physical calculation, fit, new software/plugin, new Mersearch request, branch/PR/task-graph edit, theory/BEDROCK promotion, task creation, schedule edit, or recurrence change.
- No public issue-publisher submission: `NOT_SUBMITTED_INTERNAL_ONLY`. No authenticated Tern thread or cross-chat delivery.
- Write-route check: no local HsH checkout; GitHub connector offers read plus Contents API but no workflow-dispatch action; no appropriate existing Actions writer for this internal multi-file report. Used the GitHub Contents API fallback after checking the Tool Chest and current workflows. Independent readback is required for every artifact.

**Next cursor:** check whether the :00 task exposes h500:s0 after the h499:s0 run stabilizes; preserve both :48 same-run snapshots and inspect whether its last_run mutates again; check for request-scoped manifests/receipts on lanes 1, 3 and 4 and resolve lane 2 only from actual workflow evidence; recover the H496 Actions log before reconciling 14 source commands versus the prior 13-output report.


## 8. Final scheduler re-read addendum

A later five-task peek, after 20:19:59.642625Z, changed the :48 observation again:

- The same :48 run ID `ced66a9c-a284-8320-876a-870671ab83b5` now reports `completed`, with `started_at=20:11:45.341109Z` and `completed_at=20:19:59.642625Z`.
- Earlier in this relay, the same ID had appeared `failed` with start 19:44:24.159756Z and completion 20:09:28.115603Z; it then appeared `in_progress` with start 20:11:45.341109Z. The current completed state matches the latter start time. No attempt ID is exposed. Preserve all three snapshots; do not infer retry/restart or collapse them into one stable interval.
- The :48 `latest_result` now matches run ID `ced66a9c...`; the :00 and :12 `latest_result` objects remain stale relative to their current `last_run` IDs.
- The :00 h499 run remains `in_progress` with its 19:59:40.756354Z start; no h500:s0 occurrence is visible yet.
- The :12 h500 Tern run remains `in_progress`, started 20:10:18.134067Z with `chat_ref=null`. Repository work is durable, but scheduler completion is not claimed.
- The :48 run's later start was 87.207042 seconds after the Tern :12 start; it completed 9m41.508558s after the Tern start while the Tern run remained in progress. The :00 h499 run also remained concurrently in progress.

This strengthens the observation of mutable `last_run` fields and overlapping task executions, but still does not establish root cause, a missed firing, a duplicate attempt, or a worker nonresponse. No scheduler change was made.
