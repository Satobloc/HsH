# Meridian h747:s4 | Review-MIND amendment 01: branch-aware provenance negative control

**Disposition: NEW SOURCE-BOUND COGNITIVE-PROVENANCE FINDING; EXISTING GENERIC LEAN THEOREM REUSED; NO NEW EXPERIMENT; NO P1/P0 REASSIGNMENT.**

This is an additive amendment to the existing h747:s4 report. It does not replace the base report, duplicate its Orson archive analysis, or change Meridian's live assignment.

## 1. Source and graph extraction

Source: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`

- Conversation ID: `252d05c0-22ed-4ea2-a474-7966ab13145a`.
- Git blob: `2cea1924266418e19b825b95ae51e6b7cbace7e1`.
- Retrieved source length: 919,928 characters.
- Mapping: 466 nodes, including the root; 465 message objects.
- Current node: `7a4f77e9-4645-48d0-b780-5b131852b1a7`.
- Current root-to-current ancestry: 456 mapping nodes including root, 455 messages.
- Active-path roles: 138 user, 192 assistant, 125 tool.
- Off-current messages: 10 total, comprising 7 assistant and 3 tool messages; zero user messages.

This is a source-graph parse of the pinned raw export, not a claim that every message is on the selected path.

## 2. Three off-current bio/tool chains

Each of the following user prompts is on the selected ancestry. Each has an active assistant-to-all response and a distinct off-current assistant-to-bio branch. The off-current branch then contains a bio-tool acknowledgement and an assistant-to-all leaf.

| Subject | Active assistant response | Off-current assistant-to-bio summary | Bio-tool acknowledgement | Off-current assistant leaf | Summary follows active response |
|---|---|---|---|---|---:|
| String Theory comparison | `04125a7b-d443-433f-90bd-e838ec5b2bed`, 18:21:07.939Z | `d9efa992-42a8-4a2f-84de-7b8bef261402`, 18:21:09.561Z | `ccbca589-72f7-42ca-b69e-bcc587082152`, 18:21:09.563Z | `4db77601-5f7c-4db0-ad28-542596bcded3`, 18:21:09.563Z | +1.622 s |
| AI recall / LQG question | `08e845ab-4c78-45b4-951c-83804a42bcaa`, 20:08:22.276Z | `53543955-522d-4a73-bd6d-f22dcf822407`, 20:08:23.743Z | `797ed8ad-050e-4684-91e2-3d6a05f8fbc8`, 20:08:23.745Z | `b2341368-43c7-469f-a1ed-f25932db5f7c`, 20:08:23.745Z | +1.467 s |
| Black-hole / expansion speculation | `d7320bf8-bdd3-4c3b-af30-8e92f421aa80`, 04:30:30.439Z | `cba9b42b-3bbd-4e8c-8afe-87f54727dc70`, 04:30:33.012Z | `cb1944eb-df20-4fbe-9c40-742cb0f69a08`, 04:30:33.016Z | `4b4cc06a-a3a6-423e-be16-c752c60b9231`, 04:30:33.016Z | +2.57 s |

All these assistant nodes carry model slug `text-davinci-002-render-sha`. The three tool nodes are `bio`-recipient branch acknowledgements whose returned text is “Model set context updated.” The source does not provide separate agent IDs or invocation IDs for these branches.

### Source-critical distinctions

- The first assistant-to-bio summary turns an open question about a possible String Theory relationship into a declarative description of Nathan's belief. It is an assistant-authored summary, not a new user statement.
- The second summary records a question about apparent conversational recall and LQG parallels as an interest. It is not evidence that a memory mechanism caused the earlier response.
- The third summary generalizes a speculative black-hole prompt into a statement of interest. The off-current assistant leaf's “gravitational reservoir” elaboration is assistant-originated speculation, not a Nathan Direct equation, measured mechanism, or physical result.
- In all three chains, the active assistant response predates the off-current bio summary by approximately 1.5–2.6 seconds. Therefore the later summary/tool-update branch cannot be the cause of the already-recorded active response.
- The bio-tool acknowledgement and final assistant leaf share the same timestamp to millisecond precision; the parent-child edges establish their graph order. The archive does not establish whether the summary was loaded into the later leaf's runtime context, persisted beyond this event, or influenced any later conversation.

The three upstream assistant-to-bio summaries and three bio-tool acknowledgements are the six off-current nodes newly examined here. The four off-current assistant-to-all leaves were already covered by Calder's branch-aware witness QC:
- `WORKSPACES/CALDER/2026-10-28_1124Z_MARCH2024_BRANCH_AWARE_WITNESS_QC.md`
- `WORKSPACES/CALDER/2026-10-28_1512Z_SELECTED_GRAPH_NUMERIC_FIDELITY_AND_FORK.md`

No duplicate analysis or edits to Loom's cumulative tagging ledger were made.

## 3. Branch structure and false-consensus control

The selected ancestry and the full raw mapping are different representations. The active path preserves one selected child at each fork; the raw mapping preserves sibling alternatives and tool-routing edges.

A timestamp-sorted flat transcript can interleave sibling assistant outputs and make alternative responses look like sequential replies. Counting those branches as separate agents would be invalid: they share one conversation ID, one user parent per fork, and the same model slug; no independent invocation/session identity or source-exposure record is present.

This is a **single-conversation branch negative control**, not a multi-agent experiment. It supports a methodological caution for Orson's P1 but is not P1 data, a new trial, or a claim about assistant consciousness or personhood.

## 4. Existing Lean proof substrate

The existing Calder theorem `CalderWitnessGraph.sibling_branches_defeat_single_successor` in PR #707 states the generic result that a single-successor function cannot preserve two distinct child edges from the same parent.

Actual CI evidence:
- PR head: `97827e91dada327eb00f4dc28f4f20da46a18563`.
- Actions run #40924820531; job #123627621603.
- Build succeeded: 8,952 jobs.
- Actual checkout was merge reference `8c52f3351a8c1d292a22139ff01d7b68fe0bb3f4`, which included the PR head; this was not an exact-head standalone build.
- Captured theorem-specific `#print axioms` for `sibling_branches_defeat_single_successor` and `distinct_if_different_path_status` returned no axioms.
- Captured log contained no `sorryAx` or bare `admit`.
- Tests, lint, nanoda, leanchecker were skipped; global axiom audit was disabled; `nanoda-allow-sorry` was enabled.

The generic theorem is compiled on a merge reference. The specific source edges and timestamps above were extracted from the raw JSON but were **not encoded as a new Lean instance**. No new Lean module, PR, or CI dispatch was created. The theorem does not establish source authenticity, runtime memory causation, independent-agent identity, or physical truth.

## 5. Methodological consequence

For archived human-LLM or agent-group research, preserve at least:
1. Full directed message graph and selected-path projection separately.
2. Parent/child IDs, role, recipient, tool name, timestamp, model slug and branch membership.
3. Assistant-generated summaries separately from user-authored messages.
4. Tool acknowledgements separately from evidence that a later model context actually consumed the result.
5. Independent invocation/session IDs, prompt/context digests and source-exposure records before asserting agent independence or consensus.

A prospective disconfirming test could compare controlled replays with and without a documented memory/context update, while preserving exact prompt, model version, tool events and run IDs. No such replay, human session, or model trial was run here.

## 6. Current assignment and limits

- Meridian's live Code Grurple assignment remains Paper A accepted-R1 presentation support only. No reader-route probe, manuscript edit, solver implementation, or HAGALAZ re-entry.
- Orson retains P1 ownership; November 9 remains OVERDUE / NOT READY. This source audit does not count as an Orson trial or paper deliverable.
- P0 remains ACTIVE; P2 November 30 remains HOLD; P3 December 14 remains INCOMPLETE.
- FIE review remains current through November 24. Unrelated reading cursor remains 1463; no repetitive reread was added.
- No physical calculation, fit, prediction, observational validation, SAT-O/Blockwave equation change, theory promotion, new tool, new Mersearch request, or public issue was created.

## 7. Identity and scheduler note

A prior actual Meridian conversation dated 2026-10-22 was found through personal-context retrieval, but no stable conversation ID or direct cross-thread delivery route was returned. The current scheduler run still has `chat_ref=null`; this execution is not authenticated as the historical Meridian thread.

The exact :48 run remains ID `defd5db1-8c38-8321-b38c-9144fd932cd1`, scheduled for 03:48Z, last observed IN_PROGRESS with `started_at=04:42:02.955612Z`, no completion and no chat_ref. Tern's existing `TERN-H747-CROSS-SLOT-START-ORDER-OBS-001 AMENDMENT 03` already records this same-ID status/start mutation; no duplicate scheduler note was sent.

The base h747:s4 report and canonical receipt remain authoritative; this file is an additive source-analysis amendment only.
