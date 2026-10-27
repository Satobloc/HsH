# Elias Kern Track A | Same-candidate Hydra A-B-A evidence-revision suppression | 2026-10-27 13:00 UTC

Run: REVROT3-19-20261011:397:s0. Current assistant source-grounded Elias-role reconstruction, NOT an authenticated historical Elias worker. Existing :00 hourly lease unchanged; no sixth automation.

## Primary source and novelty boundary
The sandboxed HSH_RESOURCES Top/Central/Branch/Hydra switchboard prototype (tools/workflow_switchboard_demo.py, Git blob 49988a769389b2baf264a27d596ba7c3ff822b36) derives its Hydra loop-history fingerprint from node ID, candidate stage, and incorporated-directive state. The key omits the candidate's evidence revision and check contents. Its apply_checks method updates review statuses, while hydra uses that history key to decide whether to emit jobs.

Previous Elias issue #714 already established unresolved/fail stage collapse. Previous Tern issue #718 established that two DISTINCT candidates can share the history key. This pass performs the distinct outstanding discriminator: the SAME candidate receives changed evidence and revisits its earlier stage after an intervening stage change.

## Executed source-faithful bounded regression
A Python 3.13.5 method-level transcription of the original apply_checks, condition and hydra methods, limited to the original candidate_pass/candidate_fail Hydra nodes, was actually executed. It is NOT a run of the complete private POC and NOT a production incident. Review statuses are explicitly software regression inputs, NOT recorded human reviewer decisions or physical observations.

1. A: math=pass, adversarial=unresolved, provenance=pass -> checked_fail; jobs prune_rebuild and salvage_lessons emitted.
2. B: update adversarial to pass -> checked_pass; jobs prediction_packet, paper_pipeline and independent_reality_check emitted.
3. A-prime: new update adversarial to unresolved -> checked_fail; jobs NONE; guard loop_guard:candidate_fail; no recurrence rewrite.

Five regression assertions passed. Script SHA256 d1c6893fef4c13f678aaab484ce65d5b9ffdb8e3a5a5121e6efce1319f812fa0. Output SHA256 08f7633df4c343dc1613b491d4a2040bfb81b8c2e42f9e5cb771a0ca617709b1. Exact script and stdout remain in the local run artifact, not in this public packet.

This is not a truncated-hash collision: the same prehash state is produced after the evidence changes. The demo's canned scenarios ordinarily start with fresh in-memory state; no real dropped review or scheduler error is established.

## Nathan Direct / assistant translation boundary
The original human-authored War Room declaration (Git blob 1506a3c8030f446b08990dac88dc45227dfa3463) directs exact source fidelity, critique and evidentiary discipline. It does NOT prescribe this particular stage reducer or history key. The later assistant-authored POC diagram describes candidate construction, independent perpendicular checks, failure pruning and narrower re-entry. The Python implementation is a separate, testable translation of that intended control geometry.

The real Hale source case, issue #741 and Lean PR #740, contains separately verifiable publication, conditional formal compilation and OPEN semantic adjudication. Those are not three authenticated pass reviews and were not fed into the test as such.

## Formalization and status
Draft PR #742 on isolated branch research/elias-hydra-evidence-revision-20261027t13z-s0 root-imports EliasHydraEvidenceRevision.lean. Four conditional theorems describe projection of (node, stage, directives, candidate, revision) to the legacy key, its insensitivity to revision and candidate identity, and the distinctness of a revision-aware key. CI run #40508485564 was launched; actual Lean compiler and axiom results must be independently read before claiming VERIFIED. Even successful Lean compilation would establish only the stated abstract key properties, not Python translation fidelity, independent review or empirical physics.

## Glossary / mapping
Candidate = identified work item; check = named software record, not automatically independent reviewer; stage = lossy check summary; Hydra node = state-triggered job rule; history key = projected state used for loop suppression; evidence revision = substantive change to source/review state; perpendicular = intended exposure-separated review, not proved statistical independence.

Mapping: Nathan Direct -> assistant POC review graph -> Python check-to-stage projection -> Hydra history-key projection -> job/guard outcome -> conditional Lean equality model.

## Discrepancy and proposed next gate
Observed method-level mismatch: a new failed-state revision after a pass can be suppressed as a previously handled failure. Candidate repair: key on stable candidate identity plus evidence revision/event identity and directive revision; retain bounded exact-retry loop guards and source/exposure audit. This is NOT implemented, sticky, production-ready, or BEDROCK-promoted. Track B (Sable/Tern) should independently test a second locale and decide whether revision-sensitive reprocessing is intended.

Mersearch request lanes were occupied and untouched; source retrieval used bounded connector original-file reads, not an exhaustive Mersearch run. No physical calculation or CODATA scoring. Nov 9 P1 (Orson), Nov 30 P2 and Dec 14 P3 remain separate source/review/LaTeX/reader gates. Repository handoff to Nadir Voss is not authenticated ChatGPT-thread delivery.
