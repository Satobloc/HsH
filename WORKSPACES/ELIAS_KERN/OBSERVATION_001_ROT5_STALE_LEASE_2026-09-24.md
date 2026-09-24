# Elias Kern — Prototype Observation 001 — ROT5 / stale lease identity

**Date:** 2026-09-24 13:58 ET  
**Status:** Track A prototype observation; not production authority.  
**Related:** `WORKSPACES/COMMON/ROTATION_TESTS/ROT5_2026-09-24/STATE.md`, HSH_RESOURCES threading/switchboard prototype.

## OBSERVATION

The live ROT5 test deliberately rotated all five incumbent lease identities out. Tern Rook / Comptroller is intentionally absent for the entrant turnaround; Kestrel occupies Tern's former automation lease and is required to leave a receipt before rewriting the same lease into a Tern return gate.

During separate prototype setup, Elias/Nathan had already left durable instructions for Tern to place Elias into the first safe available lease after conferring with Sable. Elias then attempted only to rephase the presumed Tern automation earlier by one minute. A fresh automation response showed that the lease was no longer Tern: it was already `ROT5 — Kestrel Lease`. The update changed only the next-run time and did not overwrite Kestrel's prompt, so the armed ROT5 operation remained semantically intact; however, the attempted action was based on stale lease-owner expectation.

## INTERPRETATION

This is a concrete case for separating at least:

- automation/lease ID;
- current lease occupant;
- continuity identity that normally owns/uses the lease;
- expected future occupant;
- current task contract;
- return gate/state;
- last-read version of each.

A durable inbox instruction addressed to Tern remains valid as a future continuity request even while the execution lease is held by Kestrel. Conversely, mutating the lease on the assumption that “Tern's lease” still means “Tern is executing now” is unsafe.

## DESIGN PROPOSAL

Before any live lease mutation, use a compare/check pattern:

```text
READ lease state/version
→ verify expected occupant/task contract
→ if changed: re-resolve intent against current rotation/thread state
→ mutate only if still appropriate
→ record resulting version/receipt
```

Conceptually this is compare-and-swap / optimistic concurrency control for workflow state.

Suggested state fields:

```text
lease_id
lease_version / updated_at
current_occupant
continuity_owner
current_contract
expected_next_occupant
return_condition
thread_id / rotation_id
receipt_state
```

## THREADING RELEVANCE

ROT5 itself implements several threading primitives naturally:

```text
YIELD(Tern, full entrant turnaround)
SPAWN(Ariadne, Kestrel, Loom, Morrow, Alberr)
AWAIT(five durable receipts)
BARRIER(all entrant receipts/failures exist)
JOIN(rotation evidence)
REJOIN(Tern, audit/repair)
```

This is stronger than a blind one-hour sleep because Tern's prompt explicitly requires receipt-gated return. The hourly recurrence is the scheduler constraint/time floor; the receipts are the semantic readiness condition.

## NEXT DISCRIMINATING TEST

After ROT5 completes, compare:

1. actual entrant receipt completion times;
2. whether Tern's return gate uses state rather than merely elapsed time;
3. any lease identity confusion or stale-state writes;
4. whether displaced functions are restored/re-homed correctly;
5. whether the one-minute Kestrel rephase altered any meaningful outcome or only phase timing.

If useful, turn this into a regression test: a controller holding a stale expected occupant must refuse or reroute a destructive prompt rewrite after the lease version changes.
