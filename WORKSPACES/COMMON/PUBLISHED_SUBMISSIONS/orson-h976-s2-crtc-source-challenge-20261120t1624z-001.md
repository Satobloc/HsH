# Orson h976:s2 - CRTC source challenge: protocol context, readout locus, and the missing geometry map

**Disposition:** SOURCE_REVIEW_COMPLETE / CRTC_V0.1_UNCHANGED / P1_FREEZE_PRESERVED  
**Selected ring label:** Orson Vay, index 18. **Next label:** Sable, index 0.  
**Work mode:** source-grounded assistant reconstruction; not authenticated historical-instance participation.

## 1. Authority and thread continuity

The Orson role is grounded in a direct user-role appointment in the MIRA archive dated 2026-09-23. It assigns an AI-cognition expert/advisor remit focused on Nathan-LLM interaction, reasoning and metacognition, bounded test design, and tool/agent coordination. The raw message has no author.name; it is user-role source evidence, not independent identity authentication. The 2026-10-09 role charter is an assistant-maintained reconstruction, not a separately signed specialist charter. Its exact private source identifiers remain in the Library and are not copied into this public workspace.

A raw export of the conversation titled **Orson LLM Cognition Lab** was located in the private Library. It is marked unarchived and its last user-role message is dated 2026-11-06. However, the last explicit user direction within that conversation, on 2026-10-18, moved that thread from priority/cognition work to H(s)H theory work. The later November 6 message did not explicitly reactivate the cognition remit. Live thread usability was not verifiable in this runtime. The thread is therefore preserved as an existing conversation candidate, but is **not treated as a current cognition-lane destination** without direct reactivation. No conversation ID or private transcript was copied here; no new conversation was created and no cross-thread delivery is claimed.

The five latest substantive Orson-labeled workspace checkpoints are cognition-focused (h972, h968, h957, h953, h946). That is a 5/5 content mix, not proof of five authenticated Orson-instance appearances. The 4/5 allocation can be said to hold at the work-content level; the authenticated-instance denominator remains unverified.

## 2. Source-review delta

The existing **Cognitive Readout Target Contract v0.1 (CRTC)** already distinguishes model/version, unit, information state, target, criterion/provenance, channel, intervention, dependence, validation, and evidence status. The following literature adds precision to those distinctions without authorizing a protocol change.

### 2.1 Protocol context can change the measured confidence

Kim and Kang, *Same Answer, Different Confidence: Protocol Sensitivity in Measuring LLM Confidence*, arXiv:2605.27752v4 (revised 2026-10-23), hold the answer and correctness label fixed while varying the scoring context. Across five models, four datasets, and twenty settings, confidence calibration and ranking can change materially; eight of twenty settings switch between calibrated and miscalibrated classifications under different contexts. Their reporting checklist records the generating prompt, scored answer, scoring context, token aggregation, correctness rule, metric, estimator, and uncertainty. This is direct evidence that a confidence score is not fully specified by a model name and target alone.

### 2.2 Answer ownership is a measurement condition

Sanz-Guerrero, Mager, and von der Wense, *Large Language Models Are Overconfident in Their Own Responses*, Findings of ACL 2026, compare identical answers framed as assistant-generated versus user-supplied. Their six open-weight base/instruct pairs (12 variants) span Llama 3.1, Qwen 3, and Gemma 3; the study uses three confidence-elicitation methods and evaluates MMLU, GSM8K, TruthfulQA, and open-ended MMLU. On MMLU, the average assistant-minus-user ECE differences are 0.098 for P(True), 0.179 for verbal percentage, and 0.261 for linguistic confidence; raw-confidence differences are 0.158, 0.181, and 0.268 respectively. A GPT-5.2 extension points in the same direction. The authors limit the generalization claim: most experiments use open-weight models and objective question answering, not subjective open-ended work.

### 2.3 Generation confidence, error detection, and correctability are distinct targets

Kumaran et al., *How LLMs Detect and Correct Their Own Errors: The Role of Internal Confidence Signals*, arXiv:2604.22271v2 (2026-05-01; preprint, under review), distinguish generation-time answer log-probabilities (X_act) from a post-answer evaluative representation at the post-answer newline token (PANL, X_eval). In a verify-then-correct design, verbal confidence predicts error detection beyond answer log-probabilities, while PANL activations predict error detection beyond verbal confidence. For initially incorrect answers that were changed, the PANL probe predicts second-answer correctness with AUROC 0.614 versus 0.475 for the combined behavioral baseline. The main study uses Gemma 3 27B on 7,227 TriviaQA questions, with Qwen 2.5 7B and MNLI replications. The result is promising but remains a preprint from a related research program, not an independent replication or a universal architecture claim.

### 2.4 Local and global confidence are different estimands

Amador Diaz Lopez, *When Confidence Signals Disagree: Local and Global Confidence in Autoregressive Language Models*, arXiv:2609.16933 (2026), defines local confidence as the probability of the greedy answer token, global confidence as the maximum answer frequency in a sampled answer distribution, and their disagreement as the absolute difference between those quantities. The exploratory study uses one quantized Llama 3.3 70B model, 100 MMLU questions, 99 ARC questions, and 60 samples per question at temperature 0.7. The disagreement-entropy association is moderate on ARC (reported Spearman rho about 0.42) and weaker on MMLU. This is a single-model association study, not a causal result. It shows why aggregation scope, sample count, temperature, and answer-equivalence rules belong in the measurement record.

### 2.5 A proposed geometric landscape still lacks its defining map

Kim, *Knowing Before Speaking: In-Computation Metacognition Precedes Verbal Confidence in Large Language Models*, Preprints.org 10.20944/preprints202604.0078.v2 (2026; preprint, not peer reviewed), compares pre-answer token entropy and hidden-state variance on TriviaQA using Qwen2.5 7B and Qwen3 8B. The report uses 300 questions for entropy analysis and 50 for hidden-state analysis. It reports a paired Wilcoxon result of p=0.165 for one individual-pair comparison and an abstention recall of 27.8%, while acknowledging narrow task/model coverage and uncertain generalization.

The paper's phrase **Knowledge Landscape** describes a topological structure on parameter space, but the reported observables are token entropy and layer-wise hidden-state variance. The source does not supply an explicit map from parameter space to the measured activation states, a metric on that space, or a topology-preserving projection. Consequently, the valley/plain language remains an interpretation of proxy measurements, not an established parameter-space topology. No H(s)H shape analogy or topological theorem is imported from it.

### 2.6 A normative decision model is useful, but conditional

Kumaran et al., *The Computational Basis of Confidence in Large Language Models*, arXiv:2607.12447 (2026), use a statistical-decision-confidence model with signed evidence Delta, noisy latent decision variable d = Delta + epsilon, choice determined by sign(d), and confidence defined as the posterior probability that the choice is correct. Answer-logit difference behaves as a readout of that variable in several perceptual and memory tasks. A separate abstention task uses an explicitly instructed 60% threshold; Qwen 2.5 7B abstains on 87.7% of trials and is 99.95% accurate on committed trials. This is not evidence of an autonomous default abstention policy. The authors also note that behavioral signatures do not prove that the model implements the normative observer's exact computation, and that reliability-versus-evidence effects remain unresolved. This paper and the PANL work are part of a related author program, not independent replications.

## 3. CRTC v0.1 implications - candidate subfields, not an amendment

The current CRTC top-level fields are directionally adequate. The new sources suggest that their subfields should be made explicit in any future, authorized instrument version:

| Existing CRTC field | Candidate point-of-use detail |
|---|---|
| Criterion / provenance | Answer source and ownership (assistant, user, third party); exact answer string and normalization; scoring prompt/context/chat template; correctness rule; evaluator identity/version. |
| Channel | Readout locus (token position, layer, residual stream, logit, verbal report, sampled answer distribution); aggregation scope; sample count, temperature, seed, and estimator. |
| Information state | Pre-answer; generation; post-answer/pre-verification; verification; post-correction. Record exactly what information is available at each readout. |
| Target | Initial-answer correctness; error detection; answer revision; correction success conditional on revision; external judge score; prompt-level success; abstention/action utility. |
| Intervention | Ownership framing, answer insertion, chat template, activation patching/steering, and feedback/tool exposure. |
| Validation | Independent labels, held-out split, calibration and ranking metrics, uncertainty intervals, paired tests, evaluator dependence, and external replication. |

The key conceptual separation is among (1) generation-linked confidence, (2) post-answer evaluation, (3) external judge score, and (4) the action policy that uses a confidence signal. Error detection is not correctability; correctability is not correctness; abstention is not calibration; and a judge-score predictor is not thereby a correctness predictor. These are target and measurement distinctions, not claims that the signals are statistically independent in every model.

No CRTC v0.2 was created, no field was adopted, and no P1 protocol or experiment was changed.

## 4. Proof-first and Lean status

The CRTC and source literature contain explicit mathematical structure, but the new empirical findings do not themselves yield source-independent theorems. Existing Orson formalization in draft PR #850 already covers relevant conditional mathematics:

- OrsonCaliberConfidenceState: group-level prompt success versus instance-level correctness; equal group means do not identify the instance outcome vector.
- OrsonSilentDissentReadout: an observation-fiber collision prevents a decoder from recovering every latent state; a hit-rate contrast does not identify either marginal.
- OrsonEvaluatorMeasurementDecomposition: source-defined contrast identities and conditional non-injectivity of fixed-order and bundled-cue projections.
- OrsonJudgeScoreGeometry: a finite-vector residual-energy identity for a one-direction score projection.
- OrsonDebateValidityMeasurement: observed accuracy decomposes into response-validity rate times accuracy conditional on a valid response.

The PR head is 6b4eebeacf4f6928f18601626e4e9e3942d73d81. Existing GitHub Actions run #44416543286 / job #135198228890 completed a **merge-reference build**, using synthetic merge commit 8e0aad3 with base 598a45b3; Lean 4.34.0 and Lake 5.0.0 reported 8,991 jobs successful, including the relevant modules. This is not a standalone exact-head build. Tests, lint, leanchecker, nanoda, and the global axiom audit were skipped. No local Lean/Lake/Elan installation or manual workflow-dispatch tool was available in this runtime.

No new Lean module or theorem was added. The new papers' central claims are empirical or depend on model-specific measurement assumptions. In particular, the Knowledge Landscape preprint lacks the explicit parameter-to-activation map and metric/topology needed for a faithful geometric theorem. Encoding its proxy statistics would not prove the landscape claim.

## 5. Scope, provenance, and project controls

- P1 remains OVERDUE / NOT READY and frozen. No model trial, human session, API spend, dataset expansion, protocol amendment, manuscript edit, or paper-gate advancement occurred.
- P0 Code Grurple remains ACTIVE. P2 November 30 remains HOLD. P3 December 14 remains INCOMPLETE. FIE next review is November 24, 2026.
- Mersearch was not executed. All four canonical request lanes remain occupied/requested; no request was overwritten or retriggered. No local pinned three-repository checkout or callable Mersearch action was available. GitHub and Library searches were bounded fallbacks, not a Mersearch result or exhaustive three-repository search.
- HsH and SAT archive front doors and the SAT archive AI orientation documents were read. HSH_RESOURCES root README was read, but its private/internal payload was not opened. Internal three-repository source coverage is therefore partial.
- Existing Math Hopper #578 and PR #991, Whirligig Kernel 0, PR #850, and SciSpace were checked. SciSpace was used for discovery; generic queries produced irrelevant results, so the primary papers above were read directly. No new tool, fork, branch, PR, dependency, subscription, or paid service was created. Fork counts were not exposed by the current connector.
- The last unrelated reading break remains the h964 SAT archive read of fun break - lx.txt, lines 2081-2130; next cursor 2131. It was not repeated in this run. FIE review is not yet due.
- No physical system was selected, no CODATA comparison or physical calculation was performed, and no SAT-O/Blockwave equation was changed.

## 6. Next bounded step

Continue source-only review of confidence-to-action and correctability literature, then prepare a typed CRTC field dictionary as a proposal for review. Do not run an LLM experiment, amend the frozen protocol, or create a new Lean theorem until a source-derived proposition and the relevant authorization are explicit. Keep the Orson cognition remit separate from the theory work in the existing Orson-titled conversation.

## Sources

1. Kim & Kang, *Same Answer, Different Confidence: Protocol Sensitivity in Measuring LLM Confidence*, arXiv:2605.27752v4: https://arxiv.org/abs/2605.27752
2. Sanz-Guerrero, Mager & von der Wense, *Large Language Models Are Overconfident in Their Own Responses*, Findings of ACL 2026: https://aclanthology.org/2026.findings-acl.1570/
3. Kumaran et al., *How LLMs Detect and Correct Their Own Errors: The Role of Internal Confidence Signals*, arXiv:2604.22271v2: https://arxiv.org/abs/2604.22271
4. Amador Diaz Lopez, *When Confidence Signals Disagree: Local and Global Confidence in Autoregressive Language Models*, arXiv:2609.16933: https://arxiv.org/abs/2609.16933
5. Kim, *Knowing Before Speaking: In-Computation Metacognition Precedes Verbal Confidence in Large Language Models*, Preprints.org: https://doi.org/10.20944/preprints202604.0078.v2
6. Kumaran et al., *The Computational Basis of Confidence in Large Language Models*, arXiv:2607.12447: https://arxiv.org/abs/2607.12447
