# Threading receipt scope: seed version is not thread identity

**Date:** 2026-11-06 08:36 UTC  
**Classification:** source-grounded workflow-software QA and conditional Lean formalization. Not production behavior, an LLM cognition result, a physical calculation, or a theory result.

## 1. Finding

The Threading prototype has a `thread_id` on `ThreadState`, but its `OutputReceipt` record has no typed thread identifier. Its `add_receipt` method checks only:

```python
if receipt.seed_version != self.seed.version:
    raise ValueError("receipt seed version mismatch")
self.receipts.append(receipt)
```

The inspected internal source copy is identified by blob SHA-1 `ce313e46b1b85ae35028b46a4196d2a945b535d8`. The private source locator and code are intentionally not reproduced here.

Consequently, equal seed versions do not establish that a receipt belongs to the destination thread. The current method leaves correct receipt-to-thread routing to its caller.

## 2. Bounded source-extracted replay

A method-level replay used two distinct `ThreadState` objects (`thread-A`, `thread-B`) with the same seed version (`shared-v1`). A receipt carried free-form metadata declaring `thread_id=thread-A`.

Results:

- Thread A accepted the receipt.
- Thread B also accepted the same receipt.
- No thread-origin mismatch was raised.
- The free-form metadata did not affect acceptance.

This is a synthetic software counterexample against the prototype method, not an observed worker handoff, real ChatGPT cross-thread delivery, or production-system incident. The replay copied the relevant source fields and method; it was not a byte-identical execution of the complete Python file.

## 3. Lean 4 formalization

Added a source-conditional scope model to the existing Elias Track A formalization in PR #951:

- `sourceSeedVersionAccepts` abstracts the source's seed-version-only predicate.
- `proposedThreadScopedAccepts` adds an explicit optional origin-thread match as a design proposal.
- Seven theorem checks establish that the source-shaped predicate accepts both unscoped and foreign-thread records with a matching seed version, while the proposed predicate rejects missing/foreign scope and accepts a matching scope.

Actual GitHub Actions run **#42190662639**, job **#127801575438**:

- Lean 4.34.0; Lake 5.0.0.
- Full root build: **SUCCESS, 8,955 jobs**.
- Five `#eval` outputs: `true, true, false, false, true`.
- All seven new theorem-specific `#print axioms` outputs report **no axioms**.
- Full retrieved log: zero `sorryAx`, zero bare `admit`.
- The target module blob matches between the PR branch and the compiled merge-reference commit.

This was a synthetic pull-request merge-reference build, **not** an exact-head standalone build. Tests, lint, nanoda, and the separate automated axiom audit were skipped. Lean verifies only the encoded predicates, not the soundness of the source-to-model translation or production behavior.

## 4. Candidate interface contract, not implementation

A future receipt contract should carry a typed `origin_thread_id` or equivalent immutable thread-scope token and require an exact match with the destination `ThreadState`. Missing or foreign scope should be rejected or quarantined. Intentional cross-thread transfer should use an explicit transfer record identifying both source and target threads and its authorization.

This is a design candidate only. No Python POC change, EvidenceLedger adapter, production schema, or production workflow change was made. The independent Track B disposition remains pending.

## 5. Boundaries

- No authenticated historical Elias ChatGPT thread or literal Elias participation is claimed; this is a current-assistant, source-grounded Track A reconstruction.
- No cross-thread message delivery, consumption, or acknowledgment is claimed.
- No LLM trial, human-subject session, model call, API spend, physical calculation, H(s)H prediction, theory promotion, or paper-gate advancement occurred.
- Existing PR #951 remains draft/open/unmerged; no rebase or merge was attempted.
- Existing public issue #1326 remains the broader prior evidence-ledger report. This submission records the narrower source-specific thread-scope witness and does not resubmit #1326's content.
