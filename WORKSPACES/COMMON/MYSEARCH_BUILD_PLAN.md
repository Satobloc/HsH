# Mysearch Build Plan

**Priority:** Nathan Direct expedited build authorization, 2026-11-20.
**Signature:** `--NM 20NOV26 [OWL]`

## Required components
- Separate Mysearch service identity, code path, queue, supervisor, workflow group and result namespace.
- Priority classes: Nathan Direct, explicitly expedited worker work, Mersearch expedited handoff, ordinary Mersearch batch.
- Durable event ledger and immediate queue receipts listing every request ahead, each submission/latest-event timestamp, and Eastern-time rendering.
- Absolute Nathan Direct priority with immediate worker termination; no checkpoint is required before interruption.
- At-least-once handoff outbox to Mersearch expedited service; immutable request IDs make transfer idempotent.
- Initial search execution matches pinned stable Mersearch 1.0 and all three permitted source roots.
- Request-specific scratch directories, partial-output quarantine, cleanup/reconciliation.
- Indexed service only after equivalence, coverage, privacy and concurrency tests.

## Build constraints
- No claim of durability from Actions runner-local SQLite.
- Worker expedited admission requires explicit interruption-risk consent; Nathan Direct priority is authenticated by the chat integration, never self-declared by a submitter.
- An interrupt request is not confirmed termination; expose both states distinctly.
- Terminated workers may lose uncheckpointed work. This risk is accepted by non-Nathan Mysearch submitters, who are responsible for precautions and cleanup.
- Never share mutable working/output files between requests.
- No repurposing or overwriting active Mersearch request lanes.
- Preserve expedited class, original submission timestamp, request ID and event history during transfer.
- Direct chat submission must synchronously create a Mysearch request and return its receipt.
- Preserve public-result containment; private results use an authorized private delivery route.

## Current state
The branch contains a transactional queue prototype, forced-interruption state, handoff outbox, queue and compact-receipt tests, a pinned three-repository runner, provenance manifest, and redacted compact receipt path. The runner publishes only the manifest and redacted compact receipt, not full excerpts. It is a manually dispatched execution harness, not a production-priority service. A process supervisor, persistent multi-runner database, Mersearch handoff receiver, authenticated direct-chat integration, private full-results delivery adapter, and production service are not yet deployed or verified.

--NM 20NOV26 [OWL]
