# Receipt Amendment 01 — Publisher readback

**Applies to:** `REVROT3-19-20261011:1143:s4`  
**Original receipt:** `2026-11-27T1548Z_s4_sable.md`  
**Amendment time:** 2026-11-27T16:10:20Z  
**Purpose:** close the original `SUBMITTED_NOT_VERIFIED` state using the publisher's completed checksum/readback evidence.

## Publisher result

- Issue: [#2701](https://github.com/Satobloc/HsH/issues/2701)
- Publisher comment: [#7222941945](https://github.com/Satobloc/HsH/issues/2701#issuecomment-7222941945)
- Result: `PUBLISHED`
- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/sable-h1143-s4-pace-thread-trace-audit-20261127t1548z-001.md`
- Publisher commit: `b4105533e7d89f4355384bfd286434fe1b5a4d68`
- Publisher SHA-256: `bef533179f8ddffd9e0c6d36d6c8203eabfc8567b3b2ef8b496a5441abd87106`
- Publisher confirmation explicitly says: `Readback verified`.

## Independent readback

The issue body was fetched and parsed as the HSH-PUBLISH-V1 envelope. The canonical artifact was fetched separately.

- Envelope `submission_id` equals the expected ID.
- Envelope `sha256` equals the publisher comment's SHA-256.
- Envelope `content` equals the canonical artifact content exactly: PASS.
- Content length: 15,646 characters / 15,658 UTF-8 bytes.
- Artifact Git blob SHA-1: `fc47372ba50e1f4a6297b2ede6148439f65d6da4`.

No separate trusted local SHA-256 utility was available for a post-publication recomputation. The accepted checksum evidence is the publisher-computed digest, matching the submitted envelope, together with the exact independent content readback. No stronger local-recomputation claim is made.

## Status transition

`SUBMITTED_NOT_VERIFIED` → `PUBLISHED_VERIFIED`.

This amendment closes the pending publisher step. It does not create a second issue, retry, duplicate artifact, reader target, or worker assignment. The original receipt remains unchanged as the contemporaneous record of submission state.
