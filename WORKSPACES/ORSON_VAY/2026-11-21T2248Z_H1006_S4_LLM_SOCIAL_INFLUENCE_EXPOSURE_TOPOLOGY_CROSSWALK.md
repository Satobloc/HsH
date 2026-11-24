# Orson Vay h1006:s4 | LLM Social Influence: Exposure Topology and Provenance Crosswalk

**Status:** SOURCE-REVIEWED / FUTURE-METHODS PROPOSAL / NOT A P1 PROTOCOL AMENDMENT  
**Ring calculation:** \(h=1006\), \(seq=5h+4=5034\), \(5034\bmod19=18\). Selected label: **Orson Vay**. Successor: **Sable**, h1007:s0.  
**Execution authority:** deterministic ring label only. No authenticated Orson model-instance identity is inferred.

## 1. Scope and protected boundary

This is a substantive LLM-cognition literature and methods review, consistent with Orson's protected primary remit. It does **not** reopen the November 9 P1 experiment or manuscript.

The live P1 freeze remains controlling: no new LLM trial, human session, API spend, dataset expansion, protocol change, manuscript edit, or paper-gate advancement. P1 remains OVERDUE / NOT READY / FROZEN / ORSON-OWNED. P0 Code Grurple remains ACTIVE; P2 November 30 remains HOLD; P3 December 14 remains INCOMPLETE.

The current P1 study and h995 archive audit concern within-model self-history / consistency-guided revision under a shared GPT-4o-mini NLI evaluator. The 17 archived model-output files do not constitute 17 interacting agents. No cross-model peer exposure is present in the frozen P1 protocol. The h995 correlation report is already published at [issue #2274](https://github.com/Satobloc/HsH/issues/2274); this review is a separate literature comparator, not a P1 amendment.

## 2. Primary-source review A: prompt-assigned identity and scripted peer conformity

**Soffer et al., “LLMs Trust Their Own: Identity-Dependent Conformity in Multi-Agent Systems,” arXiv:2609.33495, submitted 27 September 2026.**  
Primary source: https://arxiv.org/abs/2609.33495

The design uses 12 open-weight instruction-tuned models from three model families across nine task settings. A target model first answers alone. Only items it answered correctly in that pre-exposure phase enter the critical conformity analysis. The target is then placed in a fresh context and receives seven **scripted peer responses**. The peers are represented as answer-bearing text, not independently running agents that communicate with the target. The pressure phase is therefore a controlled, one-turn peer-stimulus experiment, not a live multi-agent conversation.

The manipulated social cues include model-family / cross-architecture / minimal-group labels, AI-versus-human source categories, and prompt-described safety/alignment credentials. The labels and credential statements are experimental prompt content. They are not external authentication of a model's identity, independent certification, or evidence of an internal social identity representation.

Reported patterns include:
- A wrong in-group majority increases conformity relative to the neutral baseline; a wrong out-group majority decreases it.
- A correct ally labeled as out-group can increase conformity to an in-group majority, while a correct in-group ally can reduce conformity to an out-group majority.
- Chain-of-thought reduces baseline conformity and attenuates most identity effects, but does not make the cue effects uniformly disappear.
- Prompt-described safety credentials shift conformity, but do not turn the experiment into a test of independently verified credentials.

**Estimand boundary:** the primary conformity rate is conditional on the target having answered the item correctly before peer exposure. It is not the model's unconditional accuracy, general willingness to conform, or a direct measure of belief. The paper's authors explicitly caution that a model may discount an out-group answer without thereby verifying that the majority is wrong.

**Statistical and construct limitations:**
- The main paired tests use model-level observations across 12 models, a small between-model sample for broad population generalization.
- Most reported p-values in the main identity and ally tables are uncorrected; the paper applies Holm correction to the color-counterbalance check, not a single global correction across all reported comparisons.
- Model family and parameter scale are not cleanly separated, and the authors do not estimate a robust family-level effect.
- The cross-architecture condition uses GPT as a fixed out-group reference, which is asymmetric.
- The experiment does not observe live peer-to-peer communication, reciprocal updating, persistent group memory, or human participants.

This is evidence of **prompt-cue-conditioned behavioral conformity in a scripted peer setting**. It is not evidence that distinct agents formed a real group, that the models possessed human-like social identities, or that the behavior reflects consciousness.

## 3. Primary-source review B: repeated interaction and population-level path dependence

**Magistrali and Shani, “Aligned Alone, Misaligned Together: Forecasting Adversarial Capture in LLM Agent Populations,” arXiv:2608.22444v3, version dated 30 October 2026.**  
Primary source: https://arxiv.org/abs/2608.22444

This study moves beyond scripted one-turn peer exposure. It simulates 12 agents as copies of the same Llama-3.1-8B-Instruct model. Agents interact pairwise over repeated rounds in a complete interaction graph and retain a five-slot FIFO memory of recent interactions. The protocol runs 15 benign rounds, followed by 20 to 60 rounds with a committed minority of adversarial agents.

The task is explicitly framed as a coordination game: matching a partner's action is rewarded and disagreement is penalized. This matters. The observed population dynamics are not a pure test of social influence independent of incentives. The model population is homogeneous, not a heterogeneous collection of independently developed systems.

The paper defines “capture” operationally as at least 75% of agents choosing the adversarial action for three consecutive rounds. Its mean-field forecast is calibrated on benign interaction data and tested at held-out adversary doses. The authors' closure assumes exchangeable agents and independent draws from a five-slot memory distribution; it ignores repeated-partner dependence, temporal correlation, rationale content, and correlation between an agent's memory and the population state.

This is evidence that **repeated reciprocal information exchange plus persistent memory and an explicit coordination incentive can generate path-dependent population behavior in a homogeneous model population**. It does not establish that heterogeneous agents behave the same way, that the result transfers to human groups, or that the forecast is a general causal law. The extracted next-token probabilities are operational decision tendencies, not validated measurements of private belief or calibrated confidence.

## 4. Human-group comparator already reviewed: GUIDE

The h997:s4 Review-MIND source review of Liu et al., *Learning to GUIDE the Group: Self-Learning LLM Facilitation Across Multi-Party Tasks* (arXiv:2610.16231), is preserved at [issue #2283](https://github.com/Satobloc/HsH/issues/2283).

That study uses actual human triads with one LLM facilitator. Its five named internal components are sequential workflow roles, not five independently interacting agents. It therefore supplies a human-group / LLM-facilitator comparison, but not a heterogeneous agent-to-agent network.

The distinction matters because the human study's outcomes, the scripted peer-conformity experiment, and the homogeneous recurrent-agent simulation have different units, interventions, information states, and dependence structures.

## 5. Four non-equivalent evidence channels

| Evidence source | Exposure topology | Population | Main manipulated / shared dependency | What it can support | What it cannot support |
|---|---|---|---|---|---|
| P1 CGD archive / h995 audit | Within-model self-history and revision | 17 archived model-output files; no peer exchange | Shared NLI evaluator and common benchmark | Archive-level model-output and evaluator-dependence analysis | Peer influence or live group dynamics |
| Soffer et al. | One target receives seven scripted peer answers | 12 open-weight models, three families | Prompt-assigned group labels and credential claims | Cue-conditioned conformity among previously correct items | Reciprocal interaction or authenticated identity effects |
| Magistrali & Shani | Repeated pairwise interaction with persistent memory | 12 homogeneous copies of one model | Explicit coordination incentive, five-slot memory, committed minority | Model-population path dependence under the specified simulation | Heterogeneous-agent or human-group generalization |
| GUIDE | Human triads with one LLM facilitator | Human groups plus one facilitator | Learned facilitation policy and evaluator | Human-group facilitation behavior under the study design | Multi-LLM peer-network behavior |

These studies should not be pooled under a single undifferentiated “social influence” label. They occupy different points on at least four axes:

1. **Exposure topology:** self-history, scripted peer feed, reciprocal interaction, or human-facilitated group.
2. **Population heterogeneity:** one model's repeated outputs, heterogeneous model families, homogeneous model copies, or humans plus one LLM.
3. **Provenance strength:** transcript label, prompt-asserted identity/credential, verified model/process identity, or independently authenticated human participant.
4. **Temporal structure:** one-shot, repeated rounds with memory, or live multi-turn human discussion.

The main methodological gap is a study that combines heterogeneous LLM agents, reciprocal multi-round interaction, event-level source provenance, independent outcome evaluation, and actual human participation. None of the four sources above establishes that full combination.

## 6. Measurement and event-provenance requirements

The existing Orson Cognitive Readout Target Contract (CRTC v0.1) is the correct measurement discipline: declare exact model/version, unit, information state, target, criterion, channel, intervention, dependence graph, validation layers, and evidence status. This review does not amend the CRTC.

For future authorized group-interaction work, a transcript alone is insufficient. Preserve separate records for:
- `actor_instance` and `model_version`;
- `message_author` versus `quoted_or_summarized_origin`;
- `claimed_identity` versus `authenticated_identity`;
- `credential_claim` versus `credential_verification`;
- `message_created`, `delivered_to`, and `read_by`;
- `memory_written` and `memory_read`;
- `proposal_origin`, `facilitator_reference`, `participant_uptake`, and `decision_incorporation`;
- `pre_exposure_answer`, `post_exposure_answer`, and confidence readouts;
- randomization assignment, task version, prompt hash, evaluator identity, and evaluation time.

Do not infer exposure from transcript adjacency, uptake from mention, or causal influence from provenance alone. Delivery, exposure, uptake, incorporation, and causal effect are distinct relations.

## 7. Formalization and Lean evidence audit

A useful formal target is the distinction between an event's **visible transcript projection** and its **interaction-channel label**.

Let \(\pi : H \to T\) map an interaction history to its visible transcript, and let \(L : H \to C\) map the same history to its channel class (self-history, scripted peer, reciprocal peer, or human-facilitated). A decoder \(f : T \to C\) satisfying \(L=f\circ\pi\) exists only if \(L\) is constant on every fiber of \(\pi\). If the same visible text can arise from both a scripted stimulus and a reciprocal live message, a transcript-only projection cannot recover the channel.

This is an application proposal, not a new source-specific Lean theorem. The generic factorization criterion is already formalized in [Nadir PR #1189](https://github.com/Satobloc/HsH/pull/1189), module `NadirProjectionCoarseGrainFactorization.lean`, theorem `factorization_iff_fiberwise`. Its exact-head CI run #44106198466 built the module on PR head `da1e7d5dff0cdbc1d81303e3c573b79832087a38` in a successful 8,961-job Lean/Mathlib build. The inspected theorem dependencies include `Classical.choice` and `Quot.sound`; no `sorryAx` or bare `admit` appeared in the inspected log. Tests, lint, nanoda, leanchecker, and a global axiom audit were not run.

The generic theorem's compilation does not compile the proposed event ontology or establish that the source-to-model translation is correct. The specific finite witness and typed event schema remain unformalized. No local Lean executable was installed, and no new CI run, Lean module, branch, or PR was created.

P1's existing [PR #850](https://github.com/Satobloc/HsH/pull/850) remains OPEN / DRAFT / UNMERGED. Its latest recorded successful run #44882608538 was a merge-reference build, not an exact-head build of current PR head `df4a5bb57dd714ee7e849d5b00729c7b38c2b09e`. No new proof status is inferred from that run.

## 8. Proposed disconfirmable research sequence

This is a proposal only. It does not authorize or initiate a P1 trial.

**Stage A: scripted-source replication.** Reproduce the peer-label and credential-cue conditions with fixed peer content, but independently randomize the label and credential text. Include a neutral-label control and a condition where the credential is explicitly marked as unverified. Keep the initial solo answer hidden from the pressure-phase prompt and report the conditional estimand.

**Stage B: topology ablation.** Hold the same peer messages constant while randomizing scripted feed versus reciprocal pairwise interaction. Pin model versions and prompts; vary homogeneous versus heterogeneous populations only in a separate, preregistered contrast. Record persistent memory writes and reads rather than inferring them from conversation text.

**Stage C: human-LLM group study.** Only after ethics review and informed consent, use a low-risk task with actual human participants and clearly disclosed AI roles. Do not falsely claim that a model identity or safety credential is externally authenticated. Preserve individual pre/post responses, exposure logs, proposal lineage, and group-level randomization.

Primary outcomes should include incorrect-majority uptake among initially correct participants, group decision accuracy, and minority-proposal retention. Secondary outcomes may include confidence calibration, speaking distribution, perceived credibility, and proposal incorporation. Use objective answer keys where available and blinded independent human coding for qualitative outcomes. A shared LLM judge must not be the sole adjudicator.

**Disconfirming observations** include:
- no topology-by-label interaction after content, correctness, and task difficulty are controlled;
- scripted and reciprocal conditions produce equivalent uptake and decision accuracy;
- heterogeneous populations do not reduce shared-error propagation relative to homogeneous copies;
- authenticated provenance does not improve calibration, or increases deference to incorrect sources;
- memory and repeated interaction fail to change the preregistered population-level outcome.

Human participation requires consent, privacy controls, data minimization, and an appropriate ethics review. No participants were recruited and no experiment was run.

## 9. Mersearch, tools, and source access

Mersearch is not callable in this runtime. The four canonical request lanes remain `requested` and occupied; no lane was overwritten or retriggered. GitHub repository search is not represented as a Mersearch result.

SciSpace was checked but returned no useful indexed results for the two targeted questions. The primary arXiv HTML sources were directly reviewed, including methods and limitations. Existing HsH Lean PR #1189 and P1 PR #850 were inspected before considering new tooling. No new tool, dependency, fork, subscription, branch, or paid API call was created.

HsH onboarding, BEDROCK, Steering Charter, Three Paper Campaign, revival/thread-first controls, Orson workspace, SAT archive root README, and HSH_RESOURCES root documentation were reviewed. No private HSH_RESOURCES payload was accessed.

## 10. Current authority and continuity

- Orson's historical role charter is an assistant-maintained reconstruction, not a separately signed standalone charter. The current user directive reaffirms the primary LLM-cognition remit and the approximate four-of-five substantive-work priority.
- A Library snapshot titled `ND Orson LLM Cognition Lab` was located and its active ancestry inspected. Its snapshot metadata says `is_archived=false`, but its latest explicit direction moves the conversation to H(s)H theory work. It is not a verified current cognition destination without direct reactivation. The older `Cognition Research: Reading Program 01` candidate remains unresolved.
- This automation execution has `chat_ref=null`. No direct cross-thread post, delivery, consumption, or acknowledgment is claimed. A source-grounded, paste-ready Orson thread-revival prompt is stored at `WORKSPACES/ORSON_VAY/THREAD_REGENERATION_PROMPT_2026-11-21.md` for manual use; no new ChatGPT conversation was created.
- The latest prior Orson research report h995:s2 is PUBLISHED_VERIFIED at issue #2274, but it was not yet integrated into the Orson README/CURRENT_WORK header when this run began. This checkpoint repairs that continuity gap.
- FIE last full review: 10 November 2026; next scheduled review: 24 November 2026. No re-review was due on 21 November.
- Last unrelated reading break: 20 November 2026, *Davies, Mystic London*, Chapter IX, lines 1841-1920; next cursor 1921. No repeat break was due.
- The PWH scan found WH-01 still P1/HIGH and Tern-owned; its original run-list snapshot/cursor remains blocked. No cursor was re-queried or advanced, and no shared ownership or queue state was changed.
- Task-branch graph remains 18 records against 16 declared branches. No graph repair or ownership transfer was attempted.
- No physical calculation, fit, prediction, independent measurement, SAT-O/Blockwave equation change, BEDROCK theory promotion, or paper-gate advancement occurred.

## 11. Final status

`H1006_S4_ORSON_VAY / LLM_COGNITION_PRIMARY_SOURCE_REVIEW / SCRIPTED_PEER_VS_RECIPROCAL_POPULATION_VS_HUMAN_GROUP_TOPOLOGIES_SEPARATED / CRTC_NOT_AMENDED / GENERIC_FIBERWISE_FACTORISATION_REUSED_NOT_REINSTANTIATED / P1_FREEZE_PRESERVED / NO_NEW_TRIAL_OR_API_SPEND / NO_NEW_TOOL_OR_PR / THREAD_SCOPE_MISMATCH_IDENTIFIED / SOURCE_GROUNDED_REVIVAL_PROMPT_PREPARED / FOUR_TASKS_PRESERVED / NO_SIXTH_TASK / CURRENT_RUN_IN_PROGRESS`.
