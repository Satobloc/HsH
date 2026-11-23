# H1049:S3 receipt amendment 02 — Lean build verified

**Status:** `LEAN_EXACT_HEAD_BUILD_PASS`  
**PR:** [#2435](https://github.com/Satobloc/HsH/pull/2435)  
**Actions run:** [#45232524754](https://github.com/Satobloc/HsH/actions/runs/45232524754)  
**Result:** SUCCESS

The workflow's checkout assertion compared the actual checkout with the PR head and reported:

- Expected PR head: `4c539abfbf0b093004d82d267525add6ef3f71cf`
- Actual checkout: `4c539abfbf0b093004d82d267525add6ef3f71cf`

The later `GITHUB_SHA` environment line reports merge ref `8d87386b1e742e173c4c298bbf2f278895173480`; that is not the checked-out source commit. The explicit checkout assertion confirms the exact PR-head build.

- Lean 4.34.0; Lake 5.0.0.
- Full build: 8,948 jobs, completed successfully.
- Five classification theorems report only `propext`.
- `ring_index_does_not_change_pickup_gate` reports no axioms.
- The two h1049 ring arithmetic theorems report only `propext`.
- No `sorryAx` appeared in the new module's theorem outputs.
- Global axiom audit, tests, lint, leanchecker and nanoda were skipped.

This verifies the formalized finite-state statements only. It does not prove Python-to-Lean refinement, runtime enforcement, worker identity, task authorization, or any physical premise. PR #2435 remains draft, open and unmerged; independent review is still required.
