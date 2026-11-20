# Mysearch — Nathan Direct Personal Search Platform

**Status:** implementation branch; parallel service design.
**Relationship:** independent instance alongside Mersearch, initially reusing the exact pinned \`mersearch-stable-1.0\` engine. Mysearch is not a divergent search-semantics fork.

## Purpose and search equivalence

Mysearch serves Nathan Direct interactive archive requests first. It may also accept worker requests explicitly marked expedited. Mersearch remains the ordinary/batch and overflow service.

Initial searches cover exactly:
- \`Satobloc/SAT_THEORY_ARCHIVE_2023-25\`
- \`Satobloc/HsH\`
- \`Satobloc/HSH_RESOURCES\`

The runner checks out the same pinned \`mersearch-stable-1.0\` and uses the same query parser, exclusions, three-root search behavior and provenance manifest. No indexed 1.1 backend is enabled until its multi-root coverage, equivalence, privacy and performance gates pass.

## Queue and event model

The queue has three classes: \`nathan_direct\` (highest), \`mysearch_expedited\`, and \`mersearch_batch\`. SQLite WAL is the first local transactional prototype. Production must use persistent volume or managed transactional storage; GitHub Actions runner disks are ephemeral and cannot be represented as durable queue storage.

Each immutable request ID has an append-only event history: submitted, queued, claimed, running, heartbeat, checkpoint, preempt requested, yielded, retried, packaging, publishing and terminal state. Immediate receipts contain status, class position, requests ahead, each request's submission and latest-event timestamp, and snapshot observation timestamp.

UTC is canonical. Human-facing timestamps for Nathan use \`America/New_York\`, with ET/EST/EDT rendered by the timezone database.

## Cooperative preemption

A direct Nathan request sets a durable preemption signal. Workers inspect it at defined safe checkpoints. A running search:
1. completes the current safe unit;
2. persists checkpoint and event;
3. releases its lease;
4. moves to the Mysearch expedited queue or hands off to an elevated Mersearch overflow class;
5. allows Nathan Direct to run.

Only after acknowledgement may the orchestrator stop the runner. GitHub Actions \`cancel-in-progress\` is not the preemption mechanism.

The initial pinned searcher is not demonstrated to support interruption mid-scan. First safe points are between checkout, search, packaging and publication. True mid-scan checkpointing requires a tested Core adaptation. Status must disclose this limitation rather than call a stage-boundary yield instantaneous.

## Work transfer and fairness

Mysearch-expedited worker requests displaced by Nathan Direct remain priority-eligible. Transfer preserves request ID, original submission time, prior queue events, checkpoint, attempt count, source profile and query digest. They are placed into a dedicated expedited Mersearch class, ahead of ordinary Mersearch batch work but behind Nathan Direct requests. They are never silently demoted to ordinary batch or discarded.

Ordinary Mersearch work does not automatically enter Mysearch or get promoted. Explicit opt-in only.

## Privacy and results

Other workers' requests are shown to Nathan only as opaque identifiers and bounded queue metadata. Do not expose their query text, private paths, excerpts or restricted corpus details. Full result payloads stay in the approved private result channel; public HsH receipt containment is unchanged.

## Operations

Mysearch has its own request ingress, database, workflow concurrency group, event history and result namespace \`indexes/mysearch_requests/<request_id>/\`. Existing Mersearch lanes and active request files are not overwritten. Dedicated worker concurrency is one active search initially.

The eventual direct-chat integration must submit synchronously to Mysearch and return a receipt before runner allocation. A repository file edit alone is not a direct-chat submission integration.

## Rollout gates

1. Queue unit tests and syntax/CI checks.
2. Dedicated ingress/workflow on an isolated branch.
3. Persistent queue storage and authenticated status endpoint.
4. Three-repository stable 1.0 execution and manifest parity.
5. Stage-level timing and timeout/lease recovery.
6. Cooperative yield/requeue with identity-preserving Mersearch overflow.
7. Private output delivery and access-control verification.
8. p50/p95 latency and eight-reader load tests.
9. Enable direct-chat interactive traffic only after all required gates pass.
