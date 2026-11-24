# Mysearch: dedicated Nathan Direct interactive fast-lane implementation plan

**Status:** IMPLEMENTATION SCAFFOLD / NOT YET DEPLOYED OR VALIDATED  
**Date:** 2026-11-20  
**Owner / priority:** Nathan Direct request; P1 operational priority  
**Repository:** Satobloc/HsH

## Purpose

Build a separately addressable Mysearch ingress and execution path for direct Nathan requests, independent of the four mutable Mersearch compatibility lanes. Keep stable Mersearch 1.0 and its three-repository search semantics as the initial engine. Do not promote or silently substitute the 1.1 index prototype until its multi-repository, profile-isolation, result-parity, concurrency, and latency gates pass.

## Non-negotiable behavior

1. **Priority:** Direct Nathan submissions enter Mysearch and are not placed behind ordinary Mersearch work. The service may interrupt or displace lower-priority Mysearch work if Nathan explicitly invokes it; displaced requests must not be silently lost.
2. **Preemption and collision policy:** Nathan has authorized priority even where disruption occurs. Mysearch may interrupt active work when a direct Nathan request arrives. Before enabling destructive cancellation, the implementation must preserve the active request's logs, run metadata, temporary outputs, and exact last-known stage whenever feasible. If safe checkpointing is unavailable, the status must record the interruption and the request must remain recoverable/re-runnable; cleanup is an explicit recovery action, not hidden data loss.
3. **Isolation:** A separate workflow file, request ingress path, and concurrency group. One active fast-lane search initially. Ordinary Mersearch lanes cannot occupy this slot.
4. **Engine parity:** Stable 1.0, pinned ref `mersearch-stable-1.0`, initially; all three permitted repositories remain in scope: HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES. Preserve existing exclusions, privacy boundaries, query semantics, provenance, source commit SHAs and compact receipt rules.
5. **Immediate acknowledgement:** Every submission gets an immutable request ID and a status receipt before runner allocation. Expose state, queue position (or explicit active/runner-wait status), timestamp of acceptance, observed_at, and each blocking request's submitted_at and last_transition_at. Store canonical UTC; render all Nathan-facing times in America/New_York (ET).
6. **No false status:** Distinguish runner wait, checkout/materialization, search, packaging, publishing, complete, failed, cancelled, preempted, and recovery-needed. COMPLETE requires durable manifest and receipt readback plus checksum agreement.
7. **Overflow:** Explicit route to ordinary Mersearch lanes only with a user-visible overflow disposition. Never label overflow as Mysearch execution.
8. **No silent pending loss:** Immutable request records and append-only event history. Mutable request files may be compatibility adapters only.

## Clone-observability specification (required by BEDROCK ND-2026-11-20-01)

This process accesses/provisions repository-bearing environments in HsH, Glass (SAT archive), HSH_RESOURCES, and the stable Mersearch runtime checkout. Every checkout step must emit a deduplicated event containing repository, workflow/run/attempt/job/step, action/ref/depth, checkout SHA where available, timestamp precision, and environment identity. At run end publish per-repository confirmed checkout/materialization counts, possible/unknown events, confirmed non-clone operations, and Traffic attribution state. Checkout events must not be represented as observed GitHub Traffic clones. Traffic clone and unique-cloner observations are separate repository/window snapshots and must be reported only when actually retrieved. Append to the existing clone ledger or its approved publisher path; do not create a competing ledger. Missing telemetry is UNKNOWN, never zero.

## Implementation sequence

### M0: Isolated ingress and single-flight runner
- Add a Mysearch request schema and dedicated workflow on explicit dispatch / request event.
- Generate immutable request IDs, query digest, timestamps, request state and per-request output directory.
- Use a dedicated concurrency group with one active slot.
- For the first safe release, avoid automatic cancellation of an active request. Implement the event/receipt/preemption metadata first; turn on Nathan-authorized disruptive preemption only after a checkpoint/recovery test demonstrates that request state and outputs survive interruption.
- Build a status and receipt artifact from the run itself. Add durable append-only event history. A single mutable JSON file is not a multi-writer queue.
- Reject or explicitly supersede duplicate request IDs; never overwrite a different live request.

### M1: Result publication and source verification
- Reuse the stable 1.0 search script and the bridge's bounded compact receipt publisher.
- Retain raw result files only in the permitted job workspace; do not publish raw excerpts or private HSH_RESOURCES material.
- Include the three source repository commit SHAs, engine ref/commit, script/runtime digests, query digest, exclusions, result totals, exact output digests, and publication/readback verification.
- Include a final status path and queue/timing receipt; preserve UTC timestamps and ET rendering metadata.

### M2: Central lifecycle queue and fair displaced-work handling
- Replace mutable lane files as authoritative state with an append-only event store and transactional/compare-and-swap transitions.
- Support SUBMITTED, QUEUED, CLAIMED, RUNNING, PACKAGING, PUBLISHING, COMPLETE, FAILED, CANCELLED, PREEMPTED, RECOVERY_NEEDED and EXPIRED.
- On Nathan's direct invocation, assign priority immediately; active lower-priority work may be preempted as authorized, with a recoverable tombstone and displaced-work requeue record. Preserve original submission time and attempt lineage.
- Queue receipts include per-request submission and transition timestamps for every request ahead, class position, global scheduling context, observed_at, and timezone.
- Do not claim a completion-time estimate until measured latency distributions exist.

### M3: Indexed engine promotion gate
- Extend 1.1 immutable SQLite/FTS from HsH-only to all three allowed repositories and explicit access-controlled corpus profiles.
- Validate source commit provenance, exclusions at build and query time, result parity against stable 1.0, complete result totals, eight mixed readers including the interactive lane during rebuild, old-generation availability, failure retention, and real-corpus p50/p95 latency.
- No primary traffic cutover before all gates pass.

## Acceptance tests

- A direct Nathan request receives an ID, acceptance timestamp and status before a runner starts.
- Fast lane runs independently of all four ordinary bridge lanes.
- Ordinary submissions cannot displace a direct Nathan request.
- A direct Nathan request can preempt active lower-priority Mysearch work only after a recovery record is durably written; if interrupted, displaced work has a visible recoverable state and attempt lineage.
- One active fast-lane request maximum; overflow is explicit.
- Queue timestamps are correct, UTC canonical, America/New_York rendered for Nathan, and stable across retries and reprioritization.
- Three-repository coverage, exclusions, source SHAs and result parity are verified.
- Each repository checkout is counted once per run/attempt/job/step; API/file fetches are not inflated into clones; Traffic attribution remains UNKNOWN without a Traffic observation.
- COMPLETE requires independently readable receipt and manifest with digest agreement.

## Current blockers and known state

- Four standard Mersearch request lanes exist and are occupied; lane 2 contains request `perceptual-nexus-early-archive-20261120-01`. Do not overwrite or reuse it.
- The lane-2 run `44818799476` was observed IN_PROGRESS as of the latest read. No result receipt was verified.
- Mersearch 1.1 is an HsH-only 3 MB CI prototype; not a validated three-repository service.
- No durable central queue/status ledger is deployed.
- This plan does not modify existing Mersearch lane files, stable engine refs, shared scheduler tasks or unrelated workflows.

## Definition of done

Mysearch is operational only when a Nathan Direct request can be submitted into the independent ingress, gets an immediate durable status/queue receipt, runs the same validated three-repository search with auditable provenance, reports clone/materialization/Traffic/unique-cloner quantities separately, and returns a result whose manifest and compact receipt pass independent readback. Until then its state must be reported as scaffold, prototype, or blocked, never deployed.


## Validation correction | 2026-11-20

The dedicated workflow and status files were independently read after commit. Source inspection found two material scaffold limitations: (1) GitHub `workflow_dispatch` and concurrency do not implement a durable pre-runner request queue, immediate queue position, or ordered timestamps for requests ahead; (2) the workflow records checkout SHA observations in a temporary file but does not emit complete per-checkout run/job/step/ref/depth/timestamp identities to, or append them to, the canonical clone ledger. These gaps are explicit blockers to production status. Also, a `completed_at_utc` value is created before publication completes; treat it as search/manifest preparation time rather than overall request completion until corrected. No Actions run has been started for this new workflow.
