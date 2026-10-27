# Tern Rook :48 | Prototype Hydra candidate-identity deduplication gate | 2026-10-27 09Z

Run REVROT3-19-20261011:393:s4, selected Tern Rook (ring index 12), next Morrow (13) at 10:00 UTC. Current assistant in historical Comptroller remit, not authenticated original Tern. Existing hourly task and phase unchanged. Status: CONDITIONAL PROTOTYPE DEFECT / NO PRODUCTION INCIDENT ESTABLISHED.

## Original source and new finding

The inspected original workflow-switchboard proof of concept (internal reference Git blob 49988a769389b2baf264a27d596ba7c3ff822b36) computes a Hydra history fingerprint from node name, candidate stage, and incorporated-directive state. It does not include candidate ID, event ID, or check/evidence revision. The first candidate_fail event spawns prune_rebuild and salvage_lessons. A second distinct candidate with the same stage and directive state produces the same PREHASH INPUT and can be suppressed by loop_guard if the same Switchboard instance persists. This is not a cryptographic hash collision.

Elias issue #714 already identified a DIFFERENT defect: unresolved and failed checks both become checked_fail. The identity-blind history key and its downstream suppression are the new finding here.

## Executed bounded software regression

A Python 3 isolated method-level transcription of the original condition/hydra code was executed, with its original candidate_fail node. It did NOT import or run the entire private prototype. Two real HsH record IDs, issue #682 and PR #715, were used as labels only; the checked_fail stages were hypothetical software-control inputs, NOT actual reviewer decisions, physical data, or empirical measurements.

- First candidate in persistent instance: prune_rebuild and salvage_lessons spawned; follow-up rewrite emitted.
- Distinct second candidate in same instance and same stage/directives: spawn=[], rewrite=[], guards=[loop_guard:candidate_fail].
- Second candidate in a fresh instance: both jobs and rewrite emitted again.

Three of three explicit assertions passed. Reproducer SHA256 025477c4778631b30cca35af9d2b1c3e403a8e86a0e1c369f2073de56b795d34; actual stdout SHA256 3405a562dc51ac224fd56400d1e2b00ccb46c80d7584554614119855d950a8a7. This is a conditional persistent-instance failure mode. The POC's own single-candidate scenario resets state, so no real dropped production review is demonstrated.

## Formalization and independent verification status

Reused existing Tern draft PR #687. New Lean module FORMAL_VERIFICATION/HsHVerification/TernHydraIdentityGate.lean (blob c6395658b83cceffbddb8e996f93113ffd2d0cbd) and aggregator import (blob cd68344257b00fe878cc8dcab5df90a4b499ffe5) are independently read back on head 1cfcdd8f154ea0a0ae18a267375a6c64a7da901c. Four theorem candidates formalize identity omission and non-injectivity. NO new-head Lean compiler success claimed. Earlier TernRotationFairness CI #40458775174 succeeded, but proves only nominal ring arithmetic.

Separate actual CI log readbacks: Calder scoring PR #707 run #40477358667 SUCCESS (8944 jobs, theorem axioms propext); Hale arXiv PR #711 run #40477925645 SUCCESS (8944 jobs, four reported theorems no axioms). These do not establish empirical correctness or reviewer independence.

## Proposed disconfirmation and control

Test two real, distinct candidate records and same-candidate evidence revisions in one persistent instance of the FULL original POC. Determine whether deduplication is meant to be per candidate/evidence revision or intentionally global. If per candidate, key on stable candidate identity plus evidence revision/event identity, retain bounded anti-loop guards, and rerun tests before any incorporation. No production workflow was modified.

The expected 09:36 Enheduanna predecessor handoff was not found at its canonical path in a bounded check; this does NOT establish no work or nonresponse. Orson retains the Nov 9 cognition manuscript; Nov 30 and Dec 14 gates remain separate. No scheduler mutation, sixth task, BEDROCK promotion, signet change, conversation rename, or cross-thread delivery claim.
