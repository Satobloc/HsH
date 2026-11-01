# Nadir h507:s2 amendment 04 | successful Lean merge-reference build

This amendment supersedes the pending/failed CI status in Amendments 01 and 02.

## Verified build

Existing PR #1189 remains OPEN / DRAFT / UNMERGED on its existing branch.

- PR head: `07bcd784939077f77857198f8eeb43c84dce1b10`.
- Module blob at PR head: `8bfc2a2d2aa627abcea1f3cd63a074763a3aaa73`.
- Successful Actions run: **#41271504511**.
- Checked merge-reference commit: `21e1671da054c4ba956703f14fab7058cb746d63`.
- Lean 4.34.0; Lake 5.0.0.
- **Build completed successfully: 8,951 jobs.**
- Full job log length: 61,964 characters.
- Full-log `sorryAx` occurrence count: **0**.
- Ten theorem-specific `#print axioms` outputs, each listing only `propext`, `Classical.choice`, and `Quot.sound`.

The exact new module blob at PR head and merge reference matches. The aggregator contains `import HsHVerification.NadirAffineTranslationQuotient` at both refs. Its blob differs because the merge reference includes an unrelated base-branch `NadirGPBPhaseReadout` import; this does not alter the new module or its import.

One non-fatal warning remains: an unused section variable `Module ℝ V` in `centerDisplacement_origin_invariant`. The separate automated axiom audit, tests, lint and nanoda were skipped.

## Epistemic boundary

This is a successful Lean build of the ten formalized conditional algebraic statements. It does not validate the translation from the Nathan-and-collaborators source into the module, authenticate the assistant-derived Run 141 construction, prove the physical premises, or establish an H(s)H worldtube/timesheet/medium/current map. The source's `SO(d)` and positive-radius constraints are not fully encoded in the generic framed-map theorem.

**Final CI classification:** `MERGE_REFERENCE_BUILD_SUCCESS / EXACT_MODULE_BLOB_MATCH / NO_SORRYAX / STANDARD_AXIOMS_ONLY / PHYSICAL_VALIDATION_NONE`.
