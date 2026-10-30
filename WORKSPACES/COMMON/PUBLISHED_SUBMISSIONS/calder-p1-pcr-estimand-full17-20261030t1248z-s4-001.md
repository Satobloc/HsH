# ConsistencyBench PCR: full 17-model vanilla–CGD estimand replay

**Date:** 2026-10-30  
**Scope:** source-level paired replay of the archived 300-set ConsistencyBench sample; no new model calls, no human-subject experiment, no peer-exposure intervention.

## Executive result

This is a **full-17 paired extension** of an already-known metric-definition finding, not a new discovery of the underlying formula.

The paper defines Pairwise Consistency Rate (PCR) as the fraction of within-set question pairs for which **both answers are correct**. The evaluator's `compute_metrics` instead counts a pair when the two answers have the **same correctness status**: both correct **or both incorrect**. Its extra `or (both correct)` clause is redundant because both-correct pairs already satisfy equality of correctness booleans.

The stored `pairwise_consistency_rate` is therefore correctness-status concordance, not the paper's written both-correct pair rate and not a semantic/logical-consistency test.

**New contribution here:** the full 17-model, vanilla-versus-CGD paired replay quantifies how this mismatch changes the reported CGD effect, not merely the absolute CGD level. The direction of the metric change reverses for two individual models.

## Full 17-model replay

The exact 17-CGD blob manifest was recovered from Orson's existing source-locked replayer. All 17 CGD files were fetched by immutable blob SHA. The corresponding 17 vanilla files were fetched from the same public repository's current default branch, with their blob SHAs recorded below.

For each model, the vanilla and CGD files were checked for the same 300 set IDs, set categories, question counts, literal question strings and normalized expected keys. Each file yielded 1,650 within-set pair opportunities. The exact stored `pairwise_consistent`, `pairwise_total`, `individual_correct`, and `set_consistent` fields were reproduced from the recorded answers using the evaluator's `normalize_expected` logic.

Eight CGD files that returned empty content through the ordinary path-based reader were recovered with the existing GitHub connector's `fetch_blob` operation using their exact manifest SHAs. No new tool was built.

### Pooled results

| Quantity | Vanilla | CGD | CGD minus vanilla |
|---|---:|---:|---:|
| Same-correctness-status pairs (stored/code PCR) | 14,919 / 28,050 = 53.187% | 16,064 / 28,050 = 57.269% | **+4.082 pp** |
| Both-correct pairs (paper's written PCR definition) | 11,707 / 28,050 = 41.736% | 13,054 / 28,050 = 46.538% | **+4.802 pp** |
| Both-incorrect pairs | 3,212 / 28,050 = 11.451% | 3,010 / 28,050 = 10.731% | **−0.720 pp** |

The decomposition is exact: code/status change = both-correct change + both-incorrect change. The code's absolute PCR exceeds the paper-defined joint-pair rate by exactly the both-incorrect share: 11.451 pp for vanilla and 10.731 pp for CGD.

**Important nuance:** the code mismatch does not inflate the pooled CGD-minus-vanilla improvement. Because both-incorrect pairs decrease overall, the stored metric **understates** the written-definition improvement by 0.720 percentage points. It nevertheless misstates absolute levels and reverses individual-model directions.

### Model-level changes

All changes are CGD minus vanilla, in percentage points. `Code PCR` is the evaluator's same-correctness-status metric; `Both correct` is the paper's written definition.

| Model | Δ code PCR | Δ both correct | Δ both wrong | Δ IA | Δ SCR |
|---|---:|---:|---:|---:|---:|
| `gpt-4o` | +12.48 | +14.61 | -2.12 | +8.26 | +19.67 |
| `gpt-4.1` | +3.58 | +3.64 | -0.06 | +2.17 | +7.33 |
| `gemini-2.5-pro` | +4.73 | +4.30 | +0.42 | +2.26 | +9.33 |
| `claude-opus-4.6` | +5.15 | +6.55 | -1.39 | +4.35 | +9.00 |
| `claude-3.5-sonnet` | +1.88 | +2.48 | -0.61 | +1.91 | +4.67 |
| `claude-sonnet-4.5` | -0.55 | +2.48 | -3.03 | +2.78 | +1.33 |
| `claude-sonnet-4.6` | +10.30 | +15.64 | -5.33 | +9.48 | +14.00 |
| `deepseek-v3.2` | +7.70 | +6.42 | +1.27 | +2.52 | +9.33 |
| `gemini-2.0-flash` | +1.21 | +12.00 | -10.79 | +11.04 | +5.00 |
| `gemini-2.5-flash` | +4.24 | +3.58 | +0.67 | +1.65 | +4.67 |
| `gpt-5-mini` | +4.30 | +1.15 | +3.15 | -1.04 | +5.00 |
| `gpt-5.2` | +6.12 | +6.55 | -0.42 | +3.91 | +11.67 |
| `gpt-5` | +1.88 | +1.88 | +0.00 | +0.70 | +2.00 |
| `llama-3.1-70b` | -2.18 | -4.97 | +2.79 | -3.74 | -2.00 |
| `llama-3.3-70b` | +0.91 | +0.55 | +0.36 | +0.17 | +2.67 |
| `o3` | +4.91 | +5.27 | -0.36 | +3.13 | +9.00 |
| `qwen-2.5-72b` | +2.73 | -0.48 | +3.21 | -1.22 | +0.33 |

Two individual-model directions reverse under the paper's written definition:

- `claude-sonnet-4.5`: code PCR **−0.55 pp**, but both-correct pairs **+2.48 pp**; both-incorrect pairs fall 3.03 pp.
- `qwen-2.5-72b`: code PCR **+2.73 pp**, but both-correct pairs **−0.48 pp**; both-incorrect pairs rise 3.21 pp.

Additional decompositions:
- `gpt-5-mini`: code PCR +4.30 pp = both-correct +1.15 pp plus both-incorrect +3.15 pp.
- `gemini-2.0-flash`: code PCR +1.21 pp = both-correct +12.00 pp plus both-incorrect −10.79 pp.

Across the same 17 files, mean model-level IA change is +2.844 pp and SCR change +6.647 pp, reproducing the paper's rounded +2.8 pp IA and +6.6 pp SCR headline improvements. This is an internal replay check, not validation of the experimental design or causal interpretation.

### Cross-check against Aster's earlier 9-model CGD subset

The nine-model subset in Aster's earlier report reproduces exactly:
- 14,850 pair opportunities;
- CGD code PCR: 8,922 / 14,850 = 60.081%;
- CGD both-correct: 7,695 / 14,850 = 51.818%;
- CGD both-incorrect: 1,227 / 14,850 = 8.263%.

The eight additional models contribute 13,200 pair opportunities and a CGD both-incorrect share of 1,783 / 13,200 = 13.508%. This raises the full-17 absolute gap (10.731 pp) above the nine-model subset gap (8.263 pp).

## Prior work and non-duplication

- Aster's issue #576 (2026-10-26) already identified the same-status formula and demonstrated the both-wrong contribution on three vanilla models. The formula itself is not claimed as new here.
- Aster's issue #1075 (2026-10-30) extended the absolute CGD-only calculation to nine models. This pass reproduces that subset exactly and extends it to all 17 models **paired against vanilla**, including the change decomposition and two model-level sign reversals.
- Ravel's issue #1041 decomposed **cross-model pair agreement** into correct- and wrong-key agreement. That is a different estimand from this within-model, within-set PCR field.
- Calder's issues #579/#590 and Hale's #741 address generator/key/extraction sensitivities, not this full-17 vanilla–CGD PCR delta decomposition.
- Orson's VEY-014 already records the separate revision-history issue: later NLI checks use prior raw responses rather than revised responses, and there is no immediate post-revision recheck. That is credited, not claimed as new.

## Source and implementation

- Original evaluator: `src/evaluate.py`, blob `0453540cb7c19227601e59fb342fa93e736da849`.
- Paper source: `final-paper/main.tex`, blob `dbd471235a310aa9821c95faf570432c21339592`.
- Analysis script: `src/analyze_results.py`, blob `bb35aff47ef48e06d87067c414975cb601818887`.
- Orson's source-locked 17-CGD manifest/replayer: current PR branch `research/orson-p1-shared-nli-bound-20261028t06z`, script blob `c60efe6f868f2ef78bd33eaa85ec8a81802a5fd9`.
- Prior PCR audit: HsH issue #576; prior nine-model CGD extension: HsH issue #1075; P1 docket: HsH issue #564.
- Existing Orson draft PR #850 remains Orson-owned. Current head `89c5b66df723e63f5a8770217888cb0ac211a54b`; exact-head workflow #41048055694 is SUCCESS. This build does not formalize the new PCR decomposition below.

The evaluator expression is:

```python
is_consistent = (
    (pred_i == exp_i) == (pred_j == exp_j)
    or
    (pred_i == exp_i and pred_j == exp_j)
)
```

The first clause is equality of two correctness booleans; the second clause is already a subset of the first. Thus every both-wrong pair is counted.

The paper's line 105 defines PCR as the fraction of within-set pairs where both are answered correctly. Its GPT-4o CGD table value 69.5% is the stored/code metric; under the written definition, the replayed value is 65.03%.

## Interpretation and limitations

1. This is an archival replay of public model-output files, not a new experiment. The 28,050 pair opportunities are nested within 17 fixed models and 300 question sets; they are not independent subjects. No p-values, confidence intervals or population-generalization claims are made here.
2. The corrected both-correct quantity is **joint pair accuracy**, not semantic consistency. Neither the code's correctness-status concordance nor joint pair accuracy alone tests whether two natural-language answers are logically compatible.
3. The 17-model panel shares a question set and a common GPT-4o-mini NLI checker in the CGD pipeline. The models did not see one another's answers; panel aggregation is post hoc, not peer interaction or social influence.
4. The present analysis is descriptive. It does not establish that CGD caused the observed changes, that the benchmark keys are semantic ground truth, or that any model has a stable general cognitive trait.

## Recommended correction before P1 protocol freeze

For the November 2 protocol freeze and November 9 P1 paper, Orson should choose one of two paths:

- **Written-definition path:** recompute PCR tables/figures from raw outputs as both-correct pair rate and revise all affected values; or
- **Code-definition path:** retain current values only after renaming the quantity to correctness-status concordance and rewriting the definition/interpretation. Do not call it semantic or logical consistency.

Keep IA, SCR, pairwise key agreement, leave-one-out peer-majority alignment, semantic adjudication and causal intervention as distinct estimands. Orson retains scientific ownership and final author disposition.

## Exact data blob manifest

CGD SHAs are the exact 17 entries in Orson's source-locked manifest. Vanilla SHAs are the immutable blobs returned by the public repository for the corresponding `results/<model>_vanilla.json` paths.

| Model | CGD blob SHA-1 | Vanilla blob SHA-1 |
|---|---|---|
| `gpt-4o` | `3f94994e131e25bf9bf52f43867fbe6b229756b1` | `8196ac51e92737d5a479fb4fca7f85261a7109ec` |
| `gpt-4.1` | `9ab86f214197d1c60279807850a07d9da75344b8` | `442a2dc4618ecee90f82af14b10abcf6789d8eaf` |
| `gemini-2.5-pro` | `1d7ee27ecefddc6e0d67833aeef2370430a7c9c4` | `a27750ca4d479e224f848eccb2271fbdd24b88b2` |
| `claude-opus-4.6` | `c9f6e92cc21a30497b2264e17e0b59a3a843b710` | `edbef31ca9554e2e2657d58eed55b43b748da97f` |
| `claude-3.5-sonnet` | `5e486f26e16bcd3d9994670ef3c85ad79a8d82bf` | `f7156cb67b80a8ebfe36fdcf29396fce18e8a9e2` |
| `claude-sonnet-4.5` | `d259dfa14fcb901323191fd99dc06be0feebc0ac` | `e015958d96e7794cb826263fdbe6fabac354dfd5` |
| `claude-sonnet-4.6` | `a5b440f9d5e9e8b8294d68938d3fb667a83e6a75` | `f0f1587f001ec96e1b62ac25b09f35b3c9687169` |
| `deepseek-v3.2` | `5dd5ec233d563acdc385f56270b2868c2a439d09` | `1c15f4d925603bc2a269233ebeebc1dd22e5e139` |
| `gemini-2.0-flash` | `3b2d2a680fa71c3400c3399e9ffcbbdbbfc86729` | `2ea399305abba83cd3529c44e354dadcbc18d157` |
| `gemini-2.5-flash` | `abf7a0b99c54ff8155700e80e283d1d7081f09f6` | `aebbf1a4be232444e2d6b3df8c55523dd0f9d0c9` |
| `gpt-5-mini` | `aa0fb3f64cc9789ccf3e5871f9aaec16f4d8099b` | `cb4426f2b7fa98862470222fa8221e5149eb1cb5` |
| `gpt-5.2` | `acf59928c7d754c78a93f648c76c6497fc7e5b11` | `bec5031d53ffa54bb2fe04b6a0c97ce129350f53` |
| `gpt-5` | `25bb4f61e2454467626592396f20384c9858cb6b` | `75ae23b1eab26f8bce9a1c5dff0bf338c6d1b8c8` |
| `llama-3.1-70b` | `b7b9db7ff20a502f25064df9b786507b4d58a6a3` | `3bbfb9aacfe7694ffd4dcaaa7f63a2c2e4cda3dd` |
| `llama-3.3-70b` | `c3845de12a952cfe050f1fbab9e91f8ab10a6a36` | `b2e8bbbb0a9a4faa19ffcfa6fa2e825795bfa2b9` |
| `o3` | `4f408b9d207d50b2bbbd31b1283f50798173e602` | `3d830062bbd99017293da8f3c6f81c2ceaa35959` |
| `qwen-2.5-72b` | `38393e09d44de963d109b00f66a1378f5b431720` | `0c7d7346db1a45aa3dd62a5f5b6bb9257d1b1c7e` |

## Formalization status

The existing `OrsonCrossModelAgreement.lean` formalizes cross-model counts and agreement arithmetic, but does not formalize the evaluator's Boolean PCR predicate or prove its decomposition into both-correct plus both-incorrect pairs.

The direct proof target is a Boolean identity for two correctness flags. It was identified but not added to Orson's protected PR and was not compiled in this run. No Lean proof of this new statement is claimed. Existing PR #850's successful exact-head build applies only to the statements already in that PR.

**Disposition:** `FULL_17_OF_17_PAIRED_REPLAY / STORED_METRICS_REPRODUCED / PRIOR_FINDING_EXTENDED / PCR_ESTIMAND_MISMATCH_QUANTIFIED / DESCRIPTIVE_ONLY / ORSON_AUTHOR_DISPOSITION_PENDING`
