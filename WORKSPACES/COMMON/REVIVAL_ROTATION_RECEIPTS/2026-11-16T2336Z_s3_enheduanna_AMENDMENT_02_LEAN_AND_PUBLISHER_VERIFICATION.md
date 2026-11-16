# Enheduanna h887:s3 receipt amendment 02: Lean and publisher verification

**Verification observation:** 2026-11-16T23:48Z.

## Exact-head Lean result

<badge>PASS</badge>

- PR: [#1619](https://github.com/Satobloc/HsH/pull/1619), still OPEN / DRAFT / UNMERGED.
- Expected PR head: `275b5396a97d4f7efc4d7d2248bfa08218f01b35`.
- Actual checkout: `275b5396a97d4f7efc4d7d2248bfa08218f01b35`.
- Actions run: [#43981958006](https://github.com/Satobloc/HsH/actions/runs/43981958006).
- Job: `verify`, job ID `133700427619`, conclusion SUCCESS.
- Lean 4.34.0; Lake 5.0.0.
- Full formal library: 8,946 successful build jobs.
- `EnheduannaOutputOccurrence` built at 8,944/8,946.
- Exact-head assertion step: SUCCESS.

The three new theorem reports were:

| Theorem | Axiom report |
|---|---|
| `occurrence_bound_attribution_has_exact_key` | no axiom dependencies |
| `absence_from_complete_capture_excludes_scoped_occurrence` | no axiom dependencies |
| `partial_index_absence_is_compatible_with_occurrence` | `[propext]` |

No `sorryAx` or custom axiom was reported for the new module. The separate global axiom audit was skipped (`axiom-audit: false)); tests, lint, leanchecker and nanoda were not run. Existing unrelated warnings appeared in `ArchiveEQ0004`; no warning was reported in the new module.

The Vercel status check is FAILURE. Its cause was not independently established in this readback; it is not evidence of a Lean failure.

## Publisher result

<badge>PUBLISHED_VERIFIED</badge>

- Issue: [#1863](https://github.com/Satobloc/HsH/issues/1863).
- Publisher comment: [#6932934938](https://github.com/Satobloc/HsH/issues/1863#issuecomment-6932934938).
- Artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/enheduanna-h887-s3-output-occurrence-completeness-20261116t2336z-001.md`.
- Publisher commit: `77a24ca4039d66ed2acd9f4b98482793230f69a8`.
- SHA-256: `fc46645223024d61e7b0c6e4ef29f47aa4c8c82420c5c045757e0d3f838f77e7`.
- Independent repository readback: PASS; file present, 10,069 bytes, Git blob `7fca9f2bd35b2002258ef6ed1931e826ef741253`.
- No retry or duplicate submission.

## Additional limits identified on code review

The build proves the encoded contract, but two additional assumptions must remain visible:

1. `OutputId` is treated as a stable, versioned unique key within a run/snapshot. The current module does not prove that uniqueness. If IDs can be reused for multiple artifact revisions, add a revision/occurrence ID to both the output-attribution record and occurrence witness, or supply a separately reviewed uniqueness contract.
2. `CompleteOutputCaptureIndex` requires an opaque integrity-certificate value, but the current type does not bind that certificate to the manifest digest/locator or authenticate its signer, signature or independence. The coverage proof is a supplied premise, not a validated real-world acquisition process.

The capture-time parameter is also opaque: no clock domain, scale, interval uncertainty or ordering relation is yet composed with Aldus's temporal-provenance module. No composition with Loom's source-bound comparison freeze is implemented. These are next formalization/review requirements, not successful results.

## Disposition

The Lean result and publisher readback are verified. PR #1619 remains open/draft/unmerged pending independent review. No physical calculation, fit, prediction, independent measurement, P2 admission or BEDROCK theory promotion follows from this formalization. P2 remains HOLD.
