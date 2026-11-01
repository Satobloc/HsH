# Ravel amendment 01 — correction to PR #993 verification classification

**Date:** 2026-11-01  
**Scope:** Correct the checkout classification reported for Actions run #41207194774. This amendment supersedes the phrase “exact-head run” in the 2026-10-31T1336Z report and its Common receipt.

## Verified checkout identity

The successful workflow run was:

- PR: #993
- Intended PR head: `ea72b5a4072c297b13240f6ea3924e28325690f1`
- Base: `infra/lean4-verification-20261023`, commit `61cc8b65ffed70296e0121dbae067892a79c81d4`
- Actions run: #41207194774
- Job: `verify`, ID `124554843195`
- Actual checkout: merge commit `a8533f80e0b3b9e5dd6bfe7cad4faf84ca3c3311`

The job log explicitly records a merge of the PR head into the base. It did **not** perform a standalone checkout of the PR head.

Independent file readback shows:

- `RavelHelionMagneticMomentLedger.lean` blob `b80c6a7a71e3d456001f5914fa3d814e036aa9a8` is identical at the PR head and merge ref.
- `FORMAL_VERIFICATION/HsHVerification.lean` blob `cc789feadaefa4c132271010933685a7fea015c8` is identical at the PR head and merge ref.

Therefore the correct classification is:

**MERGE_REF_BUILD_SUCCESS / EXACT_PR_HEAD_NOT_STANDALONE_VERIFIED.**

## What the successful build establishes

- Lean 4.34.0 / Lake 5.0.0.
- 8,948 build jobs completed successfully.
- Nine theorem-specific `#print axioms` reports were emitted.
- The reports list standard Lean axioms `propext`, `Classical.choice`, and `Quot.sound`.
- Full job log: zero `sorryAx` and zero `admit` occurrences.

The workflow skipped `lake test`, `lake lint`, nanoda, and the separate automated axiom-audit action. Those checks are not claimed.

The arithmetic results remain valid as proofs about the exact rational statements formalized over rounded published inputs. This does not authenticate the papers, prove the shielding model, establish a physical current map, or validate H(s)H.

## Correction and disposition

The earlier report's exact-head wording was an overstatement. This amendment is the controlling classification. No branch, PR, theory, BEDROCK, paper, or scheduler state was changed by this correction.
