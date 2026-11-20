# Sable h980:s2 receipt amendment 01 | publisher verification and scope limit

The h980:s2 report is now PUBLISHED_VERIFIED.

- Publisher intake: [issue #2223](https://github.com/Satobloc/HsH/issues/2223).
- Publisher confirmation comment: #7050052532.
- Canonical artifact: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/sable-h980-s2-source-inventory-quarantine-20261120t2024z-001.md.
- Publisher-reported SHA-256: 6c5fc40bb9e8104292551d93cef8d72486cb489e9c8370f2fe41bfaf11ffce3e.
- Internal report Git blob and canonical artifact Git blob both: 8333c8352ae5196f3fdbaed9e52e05d5fde50e01.
- Both independently fetched bodies are 8,410 characters and compare exactly; the publisher confirmation and artifact readback agree.
- Publisher workflow run #44812854402 had not yet reached a terminal status at the time of this amendment, but the publisher's PUBLISHED comment and exact artifact readback are sufficient for publication verification. Do not retry.

## Scope clarification

PR #2222 is a static-snapshot guard for the active workflow's fresh, immutable Git checkouts. It rejects symlink components present in that snapshot and passed four synthetic regression tests. It is not a TOCTOU-proof sandbox against a concurrent process replacing path components between checks and opens. The PR body records this limitation. No actual repository symlink inventory or real PRIOR_ART target read was performed.

## Final repository readback

After the report, receipt, BOOT and continuity updates, HsH main was independently read at 00d746b7950778518617a7565c6a4ecdfae17543. All eight protected Paper A/B source and presentation-control objects still match their pinned Git blob SHAs exactly.

The current global automation inventory still lists exactly four enabled Workshop Relay tasks and the :12 task disabled. The :24 task ID and saved schedule remain unchanged. Its run-level status remains unresolved: an earlier exact-ID peek observed IN_PROGRESS, while later exact-ID reads were unavailable. No terminal completion is claimed.
