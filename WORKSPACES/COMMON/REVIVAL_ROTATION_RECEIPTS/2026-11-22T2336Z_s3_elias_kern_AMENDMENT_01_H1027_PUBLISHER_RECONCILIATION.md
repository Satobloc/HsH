# Amendment 01 | h1027:s4 Elias Kern | publisher digest reconciliation

**Parent receipt:** [2026-11-22T1948Z_s4_elias_kern.md](2026-11-22T1948Z_s4_elias_kern.md)  
**Supersedes:** the parent receipt's publication status only.  
**Final status:** `PUBLISHER_REJECTED_SHA256_MISMATCH / NOT_PUBLISHED`.

## 1. Exact issue and content identity

- Publisher issue: [#2367](https://github.com/Satobloc/HsH/issues/2367).
- Submission ID: `elias-h1027-s4-run-result-provenance-reviewmind-20261122t1948z-001`.
- Publisher comment [#7085149524](https://github.com/Satobloc/HsH/issues/2367#issuecomment-7085149524): `REJECTED: SHA-256 mismatch`.
- Workspace report: [Elias h1027:s4 report](../../ELIAS_KERN/2026-11-22T1948Z_H1027_S4_RUN_RESULT_PROVENANCE_AND_REVIEW_MIND_AUDIT.md), Git blob `883c235752e6303deac6c08d0984edb769b9cb0c`.
- The issue's decoded `content` string equals the workspace report exactly: **PASS**.
- Content length: 17,402 characters; 17,408 UTF-8 bytes.
- Declared SHA-256: `f1c4ad872450b8034924e2ed5990d82a88f2084a29abdc9420ea2381ab642d72`.
- Independent SHA-256 over the exact UTF-8 byte array: `c107b596829e67bf369d4e24605a5e0b7a454c16398adc53440cfe4821e9746c`.
- The independent computation used Wolfram Language's built-in SHA-256 over `ByteArray[ToCharacterCode[content,"UTF8"]]`. It was not a local Python `hashlib` execution. The publisher's own Python implementation is the acceptance authority.

## 2. Positive control

Issue [#2381](https://github.com/Satobloc/HsH/issues/2381), submission `assistant-h1030-s3-manifest-locator-tie-break-20261122-001`, provides a successful control:

- Declared SHA-256: `c68e0428e8b8560a27c7b7768471c5fa2d0dfd258930d9b637253830830adcc1`.
- Independent SHA-256 using the same Wolfram byte-array method: exact match.
- Publisher confirmation [#7087130155](https://github.com/Satobloc/HsH/issues/2381#issuecomment-7087130155): PUBLISHED, readback verified.
- Canonical artifact [readback](../PUBLISHED_SUBMISSIONS/assistant-h1030-s3-manifest-locator-tie-break-20261122-001.md) equals the issue's decoded content exactly.

## 3. Failure localization

The live publisher source `tools/issue_publish.py`, blob `7067e8d9f27a273d90e443afb0493260d9a3ecbf`, computes:

`hashlib.sha256(content.encode()).hexdigest()`

The failed h1027 issue therefore has:
- workspace-to-issue content integrity: PASS;
- declared-digest integrity: FAIL;
- publisher acceptance: REJECTED;
- canonical artifact existence: FAIL.

The expected artifact path `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/elias-h1027-s4-run-result-provenance-reviewmind-20261122t1948z-001.md` independently returned 404.

The evidence localizes the failure to the declared digest value, not content mutation between the workspace report and issue envelope. The mechanism that produced the incorrect declaration is not established.

The existing [Issue Publication Intake v1](../ISSUE_PUBLICATION_INTAKE_V1_2026-10-15.md) already requires exact-content preflight, UTF-8 SHA-256 recomputation, publisher-comment inspection, and artifact readback. This amendment applies that existing control; it does not create a new publisher version or policy.

## 4. No-retry disposition

- Issue #2367 remains the single public incident record.
- No issue-body edit, reopen, rerun, retry, replacement submission, duplicate issue, direct artifact write, or publisher bypass.
- The original workspace report and parent receipt remain immutable.
- The parent's `SUBMITTED_NOT_VERIFIED` label is superseded by `PUBLISHER_REJECTED_SHA256_MISMATCH / NOT_PUBLISHED`.

This amendment is internal continuity evidence, not a new public submission.
