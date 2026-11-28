# Self-consistency is not a sufficient correctness label: exact-score fiber audit

**Run:** `REVROT3-19-20261011:1166:s2` (nominal slot 2026-11-28 14:24 UTC)  
**Routing label:** Orson Vay (ring index 18); next label Sable (index 0)  
**Disposition:** `COGNITION_SOURCE_AUDIT_COMPLETE / PUBLIC_DATA_POINT_ESTIMATES_REPRODUCED / SAME_CASE_SCORE_FIBER_COUNTEREXAMPLE_FOUND / EXISTING_LEAN_CRITERION_VERIFIED / P1_FROZEN_UNMODIFIED`.

**Attribution:** This is an assistant-authored, source-grounded reconstruction under the Orson Vay routing label. No authenticated historical Orson thread is established. It is not a Nathan Direct statement, not an administered HsH LLM trial, and not a physical measurement.

## 1. Scope

This audit separates three constructs that are often collapsed under the word "consistency":

1. **Generator-evaluator self-consistency:** one model applies a concept similarly when generating and later evaluating an output.
2. **Repeated-sample self-consistency:** a model's stochastic samples for one case converge on the same answer.
3. **Cross-judge error dependence:** different evaluators make correlated errors, reducing the independent information in a judge panel.

The first two are new external-literature comparators in this note. The third, including Kohli et al.'s "Nine Judges, Two Effective Votes," is already represented in the frozen P1 prior-art work and is not repeated here.

## 2. Primary sources and provenance

### 2.1 Ding (2026), arXiv:2607.08065v2

Kaihua Ding, *When LLMs Agree, Are They Right? Auditing Self-Consistency and Cross-Model Agreement as Confidence Signals*, arXiv:2607.08065v2, version dated 2026-07-28:  
https://arxiv.org/abs/2607.08065

The paper reports a 53-runner, 5,300-row secondary analysis over 394 unique GPQA Diamond and AIME cases, with K=50 samples per case-result row (265,000 samples). The runners were members of a graduate-level computer-science cohort. The paper explicitly says they shared a course context and may have exchanged code or discussion; submissions are not guaranteed statistically independent. The main comparisons use the GPT-4.1 family: model tier, zero-shot versus chain-of-thought prompting, and mini versus GPT-4.1 frontier scale. The three-Claude cross-family check is exploratory, uses K=10, and is not part of the released main CSV.

Released data:
https://github.com/dingkaihua/self_consistency_as_predictor_of_accuracy

- Repository main commit: `daa16cf0da38d6a4acb4cc30400959ba9bb41d01`
- File: `data/case_results_deid.csv`
- Git blob: `4000f9cbb98a9d8ff0dab016e77f993fb72845f5`
- README blob: `6564a66efb77048213d3fa356fcfa7bf24703d9d`
- License: CC BY 4.0
- Retrieved CSV: 5,300 data rows, 24 columns; 53 distinct anonymized runner IDs; 394 distinct case IDs; zero rows failed the published `axis_ok` or `meta_ok` flags.

The CSV omits GPQA question text and raw model responses. It contains anonymized runner/case identifiers, answer distributions, model/prompt labels, K, C, A, and majority-correctness M. The paper states exact model snapshots and run timestamps were not logged and are unrecoverable.

### 2.2 Mancoridis and Hitzig (2026), ICML

Marina Mancoridis and Zoe Hitzig, *The Consistency Dilemma in LLMs: Generator-Evaluator Agreement and Vulnerability to Mistakes*, Proceedings of the 43rd International Conference on Machine Learning, PMLR 306:86097-86142 (2026):  
https://proceedings.mlr.press/v306/mancoridis26a.html

The paper studies 10 frontier models across 491 concepts and 3,951 evaluation instances. Its clinical analysis uses 440 model-concept observations with physician-validated mistakes. The reproduction repository linked from the PMLR page uses the working title "The Consistency Trap in LLMs" in its README; this is recorded as a title-label discrepancy, not treated as a separate paper. The repository describes main-paper reproduction scripts and raw response JSONs; no reproduction script was run in this activation.

## 3. Independent point-estimate reproduction of Ding's released CSV

Definitions in the paper/data:
- `C = n_majority / K`: fraction of the K samples selecting the modal answer.
- `A`: per-sample accuracy.
- `M`: indicator that the modal/majority answer matches the supplied ground truth.

I parsed the released CSV and independently recomputed Spearman rho(C,M) for all 12 axis-condition-benchmark cells. All 12 point estimates reproduce the paper's Table 1 to its two-decimal reporting precision:

| Axis / condition | GPQA Diamond rho(C,M) | AIME rho(C,M) |
|---|---:|---:|
| A / GPT-4.1-nano | 0.2055 | 0.4665 |
| A / GPT-4.1-mini | 0.2997 | 0.5922 |
| B / mini zero-shot | 0.2571 | 0.5470 |
| B / mini chain-of-thought | 0.3801 | 0.5785 |
| C / GPT-4.1-mini | 0.3477 | 0.5171 |
| C / GPT-4.1 | 0.1992 | 0.3087 |

For the frontier GPT-4.1 / GPQA cell: n=450, mean C=0.8906, majority accuracy=0.48, and rho=0.1992. Of 347 rows with C>=0.80, 167 are majority-wrong: 48.13%. This reproduces the paper's rounded 77%-high-consistency / 48%-wrong description.

The paper's confidence intervals use a hierarchical runner-clustered bootstrap with 2,000 resamples and additional case-clustered checks. I did not recalculate those intervals; the point-estimate reproduction is not a new inferential analysis.

## 4. New exact-score fiber audit

A stronger finite-sample check asks whether correctness is constant when the case and all reported deployment descriptors are held fixed.

For the GPT-4.1 / zero-shot / GPQA cell, I grouped by `(case_id, model, prompt, K, exact C)`. Seven of 327 such fibers contain both M=0 and M=1, spanning seven cases and 19 of the 450 rows. The same phenomenon occurs in every one of the 12 axis-condition-benchmark cells:

| Axis / condition | GPQA mixed fibers | AIME mixed fibers |
|---|---:|---:|
| A / GPT-4.1-nano | 3 | 7 |
| A / GPT-4.1-mini | 8 | 3 |
| B / mini zero-shot | 11 | 7 |
| B / mini chain-of-thought | 6 | 4 |
| C / GPT-4.1-mini | 2 | 3 |
| C / GPT-4.1 | 7 | 1 |

For the frontier GPT-4.1 / GPQA cell, using C alone across cases gives 25 mixed correctness fibers among 32 exact C values, covering 430 of 450 rows. The case-conditioned result above is more stringent because it holds case, model, prompt, and K fixed as well as C.

One directly inspectable witness is `gpqa_d_113`:

| Anonymous runner | Model | Prompt | K | C | Majority answer | Ground truth | A | M |
|---|---|---|---:|---:|---|---|---:|---|
| S004 | gpt-4.1 | zero_shot | 50 | 1.00 | D | B | 0.00 | false |
| S017 | gpt-4.1 | zero_shot | 50 | 1.00 | B | B | 1.00 | true |
| S023 | gpt-4.1 | zero_shot | 50 | 1.00 | D | B | 0.00 | false |

Thus, for the same case, model label, prompt class, sample count, and exact self-consistency score, different runner submissions have opposite majority-correctness labels. C=1.00 means all 50 samples agreed within each run; it does not mean the agreed answer was true.

This is a finite counterexample in the released dataset, not a population estimate. Runner IDs are anonymized human submitters, not independent model identities. The paper explicitly cautions that shared course context and possible code/discussion exchange prevent treating the runners as guaranteed independent replications.

## 5. Formal criterion and existing Lean verification

Let X be the set of observed run records, let `piI : X -> Y` be the information available to a deterministic resolver, and let `piJ : X -> Z` be the target correctness label. A deterministic map `H : range(piI) -> Z` satisfying `H(piI(x)) = piJ(x)` for every x exists if and only if the target is constant on every fiber of the observed view:

`piI(x1) = piI(x2) -> piJ(x1) = piJ(x2)`.

For this audit, `piI` can be instantiated as `(case_id, model, prompt, K, C)` and `piJ` as M. The S004/S017 pair violates the fiber condition. Therefore no deterministic resolver using only those fields can be perfectly correct on all released observations.

This exact conditional theorem already exists in Kestrel's `KestrelProjectedIncidence.lean` as `hallway_factorization_iff_fiber_compatibility`:
https://github.com/Satobloc/HsH/blob/94b6d96c91806a95505260a3c52220f4af294185/FORMAL_VERIFICATION/HsHVerification/KestrelProjectedIncidence.lean

Exact PR-head Lean verification:
https://github.com/Satobloc/HsH/actions/runs/44090154878

- PR #873 head: `94b6d96c91806a95505260a3c52220f4af294185`
- Exact PR-head checkout assertion: PASS
- Lean 4.34.0 / Lake 5.0.0
- Formal library build: SUCCESS
- Theorem-specific `#print axioms`: `Classical.choice`
- The separate uniqueness theorem reports `Quot.sound`
- No `sorryAx` appears in the theorem-specific output; the global axiom audit was skipped.

No new Lean module was added because the existing generic theorem already formalizes the exact factorization criterion. The empirical CSV witness was not encoded in Lean. The Lean theorem proves only the conditional mathematical statement; it does not validate the CSV, model snapshots, ground-truth labels, or independence assumptions.

## 6. Crosswalk: why the two papers are not interchangeable

Mancoridis and Hitzig's generator-evaluator self-consistency is a concept-level agreement measure between a model's generation and evaluation behavior. They report a positive association between model-level self-consistency and clinical mistake vulnerability. However, their model fixed-effect estimate is not significant (reported beta=0.147, SE=0.334, p=0.66). The positive association is therefore a between-model result, not evidence that within a given model, more self-consistent concepts are more error-prone, and not a causal effect.

Ding's C is instead repeated-sample agreement for one case. It is weak-to-moderately associated with majority correctness in the released benchmark data, but it fails as a deterministic correctness label on observed exact-score fibers and is especially weak for the frontier GPT-4.1 GPQA cell.

Neither construct is the same as cross-judge error covariance or panel effective sample size. A future literature synthesis should retain separate names and units of analysis:
- generator-evaluator concept consistency;
- within-model repeated-sample agreement;
- cross-judge error dependence.

## 7. Scope, limitations, and P1 boundary

- This is an external literature/data audit, not an administered HsH LLM trial.
- No model API calls, human sessions, new experiments, or new P1 data collection occurred.
- No new dataset was added to the frozen P1 study; no changes were made to P1 issue #564, PR #850, its protocol, or manuscript.
- No paper gate advanced. P1 remains source/methods readiness, not an approved completed manuscript; P2 (Nov 30) and P3 (Dec 14) remain separate gates.
- No physical system, CODATA comparison, H(s)H calculation, SAT-O/Blockwave equation, or theory promotion was attempted.
- No private HSH_RESOURCES payload was accessed.
- The exact model snapshots and timestamps in Ding's released course dataset are missing; the cross-family Claude check is exploratory and not used in the reproduction.
- The source's ground truth and item ambiguity are inherited; the exact-score audit does not independently adjudicate questions.
- No bootstrap confidence intervals were recalculated.

## 8. Return cursor

Keep this note separate from the frozen P1 dataset and manuscript. If P1 is later reopened, use these papers as distinct external comparators and require an actual source-bounded HsH trial or an explicitly limited methods paper. Do not treat runner count as independent model count, self-consistency as truth, or a compiled factorization theorem as empirical validation.
