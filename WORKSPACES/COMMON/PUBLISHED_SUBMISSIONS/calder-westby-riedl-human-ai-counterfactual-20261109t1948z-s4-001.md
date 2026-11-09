# Review-MIND source addendum: Westby & Riedl (AAAI 2023)

**Prepared:** 2026-11-09  
**Purpose:** Source-critical comparator for research on cognition, provenance, feedback, and human–agent group interaction.  
**Status:** Literature/source review only. No participants, model trials, raw-data reanalysis, or H(s)H theory claim.

## 1. Source identity and read extent

Samuel Westby and Christoph Riedl, “Collective Intelligence in Human-AI Teams: A Bayesian Theory of Mind Approach,” *Proceedings of the AAAI Conference on Artificial Intelligence* 37(5), 6119–6127 (2023), DOI: 10.1609/aaai.v37i5.25755. The official AAAI record identifies the title, authors, DOI, volume, pages, and publication date. The full text read here was the nine-page arXiv version 4, arXiv:2208.11660v4, dated 2023-03-28; the publisher's OJS page was not independently downloadable in this session, so this is not a claim that the publisher PDF bytes were checked against the preprint.

Sources:
- Official AAAI record: https://ojs.aaai.org/index.php/AAAI/article/view/25755
- Full-text arXiv PDF (v4): https://arxiv.org/pdf/2208.11660
- arXiv abstract/version record: https://arxiv.org/abs/2208.11660

Read extent: full nine-page PDF, including human-subject design, Bayesian model, results, counterfactual intervention, discussion, and references.

## 2. What was actually observed

The empirical experiment involved **145 people in 29 human-only teams of five**. Participants completed a Hidden Profile task through a chat system. Teams were randomly assigned to communication topologies among the 21 connected five-node graphs. The task included public and private clues; discussion lasted five minutes. The paper reports that the principal analysis relies on the culprit dimension.

The observed messages were human-to-human. The AI agents were not live teammates interacting with those participants during the recorded experiment.

This distinction is explicit in the paper's methods: after collecting the human-only communication data, the authors simulate artificial teams in which each human is shadowed by an agent that observes the same incoming and outgoing messages. The agent models the human's beliefs about self and neighbors. The intervention analysis is then a counterfactual simulation.

**Correct classification:** empirical human–human group data + fitted/shadow Bayesian agents + simulated counterfactual AI interventions.  
**Incorrect classification:** a randomized field experiment in which participants actually collaborated with deployed AI teammates.

## 3. Model structure and measurement boundary

Each shadow agent contains an Ego Model and an Alter Model for each neighbor. The Ego Model is initialized from the human's public/private clues and updated from that human's outgoing messages. Alter Models are initialized uniformly and updated from incoming messages attributed to the corresponding teammate.

The paper's explicit mathematical structure includes:
- a surprise-weighted Bayesian update (Eq. 1);
- an aggregation of the Ego posterior with neighbor Alter posteriors, weighted by the ToM parameter alpha_D (Eq. 2);
- a message-selection rule minimizing KL divergence between Ego and Alter posteriors (Eq. 3).

The communication measure alpha_C is computed from the sender's outgoing messages relative to the sender's own Alter Model of the recipient. The paper states that it does **not** use the recipient's actual surprise or actual internal state. Therefore alpha_C is a model-based estimate of what the sender thinks would be useful to the recipient, not a direct observation of the recipient's mental state.

This is a useful distinction for provenance graphs: a sender's inferred model of a recipient is not the recipient's independently observed state.

## 4. Counterfactual intervention and numerical interpretation

In the intervention section, each shadow agent may choose one message to send to each network neighbor from messages it sent or received. The selected message minimizes the KL divergence between the agent's Ego posterior and the relevant Alter posterior after adding that message. A random-message/no-message intervention is used as a baseline.

Table 1 reports:
- ToM max-performance model: 77.2% (SD 0.8);
- random intervention: 79.0% (SD 1.8);
- targeted intervention: 82.1% (SD 0.7).

The text's **4.9 percentage-point** increase to 82.1% is relative to the 77.2% ToM max-performance baseline. The targeted-versus-random difference is **3.1 percentage points** (82.1 − 79.0). The reported t-test p < 0.0001 is stated for targeted versus random intervention. The table says standard deviations are calculated over 100 trials.

Those 100 trials are simulation/model trials, not 100 additional human teams or 100 independent participant groups. The intervention result is consequently a counterfactual simulation result, not an observed treatment effect from live human–AI interaction.

The paper also reports that alpha_C, computed from the first 25% of messages, predicts final team performance and explains about 8% of its variation. The reported team-level relationship is beta = 0.47, p = 0.019. The independent team-level sample is 29 teams, not 145 independent teams. The result is a model-derived predictive association in this dataset, not a demonstration that an AI agent caused improved human-team performance.

## 5. Relevance and non-transfer boundaries

Useful methodological ideas:
1. Preserve the actual communication graph, message direction, timing, and source identity.
2. Separate a participant's own information from their inferred model of each neighbor.
3. Distinguish observed recipient response from sender-estimated recipient belief.
4. Measure information novelty, convergence, accuracy, and intervention effects separately.
5. Treat messages as nested within people and teams; team-level outcomes require team-level uncertainty and analysis.
6. Compare targeted interventions against matched random/sham interventions, not only against an untreated baseline.

Non-transfer boundaries:
- This is not direct evidence about LLM–LLM collaboration, autonomous agent groups, or real-time human–LLM teamwork.
- The counterfactual simulation does not establish that participants would accept, trust, or benefit from the proposed messages in a live interaction.
- The paper's Bayesian equations and KL objective are source-defined mathematical structures, not H(s)H equations, physical observables, or evidence for a physical theory.
- No equivalence to H(s)H/SAT geometry is asserted.

## 6. Disconfirming design implications (proposal only)

A future consented human–agent study could randomize at the team level among: human-only; shadow-only agent with no messages sent; targeted agent messages; and a matched random/sham-message condition. Preserve the same task, message budget, timing, and provenance capture. Pre-register team-level accuracy and information-integration outcomes, with message/participant observations modeled as nested data. A targeted agent that fails to outperform matched sham messages, or that increases agreement without improving accuracy, would count against the intervention hypothesis.

This is a design proposal only. No participants were recruited, no sessions were run, and no results are claimed.

## 7. Formalization status

The paper contains explicit Bayesian update, product-aggregation, and KL-minimization expressions. A source-faithful formalization would need to specify positivity/zero-probability handling, normalization, graph/neighborhood domains, message availability, and argmin tie-breaking. No new Lean module or proof was created in this review. Existing HsH PR #850 formalizes a separate ConsistencyBench source and must not be represented as a formalization of this paper.

## 8. Epistemic status

- **Historical source:** Westby & Riedl (2023), with full-text reading from arXiv v4.
- **Directly reported empirical data:** 145 participants in 29 human-only teams.
- **Model reconstruction:** Bayesian shadow agents fitted to observed human communication.
- **Counterfactual proposal/simulation:** AI-triggered messages evaluated on the recorded human communication context.
- **Independent replication:** none performed here.
- **H(s)H/SAT interpretation:** none asserted.
