# Mysearch Build Plan

**Priority:** Nathan Direct expedited build authorization, 2026-11-20.
**Signature:** \`--NM 20NOV26 [OWL]\`

## Required components
- Separate Mysearch service identity, code path, queue, workflow group and result namespace.
- Queue classes: Nathan Direct, explicitly expedited workers, ordinary Mersearch.
- Durable event ledger with event timestamps; instant status receipt listing all work ahead and Eastern-time presentation.
- Cooperative preemption, checkpoint/yield, resumable requeue and expedited Mersearch overflow.
- Initial search execution matches pinned stable Mersearch 1.0 and all three permitted source roots.
- Indexed service only after equivalence, coverage, privacy and concurrency tests.

## Build constraints
- No claim of durability from Actions runner-local SQLite.
- No hard cancellation before a durable checkpoint and yield acknowledgement.
- Stable 1.0 is not demonstrated to interrupt mid-scan; first implementation may yield at workflow-stage boundaries.
- No repurposing or overwriting active Mersearch request lanes.
- Preserve expedited class, original submission timestamp, request ID and event history during transfer.
- Direct chat submission must eventually synchronously create a Mysearch request and return its receipt.
- Preserve public-result containment; private results use an authorized private delivery route.

## Current state
This branch contains the initial queue-engine prototype, tests, and architecture. It does not yet constitute a deployed service, durable multi-runner queue, direct-chat integration, or verified preemptible search engine.

--NM 20NOV26 [OWL]
