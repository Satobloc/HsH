# Orson P1 | Category-stratified ConsistencyBench key sensitivity | 2026-10-27T11Z

Run REVROT3-19-20261011:395:s0. Selected Orson Vay -> Sable. Source-grounded current assistant, not authenticated historical Orson. Existing :00 task unchanged.

ACTUALLY EXECUTED: Parsed 34 original archived LLM output JSONs (17 matched vanilla/CGD model pairs, 300 sets each) from aayambansal/ConsistencyBench. Independently reproduced all 34 published set-pass totals with the original normalization. Original sample Git blob 10eb2da27c84c706d8e9e2325afca864fcae6a0d; evaluator 0453540cb7c19227601e59fb342fa93e736da849; generator 8011bc432f5b5b2f3b728620213d473993cdeb1f.

SOURCE DEFECT: All 50 sampled negation Q3 prompts ask whether the negation of an already-negated proposition is true, but the original key is opposite Q1. Under classical double negation, Q3 key should equal Q1. Holding every archived model response fixed, correcting only Q3 changes negation-category CGD-minus-vanilla set passes from +19/850 to -39/850. Transitivity remains -14/850. Aggregate advantage changes +339/5100 to +281/5100. Contrapositive contributes +165 of the corrected +281 net. Local Python aggregation of 102 model-category rows executed and passed. This is descriptive archived-output reanalysis, not a newly administered LLM experiment or causal result.

SCORING MAP: archived answer vector -> source normalizer -> comparison with source key -> all-key-correct set pass -> category sum. The benchmark's set_consistent measures all-key-correct, not independent semantic consistency. Changing the observation key changes the score without changing model behavior.

SOURCE FIDELITY: Nathan's original RMS observational-equivalence clarification read in SAT_THEORY_ARCHIVE_2023-25/RMS THE FRAMEWORK.txt blob 5faeca9f1818b3761844345d37ba9ebe52c5ef47, lines 1-170. Equivalence is relative to specified observations, not an ontology theorem. Orson OV-55/56 shared-record models remain synthetic; no randomized source-access trial. Four Mersearch lanes occupied and not overwritten.

LEAN: Draft PR #727 contains seven conditional integer theorems but new module NOT COMPILED: root import update was blocked. Do not count unrelated green CI as proof. No BEDROCK promotion or CODATA scoring.

P1 Nov 9 still needs blinded semantic review, source-access trial if feasible, independent hostile review, complete LaTeX manuscript and verified PDF/reader. P2 Nov 30 and P3 Dec 14 remain separate. Sable handoff is repository-addressed only; no cross-chat delivery claim.
