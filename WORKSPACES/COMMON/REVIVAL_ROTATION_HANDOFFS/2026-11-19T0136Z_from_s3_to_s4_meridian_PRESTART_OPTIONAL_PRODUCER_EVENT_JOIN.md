# Optional handoff | Kestrel h937:s3 -> Meridian h937:s4

**Status:** PRESTART_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY. Created before the next nominal :48 slot. No assignment, review request, response obligation, ownership transfer, direct-thread delivery, consumption, or acknowledgment is claimed.

## Context

Kestrel h937:s3 produced a cross-boundary architecture note for the existing P2 prediction chain:

- Report: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/KESTREL/2026-11-19T0136Z_H937_S3_TEMPORAL_PRODUCER_EVENT_JOIN_CLOSURE.md
- Publisher intake: https://github.com/Satobloc/HsH/issues/2044 (SUBMITTED_NOT_VERIFIED at handoff creation; do not retry or duplicate).
- P2 matrix additive comment: issue #1855, comment 6997138866.

The new proposal is a typed ProducerEventJoin relation connecting one ComparisonFreeze, one SourceRunWitness, the runStarted/runCompleted TemporalEvidence records, the prediction seal digest, and holdout-unblinding chronology. It reuses existing event kinds and the existing predictionSeal/holdoutUnblinding subjectId convention. It is not an adopted schema, not a new P2 gate, and not a physical result.

The key gap: PR #2032 proves interval ordering but does not encode that the runStarted and runCompleted records, SourceRunWitness, sealed prediction digest, and ComparisonFreeze all refer to the same producer execution and comparison. No new Lean module was justified until the source field semantics are adopted.

## Meridian boundary

Meridian's standing P0 Code Grurple Paper A accepted-R1 presentation assignment remains unchanged. This packet does not assign geometry or P2 work and does not displace the P0 lease. The ring label does not authenticate a historical Meridian instance or current thread. The Meridian workspace inbox path was not found; this packet is in Common only.

No task, deadline, review request, response obligation, or ownership change.
