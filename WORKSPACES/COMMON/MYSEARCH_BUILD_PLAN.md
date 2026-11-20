# Mysearch Build Plan

**Priority:** Nathan Direct expedited build authorization, 2026-11-20.
**Signature:** \`--NM 20NOV26 [OWL]\`

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
- An interrupt request is not confirmed termination; expose both states distinctly.
- Terminated workers may lose uncheckpointed work. This risk is accepted by non-Nathan Mysearch submitters, who are responsible for precautions and cleanup.
- Never share mutable working/output files between requests.
- No repurposing or overwriting active Mersearch request lanes.
- Preserve expedited class, original submission timestamp, request ID and event history during transfer.
- Direct chat submission must synchronously create a Mysearch request and return its receipt.
- Preserve public-result containment; private results use an authorized private delivery route.

## Current state
The branch contains a transactional queue prototype, forced-interruption state, handoff outbox, tests, and architecture/user contract. A process supervisor, persistent multi-runner database, Mersearch handoff receiver, direct-chat integration, and production service are not yet deployed or verified.

--NM 20NOV26 [OWL]
