# Typed execution identity for the Track A composition map

**Date:** 2026-11-15  
**Scope:** operational evidence and workflow architecture; no physical H(s)H claim.  
**Status:** additive proposal correcting an earlier assistant-reconstructed composition key. Not implemented in the POC, adapter, PR, or production.

## Finding

The earlier flat key, K = (eventId, leaseId, threadId, seedVersion, candidateFreezeId, attemptId), is both under-specified and over-constrained. It mixes identity namespaces, omits the provider-exposed run ID, treats an unexposed attempt ID as though it were an available join field, and requires candidate-specific fields even for ordinary run-level joins.

## Live counterexample

A live automation observation contained a configured conversation target, a current run ID, and a current run-level chat_ref of null. The task-level cached latest_result belonged to a different completed run and carried a chat_ref matching the configured target.

The exact join check found:

- last_run.id != latest_result.run_id
- current last_run.chat_ref == null
- configured target equals the cached prior result's chat_ref.id

Therefore the cached result is PRIOR_RUN_ONLY, and the current run is UNBOUND_TO_THREAD. A configured target or stale cached result cannot establish the current run's thread binding.

## Corrected typed keys

- SlotKey = (taskId, scheduledFor, phase): nominal scheduling identity.
- RunKey = (executionNamespace, taskId, providerRunId): exact provider execution identity.
- AttemptKey = (executionNamespace, providerAttemptId): optional only when actually exposed; otherwise UNEXPOSED. A run ID is not an attempt ID.
- ConfiguredTargetKey = (taskId, configuredConversationId): intended destination only.
- ObservedThreadKey = (providerRunId, chatRefType, chatRefId): construct only from a non-null current-run chat_ref.
- CandidateKey = (seedVersion, candidateFreezeId): candidate-specific scope, not a universal run key.
- PublisherKey = (publisherNamespace, publisherRunId, issueOpenedEventId, submissionId): publisher execution and event identity.
- ArtifactKey = (digestAlgorithm, digest): immutable artifact identity.
- DeliveryKey = (targetThreadKey, artifactKey, acknowledgmentId): delivery evidence.

Generic eventId must be namespace-qualified. taskId and leaseId remain distinct unless a source-defined mapping establishes their equivalence.

## Partial composition conditions

1. SlotKey to RunKey requires matching task ID and scheduled time; a nominal slot is not a provider run.
2. RunKey to SourceRunWitness requires exact execution namespace, task ID, and provider run ID.
3. RunKey to ObservedThreadKey is permitted only from the current run's non-null chat_ref; configured target metadata is not evidence of execution binding.
4. RunKey to CachedResult is permitted only when latest_result.run_id == last_run.id; otherwise classify STALE_RESULT_UNBOUND.
5. Attempt identity is separate and optional. Do not infer it from run IDs, timestamp movement, or status transitions. See [issue #1791](https://github.com/Satobloc/HsH/issues/1791), which formalizes the non-identifiability of hidden attempt assignments from the exposed snapshots.
6. CandidateKey is required only for candidate-specific checks and receipts.
7. Publisher run/event identities are not automation run identities. Publication and delivery require their own run, event, digest, recipient, and acknowledgment evidence.
8. Missing or mismatched keys yield UNBOUND or UNRESOLVED, never an inferred join.

## Relation to existing work

- [Issue #1414](https://github.com/Satobloc/HsH/issues/1414) already covers the ThreadState/OutputReceipt scope-binding gap. This report does not repeat that finding.
- [Issue #1791](https://github.com/Satobloc/HsH/issues/1791) covers provider run identity versus hidden attempt identity. This report applies that distinction to the cross-prototype execution-envelope composition map and adds the configured-target/current-run/cached-result separation.
- Elias h856:s4 proposed the earlier flat key. This is an additive correction to that proposal.
- PR #951 remains OPEN / DRAFT / UNMERGED; Track B ELIAS-2224 remains pending. No POC, PR, adapter, or production change was made.

## Limits

No Lean run was performed: local Lean, Lake, and Elan are absent, and the independent Track B disposition required before PR changes remains pending. The typed schema is still a proposal, not a source-defined implementation. Formalization must follow source-defined types and authorized Track B disposition.

No physical system, measured dataset, physical calculation, fit, prediction, independent measurement, or theory promotion is claimed. No direct cross-thread delivery, worker participation, or acknowledgment is claimed. This is an evidence-composition correction, not a claim of scheduler/backend failure.
