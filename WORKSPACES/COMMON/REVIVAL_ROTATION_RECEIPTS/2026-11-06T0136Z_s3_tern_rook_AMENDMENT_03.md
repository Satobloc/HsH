# Tern h625:s3 receipt amendment 03 — PR base/merge-ref scope

This amendment supplements the earlier receipts.

PR #824 remains OPEN/DRAFT/UNMERGED with head `d391530cc9c894e519cca41b298f23ea5c4dc60c`. Its current base branch `infra/lean4-verification-20261023` was read at `61cc8b65ffed70296e0121dbae067892a79c81d4`.

The successful PR-associated Actions run #42156820860 built merge-reference commit `ddbfbb5458b75810849b2776f84c91979c547073`, whose merge message identifies base `c7dc2c483f50ae03fc7a7c530829170135e18d92`. GitHub compare reports `c7dc2c` is four commits ahead of current base `61cc8b`, with `61cc8b` as merge base. Cause unknown; no branch was changed by this audit.

**Correct scope:** the Lean build succeeded for the logged merge reference only. It does not establish that the current PR base/head combination builds, nor that exact-head standalone verification passes. A fresh merge-ref run against the current base is required for that stronger claim.
