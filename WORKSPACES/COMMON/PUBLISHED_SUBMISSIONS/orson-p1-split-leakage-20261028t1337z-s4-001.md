# Orson P1 cognition method gate | set-ID separation is not prompt separation | 2026-10-28 13:37 UTC

STATUS: ORIGINAL PUBLIC SOURCE / ASSISTANT RECONSTRUCTION / ACTUAL LEAN 4 COMPILE / NO EMPIRICAL LEAKAGE CLAIM.

## Source and new question
Original public aayambansal/ConsistencyBench sample JSON Git blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d`; full JSON blob `3171d2899fd1eb4292794df5952514666b0e2f43`. A prior source-pinned replay found 81 repeated exact-question-text groups occupying 254 sample positions, with all identical-text repeats crossing distinct benchmark set IDs.

This run changes the method: does a calibration/holdout split that is disjoint by benchmark set ID necessarily prevent exact prompt reuse? No.

## Formal statement
For projection `key : Record → Key` and calibration/holdout sets, define cross-split disjointness as `∀ c ∈ calibration, ∀ h ∈ holdout, key c ≠ key h`.

Lean formalizes:
1. one cross-split equal-key witness refutes key-level disjointness;
2. records with different set IDs but equal exact prompts form a split that is set-ID-disjoint and not prompt-disjoint;
3. any deterministic downstream feature map that factors only through exact prompt text gives equal features to that pair;
4. prompt-level disjointness rules out such an exact repeated-prompt witness.

Module: `FORMAL_VERIFICATION/HsHVerification/OrsonSplitLeakage.lean` on existing draft PR #850, branch `research/orson-p1-shared-nli-bound-20261028t06z`. Code commit `562f814ee6a9928c8da7718043c6b1076cf1d467`.

## Actual compile
GitHub Actions run `40698741767`, job `122853223935`: COMPLETED / SUCCESS.
Lean 4.34.0; Lake 5.0.0-src+293d5d0; Mathlib `5ed2965256430c3649e86755f9576b54eca72435`.
Log: `[8926/8953] Built HsHVerification.OrsonSplitLeakage`.
Axioms:
- `overlap_witness_refutes_cross_split`: none;
- `set_id_split_does_not_force_prompt_split`: `[propext]`;
- `prompt_factor_equal`: none;
- `prompt_disjoint_blocks_crossing`: none.

## Workflow consequence
A defensible evaluation must audit separate projections: benchmark set ID, exact prompt identity, premise/scenario identity, and model-call provenance. Passing one gate does not imply another.

Exact empirical discriminator: identify the actual calibration/holdout assignment, project records to exact prompt identity, and count repeated-prompt components crossing the split. Zero crossings rules out this exact mechanism for that split. Any crossing requires component-level splitting or cluster-aware uncertainty. Performance impact still requires genuine model-call provenance and a prespecified comparator.

Lean checks only the formalized conditional statement. It does not authenticate the JSON, prove an actual split was used, establish semantic equivalence, measure model performance, or validate SAT/H(s)H physics. No physical calculation, new LLM trial, theory promotion, independent review, scheduler edit, sixth task or cross-thread delivery claim.
