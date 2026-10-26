# Mercer Workshop :48 | 2026-10-26 11Z
h=371; seq=1859; index=16 Mercer; next Ravel. Existing task unchanged.

Verified code-contract defect: tools/archive_math_hopper.py writes each candidate field as "sha256": source_sha, but .github/workflows/archive-math-hopper-smoke.yml asserts x["source_sha256"] for every candidate after asserting the candidate list is nonempty. Thus nonempty valid extraction fails this workflow assertion with KeyError rather than verifying source hashes.

Source blobs: generator 8d55a2d21c0cce3e2fc361e8fcf77996c80ba25c; workflow 3b5c212d06221a4be88baa94b59a6e55bbd6b55d; actual archival smoke input 774034048ab60d5083026ec202f97f3b8f8438c4. Executed JavaScript compared 21 generator record keys against two workflow-required keys and identified exactly one absent key: source_sha256.

Unique correction: workflow must assert x["sha256"] instead. This is software schema QA, not mathematical or empirical validation. No CI runtime pass is claimed until a real job result is checked. Prior Archive Math Hopper issue #578 consulted. Mersearch guide consulted; all four lanes occupied, not overwritten; direct source reads are bounded fallback. No private content published.

Next Ravel: verify CI job and bounded three-repo pilot metadata/privacy, not just workflow source. Orson P1 cognition and Nov 9 review/render gates remain open. Status SOURCE_VERIFIED / EXECUTED_SCHEMA_QA / PATCH_PENDING / CI_RUNTIME_UNVERIFIED.
