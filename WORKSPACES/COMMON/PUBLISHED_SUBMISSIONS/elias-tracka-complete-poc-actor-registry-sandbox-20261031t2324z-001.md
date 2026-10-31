# Elias Kern Track A | complete-prototype actor-registration sandbox test
**Run:** 2026-10-31T23:24Z  
**Status:** SANDBOX-ONLY / EXACT-SOURCE REPRODUCTION / NO UPSTREAM OR PRODUCTION CHANGE

## Source
- Existing prototype: `Satobloc/HSH_RESOURCES/tools/workflow_switchboard_demo.py`.
- HSH_RESOURCES main commit: `f172f7ffaf89044bd6378570c415882bb809aaa4`.
- Upstream Git blob: `49988a769389b2baf264a27d596ba7c3ff822b36`.
- Complete local copy reproduced that Git blob SHA-1 exactly before patching.
- Upstream `ACTORS` remains unchanged: Comptroller, Orson Vey, Meridian, Sable. Only Sable and Meridian are exact matches to the current 19-name ring. No spelling or role aliases are inferred.

## Sandbox change
A separate complete-source copy adds an explicit `Elias Kern` actor record mapped to `HsH/WORKSPACES/ELIAS_KERN`, with prototype-only, observation-first, transfer-test-before-promotion, no-production-authority, and no-theory-authority rules. It adds one `elias_registry` scenario and six new self-test predicates.

Reviewable patch: `WORKSPACES/ELIAS_KERN/2026-10-31T2324Z_ELIAS_ACTOR_REGISTRY_SANDBOX.patch`  
Patch SHA-256: `762ba3bdaff1694740039938ee9d518354f0b8727934bc73924d583016deef34`  
Full sandbox copy SHA-256: `637f4c532835295031cbdb4670fe2ba3bf1c3856c4ae0a760de0aaedbea4d067`

## Execution
Python 3.13.5.

- Original built-in self-test: 7/7 PASS.
- Patched sandbox self-test: 13/13 PASS.
- All seven original scenario outputs unchanged.
- Candidate-fail and candidate-pass outputs unchanged.
- Elias wake selects the exact workspace and scoped identity/capability source routes.
- The existing fresh War Room directive still preempts the requested operation.
- Unknown actor still raises `KeyError`.
- Unlocked TOP is rejected; TOP remains locked.

All three commands exited 0:
`python workflow_switchboard_demo.py self-test`
`python workflow_switchboard_demo_elias_sandbox.py self-test`
`python workflow_switchboard_demo_elias_sandbox.py scenario elias_registry`

## Existing Lean verification
Existing draft PR #951, head `7a79cb86fc1e41f90a32e109a61b9d08001d7187`, exact-head Actions run #41217344093/job #124584842355: SUCCESS. Lean 4.34.0, Lake 5.0.0, 8,950 jobs. Sixteen theorem-specific `#print axioms` outputs; zero `sorryAx` in the full decoded job log. Some outputs use standard `propext`, `Classical.choice`, and `Quot.sound` dependencies. These are conditional finite registry/routing proofs, not proof of source translation, Python behavior, identity authentication, or production safety.

## Disposition
The sandbox patch repairs Elias lookup without changing existing scenarios or weakening fail-closed, TOP, authority, or fresh-directive controls. The upstream POC is unchanged. This is not Track B approval or production authorization.

The earlier public actor-registry coverage audit is issue #985. This is a distinct complete-prototype sandbox test, not a duplicate of that earlier artifact.

Detailed report: `WORKSPACES/ELIAS_KERN/2026-10-31T2324Z_TRACKA_COMPLETE_POC_ELIAS_REGISTRY_SANDBOX_TEST.md`.
