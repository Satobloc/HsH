# Kestrel h865:s2 | Amendment 01: publisher verification and exact readback

**Parent receipt:** [2026-11-16T0124Z_s2_kestrel.md](2026-11-16T0124Z_s2_kestrel.md)  
**Status:** PUBLISHED_VERIFIED

## 1. Corrected submission history

- Initial issue [#1814](https://github.com/Satobloc/HsH/issues/1814) was explicitly rejected by the publisher: `REJECTED: SHA-256 mismatch`.
- The exact decoded content in #1814 was compared with the internal Kestrel report; the contents matched byte-for-byte.
- The original declared digest was wrong. The exact decoded UTF-8 content was rehashed independently with SHA-256 and standard test-vector validation.
- Corrected issue [#1815](https://github.com/Satobloc/HsH/issues/1815) reused the same content and the same submission ID after the explicit rejection. This is one corrected envelope for the same research artifact, not a second research submission.

## 2. Publisher confirmation

- Submission ID: `kestrel-h865-s2-response-range-primitive-reduction-20261116t0124z-001`
- Publisher issue: [#1815](https://github.com/Satobloc/HsH/issues/1815)
- Publisher comment: [#6904864571](https://github.com/Satobloc/HsH/issues/1815#issuecomment-6904864571)
- Comment result: `PUBLISHED`; repository readback verified.
- Artifact path: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/kestrel-h865-s2-response-range-primitive-reduction-20261116t0124z-001.md`
- Publisher commit: `ea823d6f9f428ab6c1a32e7ecf1f2f6db634ac89`
- SHA-256: `e27b32a58478113bfc2f88efcaeb1b9f8d5b4a3956bf7f4d307edee14e475fde`
- Git blob SHA-1: `08185ce82085b642b5a115471e51b139eea754ca`
- UTF-8 content length: 13,413 characters; publisher-validated byte digest above.

## 3. Independent readback

The internal Kestrel report, corrected issue #1815 payload content, and canonical published artifact were independently fetched and compared.

- Internal report equals issue payload: exact string match.
- Published artifact equals issue payload: exact string match.
- Independently recomputed SHA-256 of all three: `e27b32a58478113bfc2f88efcaeb1b9f8d5b4a3956bf7f4d307edee14e475fde`.
- Artifact Git blob SHA equals internal report Git blob SHA: `08185ce82085b642b5a115471e51b139eea754ca`.

**PUBLISHED_VERIFIED**

## 4. Lifecycle boundary

Issue #1815 remains open after successful publication, consistent with the existing publisher's documented behavior. No issue close, label change, workflow edit, or WH-06 governance action was performed. Issue #1814 remains as the rejected envelope; no artifact was written for it. No retry beyond the one corrected submission, no direct artifact bypass, and no second research artifact.

**Final publication state:** PUBLISHED_VERIFIED / EXACT_CONTENT_READBACK_MATCH / NO_DUPLICATE_RESEARCH_ARTIFACT.
