# Amendment 01 | Mercer h911:s2 publisher SHA rejection

**Date:** 2026-11-17  
**Canonical receipt:** 2026-11-17T2324Z_s2_mercer.md  
**Submission:** mercer-h911-s2-p0-discovery-delta-wh02-preflight-20261117t2324z-001

## Actual publisher result

Issue #1931 was created by repository owner Satobloc at 2026-11-17T23:41:22Z. The publisher returned comment #6964332374:

REJECTED: SHA-256 mismatch

The issue body declares:
- SHA-256: 6bab68b91815806b768d70c8779363a6a4907669cd9d30ba330e7f9f2bf9cece
- Expected UTF-8 length: 12,056 bytes.

The exact decoded content field in issue #1931 has:
- Recomputed SHA-256: f825e826761e977dad70cc5c3e47b4f8285f08b57f11808c475431fb8ce2f2d8
- Actual UTF-8 length: 12,055 bytes.
- JavaScript SHA-256 implementation was checked against the standard SHA-256("abc") test vector before use.

The issue payload and declared digest therefore differ by one byte in length and have different hashes. The exact differing character/byte location was not localized. The publisher's rejection is authoritative.

The expected fixed destination returned 404:
WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/mercer-h911-s2-p0-discovery-delta-wh02-preflight-20261117t2324z-001.md

No PUBLISHED comment or artifact exists. Status: PUBLISHER_REJECTED_SHA_MISMATCH / NOT_PUBLISHED.

## Corrected workspace copy

The exact decoded issue content was preserved as a workspace copy:

- Path: WORKSPACES/MERCER/2026-11-17T2324Z_H911_S2_P0_DISCOVERY_DELTA_AND_WH02_PREFLIGHT_CORRECTED.md
- Git blob: 2d23a00053124351334a423cdc268eeac0a6b08d
- SHA-256: f825e826761e977dad70cc5c3e47b4f8285f08b57f11808c475431fb8ce2f2d8
- UTF-8 length: 12,055 bytes.
- Independent fetch/readback: exact content and digest match.

This is a corrected workspace copy of the actual issue payload, not a publisher artifact and not PUBLISHED_VERIFIED.

## No-retry boundary and public corrections

The publication intake contract requires preserving an already-created rejected issue as the single audit record. Issue #1931 was not edited, reopened, retried, or duplicated. No second publisher issue was created.

The earlier comments that called issue #1931 a published report were corrected:
- P0 issue #1747 correction comment #6964375058.
- WH-02 PR #1710 correction comment #6964375722.

The original P0 and WH-02 evidence remains valid. Only the publication-status description was corrected. No protected source/control, manuscript, renderer, deployment, PR code, task, schedule, or phase was changed.
