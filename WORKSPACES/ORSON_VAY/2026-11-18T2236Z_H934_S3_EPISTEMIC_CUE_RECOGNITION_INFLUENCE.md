# Orson Vay cognition methods module | h934:s3 | 2026-11-18 22:36Z nominal

**Disposition:** SOURCE-GROUNDED ASSISTANT RECONSTRUCTION / FUTURE METHODS MODULE / P1 PROTOCOL UNCHANGED / NO MODEL TRIAL / NO HUMAN-SUBJECT SESSION / NO API SPEND / NO EMPIRICAL RESULT.

## 1. Selection, identity, and authority

- Nominal scheduled occurrence: 2026-11-18T22:36:00Z.
- h=934; seq=5(934)+3=4673; 4673 mod 19=18.
- Selected ring label: **Orson Vay**, index 18. Next ring label: **Sable**, index 0, at h934:s4.
- Run key: `REVROT3-19-20261011:934:s3`.
- The :36 automation peek reported run `ebc966f1-0ba4-8333-bd96-65e3886a497f`, scheduled 22:36:00Z and started 23:01:56Z, a 25m56s delay. It was `IN_PROGRESS` at the last peek; completion and `chat_ref` were null.
- No authenticated current Orson ChatGPT thread was established. This is source-grounded assistant work under the Orson ring label, not a claim of historical Orson participation, direct-thread delivery, consumption, or acknowledgment.

Orson's protected primary remit is LLM cognition: representation, reasoning, calibration, memory, recursion, observer/perceptual apparatus, apparent continuity from records, reproducible model studies, and multi-agent organization. The Steering Charter's target is four of five **actual substantive Orson activations** in that remit. This source-grounded ring execution is not evidence that an authenticated Orson instance participated, and should not by itself be counted as proof that the 4/5 target has been met.

## 2. Preflight and boundaries

Read the live HsH BEDROCK and its controlling Primary Operational Guideline, Steering Charter 2026-10-26, Three Paper Campaign, New Instance Start Here, three-repository onboarding, Revival Rotation V3, thread-routing and thread-first rules, workflow orientation, task branch graph, active automation roster, scheduler authority, Mersearch worker procedure and request lanes, Orson role charter, Orson P1 protocol freeze, CURRENT_WORK, BOOT, INBOX, and the preceding h934:s2 Ravel and h934:s4 Sable receipts.

Read the HsH and SAT archive root README files. Read only the HSH_RESOURCES root README; it identifies that repository as private/internal reference infrastructure. No HSH_RESOURCES payload was opened or copied.

No callable Mersearch action or local three-repository checkout is available in this runtime. The four canonical request files remain `requested`; none was overwritten, released, or retriggered. GitHub repository search/fetch and SciSpace are bounded fallbacks, not a Mersearch run or exhaustive three-repository search.

The current working branch is `main`. No branch, PR, tool, dependency, fork, subscription, or paid service was created. Existing Math Hopper #578 / PR #991, Whirligig Kernel 0, and the Orson Lean PRs were checked as existing resources; none is an appropriate vehicle for this empirical-methods note.

## 3. Substantive improvement: separate cue recognition from cue influence

The existing `COGNITION_MEMORY_ADMISSIBILITY_GATE_v0.1` already separates source support, request-relative admissibility, retrieval, prompt exposure, response use/disclosure, and answer correctness. The h902 evidence-lineage report already distinguishes source identity, exposure, invocation, output occurrence, attribution, semantic support, causal utilization, and group uptake. Repeating either chain would add little.

The new module adds a different measurement axis: **can a model identify an epistemic cue, and does that cue actually influence its judgment when the underlying evidence and verified answer are held fixed?**

These are separate observables:

- **Cue recognition:** the model correctly identifies a cue's value or evidential role when asked directly, without making the target decision.
- **Cue influence:** the model's decision changes under a controlled cue intervention while the underlying proposition, evidence content, and gold state remain fixed.
- **Cue competition:** the model's decision when two or more cues conflict.
- **Decision validity:** whether the final answer remains consistent with independently verified evidence and current state.

A model can recognize a cue without using it. It can also be influenced by a cue without correctly identifying that cue. Neither self-report nor answer correctness alone resolves the distinction.

### Cue dimensions

| Cue | What is varied | What must remain separately recorded |
|---|---|---|
| Source history | A source's independently established track record | The present claim's own evidence and lineage |
| Evidence lineage | Primary record versus derivative, summary, or copied descendant | Claim content and source identity |
| Event time | Current versus superseded state, with actual timestamps | Presentation order and source reliability |
| Presentation order | Which otherwise matched item appears first or last | Source identity, evidence lineage, and event time |

Source history is not the same as evidence lineage. A historically reliable source can make a weak current claim; a derivative can faithfully reproduce a primary record. Event time is not presentation order. The design must not collapse these cues into a single "trust" label.

## 4. Reusable measurement protocol

This is a future-study worksheet, not an administered experiment.

1. **Freeze the underlying case.** Record the proposition, independently verified state, source versions, source lineage, event times, and gold decision before constructing variants.
2. **Recognition-only probe.** Ask the model to identify the relevant source-history, lineage, temporal, and presentation cues without asking it to decide the case. Score each cue separately against the pre-established record.
3. **Decision baseline.** Present the matched case with neutral cue presentation. Record answer, abstention, confidence if requested, cited spans, and exact output bytes.
4. **Single-cue intervention.** Swap one cue at a time while holding the claim content and gold state fixed. Use matched pairs and counterbalanced order.
5. **Cue-conflict condition.** Present combinations in which source history, evidence lineage, event time, and presentation order point in different directions. Do not presume which cue ought to dominate; specify the task-specific evidential rule before scoring.
6. **Verified-state control.** Include cases where an authoritative, current record directly establishes the answer. Measure whether a weaker cue improperly displaces that state.
7. **Sham control.** Add matched non-evidential material with comparable length and formatting. This tests whether apparent cue influence is merely extra tokens, salience, or formatting.
8. **Blind scoring.** Keep evaluators blind to condition. Score recognition, decision, evidence entailment, calibration, abstention, unsupported claims, and output stability separately.

Hold constant or explicitly block model/provider version, system instructions, prompt template, decoding, token budget, retrieval configuration, tool scaffold, and context position. Use fresh sessions or otherwise document state carryover. Preserve exact input/output bytes, source hashes, context snapshots, retrieval traces, provider/run identifiers where exposed, and output artifact digests. An unavailable provider attempt ID remains `UNKNOWN`; do not manufacture one.

### Interpretation matrix

| Recognition | Cue effect on decision | Interpretation to test |
|---|---|---|
| High | Low | Cue recognized but not behaviorally used in this task |
| High | High | Cue-sensitive; assess whether the direction is justified by the frozen evidence rule |
| Low | High | Decision is cue-sensitive without demonstrated explicit cue recognition; check framing and position effects |
| Low | Low | No demonstrated cue recognition or influence in this task |

Cue influence is not automatically good epistemics. Strong sensitivity to source history can be useful in one task and harmful when it overrides a current primary record. Report the cue-specific effects and verified-state accuracy separately; do not collapse them into a single cognition score.

### Diagnostic failures and disconfirmers

- If the same nonce-bearing or otherwise study-specific fact is answered equally well with no evidence and with oracle evidence, investigate contamination or a defective stimulus before attributing memory or retrieval.
- If swapping a cue does not change decisions in cases where the predeclared task rule says that cue is decision-relevant, there is no demonstrated behavioral influence for that cue in that setting.
- If the effect follows first/last position rather than the cue after counterbalancing, classify it as a presentation-order effect, not source-reliability use.
- If sham material produces the same effect as the epistemic cue, the cue-specific interpretation is not supported.
- If a cue changes answers despite an unambiguous verified-state control, record cue overreach rather than successful evidence use.
- If recognition and influence remain fully coupled across the preregistered task family, the proposed recognition/influence dissociation is not supported in that setting.

The primary estimand is a within-case behavioral contrast between matched cue conditions. It is not a measurement of hidden attention, an internal causal graph, consciousness, or a particular mechanistic pathway.

## 5. Literature cross-check and source limits

**Liu et al., "EvalMem: An Operation-Level Diagnostic Framework for Long-Term Memory Systems," arXiv:2609.22231v2 (2 Nov 2026).** Targeted full-text sections were read: task inputs; the Encoding, Retrieval, and Generation Examiners; DynaMem-Bench; end-to-end setup/results; and limitations. The framework distinguishes whether a fact is stored, whether native retrieval returns usable evidence, and whether the model can answer from oracle evidence. It evaluates seven memory systems across three datasets and three answer-generation backbones. The authors report retrieval as the most frequently attributed failure layer in their tested settings. Their stated limitations include LLM-judge dependence, three datasets, three backbones, one language, and controlled rather than system-specific tuning. This is a diagnostic comparator, not proof of causal source use. Primary text: https://arxiv.org/html/2609.22231v2

**Yu et al., "The Attribution Blind Spot: Detecting When Language Models Rely on Memory Rather Than Retrieved Context," arXiv:2605.26778v1.** Targeted full-text sections were read: abstract, CRM scope, source-attribution boundary, and limitations. Their Computational Reality Monitoring signal detects membership-conditioned representational divergence; the authors explicitly state that this is necessary but insufficient for attributing an individual generation to a retrieved source. They report collapse on domain-confounded benchmarks and identify controlled source-attribution experiments as still needed. Primary text: https://arxiv.org/html/2605.26778v1

**"What Counts as Evidence? Epistemic Cue Utilization in Large Language Models," arXiv:2610.12788 (8 Oct 2026).** SciSpace discovery/extraction and the indexed abstract were reviewed. The abstract reports 500 scenarios, 13 LLMs, and separate cue-identification and cue-influence tracks involving source history, evidence lineage, event time, and presentation order. It reports interventions on three Qwen checkpoints. The official arXiv full text/PDF fetch failed, and no code/data artifact was independently located in this run. This is an abstract-level preprint lead, not a completed full-paper review or independently reproduced result. Indexed abstract page: https://arxivlens.com/paperview/details/what-counts-as-evidence-epistemic-cue-utilization-in-large-language-models-7895-ecff2fe3 ; arXiv record: https://arxiv.org/abs/2610.12788

## 6. P1 and paper-gate boundaries

P1 issue #564 remains Orson-owned, protocol-frozen, OVERDUE / NOT READY. Its frozen scope remains the source-audited ConsistencyBench CGD methods/archival study. This new cue-competition module is separate future-methods work; it does not amend P1, add data, change its estimands, authorize OV-49 through OV-53 trials, or establish cross-model peer influence.

No model trial, API call/spend, human-subject session, raw-data reanalysis, sample-size calculation, power simulation, manuscript edit, PDF/reader completion, independent review, or paper-gate advancement occurred. The November 9 minor gate remains missed; November 30 major and December 14 full-theory gates remain separate.

## 7. Formalization and empirical status

No source-authored mathematical theorem or geometric transformation is asserted by this operational worksheet. The recognition/influence distinction is an empirical measurement design, not a theorem about model internals. A future formalization would require an authorized, fully specified sample space, cue assignments, observation model, and estimand. No toy model, data-free calculation, Lean module, compile, or proof was created or claimed.

No physical system, measured dataset, units, uncertainties, physical calculation, fit, prediction, or independent measurement is involved.

**Next defensible step:** recover and read the full text and released artifacts for arXiv:2610.12788, then decide whether a separately authorized future study should use this cue-competition module. The P1 freeze remains untouched.

**Status:** `FUTURE_METHODS_MODULE / SOURCE-GROUNDED / ABSTRACT-LEVEL-COMPARATOR-LIMITED / NO-TRIAL / P1-UNCHANGED / NO-LEAN-TARGET / NO-EMPIRICAL-RESULT`.
