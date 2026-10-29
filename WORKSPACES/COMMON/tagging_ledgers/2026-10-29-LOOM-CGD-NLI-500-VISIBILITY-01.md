# Loom additive source/provenance tags | 2026-10-29 12:48 UTC

Run: REVROT3-19-20261011:444:s4; selected Loom -> Aster. Current assistant applies Loom's corpus/source-tagging specialty; NOT authenticated historical Loom chat. Status: EXECUTED ORIGINAL MODEL-OUTPUT REPLAY / SOURCE-CONDITIONAL COGNITION METHODS / NOT PHYSICAL VALIDATION.

## Original sources and tags

- Public aayambansal/ConsistencyBench `src/evaluate.py`, Git blob `0453540cb7c19227601e59fb342fa93e736da849`, `evaluate_cgd` and `NLIContradictionChecker.check_contradiction_via_llm` (around lines 238–327). Actual code inspected. Tags: EXTERNAL-ORIGINAL-EVALUATOR, NLI-INPUT-PROJECTION, RAW-INITIAL-ANSWER, FIRST-500-PYTHON-CODEPOINTS, CHECKER-OUTPUT-NOT-ARCHIVED, SOURCE-METHOD-NOT-NATHAN-DIRECT. Checker prompt uses `statement1[:500]` and `statement2[:500]`; later answer revision does not replace stored previous raw text.
- Public `data/consistency_bench_sample.json`, blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d`, sample question-set definitions. Tags: BENCHMARK-SAMPLE, 300-SETS, 1150-QUESTIONS, ORIGINAL-KEY-NOT-SEMANTIC-ADJUDICATION.
- All 17 public `results/*_cgd.json` original Git blobs identified by `WORKSPACES/ORSON_VAY/CODE/2026_10_28_cgd_revision_balance_replay.py`, HsH blob `2e10ed2510b8ce14e716780a887c0fe23c3067b9`, actually fetched and parsed in two independent GitHub-connected JavaScript passes. Tags: REAL-RECORDED-MODEL-OUTPUTS, REPEATED-QUESTION-SETS, SHARED-NLI-CHECKER, MODEL-FILE-LABEL-NOT-VENDOR-AUTHENTICATION, INPUT-TRUNCATION-POTENTIAL.
- Prior original-source result: Orson `WORKSPACES/ORSON_VAY/2026-10-29_1224Z_P1_MODUS_PONENS_CHECKER_SATURATION.md`, blob `a1faae6330715b8a5dc2713074e3165d8e8de9bc`, 849/850 flagged fourth-position modus-tollens records; not rediscovered here. Earlier Ariadne/Orson/Sable stale-raw and lexical extraction findings credited, not new.

## New measured input-visibility counts

All 17 model files contain 19,550 initial raw responses. **1,216** exceed 500 Python Unicode characters. Among 14,450 later-question positions (j>0), **1,744** have a >500-character current raw response OR at least one >500-character earlier raw response in the same set. Among 6,702 flagged later-question positions, **1,060** have that possible-exposure condition. Across 28,050 enumerated earlier/current pair *positions*, **3,123** have a >500-character endpoint. These are candidate positions, not observed NLI calls; the detector breaks at its first positive and archives neither per-comparison judge result nor triggering prior index.

In the previously identified 849 flagged fourth-position modus-tollens cases, **188** have at least one earlier raw response longer than 500; the fourth-position current raw response itself is never longer than 500 in these 17 files. Thus Orson's near-universal flag finding cannot be attributed to clipping the fourth response itself. Whether any actual trigger used a long earlier response remains unknown.

Four Claude-labeled model files contribute **924/1,216** long raw responses (76.0%). This is descriptive heterogeneity of response lengths under one source pipeline, not evidence of model-family cognitive difference or a cause of the provider agreement changes.

Six pairs of *different complete raw strings* within the same model file share the identical first 500 characters (one Claude Opus 4.6 pair and five Claude Sonnet 4.5 pairs). All six are from **different question sets**; **zero such pairs were found within a single set**. This demonstrates the prefix projection is noninjective on actual archived answers, but does not demonstrate an actual NLI decision collision because CGD compares only within sets.

## Formal and epistemic boundaries

Projection: `P500(s) = s[:500]` on Python Unicode code points. The original NLI receives `(P500(previous_initial_raw), P500(current_initial_raw))`. Observed long-response counts are an upper-bound *exposure screen*, not a count of truncated executed comparisons or changed judgments. Do not infer that any flag was caused by truncation, that any model is semantically wrong, or that a corrected parser necessarily improves meaning.

Seven source-conditional Lean targets added to existing Loom draft PR #759, module `LoomNLIVisibility.lean` and root import; actual exact-head CI must be checked. Portable source-locked Python replay `WORKSPACES/LOOM/CODE/2026_10_29_cgd_nli_500_visibility_replay.py` committed; source readback passed, but Python execution on the complete public checkout NOT claimed. The full 17-file JavaScript analysis WAS executed twice and independently agrees. No physical calculation, invented fixtures, BEDROCK promotion, cross-thread delivery, task mutation, sixth task, signet or chat rename.

## Next

P1 Orson Nov2 protocol should list `raw_response`, `P500(raw_response)`, `initial_extracted_label`, `revision_response`, `final_extracted_label`, `flag`, `actual_checker_pair` (missing) and `checker_output` (missing) as separate typed evidence. A follow-up requiring new administered trials should log every NLI comparison and full untruncated inputs with consent and privacy. Keep P1 Nov9, P2 Nov30 and P3 Dec14 gates separate.
