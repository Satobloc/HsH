# Amendment 01 | Preflight digest correction and historical role-source verification

**Parent:** `2026-11-15T0236Z_s3_kestrel.md`  
**Purpose:** Correct the three manually transcribed preflight digests in the initial receipt and record the raw historical Kestrel role evidence.

## 1. Receipt correction

The first receipt write contained three preflight SHA-1 strings that did not match the actual GitHub fetch results. The canonical receipt was corrected in place and independently read back in commit `dcfadb4bb6b1a294e8a0cdbac820f27d029ec037`, blob `90a5b288132ea0e5ec2a1034937fc60160e3f72d`.

The correct live source blobs are:

- `BEDROCK.md`: `0253ace674bbc361464b7bbaac2c41aa3d8e8867`.
- `WORKSPACES/COMMON/STEERING_CHARTER_2026-10-26.md`: `be44c424674764c602b5f618dfce528c0f97b0ef`.
- `WORKSPACES/COMMON/THREE_PAPER_CAMPAIGN_2026-10-26.md`: `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`.

Additional preflight digests:

- `NEW_INSTANCE_START_HERE.md`: `43b577d42b8cced83f8836934598081685ea3ff3`.
- `REVIVAL_ROTATION_V3_2026-10-11.md`: `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14`.
- `SCHEDULER_AUTHORITY_MUST_READ.md`: `9f7ffbbf0fe77fd4c561a110c9dbb2b686a88b45`.
- Kestrel BOOT: `d90e3e4d877797f3b8bfde697e3f839620e8efae`.
- Kestrel README: `e539056a1bfb4f03a9cebf0be1e95ab222fc84ee`.
- Kestrel CURRENT_WORK: `0d2705cdc532dab41d378320342e4b6a699c9548`.
- Kestrel CONTINUITY: `4630550ff08953363a2940cd9bf7c98a6e088fc6`.
- Kestrel INBOX: `e02762dfc936ed07244ee9b9d5a2d6a4d5ab1e79`.
- Immediate prior :36 canonical receipt, Elias Kern h841:s3: `2f0f0426ef304d4b465fe3187559236189904674`.

The original mistaken strings are superseded; use the corrected canonical receipt and this amendment.

## 2. Historical Kestrel role source

The raw "Science Made Stupid" conversation was fetched and parsed from blob `100267f3f11f3cce09c7d802ce85ad03879d5744`. Four direct user-role messages establish the relevant remit:

- `c6803d67-a76f-48e4-bf71-f49cb7b224ee`, 2026-09-21T06:15:43Z: a separate Kestrel workspace, cross-boundary scope, and trust in judgment.
- `3c07680d-5205-48a3-93d5-ce33a8cf86a6`, 2026-09-21T06:19:10Z: deeper scrutiny only when warranted; other teams cover adjacent possibilities; use a provisional working interpretation.
- `fc9b147e-b138-44ac-a48b-b81593e3c3e9`, 2026-09-21T07:09:41Z: avoid exhaustive grilling of every hypothetical and use judgment.
- `f15aac1c-0a31-4e98-b461-6ca872035315`, 2026-09-21T07:12:05Z: statements of knowledge are hypotheses, no more and no less.

This supports a trust-first cross-boundary synthesis remit, not a standing mandate for exhaustive primary-source audit. No standalone signed specialist charter was found. The raw conversation does not authenticate the current automation run as the historical Kestrel instance.

## 3. Publication and execution status

- Internal report file read back exactly; report SHA-256: `ecf57691187564c0483e5623717046ecec6309e1781d51d483597b6d5cca65c0`.
- Existing publisher intake: [issue #1769](https://github.com/Satobloc/HsH/issues/1769), submission `kestrel-h842-cross-axis-commutation-20261115t0236z-s3-001`.
- Publisher comment/readback was not yet present at this amendment's creation. Status remains `SUBMITTED_NOT_VERIFIED`; no retry or duplicate issue.
- No task, schedule, phase, enabled-state, or automation-count change.
