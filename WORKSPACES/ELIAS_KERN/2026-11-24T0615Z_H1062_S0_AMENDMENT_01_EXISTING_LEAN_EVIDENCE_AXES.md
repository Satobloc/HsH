# Amendment 01 | Existing Lean evidence axes recovered after h1062 publication

**Parent report:** h1062:s0 Switchboard source fidelity and evidence-channel transfer test  
**Parent publisher issue:** [#2474](https://github.com/Satobloc/HsH/issues/2474)  
**Purpose:** correct the report's proposed evidence-vector framing after locating already-existing Lean formalizations in PRs #951 and #742. The original source-fidelity findings and method-level transfer test remain unchanged.

## 1. Existing four-axis formalization

PR [#951](https://github.com/Satobloc/HsH/pull/951) already contains HsHVerification.EliasReceiptEvidenceAxes.lean. Its typed vector is:

1. sourceContent
2. formalProof
3. publisherReadback
4. historicalChatDelivery

The module proves that repository evidence can be verified while historical chat delivery remains unavailable, and that changing one axis preserves the others. This is directly aligned with the no-cross-thread-delivery rule.

**Actual Lean run:** [#42658236405](https://github.com/Satobloc/HsH/actions/runs/42658236405), pull_request event associated with PR head f9fa0aad45408ab06e5430c834530854746235f0; workflow completed SUCCESS. The build log's checked-out merge ref is 5df7c1600d4e9f93885d8a7b8d13e8d16cbb1209. Lean 4.34.0 / Lake 5.0.0; build completed 8,961 jobs. The theorem-specific axiom output shows [propext] for several equivalence/record-update theorems; observed0700_historical_chat_delivery_unavailable has no axioms. Tests, lint, leanchecker, nanoda and the global axiom audit were skipped.

## 2. Existing source-revision coherence formalization

PR [#742](https://github.com/Satobloc/HsH/pull/742) contains HsHVerification.EliasCheckRevisionCoherence.lean. It models the three legacy checks with a source-revision field and proves that the legacy pass predicate ignores revision changes and can pass a mixed-revision bundle.

**Actual Lean run:** [#44968984040](https://github.com/Satobloc/HsH/actions/runs/44968984040), pull_request event associated with PR head 40f4632f9b2d06b76042e8c27d76e221de5b9b39; workflow completed SUCCESS. The build log's checked-out merge ref is 83109014ae7b2f81ac4e120a422da2ea6fb98ed5. Lean 4.34.0 / Lake 5.0.0; build completed 8,946 jobs. All three theorems in EliasCheckRevisionCoherence report no axioms. Tests, lint, leanchecker, nanoda and the global axiom audit were skipped.

PR #951 also contains EliasPublisherStatus and EliasPublisherKeyEvidence. Those modules distinguish Actions job success, publisher validation outcome, required payload keys and committed artifact readback. They reinforce that these are separate evidence events, not interchangeable pass flags.

## 3. Corrected synthesis

The original h1062 report's candidate four-axis list (source, semantic adjudication, formalization, publication) is not a new schema. It overlaps with the existing PR #951 vector but would incorrectly replace historicalChatDelivery.

For the Hale #741 / PR #740 transfer case, preserve the existing four axes and add a fifth:

- sourceContent
- semanticAdjudication
- formalProof
- publisherReadback
- historicalChatDelivery

The Hale case is: source/data identified; alternate semantic key unadjudicated; encoded Lean proposition compiled; report published/read back; no historical-thread delivery established. The semantic axis is missing from the existing four-axis module. It should be added only through the existing ELIAS-2224 Track B disposition and a source-reviewed contract, not by creating a duplicate vector.

The Python POC's apply_checks method remains unchanged: it accepts arbitrary dictionary keys but has no typed lifecycle for these five axes and reduces its three fixed check statuses to checked_pass/checked_fail. The h1062 method-level replay remains a reproduction of the known unresolved/fail collapse (#714), not a new root cause.

## 4. Limits and non-actions

Lean checks only the formalized statements. It does not prove the Python implementation equivalent to the Lean model, authenticate source attribution, adjudicate the alternate semantic key, validate GitHub publication, establish historical-thread delivery, or establish physical truth. The PR runs were successful builds; tests/lint/global axiom audits were skipped.

No new Lean module, PR, POC patch, adapter, production change, task/queue change, paper-gate advancement, or theory promotion was made. PRs #951 and #742 remain open/draft/unmerged. ELIAS-2224 remains pending.

**Next cursor:** preserve the existing four-axis model; await ELIAS-2224; if its disposition permits, define the fifth semanticAdjudication axis with source identity, revision, reviewer, rubric, event and explicit pending/accepted/rejected statuses. Do not duplicate the existing evidence-vector module.
