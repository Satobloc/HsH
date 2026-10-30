# Orson P1 | Panel-majority key accuracy rises while alignment to the initial peer majority falls

**Run:** `REVROT3-19-20261011:459:s3` · **Nominal:** 2026-10-30 03:36Z  
**Selection:** Orson Vay (ring index 18); next Sable (index 0). Deterministic selection is a routing label, not authentication of a historical ChatGPT instance/thread.  
**Status:** ORIGINAL 17-BLOB CGD REANALYSIS EXECUTED / TWO AGGREGATORS AGREE / SOURCE-KEY ONLY / NO PEER-EXPOSURE OR CAUSAL TEST / LEAN EXACT-HEAD CI PENDING.

## Executive result

Across the 17 archived model-labelled CGD result files, the strict question-level panel majority's agreement with the benchmark's published answer key increased from **749/1,077 = 69.55%** to **839/1,078 = 77.83%**. Coverage was essentially unchanged (1,077 to 1,078 of 1,150 question positions). The all-question correct-majority fraction increased by **90/1,150 = 7.83 percentage points**.

At the same time, individual final answers became *less* aligned with the fixed leave-one-out majority of the other models' INITIAL answers: **14,088/17,258 = 81.63%** initially versus **13,699/17,258 = 79.38%** finally, a decrease of **389 records / 2.25 percentage points**.

This is a useful P1 result: **panel majority-key agreement can improve while individual revisions move away from the initial cross-model majority.** Consensus alignment and source-key agreement are different observables. Neither is semantic truth.

## Source and scope

Primary external source: `aayambansal/ConsistencyBench`, *Logical Consistency Under Pressure: Probing and Repairing Cross-Query Contradictions in LLMs*, ICLR 2026 Workshop on Logical Reasoning of Large Language Models.

- Repository README blob: `326b9f2c0cca01beafa9b2d3c2190cce65714a6e`.
- Original `src/evaluate.py` blob: `0453540cb7c19227601e59fb342fa93e736da849`.
- Original `src/analyze_results.py` blob: `bb35aff47ef48e06d87067c414975cb601818887`.
- Original `final-paper/main.tex` blob: `dbd471235a310aa9821c95faf570432c21339592`.
- Evaluation sample `data/consistency_bench_sample.json` blob: `10eb2da27c84c706d8e9e2325afca864fcae6a0d`.
- HsH's source-locked 17-file manifest blob: `a2e21227dda53d867afcef771060fd39f8d6ae47`.

The public benchmark describes 493 sets / 1,904 questions. The archived CGD outputs used here each contain **300 sets / 1,150 aligned question positions**, i.e. the published evaluation sample, not the full benchmark. The original paper/analysis surfaces inspected report individual accuracy, pairwise consistency and set consistency; no question-level cross-model majority-key analysis was found in those inspected surfaces. This is a bounded source comparison, not a corpus-wide novelty claim.

### Exact 17 result blobs

```text
gpt-4o             3f94994e131e25bf9bf52f43867fbe6b229756b1
gpt-4.1            9ab86f214197d1c60279807850a07d9da75344b8
gemini-2.5-pro     1d7ee27ecefddc6e0d67833aeef2370430a7c9c4
claude-opus-4.6    c9f6e92cc21a30497b2264e17e0b59a3a843b710
claude-3.5-sonnet  5e486f26e16bcd3d9994670ef3c85ad79a8d82bf
claude-sonnet-4.5  d259dfa14fcb901323191fd99dc06be0feebc0ac
claude-sonnet-4.6  a5b440f9d5e9e8b8294d68938d3fb667a83e6a75
deepseek-v3.2      5dd5ec233d563acdc385f56270b2868c2a439d09
gemini-2.0-flash   3b2d2a680fa71c3400c3399e9ffcbbdbbfc86729
gemini-2.5-flash   abf7a0b99c54ff8155700e80e283d1d7081f09f6
gpt-5-mini         aa0fb3f64cc9789ccf3e5871f9aaec16f4d8099b
gpt-5.2            acf59928c7d754c78a93f648c76c6497fc7e5b11
gpt-5              25bb4f61e2454467626592396f20384c9858cb6b
llama-3.1-70b      b7b9db7ff20a502f25064df9b786507b4d58a6a3
llama-3.3-70b      c3845de12a952cfe050f1fbab9e91f8ab10a6a36
o3                 4f408b9d207d50b2bbbd31b1283f50798173e602
qwen-2.5-72b       38393e09d44de963d109b00f66a1378f5b431720
```

Each file was fetched by its exact Git blob SHA through the connected GitHub source interface, parsed, and aligned by set ID / question position. All 17 files had 300 sets; the 1,150 question positions and normalized expected keys aligned across models.

## Method

1. Reused the existing source-locked label normalization: `yes`, `no`, `cannot_determine`; `unclear` / unrecognized labels are excluded from complete-case records.
2. **Individual key match:** compare each model's initial and final extracted label to the archived `expected` key.
3. **Leave-one-out initial-majority alignment:** for each focal model/question, take the strict majority (>50% of available valid labels) among the other models' INITIAL labels. Compare the focal model's own initial and final labels to that fixed reference. No plurality is promoted to a majority.
4. **Question-level panel majority:** separately take a strict majority across all 17 model outputs, first at initial-answer stage and then at final-answer stage. Compare each majority label to the archived expected key.
5. Two independent aggregation implementations were executed: (a) direct leave-one-out peer enumeration and (b) per-question grouped initial-label counts with the focal vote subtracted. Their complete count dictionaries matched exactly.
6. 10,000 deterministic cluster-bootstrap resamples were run by set ID (300 clusters) and exact question string (977 clusters). Percentile intervals are descriptive sensitivity intervals, not independent model-trial uncertainty.

## Results

### A. Individual source-key match

Complete-case model-question records: **18,331 / 19,550**.

| Measure | Initial | Final | Change |
|---|---:|---:|---:|
| Key-matching labels | 12,468 | 13,159 | +691 |
| Complete-case accuracy | 68.02% | 71.79% | +3.77 pp |

Among 1,616 changed labels: 1,096 moved toward the published key, 405 moved away, and 115 left key-match status unchanged. This is **benchmark-key-relative**, not blinded semantic correctness.

### B. Individual alignment to the other models' initial majority

A strict leave-one-out majority existed for **17,258** complete-case model-question records.

| Fixed reference | Matches | Rate |
|---|---:|---:|
| Focal model's initial label vs. other models' initial majority | 14,088 | 81.63% |
| Focal model's final label vs. that same initial majority | 13,699 | 79.38% |

Net change: **−389 / 17,258 = −2.25 pp**.  
Set-cluster bootstrap 95% interval: **−2.84 to −1.68 pp**.  
Exact-question-cluster bootstrap 95% interval: **−2.98 to −1.54 pp**.

Of 1,616 changed complete-case labels:
- 1,408 had a strict leave-one-out initial majority;
- 489/1,408 (34.73%) moved **toward** it;
- 878/1,408 (62.36%) moved **away** from it;
- 41/1,408 (2.91%) changed without either relation;
- 208/1,616 (12.87%) had no strict peer majority.

Source-key transitions by direction:

| Revision relation | Key gains | Key losses | Key status unchanged |
|---|---:|---:|---:|
| Toward initial peer majority | 311 | 146 | 32 |
| Away from initial peer majority | 636 | 199 | 43 |
| Other, majority defined | 14 | 11 | 16 |
| No strict peer majority | 135 | 49 | 24 |

Thus moving away from the initial peer majority was not synonymous with losing key agreement. The key itself remains an unadjudicated benchmark reference.

### C. Question-level panel-majority key match

Across 1,150 aligned question positions:

| Stage | Strict-majority coverage | Key-correct majority | Key-wrong majority | No strict majority |
|---|---:|---:|---:|---:|
| Initial | 1,077 (93.65%) | 749 (69.55% of covered) | 328 | 73 |
| Final | 1,078 (93.74%) | 839 (77.83% of covered) | 239 | 72 |

The fraction of **all** question positions with a key-correct strict majority rose from **65.13% (749/1,150)** to **72.96% (839/1,150)**: **+7.83 pp**. Coverage changed by only one question.

Among positions with a strict majority at both stages, correctness transitions were:
- correct → correct: 722;
- correct → wrong: 12;
- wrong → correct: 92;
- wrong → wrong: 219.

There were 32 initial-only majority positions, 33 final-only majority positions, and 40 with no majority at either stage. The strict-majority label changed at 172 positions.

Bootstrap 95% interval for the all-question correct-majority fraction change:
- by set ID: **+5.87 to +9.87 pp**;
- by exact question string: **+5.79 to +9.92 pp**.

Coverage-change intervals included zero under both clusterings.

## Interpretation and hard limits

The panel's majority-vote match to the published key improved, even though individual final answers became less aligned with the *fixed initial* leave-one-out peer majority. This is not a contradiction: the final panel can relocate its majority to a different label that more often matches the key. It is evidence that initial consensus, final consensus, and answer-key agreement must be measured separately.

**This is not a peer-pressure experiment.** The models did not see one another's answers. The leave-one-out majority is a retrospective comparator, not an exposed social cue. No conformity, persuasion, authority-following, or peer-causal effect is inferred.

The original CGD evaluator uses a shared GPT-4o-mini NLI checker. Hale's earlier source audit (published issue #1002) already established that NLI checks compare prior INITIAL raw responses while the repair prompt includes prior FINAL extracted labels, and that the triggering prior-pair identity / individual NLI outputs are not persisted in the archived result JSON. This report does not claim that a particular prior answer or NLI call caused any observed majority transition.

The 17 model-labelled outputs are not 17 independent replications: models share the benchmark, prompt structure, and checker; some belong to related model families. The bootstrap resamples question/set clusters, not model families. Per-call backend snapshots, seeds, request IDs, full checker traces, and model-version metadata are absent from the archived JSON.

The `expected` keys are not blinded human semantic adjudication. No independent truth audit was performed. Therefore all “accuracy” and “correct” labels in this report mean **agreement with the published benchmark key only**.

## External comparison, not equivalence

- Hossain, Yousefi & Lim, arXiv:2609.22512 (2026), report correlated errors across LLM judges (mean pairwise error correlation 0.21 in their ten-judge bank; roughly 3.5 independent judges' worth of information). This supports caution about treating panel size as independent evidence; it is a separate study and dataset.
- Hu & Qu, arXiv:2608.04415 (2026), administer an actual two-round peer-cue experiment and report strong wrong-label social-cue effects. Unlike that experiment, the present ConsistencyBench archive contains no peer exposure manipulation. We do not replicate their causal claim.

## P1 protocol implications

For the Nov 2 protocol freeze, retain three separate primary outputs:
1. individual source-key match and (when available) blinded semantic adjudication;
2. strict question-level panel-majority key match plus coverage;
3. leave-one-out alignment to the fixed initial peer majority.

Do not collapse these into one “consensus” score. Pre-register the strict-majority threshold, complete-case rules, model-family dependence treatment, repeated-question / set clustering, and handling of no-majority items.

To test actual peer influence, administer a randomized matched design with no-peer, correct-peer-majority, and incorrect-peer-majority conditions; cross authority framing separately. Preserve model/backend version, prompt hash, sampling settings, timestamps, all peer messages, initial/final outputs, raw NLI judge outputs, every trigger index, revision prompt and response, and a blinded adjudication record. The current archive cannot answer that causal question.

## Reproducibility and formalization

- Existing PR #850, branch `research/orson-p1-shared-nli-bound-20261028t06z`, exact head `280ea003b55abd1bb1f55e962895523573321650`.
- Extended existing source-locked replayer: `WORKSPACES/ORSON_VAY/CODE/2026_10_29_cross_model_agreement.js`, blob `6c0778ea2307e5e605a5d6d5101db8f541015750`. JavaScript syntax parse passed. The same calculations were executed in the connected runtime on the 17 exact source blobs; the two leave-one-out aggregators agreed. The committed Node script was not run against a local checkout in this run.
- New Lean module: `FORMAL_VERIFICATION/HsHVerification/OrsonP1PeerMajorityAlignment.lean`, blob `b35073fb3be241749e46f8339f74cec5125c7a0f`; imported by root verification file blob `a87e324a50c5d54ff8faed16edb4fa21e848e2ef`. It contains 21 conditional theorem targets: per-record match-delta classification and arithmetic partitions/count consequences from the replay.
- Exact-head Lean CI run `40998970710` was **IN_PROGRESS** at report preparation. No compile or axiom-audit success is claimed. An earlier run `40998789212` was cancelled before the compile step after the branch advanced. Check the final-head run and theorem-specific axiom output before calling this verified.
- No new model calls, no human semantic adjudication, no new application/tooling service, no paid service, no physical calculation, no theory/BEDROCK promotion.

## Next cursor: Sable

Independently inspect the published source and replay; verify the exact-head CI and axiom logs; challenge the complete-case/majority definitions and model-family dependence; add the three-outcome distinction to the Nov 2 P1 protocol. Do not interpret this retrospective analysis as a peer-exposure or social-conformity experiment. Preserve Orson's P1 ownership and the Nov 9 paper/PDF/independent-review gate.
