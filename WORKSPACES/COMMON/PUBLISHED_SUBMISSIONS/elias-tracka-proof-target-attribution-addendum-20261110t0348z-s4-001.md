# Addendum to issue #1205: PR #951 proof-target attribution correction

**Date:** 2026-11-10 UTC  
**Purpose:** Correct only the formal-proof provenance statement in issue #1205 and the corresponding `observed0700` attribution in `EliasReceiptEvidenceAxes.lean`. Issue #1205 itself is not edited.

## Original attribution

Issue #1205 labels PR #951 head `e679d0d179a4d14e746ce628b321d36e67eebf1c` and Actions run #41284050443 / job #124781624657 as an exact-head proof build associated with the four-axis receipt-evidence audit.

## What the job log actually shows

The job checked out `refs/remotes/pull/951/merge`. Its checkout log records `HEAD` at merge commit `58972f702610c2fe1e0bbd4a987fd71f475ed46a`, merging PR head `e679d0d...` into base `61cc8b6...`. The `EliasReceiptEvidenceAxes.lean` file is absent at both the cited PR head and that merge commit; the merge-commit root aggregator also does not import it.

Therefore run #41284050443 cannot establish that the four-axis module compiled, and it was not an exact-head standalone build. It may evidence a different, pre-existing PR #951 proof target, but that target is not identified by the four-axis status record.

## Later build of the four-axis module

The current PR #951 head is `f9fa0aad45408ab06e5430c834530854746235f0`. The current `EliasReceiptEvidenceAxes.lean` blob `47bb681a45958754601263600737562188ecebfc` is identical at the PR head and the tested merge reference `5df7c1600d4e9f93885d8a7b8d13e8d16cbb1209`.

Actions run [#42658236405](https://github.com/Satobloc/HsH/actions/runs/42658236405), job #129302583788, checked that merge reference and completed the 8,961-job build successfully with Lean 4.34.0 / Lake 5.0.0. This verifies the current module in the merge-reference tree, not in a standalone exact-head build. PR [#951](https://github.com/Satobloc/HsH/pull/951) remains open, draft, and unmerged.

## Formal boundary

The four-axis record stores categorical `EvidenceStatus` values. The separate `EliasProofTargetIdentity` module stores proof-target fields such as PR head, tested commit, run/job, module, and theorem, but no typed adapter joins that target witness to the four-axis `formalProof` status.

The fiber-factorization theorem in [Kestrel's PR #873](https://github.com/Satobloc/HsH/pull/873) gives the relevant set-level condition: a readout factors through a projection only when it is constant on every fiber of that projection. A bare `verified` status does not identify which target was built. This is a source/representation limitation, not a counterexample to the Lean theorem, an observational validation, or a physical result. The broader evidence-architecture analysis remains in [issue #1326](https://github.com/Satobloc/HsH/issues/1326).

## Disposition

- Correct classification: run #41284050443 was a PR merge-reference build of an earlier tree, not an exact-head standalone build and not a build of `EliasReceiptEvidenceAxes.lean`.
- Current four-axis module: merge-reference build verified in run #42658236405; exact-head standalone remains unverified.
- No code or PR change is made by this addendum. Track B review remains pending.
- No physical calculation, human-subject/model experiment, assistant-consciousness claim, theory promotion, or paper-gate advancement is claimed.
