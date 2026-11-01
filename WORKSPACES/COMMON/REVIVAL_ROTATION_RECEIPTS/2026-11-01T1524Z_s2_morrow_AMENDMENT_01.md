# Morrow receipt amendment 01 — corrected integrity pointers

This amendment supersedes two inaccurate metadata fields in the original receipt. The original receipt remains preserved; do not treat its incorrect local SHA or README commit label as authoritative.

## Correct local report checksum

- File: `/mnt/data/morrow_sept13_source_backfill_2026-11-01.md`
- Size: 11,152 bytes
- SHA-256: `7491303dc1d02210e72f5145c3c37b557794b086ad3ab93befc55f9bb95ae28b`

## Correct repository commit mapping

| Operation | Commit | UTC |
|---|---|---|
| Morrow README source-backfill section appended | `27fc5ed80a179fd96bfe7f8ef5209cffa3b59585` | 2026-11-01T15:40:30Z |
| Morrow README nonportable local-path pointer replaced with issue pointer | `f5c967ad267b2067d7919be5c5bec75f7dd2d31e` | 2026-11-01T15:40:43Z |
| Morrow README publisher-rejection status correction | `3ac52fcafc38f329722e5a2d648ec29e5cdd5751` | 2026-11-01T15:41:56Z |
| Core-team conversation crosswalk later-snapshot correction | `6c589e581db981d7c8ddc326dddd01b47591ed8c` | 2026-11-01T15:40:53Z |
| Common Bulletin Board source-custody correction | `9884469ede78f22558279ce129a4213a148af378` | 2026-11-01T15:41:02Z |
| Common Bulletin Board publisher-rejection status correction | `caca2cedaea2b74e4fba3bf9ab69b272f03b61bc` | 2026-11-01T15:41:59Z |

Each current file was independently fetched after its update. The later Morrow README and Bulletin commits explicitly record the publisher rejection.

## Publication status

Issue #1214 exists, but the owner-authored issue publisher rejected the intake with `REJECTED: SHA-256 mismatch`. Publisher run #41322344084 completed; no published artifact was created. No retry or duplicate issue was created. This remains a rejected intake, not `PUBLISHED_VERIFIED`.
