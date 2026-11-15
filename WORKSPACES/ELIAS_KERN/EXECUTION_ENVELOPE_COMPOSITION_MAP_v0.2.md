# Track A execution-envelope composition map v0.2

**Status:** ASSISTANT RECONSTRUCTION / SOURCE-GROUNDED PROPOSAL / NOT IMPLEMENTED  
**Date:** 2026-11-15  
**Scope:** Elias Kern Track A workflow-switchboard and Threading prototype evidence. This is an operational identity map, not H(s)H theory or a physical model.

## 1. Correction to the earlier flat key

Elias h856:s4 proposed a single flat composition key:

K = (eventId, leaseId, threadId, seedVersion, candidateFreezeId, attemptId)

That proposal is useful as a list of candidate identity dimensions, but it is not yet a valid universal join key.

It is **under-specified** because it omits the provider-exposed run ID and does not namespace event, lease, or attempt identifiers.

It is **over-constrained** because attempt identity is not necessarily exposed and candidate-specific fields are not present or applicable to every execution record.

It also conflates an intended conversation destination with an observed run-to-thread binding. The live h860:s3 automation record supplies a counterexample: task configuration contains a conversation target, while the current run's chat_ref is null; the task-level cached latest_result belongs to a different completed run and carries a chat_ref matching the configured target.

The correction is to use typed, namespace-qualified keys and partial composition maps. Do not require every dimension on every record.

## 2. Typed identity layers

### Selection and schedule

- **SelectionKey** = (rotationVersion, nominalHour, phase, sequence, ringIndex, ringLabel). This identifies a deterministic rotation selection, not an authenticated worker.
- **SlotKey** = (taskId, scheduledFor, phase). This identifies a nominal scheduled slot.
- **TaskConfigKey** = (taskId). Configuration fields such as configuredConversationId describe intended routing, not observed execution.

Keep taskId and leaseId distinct unless a source-defined mapping explicitly equates them.

### Provider execution

- **RunKey** = (executionNamespace, taskId, providerRunId). This is the exact provider execution identity.
- **AttemptKey** = (executionNamespace, providerAttemptId). This is optional and exists only when the provider actually exposes an attempt identifier. Otherwise record ATTEMPT_UNEXPOSED.
- **CachedResultKey** = (resultRunId, createdAt, completedAt). A cached result remains attached to its own resultRunId.

A provider run ID is not a hidden attempt ID. Do not infer attempts from timestamp movement, status changes, or repeated observations of the same run ID.

### Thread and actor identity

- **ConfiguredTargetKey** = (taskId, configuredConversationId). This records the intended destination.
- **ObservedThreadKey** = (providerRunId, chatRefType, chatRefId). Construct it only from a non-null chat_ref on the exact current run.
- **ActorKey** = (identityNamespace, authenticatedPrincipalId). Construct it only when an authenticated principal is actually exposed.
- A ring label or OutputReceipt.worker string is a role/selection label, not an authenticated principal.

Configured target, cached-result chat_ref, current-run chat_ref, ring label, and authenticated actor are separate evidence fields.

### Candidate and source identity

- **CandidateKey** = (seedVersion, candidateFreezeId). Use only for candidate-specific checks and receipts.
- **SourceKey** = (repository, commitSha, path, blobSha).
- **SourceRunWitnessKey** = (RunKey, SourceKey, harnessDigest, commandDigest, environmentDigest, exitStatus, stdoutDigest, stderrDigest, assertionManifestDigest, executionScope).

A source-run witness is a proposed sidecar contract, not an existing POC type. It must identify the exact source and execution that produced the observed output.

### Publication and delivery identity

- **EventKey** = (eventNamespace, eventId). Never use an unqualified generic eventId across unrelated providers.
- **PublisherKey** = (publisherNamespace, publisherRunId, issueOpenedEventId, submissionId).
- **ArtifactKey** = (digestAlgorithm, digest).
- **DeliveryKey** = (targetThreadKey, artifactKey, acknowledgmentId).

Publisher execution, issue-open event, automation run, artifact identity, and recipient delivery are distinct layers.

## 3. Partial composition maps and conditions

1. **SelectionKey to SlotKey:** require the exact nominal rotation formula and scheduled phase. Selection does not authenticate the selected label.
2. **SlotKey to RunKey:** require exact taskId and scheduledFor agreement. A nominal slot is not itself a provider run.
3. **RunKey to SourceRunWitnessKey:** require exact executionNamespace, taskId, and providerRunId, plus exact source and harness identity.
4. **RunKey to ObservedThreadKey:** permit only when the current run's chat_ref is non-null and its type/id match. A configured target is not a substitute.
5. **RunKey to CachedResultKey:** permit only when latest_result.run_id equals last_run.id. Otherwise classify STALE_RESULT_UNBOUND and do not attach the cached content or chat_ref to the current run.
6. **RunKey to AttemptKey:** permit only when an attempt ID is actually exposed. Otherwise preserve ATTEMPT_UNEXPOSED. See HsH issue #1791 for the formal non-identifiability result on hidden attempt assignments.
7. **CandidateKey joins:** require exact seedVersion and candidateFreezeId only for candidate-specific operations. Do not make candidateFreezeId a universal execution key.
8. **SourceRunWitness to OutputReceipt:** require an explicit RunKey or stable SourceRunWitness reference. seedVersion alone is not a unique execution join.
9. **PublisherKey to ArtifactKey:** require the exact submission and publisher run/event identity, then independently verify the artifact digest.
10. **ArtifactKey to DeliveryKey:** require the same digest plus an actual target-thread record and acknowledgment. Publication is not delivery; delivery is not comprehension or use.

Missing or mismatched keys yield UNBOUND, STALE_RESULT_UNBOUND, or UNRESOLVED. Never repair a missing join by borrowing a value from task configuration, a stale cached result, a ring label, or a neighboring run.

## 4. Source-backed limits of the current Threading prototype

The inspected OutputReceipt fields are worker, artifact, seed_version, outcome, timestamp, and free-form metadata. ThreadState carries thread_id, seed, and receipts. add_receipt checks only receipt.seed_version against the thread seed version before appending. The free-form metadata dictionary is not a typed identity contract.

Therefore the current source does not provide a source-defined provider RunKey, authenticated ActorKey, AttemptKey, CandidateKey, artifact digest, or explicit SourceRunWitness reference on OutputReceipt. The known thread-scope limitation is already recorded in HsH issue #1414; this map does not repeat it as a new discovery.

The source does not authorize treating worker labels, task configuration, or seed-version equality as proof of actual run/thread/actor identity.

## 5. Formalization candidates and limits

The following conditional propositions are suitable for Lean once the types and source-to-record translation are adopted:

- a cached-result join exists only when resultRunId = providerRunId;
- an observed thread binding exists only when the exact current run carries a non-null chat_ref;
- equality of RunKey entails equality of execution namespace, task ID, and provider run ID;
- candidate composition requires equality of the candidate key;
- no AttemptKey can be constructed from a record whose provider schema exposes no attempt identifier.

These are proposed schema obligations, not compiled theorems. No Lean run is claimed. The local environment has no Lean, Lake, or Elan, and PR #951 remains a draft awaiting the independent Track B ELIAS-2224 disposition. Do not modify the POC, PR #951, adapter, or production before that disposition.

## 6. Status and implementation gate

This v0.2 map corrects the assistant-reconstructed h856:s4 proposal. It is not a source-authored POC schema, a production contract, a validated workflow implementation, or a theory result.

Implementation requires:
1. independent Track B disposition;
2. source-defined field names and namespaces;
3. a versioned migration/compatibility rule for existing OutputReceipt records;
4. explicit tests for stale cached results, null chat_ref, namespace collisions, candidate-key absence, and unexposed attempts;
5. Lean formalization and actual CI execution on the authorized exact source;
6. independent review and readback.

Until those gates pass, preserve the current POC unchanged and classify missing joins explicitly.
