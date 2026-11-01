# ConsistencyBench CGD | NLI context and intervention-trace audit

**Scope:** source-level review of the public paper, evaluator, benchmark bank, and archived model outputs. No new model calls or human-subject experiment.  
**Disposition:** `PAPER-CODE_NLI_CONTEXT_MISMATCH / ARCHIVED_FALSE_POSITIVE_REPAIR_PATH / JUDGE_TRACE_ABSENT / LEAN_NOT_RUN`

## 1. Immutable source set

- Evaluator `src/evaluate.py`, blob `0453540cb7c19227601e59fb342fa93e736da849`.
- Paper `final-paper/main.tex`, blob `dbd471235a310aa9821c95faf570432c21339592`.
- Full bank `data/consistency_bench.json`, blob `3171d2899fd1eb4292794df5952514666b0e2f43`.
- 300-set sample `data/consistency_bench_sample.json`, blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d`.
- GPT-4o CGD result, blob `3f94994e131e25bf9bf52f43867fbe6b229756b1`.

The GPT-4o result identifies target route `openrouter/openai/gpt-4o-2024-11-20`, 300 sets and 1,150 question records. It does not bind itself to an evaluator commit, judge revision, prompt hash, provider request ID, or raw NLI transcript. Exact execution-time code/config linkage is unestablished.

## 2. Paper-to-code NLI mismatch

The paper Appendix's NLI prompt supplies the shared premise and both question→answer pairs, and asks whether they contradict given that premise. Its labels are `CONTRADICTION` / `NO CONTRADICTION`.

The recovered implementation differs:

1. `evaluate_cgd` passes only the previous raw response and current raw response to the NLI checker. The questions and shared premise are not passed.
2. The implementation prompt contains only two response-text fields.
3. The code asks for `CONTRADICTORY` / `CONSISTENT`, not the Appendix labels.
4. The parser returns true if the substring `CONTRADICTORY` appears anywhere, rather than validating an exact enum.
5. The checker hardcodes `openrouter/openai/gpt-4o-mini`; its `model_id` argument does not select the judge.
6. Result records store `contradiction_detected` and `revision_response`, but not the raw judge response, selected prior question/answer, judge configuration, or prompt hashes.

The paper's main algorithm also depicts a checker operating on answers, while its Appendix adds question/premise context. The code follows the context-free version. Because archived outputs do not bind to an exact source commit/config, this is a documented source/version discrepancy, not proof of which prompt generated every historical result.

A source-extracted replay of the code's substring parser gives: `CONTRADICTORY`→true; `CONSISTENT`→false; `NOT CONTRADICTORY`→true; `CONTRADICTION`→false; `NO CONTRADICTION`→false. The last two are the Appendix labels. These are code-level counterexamples, not evidence of actual historical judge strings. Raw judge outputs were not retained, so incidence is UNKNOWN.

## 3. Archived false-positive repair path: CB-68447

The premise is: if the road is clear, Victor goes for a walk.

- Q0 asks whether Victor staying indoors permits concluding that the road is blocked. GPT-4o answers `Yes`; no contradiction is flagged.
- Q1 asks whether Victor going for a walk permits concluding that the road is clear. GPT-4o initially answers `No`, explaining that the conditional gives a sufficient condition, not the converse. The record sets `contradiction_detected=true` and revises the answer to `Yes`, asserting that the road must be clear.

The initial answers are logically compatible. Q0 is modus tollens; Q1 rejects affirming the consequent. For P -> Q, not-Q entails not-P (modus tollens), but P -> Q together with Q does not entail P (affirming the consequent). The countermodel P=false, Q=true satisfies the premise and Q while falsifying P.

At Q1 there is only one earlier answer. The judge receives the two raw response strings without their questions or premise. The later repair prompt does include the questions and shared premise, yet the archived revision changes the initially defensible `No` to the logically invalid `Yes`.

**Evidence limit:** the stored output proves that a contradiction flag and revision occurred; it does not preserve the judge's raw response. This is an archived false-positive repair path under the benchmark's stated logic, not a directly observed NLI transcript or a definitive reconstruction of the judge's internal decision.

The expected Q1 string `No, we cannot conclude that` normalizes to `cannot_determine`; initial `No` normalizes to `no`; revised `Yes` normalizes to `yes`. The benchmark scores both initial and revised answers as wrong, although the initial `No` is semantically correct for the yes/no question and the revision is not. This is a concrete interaction between answer-key normalization and a harmful revision, not a new aggregate effect.

Across three exact 300-set result blobs, the inner-record schema is identical and lacks raw NLI response, judge ID/version, prompt hash, or selected-pair field. Contradiction flags / revisions: GPT-4o 385/1,150; GPT-4.1 375/1,150; Qwen 2.5 72B 353/1,150. These three samples are not a 17-model census.

## 4. Normalization control

The exact `normalize_expected` and `extract_answer` function bodies were transcribed from the evaluator and replayed against every expected-answer string in the full bank (493 sets / 1,904 questions) and sample (300 sets / 1,150 questions). There were zero cases where direct normalization differed from applying `extract_answer` and then normalization to the same expected string.

This rules out a demonstrated mismatch between those two stages for the current bank; it does not resolve the semantic class assigned to `No, we cannot conclude that`. This was a source-extracted function replay, not execution of the full evaluator or original API calls.

## 5. Formalization status and limits

No Lean proof of the NLI context relation, label parser, or revision-provenance projection was run. The existing HsH finite token/scoring formalization does not encode the actual string normalizer, NLI prompt, judge-label parser, question/premise context loss, or revision provenance. Compilation of that separate formalized statement is not a proof of this source-to-code relationship.

The logical example is elementary and formalizable, but the truth-table/countermodel check reported here is not a Lean proof. No physical claim or causal model-performance claim follows.

## 6. Interpretation and recommendations

The recovered CGD pipeline is a target model plus a shared fixed NLI judge, not a multi-agent social interaction or independent cross-model consensus experiment. The judge is a common mediator and possible common-mode error source.

Before relying on the method, reconcile the paper Appendix prompt with the implementation prompt and labels; bind result files to exact evaluator/config versions; pass both questions and the shared premise to the judge; persist raw judge outputs and selected prior-pair identity; use exact label parsing; and keep semantic adjudication separate from answer-key normalization. Preserve initial and revised answers and explicitly recheck revisions. The missing post-revision recheck is noted in the paper/implementation comparison, but is not newly claimed here.

This audit is descriptive. It does not establish the frequency of false-positive judge decisions across the full panel, the exact runtime version used for archived results, or a causal effect on general model capability.
