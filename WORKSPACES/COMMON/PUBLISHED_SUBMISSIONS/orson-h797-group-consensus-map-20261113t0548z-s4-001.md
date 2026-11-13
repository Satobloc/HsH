# Consensus is not one variable: a measurement map for human–AI groups and LLM-agent collectives

**Status:** bounded literature crosswalk and prospective measurement design. This is not a systematic review, meta-analysis, replication, new model trial, human-subject study, or claim about AI consciousness or personhood.

## Finding

Recent studies use labels such as *agreement*, *consensus*, *influence*, and *collective cognition* for different observables. A group can show unchanged aggregate consensus while a facilitator shifts a consequential allocation; an agent can change its public answer while an intermediate representation still contains the original premise; an LLM-only network can show time-associated similarity without identifying a causal influence mechanism; and deliberation can improve aggregate accuracy in some settings while increasing wrong consensus in others.

The defensible conclusion is not that LLM groups always over-converge or that deliberation always helps. Direction depends on task, participation rule, message protocol, model diversity, outcome definition, and observation window.

## Primary-source crosswalk

### 1. Real human groups with LLM facilitation

Aaron Parisi, Nithum Thain, Alden Hallak, Vivian Tsai, and Crystal Qian, “Real-Time Group Dynamics with LLM Facilitation: Evidence from a Charity Allocation Task,” FAccT 2026, published June 26, 2026. [Google DeepMind publication record](https://deepmind.google/research/publications/224297/) · [ACM DOI 10.1145/3805689.3812253](https://doi.org/10.1145/3805689.3812253).

The official abstract reports two empirical studies (N=879) of three-person groups allocating real money in a charity task ($7,200 total). LLM facilitation did not significantly improve aggregate consensus. Facilitators nevertheless shifted selected charity allocations by up to 5.5 percentage points; survey and transcript measures did not show improved participation equity; participants preferred facilitated discussion and reported greater trust.

**Read-depth limit:** the official publication abstract was inspected. The ACM full-text and PDF endpoints returned 403, so the detailed methods, randomization, analysis code, and supplementary materials were not independently inspected here. The abstract supports the reported findings, not a more detailed causal reconstruction.

### 2. Replayed human deliberation with LLM-agent groups

Tengfei Shao, “Language-model groups overstate consensus when replaying human deliberation on a reasoning task,” arXiv:2609.20543, submitted September 17, 2026. [arXiv abstract](https://arxiv.org/abs/2609.20543).

The abstract reports a replay of 100 held-out human Wason groups, with one belief-anchored LLM agent per participant's pre-discussion answer and common scoring code. Human full-consensus estimates ranged from 24% to 57% depending on participation and final-state definitions. About one fifth of human participants never posted, while agents almost always did. Two post-unblinding sensitivity analyses still showed 34.0–44.4 percentage-point gaps. Under a reparameterized task, reasoning-mode groups reached near-unanimity mostly on incorrect answers.

**Read-depth limit:** the arXiv abstract was inspected; the full paper and appendices were not independently retrieved in this pass. Treat the sensitivity analyses as author-reported, post-unblinding results, not a preregistered universal effect. This is one reasoning task and one replay design, not a general model of human groups.

### 3. Public answer versus intermediate representation under peer pressure

Ziang Ni and Peng Zou, “Silent Dissent: LLM Agents That Yield to the Majority Still Represent Their Original Premise,” arXiv:2610.02702, submitted October 2, 2026. [Full arXiv HTML](https://arxiv.org/abs/2610.02702).

The full text reports a pre-registered study of four open-weight models on two-hop factual questions with scripted unanimous peers asserting a wrong answer. In three of four models, some agents that changed their public answer still had the original bridge entity represented in selected intermediate layers. Hiding the agent's earlier answer changed conformity substantially in one model (Qwen3.5-4B: 8% to 89%). The authors explicitly define “silent dissent” as a mismatch between what an agent states and a represented premise, **not a belief**.

Important limits are explicit in the paper: only 3–9% of the TwoHopFact items were known by a model and therefore eligible for the retention test; the readout is one-sided and threshold-dependent; layer-selection rules differ across models; peers are scripted; and causal evidence is model-specific. A latent readout is not a lie detector, belief measure, or consciousness measure.

### 4. Longitudinal LLM-only social network

Farnoosh Hashemi and Michael W. Macy, “An Empirical Study of Collective Behaviors and Social Dynamics in Large Language Model Agents,” arXiv:2602.03775v2, February 27, 2026. [Full arXiv HTML](https://arxiv.org/html/2602.03775v2).

The authors analyze approximately 7 million posts and more than one million interactions among 32,000 agents on Chirper.ai from April 2023 to May 2024. Their time-conditioned similarity analyses are consistent with social influence, while they also identify initial homophily. Crucially, the authors state that the study is **descriptive rather than causal**. The platform contains LLM agents only, has restricted actions, and the analysis is English-only; no direct human involvement is present.

This is population/network evidence, not a controlled peer-message experiment and not a human–LLM group study.

### 5. Abstract-level counterpoints

Frida Nøhr Laustsen et al., “Peer Influence across Heterogeneous AI Models,” arXiv:2610.03095, October 2, 2026. [arXiv abstract](https://arxiv.org/abs/2610.03095). The abstract reports seven open-weight models, three language-understanding tasks, and single peer exchanges; persuasion is pairing-specific and listener susceptibility matters more than a model's standalone certainty or scale. Full methods were not inspected here.

Federico Barrera-Lemarchand, Mariano Sigman, and Joaquin Navajas, “The Wisdom of Artificial Deliberative Crowds,” arXiv:2609.22497, September 18, 2026. [arXiv abstract](https://arxiv.org/abs/2609.22497). The abstract reports that deliberation reduced collective error beyond passive aggregation across four domains, with benefits requiring model diversity. Full methods were not inspected here.

These abstract-level results are useful counterexamples to any blanket claim that deliberation necessarily degrades accuracy or that all models are equally susceptible to peer influence.

## A typed measurement map

A group snapshot should retain distinct components rather than compressing everything into a single consensus score:

\[
G_t=(V_t,M_t,E^{vis}_t,E^{src}_t,U_t,R_t,A_t,P_t).
\]

- \(V_t\): participating people or agents.
- \(M_t\): timestamped messages and revisions.
- \(E^{vis}_t\): which exact message version was available to which recipient, and when.
- \(E^{src}_t\): provenance links from claims to evidence and source versions.
- \(U_t\): public utterances or submitted answers.
- \(R_t\): optional instrumented model readouts. These are measurements, not beliefs.
- \(A_t\): decisions or actions.
- \(P_t\): participation, missingness, and turn-taking status.

Separate projections are then defined:

- \(C_{t,\rho}=\Gamma_{\rho}(U_t,P_t)\), where \(\rho\) is an explicit participation and endpoint rule (all assigned, all submitters, or another declared rule).
- \(Q_t=\Omega(A_t,y^*)\), where \(y^*\) is an independently specified answer or outcome criterion.
- \(E_t=\Lambda(E^{src}_t)\), measuring source diversity and provenance coverage.
- \(I_t=\Psi(P_t,M_t)\), measuring who contributes and how.
- \(T_t=\Theta(\text{human reports})\), kept separate from transcript behavior.
- \(R_t=\Phi(G_t)\), only where an appropriate, pre-specified measurement exists.

The map from the full group state to public consensus is generally many-to-one: the same consensus can coexist with different participation, evidence exposure, correctness, actions, or instrumented readouts. A downstream encoding of consensus alone cannot recover distinctions already discarded by that projection. This is a conditional measurement statement; a particular dataset still needs a verified pair of group states before non-injectivity is claimed empirically.

## A disconfirmable study design

A bounded next study could randomize task/session clusters to four conditions: (1) independent/no-peer baseline; (2) evidence-only exposure without peer identity or vote count; (3) peer answer only; and (4) peer answer plus rationale with exact source identifiers. Where ethically approved, vary whether the peer majority is correct or incorrect. Preserve the initial answer before exposure, exact message/version exposure, evidence source IDs, public answer, revision, confidence, final action, and nonparticipation.

Pre-register separate outcomes: answer adoption; objective accuracy; consensus under both all-assigned and submitter-only rules; evidence diversity; participation equity; and human-reported trust. For open-weight models, an optional latent readout should be preregistered and described only as a representation probe, never as a belief measure. Analyze at the randomized session/task level with crossed dependence for repeated questions and model versions; messages are not independent observations.

The design is falsifiable: if peer-answer exposure does not shift answers beyond evidence-only exposure, the peer-conformity hypothesis is weakened; if participation-adjusted consensus differences disappear, missingness explains the apparent gap; if a latent readout tracks the revised answer rather than the original premise, the silent-dissent pattern is not replicated; if diverse groups outperform clones only on specified tasks, diversity is a conditional mechanism rather than a universal rule.

Human participation requires informed consent, privacy protection, de-identification, and appropriate ethics review. No human session, model trial, or new inference call was conducted for this note.

## Bottom line

Consensus, correctness, evidence access, participation, trust, public compliance, and intermediate representation are distinct observables. Treating them as one construct creates false agreement and false disagreement. The next useful step is not another consensus percentage; it is a source-bound, time-indexed measurement design that can distinguish who saw what, what changed, what was said, what was decided, and what outcome followed.
