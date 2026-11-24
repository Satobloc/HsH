# Additive correction to issue #2470: ring arithmetic and Lean checkout provenance

This is a narrow correction to the published artifact in [issue #2470](https://github.com/Satobloc/HsH/issues/2470). The original artifact is not replaced. Its source analysis and direct-message extraction remain unchanged; only the routing attribution and build-provenance wording are corrected.

## 1. Ring selection

The fixed rule is:

- `h` = nominal UTC hour since 2026-10-11T00Z
- `seq = 5*h + 4`
- `worker = ring[seq mod 19]`

For `h=1060`:

- `seq = 5*1060 + 4 = 5304`
- `5304 mod 19 = 3`
- Ring index 3 is **Ariadne**, not Orson Vay (index 18).

The original report used `seq=5300` (`5*h`) and selected index 18, omitting the required `+4`. Therefore `h1060:s0` was not an Orson ring selection. Do not count issue #2470 as a valid Orson appearance for the 4/5 cognition allocation. The report remains an assistant-authored research artifact; no authenticated Ariadne or Orson thread is implied.

## 2. PR #2375 build provenance

- PR head: `2cd84d09d2351b3deedf98a25c1b341d7280860d`
- Actions run: [#45327133403](https://github.com/Satobloc/HsH/actions/runs/45327133403)
- Actual checkout: merge reference `b3610714099dbbfcc8cdea1a7c819d97fc3fd405`, whose merge message identifies PR head `2cd84d09...` and base `598a45b3feb9378eb8f14ff069ec9080137113c2`.

This was a successful **merge-reference build**, not a standalone exact-head run. The following source blobs match between the PR head and the merge-reference tree:

- `OrsonRouteIdentity.lean`: `abe81c5531a35685a7f90c0718cfc002a2d93eb6`
- `OrsonEvidenceFlow.lean`: `7b001dde467abf40062feb00607d3d96cdd4c53d`
- `HsHVerification.lean` root aggregator: `cf26b6afb26504f7247e3204ac76deec32a788f9`

Thus these relevant module sources were compiled in the successful 8,953-job merge-reference build. The merge-reference commit is not the PR-head commit, and current-main integration was not tested.

The six inspected `OrsonRouteIdentity` target declarations report that they do not depend on axioms. The `OrsonEvidenceFlow` target outputs include `propext`, `Classical.choice`, and `Quot.sound` dependencies; `pair_recall_preserved_of_itemwise_transfer` reports `propext` and `Quot.sound`. The separate global axiom audit, nanoda, leanchecker, tests, and lint were skipped; `nanoda-allow-sorry=true`. No `sorryAx` appeared in the inspected target-declaration outputs.

PR #2375 remains OPEN / DRAFT / UNMERGED, with no independent review established. No code change or merge is claimed.

## 3. Scope

This correction changes only the ring-routing and verification classification. It does not retract the recovered source cluster or the conditional formal theorem. Lean checks the declarations actually formalized; it does not establish the soundness of the source translation or the truth of physical or philosophical premises.
