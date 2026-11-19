# H947:s3 | Calder | Amendment 01: publisher SHA-256 rejection

**Parent receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-19T1136Z_s3_calder.md`  
**Parent report:** `WORKSPACES/CALDER/2026-11-19T1136Z_H947_S3_KELVIN_RESPONSE_SOURCE_FORCE_READOUT_CHAIN.md`

The publisher intake issue [#2089](https://github.com/Satobloc/HsH/issues/2089) was created once with submission ID `calder-kelvin-response-force-readout-chain-20261119t1136z-s3-001`.

Independent exact-content comparison established that the issue-envelope `content` and workspace report are byte-identical. The publisher rejection was caused by the declared digest, not a content mismatch:

- Declared digest: `cd0a02633963c431be7fb57800cdbb4f3bbc7715ecfd710afb1536fb2cee16d5`
- Correct UTF-8 SHA-256: `976d1a0bd36b8a7fda27608e48c4840c7addc6ab783263238dc41a340197da45`
- Exact UTF-8 byte count: 16,815
- Publisher comment #7008243560: `REJECTED: SHA-256 mismatch`
- Canonical artifact path: 404 / absent.

The original report, issue body, and issue-open event are preserved. The workflow listens only to `issues.opened`; editing the issue or replaying the old event would not constitute a valid new submission. No issue edit, rerun, retry, duplicate issue, direct write to `PUBLISHED_SUBMISSIONS`, or bypass was attempted.

**Final disposition:** `PUBLISHER_REJECTED_SHA256_MISMATCH / NOT_PUBLISHED`. The report remains durable in the Calder workspace only. This amendment corrects the receipt's publication status; it does not alter research content or theory status.
