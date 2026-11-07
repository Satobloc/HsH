# Sable h668:s4 — Team-Machine / Control-Plane Crosswalk

**Observed:** 2026-11-07 21:10:26Z  
**Nominal slot:** 2026-11-07 20:48Z / 15:48 America/New_York  
**Rotation:** h=668; seq=5(668)+4=3344; 3344 mod 19=0. Selected label: Sable (index 0). Successor: Loom (index 1), h669:s0.  
**Disposition:** SOURCE-GROUNDED SYSTEMS REVIEW COMPLETE · AUTHORITY OVERLAY CLARIFIED · READ-ONLY TRIAGE REPLAYED · ORSON P1 PROTECTED · SCHEDULER ANOMALIES ROUTED TO TERN · RECEIPT/HANDOFF READBACK PENDING AT CREATION.

## 1. Execution identity and scheduler evidence

The :48 automation remains enabled under task ID 6aa6c3bc02b48191b8a91a30d2a155e0. Its original hourly America/New_York :48 schedule and phase are unchanged. The five-slot phase framework remains :00/:12/:24/:36/:48; :12 is disabled, leaving four enabled task automations. No sixth task was created.

Current :48 run record:

- Run ID: b8788215-5358-8327-91cf-9a56ef98a7fb.
- scheduled_for: 2026-11-07T20:48:00Z.
- started_at: 2026-11-07T20:51:40.890824Z.
- At 21:10:26Z: IN_PROGRESS; completed_at null; chat_ref null.
- The automation-level conversation_id is 6aea3ec3-55dc-83e9-a744-d8bf46bd8cff. That value equals the chat_ref of the older Kestrel h667:s4 latest_result, run c0c33f2b-fa58-832e-bb52-73c8ec70a84b, completed 20:12:18.055519Z. It is not evidence of a current Sable thread or current-run delivery.
- latest_result still contains Kestrel's earlier report, not this Sable occurrence.

The current run's deterministic worker label is not an authenticated ChatGPT instance or thread. No current Sable chat_ref was exposed. The historical Sable conversation is an archived source, not a live thread. This work is therefore a source-grounded reconstruction in the scheduled context, not an impersonation or cross-thread continuation claim.

### Cross-task scheduler observations

The following snapshots were inspected without changing any task:

| Phase | Run / nominal occurrence | Recorded start and result | Identity limit |
|---|---|---|---|
| :24 | cf15c66e-1d54-8329-a123-85cff2d15950; scheduled 19:24Z | Started 20:26:27.991508Z; completed 20:51:33.604402Z; FAILED; chat_ref null. Start was 1:02:27.991508 late. | h667:s2 selects Tern by ring arithmetic; no authenticated thread or refusal. No h668:s2 record was exposed in the current last_run snapshot. |
| :36 | 8072a6c6-ebd0-832a-9543-f77333634b5f; scheduled 20:36Z | First snapshot: started 20:37:26.503811Z, completed 21:02:29.338248Z, FAILED. Later snapshot: same run ID, started_at changed to 21:04:55.713611Z, status IN_PROGRESS, completed_at null; chat_ref null. | h668:s3 selects Orson by ring arithmetic. No attempt ID or backend explanation. Do not infer retry, restart, refusal, or a distinct worker. |
| :48 | b8788215-5358-8327-91cf-9a56ef98a7fb; scheduled 20:48Z | Started 20:51:40.890824Z; IN_PROGRESS at 21:10:26Z; chat_ref null. | h668:s4 selects Sable by ring arithmetic only. |
| :00 | c965f8b0-05c4-8326-ad7d-9ba4ae24aba3; scheduled 21:00Z | Started 20:55:09.705733Z, 4:50.294267 before scheduled_for; IN_PROGRESS at 21:10:26Z; chat_ref null. | h669:s0 selects Loom by ring arithmetic only. |

For :00, :36 and :48, the automation-level conversation_id matches the older latest_result.chat_ref while the current last_run.chat_ref is null. Treat that field as a stale or task-level pointer, not current-run thread authentication. The :24 run likewise exposes no current chat_ref.

The :48 and :00 records were simultaneously IN_PROGRESS in the inspected snapshot. This establishes overlap in scheduler records, not separate authenticated agents. The :36 same-run record changed from FAILED/completed to IN_PROGRESS with a later start time while retaining its run ID. The attempt lineage is unresolved.

The immediate predecessor h668:s3 had no receipt or handoff at the expected 20:36Z paths when checked. The :48 run began before that predecessor's later status mutation. No predecessor handoff consumption is claimed. A prior Sable h649:s4 handoff to Loom exists, but its referenced canonical Sable receipt path was not found; no historical receipt was fabricated.

## 2. Historical Sable specialist authority

The original Sable conversation was recovered from the Library raw export and checked against the Sable workspace source ledger:

- Conversation ID: 6aa6701e-b800-83ea-a19a-31a802b7124d.
- Raw export SHA-256: dfe0ac536c98e903db3760646a3358cc4f9e5fb9b5e55b48ec975c36401f5302.
- Git blob recorded in the Sable source ledger: 57f65c43ece0abb05f38dfb577267312c80f788f.
- The archived messages have outer role user and author.name null. Attribution is therefore user-role / Nathan-attributed by conversation provenance, not independent author-name authentication.

The controlling direct messages include:

- 2026-09-14 14:35:05.332Z, message df0c6245-20ee-43bb-b381-f277f85bddb4: team-machine analysis, targeted questions, state-of-system analysis, automation-leverage design/testing, outside-tool/resource testing, knowledge-base surveying, scripting as an extraction/checksum multiplier, capability/skill-scale analysis, proof/Lagrangian procedure design, and modular knowledge-machine architecture.
- 2026-09-14 15:07:31.168Z, message f30e5304-ad8a-48ce-83ff-4d0a52a7bd4b: establishes a Sable inbox for periodic triage of other workers' questions and resource communications.
- 2026-09-15 01:44:40.792Z, message 3f6e9b2b-55d9-4136-b379-0978f7db69c1: keeps the Dashboard central and grants broad flexible workflow discretion under the then-current authority.
- 2026-09-15 02:11:07.676Z, message 8c800379-b9e6-4877-b0e0-994097748dba: assigns workflow-design/continuity authority and judgment over permissions/lane assignments; this historical authority is superseded for scheduler/task allocation by the 2026-10-26 Tern/Comptroller delegation.
- 2026-09-15 02:30:08.111Z, message 28fec60d-5829-43fb-bcdf-52a94b01ea55: includes theory work within lane exploration while retaining sandbox/quarantine boundaries, and emphasizes archive preservation, infrastructure, wayfinding, extraction, tagging and tooling.
- 2026-09-15 03:01:56.726Z, message 327ad2cc-2bd1-4c9f-80c3-839a64f1e34a: explicitly includes creative/non-theory exploration across HsH, GLASS and RESOURCES.
- 2026-09-15 03:17:40.488Z, message 71b3d3d4-1599-4aa3-afda-665fd17f90df: directs that other instances' standing questions be routed through Sable for triage as needed.
- 2026-09-15 05:44:08.333Z, message a6502323-5a1b-411f-86a7-8ff0acd4524b: explicitly prohibits conversation renaming by any instance.
- 2026-09-15 06:32:45.451Z, message 91883df7-c134-4f34-bf66-e1e43413ed7f: requests a cross-repository script standard to prevent collisions and overwrites.
- 2026-09-15 06:38:15.951Z, message df57d7a0-e64e-4be2-855c-febcf8c29078: asks that resources shown to Nathan be linked.

The historical specialist charter is systems analysis, capability architecture, workflow design/recommendation, archive/resource coverage, and continuity. It does not authenticate the current scheduled label as the historical Sable instance.

## 3. Existing architecture: what is live and what is only a design draft

Sable's TEAM_MACHINE_DRAFT and SYSTEM_ANALYSIS_001 remain valuable historical design documents. They sketch a modular knowledge machine with source, reconstruction, mathematics, and specialist modules, scoped inputs, interfaces, feedback, and a Dashboard. They do not define current executable module contracts, typed ports, stable domain/codomain assignments, state semantics, or composition laws. They are proposals, not the current machine or live worker roster.

The current system is distributed across existing registries and repositories:

| Projection | Existing source of state | What it does not establish by itself |
|---|---|---|
| Repository/source | HsH control plane; SAT theory/conversation archive; HSH_RESOURCES source/reference repository | That a source was read by a particular worker or entered a prompt |
| Identity/history | INSTANCE_STRATIGRAPHY and worker-specific historical source records | Authentication of a current scheduled run |
| Lease/schedule | ACTIVE_AUTOMATION_ROSTER and live automation records | A distinct model, thread, or successful execution |
| Run/attempt | run ID, scheduled_for, started_at, completed_at, status, chat_ref | Attempt lineage when no attempt ID is exposed |
| Task/ownership | TASK_BRANCH_GRAPH, Steering Charter, Three Paper Campaign, specialist controls | Permission to mutate a task or scheduler |
| Capability/tool | Tool Chest, Math Hopper, Mersearch release docs, Lean workflows, Whirligig, SciSpace/Wolfram connectors | That a selected worker has actually used a tool in this run |
| Artifact | repository path, blob/commit, checksum and independent readback | Delivery or exposure to a recipient |
| Delivery/exposure | worker inboxes, handoff files, actual thread/prompt insertion events | Consumption, comprehension, use, or acknowledgment |
| Verification | exact source/module blob, Lean/Mathlib version, workflow run/job, theorem target | Soundness of source translation or truth of physical premises |

Existing tooling was checked before proposing anything new:

- Mersearch stable 1.0 and the existing GitHub request bridge are documented. No Mersearch connector is exposed in this runtime. All four shared request files are currently status=requested; request-scoped manifests/receipts were not found at their expected paths. No lane was reused or overwritten and no new request was submitted.
- The existing Math Hopper script and smoke workflow were inspected. Math Hopper is an existing candidate-extraction aid, not a proof engine or physical validation.
- The existing equation pipeline and Lean 4/Mathlib CI are present.
- Whirligig is an existing HsH workspace/project, not a separate Satobloc/Whirligig repository under the checked name. It remains a protected second-tier priority.
- The SciSpace connector is available; it was not needed for this internal systems review. Wolfram is also available.
- No local Lean/Lake executable or repository checkout was present in the runtime. No new dependency, app, service, subscription, or cost was introduced.

No new tool is justified by this review. The current gap is a well-defined composition contract between existing state sources, not a shortage of another script or dashboard.

## 4. Proposed typed crosswalk and formalization gate

A source-faithful system model would begin with separate projections from the full system state S:

[
pi_I:S	o I,quad
pi_L:S	o L,quad
pi_R:S	o R,quad
pi_T:S	o T,quad
pi_C:S	o C,quad
pi_A:S	o A,quad
pi_D:S	o D,quad
pi_E:S	o E,quad
pi_V:S	o V.
]

Here I is stable identity/history; L is an execution lease; R is a run/attempt record; T is task/branch ownership; C is capability/tool access; A is an artifact; D is a delivery event; E is exposure/use evidence; V is verification evidence.

The composition from these projections to an operational or cognitive claim must be partial, not automatic. It is defined only when:

1. The selected ring label is distinguished from an authenticated instance/thread.
2. The automation ID, phase, enabled state and nominal scheduled occurrence match the run record.
3. Task ownership, permission, quarantine and current priority controls permit the operation.
4. A capability claim is supported by actual evidence and an available tool path, not inferred from a worker label.
5. An artifact is bound to its exact path, blob/commit, checksum and readback.
6. A delivery event names the recipient and channel. A repository write proves repository persistence only.
7. Exposure requires an actual prompt-insertion or access event for the exact artifact. Delivery does not imply exposure.
8. Use requires a trace linking the exposed artifact to a decision or behavior. Exposure does not imply use.
9. Verification binds the exact source/module version, theorem or test target, toolchain, workflow run and job. A merge-reference build is not an exact-head-only build.
10. A physical claim additionally requires an identifiable measured system, dataset provenance, units, calibration, uncertainty/covariance, and prediction-versus-fit separation.

This gives explicit projection domains and composition conditions without asserting equivalence among the layers. It also blocks invalid shortcuts:

- ring label ≠ authenticated worker;
- repository write ≠ ChatGPT-thread delivery;
- delivery ≠ prompt exposure;
- exposure ≠ use;
- separate labels ≠ independent agents;
- successful compilation ≠ sound translation;
- Lean proof ≠ physical validation.

**Formalization status: FORMALIZATION_BLOCKED_UNTYPED_INTERFACES.** The historical modular sketch supplies a graph-like arrangement and the word interface, but not typed ports or exact maps. Formalizing guessed interfaces would prove an assistant-invented model, not the historical Sable architecture. No Lean theorem or run was claimed. Once source-defined port types, state transitions and composition conditions are supplied, a small Lean module can be added to the existing project and compiled through its current CI. No new PR was created.

## 5. Read-only upkeep and cross-lane QC

The live task graph was read. It was updated 2026-11-07T19:32:00Z, contains 18 branch records but declares branch_count=16, and has 13 active/blocked candidates. The count discrepancy and graph ownership remain with Tern; no graph edit was made.

The existing WORKSPACES/COMMON/task_upkeep_triage.py source (blob 49d2fdd8f36b6091a3b06e0a65ad6c5d4e69ed01) was replayed in a temporary Python runtime against a compact projection of the 13 live active/blocked records. Its self-test passed. The read-only ordering was:

1. P0 Code Grurple interlock and Papers A/B.
2. P1 Orson cognition paper, due November 9.
3. P2 real-system paper, blocked worldtube readout, workflow upkeep and clone census.
4. P3 full-theory paper, due December 14.
5. P4 exploration commons.
6. UNCLASSIFIED campaign parent, LAB-SBS-001 and HAGALAZ solver unification.

Missing owner/date/review metadata remains visible; no priority or task state was invented or changed. This was the required lightweight scan, not a deeper portfolio sweep. The control-plane record says the next deeper sweep is due after five additional actual completed worker activations. That count is not independently reconstructable from latest-only automation peeks, and several current runs are failed or in progress; no deep-sweep claim is made.

### Orson P1

Issue #564 remains open. PR #850 remains OPEN / DRAFT / UNMERGED. Its current head is 675851d96b0694ed7bbd3afbab6c367568893835, updated 20:57:55Z. The new commit is Nathan-authored and changes a comment clarifying the BEI scope; it is not a new model experiment or manuscript completion.

Current Lean workflow run #42413556818 / job #128526646520 succeeded on synthetic merge commit 3895708cf01470159b161cc7201a9eda50e46381, merging PR head 675851d9 into current base 598a45b3. Lean 4.34.0 completed 8,982 build jobs. This is a current-base merge-reference build, not exact-head standalone verification. Tests, lint, nanoda and the separate axiom-audit stage were skipped. The successful build does not satisfy the missing source bank, authorized inference endpoint, canonical LaTeX/PDF, readable reader route, or independent/hostile review. November 9 P1 remains NOT READY. Orson retains ownership; no new trial or paper gate was advanced.

PRs #873 and #951 remain OPEN / DRAFT. Their inspected successful merge-reference builds checked out synthetic merges into older base c7dc2c483f50ae03fc7a7c530829170135e18d92, while their current PR base is 61cc8b65ffed70296e0121dbae067892a79c81d4. They are not current-base or exact-head verification. Their results remain useful for the exact module/merge trees tested, but should not be overstated.

P2 remains blocked on selecting a real measured system, acquiring source data and uncertainty/covariance, and defining the source-grounded forward/readout maps. P3 remains separate and incomplete. No physical calculation was performed.

## 6. Sable continuity and backlog

The Sable README and CONTINUITY_CHECKPOINT are the primary role/recovery surfaces; a separate SABLE/CURRENT_WORK.md was not found and was not created. SABLE/CONTINUITY.md belongs to the separate A.Sable Meridian branch and was not treated as ordinary Sable continuity.

The checkpoint header still said its last material update was 2026-09-15 even though append-only updates extended through 2026-11-07T05:36Z. This run corrects the header and appends this current overlay.

SABLE/INBOX contains nine OPEN entries: eight direct requests dated 2026-09-18 and one optional Orson NLI context note dated 2026-11-01. The originals remain intact. This run adds a routing note clarifying that old September priorities and temporary workflow powers are historical; current priority and authority come from the 2026-10-26 Steering Charter, Three Paper Campaign, current task graph and scheduler authority. No inbox item was closed, reassigned, or marked answered.

The prior unrelated reading was recent: Alice's Adventures in Wonderland, lines 27–69 (Sable checkpoint, 05:36Z, next cursor 72), and Babbage, Reflections on the Decline of Science in England, lines 1461–1500 (Kestrel h667:s4, next cursor 1501). No additional reading was needed in this activation. No physical off-screen break is claimed. FIE last full review remains October 27; the fourteen-day rereview is due November 10, not yet due.

## 7. Durable outcomes and next actions

One bounded upkeep-derived operation was executed: clarify the Sable authority/continuity surface and map the current distributed control plane to explicit typed projections and composition conditions. No task graph, automation, priority, owner, schedule, phase, branch, PR, or issue was changed.

- Sable report: WORKSPACES/SABLE/2026-11-07T2048Z_TEAM_MACHINE_CONTROL_PLANE_CROSSWALK.md.
- Sable checkpoint: WORKSPACES/SABLE/CONTINUITY_CHECKPOINT.md.
- Sable role overlay: WORKSPACES/SABLE/README.md.
- Sable inbox routing note: WORKSPACES/SABLE/INBOX.md.
- Tern optional control-plane note: WORKSPACES/TERN/INBOX.md.
- Loom optional successor note: WORKSPACES/LOOM/INBOX.md.
- Canonical receipt and successor handoff are in the common revival directories.

Next actions:
1. Tern may reconcile the current run snapshots, same-run :36 mutation, :24 delay/failure, :00 early start, and stale P1 graph head. This note is optional context, not a task or response demand.
2. Loom h669:s0 may use the optional handoff as context only. No task, response obligation, or ownership transfer.
3. Keep the proposed crosswalk at schema/proposal status until actual interface types and event fields are source-defined. Then formalize through the existing Lean project.
4. Revisit FIE on or after November 10 if the review remains due.

No public issue was needed: this is internal control-plane and continuity material. No new PR, branch, tool, recurring task, subscription or cost was created. No BEDROCK theory promotion, physical prediction, signet, conversation rename, or cross-thread delivery claim was made.
