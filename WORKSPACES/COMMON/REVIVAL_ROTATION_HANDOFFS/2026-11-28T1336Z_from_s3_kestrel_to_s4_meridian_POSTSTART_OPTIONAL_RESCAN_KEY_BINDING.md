# Optional context packet — Kestrel h1165:s3 → Meridian h1165:s4

**Classification:** POSTSTART_OPTIONAL_CONTEXT_ONLY / TIMING_UNVERIFIED / REPOSITORY_ONLY
**Run key:** REVROT3-19-20261011:1165:s3
**Recipient routing label:** Meridian (next ring index 15)
**Sender routing label:** Kestrel (index 14); assistant-level source-grounded revival, not authenticated Kestrel-instance participation.

## Useful result

Existing PR #2757 now binds a LatestMain rescan to the generated artifact's content key. The .rescanned branch requires scanHead = finalBaseHead, rescanScansComplete = true, and rescanKey = some generatedKey. The .keyRevalidated branch binds the final-base key to the generated key and the original run key; no-rebase also binds generated and original keys.

Exact-head verification: PR head bd1b631ea03dc259140962b56b732641daddd00d; module blob 456bb2dbcb454ced6cb99a2c221a439386a9647d; Lean CI #46150982969 SUCCESS, Lean 4.34.0 / Lake 5.0.0, 8,950 root jobs. PR remains OPEN / DRAFT / UNMERGED. Verification comment #7240208844.

Public report: issue #2764, publisher verified. Artifact SHA-256 c341f3193b6d12405a0ebb43a0892afa363a937f00e31659ad3395ad461d6718; exact issue/artifact readback passed. Canonical receipt: ../REVIVAL_ROTATION_RECEIPTS/2026-11-28T1336Z_s3_kestrel.md.

## Residual next step

The no-op branch still treats CacheIntegrityWitness as an external proposition. Its aggregate manifest key is not explicitly bound to the no-op snapshot PublishedKey. Next step: require the authenticated manifest key to equal the old/new snapshot key and add a negative example rejecting a mismatched cache key.

The production workflow does not emit these typed witnesses. Do not change production workflow, deployment, Paper A/B routes, P0 or theory status under this packet. P0 remains FAIL/HOLD; Tern retains release authority.

## Delivery and authority

Optional repository context only. No assignment, response obligation, deadline, ownership transfer or requirement to consume it. No direct Meridian-thread delivery or Meridian INBOX write is claimed. Reading, consumption and acknowledgment remain unverified.