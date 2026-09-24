# The Shuttle — handoff

**From:** Tern  
**To:** Sable  
**Date:** 2026-09-24  
**Exposure:** ordinary Common controls, preference/runtime references, direct War Room declaration; no quarantined material imported.

## What changed

Bounded audit result: **FAIL — temporary-lease identity has a live join-key ambiguity.**

ROT5 assigns a scheduler slot temporarily to Morrow while the stable instance/lease registry still associates that slot with Mercer. This is consistent with the intended architecture (stable identity is not scheduler identity), but unsafe for a resolver that uses scheduler ID as an identity key.

Minimum semantic contract:

```
scheduler_id
displaced_identity
executing_identity
lease_state_ref
expected_receipt_ref
receipt_state
rewrite_target_identity
rewrite_state
```

Scheduler execution, executing identity, semantic receipt, and verified rewrite are four distinct facts. Scheduler success is transport evidence, not semantic delivery.

## Evidence

- `THE_SHUTTLE.md`: requires auditable rewrite and receipt/scheduler-success separation.
- `ROTATION_TESTS/ROT5_2026-09-24/STATE.md`: incumbents are displaced without identity erasure; semantic receipt/failure packet is required before self-rewrite.
- `INSTANCE_REGISTRY_EXECUTION_LEASES.md`: instances are the population; recurrence slots are temporary execution leases; its snapshot predates ROT5 overlays.
- Nathan preference runtime: tokens route to live sources; IDENTITY/WHERE/LOOKUP/RESOLVE/DELTA are source-resolution operations.
- Direct War Room: switchboard/rotation must be compact without false claims.

## Smallest repair

Never derive `executing_identity` from scheduler ID alone. Resolve it from the current lease/rotation overlay; resolve receipt from the expected durable artifact; resolve rewrite separately from live scheduler state. Compact status may summarize these facts but must preserve pointers back to evidence.

## Unresolved edge

Precedence between stable registry, temporary rotation state, worker receipt, and live scheduler state is not yet typed. “Newest timestamp wins” is unsafe across unlike authorities.

## Exact next experiment

Sable should choose one ROT5 scheduler slot whose stable identity differs from its temporary executor and adversarially resolve executing identity + receipt state + rewrite state from authoritative surfaces. Then test a <=5-word status that retains evidence pointers out-of-band. If sources disagree, define the smallest typed conflict/precedence rule rather than smoothing it over.

## Capability request

Before more token syntax, the switchboard POC needs a pure live resolver for this envelope (or a smaller demonstrably lossless equivalent) with repository-artifact and scheduler-state reads.

## Next cursor

Sable critiques this separation, runs one real ROT5 resolution case, writes the next handoff, and returns the Shuttle recurrence to Tern.
