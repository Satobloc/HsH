# VEY-028 | Judge-family measurement dependence in LLM-as-judge panels

**Date:** 2026-11-04  
**Status:** targeted full-text external-literature review and published-table arithmetic check. No new model trial, human-subject session, raw-data reproduction, or P1 protocol change.

## Primary source and review extent

Awuni et al., “Who Judges Matters: Measuring Family-Conditioned Preference in LLM-as-Judge Panels,” arXiv:2609.17857v1, submitted 2026-09-15. Primary record: https://arxiv.org/abs/2609.17857

Review route: SciSpace discovery followed by direct inspection of the arXiv HTML, including §§1–11 and Appendices A–D, on 2026-11-04. No new Mersearch request was made because the shared request lanes remained occupied. The paper is an arXiv preprint; no peer-reviewed venue is listed on the primary record. The authors say a reproducibility archive has been prepared for public release, but I did not locate or independently retrieve that archive in this pass.

## What the study actually measures

The study uses four open-weight model families (Llama 3.1, Qwen 2.5, Gemma 2, Yi 1.5), at two scales each, in a fully crossed judge-family × candidate-family pairwise panel. Every judge family evaluates every unordered candidate-family pair in both response orders.

- 9,312 raw trials; 4,656 reconciled judge–prompt–pair observations.
- 16 judge × candidate cells, each with 582 observations.
- 194 retained prompts: 132 exploratory and 62 confirmatory, after six response-health exclusions from the initial 200.
- Three graduate-level NLP annotators labeled 400 blinded items; one was excluded under pre-specified criteria. The two retained annotators reached consensus on 266 items (Cohen’s κ = 0.482).

The paper calls its result **family-conditioned preference**, not ordinary self-preference: no judge evaluates its own exact generations. It measures whether a candidate family receives extra support from a judge of the same family.

The reported global Family Preference Score is 0.067 (95% CI [0.053, 0.084], prompt-level permutation p = 0.0002). All four corrected family lifts are positive, 0.034–0.084. These are results from this particular four-family panel and prompt distribution, not universal constants.

## The identification correction

Let P(j,c) be the mean reconciled support that judge family j gives candidate family c. In the balanced zero-sum design, each judge row has mean 0.5 and sums to 2.00.

The paper writes:

P(j,c) = μ + a_j + b_c + γ_jc,

where a_j is a judge main effect, b_c is a candidate-family main effect, and γ_jc is the judge × candidate interaction. Under the paper’s balanced-row and double-centering constraints, μ = 0.5 and the additive judge main effect is absorbed.

For four families:

- Naive row contrast: R_f = P(f,f) − (1/3) Σ_{c≠f} P(f,c) = (4/3)(b_f + γ_ff).
- Candidate-held-fixed column contrast: C_f = P(f,f) − (1/3) Σ_{j≠f} P(j,f) = (4/3)γ_ff.
- Difference: R_f − C_f = (4/3)b_f.

Thus the row contrast mixes candidate-family strength with the judge–candidate interaction. The column contrast holds candidate family fixed and isolates the diagonal interaction **under the stated balanced additive/double-centered model**. This is not assumption-free identification and does not by itself establish a causal mechanism.

## Independent arithmetic check from the published rounded table

Using only the rounded diagonal-support and other-judge means printed in Figure 2, I recomputed the row contrast from the reported row sum of 2.00 and the column contrast from the rounded means:

| Family | Diagonal support | Other-judge mean | Derived row contrast | Column contrast from rounded means | Paper’s column FPS | Row − column |
|---|---:|---:|---:|---:|---:|---:|
| Llama | 0.542 | 0.509 | 0.0560 | 0.033 | 0.034 | 0.0230 |
| Qwen | 0.620 | 0.544 | 0.1600 | 0.076 | 0.076 | 0.0840 |
| Gemma | 0.543 | 0.459 | 0.0573 | 0.084 | 0.084 | −0.0267 |
| Yi | 0.497 | 0.421 | −0.0040 | 0.076 | 0.076 | −0.0800 |

The row-minus-column values reproduce the paper’s reported prompt-level permutation null means (+0.023, +0.084, −0.026, −0.080) to rounding. Llama’s 0.033 difference from rounded table cells versus the reported 0.034 is consistent with the authors’ warning that averaging rounded cell values creates minor differences. This is a calculation from published summaries, not a raw-data reanalysis or independent reproduction.

## Separate order-instability result

The paper reports 55.4% AB/BA winner reversals. Under its simple independent symmetric content-noise model, R = 2p(1−p) ≤ 0.5, so the observed aggregate rate is 5.4 percentage points above that model’s ceiling. This rejects that simple model as a complete explanation; it does not uniquely identify position bias.

The paper’s pure first-slot model gives R = q² + (1−q)². Using the family-specific reversal rates yields q ≈ 0.879 for Gemma and q ≈ 0.630 for Yi on the q > 0.5 branch. A single homogeneous q should not be inferred for the whole panel: the pooled first-position A-rate of 0.778 would imply 65.46% reversal under a single-q pure-slot model, not the observed 55.4%. This is a heterogeneity/model-scope caution, not a contradiction of the family-specific diagnostic.

## Mechanism and robustness limits

Same-family responses have higher judge-side mean per-token log-probability (−0.69 versus −1.38 for cross-family responses). Adding likelihood advantage reduces the controlled same-family coefficient from 0.299 to 0.116 (61% attenuation). The authors explicitly classify this as descriptive coefficient attenuation, not causal mediation; nonlinear-model non-collapsibility and common causes remain possible.

The paper also reports an independent human-consensus anchor, a float16 judging replication, a 72-specification multiverse, and an 18.5% change in pairwise outcomes under a family-composition comparison. The human anchor is independent of the LLM panel but noisy (κ = 0.482). The main text/Appendix D distinction between the 66-prompt pre-filter full-precision allocation and the 62-prompt post-health-filter analysis could be stated more plainly.

Limitations include four open-weight families, one main inference stack, English open-ended prompts, no verifiable code/math domain, and no full-scale full-precision replication. The 61% attenuation is not a causal share; the position-consistent FPS of 0.211 is a selected-subset sensitivity result, not a corrected estimate.

## Relevance to P1, without changing P1

The frozen P1 archive has 17 model-labelled outputs but one common GPT-4o-mini NLI checker. Its source-audited design includes within-model self-exposure/self-revision, not cross-model peer exposure. It is not a crossed judge-family × candidate-family panel.

Therefore this external study is a **complementary evaluator-provenance comparator**, not a P1 result. The current P1 data cannot estimate a judge-family effect because evaluator-family variation is absent. The new paper supports treating evaluator provenance as part of the measurement system; it does not license a new trial, a peer-deliberation claim, or a revision of the frozen P1 protocol.

P1 issue #564 remains SOURCE / EXPERIMENT READINESS. November 9 remains NOT READY; November 30 P2 and December 14 P3 remain separate gates.

## Formalization triage

A definite conditional theorem is available for Lean formalization: under the paper’s four-family balanced zero-sum matrix assumptions, prove R_f − C_f = (4/3)b_f from the stated decomposition and centering constraints. A separate elementary lemma is R = 2p(1−p) ≤ 1/2 for p ∈ [0,1].

**Lean 4/Mathlib status: NOT RUN / NOT COMPILED.** This runtime has no local lean, lake, or elan binary and no Lean-specific connector. The no-account lean4.dev playground is core-only (no Mathlib); the official Lean Web editor requires JavaScript/browser interaction, and no connected browser context was available. Existing Orson PR #850 is a large, draft, stacked branch; the incoming handoff explicitly preserves existing branch/PR state. No branch, PR, or tool was created or modified. No formal proof is claimed.

## Next discriminating work

1. Preserve P1’s frozen scope and current source/experiment-readiness status.
2. If an authorized Mathlib execution route becomes available, formalize the balanced-matrix identity with every centering assumption explicit; compile and inspect theorem-specific axioms.
3. Treat any future multi-judge study as a separate design: cross judge family with candidate family, balance cells, counterbalance AB/BA, log judge-side likelihood, use an independent quality anchor, and report panel-composition sensitivity.
4. Do not infer family preference, peer influence, or causal mechanism from a single shared evaluator.

**Disposition:** VEY028_EXTERNAL_METHODS_COMPARATOR / P1_SCOPE_PRESERVED / PUBLISHED_SUMMARY_ARITHMETIC_CHECK / LEAN_NOT_RUN / NO_TRIAL / NO_PAPER_GATE_ADVANCEMENT.
