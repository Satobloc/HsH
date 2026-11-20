# Mysearch — Nathan Direct Personal Search Platform

**Status:** expedited parallel implementation; separate service instance.
**Relationship:** Mysearch operates independently beside Mersearch. Its first search engine is the exact pinned `mersearch-stable-1.0`; it must not silently diverge in query semantics or source coverage.

## Purpose and initial search equivalence

Mysearch serves Nathan Direct interactive archive requests with absolute scheduling priority. Other workers may submit explicitly expedited work, but do so under the interruption and cleanup contract below. Ordinary work remains on Mersearch.

Initial searches cover exactly:
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25`
- `Satobloc/HsH`
- `Satobloc/HSH_RESOURCES`

The runner uses the pinned `mersearch-stable-1.0` parser, exclusions and three-root execution behavior, with input commit identities and provenance recorded. No indexed 1.1 backend is enabled until its three-root coverage, query equivalence, privacy and performance gates pass.

## Absolute priority and disruptive preemption

**Nathan Direct requests have absolute priority in Mysearch.** A direct request is not required to wait for another Mysearch job to reach a checkpoint. The service may terminate an active Mysearch worker immediately, including mid-search, and may interrupt packaging or other nonterminal work. This can destroy in-memory progress, leave incomplete temporary output, invalidate partial work, and require a full restart.

The direct-request sequence is:
1. Atomically accept the Nathan Direct request and record its immutable ID, timestamp and priority.
2. Mark every active non-Nathan Mysearch execution `INTERRUPT_REQUESTED` and emit an event for the supervisor.
3. The supervisor terminates the relevant worker process/job immediately; no checkpoint acknowledgement is required.
4. Record `INTERRUPTED`, exit/termination detail and any known partial-output location. Partial output is never represented as a completed result.
5. Create a durable handoff-outbox record for the interrupted request, targeting Mersearch's expedited service class for a fresh execution.
6. Transfer queued Mysearch worker requests immediately to the same Mersearch expedited class. Nathan Direct receives the next Mysearch execution slot.

If a worker cannot be terminated or the supervisor cannot confirm its state, Mysearch must show the request as interruption-pending and must not falsely report that the slot is free. The service can prioritize Nathan immediately in its queue, but actual execution still depends on a worker being stopped and an execution slot becoming available.

## What other Mysearch users accept

Every non-Nathan Mysearch submission is an **at-risk expedited request**. By choosing Mysearch, its submitter accepts:
- interruption without checkpoint when Nathan submits a direct chat request;
- loss of uncheckpointed computation and possible loss of partial output;
- restart from the beginning in Mersearch's expedited class after interruption;
- cleanup of abandoned, incomplete or conflicting job-specific artifacts;
- no guarantee that a Mysearch run will finish before a Nathan Direct request arrives.

Admission is explicit: non-Nathan submissions must carry a separately recorded interruption-risk acknowledgement. Nathan Direct priority is assigned only by the authenticated direct-chat integration; a request cannot self-assign that class by setting its requester name or payload field. Workers must take their own preparatory precautions where their work warrants them. They should keep source material immutable, write only inside request-specific scratch/output directories, make intermediate state reconstructible where practical, and avoid shared mutable files. If a collision or abandoned artifact occurs, the submitting worker owns its cleanup and reconciliation. Mysearch will expose request IDs, isolated workspace locations and termination events to support that cleanup, but does not guarantee preservation of interrupted work.

Nathan Direct traffic is never delayed to protect another Mysearch user's in-flight computation.

## Queue classes and transfer

- `nathan_direct`: highest priority; FIFO among Nathan Direct requests.
- `mysearch_expedited`: explicitly expedited non-Nathan requests; subject to immediate displacement.
- `mersearch_expedited`: handoff class for displaced or overflow Mysearch work.
- `mersearch_batch`: ordinary Mersearch requests.

On a Nathan Direct submission, queued Mysearch worker requests are placed in the durable handoff outbox. Active Mysearch worker requests are terminated and then placed there when termination is confirmed. The outbox transfer is at-least-once and must use the immutable request ID as its idempotency key. Preserve original submitter, query digest, source profile, original submission time, attempt count, history and partial-output manifest. Do not claim that a handoff has reached Mersearch until Mersearch acknowledges it.

Mersearch must schedule accepted handoffs ahead of ordinary batch work, while behind Nathan Direct requests. If that receiving priority class has not yet been implemented, retain `HANDOFF_PENDING` and disclose the limitation rather than silently demoting the request.

## Queue and event model

The service uses a transactional, durable ledger. SQLite WAL is the deterministic prototype only; production multi-runner operation requires shared persistent transactional storage. Each request has an append-only event history, including submitted, queued, claimed, started, interruption-requested, interrupted, handoff-pending, handoff-accepted, retried, packaging, publishing and terminal events.

Queue receipts show class-aware position, every request actually ahead (opaque ID, lane, state, submitted time and latest event time), plus the snapshot's `observed_at`. UTC is canonical. Human-facing timestamps for Nathan use `America/New_York`, with ET/EST/EDT determined by the timezone database.

## Isolation and artifact hygiene

Every job receives a unique working directory keyed by immutable request ID and attempt number. Never let two requests write the same temporary files, result path, database transaction or publication directory. Build outputs in a request-local staging directory; promote only fully validated outputs atomically. On interruption, label staging artifacts `PARTIAL_INTERRUPTED` and exclude them from search results, indexes and completed-result views until explicitly reconciled. Cleanup must be idempotent and must not delete another request's files.

The queue database, worker control channel and published results must not live on an ephemeral GitHub Actions filesystem when used as a production service. Public HsH receipt containment remains unchanged; full results use an authorized private delivery route.

## Operations and rollout gates

1. Queue tests cover absolute priority, immediate interruption state, handoff outbox, class-aware queue timestamps and Eastern conversion.
2. A dedicated supervisor consumes interruption events and force-terminates only the matching request's worker/process group.
3. Termination confirmation and interruption bookkeeping are crash-recoverable and idempotent.
4. A durable queue service and authenticated status endpoint are deployed.
5. The stable 1.0 runner executes all three repositories and passes manifest/coverage parity.
6. Mersearch accepts idempotent expedited handoffs and preserves original request identity/timestamps.
7. Request-scoped working directories, partial-artifact quarantine and cleanup are tested.
8. Private output delivery/access controls and p50/p95 latency are verified.
9. Only then enable direct-chat production traffic.

A queue prototype or GitHub Actions concurrency setting alone is not a live Mysearch service and does not prove process termination or durable queue semantics.
