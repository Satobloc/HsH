# TeamFusion: proxy-agent interaction topology, evidence fidelity, and a disconfirming design

**Review class:** source-grounded Review-MIND comparison  
**Source:** Jiale Liu, Victor S. Bursztyn, Lin Ai, Haoliang Wang, Sunav Choudhary, Saayan Mitra, and Qingyun Wu, "TeamFusion: Supporting Open-ended Teamwork with Multi-Agent Systems," *Proceedings of the 64th Annual Meeting of the Association for Computational Linguistics*, Volume 1: Long Papers, pp. 14435-14456 (July 2-7, 2026). DOI: 10.18653/v1/2026.acl-long.657.  
**Primary source:** https://aclanthology.org/2026.acl-long.657/  
**PDF:** https://aclanthology.org/2026.acl-long.657.pdf  
**Read extent:** full paper's framework, both benchmark tasks, limitations, ethics discussion, implementation appendix, live-study appendix, proxy prompts, and Responsible NLP checklist.  
**Status:** external methodological comparator only. Not an H(s)H premise, P1 amendment, independent peer review, or new experiment.

## Executive finding

TeamFusion is a useful, concrete example of a preference-conditioned proxy-agent system with a shared dialogue history and a remixing stage. Its evidence must be separated into three different populations:

| Evidence stratum | What was actually done | What it is not |
|---|---|---|
| Civic-comment task | 500 proxy-team configurations sampled from public comments across ten questions; comments are clustered into four stance groups and one comment is sampled from each group. | 500 live human teams or 500 independent human deliberations. |
| Designer task | Nine professional designers annotate 50 scenarios; each designer contributes to 25 scenarios. The paper reports 100 simulated team settings and 300 generated design options, followed by re-evaluation from the original designers. | 100 synchronous human teams or an independent holdout evaluation. |
| Live pilot | Six people in two teams of three; each team completes two briefs in a counterbalanced crossover, one with TeamFusion and one with free-form discussion. | A powered group-level trial. The independent group count is two; the paper describes this as a small descriptive pilot. |

The paper therefore contains a real human-group/LLM-assisted interaction pilot, but its larger evaluations are human-informed proxy simulations. Treating all 500 civic configurations or all 100 design settings as real human-LLM group interactions would be a category error.

## 1. Actual interaction topology

The source describes the following pipeline:

1. A participant supplies task-specific preference evidence E_i.
2. The system encodes E_i into a structured personalization prompt pi_i.
3. One proxy agent a_i is instantiated for each participant.
4. Proxy agents take turns in a shared group-chat history H_t.
5. A remixing agent consumes the task context and full discussion history to produce deliverable y.
6. Humans or agents critique y and the process may iterate.

The source is explicit that agents have no additional private state: at turn t, the controller supplies the active agent's system prompt and the same shared history H_t. A round-robin controller gives each proxy a fixed number of turns. This is a shared-exposure, prompt-conditioned interaction graph, not a set of isolated independent votes.

For the visual-design task, the implementation uses GPT-4o as the underlying model, AutoGen orchestration, temperature 1, two debate turns per agent, and two iterative refinement rounds. The civic task reports three backbone models (Llama-3.3-70B, GPT-4.1-mini, and GPT-4.1); its 300 pairwise LLM-judge comparisons use GPT-4.1-mini.

The authors explicitly state that their goal is not to fully model a participant's identity, but to align a proxy's contributions with that participant's expressed perspectives. The Appendix K prompt nevertheless uses role-play language and inserts participant-specific preference material. The correct classification is therefore **preference-conditioned proxy**, not a participant replica, authenticated identity, or independent cognitive agent. Different prompts do not create independent model-family evidence.

Equal turn counts establish equal opportunity to speak in the protocol. They do not establish equal influence, equal evidence weight, faithful representation, or human endorsement.

## 2. What the results support, and what remains open

The larger evaluations support technical feasibility for structured proxy discussion and iterative deliverable synthesis. The designer task also provides human feedback on whether outputs represent the designers' expressed preferences. Those are useful findings, but they do not by themselves establish that the proxy discussion reproduces the process or outcome of a live human group.

Several boundaries matter:

- The live pilot has two group clusters. Its counterbalanced task order is useful for exploration, but the group-level sample is too small for a robust causal estimate.
- The 100 designer settings are nested within 50 scenarios and nine repeatedly contributing designers. The paper reports 95% confidence intervals, but the PDF sections reviewed do not specify the resampling unit or how dependence across scenarios and annotators is handled. This is a reporting question, not proof that the intervals are invalid.
- The nine designers re-evaluate outputs generated from their own earlier preference evidence. This is a relevant measure of perceived representation, but not an independent blinded holdout.
- The civic task's GPT-4.1-mini judge is also one of the task's backbone models. That creates a possible evaluator-model dependence; it is not evidence of actual judge bias.
- The paper itself identifies irreconcilable or zero-sum preference conflicts: a remixing stage may have to choose between incompatible constraints rather than preserve both.
- The authors explicitly identify privacy and security risks: participant-specific preferences enter prompts, agents share a group history, and adversarial prompting or dialogue leakage could expose sensitive rationales, biases, or strategies. This is a stated architectural risk, not a reported leak.

The Responsible NLP checklist has a documentation inconsistency: its D3 response appears marked "No", while the adjacent explanation says participants were informed that data would be used for analysis and that all consented. The paper also describes institutional review approval for the designer study. This mismatch warrants clarification; it is not evidence that consent was absent. The checklist says raw data were not released to preserve privacy, so transcript-level independent reanalysis was not possible here.

## 3. Formal condition for proxy fidelity

The source provides an explicit evidence-to-prompt projection:

- P: participant evidence E_i -> personalization prompt pi_i.
- G: (pi_i, H_t) -> proxy message m_t.
- R: full discussion history -> remixed deliverable y.
- U_i: deliverable y -> participant re-evaluation or endorsement.

A participant-level readout Q(E_i) can be recovered from the prompt projection P only if Q is constant on every fiber of P:

    Q = f o P  iff  P(e1) = P(e2) implies Q(e1) = Q(e2).

This is the generic factorization/fiberwise criterion already formalized in HsH PR #1189. Its current PR head is da1e7d5dff0cdbc1d81303e3c573b79832087a38; exact-head Actions run #44106198466 completed successfully. The relevant theorem's axiom report lists Classical.choice and Quot.sound; the inspected log contains no sorryAx or admit for that theorem. Tests, lint, leanchecker, nanoda, and a global axiom audit were skipped. The PR remains open/draft/unmerged.

This is a conditional mathematical criterion, not a TeamFusion-specific proof. The paper does not release the raw participant evidence, complete per-participant prompt mapping, and full message lineage needed to test whether distinct evidence profiles collapse to the same prompt or whether a particular participant-level readout is preserved. No collision is asserted.

## 4. Disconfirming experiment

A useful next experiment would test whether proxy discussion preserves actual participant evidence and endorsement, rather than merely producing a plausible consensus-oriented deliverable.

**Design**

- Recruit enough independent human triads for a pre-registered group-level power analysis. Randomize groups within recruitment wave and task block to live human discussion, human discussion with an LLM facilitator, and proxy-agent simulation from the same consented participant inputs.
- Use distinct briefs in a counterbalanced crossover only where carryover can be controlled; otherwise use a parallel cluster-randomized design.
- Before any proxy is instantiated, let each participant mark which preference evidence is public to the group and which is private or excluded from proxy use.
- Log a typed provenance graph: pseudonymous participant ID, evidence-span ID, prompt-template/version hash, model ID, message ID, turn, recipient/visibility set, shared-history version, remix-input IDs, output ID, and participant endorsement. Record semantic uptake separately from causal influence.
- Have blinded human adjudicators check whether each material output claim is supported by a specific consented evidence span. Keep the model judge separate from all task backbones.
- Measure individual preference preservation, minority-constraint retention, unsupported attribution, participant endorsement, decision quality, psychological safety, within-group dispersion, mean experience, decision time, and privacy leakage. Report means and dispersion separately; low variance alone is not fairness.
- Test privacy with synthetic canary strings and explicit consent, not real sensitive rationales. Do not place private fields in shared history unless the participant explicitly authorizes that exposure.

**Disconfirming outcomes**

The proxy-fidelity claim would be weakened if proxies add unsupported personal claims, misattribute or erase minority constraints, disclose fields excluded from group visibility, or produce apparent consensus while participants' own rankings and endorsements remain divided. A convergence claim would also be weakened if lower within-group dispersion accompanies lower mean satisfaction or psychological safety.

No experiment, human-subject recruitment, model trial, or participant-data analysis was performed in this review.

## 5. Relevance and boundary

TeamFusion is a useful external comparator for provenance graphs, shared-history exposure, role-conditioned agents, feedback, and nested group dynamics. It is not evidence that assistant systems are conscious or that proxy agents reproduce human cognition. It does not validate SAT, H(s)H, GR, string-theory, SM/QM, or any physical observable.

No SAT-O1 or Blockwave equation was used or changed. No physical calculation, fit, prediction, or theory promotion was made. Orson's P1 protocol, manuscript, dataset, PR, and ownership were not modified. This report is a separate source audit, not a P1 amendment.

## Source locations checked

- ACL Anthology paper 2026.acl-long.657, pp. 14435-14456: framework and shared history (Section 3); civic-comment task and 500 configurations (Section 4); designer task and confidence intervals (Section 5); limitations and privacy/security discussion; implementation and prompt appendices; live-study Appendix H.
- ACL Responsible NLP checklist for 2026.acl-long.657: consent/data handling response and raw-data non-release note.
- HsH PR #1189 and Actions run #44106198466: existing generic fiberwise-factorization formalization and exact-head build evidence.

**Epistemic status:** source-grounded methodological audit; proxy-fidelity and privacy tests proposed but not run; no independent transcript-level reanalysis; no claim of causal validation beyond the paper's own reported design.
