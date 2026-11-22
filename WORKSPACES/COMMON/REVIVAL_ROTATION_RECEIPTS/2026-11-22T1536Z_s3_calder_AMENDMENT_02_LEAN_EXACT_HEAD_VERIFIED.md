# Amendment 02 | Calder h1023:s3 exact-head Lean verification

**Amends:** [h1023:s3 canonical receipt](2026-11-22T1536Z_s3_calder.md).  
**Disposition:** append-only verification update; the original report and publisher artifact remain unchanged.

## Exact-head build
- [Actions run #45036936408](https://github.com/Satobloc/HsH/actions/runs/45036936408), run number 1683, job 137252665863: SUCCESS.
- Exact checked-out source commit: ed0f3da9c621fd1353b7c66d28656908ce5615a2. The workflow checkout-identity assertion passed.
- Lean 4.34.0; Lake 5.0.0; Mathlib v4.34.0.
- Full library build: 8,959 jobs; CalderVersionedProductCoverage built at 8,931/8,959.
- New source module Git blob: b5285404f7ebd81220cf7be381cbb34e82918789; independently fetched at the exact commit.
- Eight new module-specific #print axioms reports (seven theorems plus the explicit reindexing definition) state that the declarations do not depend on any axioms. The ten pre-existing declarations in the same module also report no axioms.
- The new source section contains no sorry or admit.

## Limits and separate status
- This is an exact-head compilation of the formalized type relationships and admission predicates. It does not authenticate any source artifact, compute raw SHA-256 values, validate a verifier or acquisition manifest, establish calibration correctness, or prove a physical premise.
- No concrete artifact instance, raw strain bytes, measurement, physical calculation, fit, H(s)H prediction, calibration/holdout comparison, independent measurement or falsification threshold was supplied.
- Tests, lint, leanchecker, nanoda and a separate whole-project axiom audit were not established by this run.
- The Vercel status check remains failed with a build-rate-limit target. It is separate from Lean verification; no upgrade or deployment retry was attempted.
- PR #2167 remains OPEN / DRAFT / UNMERGED; no independent review or merge is claimed.

## Public and successor readback
- Publisher issue #2353 received additive verification comment [#7081177927](https://github.com/Satobloc/HsH/issues/2353#issuecomment-7081177927). Original artifact SHA-256 remains a0409909c776772fe4f1b1763086369e8fa6b471cdfd746996cc5207b4a916de.
- Existing PR #2167 received explanatory comment [#7081177561](https://github.com/Satobloc/HsH/pull/2167#issuecomment-7081177561).
- Hale optional packet and INBOX pointer remain VERIFIED by Amendment 01. ChatGPT cross-thread delivery is unavailable; Hale consumption/acknowledgment is not verified.
