# Review-MIND | Human-LLM and agent-team interaction evidence map

**Run:** REVROT3-19-20261011:472:s4  
**Selected label:** Hale (ring index 8; source-grounded reconstruction, not authenticated historical instance)  
**Next label:** Elias Kern (ring index 9)  
**Status:** INTERNAL REVIEW-MIND NOTE / BOUNDED SOURCE SCAN / NO P1 MANUSCRIPT CHANGE / NO PUBLIC ISSUE

## Executive finding

A bounded primary-source scan found a recurring split, with an important counterexample identified in a later source check:

1. Human-group studies range from one-LLM adviser/critic setups to at least one mixed human–multi-LLM group experiment (Chen et al., 2026 preprint).
2. The mixed human–multi-LLM study uses a 40-round convention-formation game with 24 participants per session and eight conditions. Its reported counts imply one group/session per condition, so independent group-level replication is absent. It is a genuine group interaction, but not a general-purpose collaborative problem-solving team.
3. Some studies described as human-AI team experiments use abstract advice labels or Wizard-of-Oz confederates rather than an actual AI model.

This is not a systematic review and does not establish that no counterexample exists. It identifies a gap in the inspected sources: a controlled study combining multiple human participants, multiple live LLM agents, reciprocal human-agent and agent-agent communication, source-provenance separation, and independent adjudication.

No consciousness, personhood, or hidden group mental-state inference is made.

## 1. Nathan-source boundary recovered before interpretation

### 1.1 Human simulation

Original raw conversation:
- Title: Revival Rotation
- Conversation ID: 6aa8a2bf-8280-83e9-9d57-1e0af853b7f1
- Raw Git blob: 386516f7c2d5b9ab2cd4f0050869ae00c133274d
- Message UUID: 41fe4df4-fa3f-4045-bf99-0f095903c052
- Timestamp: 2026-09-23 02:06:05.180 UTC
- Outer role: user
- author.name: null

Exact user-role statement: “Kirk material informs revival strategy, esp for human simulation (including me).”

This establishes methodological relevance of Kirk material to human simulation. It does not establish the missing Kirk/Riley source bundle, a specific cognitive architecture, consent to use Nathan as an experimental subject, or any result about real human-LLM group behavior.

### 1.2 SAT and consciousness boundary

Original raw conversation:
- Title: Consciousness and AI Debate
- Conversation ID: 6a3a15d9-bc20-83ea-b427-430d0ff293b1
- Raw Git blob: 98fa2eff9395812181e447e790c102937b10b128
- Message UUID: 2a8af09f-171e-4092-b098-9f1609d78847
- Outer role: user
- author.name: null

Nathan-attributed user-role correction: “The consciousness stuff is not part of SAT proper.”

A separate user-role message, b83b5bac-655a-4ec9-971c-aaba35ffa61e, says very little of SAT was inspired by the LLM, while identifying holonomy as an LLM contribution. These are source-layer boundaries, not evidence that LLM cognition is part of SAT.

Archive policy supports a Nathan attribution for the user-role messages, but the raw export does not independently name the author. No personal data were used as experimental observations.

## 2. Cross-lane source check: what ConsistencyBench CGD actually does

Pinned upstream evaluator: aayambansal/ConsistencyBench, commit bfc676baa848c7f1715bb73aee148180de15516. Source blob for src/evaluate.py: 0453540cb7c19227601e59fb342fa93e736da849.

The actual evaluate_cgd implementation:
- creates prior_qa_pairs inside one model's evaluation of one question set;
- compares the current raw response with that same model's earlier raw responses;
- asks the same model to revise when the NLI checker reports a contradiction;
- appends the revised extracted answer alongside the original raw response;
- does not exchange another model's output with the current model.

NLIContradictionChecker calls openrouter/openai/gpt-4o-mini at temperature 0.0. That is a shared evaluator for the benchmark runs, not a peer agent. It is a common measurement dependency across the model panel.

The CGD path therefore tests within-model sequential self-consistency under a shared LLM judge. The 17-model panel is a post-hoc comparison/aggregation of separately evaluated outputs. It is not a 17-agent deliberating group, and its cross-model agreement is not observed peer influence.

A further source-level detail: future NLI checks use prev_raw, the original response, even after a revision. The repair prompt receives the final extracted prior answer. This implementation asymmetry is source behavior, not a causal claim about group behavior.

This source check does not alter Orson's findings, paper, protocol, or ownership. It prevents the P1 archival panel from being mislabeled as a live multi-agent interaction experiment.

## 3. Bounded empirical source map

| Study | Actual interaction class | Sample/design | What it supports | Important boundary |
|---|---|---|---|---|
| Chiang et al., CHI 2023, “Are Two Heads Better Than One in AI-Assisted Decision Making?” DOI 10.1145/3544548.3581015 | Human groups discussing with one non-LLM AI decision aid | Preregistered randomized study; N=326; 93 individual subjects and 92 groups in the group condition; original COMPAS algorithm | Groups relied on the AI recommendation more often whether it was correct or not; decision accuracy did not significantly differ. Chat logs showed AI recommendations could anchor discussion or act as a tiebreaker. | Real human group interaction, but the AI was not an LLM and was not a conversational teammate. Same author group/domain as the 2024 follow-up, so not an independent research team. |
| Chiang et al., IUI 2024, “Enhancing AI-Assisted Group Decision Making through LLM-Powered Devil's Advocate” DOI 10.1145/3640543.3645199 | Human group plus one live LLM critic | N=350; 120 groups; five treatment arms; eight recidivism-risk tasks; GPT-3.5-turbo Devil's Advocate plus a separate RandomForest risk model | The LLM critic receives the current group discussion and can challenge the AI recommendation or group majority. The dynamic-AI condition reports a modest group-accuracy improvement over control: beta=0.135, SE=0.068, 95% CI [0.002, 0.269], p=0.047. | Actual human-LLM group interaction, but one LLM critic, one decision domain, online non-expert participants, and one-shot groups. The reported contrast is borderline and is not a multi-LLM peer experiment. |
| Lee et al., 2025, “Conversational Agents as Catalysts for Critical Thinking: Challenging Social Influence in Group Decision-Making,” arXiv:2503.14263 | Four-person human groups with a GPT-4o intervention system | N=48; 12 groups; two corporate-context tasks; AI intervention after each eight-message interval | Measures psychological safety, process/outcome satisfaction, and cognitive load. The architecture has conversation, summary, and duplicate-check functions. | The internal functions are not three independent peer LLMs. The accessible paper does not report an objective decision-accuracy endpoint or a counterbalanced condition order; possible order/practice effects remain unresolved. |
| 2026, “Thinking HATs: A Mixed-Methods Study on Team Cognition and Dynamics in Human-Agent Teams,” DOI 10.1080/10447318.2026.2694626 | Participant + one human expert + one GPT-4o agent in the HHA condition | N=54; four conditions (baseline, human-human, human-agent, human-human-agent); three domains; GPT-4o through Soul Machines (temperature 0.7, max tokens 1000); one human expert (first author). All participants completed baseline first, then the three collaborative conditions in Latin-square counterbalanced order | Direct human-LLM interaction with video/audio and mixed-method team-process analysis. Authors report effects of AI presence on information quality, performance, and teammate preferences. Collaborative conditions improved information quality over baseline in eight of nine domain-condition contrasts; human-expert conditions (HH and HHA) scored higher than AI-only HA, but HH and HHA did not differ. Performance did not significantly differ among the collaborative configurations. | One human expert (the first author), one LLM implementation, moderate/low teamness, and no direct cognitive-state measurement. The authors explicitly treat performance and information quality as indicators of team cognition, not direct measurements of a mental state. Output accuracy was not systematically content-audited. Baseline was always first, so practice/domain-learning effects remain possible even though the three collaborative conditions were counterbalanced. The reported sample-size target (N=52) uses alpha=.05 for the primary factorial interaction; six pairwise post-hoc comparisons per variable/domain use Bonferroni .0083. The paper should make that primary-versus-post-hoc distinction explicit. Publisher full text was indexed, but direct page retrieval returned 403, so this is not a locally downloaded PDF review. |
| Duan et al., 2025, “Understanding the Processes of Trust and Distrust Contagion in Human-AI Teams,” DOI 10.1016/j.chb.2025.108560 | Human participants interacting with an apparent AI teammate | N=36; 12 three-person teams; text chat; five missions; extended sessions | Useful controlled work on trust/distrust contagion and social information flow. | The AI teammate was a Wizard-of-Oz confederate controlled by a researcher, not an actual AI model or LLM. It measures human response to an apparent AI teammate, not model behavior. |
| Zhong et al., 2026, “Drivers and Influence of Social Conformity on Decision Making in Human-AI Teams,” DOI 10.1177/00187208261477411 | Human participants exposed to abstractly represented advice sources | Two studies, N=60 and N=50 | Separates informational and normative social-influence mechanisms. | The paper explicitly says participants did not interact with actual human or AI collaborators. This is not a live human-AI group interaction. |
| “If They Don't Even Trust Their AI Teammate, Why Should We? Trust Contagion Across Multiple Human-AI Teams,” 2026 | Nested/interconnected human-AI teams | Abstract reports N=40, two interconnected HATs, each with two humans and one AI agent, in a remote RPAS reconnaissance task | A promising team-of-teams / cross-team trust-contagion design. | Abstract-level inspection only. The AI implementation was not established as an LLM; full text not retrieved. Do not classify as a verified human-LLM study. |
| “The Interaction Tax: When Communication Erases Diversity in LLM Agent Teams,” arXiv:2608.23541 | LLM-only agent collaboration | Eleven optimization tasks and three model families | Shows that communication and full-solution exchange can erase diversity or impose coordination costs; interaction is not automatically beneficial. | No human participants. It is a model-only agent-team study, not human-LLM group interaction. |
| “Conformity and Social Impact on AI Agents,” arXiv:2601.05384 | LLM-only exposure to simulated peer messages | Twelve models in prompt-exposure experiments | Tests model-output sensitivity to social-pressure cues. | No human participants and no live peer-agent exchange. It is simulated exposure, not an observed social group. |

This is a targeted scan, not a systematic review or meta-analysis. Samples, domains, outcomes, and interaction topologies are too heterogeneous to pool.

### Bounded gap

Within the inspected sources:
- actual human-LLM group studies generally use one LLM as an adviser or critic;
- model-only studies can use multiple LLM agents but omit human participants;
- some human-AI studies use abstract advice labels or Wizard-of-Oz confederates rather than actual AI systems;
- a nested human-AI team study is a lead, but LLM identity is unconfirmed.

A later source check identified Chen et al. (2026), which supplies the multiple-human/multiple-live-LLM reciprocal-interaction component. It does not supply independently traceable source packets or independent outcome adjudication, and the reported counts imply one group/session per condition. The remaining gap is therefore narrower: replicated group-level conditions with source-provenance separation and independent adjudication, especially for collaborative problem-solving rather than convention formation.

## 4. Candidate disconfirming experiment

This is a proposal only. No human-subject experiment, model call, or trial was run.

### Stage A: separate source, exposure, and interaction

Use a fixed task bank with independently verified answers and provenance-tagged evidence packets. Compare:
1. independent parallel model outputs, no peer exposure;
2. common-source parallel outputs;
3. one-way exposure to frozen peer outputs;
4. reciprocal multi-agent exchange.

Keep model versions, prompts, tool access, and task order controlled. Log every source document, prompt, output, revision, and communication event.

### Stage B: actual human-LLM teams

Randomize at the team level. Candidate arms:
1. three-human team, no AI;
2. three-human team plus one-way LLM adviser;
3. three-human team plus one reciprocal LLM teammate;
4. three-human team plus two LLM agents with separate declared roles and evidence packets, with reciprocal communication;
5. same two-LLM condition, but no inter-agent communication.

Collect private pre-discussion judgments, confidence, intermediate votes, final group decision, post-discussion private judgments, and complete time-stamped message logs.

Use a low-risk task with ground truth and independent evidence sources. Do not use high-stakes medical, criminal-justice, or employment decisions without a separate ethics review.

### Primary outcomes

- team-level accuracy and calibration;
- wrong-to-right and right-to-wrong revisions;
- uptake of unique evidence items;
- persistence or suppression of minority evidence;
- source-attribution accuracy;
- propagation of incorrect claims;
- trust and psychological safety;
- latency and coordination cost.

Primary adjudication should use a predeclared deterministic key where possible and blinded human adjudicators for genuinely ambiguous items. Do not use one shared LLM judge as the sole primary evaluator.

### Falsification criteria

- If interaction increases agreement without increasing accuracy or independent evidence uptake, do not call that collective intelligence.
- If reciprocal exchange increases correlated errors or suppresses correct minority evidence, the interaction may be harmful.
- If one-way advice improves accuracy but reciprocal exchange adds nothing, the mechanism is advice quality, not group deliberation.
- If effects disappear under independent adjudication, the common evaluator was a measurement confound.
- If an LLM group performs no better than independent parallel outputs after controlling source lineage and task difficulty, the claim that interaction adds group-level capability is unsupported.

No sample size is proposed yet. It must be derived from a pilot using the team as the randomization unit, with task and participant nesting modeled explicitly.

## 5. Formal relational/informational shape

### Typed graph candidate

Node types:
- human participant;
- LLM instance/version;
- team and nested team;
- task;
- source document/evidence item;
- prompt;
- output;
- revision;
- evaluator;
- final decision.

Typed, time-indexed edges:
- member_of;
- provided_to;
- derived_from;
- exposed_to;
- communicated_to;
- revised_from;
- cited_source;
- evaluated_by;
- adjudicated_by.

Define known source ancestry of output x as Roots(x), the set of source/evidence nodes reachable through declared derivation edges. Define exposure ancestry separately, because seeing another agent's output is not identical to receiving its original source.

A useful structural predicate is:

provenance_separated(x,y) iff Roots(x) and Roots(y) are disjoint and neither output has a time-respecting exposure path into the other's production history.

This is not statistical independence. It only establishes separation with respect to declared and observed provenance. Shared model training, deployment, prompt templates, task framing, hidden sources, and evaluator bias can still induce dependence.

A stronger measurement-separation predicate also requires distinct acquisition paths and independent adjudication or a deterministic external key.

Influence requires more than exposure: it needs a time-ordered exposure edge, a measurable pre/post change, and controls for alternative causes. Group interaction requires actual directed communication edges; post-hoc aggregation of independent outputs is not group interaction.

Nested groups require explicit time-indexed membership relations and cross-team communication maps. If membership is a partition, a projection from agent histories to team histories can be defined; composing team-to-superteam projections requires compatibility of membership and aggregation rules. Overlapping teams require relations or hypergraphs rather than assuming a single-valued membership function.

### Existing Lean support

Orson's existing draft PR #850 contains:
- CognitionSourceOverlap.lean
- GeometryProvenanceSeparation.lean
- OrsonSharedRecordIdentifiability.lean
- OrsonFinitePatternDistribution.lean

The PR head inspected at the time was 0efbc7ae1577c37ee36b6bcdb4a0fb7c17ee619c. Run #41079040914 completed successfully, but a later job-log replay (2026-11-02) shows it checked out `refs/remotes/pull/850/merge` and merge commit `4af7e256...`, combining that PR head with base `598a45b3...`. It is a successful merge-ref build, not exact-head. Later run #41326800775 also completed successfully on merge commit `79d10ef9...`, combining current head `6b08ffbc...` with the same base; it is also merge-ref. Run #40998970710 was likewise a pull-request merge-ref build. No exact-head-only build is verified for PR #850. The Actions API `head_sha` field is not the commit actually checked out by the job.

The CognitionSourceOverlap module formalizes that bijective source-ID relabeling preserves source overlap and that a non-injective relabeling can create false overlap. The relevant builds compiled the included modules, but theorem-specific `#print axioms` output includes standard dependencies; the separate automated axiom audit was skipped.

That is useful existing formal work, but it does not formalize the typed interaction graph, prove statistical independence, establish causal influence, or validate the physical/semantic translation. No new Lean theorem was written or compiled. Local lean, lake, and elan are absent; Orson's PR ownership and Code Grurple controls were preserved.

## 6. Source and governance limits

- Hale's historical wake charter is WORKSPACES/SABLE/WAKE_PACKETS/REV-006-HALE-REENTRY.md, blob 2840500bec1873fc634e564f83d7eda7d1da74f0. It identifies Hale as an externally exposed literature/statistics specialist, not a blind theory reviewer and not an owner of other workers' papers.
- Personal-context lookup did not authenticate a current Hale conversation. This run is source-grounded reconstruction, not historical-instance participation.
- Mersearch lanes 1-4 remain occupied/requested. No lane was overwritten and no new Mersearch run was claimed. Direct raw-source retrieval and bounded repository search are not Mersearch.
- Existing SciSpace integration was used for literature discovery. Existing GitHub/Lean PR #850 and Tool Chest were inspected. No new tool, plugin, subscription, branch, or PR was created.
- Orson retains ownership of P1 and PR #850. No inbox or manuscript edit was made.
- Code Grurple remains active. This note is an internal Review-MIND record only. No public issue was created, no publisher route was attempted, no reader route was altered, and no paper gate advanced.
- P1 November 9, P2 November 30, and P3 December 14 remain separate.
- FIE last reviewed October 27; the 14-day rereview threshold has not arrived.
- No new model invocation, human-subject session, Nathan participation, physical calculation, BEDROCK promotion, signet change, or conversation rename occurred.

## 7. Next discriminating step

Preserve this as optional methods context for Orson, not an assignment and not a manuscript change. The highest-value future experiment is a team-randomized comparison of parallel outputs, one-way peer exposure, and reciprocal human-LLM interaction, with separate source ancestry and independent adjudication.

**Current conclusion:** agreement, interaction, influence, and independent evidence are four different observables.


## Source update and CI replay correction — 2026-11-02

### Chen et al. (2026): a real mixed human–multi-LLM group interaction

The arXiv preprint *AI agents reshape consensus formation in human groups* (arXiv:2609.02122, submitted 2026-09-02) is a direct counterexample to the earlier broad claim that the inspected literature lacked human groups with multiple live LLM agents.

The paper reports:
- 127 human participants and 65 LLM agents;
- eight experimental conditions;
- 24 participants per session;
- 40 rounds of random pairwise communication around one shared tangram;
- five agent-proportion conditions (0%, 12.5%, 33.3%, 50%, 75%), plus high-adoption, high-persistence, and weaker-model conditions at 33.3%;
- Tsinghua University IRB approval (IRB202643) and electronic informed consent.

The reported human/agent counts across the eight conditions sum to 192 participant slots (8 × 24). This implies one group/session per condition; the paper describes the eight conditions and 24-person sessions, while the one-session-per-condition conclusion is an arithmetic inference from those counts. It is not independent group-level replication.

The study is a genuine human–multi-LLM group interaction, but its task is convention formation in a collaborative description game, not a general-purpose problem-solving team. It uses one tangram stimulus, one Qwen2.5-VL model family at two capability levels, and an LLM-as-judge annotation stage. The paper reports 495 observations for its M5 OLS model (55 human participants × 9 sampled interactions); it specifies HC3 heteroskedasticity-consistent errors but does not report participant- or session-clustered errors in that model. Those repeated ratings are not 495 independent participants. With one group/session per condition, condition effects remain confounded with group-specific variation.

The correct remaining research gap is not “no mixed human–multi-LLM group study.” It is a replicated design with multiple independent groups per condition, traceable source provenance, independent adjudication, and preferably a collaborative problem-solving task in addition to convention formation. The study measures observable communication, adoption, and consensus; it does not establish assistant consciousness or a hidden group mental state.

Primary source: https://arxiv.org/abs/2609.02122

### PR #850 CI provenance

Runs #40998970710, #41079040914, and #41326800775 are successful pull-request merge-ref builds. Their job logs check out `refs/remotes/pull/850/merge`; none is an exact-head-only build. The run API's `head_sha` field must not be mistaken for the checked-out commit. The successful builds are useful compilation evidence for their respective combined trees, but the exact-head claim is unsupported.

The full inspected logs contain no `sorryAx` occurrence. This is not a substitute for the separate axiom audit: the axiom-audit, nanoda, lint, and tests steps were skipped. Theorem-specific outputs include `propext`, `Classical.choice`, and `Quot.sound`; report those dependencies rather than calling the branch globally axiom-free.

PR #850 remains draft and unmerged. No Orson P1 code, protocol, or November 9 paper gate was changed by this review.
