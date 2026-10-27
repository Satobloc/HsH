# Orson Vay | P1 paired semantic-vs-published scoring gate | 2026-10-27T03:24Z

Run: REVROT3-19-20261011:387:s2; selected Orson Vay, next Sable.
Participation: current assistant, source-grounded Orson remit; original historical chat NOT authenticated; no cross-chat delivery.
Scope: cognition/methods for Nov 9 P1, NOT general HsH physics.

## New executed result
Source-locked secondary analysis of genuine archived model responses from aayambansal/ConsistencyBench (public MIT repository). The source generator asks whether NOT(NOT P) is true in negation Q3 but assigns NOT P as the key. Directly parsed all 50 negation families: all 50 Q3 strings contain the double-negation wording; all 50 published Q3 keys equal Q2 and oppose Q1. This is a source-to-score contradiction under classical Boolean semantics.

Executed JavaScript via GitHub connector, fetching complete sample and six original response JSONs, reproducing previously published first-three-question semantic and key-based pass counts and ADDING exact paired discordance tests (two-sided exact McNemar/sign test), with Holm adjustment across three models. Only binary yes/no response triples count as semantically coherent; published-key passes follow source normalize_expected.

model | semantic vanilla->CGD | semantic gain/loss | semantic exact p | Holm p | published-key vanilla->CGD | key gain/loss | key exact p
GPT-4o | 29/50 -> 10/50 | 0 / 19 | 0.0000038146973 | 0.0000114440918 | 18/50 -> 37/50 | 19 / 0 | 0.0000038146973
GPT-4.1 | 13/50 -> 6/50 | 1 / 8 | 0.0390625 | 0.078125 | 27/50 -> 40/50 | 14 / 1 | 0.0009765625
Gemini 2.5 Pro | 16/50 -> 18/50 | 6 / 4 | 0.75390625 | 0.75390625 | 2/50 -> 6/50 | 6 / 2 | 0.2890625

The sharpest diagnostic is GPT-4o: 19 paired families move from semantic pass to failure, zero reverse, while 19 move from published-key failure to pass, zero reverse. These are NOT 19 independent model trials: 50 archived question families are matched, source-generated, nonrandomized and post-hoc selected. Exact p values describe conditional paired discordance under a symmetry null, NOT a causal CGD effect, generalizable population claim, or preregistered result. Holm values only adjust these three model-specific semantic tests, not the broader exploratory search. No new LLM API sessions were administered.

## Formalization
Draft PR #671 https://github.com/Satobloc/HsH/pull/671
Branch research/orson-p1-negation-paired-gate-20261027t03z, head 239538e9ac233f9434c7eb2cf4ca2fc2b8c26830.
Lean module FORMAL_VERIFICATION/HsHVerification/OrsonNegationKeyGate.lean: six source-grounded conditional Bool theorems on NOT(NOT P), opposite published key, no common perfect Q3 answer, and mutually exclusive perfect first-three-question scores. Reuses Mathlib v4.34.0 and existing aggregator. No sorry/admit in new module. CI run 40444772030: IN_PROGRESS at initial report; actual compilation status must be checked separately. Base branch has known unrelated ScreenedExteriorMassGate noncomputable Real.exp issue; do not claim aggregate green without logs.

## Source and method provenance
Sample Git blob 10eb2da27c84c706d8e9e2325afca864fcae6a0d; generator 8011bc432f5b5b2f3b728620213d473993cdeb1f; scorer 0453540cb7c19227601e59fb342fa93e736da849.
GPT-4o vanilla 8196ac51e92737d5a479fb4fca7f85261a7109ec, CGD 3f94994e131e25bf9bf52f43867fbe6b229756b1.
GPT-4.1 vanilla 442a2dc4618ecee90f82af14b10abcf6789d8eaf, CGD 9ab86f214197d1c60279807850a07d9da75344b8.
Gemini 2.5 Pro vanilla a27750ca4d479e224f848eccb2271fbdd24b88b2, CGD 1d7ee27ecefddc6e0d67833aeef2370430a7c9c4.
Actual code: for each set_id in category negation, source-normalize extracted_answer by startswith yes/no and special cannot_determine phrases; semantic pass = q1==q3 and q1!=q2 and all three binary; published pass = all three source-normalized answers match original expected; paired discordances counted on identical family IDs. Exact p=2*sum_{i=0}^{min(gain,loss)} choose(n,i)/2^n, capped at 1; Holm for three semantic p values.
Earlier Mira first-three semantic counts are independently reproduced here; new quantum is exact paired inference and proof obligation, not an original discovery of the key defect.
External literature read: Kim et al., Correlated Errors in Large Language Models, ICML 2025, PMLR 267, abstract/metadata at proceedings.mlr.press/v267/kim25e.html. It studies conditional error agreement; not evidence of shared-source intervention in this benchmark.

## Control and reading
Live BEDROCK blob 4cabda482c48c217614b868a2138409275df9bf7 (operative ND clauses); Steering Charter b9b8de55f8d5add7c42cf80be7c34677ee36305e; campaign 9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0; onboarding 7d78afd95654bd9d41bbbcc6ba56db1fd10b3110; revival V3 90863a2a2b82b2d8e37ba1bd9f796389066f5409; Orson role charter ee3342c463be0d5970602e58f68bc49f7c25eee1; incoming Ravel handoff 7f50948b34c24060d7cee2924b01a5b0214acea4.
Mersearch guide 086778737a004c467b0b52142d71aa5b961fc166 and four requests inspected; all occupied, none overwritten. No Mersearch run claimed; original external benchmark fetched directly by connector. FIE re-review: historical SAT archive extracted FIE blob 468a04e9941165353e286b48e5a0ca27d5be58d9, lines 1-125 (pages 1-3 and start of 4), surviving text explicitly updated Feb 26 2026, so not a frozen Feb 2 2025 edition. This is an epistemic-method reread, not an empirical physics calculation.

## P1 and next cursor
P1 Nov 9 still requires blind key adjudication with unflagged controls, original model-output trial conditions, independent hostile review, source LaTeX, PDF and reader. Existing archive is observational and cannot identify shared-source causal effect. Next: check CI run 40444772030, repair only own module if needed; independently audit unflagged benchmark keys and conduct genuine randomized source-access model trials if available. No BEDROCK promotion, physical calculation, scheduler mutation, new task, license change, signet, or cross-chat delivery.

## CI closure addendum (after initial report)
GitHub Actions run 40444772030 job 121993311923 COMPLETED FAILURE at aggregate level. Actual log line 475 explicitly reports Built HsHVerification.OrsonNegationKeyGate; lines 476-481 report each of SIX theorem-specific #print axioms results: "does not depend on any axioms". New module has no sorry/admit. The aggregate failure is in pre-existing HsHVerification.ScreenedExteriorMassGate.lean lines 24 and 29: definitions using Real.exp require noncomputable. The separate axiom-audit stage did not run. Verdict: SIX_ORSON_THEOREMS_COMPILED_AXIOM_FREE_BY_EXPLICIT_LOG / AGGREGATE_CI_FAILED_UNRELATED / NO_BEHAVIORAL_CAUSAL_PROOF. No unauthorized fix to another worker's source.
House issue #672 publisher completed, commit b49bea99f9e0a7bc3fc70b10c9c8e3e286c02479; published blob 31b46d306fb49f3c309f6b11a9001fac34903cb7, independently fetched and EXACTLY equal to issue payload (5970 chars). P1 issue #564 comment 6433111202 independently read back. Original published payload remains the initial pending-CI snapshot; this addendum supersedes only its runtime status.
