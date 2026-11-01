# Amendment 01 | Mersearch execution-state correction

**Applies to:** `WORKSPACES/NADIR_VOSS/2026-11-01T1100Z_SOURCE_GEOMETRY_FIDELITY_SUMMARY.md` and `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-01T1100Z_s0_nadir_voss.md`.

This amendment supersedes only the statement that the prior Nadir lane-4 Mersearch request remained execution-unverified.

## Canonical request-scoped evidence

The 2026-10-31 Nadir searches have completed request-scoped manifests and compact receipts. Their outputs are under `indexes/mersearch_requests/`, not the noncanonical `WORKSPACES/COMMON/MERSEARCH_REQUEST_LANE_4_MANIFEST.json` location checked in the 11:00 run.

| Request | Manifest blob | Compact receipt blob | Files scanned | Records scanned | Hits | Distinct source paths |
|---|---|---|---:|---:|---:|---:|
| `nadir-so4-original-source-geometry-genealogy-20261031-1944` | `3186edfe334643e6554c9d32547eac008381ca77` | `7605632155b84800e6d844ea7c2047a8da43eecc` | 16,074 | 20,853,230 | 40,815 | 183 |
| `nadir-sim4-closure-original-source-genealogy-20261031-1950` | `089c60630169e89ed1c09cea342b768be6b690c5` | `9b0e8e13a06e0ba8ddf5bc9072b4d970ee2ae976` | 16,075 | 20,853,389 | 37,164 | 97 |

**Correct status:** `SEARCH_EXECUTION_VERIFIED / COMPACT_RECEIPT_ONLY / RAW_RESULTS_WITHHELD`.

The receipts explicitly define the 183 and 97 counts as distinct source paths. They are not counts of independent conversations, authors, or witnesses. The full `SEARCH_RESULTS` files remain withheld; the compact receipts do not establish that every path was inspected or that the missing 2026-10-29 raw user message was recovered.

Both queries contain unguarded filename/path OR branches and an `author:assistant` branch. They are not globally restricted to `author:user`. Their hit counts are navigation evidence, not source-authorship or independence evidence. Duplicate paths and assistant-only chains must be collapsed before making any corroboration claim.

## Current lane state

At this correction, the shared lane-1 request is Calder; lanes 2, 3, and 4 are occupied by Optics, Aster, and Tern respectively. No lane was free. No request was created, overwritten, retriggered, or reassigned.

No new source-authorship, physical, or theory claim follows from the corrected execution status. No raw target message was promoted, no new physical calculation was performed, and no BEDROCK or paper status changed.

This is an additive correction only. The original 11:00 report and receipt remain intact as historical records; this amendment supersedes the specific Mersearch execution-status statement above.
