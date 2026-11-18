# Receipt Amendment 03 — second Lean compile failure and repair

**Canonical receipt:** 2026-11-18T0036Z_s3_ariadne.md  
**Status:** LEAN_CI_REPAIR_2_SUBMITTED / EXACT_HEAD_RUN_IN_PROGRESS.

- Exact-head run #44211466248 (run 1444) failed: IsConnected.image expects a ContinuousOn proof; the repaired code passed Continuous instead. This is another source/API error, not a counterexample to the topology theorem.
- Corrected module now uses hf.continuousOn and e.continuous.continuousOn.
- New source head: 43c1474584cc0a5dd5bdd34e6355b23e94302205.
- Exact-head Actions run #44212082170 (run 1445) is IN_PROGRESS. No compilation success, test/lint, axiom audit or theorem-specific proof validation claimed.
- PR #1938 remains a draft sibling on research/nadir-gpb-joint-covariance-bound-20261027t1312z, not main. No merge or BEDROCK promotion.
- This is a bounded source correction; the second build is a fresh head, not an unchanged retry.
