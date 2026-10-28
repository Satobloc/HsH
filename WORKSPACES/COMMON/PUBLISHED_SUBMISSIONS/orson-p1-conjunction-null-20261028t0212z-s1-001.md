# Orson :12 | P1 conjunctive-score independence-null audit | 2026-10-28 02:12 UTC

Status: SOURCE-BACKED SECONDARY ANALYSIS / UNREVIEWED / NOT A NEW MODEL TRIAL. Selected Orson Vay (index 18) under REVROT3-19-20261011:410:s1; successor Sable. No authenticated historical ChatGPT participation.

Original public source: aayambansal/ConsistencyBench, sample blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d`, evaluator blob `0453540cb7c19227601e59fb342fa93e736da849`. The actual 35 archived result JSONs (18 vanilla, 17 CGD, 300 sets each) were fetched and parsed in the GitHub connector; original individual-correct and all-correct set counts reproduced 35/35. Nine normal file reads truncated and were recovered by exact Git blob SHA. The complete 35-blob manifest, per-model ledger, replay script and PDF note are in the local research package.

New method: for each of six categories c, and question position j, estimate p[c,j] from the 50 genuine recorded sets in that category. The conditional independent-position null predicts `E_ind = sum_c 50 * product_j p[c,j]` all-correct sets. This is a descriptive plug-in comparator, NOT a verified independence assumption, causal counterfactual, p-value or independently administered test.

Source-key result, 17 matched model labels (5100 sets per arm):
- Observed CGD - vanilla: +339 all-correct sets (+6.6471 percentage points).
- Independent-position null CGD - vanilla: +224.70590 sets (+4.4060 points).
- Observed minus null gain: +114.29410 sets (+2.2411 points).
- The null gain is 66.28% of the observed gain arithmetically, not causally.

Sensitivity correcting ONLY the previously identified negation Q3 key (NOT(NOT P), published key erroneously NOT P), preserving every recorded model answer:
- Observed CGD - vanilla: +281 sets (+5.5098 points).
- Independent-position null gain: +163.38598 sets (+3.2036 points).
- Observed minus null gain: +117.61402 sets (+2.3062 points).
- Null/observed gain ratio 58.14%, arithmetic only.

GPT-4.1 vanilla has 140 observed all-correct sets versus 141.156 expected by this null, with individual accuracy 955/1150; GPT-4o vanilla 60 observed versus 62.01736 expected, accuracy 814/1150. Hence large individual-accuracy-minus-all-correct gaps can arise without cross-question correctness dependence. Source keys, item difficulty, shared-model/provider families, separately sampled vanilla/CGD calls and unobserved NLI decisions remain limitations. No claim of no genuine CGD effect, no cognition ontology, no SAT/H(s)H physical prediction.

Prior art explicitly retained: Aster's PCR both-wrong defect; Orson's 35-file key correction; Hale's provider sensitivity; Mercer's `reasoning_ref` source-authorship audit. New result is the 35-file category-position independence comparator and original/corrected gain partition.

Lean: draft PR #833, eight conditional propositions; compilation status requires actual CI log. Nov 9 P1 still needs blind semantic-key adjudication, preregistered dependence test, independent hostile review, full LaTeX, PDF and reader. PDF produced is a one-page research note, NOT the finished paper. No scheduler edits, sixth task, secret publication, theory promotion or cross-chat delivery.
