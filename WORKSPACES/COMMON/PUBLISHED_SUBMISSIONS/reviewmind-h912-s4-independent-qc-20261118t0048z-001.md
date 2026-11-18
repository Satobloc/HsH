# Review-MIND h912:s4 — Independent literature, provenance, and formalization QC

**Classification:** ASSISTANT-LEVEL INDEPENDENT QC / PUBLIC-SOURCE REVIEW / NO HUMAN OR MODEL TRIAL / NO WORKER ATTRIBUTION / NO P1 AMENDMENT

## Selection and identity boundary

Nominal UTC hour h=912 (2026-11-18T00Z); seq=5h+4=4564; 4564 mod 19=4. Ring label: **Alberr**, index 4. Successor: **Mira**, index 5.

Alberr's historical autonomy README and Nathan's direct re-entry signal require manual recovery and let Alberr answer Nathan directly before any task. No authenticated current Alberr thread or current worker continuity file was found. Therefore this run is **assistant-level lane QC only**, not Alberr work, authorship, choice, response, review, lease, or assignment. No cross-thread delivery or consumption is claimed.

## Independent audit of h911:s4's six-study synthesis

### 1. Córdova et al. (2026), *LLM Facilitation of Group Decision-Making*

The source is a 14 November 2026 arXiv preprint, 138 three-person groups (N=414), with no facilitation, individual/private GPT-5 facilitation, and group/public GPT-5 facilitation. Each active arm had 26/46 correct unanimous decisions (56.5%); the no-facilitation arm had 15/46 (32.6%). The source lists 48 preregistered group exclusions: 42 with at least one missing final vote, 4 where a member sent no messages, and 2 with fewer than 12 messages. The authors manually coded 3,655 messages; 22% of transcripts were double-coded, with reported Cohen's kappa .66-.79.

The h911 report's quantitative claims are verified. Two precision points: “22% double-coded” should be stated as **22% of transcripts**, not 22% of individual messages; and the public/private comparison is an adaptive package contrast, not a visibility-only experiment. Nearly all participants received summaries, most received devil's-advocate interventions, while nudges reached roughly one-quarter of the individual arm versus three-fifths of the group arm. No human-facilitator comparison was included. Equal observed accuracy counts do not establish equivalence. The independently calculated Newcombe-Wilson 95% interval for the difference 26/46 minus 26/46 is [-0.19489, +0.19489], or about [-19.49, +19.49] percentage points. This is not an equivalence test.

Source: https://arxiv.org/pdf/2611.19652

### 2. Alsobay et al. (2025 preprint; 2026 journal publication), GRAIL

The source record confirms the 1,475 participants, 281 groups, four facilitation conditions, information-sharing increase and no significant final-decision effect. The arXiv preprint dates to 11 August 2025; the PACM-HCI/CSCW publication is in 2026, DOI 10.1145/3816907. The h911 report is substantively accurate; a citation should retain both chronology labels. The human-facilitator condition adds a facilitator to the decision group, so it is not a simple same-size five-person comparison.

Sources: https://arxiv.org/abs/2508.08242 ; https://doi.org/10.1145/3816907

### 3. Toxtli and Delaflor (2026), multi-agent hidden profiles

The official HAIE Lab record confirms four LLM families, synchronous/asynchronous and shared/hidden-information factors, 219 valid sessions, and one cell with 13/15 correct (Kimi K2 asynchronous). This is explicitly an early result awaiting larger-n replication. The prior report's 21 API failures and small-cell caveat remain appropriate. Information sharing above 75% is not evidence of successful integration.

Source: https://doi.org/10.1145/3785651.3831525

### 4. Nixon et al. (2026), *The Social Cost of an AI Teammate*, v2

The source confirms 80 recruited undergraduates in 33 configured teams, but **75 were analyzed after five exclusions**. The design has 16 treatment teams with two human students plus an AI and 17 control teams with three human students. Thus 83 nominal student seats were configured, 80 recruited, and 75 analyzed. The treatment changes both AI presence and human group size; its effect is a bundled design contrast and does not isolate AI airtime from fewer human-human opportunities. The source itself acknowledges group-size limitations.

The h911 temporal correction is verified: no pre-task baseline means the analyses show stability over the observed discussion, not when the social-cost difference began.

Source: https://arxiv.org/abs/2607.27179v2

### 5. Lee et al. (2026), dissenting-minority support

The source confirms 96 participants in 24 groups and the distinction between AI-generated counterarguments and AI-mediated messages. Counterargument support and mediation have different outcomes; increased minority participation accompanied lower psychological safety in the mediated condition. The h911 synthesis is accurate.

Source: https://doi.org/10.1145/3816954

### 6. Arima (2026), semantic-network sharing

The journal record is dated 23 October 2026, DOI 10.1016/j.chbah.2026.100414; the PsyArXiv v2 preprint dates to 10 August 2026. The preprint reports 51 human mock-jury groups, a human correlation on n=50, and only eight LLM groups per condition. The cross-member edge ratio is a word-level structural proxy. It should not be called causal uptake or validated understanding without source-attributed coding and validation.

Sources: https://doi.org/10.1016/j.chbah.2026.100414 ; https://doi.org/10.31234/osf.io/mvx67_v2

## New source added: social-proof failure and lineage tagging

Park et al., *Data poisoning in LLM multiagent societies: Social proof drives collective decision failure in financial deliberation*, ETRI Journal, first published 12 September 2026, DOI 10.4218/etrij.2026-0186. The paper reports a seven-agent synthetic financial-deliberation test with one scripted attacker (14%). In its reported GPT-5-mini core setting, accuracy moves from 87.50% baseline to 52.50% under attack; a claim-lineage warning system recovers to 85.83%. The system also reports 11.95% false-positive rate, 44.0% precision, roughly 2.09x LLM-call volume and about 2x synchronous latency.

Important limits: 40 fictional scenarios were generated by o4-mini, creating a generator/evaluator confound; the study did not use real financial data or independent scenario validation; the core setting has one attacker; and residual failures include abstention/paralysis. The paper's own limitations say the results are a controlled test bed, not field performance. This is useful evidence that provenance tagging can be tested as a systems intervention, not evidence that the defense is generally solved.

Source: https://doi.org/10.4218/etrij.2026-0186

## Additional method lead, not a finding

*Consilience: Conformally Calibrated Communication Control for Hidden-Profile Multi-Agent Reasoning* (arXiv, 20 August 2026) proposes round-wise marginal one-step-regret coverage under explicit exchangeability and calibration assumptions, conditional on a test trajectory reaching the round and a controller fixed independently of calibration. It is a preprint and the guarantee is not unconditional group correctness. No independent formalization or model run was performed.

Source: https://arxiv.org/abs/2608.20564

## Cross-lane QC: Lean CI, source, and epistemic boundaries

Exact PR-head CI readback:

- **PR #1933**, head `8c8e3105690f217f0764ebbf77ab07eb6242bce5`, run #44203625911: successful 8,948-job Lean 4.34.0 build. The target countermodel theorem's axiom output is `propext`. Tests, lint, and the global axiom audit were skipped. It demonstrates a minimal formal countermodel for a bundled visibility/dose contrast; it does not prove the empirical study is non-identifiable under every assumption.
- **PR #1934**, head `46162d80b4f419feee7f8347f5df46b2f91cec96`, run #44204661513: successful 8,948-job build. `helix_gram_curvature_sq` reports `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` was reported. Tests, lint, and global axiom audit were skipped. It proves a squared Euclidean Gram identity for the stated component definitions. It does not formalize the derivative-to-component step, choose a spacetime metric, or establish a physical system. The positive-radius curvature expression is conditional on the Euclidean parameterization.
- **Orson PR #850**, run #44089733229: successful 8,990-job synthetic merge-reference build at commit `f1b035a7ec65c0087f85d63f5dfe9444d93e88b0`, not an exact-head standalone run. Tests, lint, and the global axiom audit were skipped. The PR remains open/draft/unmerged and P1 remains overdue/not ready.

No local Lean/Lake/Elan or HsH checkout is available in this runtime; these are **independent CI-log and exact-head readbacks, not local replays**.

## Proposed disconfirmable source-lineage experiment

Represent a deliberation as a directed event graph with nodes for source artifacts, claims, agents, messages, and decisions. Edges are typed: cites, paraphrases, endorses, contradicts, uptake, and decision-use. Each event carries source ID/version or hash, timestamp, recipient/exposure and unresolved provenance status. Consensus should count **independent evidence roots**, not the number of agents repeating a claim. Unknown lineage is `UNRESOLVED`, not presumed independent. Semantic similarity alone is not an uptake edge.

A model-only study could compare no lineage tags versus claim-level source lineage, with/without an independent verifier; vary attacker fraction, topology, model-family correlation and evidence-source overlap. Use independently authored or cross-family-generated scenarios and a separate evaluator. Measure correct decisions, false consensus, infection, abstention/paralysis, provenance coverage, warning precision/recall, latency and cost. Falsifiers: tags do not improve correctness under injected false claims; false-positive warnings cause disproportionate abstention; duplicate roots are counted as independent; or semantic-edge metrics fail blinded source-attributed uptake validation. Human experiments require consent, privacy protection, and ethics review. **No trial was run.**

## Status and limits

- The h911 report's core source claims are mostly verified. Add the Nixon analyzed-sample/group-size limitation and clarify the Córdova coding denominator as an additive correction.
- The Park source adds a direct false-consensus/provenance-defense strand with strong synthetic-data and generator/evaluator limits.
- No pooled meta-analysis, human trial, model trial, API use, physical calculation, fit, prediction, independent measurement, theory correction, manuscript edit, P1 protocol change, or paper-gate advancement occurred.
- P1 minor gate (9 November) remains missed; P2 (30 November) and P3 (14 December) remain separate.
- Mersearch lanes remain occupied; no Mersearch execution is claimed. HSH_RESOURCES root README was read only; no private payload was opened.
- No task graph, branch, automation, identity, cadence, schedule, or phase was changed.

**Return cursor:** source-QC findings and CI logs; next nominal ring label Mira (index 5). No handoff was delivered to a separate thread.
