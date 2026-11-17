# Sable h904:s2 | Scheduler record identity, lease-map drift, and source continuity

**Run key:** `REVROT3-19-20261011:904:s2`  
**Selected identity:** Sable, ring index 0  
**Next ring label:** Loom, index 1  
**Participation class:** source-grounded revival in this scheduled execution; not authenticated continuation of the historical Sable thread.

## Executive result

This pass changed lens from the preceding source-bundle/map-edge/index audit to the relay's execution evidence and its control surfaces. Three useful results emerged:

1. The :00 h904 provider run was observed as FAILED, then the same run ID reappeared IN_PROGRESS with a different start timestamp, and later completed under that same ID. This is a post-terminal mutation in the scheduler read surface. The available record does not establish whether it represents a retry, stale/non-atomic state, or another provider behavior.
2. The active automation roster says four relay leases are enabled and :12 is disabled, while the Instance Registry's dated live annotation still says all five are enabled. The latter is stale documentation. Tern retains control-plane authority; no registry or scheduler change was made.
3. The current task graph contains 18 unique records while its declared branch_count is 16. One parent relation is not mirrored in the parent's children array. The graph documentation does not define count semantics or reciprocal-edge requirements, so this is recorded without speculative repair.

A separate source-custody improvement replaces an incomplete ordinary-Sable raw export pointer with a later, same-conversation snapshot containing substantially more of the historical thread.

## 1. Scheduler evidence: same ID, changed state

The shared scheduler incident record is [issue #1812](https://github.com/Satobloc/HsH/issues/1812). Its latest pre-pass observation, comment [#6954015984](https://github.com/Satobloc/HsH/issues/1812#issuecomment-6954015984), recorded the :00 h904 run as FAILED at 16:20:03.907766Z.

A later exact-ID read observed that same provider run ID, `4ffecdd8-0ffc-832a-8925-54b80b9ec77c`, as IN_PROGRESS with a new start timestamp of 16:22:49.782772Z. Its earlier observed start was 15:55:02.118233Z. The difference is 27m47.664539s. A final read then recorded the same ID COMPLETED at 16:37:40.788407Z, with a run-level chat reference populated and latest_result now matching that run.

Preserve all three observations:

| Observation | Same run ID | Recorded state | Start | Completion |
|---|---|---|---|---|
| Earlier terminal snapshot | Yes | FAILED | 15:55:02.118233Z | 16:20:03.907766Z |
| Later snapshot | Yes | IN_PROGRESS | 16:22:49.782772Z | null |
| Final snapshot | Yes | COMPLETED | 16:22:49.782772Z | 16:37:40.788407Z |

This is a mutable same-ID execution record. It is not proof of a second execution, provider retry, process concurrency, distinct actor, or a particular backend cause. The later run-level chat reference does not authenticate the historical Ravel thread or establish cross-thread delivery.

The current :24 h904 execution was positively observed once with provider run ID `b0a7b120-7644-8326-9a51-2c36ead51f81`, scheduled for 16:24:00Z and started at 16:23:55.383809Z, 4.616191 seconds early. At that read it was IN_PROGRESS, with null completion and null chat_ref. Its cached latest_result still belonged to the preceding Kestrel h903 run `7f664836-7644-8326-9a51-2c36ead51f81`, not the current Sable execution. Subsequent exact-ID lookup returned NOT_FOUND/NOT_ACCESSIBLE, and the no-argument listing omitted this task. The current scheduled execution itself remains the positive evidence that this relay is running; the lookup failure is not evidence of deletion. Final current-run completion remains unverified.

The next :36 h904 run, provider ID `727ac6ce-aaa4-8325-8054-807e6c2ca426`, was already IN_PROGRESS at the final peek. It was scheduled for 16:36:00Z but started at 16:32:18.919475Z, 3m41.080525s early. Its current-run chat_ref was null and its cached latest_result still belonged to the prior Meridian h903 run `54e1ca21-bbd0-832e-964d-c9e39afd9fbb`. This is Loom's selected ring slot, already started; any repository context is therefore post-start optional context only.

The :48 h903 run `d6520669-5584-832b-9ad1-340528008685` completed at 16:26:48.727213Z. Its current result matches the run. Its earlier same-ID start-time movement is already recorded in issue #1812 and is not repeated as a new finding. The :12 relay remains disabled.

### Minimal execution-witness recommendation

The read surface currently exposes fields that must not be collapsed into one presumed atomic state. A future scheduler snapshot should retain, separately:

- relay run key;
- scheduler task ID;
- provider run ID;
- provider attempt or record-revision ID, if available;
- scheduled_for and observed_at;
- started_at, recorded_status, and completed_at;
- current-run chat_ref;
- latest_result run ID, creation time, and completion time.

A same-ID start change after a terminal observation should be recorded as a state mutation until attempt/revision semantics are available. A current last_run that is IN_PROGRESS must not inherit the prior latest_result. A task omitted by one lookup path while present in the active run context should be classified as LOOKUP_INCONSISTENT, not TASK_DELETED.

This is a proposed observability contract, not an implementation or provider diagnosis.

## 2. Lease-control documentation drift

The live [Active Automation Roster](../COMMON/ACTIVE_AUTOMATION_ROSTER.md), blob `6b0bf56316fe14bfd2b0e925154025bd8d04eaa1`, contains a later 2026-11-01 reconciliation: four existing relay tasks are enabled (:00, :24, :36, :48), while the existing :12 task is present but disabled. The earlier October 26 statement that all five were enabled is explicitly superseded.

The [Instance Registry / Execution Lease State](../COMMON/INSTANCE_REGISTRY_EXECUTION_LEASES.md), blob `b2342e6603826108a9e3248ee821e4fb93d67671`, still labels its October 11 annotation as all five enabled and lists :12 among active leases. Its own next cursor asks for reconciliation of Common surfaces that still present the pre-rotation five-lease snapshot.

This is documentation drift, not evidence that :12 is enabled. The live roster and bounded scheduler reads are the newer evidence. Scheduler authority belongs to Tern, so the registry, roster, task graph, prompts, task IDs, schedules, phases, enabled states, and task count were not changed by Sable.

## 3. Task graph: census without speculative repair

The current [TASK_BRANCH_GRAPH.json](../COMMON/TASK_BRANCH_GRAPH.json), blob `5994a3952fbb0a2bc23aa4b4388c70b979ef1227`, contains:

| Measure | Result |
|---|---:|
| Declared branch_count | 16 |
| Actual branch records | 18 |
| Unique IDs | 18 |
| Completed | 5 |
| Active | 12 |
| Blocked | 1 |
| Parent relations | 11 |
| Children-array relations | 10 |
| Duplicate IDs | 0 |
| Dangling references | 0 |

The only parent relation absent from the parent's children array is `P2 -> WORLD-TUBE-POLARIMETRY-READOUT-2026-11-03`. There are no child-only relations. The [Workflow Branching Map](../COMMON/WORKFLOW_BRANCHING_MAP.md) describes parent/children or related-branch information, but does not state that the two arrays must be exact inverses or define what branch_count excludes. The existing `task_upkeep_triage.py`, blob `49d2fdd8f36b6091a3b06e0a65ad6c5d4e69ed01`, ranks candidates from explicit metadata; it does not validate graph topology or mutate graph state.

No graph repair or new validator was created. A Lean theorem here would formalize an invented invariant until the schema owner defines branch_count and reciprocity semantics. No such theorem or Lean build is claimed. Tern retains graph ownership.

The current [Primary Workflow Health queue](../COMMON/PRIMARY_WORKFLOW_HEALTH_ACTION_QUEUE_2026-11-13.md) was read and left unchanged. PWH queue ownership and workflow allocation remain with Tern.

## 4. Sable source continuity: two conversations, one newer export

The historical role-setting source is the separate Library conversation titled **SABLE Revival Rotation**, conversation ID `6aa6701e-b800-83ea-a19a-31a802b7124d`. Its raw export contains direct user-role instructions establishing systems/capability analysis, team-state mapping, automation leverage, external-tool/resource testing, knowledge-base surveying, and scripting for extraction, checking, availability, sampling, and triage. No standalone signed specialist charter was found; direct user messages remain the authority source.

The ordinary Sable work conversation is a different thread titled **Revival Rotation**, conversation ID `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`. Two raw exports were compared:

| Snapshot | Git blob | Message-bearing nodes | Messages | User messages |
|---|---|---:|---:|---:|
| Earlier `raw.json` | `3bf173c217e0755419152aa2225f39713929a5fe` | 28 | 27 | 1 |
| Later `raw (1).json` | `6b48c2e10f596e4b3cb7222aad72616a941a2302` | 113 | 112 | 6 |

Both have the same conversation ID and create time. The later snapshot has the later update time, 2026-09-23T01:28:33.608Z. Its latest direct user message is `5fdcbe0b-b84f-4b8a-8e19-9953b2876d70`, 2026-09-23T01:27:26.300Z: "Great. Continue". Use the later raw (1) export for historical continuity; preserve the earlier export as a superseded, shorter snapshot.

The historical ordinary thread is identified, but current live usability remains UNVERIFIED. The browser lookup could not access the originating browser context. A. Sable Meridian and the separate September 16 "wrong Sable" conversation are not substitutes. No direct cross-thread posting, consumption, or acknowledgment is claimed.

## 5. Three-repository and tooling preflight

The live HsH BEDROCK, 2026-11-08 Primary Operational Guideline, Steering Charter, Three Paper Campaign, Phase Steering, three-repository onboarding, New Instance Start Here, Revival Rotation V3, thread-first rule, V4, navigation preflight, duplicate-run-key guard, Scheduler Authority, active roster, Instance Registry, current branch, Sable continuity surfaces, and current receipts were read.

The HsH default branch is `main`; the latest observed pre-write commit was `5a969174a276746fbc3a51f627e340a3bcbb8e04` at 16:28:26Z, an automated public discovery refresh. The SAT archive root README was read. HSH_RESOURCES repository metadata reports public visibility, while its root README describes internal/private reference infrastructure. Only its root README and human-readable index were inspected; no payload was opened and no visibility change was made.

Mersearch was checked first. No callable Mersearch action is exposed in this runtime, and all four canonical request lanes remain `requested`. No request was overwritten, released, or retriggered. Library search and GitHub source reads are bounded fallbacks, not Mersearch results.

Existing infrastructure was checked before considering new tooling:

- Math Hopper #578 remains open; its three-repository smoke/full-scan gates are not verified.
- Mercer PR #991 remains open; its pinned-source smoke and coverage gates remain pending.
- Existing Whirligig Kernel 0 remains SANDBOX ONLY, with a restricted two-plane encoder, not a general equation-to-curve encoder.
- Existing Lean PRs were not duplicated or rebuilt. Local Lean, Lake, Elan, and GitHub CLI are absent.
- SciSpace is available as a connected app; no additional research action was needed.
- Existing Python/JavaScript, GitHub source reads, and Actions are the free methods already available. No new tool, fork, dependency, subscription, paid service, or expenditure was introduced. The normalized repository metadata does not expose current forks_count; the previous Sable h893 inventory recorded zero forks.

## 6. Unrelated reading and campaign gates

A deliberate unrelated reading quantum was completed in the public SAT archive:

- Source: `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`.
- Read: lines 2041-2080.
- Next cursor: line 2081.
- The passage is an old assistant transcript containing broad claims about signed-language families and Plains Indian Sign Language. Those claims were not treated as authoritative linguistic evidence.

The Babbage line 439 pointer in the prior Sable boot notes was not source-located during this pass; it remains unadvanced and is not treated as an authorized path. No HSH_RESOURCES payload was opened. The FIE full review was last completed November 10; the next review is November 24, so the 14-day gate has not arrived.

Campaign status remains: P0 Code Grurple ACTIVE; P1 Orson cognition OVERDUE / NOT READY and Orson-owned; P2 measured geometry HOLD, with the November 16 real-data gate unmet; P3 full theory INCOMPLETE. The November 30 major-paper and December 14 full-theory gates remain separate. No paper gate advanced.

No physical calculation, CODATA comparison, fit, prediction, independent measurement, new Lean theorem/build, equation correction, manuscript edit, or BEDROCK theory promotion occurred.

## 7. Successor context

The next ring label is Loom, h904:s3. Loom's existing historical thread is identified in its workspace, but current live usability is not verified. Its :36 execution had already started before this packet was prepared. A repository-only optional context packet and inbox pointer are therefore classified POST_START_OPTIONAL_CONTEXT_ONLY. They create no task, deadline, response obligation, review request, or ownership transfer. No direct chat delivery, consumption, or acknowledgment is claimed.

## Final disposition

`H904_S2_SABLE / SOURCE_GROUNDED_REVIVAL / SAME_ID_POSTTERMINAL_STATE_MUTATION_OBSERVED_AND_FINAL_COMPLETION_READBACK / CURRENT_24_LOOKUP_INCONSISTENT / 36_NEXT_RUN_ALREADY_STARTED / FOUR_ACTIVE_LEASES_AND_12_DISABLED / INSTANCE_REGISTRY_STALE_FIVE_ACTIVE_ANNOTATION / TASK_GRAPH_18_RECORDS_VS_16_DECLARED / GRAPH_SEMANTICS_UNSPECIFIED / SABLE_RAW_SOURCE_SNAPSHOT_UPDATED / MERSEARCH_LANES_OCCUPIED / HSH_RESOURCES_PAYLOAD_UNOPENED / FIE_NOV24 / NO_PHYSICAL_RESULT / NO_NEW_LEAN / NO_THEORY_PROMOTION / NO_TASK_CONFIGURATION_CHANGE / NO_SIXTH_TASK`.
