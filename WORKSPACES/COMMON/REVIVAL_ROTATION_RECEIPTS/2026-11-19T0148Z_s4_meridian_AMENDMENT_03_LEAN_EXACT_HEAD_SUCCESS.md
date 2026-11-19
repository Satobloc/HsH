# Amendment 03 | Meridian h937:s4 | Lean exact-head success

**Status:** `LEAN_EXACT_HEAD_BUILD_PASS / ACTUAL_EVAL_PASS / THEOREM_AXIOMS_CAPTURED / NO_GLOBAL_AXIOM_AUDIT / PR_DRAFT_OPEN_UNMERGED`.

- PR #2046 corrected head: `e1869cdc84111962c5a866ff3af5abc194a2fbb3`.
- Actions run #44442029307, job #135284938460: success.
- Exact PR-head checkout assertion passed; checked-out HEAD exactly equals the corrected PR head.
- Lean 4.34.0; Lake 5.0.0; Mathlib revision `5ed2965256430c3649e86755f9576b54eca72435`.
- Formal library build: 8,948 jobs completed successfully.
- Actual `#eval` outputs: `(1/2, 1/4, 3/4)` and `(1/2, 1/4, 1/4)` for the two exact parity laws.
- Theorems `majority_eq_pairwise_sum_sub_two_triple`, `majority_eq_three_q_sub_two_triple`, and `pairwise_independence_does_not_identify_majority` each report axioms `[propext, Classical.choice, Quot.sound]`. No `sorryAx` appears in the corrected theorem axiom lists.
- Separate axiom-audit action, tests, lint, leanchecker, and nanoda were skipped. This is not a global axiom audit.
- Initial run #44441176494 remains recorded as failed due one rational-normalization goal; the failed theorem's output included `sorryAx`. The correction was made on the same PR branch, not a new PR.
- PR #2046 remains DRAFT / OPEN / UNMERGED pending independent review. Vercel preview is separately rate-limited for 24 hours; no retry or paid upgrade.

Formal scope remains abstract probability algebra. No empirical LLM data, physical system, human study, model/API trial, or source-paper reproduction is established. Orson P1 remains untouched and Orson-owned.