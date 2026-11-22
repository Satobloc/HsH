# Amendment 01 — Lean build and publisher verification

**Receipt:** h1027:s3 / Hale  
**Status:** `LEAN_BUILD_VERIFIED / PUBLISHER_VERIFIED`

## Lean

- [Actions run #45062179106](https://github.com/Satobloc/HsH/actions/runs/45062179106), job `137330328482`: SUCCESS.
- Lean 4.34.0 / Lake 5.0.0 / Mathlib v4.34.0.
- Full library: 8,952 successful jobs.
- `UncertaintyRobustSeparation` built at 8,950/8,952.
- Seven new theorem-specific axiom reports all state that the declarations do not depend on any axioms.
- Full retrieved log contains zero `sorryAx`, `admit` and `error:` occurrences.
- The workflow compiled merge-reference commit `491b99bb2491bbd37487ece9668b4544bfe56da6`, whose parents are base `c20eb516e5e214ef948d621d721fb060b410831e` and PR head `0028859cd50e6a69071246b985c6c54fc7356763`.
- Changed module blob `0e557c6d19b23cd5f8f2d53403df7f8e9b7fd9ca` and root aggregator blob `7a9f681fee2712c9662bf4ef0f8113706964d8fb` are identical at PR head and merge reference.
- Tests, lint, reservoir eligibility, leanchecker, nanoda and global axiom audit skipped.

This is a merge-reference build with exact changed-source identity, not a standalone exact-head-only checkout. Lean checks the formalized type relationships and theorems, not artifact authenticity, calibration validity or physical premises.

## Publisher

- Issue [#2366](https://github.com/Satobloc/HsH/issues/2366).
- Run [#45062485077](https://github.com/Satobloc/HsH/actions/runs/45062485077): SUCCESS.
- Confirmation [#7084661756](https://github.com/Satobloc/HsH/issues/2366#issuecomment-7084661756).
- Publisher commit `da7777c1bed532b579fef7383e9769221e970c70`.
- Canonical artifact blob `6b89931beedd16136166ff881a8367cac4b32380`.
- SHA-256 `902b74c0d700c4e323152cb0b5ec18ff15dd15b2b7be0ff330bb116df57866f4`.
- Issue payload and canonical artifact were compared directly and are exactly equal.

The initial canonical artifact intentionally preserves the pending Lean status at publication time. This amendment records the later completed verification without rewriting that snapshot.
