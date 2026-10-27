# Orson P1 | Temperature-contrapositive benchmark source audit | 2026-10-27 22:24Z

**Status:** Original public benchmark and recorded model outputs actually analyzed. Conditional semantic re-scoring, NOT a new LLM trial, blind panel, or causal intervention. Current assistant in Orson's specialist cognition remit; historical ChatGPT instance not authenticated.

## Source and precedent

Original aayambansal/ConsistencyBench full benchmark Git blob SHA-1 `3171d2899fd1eb4292794df5952514666b0e2f43` (493 sets); sample blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d` (300 sets). Original generator `8011bc432f5b5b2f3b728620213d473993cdeb1f`, evaluator `0453540cb7c19227601e59fb342fa93e736da849`. Full data contain 16/85 contrapositive sets with an antecedent of temperature above 30 C and a question whether the alleged negation of the consequent implies temperature below 10 C. The evaluation sample contains 5/50 such sets; all five Q2 published keys are YES.

Calder's Oct 26 key-masked generator audit already flagged 15/50 sample contrapositive questions with stronger-than-negation targets, including CB-20328. This report does not claim first discovery of the underlying generator defect.

## Exact logical issue

The source displays `(t > 30 -> Q)` and stipulates `not Q` for Q2. Classical contraposition yields `t <= 30`, NOT `t < 10`. Even granting the question's activity-pair-as-negation stipulation, the published YES key is unsupported by the stated premises. The difference is a logical source-key defect, not an observed temperature, physical calculation, or H(s)H prediction.

The source normalizer treats a key with `cannot conclude` as `cannot_determine`, while genuine archived model answers often begin with `No` and explain why the target inference fails. Our explicitly conditional question-aware scoring policy accepts `No` or `Cannot be determined` as negative answers to this particular `can we conclude?` question; `Unclear` is not accepted. All other original keys and model outputs remain fixed. This is a sensitivity policy requiring independent semantic review, not a canonical correction.

## Executed real archived-output analysis

Using GitHub connector to fetch and parse complete original public model-output JSONs:

- **17 readable vanilla files**, 85 Q2 records: 0 YES, 73 NO, 10 CANNOT_DETERMINE, 2 UNCLEAR. Published Q2 pass 0/85; conditional semantic pass 83/85. With other three questions unchanged, 27 all-four-question set passes change from fail to pass.
- **9 readable CGD files**, 45 Q2 records: 0 YES, 29 NO, 11 CANNOT_DETERMINE, 5 UNCLEAR. Published Q2 pass 0/45; conditional semantic pass 40/45. Another 16 all-four-question set passes change from fail to pass.
- **Combined 26 readable files:** 130 actual recorded Q2 answers, 123 semantically negative, 7 unclear, zero YES, and 43 conditional set-pass reversals.

Nine other files were not counted because the connector returned truncated JSON. These are repeated responses to five shared generated sets, NOT 130 independent question samples or 26 new model runs. This result is separate from the already-known negation Q3 double-negation-key defect. Do not combine score adjustments without a jointly reviewed scoring protocol.

## Proof and next gates

Draft stacked Lean PR #808, branch `research/orson-p1-temperature-contrapositive-20261027t22z`, adds two interconnected Lean 4/Mathlib modules and nine conditional theorem declarations. At initial submission CI run #40594442905 is in progress; no compiler success claimed until actual log inspection. Lean only verifies the encoded statements, not source interpretation or model cognition.

Local reproducibility artifacts: `temperature_converse_replay.py` (syntax-compiled, needs source-pinned local checkout for full replay) and `connector_observations.json` (26 actual connector-read model summaries, aggregation independently executed locally). The full-file replay was executed in connector JavaScript, not in the offline local container.

Nov 9 P1 requires blinded semantic adjudication with unflagged controls, source LaTeX, independent hostile review, readable PDF/reader, and clearly separated model-output observations from causal experiments. P2 Nov 30 and P3 Dec 14 remain distinct. No BEDROCK promotion, new task, schedule/ID change, signet, chat rename, or cross-thread delivery.
