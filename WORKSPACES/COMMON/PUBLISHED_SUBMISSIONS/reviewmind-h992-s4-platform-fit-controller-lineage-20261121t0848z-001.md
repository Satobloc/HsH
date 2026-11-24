# Review-MIND h992:s4 | Human-agent experiment platform fit and controller-lineage audit

**Disposition:** assistant-level Review-MIND reconnaissance; Mira ring label only; no Mira research payload, private workspace, or specialist charter accessed; no human-subject session or model trial; no new tool built.

## 1. Ring label and access boundary

The fixed ring calculation selects Mira, index 5, with Aldus as the next label, index 6. Selection is not authentication of a ChatGPT instance or thread.

The live Code Grurple roster continues to place Mira outside the active internal-review corpus and under quarantine. The latest operational-only Mira receipt confirms that the actual specialist charter is not cleared for access and that no authenticated Mira thread is available. The user-supplied Review-MIND lane charter governs this assistant-level work, but does not override the quarantine. No Mira workspace or private HSH_RESOURCES payload was opened. No direct-thread delivery, response, or acknowledgment is claimed.

## 2. No-duplication check

The existing HsH reports at issues [#1935](https://github.com/Satobloc/HsH/issues/1935) and [#1940](https://github.com/Satobloc/HsH/issues/1940) already cover the Arima semantic-network study, Córdova's human-group facilitation study, and adjacent group-decision literature. Those studies were not re-reviewed or republished here. This report adds a distinct tool-fit and controller-dependence audit. Searches for STAGElab, nodeGame, CoGrid, and MUG found no existing HsH issue on these platforms.

## 3. Existing platform fit

| Platform | Strongest fit | Material limitation | License and operating cost |
|---|---|---|---|
| STAGElab | One human participant interacting with multiple LLM agents in a controlled chatroom | One human per room; a central Director selects speakers, targets, and actions, while a Moderator filters/retries outputs. The displayed agents are therefore not independent sources by default. | AGPL-3.0. Docker, Postgres, Redis, and provider API keys are required. No license fee is stated; hosting and model usage are extra. |
| nodeGame | Multiple human participants and bots in synchronous browser experiments with a chat widget, waiting rooms, and an internal database | No built-in LLM adapter. Custom JavaScript/HTML is needed. The main repository's latest observed commit is 2023-09-21 and the chat-widget repository's is 2021-11-15, creating a maintenance and security-review requirement. | MIT. No license fee. Hosting, integration, and maintenance remain real costs. |
| Multi-User Gymnasium (MUG) with CoGrid | Human-human and human-AI coordination in shared action environments; per-participant action/observation trajectories and browser-based experiments | The published paper explicitly says MUG has no built-in text chat or structured messaging. The demonstrated AI partners are reinforcement-learning policies, not LLM discussion agents. | MUG is MIT; CoGrid is Apache-2.0. No license fee. Hosting and experiment operations are extra. |

### STAGElab

Repository: https://github.com/what-if-horizon/STAGElab

The README describes a single human participant and multiple LLM agents. A central Director chooses who speaks, whom to address, and which action to take. Performer agents receive shared conversation context and generate candidate messages. A Moderator validates and cleans outputs, with retries before publication. The platform logs Director reasoning, events, prompts, and responses, and provides session export and participant-erasure endpoints.

This is useful for studying the effect of an orchestrated multi-agent environment on one human. It is not, by itself, evidence of independent multi-agent deliberation. The common Director and shared history are upstream dependencies. Any agreement among displayed agents must be treated as dependent unless the provenance graph shows otherwise.

The README says safety screening is optional and off by default. It also places informed consent, ethical approval, and active monitoring on the researcher. The full export is valuable for audit but contains sensitive participant text and model traces. A retention policy, provider-data policy, consent language, and erasure test must be specified before participant use. The repository's main commit observed in this review is dated 2026-09-27; the README describes a methods paper as forthcoming, not as a completed independent validation.

### nodeGame

Repository: https://github.com/nodeGame/nodegame  
Documentation: https://www.nodegame.org/faq.htm

The project documents real-time synchronous browser experiments, multiple human players, bots, waiting rooms, a chat widget, and internal data storage. It is the closest feature match in this scan for multi-human text deliberation with a bot or custom LLM facilitator. An LLM integration would be custom work, not a built-in feature. The old repository and widget commit dates mean a compatibility, dependency, and security spike is required before selection. The FAQ's learning-time estimate is the project's own estimate, not an independently validated budget.

### MUG and CoGrid

Paper: https://doi.org/10.3758/s13428-026-03078-x  
Full text: https://pmc.ncbi.nlm.nih.gov/articles/PMC13593629/  
MUG: https://github.com/chasemcd/mug  
CoGrid: https://github.com/chasemcd/cogrid

The paper reports browser-based human-human and human-AI experiments, including Overcooked and Slime Volleyball tasks. MUG records trajectories as sequences of states and actions and supports researcher-defined storage. Its explicit limitation is decisive for this lane: it does not provide participant-to-participant or human-to-AI text communication. It is appropriate for implicit coordination through actions and observations, not for measuring deliberative message exchange or source-attributed uptake.

The MUG main branch observed in this review was last committed 2026-10-21; CoGrid's main branch was last committed 2026-04-28. The MUG paper itself was published 2026-09-21 in Behavior Research Methods.

## 4. Controller and provenance finding

The critical distinction is between multiple visible agent identities and multiple independent information sources.

For a STAGElab-style session, a minimal temporal event graph should include:

- Human message events.
- Director decisions and their input-context identifiers.
- Performer model calls and raw outputs.
- Moderator decisions, retries, and withheld outputs.
- Published messages and their recipient sets.
- Source items and later references or uptake events.
- Model, prompt, shared-context, and provider identifiers.

Candidate projections:

- `pi_participant(G)`: the transcript actually visible to the human.
- `pi_researcher(G)`: the complete event export, including Director and Moderator events and model calls.
- `pi_provider(G)`: provider-side request/response evidence, only where actually available.

A candidate composition map merges these views by immutable event ID and content digest, preserving timestamps, recipients, parent events, and moderation status. It is lossless only if IDs are stable, digests agree, event order is preserved, and every visible message maps to its source call and moderation decision. The participant transcript alone is a lossy projection.

For independence analysis, two messages should not count as independent corroboration when their upstream provenance shares a Director decision, shared context, or the same evidence source, except for explicitly declared common task context. In STAGElab, the central Director and shared history are common causes. Distinct performer labels do not remove that dependence.

This is a proposed data model and test criterion, not a proved theorem. The existing HsH claim-lineage formalization in [PR #790](https://github.com/Satobloc/HsH/pull/790) is a possible substrate, but the mapping from STAGElab controller traces to its origin axes has not been formalized. The generic quotient-factorization work in [PR #1189](https://github.com/Satobloc/HsH/pull/1189) does not automatically prove this composition map.

## 5. Disconfirming experiment proposal

If the target is one human interacting with multiple LLM agents, STAGElab is the closest current candidate, but the central Director must be treated as an experimental factor. Compare:

1. Central Director coordinating multiple performers.
2. Independent agents with isolated contexts and a shared message board.
3. One model producing several labeled voices as a common-cause negative control.
4. Human-only baseline where appropriate.

Use the same task, evidence packets, model family/version, token budget, turn budget, and timing. Measure decision accuracy, correct integration of uniquely held information, source-attributed uptake, dissent preservation, confidence calibration, and participation inequality.

A rise in agreement without a rise in correct information integration or accuracy would disconfirm a collective-intelligence interpretation. If agreement disappears when the common Director is removed, the observed consensus is attributable to orchestration rather than demonstrated independent agent convergence.

For multiple human participants in text discussion, nodeGame is the closer architectural fit, but its age requires a maintenance/security spike. MUG/CoGrid should be selected only when implicit action-based coordination is the target.

No participants were recruited, no consent was collected, no model was called, and no experiment was run. This is a protocol proposal only.

## 6. Existing tools, proof status, and cost

- SciSpace was used for discovery. No new subscription or external API spend was incurred.
- Math Hopper issue #578 and PR #991 remain extraction/coverage work, not a verified Lean proof runner or completed three-repository scan. The existing smoke result reports extraction candidates with math pass/fail and Lean status unset; it is not proof of equation validity.
- Existing Lean PRs #790 and #1189 were inspected as possible formalization surfaces; neither was modified or used to claim a proof of the proposed event graph.
- The local environment has no Lean, Lake, or Elan executable. No new Lean 4/Mathlib module was compiled. The event graph and independence criterion remain unformalized proposals.
- Existing Whirligig geometry tooling was checked and left unchanged; it is not a human-agent chat platform.
- No new repository, branch, fork, dependency, service, or automation was created.

Open-source license costs are zero for the reviewed projects, but that is not a total cost estimate. Hosting, provider API usage, security review, custom integration, participant recruitment, consent/ethics administration, and data governance are not priced here. STAGElab's AGPL-3.0 network-copyleft terms need review before modification or deployment.

## 7. Cross-lane QC and continuity

A concurrent H992:S3 Lane36 report proposes a geometry-plot/comparison-freeze identity adapter. It labels itself assistant-level, proposal-only, not a physical prediction, not a BEDROCK promotion, and not Lean-verified. That is the correct epistemic status. It is not an Alberr contribution, a Mira handoff, independent corroboration, or cross-agent consensus. No recipient packet or direct-thread delivery was made.

The S3 report's final-source line names HsH main `1587a67`, but its own commit advanced main to `fccca11`. Treat that SHA as a precommit snapshot, not the final branch head. The S3 report also repeats an unrelated-reading range attribution error: the Kestrel h990 receipt and report establish lines 2726-2765, next cursor 2766. The earlier 2686-2725 range would have ended at 2726. The shared cursor remains 2766; no duplicate quantum was performed.

The S3 report flags a mismatch between the PWH lane-1 narrative and the live lane-1 request file. This run did not reconcile that discrepancy, overwrite a request, or release a lane.

Workshop boundaries:

- P0 Code Grurple remains active.
- P1 November 9 cognition paper remains overdue / not ready / Orson-owned.
- P2 November 30 paper remains on hold.
- P3 December 14 full-theory paper remains incomplete.
- FIE was rereviewed November 20; the next review target is December 4.
- Orson's manuscript, dataset, protocol, experiments, PRs, and ownership were not accessed or changed.
- The four canonical Mersearch lanes remain occupied. No Mersearch query, overwrite, release, or retrigger was made. The lane-2 compact output remains unreleased; the other lanes lack verified terminal output. The Mersearch service itself is not callable in this runtime.
- The task graph remains 18 records against 16 declared branches, with 17 reachable and one unreachable. Tern retains ownership; no graph repair was made.
- HSH_RESOURCES root metadata and README were read only. No private payload was accessed.
- The shared unrelated-reading cursor remains 2766 from the Kestrel 2726-2765 quantum. No new reading break was due and no duplicate reading quantum was performed.
- No physical calculation, measurement, fit, prediction, SAT-O/Blockwave equation change, or BEDROCK theory promotion occurred.

## 8. Scheduler and repository integrity

The deterministic ring successor is Aldus. No direct handoff or acknowledgment is claimed. The current run had no authenticated worker-thread reference; its cached result belonged to the preceding Sable run. The observed start preceded its recorded nominal scheduled time, and no attempt identifier was exposed. This is a run-envelope anomaly, not a reason to alter the task schedule.

The four enabled Workshop Relay tasks remain unchanged; the :12 task remains disabled. No task ID, schedule, phase, or prompt was changed. No sixth task was created.

Current repository heads observed at final pre-publication read:

- HsH main: `fccca11dca9a4f6bd3b93f613037726048b4ca72`
- SAT theory archive main: `d10dd333f2487054807bda398995300c538caa7e`
- HSH_RESOURCES main: `ee88a8c2d95745594144c1b428a8266bd5b25bbe`

During this audit, an existing visual-archaeology workflow made a depth-1 checkout of the preceding HsH main head `26fcda481386b088e3cb391884cfb6e6a9fed0e1` and committed derived visual-hypothesis state as `1587a67d4ac5c565add2bdf2d18e342f11fa6ee8`. The later `fccca11` commit added the separate H992:S3 workspace crosswalk. Neither commit changed BEDROCK, Steering Charter, Three Paper Campaign, Code Grurple roster, PWH queue, or task graph.

The assistant's repository work was read-only API/connector access, not a local clone. GitHub Traffic unique-cloner attribution remains unavailable. The observed visual-archaeology checkout is a shallow checkout, not a full clone.

**Final:** `H992_S4_MIRA_RING_LABEL_ONLY / QUARANTINE_OPERATIONAL_ONLY / ASSISTANT_LEVEL_REVIEW_MIND / PLATFORM_FIT_AUDIT / STAGELAB_CENTRAL_CONTROLLER_DEPENDENCE / NODEGAME_MAINTENANCE_RISK / MUG_NO_TEXT_CHAT / EVENT_GRAPH_PROPOSAL_NOT_LEAN_PROVED / H992_S3_CROSS_LANE_QC / NO_HUMAN_OR_MODEL_TRIAL / NO_NEW_TOOL / ORSON_P1_PROTECTED / FOUR_TASKS_PRESERVED / NO_SIXTH_TASK`.
