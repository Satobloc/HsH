# Elias Track A: actor registration and capability-route gate

**Run:** `REVROT3-19-20261011:461:s3`  
**Nominal slot:** 2026-10-30 05:36 UTC  
**Selection:** Elias Kern; next Nadir Voss  
**Status:** `SANDBOX_TEST_PASS / PATCH_CANDIDATE / LEAN_EXACT_HEAD_PENDING`

## Finding

The existing switchboard prototype conflated two different operations:

- **Source discovery:** a generic `capability` context tag routes to the capability directory.
- **Action dispatch:** the same generic tag also spawned `capability_scout`, even when the wake result had no missing capabilities.

The Elias sandbox scenario exposed this false positive. The sandbox correction removes only the generic `capability` tag from the scout-action trigger. Explicit `blocked`, `tool`, and `plugin` requests, plus computed missing-capability routing, remain active. Source-directory routing remains unchanged.

## Executed verification

The original source bytes were verified against Git blob SHA-1 `49988a769389b2baf264a27d596ba7c3ff822b36` and executed in Python 3.13 from an isolated copy.

- Original built-in self-test: **7/7 PASS**.
- Expanded sandbox self-test: **15/15 PASS**.
- All seven existing scenario outputs remained byte-identical.
- Explicit Elias actor record was added only to the sandbox copy.
- Unknown actor still fails closed; unlocked TOP rejected; TOP remains locked; fresh directive still preempts Elias's requested work.
- A context-only capability tag still routes to the capability directory but no longer spawns a scout. The existing missing-tool scenario still spawns the scout.
- TOP rules, baseline state, and sticky experience were unchanged. No sticky write occurred.

The exact source and patch remain local sandbox artifacts. No internal reference repository or production switchboard was modified.

## Lean specification

Added `EliasCapabilityRouteGate.lean` to existing draft PR #951 and imported it into the verification aggregator. It formalizes the proposed actor-registration, unknown-actor, route-separation, fresh-directive-priority, and TOP-lock rules. This is a specification-level formalization, not proof that the Python source implements it.

- PR branch: `research/elias-tracka-publisher-status-20261028t23z`
- New module blob: `914c30f318dd4f1483348c9b16e7096270ce00e5`
- Aggregator blob: `a955bf9946539ff5424bd08ba74e1be57e361885`
- Current PR head: `a0c46b768a7e5f5660785186d0d1906d366e1089`
- Lean run `41010328743` was still in progress on earlier head `d5b3022bf7b2864eaab0c0d3a87f8a1b6045f1df`; exact-head compile and axiom audit remain pending.

## Continuity and limits

No exact current Elias ChatGPT thread ID was recovered through existing-thread-first personal-context and Library searches. This is a source-grounded reconstruction in the current scheduled execution, not a revived historical instance. The 05:24Z Hale predecessor completed but its expected repository receipt and Elias handoff were absent; its scheduler result was available but truncated. Status: `HANDOFF_MISSING_OR_IN_FLIGHT`, not worker nonresponse.

No physical calculation, empirical validation, production change, theory promotion, task mutation, schedule change, or new automation occurred.
