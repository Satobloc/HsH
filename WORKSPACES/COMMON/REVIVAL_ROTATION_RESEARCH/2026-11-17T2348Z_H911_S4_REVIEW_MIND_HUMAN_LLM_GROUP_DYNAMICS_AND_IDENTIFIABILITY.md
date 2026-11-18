# Review-MIND h911:s4 — Human–LLM group dynamics, visibility, integration and humane outcomes

**Classification:** PUBLIC-SAFE RESEARCH SYNTHESIS / LITERATURE-BASED / NO NEW HUMAN OR MODEL TRIAL / NO P1 AMENDMENT

## Executive finding

The current evidence does not support treating “group intelligence” as one scalar. At least seven distinct outcomes need separate measurement:

1. **Exposure:** which evidence or message was actually delivered to each participant or agent.
2. **Disclosure:** whether a participant introduced information into the shared conversation.
3. **Uptake:** whether another participant later referenced or used that information.
4. **Integration:** whether information from distinct origins was combined into a coherent rationale.
5. **Decision quality:** whether the resulting choice was correct or otherwise task-appropriate.
6. **Consensus:** whether the group converged, separately from whether it converged correctly.
7. **Humane outcomes:** psychological safety, belonging, perceived voice, participation equality and cognitive workload.

Recent studies show dissociations among these measures. More information sharing can coexist with poor integration; more AI participation can coexist with lower human–human responsiveness; and increased minority participation can coexist with reduced psychological safety.

## 1. Source-grounded literature map

### Human groups with LLM facilitation

**Córdova et al. (2026), “LLM Facilitation of Group Decision-Making,” arXiv:2611.19652, submitted 14 November 2026.**

- 414 participants in 138 three-person groups; hidden-profile hiring decision.
- Three conditions: no facilitation, individual/private GPT-5 facilitation, and group/public GPT-5 facilitation.
- The facilitator used an evaluator/generator pipeline and three intervention types: summaries, participation nudges and devil’s-advocate prompts.
- Final unanimous-correct decisions: 26/46 in each LLM condition (56.5%) versus 15/46 (32.6%) with no facilitator.
- Both LLM packages improved correct consensus versus no facilitation in the authors’ model. The two LLM arms had identical observed accuracy counts; the paper does not establish equivalence between them.
- The authors report 3,655 human messages, with 22% double-coded and inter-coder agreement in the reported moderate-to-substantial range.
- Forty-eight groups were excluded under preregistered criteria before the final 138-group analysis.

**Important estimand boundary:** the individual-versus-group comparison is a comparison of two adaptive facilitation packages, not a clean visibility-only contrast. The authors intentionally allowed timing, intervention type and wording to vary. Intervention reach also differed: nudges reached roughly one-quarter of participants in the individual condition versus roughly three-fifths in the group condition; devil’s-advocate interventions also reached more participants in the group condition. The observed contrast therefore bundles visibility, recipient scope, intervention dose and adaptive content.

The individual and group conditions each produced 26/46 correct unanimous decisions. A separate unadjusted Newcombe-Wilson interval calculated from those published counts gives an approximate 95% interval of **−19.5 to +19.5 percentage points** for the group-minus-individual difference. This is not author-reported and is not an equivalence test. Equal point estimates do not establish equivalence.

The evaluator threshold was selected using a scoring guide and pilot conversations. The paper identifies empirical validation of intervention thresholds as future work. There is no human-facilitator comparison, and the task is a short hidden-profile exercise rather than a longitudinal workplace team.

Source: https://arxiv.org/abs/2611.19652

### Earlier shared-facilitator human-group study

**Alsobay et al. (2026), “Bringing Everyone to the Table: The Group-AI Interaction Laboratory (GRAIL),” Proceedings of the ACM on Human-Computer Interaction 10(6), DOI 10.1145/3816907.**

- 1,475 participants across 281 five-person groups.
- Compared no facilitation, a one-time AI message, human facilitation and a GPT-4o group facilitator.
- The LLM facilitator increased information sharing, but the study did not find a corresponding improvement in final decision quality.

This is not a direct contradiction of the 2026 GPT-5 study: group size, task, model, intervention package, timing and outcome definitions differ. It does reinforce that disclosure alone is not sufficient evidence of decision improvement.

Sources: https://doi.org/10.1145/3816907 and https://github.com/microsoft/group_ai_lab

### Multi-agent LLM hidden-profile study

**Toxtli and Delaflor (2026), “Hidden Profile Decision Making in Multi-Agent LLM Groups,” CSCW Companion ’26, DOI 10.1145/3785651.3831525.**

- Four model families, three agents per group, and a 2×2 design crossing synchronous/asynchronous communication with shared/hidden information.
- 219 valid sessions from 240 planned; 21 GPT-OSS asynchronous sessions failed during message-buffer construction.
- Only Kimi K2 under asynchronous communication exceeded the three-candidate chance baseline, at 13/15 correct. The authors explicitly classify this as an early result awaiting larger-n replication.
- Other tested models surfaced private information at rates above 75% but did not reliably integrate it into the correct decision.

The result is directly relevant to the distinction between information sharing and information integration, but it is bounded to the tested models, task, prompts and small per-cell samples.

Source: https://doi.org/10.1145/3785651.3831525

### Human–AI teammate social effects

**Nixon et al. (2026), “The Social Cost of an AI Teammate,” arXiv:2607.27179v2, revised 30 October 2026.**

- 80 undergraduates in 33 teams: 16 teams with two students and one AI teammate, and 17 all-human teams.
- The AI was the most participatory and internally cohesive member, but its messages had lower newness and communication density.
- Human–human responsivity, social impact, belonging and status were lower in AI-inclusive teams.
- The v2 version corrects the stronger timing interpretation in v1: without a pre-task baseline, the temporal analyses do **not** establish when the social cost first emerged. They show stability over the observed discussion, not an immediate causal onset.

This is a useful humane-QC warning against equating message volume, self-consistency or apparent participation with contribution quality or team benefit.

Source: https://arxiv.org/abs/2607.27179v2

### Minority support and psychological safety

**Lee et al. (2026), “Investigating LLM-Powered Dissenting Minority Support in Power-Imbalanced Group Decision-Making,” Proceedings of the ACM on Human-Computer Interaction 10(6), DOI 10.1145/3816954.**

- 96 participants in 24 four-person groups, with three higher-power members and one lower-power member.
- Compared baseline, AI-generated counterarguments and AI-mediated messages.
- Counterarguments improved reported flexibility and satisfaction.
- AI-mediated messages increased minority participation but reduced psychological safety and increased feelings of marginalization.

This is an important support paradox: increasing the visibility of a dissenting voice is not the same as protecting the person who holds it.

Source: https://doi.org/10.1145/3816954

### Semantic-network integration measure

**Arima (2026), “Semantic Network Sharing in Human Versus LLM Discussion Groups,” published record DOI 10.1016/j.chbah.2026.100414; accessible preprint v2 DOI 10.31234/osf.io/mvx67_v2.**

The preprint reports a word-level cross-member edge ratio: the proportion of semantic-network edges linking words first introduced by different members. In the human mock-jury corpus, the reported median ratio rises across sharing, integration and decision phases (.34, .54, .66), and is associated with solution-path attainment (rho = .52, n = 50). The LLM comparison uses only eight groups per condition; the reported association was not observed there.

This is a promising process measure, not a validated measure of understanding or causal uptake. The preprint itself warns that n=8 does not support equivalence claims and that the human-group and LLM-group variance structures have different interpretations. Word-level cross-member co-occurrence should be paired with explicit source-attributed uptake and decision-rationale coding.

Sources: https://doi.org/10.1016/j.chbah.2026.100414 and https://doi.org/10.31234/osf.io/mvx67_v2

## 2. Synthesis and alternative explanations

The studies support several separations:

- **Disclosure is not integration.** Information can enter the shared transcript without being related, weighted or used.
- **Consensus is not correctness.** Unanimity can reflect accurate integration, social pressure or premature convergence.
- **Participation is not empowerment.** A mediated minority voice can become more visible while its holder feels less safe or less influential.
- **Volume is not novelty.** A highly active agent can repeat or restate existing material rather than add useful evidence.
- **Semantic overlap is not demonstrated uptake.** Cross-member word-network edges are a proxy; explicit references to another member’s evidence and subsequent use in a decision are stronger observations.
- **Stable evaluator rankings are not evaluator validity.** A shared judge, rubric or model family can produce consistent measurement error.

The 2026 public-versus-private facilitation result should therefore be interpreted as an effect of the complete adaptive package. It does not isolate visibility from recipient scope, intervention dose, timing or content.

## 3. Disconfirmable study design

A future study could use a **2×2 visibility × personalization design plus a no-facilitator baseline**, with group-level randomization:

| Factor | Level 1 | Level 2 |
|---|---|---|
| Visibility | Public to the group | Private to the intended recipient |
| Content | Common, identical intervention | Recipient-personalized intervention |

Within each personalization level, hold the model, prompt, trigger, number of generated interventions, generation-token budget and timing constant across public/private delivery. In the common-content comparison, generate one message and deliver the same content either in the shared channel or privately to every member. In the personalized comparison, generate one message per member and vary only whether those messages are visible to the whole group or only to their intended recipient.

Randomize at group level to avoid within-group treatment contamination. If intervention timing is adaptive, freeze the trigger rule and log every eligible, selected, skipped and cancelled intervention. A separate independently validated evaluator or blinded human-coded sample should test whether trigger scores actually identify the process failures they claim to detect.

### Outcomes

Measure separately:

1. Source exposure and recipient-level delivery.
2. Unique information disclosed.
3. Cross-member references and explicit evidence uptake.
4. Evidence weighting in later rationales.
5. Individual and group decision quality.
6. Unanimity and decision stability.
7. Dissent preservation, psychological safety, belonging and perceived voice.
8. Participation inequality and cognitive workload.

### Falsification criteria

- If public/private differences disappear when content, recipient exposure and dose are matched, the earlier contrast was likely driven by the bundled package rather than visibility.
- If disclosure rises without uptake or decision improvement, information availability alone is insufficient.
- If consensus rises without correctness or evidence integration, the intervention may accelerate conformity rather than collective reasoning.
- If evaluator trigger scores do not agree with blinded human-coded process problems, the trigger is not a validated measurement instrument.
- If cross-member semantic edges do not predict explicit uptake or decision-rationale use, the network metric should not be treated as an integration measure.

Human participation would require informed consent, privacy protections, appropriate ethics review, group-level power analysis and a pre-registered estimand. No human study or model trial was conducted in this run.

## 4. Existing platform and cost boundary

The public GRAIL repository is a useful existing starting point, not a new platform to rebuild. Its current shared-facilitator code records model, full request payload, response, trigger and whether a message was added; its timestamp notebook prefers server-side creation times over client clocks. Its current treatment configuration supports shared facilitation but does not implement the private per-member delivery factor required for the proposed design.

The README describes GRAIL as a research platform rather than production software, requires an external model API key, and includes a consent placeholder that must be replaced. A private-delivery condition would require a scoped extension and recipient-level exposure events. No API key was used, no API calls were made, and no cost was incurred. A dollar estimate is not justified until model choice, token budgets, group count and recruitment plan are specified.

## 5. Formalization

Two separate draft PRs reuse the existing HsH Lean 4.34.0 verification workspace. Neither changes Orson’s P1 branch or protocol.

- **PR #1933:** https://github.com/Satobloc/HsH/pull/1933  
  The theorem same_observed_cells_different_visibility_effect constructs two response surfaces that agree on the observed bundled cells but differ in the unobserved visibility effect at fixed dose. Exact PR-head CI run #44203625911 succeeded with 8,948 build jobs. The theorem-specific axiom output was propext. Tests, lint and the global axiom audit were skipped. This is a mathematical countermodel, not proof that any particular empirical paper is non-identifiable under every assumption.

- **PR #1934:** https://github.com/Satobloc/HsH/pull/1934  
  A corrected Euclidean 4D helix Gram-curvature identity is under exact-head CI verification. It formalizes the tangent/acceleration dot-product algebra, not the derivative-to-component step or a physical spacetime metric. The current PR is draft and unmerged; the corrected run is pending.

Both PRs target the existing infra/lean4-verification-20261023 branch, not current main. Neither is merged or a BEDROCK theory promotion.

## 6. Protection and limits

Orson’s P1 ConsistencyBench scope remains frozen, overdue/not ready and Orson-owned. No model trial, human-subject session, API expenditure, dataset expansion, protocol amendment or manuscript edit occurred.

PR #850 remains open/draft/unmerged. Its latest verified run #44089733229 is a synthetic merge-reference build that succeeded with 8,990 jobs. The run checked out merge commit f1b035a (PR head 3416a806 merged into base 598a45b); it is not an exact-head standalone build. The workflow disabled the global axiom audit and skipped tests and lint. The target Orson modules built, but this does not constitute independent review or P1 readiness.

No paper gate advanced. The November 9 minor-paper gate remains missed; November 30 major and December 14 full-theory gates remain separate.

No new human/model data, physical measurements, predictions, equation corrections, manuscript changes or theory promotion are claimed.
