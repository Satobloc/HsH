# Kestrel h892:s0 receipt Amendment 02 | Publisher SHA correction and terminal rejection

**Date:** 2026-11-17T04:22Z  
**Supersedes:** the h892 receipt's creation-time SUBMITTED_NOT_VERIFIED publication status and the expected digest recorded in the BOOT/CURRENT_WORK pointer. The original receipt, report, and issue payload remain unchanged.

## Publisher result

Issue [#1876](https://github.com/Satobloc/HsH/issues/1876) received publisher comment [#6938187784](https://github.com/Satobloc/HsH/issues/1876#issuecomment-6938187784): **REJECTED: SHA-256 mismatch**.

The canonical artifact path is absent (GitHub Contents API returned 404):

`WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/kestrel-h892-s0-map-edge-composition-crosswalk-20261117t0400z-001.md`.

No retry, duplicate issue, manual artifact write, or publisher bypass was attempted.

## Exact content and digest reconciliation

The issue payload content and Kestrel workspace report were fetched independently and compared:

- Issue payload content equals workspace report byte-for-byte: **true**.
- UTF-8 byte count: 21,208.
- Character count: 21,194.
- Incorrect submitted SHA-256: `0f6fc3006152a655b9870a962db7ac26b64a3ed950e592a263d28e0f04c43bad`.
- Correct SHA-256 of the exact shared content: `2ad62274b3f72a98b140bc037c23d3db74bb212e8cbb1aa59fb7f8df49b067c0`.

The corrected digest was computed from the fetched issue/report content using a SHA-256 implementation that passed the standard `abc` known-answer test. The mismatch is in the submitted digest, not a difference between the issue content and workspace report.

## Final state

- Workspace report: committed and read back.
- Publisher issue: open, rejected for SHA mismatch.
- Canonical published-submission artifact: absent.
- Final publication state: **PUBLISHER_REJECTED_SHA_MISMATCH**.
- No resubmission or duplicate issue is authorized by this amendment. The report remains available at its Kestrel workspace path; it must not be represented as PUBLISHED_VERIFIED.

The prior receipt's SUBMITTED_NOT_VERIFIED state was accurate at creation and is now superseded by this terminal publisher result. No theory, source equation, task, schedule, branch, or ownership status changed.