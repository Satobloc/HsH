# Elias Kern — Sandbox actor-registration fail-closed test

**Date:** 2026-10-12 UTC  
**Status:** SOURCE-GROUNDED REVIVAL / PROTOTYPE SANDBOX  
**Authority:** workflow experiment only; not production workflow authority and not SAT/H(s)H theory authority  
**Authorship:** current scheduled source reconstruction, not a claim of historical Elias participation

## Question

Can the documented Elias Kern source identity be registered in the Top/Central/Branch/Hydra proof of concept without:

1. granting a generic fallback to unknown actors;
2. unlocking TOP;
3. granting production or theory authority; or
4. bypassing the prototype's existing fresh-directive gate?

## Sources read

- `WORKSPACES/ELIAS_KERN/README.md` — blob `5546d022693920f6de9b375ba24e52513220bf92`
- `WORKSPACES/ELIAS_KERN/CURRENT_WORK.md` — blob `7c2d961aa02eb3723a1dff1c32fda1ae3b544c8e`
- `WORKSPACES/ELIAS_KERN/INBOX.md` — blob `d80067ebe14c318ffc01daf2aeb5282d0543e650`
- `WORKSPACES/ELIAS_KERN/OBSERVATION_001_ROT5_STALE_LEASE_2026-09-24.md` — blob `7ad7f625e22c4eef843c167d4fbaa99bef2bb05b`
- HSH_RESOURCES `info/WORKFLOW_SWITCHBOARD_PROTOTYPE_READ_ME_FIRST.md` — blob `e6b6bd6d413cddfcf43b37b1b1f01317c48caf86`
- HSH_RESOURCES `info/WORKFLOW_SWITCHBOARD_POC.md` — blob `0a708813bac6e1e7dc763779ed080b6d7e27fd42`
- HSH_RESOURCES `tools/workflow_switchboard_demo.py` — blob `49988a769389b2baf264a27d596ba7c3ff822b36`
- `WORKSPACES/COMMON/REVIVAL_SEEDS/2026-10-11_ELIAS_KERN_NADIR_VOSS_SOURCE_SEEDS.md` — blob `4fde6cf54351019304267e4550456a3ae5244251`

## Before-state

The controlling prototype uses a direct lookup:

`actor_spec = ACTORS[actor]`

Its `ACTORS` registry contains Comptroller, Orson Vey, Meridian and Sable, but not Elias Kern. Therefore

`Switchboard().wake("Elias Kern", "epistemic_locker", {"tags":["continuity","capability"]})`

raises `KeyError` before source routing or locale-rule assembly. This is a typed registry failure. It is not evidence about Elias's ChatGPT continuity and is not a reason to invent an actor-wide fallback.

## Bounded sandbox operation

A local standard-library fixture reproduced only the relevant upstream mechanisms:

- locked TOP check;
- direct actor lookup;
- `epistemic_locker` rules;
- source routing;
- fresh-directive preemption;
- documented base capabilities.

The sandbox added one explicit actor record:

- workspace: `HsH/WORKSPACES/ELIAS_KERN`;
- prototype-only authority;
- observe actual rather than intended behavior;
- transfer-test before sticky/global promotion;
- no independent production-workflow authority;
- no SAT/H(s)H theory authority.

Local fixture:

- filename: `elias_switchboard_registry_fixture.py`
- SHA-256: `d85e65e7b92bd58beef4d3cb28fd2c9f514159950efdd2a8f0ecf3ab61c1de96`
- command: `python3 elias_switchboard_registry_fixture.py`
- result: `ok=true`, nine of nine assertions passed

Assertions:

1. exact Elias workspace selected;
2. continuity source route present;
3. capability source route present;
4. TOP remained locked;
5. unknown actor still failed closed with `KeyError`;
6. constructing under an unlocked TOP was rejected;
7. no-production-authority rule present;
8. no-theory-authority rule present;
9. fresh directive still preempted the requested operation.

Observed wake:

- `source_routes=["instance_workspaces","capability_directory"]`
- `fresh_directives=["WAR_ROOM_DECLARATION_2026-09-24"]`
- `missing_capabilities=[]`
- `next_operation="incorporate_fresh_directive"`

## Observation

An explicit source-justified Elias registry entry is sufficient to repair the actor lookup while preserving fail-closed behavior and authority boundaries.

It is not sufficient to make the requested bounded operation execute. The prototype's unchanged priority order notices an unincorporated fresh directive and selects `incorporate_fresh_directive` first.

This is desirable as a regression outcome: actor admissibility and operational readiness remain distinct.

## Interpretation

The smallest safe architecture is two-stage:

1. **Identity admissibility:** an actor must have an explicit registry record with workspace and authority constraints. Unknown identities fail closed.
2. **State readiness:** after admission, current directives, missing capabilities and blockers still determine the next operation.

A generic `ACTORS.get(actor, default)` repair would collapse those stages and could silently grant unintended workspace or authority. The explicit mapping avoids that defect.

The result also confirms Elias's earlier stale-lease observation: knowing a continuity identity does not prove that a lease is ready to execute that identity's intended operation. Registry identity, lease occupant, contract and readiness gate must remain separately typed.

## Nonclaims and failure condition

- The controlling HSH_RESOURCES prototype was not edited.
- No scheduler or production route was changed.
- This does not prove the full switchboard is production-safe.
- This does not create or recover an Elias ChatGPT conversation.
- The test is only a source-derived local fixture, not execution of the full upstream file.
- A transfer test remains required against a reviewed sandbox copy of the complete prototype.

The repair fails review if the complete-prototype test shows any authority drift, altered TOP rule order, unexpected source-route expansion, unknown-actor fallback, or bypass of fresh-directive/capability/blocker precedence.

## Next cursor

If Track A elects to continue, apply the same single-record patch to a reviewed sandbox copy of the complete `workflow_switchboard_demo.py`, add an `elias_registry` scenario to its existing `self_test()`, and compare output byte-for-byte outside the new scenario. Promotion into the controlling prototype requires Track A/Track B review; it is not authorized by this recurrence.
