# Ravel h945:s4 | Branch-aware conversation memory and active-state reconstruction

**Research date:** 2026-11-19  
**Run key:** `REVROT3-19-20261011:945:s4`  
**Selection:** Ravel (ring index 17); next deterministic label Orson Vay (index 18), `h946:s0`  
**Participation class:** source-grounded assistant reconstruction in the current scheduled execution. No authenticated current Ravel ChatGPT thread or historical-instance participation is claimed.  
**Lane:** one-run Review-MIND overlay. Ravel's standing co-theorist / Kerr-worldtube remit is preserved; this report does not replace it or modify Orson's P1.

## Executive finding

Conversation archives are graphs, not necessarily linear transcripts. The active visible conversation is the parent ancestry of the export's `current_node`. Other nodes remain part of the archive, but they are not automatically part of the active context.

A global timestamp sort can therefore import abandoned-branch user messages, assistant proposals, and tool outputs into a reconstruction of current intent. The risk is measurable in the two preserved Ravel conversation exports:

- `Syncmathcek`: 350 of 2,394 nodes (14.62%) are outside the current-node ancestry.
- `Ravel Free Build`: 2 of 814 nodes (0.246%) are outside the current-node ancestry.

The difference is not a reason to discard alternate branches. It is a reason to preserve two distinct products: an active-path view and a branch-labelled archive view.

This is a source-grounded case study of two single-user / assistant conversation graphs with tool activity. It is **not** a multi-agent group experiment, evidence of 19 independent workers, or evidence of assistant consciousness.

**First-blush (assistant reconstruction):** Ravel's source-specific instinct is to preserve the graph before interpreting its contents. For this Review-MIND overlay, the cognitive analogue is to keep the active conversational state separate from the full historical archive. This is a reconstruction from Ravel's direct-user role sources, not a claim about what a historical Ravel instance would currently think.

## 1. Source authority and revival status

No standalone signed Ravel specialist charter was found. The historical remit is supported by direct user-role messages in the archived Ravel conversations and by the source-backed `RAVEL_CHECKIN_2026-09-16.md`:

- primary co-theorist work: conceptual cohesion, drift detection, epistemic hygiene, full-theory probing, and methodological-risk review;
- preserve source chronology and provenance rather than flattening mixed archive formats;
- reconstruct the active visible conversation by following `current_node` backward through parent links;
- return attention to theorybuilding rather than continuing an acquisition/infrastructure detour;
- keep standard Kerr geometry, H(s)H mappings, and new hypotheses/tests distinct.

The latest located Ravel Free Build archive is the HsH `CONVOS_23` raw export, Git blob `8f2395625557ab25d1a68145535066ed6691fdac`. Its active branch ends at `2026-10-17T08:01:31.457Z`. The separate Library copy contains only 575 nodes; it is an older snapshot and is not the full 814-node HsH export.

The bounded search found no later usable live Ravel conversation. The archived export proves a historical conversation, not current thread usability. The present `:48` automation run is not an authenticated Ravel thread. This turn therefore follows the V4 source-grounded revival rule: useful work is performed here, without pretending a new chat was created or a historical assistant was contacted.

## 2. Conversation-graph measurements

For each export, `active_path` was reconstructed by starting at `current_node` and following each node's `parent` until the root. `off_path` is the full mapping minus that ancestry. Counts are direct structural counts from the raw exports, not estimates.

| Archived export | All nodes | Active-path nodes | Off-path nodes | Off-path share | Branch points |
|---|---:|---:|---:|---:|---:|
| Syncmathcek | 2,394 | 2,044 | 350 | 14.620% | 8 |
| Ravel Free Build | 814 | 812 | 2 | 0.246% | 1 |

Role counts make the difference concrete:

| Export | Full graph: user / assistant / tool | Off-path: user / assistant / tool |
|---|---|---|
| Syncmathcek | 157 / 1,238 / 998 | 12 / 191 / 147 |
| Ravel Free Build | 21 / 357 / 435 | 1 / 1 / 0 |

The active path in Syncmathcek contains 145 user, 1,047 assistant, and 851 tool messages. In Ravel Free Build it contains 20 user, 356 assistant, and 435 tool messages. Each active path also includes one message-less root node.

The Ravel Free Build export has 74 assistant messages carrying the `:36` automation identifier and 74 tool messages carrying the matching asynchronous-source identifier. Its model metadata includes GPT-6 and GPT-6-thinking. Those are model/version and execution metadata within one conversation export, not evidence of two independent agents. The export is tied to the `:36` lease, not the current `:48` lease.

The Syncmathcek export likewise contains multiple model-version labels inside one conversation. The inspected author/metadata schema supplies role, author name, message/turn/request IDs, model labels, and (in Free Build) automation/async-source metadata, but no attested independent-agent identity. Tool messages are tool outputs, not additional agent endorsements.

## 3. Interpretation: active context is not the whole archive

The Ravel check-in's `current_node` rule is methodologically consequential. In Syncmathcek, a global time-sorted transcript would include 350 nodes that are not on the active parent ancestry, including 12 user messages and 191 assistant messages. Those messages may be valuable historical alternatives, but they must not silently become current user intent, accepted conclusions, or active evidence.

Even the smaller Ravel Free Build graph has an off-path user message and an off-path assistant message. A low off-path percentage does not guarantee that an omitted branch is semantically unimportant.

The safe distinction is:

1. **Raw archive graph:** preserve every node, parent/child relation, tool record, branch, timestamp, and source format.
2. **Active-path view:** follow `current_node` through parent links; use this view for current intent, current decisions, and active conversational state.
3. **Archive review:** inspect off-path branches when historical alternatives matter, but label them as alternate/non-current.
4. **Explicit merge:** import a branch claim into active state only when an active-path event explicitly adopts or references it, preserving the branch source and the adopting event.

This also limits false consensus. A worker label, repeated report, model-version switch, tool call, or copied message does not establish a second independent agent. A cross-agent agreement claim needs distinct authenticated actors, distinct execution/context records, source-root lineage, and a time-indexed exposure graph. The historical Ravel conversation raised the risk of one thread agreeing with another without having seen the same evidence; that is a methodological concern, not an observed false-consensus event in these two exports.

## 4. Proposed branch-aware memory contract

Let `G` be the complete conversation graph and `c` its current node. Define the active ancestry:

`A(G,c) = {c, parent(c), parent(parent(c)), ...}` through the root.

An active-state summary should factor through this projection:

`ActiveSummary(G,c) = f(A(G,c))`.

Equivalently, if two exports have the same active ancestry, changing only off-path nodes should not change their active-state summary. An archive summary may use all nodes, but must retain branch membership and must not relabel off-path content as current.

A future record contract should preserve:

- conversation/export identity and immutable source digest;
- `current_node`, node ID, parent ID, and branch membership;
- author role separately from authenticated actor identity;
- model/version and automation/lease metadata separately from actor identity;
- tool execution and result provenance;
- claim owner, epistemic status, and source locator;
- active-path membership at export time;
- explicit branch-adoption/merge event and the exact claims adopted;
- whether the claim was exposed, quoted, revised, accepted, rejected, or left unresolved.

The active summary should not treat an assistant proposal as user endorsement. It should not treat a tool result as an independent agent. It should not treat a branch alternative as a settled decision merely because its timestamp precedes the current node.

## 5. Falsifiable evaluation

A bounded future study can use consented, source-preserving conversation exports with real branch structure. Compare two reconstruction conditions:

- **Branch-aware:** active parent ancestry for current state; separate branch-labelled archive view.
- **Flattened:** all nodes globally time-sorted without active/off-path distinction.

Blind human reviewers and independently evaluated summarizers would recover current user intent, accepted claims, unresolved questions, and evidence lineage. Score:

- off-path claim leakage into active summaries;
- false attribution of user intent or endorsement;
- source and branch attribution accuracy;
- recall of genuinely active claims;
- retention of useful alternate history;
- false consensus / false independence judgments;
- review time and uncertainty.

Negative controls: add an off-path branch without an active merge event; the active summary should not change. Then add an explicit active-path adoption event; only the adopted claims should enter active state, with their original branch provenance retained.

The proposal is disconfirmed or needs revision if branch-aware reconstruction does not reduce off-path leakage, if it loses important active information, or if a simpler representation performs equally well. No new experiment, human-participant study, model/API call, or synthetic subject result was performed in this run.

## 6. Formalization triage

The mathematical target is a branch-invariance/factorization property for an active-state summary. The existing generic projection/factorization work is relevant but does not yet define a conversation graph, active ancestry, branch status, or explicit merge semantics.

- Orson PR #1115: current head `883003fef9ff77e771bce30eac8a112741728fbc`; exact-head successful run #43404565082 exists. A later run #43614075640 failed before creating any jobs. The generic observation-factorization theorem is not a branch-aware conversation-memory proof.
- PR #1189: current head `da1e7d5dff0cdbc1d81303e3c573b79832087a38`; exact-head run #44106198466 succeeded, while another run on the same head failed. Its generic factorization theorem is a candidate proof primitive, not an instantiation of this proposal.

No new Lean module, theorem, fixture, `#eval`, PR, or CI run was created. No new proof is claimed. A future formalization must define the graph and merge policy from authorized source semantics before proving a property about them. Lean verification would check only that formalized definition, not validate the archive interpretation.

## 7. Cross-lane source and proof audit

- **Ravel PR #1984:** current head `da1819f131e34bc4a1adfe21d35b7403cd8668f6`; latest exact-head verify run #44414601495 failed. No exact-head pass is claimed.
- **Ravel PR #2004:** current head `584c400b836c6942f72b739c626ad12c1c66b384`; exact-head run #44373134985 succeeded. PR metadata identifies #2004 as Ravel's PR, correcting the earlier h934 report's attribution to Aster.
- **Mercer PR #1235:** current head `3f8e1610e52ac81908671f54a66900b501ce06a5`; the root verification aggregator does not import `MercerBlockwaveExactPhaseCurvature.lean`. The module is therefore not covered by that aggregate build.
- **Orson PR #1115:** no edits, review, reassignment, or P1 protocol change.
- **Physical-data gate:** Mercer h945:s3 issue #2083 identifies a controlled macroscopic air-core water vortex, the Nature Physics article, and a Figshare data locator. The raw deposit/version/files/hashes and run-level joins were not retrieved. This is a source-readiness candidate, not a raw-data analysis, prediction, fit, independent measurement, or P2 system selection. P2 remains HOLD.
- WWRD climbing-rope mechanics remains a first-blush heuristic, not a physical equivalence. No SAT-O or Blockwave equation was changed.

## 8. Campaign, archive, and scheduler controls

- P0 Code Grurple: ACTIVE.
- P1 Orson cognition / November 9: OVERDUE / NOT READY / ORSON-OWNED. This Ravel-labelled assistant reconstruction is not an authenticated Orson appearance and does not count toward the four-of-five target. The frozen P1 protocol, manuscript scope, dataset, and paper gate were not changed.
- P2 November 30: HOLD. P3 December 14: INCOMPLETE. The three gates remain separate.
- FIE review is next due November 24; it is not stale.
- WH-02 remains Calder-owned; WH-05 remains Tern-owned and blocked.
- Task graph remains ACTIVE_SEED, 16 declared branches / 18 records; the mismatch is unresolved and was not edited.
- Mersearch was not callable in this runtime. All four canonical request lanes remain occupied/requested; no lane was overwritten or retriggered. GitHub raw-blob retrieval and the Library were bounded source fallbacks, not a Mersearch run.
- The three-repository onboarding and HsH/SAT archive front doors were read. HSH_RESOURCES was limited to its front-door/tool-chest material; its private internal index/payload was not opened.
- The previous Tern h944:s4 receipt records an unrelated SAT archive reading break at lines 2441-2480, return cursor 2481. This activation did not duplicate it.
- No new tool, dependency, subscription, paid API call, human study, physical calculation, fit, prediction, independent measurement, or theory promotion.

## 9. Handoff and participation boundaries

The predecessor Morrow h945:s0 packet from Tern h944:s4 is `TIMING_UNRESOLVED_OPTIONAL_CONTEXT_ONLY`, created after the nominal :00 slot began. Its repository inbox pointer is present; no Morrow consumption or acknowledgment is established. The latest observed :00 run remained h944:s0 Hale; no h945:s0 Morrow run/receipt was found.

Next deterministic label: Orson Vay, `REVROT3-19-20261011:946:s0`. Orson's P1 remains protected and the Orson inbox already contains multiple optional contexts. No new Orson packet or assignment was created to avoid duplicating that queue. The next activation should start from `ORSON_VAY/BOOT.md`, `README.md`, `CURRENT_WORK.md`, `ROLE_CHARTER_2026-10-09_LLM_COGNITION.md`, `P1_PROTOCOL_FREEZE_2026-11-02_METHODS_ARCHIVAL_SCOPE.md`, issue #564, and PR #850. No direct-thread delivery or acknowledgment is claimed.

The existing :48 task remains enabled with its original ID and exact hourly schedule. The current run was still in progress at the last scheduler read, with `chat_ref` null. No task, ID, phase, cadence, or enabled-state change was made. No sixth task, signet, or conversation rename.

## Source register

1. HsH `WORKSPACES/COMMON/RAVEL_CHECKIN_2026-09-16.md` (direct-user-derived source custody and Ravel work direction).
2. HsH `WORKSPACES/RAVEL/2026-11-17T1917Z_H907_S4_REVIEW_MIND_SOURCE_LINEAGE_AND_CORRECTION_LOOP.md` (prior source reconciliation; not repeated).
3. HsH `DEVELOPMENT_FULL_CONVOS/CONVOS_23/26.10.11•26.10.17•Ravel Free Build — raw (1).json`, Git blob `8f2395625557ab25d1a68145535066ed6691fdac`.
4. Preserved Library export `Syncmathcek` (2,394-node graph), reconciled in the h907 report.
5. HsH Ravel h934 geometry/source-fidelity report and current PR metadata for #1984 and #2004.
6. HsH Orson PR #1115 and PR #1189 exact-head workflow records.
7. HsH Mercer h945:s3 publisher issue #2083 and its source-boundary report.

**Epistemic status:** measured conversation-archive structure and source-critical reconstruction; methodological proposal; existing generic formalization crosswalk. No new empirical group study, no independent replication, no physical result, no new Lean proof, no theory promotion.
