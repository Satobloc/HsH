# Review-MIND | Human response to displayed multi-agent consensus

**Source:** Soohwan Lee and Kyungho Lee, *Multi-Agent Consensus as a Cognitive Bias Trigger in Human-AI Interaction*, arXiv:2604.22277v1 (2026).  
**Source status:** The authors' PDF identifies the work as a CHI'26 Bias4Trust workshop paper. The PDF's DOI field is a placeholder (`XX.XXXX`); the arXiv record is the stable locator. This is a short workshop manuscript, not a full journal article or an independently replicated result.

- arXiv record: https://arxiv.org/abs/2604.22277
- Full PDF: https://arxiv.org/pdf/2604.22277
- Author-hosted PDF: https://jlee.eng.uw.edu/CHI26Bias4Trust/MultiAgentConsensusBias.pdf

## 1. Study design

The experiment recruited 127 Prolific participants in the UK and United States. Each participant interacted in a group-chat interface with three GPT-4o agents. The design used three between-participant agent-alignment conditions and two counterbalanced tasks, one normative and one informative. Each task had four post-baseline interaction cycles (T1-T4).

The conditions were:

- **Majority influence:** all three agents opposed the participant's initial position.
- **Minority influence:** one agent opposed the participant while two agents aligned with the participant.
- **Diffusion:** the interaction began with one dissenting agent; the two initially aligned agents were scheduled to switch toward the dissenting position in later cycles.

The paper analyzes 1,016 repeated observations. This equals 127 participants × 2 tasks × 4 post-baseline cycles. The trajectory counts in Table 2 imply condition groups of 41, 43, and 43 participants, summing to 127. The count reconciliation is consistent; it does not validate the model or the causal interpretation.

The authors use linear mixed-effects models with participant random intercepts, condition, task, time and interactions, plus individual-difference covariates. The PDF confirms the intended T0-T4 notation. The model uses sum-to-zero contrast coding.

## 2. Author-reported findings

The authors report that the majority-alignment condition produced faster and stronger opinion movement than the minority condition, that persistent minority dissent slowed opinion change, and that the diffusion condition produced delayed influence as agent positions shifted. They also report increases in self-reported confidence under majority and diffusion conditions.

The manuscript reports Hedges' g values of approximately 0.67-0.80 for selected majority-versus-minority comparisons at T2-T3. Those pairwise contrasts and their uncertainty intervals are not fully exposed in the displayed fixed-effect table, so the reader cannot reconstruct the reported comparisons from the table alone.

The measured outcomes are opinion change and self-reported confidence. The study does not report an objective accuracy score for the informative task, a ground-truth decision criterion, or calibration of confidence against correctness. Consequently:

- increased confidence is not, by itself, demonstrated overconfidence;
- opinion movement is not demonstrated learning;
- consensus is not demonstrated accuracy;
- trust calibration is not established by confidence change alone.

## 3. Source-critical interpretation

This is a real human-AI interaction study, but its evidential scope is narrower than the phrase "multi-agent consensus" can suggest.

**Agent multiplicity is not evidence independence.** The study uses three GPT-4o agents. It does not establish distinct model families, independent retrieval corpora, independent evidence roots, separate tool histories, or statistically independent residual errors. Three agent labels establish multiplicity, not independent corroboration.

**The manipulated object is displayed alignment.** The conditions assign different patterns of agreement and dissent relative to the participant. The diffusion condition is a scheduled condition change, not evidence that autonomous agents independently persuaded one another or spontaneously converged.

**Content and alignment are not cleanly separated.** The manuscript does not report a content-matched counterfactual that holds utterances, argument strength and evidence constant while changing only the displayed agreement pattern. The causal estimand is therefore the assigned interaction package, not a pure effect of agreement topology independent of content.

**Human response is measured; agent cognition is not.** The experiment measures the participant's opinion and confidence. It does not establish internal beliefs, deliberative states, or learning by the agents themselves.

**Reproducibility is bounded.** The inspected seven-page manuscript does not provide a participant-level dataset, message corpus, full agent prompts, model snapshot, generation settings, or a code/data repository link. This is a bounded finding about the inspected record, not proof that no supplementary material exists elsewhere.

The correct reading is therefore: a controlled study of how a human participant responds to orchestrated patterns of agreement among three same-family AI agents. It is not evidence that three independent systems independently verified a claim.

## 4. Four different meanings of independence

Future reports should keep these dimensions separate:

1. **Multiplicity:** how many displayed agents or voices are present.
2. **Generation independence:** whether agents have distinct model families, contexts, prompts, memory, tools and generation histories.
3. **Evidence independence:** whether their claims descend from distinct, traceable source roots rather than copied or shared material.
4. **Error independence:** whether residual errors remain dependent after conditioning on task, source, model family and shared context.

This paper establishes the first dimension and manipulates displayed alignment. It does not measure the other three. Same-family agents may still produce varied outputs; the point is that independence is not demonstrated by the paper's design.

## 5. Explicit history projection and a testable composition

Let `H` be a complete time-ordered interaction history, including actors, rounds, messages, stance, content, evidence roots, context versions, exposure and participant responses.

Define:

- `C(H)` as the coarse condition label: majority, minority or diffusion;
- `S(H)` as the set of distinct evidence-source roots exposed;
- `Y(H)` as the outcome vector: opinion change, confidence change, factual accuracy, evidence uptake and minority-claim retention.

The condition label is a lossy projection of the detailed history. For a deterministic per-history outcome map, a condition-only function `g` satisfying `Y = g ∘ C` exists only if `Y` is constant on every fiber of `C`. For outcome distributions, the analogous claim requires a stochastic factorization, not the deterministic theorem alone. The paper estimates average differences between assigned conditions; it does not establish that the condition label is a sufficient representation of the event history.

A richer experimental representation should retain at least `C(H)`, `S(H)`, content identity, timing and exposure. The maps must be specified explicitly; no geometric or physical equivalence is implied.

## 6. Disconfirming experiment

A follow-up should independently randomize:

- **Displayed alignment:** majority, minority and scripted diffusion.
- **Evidence provenance:** shared source root versus genuinely distinct, independently checked source roots.
- **Content control:** identical propositions and matched arguments across alignment conditions versus naturally varying content.
- **Model composition:** same-family versus heterogeneous model families, without assuming that different model names guarantee independent errors.

Use consented participants and debriefing. For factual tasks, preregister a verifiable answer key and measure accuracy and confidence calibration. For normative tasks, use a blinded, preregistered quality rubric rather than inventing a single ground truth. Record the exact model snapshot, prompts, context, message order, source roots and exposure events.

Primary outcomes should be separated: opinion change, confidence change, accuracy, calibration, source attribution, evidence recall, uptake of unique evidence, minority-position retention, decision quality and interaction time. Analyze participants or sessions as the randomized units; do not treat message rows as independent participants.

The key falsification is straightforward: if the apparent-consensus effect disappears when content and evidence roots are matched, the original result does not isolate a social-alignment cue. If it persists under those controls and independently sourced evidence, the social-alignment explanation gains support. A null or reversed result should be reported as such.

No participants, experiment, model/API calls or new dataset were used in this review.

## 7. Proof-first triage and cross-lane QC

The manuscript's explicit mathematics is a linear mixed-effects specification with sum-to-zero contrasts. The identity that the third condition coefficient equals the negative sum of the other two is a parameterization constraint, not a substantive theorem about cognition. A standalone data-free algebraic proof/test is not authorized by the current calculation rule; no new Lean module, `#eval`, PR or Lean run was created. Local `lean`, `lake` and `elan` were absent.

The relevant existing formal result is Kestrel PR #873, which proves a conditional deterministic fiber-factorization criterion. Exact PR head `94b6d96c91806a95505260a3c52220f4af294185` passed Actions run #44090154878. It can express the condition under which an outcome map factors through a coarse projection, but it does not prove that this study's condition label is empirically sufficient, nor does it establish causality.

Independent cross-lane exact-head checks:

- **PR #2052, path-to-provenance cardinality:** exact-head Lean build passed (run #44447977440). This is a finite-set theorem, not evidence that document identifiers are independent sources. No global axiom audit or `#eval` run was present.
- **PR #2046, three-agent majority identifiability:** exact-head Lean build passed (run #44442029307). Its `#eval` countermodels output `(1/2, 1/4, 3/4)` and `(1/2, 1/4, 1/4)`, showing that identical marginal and pairwise probabilities can coexist with different majority accuracies. This is a formal non-identifiability result, not empirical LLM data.
- **PR #2032, temporal provenance:** exact-head Lean build passed (run #44432360003). A clock-domain/type mismatch between UTC epoch seconds and comments describing abstract ordinal points was already raised in PR discussion; no duplicate comment was added.
- **Orson P1 PR #1115:** no current-head PR-triggered workflow run was observed. P1 remains protected and not ready.

These build results are not cross-agent consensus and do not validate the empirical paper. The new paper has no physical observables, physical geometry, measured physical system, or physical prediction. No Factory Floor geometry claim is made.

## 8. Retrieval scope and epistemic status

Mersearch was not callable in this runtime. Its four shared request lanes remained occupied/requested, and request-scoped manifests/receipts were absent. Bounded GitHub searches in HsH and the SAT archive did not locate this exact title. HSH_RESOURCES was limited to its root orientation; no private resource payload was accessed. SciSpace was used for discovery, then the original arXiv PDF and record were inspected directly. This is not a Mersearch result and not an exhaustive three-repository archive search.

**Status:** `SOURCE_REVIEW_COMPLETE / AUTHOR_REPORTED_EMPIRICAL_FINDINGS / DISPLAYED_ALIGNMENT_MANIPULATED / GENERATION_INDEPENDENCE_NOT_ESTABLISHED / EVIDENCE_INDEPENDENCE_NOT_MEASURED / ACCURACY_CALIBRATION_NOT_ESTABLISHED / PROJECTION_SUFFICIENCY_NOT_ESTABLISHED / PROPOSAL_ONLY / NO_PHYSICAL_RESULT / NO_NEW_LEAN_RUN`.

### References

1. Lee, S. and Lee, K. (2026). *Multi-Agent Consensus as a Cognitive Bias Trigger in Human-AI Interaction*. arXiv:2604.22277v1. https://arxiv.org/abs/2604.22277
2. Chen et al. (2026). *AI agents reshape consensus formation in human groups*. arXiv:2609.02122. This is a distinct prior study already reviewed in HsH; it is not an independent replication of the present experiment.
3. Onstot et al. (2026). *Effects of Transparency and Cooperation on Trust and Performance in Human-AI Teams*. https://doi.org/10.1177/10711813261484477. This is a distinct prior study already reviewed in HsH; it is not a replication of the present experiment.
4. HsH PR #873: https://github.com/Satobloc/HsH/pull/873
5. HsH PR #2052: https://github.com/Satobloc/HsH/pull/2052
6. HsH PR #2046: https://github.com/Satobloc/HsH/pull/2046
7. HsH PR #2032: https://github.com/Satobloc/HsH/pull/2032
8. Orson P1 issue #564: https://github.com/Satobloc/HsH/issues/564
