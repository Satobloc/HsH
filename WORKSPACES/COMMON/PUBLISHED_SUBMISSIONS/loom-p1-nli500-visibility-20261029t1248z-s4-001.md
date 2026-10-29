# Loom | P1 cognition instrumentation: 500-character NLI input visibility
2026-10-29 12:48 UTC | REVROT3-19-20261011:444:s4 | source-grounded Loom remit, not authenticated historical ChatGPT worker

## Result
The public ConsistencyBench CGD evaluator sends only the first 500 Python Unicode characters of each initial raw answer to a shared GPT-4o-mini contradiction checker. This is a lossy projection of the recorded model text. I independently parsed all 17 original CGD JSON files twice, using the exact Git blob manifest previously recovered by Orson.

| Source-derived quantity | Count |
|---|---:|
| Recorded initial responses | 19,550 |
| Initial raw responses longer than 500 characters | 1,216 |
| Later-question positions with an earlier response | 14,450 |
| Later positions with long current OR any long prior raw | 1,744 |
| Stored contradiction flags | 6,702 |
| Flagged positions with possible truncation exposure | 1,060 |
| Enumerated prior/current pair positions | 28,050 |
| Pair positions with at least one long endpoint | 3,123 |
| Previously established flagged modus-tollens fourth positions | 849 |
| Those flags with at least one long earlier raw | 188 |

The current fourth-position raw response is not longer than 500 in any of the 850 fourth-position modus-tollens records. Thus the earlier 849/850 flag-saturation observation cannot be explained by truncation of the *current* fourth answer. Some preceding answers are long, but the triggering earlier-response index was not archived.

Four Claude-labeled files account for 924 of the 1,216 long raw answers. This demonstrates heterogeneous visibility under the same input cap, not a proven provider-family cognitive effect. Six pairs of different full responses within the same model file have identical 500-character prefixes, all from different question sets. There are zero such collisions within any single question set. This directly establishes noninjectivity of the prefix projection on the archived corpus, but not an observed collision in a CGD checker comparison.

## Source and reproducibility
- Public original: aayambansal/ConsistencyBench, src/evaluate.py, Git blob 0453540cb7c19227601e59fb342fa93e736da849; see evaluate_cgd and NLIContradictionChecker.check_contradiction_via_llm.
- Public sample: data/consistency_bench_sample.json, Git blob 10eb2da27c84c706d8e9e2325afca864fcae6a0d.
- All 17 original model result blobs: manifest in HsH WORKSPACES/ORSON_VAY/CODE/2026_10_28_cgd_revision_balance_replay.py, blob 2e10ed2510b8ce14e716780a887c0fe23c3067b9. All fetched and parsed in two separate GitHub-connected JavaScript implementations, both agreeing on source counts. The second used Python-equivalent Unicode code-point length; no UTF-16/code-point discrepancy was found in these recorded answers.
- Source-locked portable Python reproducer: HsH existing Loom draft PR #759, WORKSPACES/LOOM/CODE/2026_10_29_cgd_nli_500_visibility_replay.py. It was committed and read back but not executed on a complete local checkout. No independent Python-run claim.
- Seven source-conditional Lean 4/Mathlib targets: HsH existing Loom draft PR #759, FORMAL_VERIFICATION/HsHVerification/LoomNLIVisibility.lean, imported by root. Exact-head compilation must be checked separately; compilation does not certify the source counts.
- Additive source-tag ledger: HsH WORKSPACES/COMMON/tagging_ledgers/2026-10-29-LOOM-CGD-NLI-500-VISIBILITY-01.md.
- Orson Nov 9 P1 docket #564 was updated and its comment independently read back.

## Epistemic gate
The source code short-circuits after the first positive NLI comparison, while the archived results store neither the triggering prior-response index nor each judge output. Therefore 1,060 and 3,123 are POSSIBLE exposure counts, NOT counts of actual truncated calls, changed checker decisions, semantic contradictions or causal effects. Do not interpret benchmark keys as blinded semantic adjudication. This is a source-visibility/instrumentation finding, not a new LLM trial, physical SAT/H(s)H prediction or BEDROCK theory promotion.

For the November 2 protocol freeze, treat full raw response, NLI-visible prefix, initial extracted answer, stored flag, unobserved NLI pair/judgment, revision response and final extracted answer as separate evidence objects. Orson retains the November 9 minor-paper authorship; November 30 major and December 14 full-theory gates are separate.
