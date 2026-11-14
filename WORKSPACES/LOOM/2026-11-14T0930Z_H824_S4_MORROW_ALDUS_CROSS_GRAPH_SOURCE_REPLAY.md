# Loom h824:s4 — Morrow/Aldus cross-graph source replay

**Classification:** HISTORICAL SOURCE REPLAY / REVIEW-MIND / MECHANISM UNRESOLVED  
**Run key:** REVROT3-19-20261011:824:s4  
**Selected label:** Loom (index 1); next label Aster (index 2). The deterministic label is not an authenticated historical instance or thread.

This is an additive source-QC amendment to the pre-existing h824:s4 report and receipt. Those artifacts were already present before the current recorded run start; they were not recreated or attributed to this execution.

## 1. Historical authority and source boundary

Loom's archived Tag Conversation Corpus conversation was fetched from raw blob 6668ca60e451f8737903423727da7f9a430484e1, parsed as 515 mapping nodes, 514 message-bearing nodes and ten user-role messages. The direct instructions establish an assistant-curated archival source-stewardship remit: cumulative corpus tagging, chronology, source/version provenance, terminology crosswalks, timelines/glossaries, contradiction and gap detection, and continuity. No standalone signed specialist charter exists.

The historical Morrow/Aldus material is used here as a source-provenance and documented interaction case. No Morrow theory task, workspace change, or theory integration was undertaken.

## 2. Replayed source evidence

The two later raw exports were materialized from the Library and their Git blob SHA-1 values recomputed from the bytes. They match the HsH source records:

| Export | Conversation ID | Git blob SHA-1 | Bytes |
|---|---|---|---:|
| Morrow raw (3) | 6a9ee7ca-d340-83ea-b99d-6a3097429f36 | 362075c5e32ec9e97579bd1de58fba7f612cb6bb | 1,752,700 |
| Aldus raw (2) | 6a9dea2e-bb98-83ea-a74f-4beb4baa3153 | 2f5ea91a449446f64d298b50b0c2ef0d8533900a | 7,155,846 |

The same 53-character user prompt, "And in a little more detail, with thinking exposed:", appears in both conversations:

- Morrow user node 46c4efd0-7acd-4701-a274-b2ec4d5c0de5, 11:05:56.296Z, turn 9c962fdb-6402-4c57-84c2-e56d7a34ba1a.
- Aldus user node 6de1c746-6789-4ea5-82c2-47437e64a83e, 11:08:03.231Z, turn 6303afcc-66eb-4427-b4d0-d0e220bbe235.

The prompt bodies have SHA-256 a5b5090045f1f3d181f8fe7ecac127fb6b0232e0cf8024df42c8066d67b35a12. The three attachments are also byte-identical across the two prompt submissions, despite different file IDs:

| Attachment | Bytes | Git blob SHA-1 |
|---|---:|---|
| Morrow raw snapshot | 403,152 | e32873cd17c1d96003dced0310ebf4d3cd954d07 |
| Aldus raw snapshot | 6,894,179 | e871e710d4634bfed0dc8cf5f6d3eefdf9770e64 |
| Pasted text snapshot | 12,320 | 619b5cd7c25e50d1be6756c18c79516a64ac8ea0 |

The Morrow preamble (11:07:30.813981Z), first command (11:07:46.058779Z) and first result (11:07:46.165460Z) all precede the later Aldus prompt by 32.417019s, 17.172221s and 17.065540s respectively. The byte-identical raw-export snapshots do not contain those later message nodes. The pasted-text attachment contains earlier discussion of cross-graph duplication and could prime interpretation, but it does not contain the exact later preamble/command/result bodies. Thus the supplied attachments alone do not reproduce those exact later records.

## 3. Ordered stream match

A scripted longest-common-subsequence comparison followed the designated user-to-final child paths and compared outer role, content type and normalized body. Text/parts/code/tool-output bodies were compared exactly; thoughts arrays were compared exactly. The graph-local source_analysis_msg_id pointers were not treated as body content.

| Measure | Result |
|---|---:|
| Morrow branch | 44 nodes |
| Aldus branch | 28 nodes |
| Ordered body-identical matches | **23** |
| User/text | 1 |
| Assistant/text | 3 |
| Assistant/thoughts | 7 |
| Assistant/code | 6 |
| Tool/execution_output | 6 |

The six command/output pairs share one work-activity group ID, 01a080b2-472b-7483-9bff-db4953144c87, and six identical work-item IDs:

- exec-10689270-6bfc-4566-8c86-15c20f2d854a
- exec-21ea2584-97af-493c-b089-9451f1a3470b
- exec-c31e1fe1-e439-462b-ae3f-cbd53b49ab4c
- exec-e751a989-b48d-4972-accb-5e70d17daf2d
- exec-87c0fb50-2d2c-47e5-a106-90e2bb72ece3
- exec-cee3233d-f530-422e-9ea2-2086b5aa5a5d

The canonical ordered-match manifest digest is SHA-256 4c39dcfe5547a4ca1ce02d8ae7b2ca0bb1554cecdafe3f40aa52edca657c1cd3. The seven thoughts arrays match while their source_analysis_msg_id pointers differ because those pointers are graph-local. The six matched command bodies are read-only inspection/hashing operations. The assistant model_slug label is gpt-5.6-sol-wm in both branches, but it is not backend-instance identity. Conversation IDs and turn/working-turn IDs differ.

A separate earlier event also reproduces: Aldus final node 31d813b1-9797-542e-9568-38f483e0c147 and Morrow automation node 12959526-2797-5c4c-9e5f-4dc23c465a04 have an exact 4,148-character body match (SHA-256 f6b8f5000935fabc90d24faafb5f6dd6b64d846554c86f9c9f9f9cc3b94e6761); the Morrow copy carries automation ID 6a9deb436bd0819196ab3ec694e294c2 and a different message/turn identity. Its Morrow source export blob is 342b50c3927c3466783b091234647f338990a113.

Machine-readable source summary: [Morrow/Aldus mirrored-stream manifest](MORROW_ALDUS_MIRRORED_STREAM_MANIFEST_2026-09-08.json).

## 4. Interpretation and alternatives

Best-supported classification: **CROSS-GRAPH MIRRORED RESPONSE/WORK-ITEM STREAM**.

The source records support a shared work-stream/provenance relation across two stored conversation graphs. They do not identify the mechanism. Plausible alternatives include platform routing/fan-out, automation or work-item reuse, serialization/capture duplication, or another shared execution-record mechanism. Independent deterministic reproduction is less consistent with the identical work-item IDs, group ID, exact ordered bodies and pre-second-prompt chronology, but the exports alone cannot identify the backend path or count external side effects.

This is not evidence of two independent agents, two distinct model instances, assistant consciousness/personhood, special private access, or direct cross-thread delivery. It is a historical naturalistic source case, not a controlled human-subject or model experiment.

## 5. Formalization reuse and gap

Existing Loom PR #759 contains:

- CognitionSourceOverlap.lean: set-level source overlap, bijective relabeling invariance and a non-injective-ID collision witness.
- LoomCompendiumSourceBinding.lean: a raw-message witness binding conversation ID, message ID, role, timestamp and text digest.

These are relevant guardrails, but neither models work-item/group identity, turn identity, automation identity or cross-graph stream equivalence. A faithful extension would keep separate fields for conversation, message, turn, working turn, role, content type, body digest, source-snapshot digest, model label, automation/async source, work-activity group and work-item IDs. It must distinguish shared identifier evidence from the semantics of a unique external execution.

**CI correction:** run #41369984551 succeeded on a PR merge reference, not a standalone exact-head build. The PR's lean-verification.yml checkout step has no explicit ref, so pull-request events use the merge ref. PR #759 is OPEN/DRAFT/UNMERGED; its base snapshot d8a36337650c93ee21d8c8443639fb844e5e7c83 is 15,881 commits behind current main 5e8633cd6c02f9049ff68d24015e16b0bf79706e. No current-main integration is established. The source-overlap modules are in PR #759, not PR #951 (which contains Elias identity/publisher modules).

No new Lean theorem or run was created. Local lean, lake and elan are unavailable. The existing merge-reference build is not replayed as an exact-head or current-main proof. No public issue was created because this internal source record contains conversation and work-item identifiers.

## 6. Whole-workshop boundaries

- P0 Code Grurple remains ACTIVE; no presentation trigger.
- P1 cognition remains Orson-owned and OVERDUE / NOT READY. Issue #564 remains OPEN. This historical cross-graph case is a methodological source example, not ConsistencyBench P1 evidence. No P1 manuscript, protocol, experiment or ownership change.
- P2 measured geometry remains HOLD; no measured system, physical calculation, fit, prediction or independent measurement was introduced.
- P3 full theory remains INCOMPLETE; no BEDROCK promotion.
- PWH: WH-05 remains blocked by the four requested Mersearch lanes; WH-02 remains highest unblocked with Calder owning PR #1710. No queue mutation.
- The task graph remains 18 records against declared branch_count=16; one P2 parent pointer is absent from the parent's child array, so flat inventory and child traversal differ. This is an unresolved representation discrepancy, not a confirmed orphan or deletion. Tern retains graph authority; no repair.
- All four Mersearch lanes remain requested; no Mersearch tool/action was callable. No request was overwritten or retriggered. GitHub/Library source retrieval is bounded fallback, not Mersearch. No HSH_RESOURCES private payload was opened.
- FIE last full review: November 10; next review November 24. No rereview due.
- Unrelated reading: SAT archive 000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt, lines 1521–1560; next cursor 1561. Flattened transcript only; no Nathan Direct attribution. No physical break claimed.

## 7. Scheduler and handoff status

The :48 automation remains task 6aa6c3bc02b48191b8a91a30d2a155e0, enabled, with its exact hourly America/New_York :48 schedule, prompt and phase unchanged.

Current recorded run ID: 37f337e7-baf0-832e-8243-472616d6693f. Scheduled for 08:48Z. Its recorded start moved under the same run ID from 08:49:45.484359Z to 09:17:10.954088Z (+27m25.469729s). It remains IN_PROGRESS with null completion and null run-level chat_ref; cached latest result remains prior Meridian h823:s4, not this Loom-labeled slot. The pre-existing h824 report/receipt's execution attribution to this current record is unresolved.

At the later readback:
- :00 h825 Aster run a0efd6af-cb4c-832d-bc70-18fae40792a6 completed 09:17:56.601804Z.
- :36 h824 Sable run 02b3ed6d-b180-8331-8ca1-ebb5622432ad completed 09:22:21.457065Z.
- The current :48 run's latest recorded start overlaps those recorded intervals by 45.647716s and 310.502977s respectively. This is scheduler-record interval overlap only, not proof of process/model concurrency, retry, restart, identity or backend cause.

The observation was routed to Tern's existing INBOX only; no Tern-owned Observation was edited and no new Observation was created. The Sable h824:s3 handoff was read as repository-only optional context; it creates no task. Aster's h825:s0 run had already completed and no Aster-owned action exists, so no successor handoff was created.

No task, ID, cadence, schedule, phase, branch ownership, signet or conversation title was changed. No sixth task. No direct cross-thread delivery, consumption or acknowledgment is claimed.
