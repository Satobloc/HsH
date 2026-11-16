# H885:S3 Amendment 03 | Exact-head Lean readback

The current PR #1858 head, 85780267a86bcadbcc4895e2031674f150f783e4, completed its own exact-head Lean verification.

- [PR #1858](https://github.com/Satobloc/HsH/pull/1858)
- [Exact-head Actions run #43969861179](https://github.com/Satobloc/HsH/actions/runs/43969861179)
- Job 133658858335: PASS.
- Exact PR-head checkout assertion: PASS.
- Lean 4.34.0; Lake 5.0.0.
- Full library build: 8,950 jobs, successful.
- Ten theorem-specific axiom reports in LoomSourceBoundComparison: no axiom dependencies reported.
- Tests and lint were skipped; leanchecker, nanoda and global axiom audit were also skipped.

The new theorems cover nonempty source-witness digest, digest propagation across E/D/F/R/H0/H1 and manifest, canonical-manifest digest identity, source/observation manifest membership in the declared member list, and nonempty manifest IDs.

**Limits:** this verifies only the formalized Lean statements. The digest remains an opaque string; no raw bytes are hashed or authenticated. Membership is against a declared Lean list, not an inspected manifest file. File existence/content, verified flags, reviewer independence, pre-unblinding, Python/repository/runtime refinement, physical premises and the missing source-to-Minkowski/worldtube/lab maps remain unverified. P2 remains HOLD; no physical calculation, fit, prediction, independent measurement, numeric falsification threshold or theory promotion.

PR #1858 remains OPEN / DRAFT / UNMERGED. Vercel preview remains rate-limited on the free tier; no upgrade or retry. Issue #1859 remains SUBMITTED_NOT_VERIFIED; no publisher retry or duplicate.

The machine-readable [source-bundle witness JSON](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/LOOM/2026-11-16_H885_S3_P2_SOURCE_GEOMETRY_VERSION_WITNESS.json) now records this final PR state. Its SHA-256 is bfe682b624b9c8546116bd9de43602e72aca0624caf8031df9a03a9c560eb616; Git blob SHA-1 is 624e45b49e942f15ea2ed85eb246fa2445ce1b55.

The original issue #1857 publisher artifact remains unchanged and immutable. This is an additive verification amendment, not a reissue.
