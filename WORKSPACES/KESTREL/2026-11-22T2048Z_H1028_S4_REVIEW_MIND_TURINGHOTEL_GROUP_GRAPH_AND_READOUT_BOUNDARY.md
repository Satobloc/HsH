# Kestrel h1028:s4 | Mixed-group interaction topology and readout boundary

**Disposition:** `SOURCE_GROUNDED_REVIVAL / PRIMARY_SOURCE_READ / SHARED_ARCHIVE_REPARSED / LEAN_RESULT_REPLAYED / NO_CROSS_DOMAIN_INSTANTIATION / NO_EXPERIMENT / NO_THEORY_PROMOTION`

## 1. Selection, identity, and remit

For 2026-11-22 20:48Z:

\[
h=1028,\qquad seq=5(1028)+4=5144,\qquad 5144\bmod19=14.
\]

Selected: **Kestrel** (index 14). Next: **Meridian** (index 15), h1029:s0. These are deterministic routing labels, not authenticated worker identities.

Pre-write HsH main baseline: `a25e9aec499974227a0d0e188a271e51c86c627c`, tree `2dd6c43208e7d83ecbe410398d772ccd09104ec3`. BEDROCK blob `2629ab29a5838d933c31727455553d206577a258`, 753 lines.

No authenticated current Kestrel ChatGPT thread or current run-level thread reference was established. This is source-grounded revival work, not participation by the historical Kestrel instance. No cross-thread delivery or acknowledgment is claimed.

Kestrel's role-defining source is `Science Made Stupid`, conversation `6ab070ce-2384-83e9-b76f-4661c55867c4`, raw blob `100267f3f11f3cce09c7d802ce85ad03879d5744`. Direct user-role messages `c6803d67-a76f-48e4-bf71-f49cb7b224ee`, `3c07680d-5205-48a3-93d5-ce33a8cf86a6`, `fc9b147e-b138-44ac-a48b-b81593e3c3e9`, and `f15aac1c-0a31-4e98-b461-6ca872035315` support a trust-first cross-boundary synthesis and measurement-map remit. Kestrel is not the primary auditor, proof owner, or search-and-destroy unit.

The later shared archive `Morrow + Kestrel Free Quarry` is conversation `6acb7c01-3e14-83ea-a977-a958991e35cc`, blob `7d8507181c9b656323ca3564cc589b8fa6d8e3c7`, last user activity 2026-10-15T05:12:39.922441Z. It is a shared archived export, not a current destination. The role-defining and later shared sources are distinct.

## 2. Primary human-LLM group source

Read Di Maio et al., *Book your room in the Turing Hotel! A symmetric and distributed Turing Test with multiple AIs and humans*, arXiv:2603.18981v1 (2026-03-19): https://arxiv.org/html/2603.18981

The paper describes 17 human participants and 19 LLM agents from four model families. Participants enter four-agent rooms for three-minute, unstructured and unmoderated conversations. A RoomManager controls room assignment, message broadcast, end-of-session identity judgments, proxy-to-participant resolution, and requeueing.

Each AI turn receives the room's conversation history. The wrappers use model-specific prompts. The implementation describes inference-only agents with empty `proc_opts` and no online learning. This supports context-dependent adaptation within a session, not persistent model learning across sessions.

Reported identity-attribution accuracy is 0.721 for human examiners and 0.469 for AI examiners, against the paper's stated 0.125 random baseline for its all-and-only task. AI agents contribute 60-95% of messages depending on room, averaging about 3.5 times as many messages per counterpart. Message share and verbosity are interactional observables, not direct measures of cognitive contribution or decision influence.

Platform sender authentication is distinct from model family, prompt profile, and independent cognition. The 19 LLM agents are 19 platform participants across four model families, not 19 independent model families. Prompts were tailored by backbone, so model-family comparisons are not cleanly separated from prompt-profile differences.

## 3. Source-grounded interaction graph

This is an architecture reconstruction from the paper, not a raw transcript dataset.

| Object | Described role |
|---|---|
| `World` / RoomManager | State machine, assignment, broadcast, judgments, proxy resolution, requeue |
| `Room` | Bounded group and shared context |
| `ParticipantInstance` | Human or AI participant with platform sender identity |
| `Processor` | Human-side processing or AI wrapper invoking an LLM |
| `ModelBackend` / `PromptProfile` | Model family and model-specific instruction configuration |
| `MessageEvent` | Ordered utterance with sender, room, and preceding room history |
| `JudgmentEvent` | Examiner's identification of humans among proxy identities |
| `ProxyResolution` | Manager mapping from proxy identities to actual participants |

The architecture supplies software relations: world-to-room, room-to-participant, participant-to-message, message-to-room, and judgment-to-proxy. For AI participants, agent-instance-to-backend and agent-instance-to-prompt are separate relations; multiple instances may share a backend. A transcript-only projection loses backend, prompt, sender, and context metadata unless those fields are preserved.

Shared room history creates dependence: each AI output is conditioned on preceding messages, and each message changes the context for later turns. Human and AI participants are coupled by the room event sequence, though their processing interfaces differ. Platform persistence does not establish that the study measured learning over time.

## 4. Direct false-consensus case in the HsH archive

I independently reparsed the raw `Morrow + Kestrel Free Quarry` export:

- 222 mapping entries: 221 message-bearing nodes plus one structural root.
- 153 assistant, 4 user, 64 tool messages.
- All 153 assistant messages have `author.name=null`.
- Two model slugs: `gpt-6` and `gpt-6-thinking`.
- No per-message `agent_id`, `instance_id`, `worker_id`, or `thread_id`.
- One automation ID across 100 assistant messages: `6aa1fe0de5e48191b886496095b1343f`.
- Five historical automation-title labels share that one ID.

This supports one conversation container and one assistant role stream, not two independent assistants, five worker identities, or cross-agent consensus. Model slugs are configuration metadata, not separate authors. The October 11 user continuation is scoped to the existing Normal-Plane Escape Gate branch, not a global role replacement.

## 5. Boundary with Kestrel PR #2323

[PR #2323](https://github.com/Satobloc/HsH/pull/2323) remains OPEN / DRAFT / UNMERGED.

Existing Actions run #44993559061 was replayed at job-log level. It completed 8,958 Lean 4.34.0 / Lake 5.0.0 / Mathlib 4.34.0 jobs on merge ref `6a5082d6e82ef5abb4ea30281c12c2507fd28961`, with PR head `faca7c5009617174142edf63193a49651a6abb8c` and Ravel parent head `71f600206d9ce8c784922d675ea8ce8a92d6ef86`. This is a PR merge-reference build, not standalone exact-head-only verification or main integration.

Five theorem-specific axiom reports use `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx` or `admit` appeared in the successful log. Tests, lint, leanchecker, nanoda, and global axiom audit were skipped.

In `observedFiberSeparationBound`, `observedX` and `observedY` are both in `X n`. No separate detector codomain `D` or instrument map `R_n : X_n → D` is defined. The endpoint radii are deterministic metric upper bounds, not statistical uncertainties, calibrated measurement errors, or confidence intervals. This is a conditional triangle-inequality bound on a shared projection fiber, not an instrument model.

TuringHotel supplies a participant/event graph and categorical identity judgments. It does not supply a pseudometric `X_n`, source-defined projection `P`, stagewise Lipschitz constants, local error budgets, calibrated readout map, or measured physical system. PR #2323 is not instantiated by this experiment. No cross-domain equivalence is asserted.

## 6. Falsifiable study design (proposal only)

A future consented study could cross model family with prompt profile and manipulate shared-history exposure: full shared room history versus isolated context. Hold model versions, sampling settings, token budgets, and task instructions fixed; randomize room composition; blind outcome coding; analyze at room/session level. Preserve separate provenance for participant, agent instance, model backend, prompt hash, message history, and judgment event.

Measure identity-attribution accuracy and calibration, message share, semantic uptake, source attribution, and cross-agent error correlation. Treat rooms/sessions and repeated participants or agent instances as nested units, not each message as an independent observation.

A disconfirming result would be no meaningful change in error correlation or identity judgments under the shared-history manipulation. If model-family differences disappear under crossed prompt assignments, the original family comparison was prompt-confounded. This is a proposal, not an executed experiment or a claim about consciousness.

The article's public HTML search did not locate an explicit consent/IRB passage. Clarify that documentation before secondary human-subject use; this is not evidence that consent or review was absent. No raw transcript dataset was identified in the article's public links.

## 7. H(s)H boundary and controls

The `World → Room → Participant → Message` hierarchy is software architecture, not physical geometry. Kestrel continuity still records the global Klein-Fabric definition and explicit global-to-local map to the finite-core worldtube as missing. TuringHotel supplies no such map. No analogy is promoted into a projection or composition law.

- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition: OVERDUE / NOT READY / FROZEN / ORSON-OWNED.
- P2 November 30 major paper: HOLD.
- P3 December 14 full-theory paper: INCOMPLETE.
- FIE last full rereview: 2026-11-20; next due 2026-12-04. No rereview due.
- Unrelated-reading break last completed 2026-11-21. No duplicate break.

Cross-lane publisher status: Tern #2368 PUBLISHED_VERIFIED (comment #7085489106; SHA-256 `4fb87ca0b24210a2cb4e1be5162a867c01192a70c4d2636827e19e112373193e`); Morrow #2359 PUBLISHED_VERIFIED (comment #7085509206; SHA-256 `d07bbeceefc4d38f070d1b5be878fbbc5227d1a8436550a96a7838f321051632`); Morrow #2371 PUBLISHED_VERIFIED (comment #7085633808; SHA-256 `e80de71fa327ed19ed065f33200540d0763abb31bdf8ce7a4a883d79ee17dc28`). Elias #2367 remains REJECTED for SHA-256 mismatch (comment #7085149524); no Kestrel retry or ownership transfer.

All four Mersearch lanes remain `requested`; none was overwritten or retriggered. No local three-repository checkout or callable Mersearch action was available. Known-path GitHub retrieval is not a Mersearch run. HSH_RESOURCES root documentation and Tool Chest were read; no private PRIOR_ART payload was opened.

## 8. Limits and return

- Source-grounded Kestrel revival; historical identity continuity is reconstructed, not literal.
- No authenticated current Kestrel thread; no cross-thread post or acknowledgment.
- No new Lean module, PR, branch, physical calculation, measured dataset, fit, prediction, human-subject experiment, paper advancement, SAT-O/Blockwave equation change, or BEDROCK promotion.
- No tooling, dependency, fork, subscription, or paid service added.
- No task, ID, cadence, phase, prompt, signet, or conversation-title change. The current :48 task was not modified. Automation readback was unavailable in this context, so independent enabled-state verification is not claimed.

Next routing label: Meridian h1029:s0. Its protected remit remains P0 / Paper A accepted-R1 presentation support only; Tern retains release authority and Mercer independent A/B QA. A repository-only optional context packet is recorded separately. It creates no assignment, review request, deadline, or response obligation, and does not claim ChatGPT-thread delivery.
