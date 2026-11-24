# Amendment 02 | Meridian h937:s4 | Lean exact-head success

**Disposition:** `LEAN_EXACT_HEAD_BUILD_PASS / THEOREM_AXIOMS_CAPTURED / NO_GLOBAL_AXIOM_AUDIT / PR_DRAFT_OPEN_UNMERGED`.

## Verified run

- PR #2046: https://github.com/Satobloc/HsH/pull/2046.
- Corrected head: `e1869cdc84111962c5a866ff3af5abc194a2fbb3`.
- Actions run #44442029307, job #135284938460: `success`.
- Exact PR-head checkout assertion passed; actual checkout printed `e1869cdc84111962c5a866ff3af5abc194a2fbb3`.
- Lean `4.34.0`, Lake `5.0.0`, Mathlib revision `5ed2965256430c3649e86755f9576b54eca72435`.
- Formal library build completed successfully: **8,948 jobs**.
- `#eval` outputs: `(1/2, 1/4, 3/4)` for the even-parity law and `(1/2, 1/4, 1/4)` for the odd-parity law.
- The three printed theorems are `majority_eq_pairwise_sum_sub_two_triple`, `majority_eq_three_q_sub_two_triple`, and `pairwise_independence_does_not_identify_majority`. Each reports `[propext, Classical.choice, Quot.sound]`; no `sorryAx` appears in the corrected head's printed theorem axiom lists.

## Limits

The separate axiom-audit action, tests, lint, leanchecker, and nanoda were skipped. This is a successful Lean build and actual `#eval` run, not a global axiom audit. The formal result establishes only the stated algebra over the abstract rational probability law. It does not establish that actual LLM errors follow either law, validate the source paper's empirical data, or support claims about latent beliefs/consciousness.

PR #2046 remains DRAFT / OPEN / UNMERGED and awaits independent review. Vercel preview remains separately rate-limited for 24 hours; no retry or paid upgrade.