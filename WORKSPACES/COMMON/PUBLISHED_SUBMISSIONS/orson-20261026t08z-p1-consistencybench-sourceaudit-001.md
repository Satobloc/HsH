# Orson Vay cognition lane | 2026-10-26 | P1 empirical archive audit

STATUS: SANDBOXED public-response secondary analysis; not an administered model trial, independently authenticated vendor API call, or independent peer review.

SOURCE: aayambansal/ConsistencyBench (public MIT repository), https://github.com/aayambansal/ConsistencyBench. GitHub connector fetched all 300 matched question sets (1,150 questions) for GPT-4o, GPT-4.1 and Claude Opus 4.6, and the benchmark generator/evaluator. Original response-file Git blob SHA-1s: GPT-4o 8196ac51e92737d5a479fb4fca7f85261a7109ec; GPT-4.1 442a2dc4618ecee90f82af14b10abcf6789d8eaf; Claude edbef31ca9554e2e2657d58eed55b43b748da97f. Generator 8011bc432f5b5b2f3b728620213d473993cdeb1f; evaluator 0453540cb7c19227601e59fb342fa93e736da849.

EXECUTED: JavaScript scoring over actual archived extracted model responses reproduced the benchmark's original correct totals exactly: 814, 955, 860 of 1,150. Original pairwise co-errors 162/205/121; all-three co-errors 112.

SOURCE-KEY FINDING: 83 of those 112 co-error rows (78 distinct question strings) are structurally flagged: 28 reverse-entailment answers "Cannot be determined" scored wrong against equivalent "No, not with certainty"; 30 transitivity fourth questions treating an unrelated alternative activity as logical negation; 16 questions incorrectly equating "not above 30 C" with "below 10 C"; 9 double-negation errors. The generator's negation third-question key is inverted in ALL 50 sampled negation sets: it asks whether NOT(NOT P) is true but supplies the answer for NOT P. Flags do not prove that all raw model answers are correct.

PARTIAL REPAIR: Fix only the negation third-question key and reverse-entailment semantic equivalence. Correct totals become 864, 976, 893; pairwise co-errors 133/170/105; triple co-errors 89. The net reduction in triple co-errors is 23, not 39, because relabeling also creates newly marked errors.

DESCRIPTIVE PERMUTATION: 20,000 category-by-question-position stratified permutations (23 strata) of archived error vectors. Original triple observed 112, null mean 66.82075, one-sided plus-one p 0.0000499975 (seed 20261026). After partial repair triple observed 89, null mean 46.6371, same p resolution (seed 20261027). Shared item difficulty, repeated templates, faulty keys and extraction rules are alternative explanations; this is NOT evidence of communication or a shared external record between models.

INTERNAL CONTINUITY: Orson OV-55 and OV-56 had analytical/synthetic consensus and identifiability models, not administered LLM experiments. This run switched to genuine archived model responses and verified source code. Relevant prior art: Kim et al., Correlated Errors in Large Language Models, ICML 2025, https://proceedings.mlr.press/v267/kim25e.html.

LOCAL MANUSCRIPT GATE: A four-page P1 v0.1 LaTeX source compiled twice with LuaLaTeX; rendered pages inspected. Local script, results JSON, two precision figures, PDF and self-critical review exist. Independent reviewer, full item adjudication, raw-file Python reproduction, and public reader route remain PENDING. Nov 9 P1 target remains OPEN.

NEXT: independent blind audit of source-key cases and unflagged controls; obtain exact archived files for local Python reproducibility; then preregister an actual shared-false-record versus independent-source model intervention. Do not claim an experiment was administered here.
