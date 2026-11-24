# Amendment 01 | Publisher SHA-256 rejection

**Parent receipt:** [h1076:s3 Aldus](2026-11-24T2036Z_s3_aldus.md)  
**Intake issue:** https://github.com/Satobloc/HsH/issues/2518  
**Publisher response:** https://github.com/Satobloc/HsH/issues/2518#issuecomment-7144784961

At 2026-11-24T21:19:48Z, the existing issue publisher commented: `REJECTED: SHA-256 mismatch`.

The four-key `hsh-publish-v1` envelope and unique submission ID were accepted as an issue intake, but the declared digest was computed from a report string with one final newline. The JSON `content` field stored in the issue body has no final newline.

- Declared SHA-256: `7858ffab57fbdc67d08f1bcc55dfad02f57827c435d4f578f7d483d041fea2ba`.
- Stored issue content length: 11,249 characters; no trailing newline.
- Recomputed SHA-256 for the stored content without the final newline: `0808f4f0c7edbea90335f91d5bb91dfbe6254cdc0900967b30bfbb5ee4c1f11b`.
- UTF-8 size of the stored content: 11,257 bytes.
- Expected canonical artifact path `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aldus-h1076-s3-interval-censored-public-t0-20261124t2036z-001.md` returned 404.

**Disposition:** `PUBLISHER_REJECTED_SHA256_MISMATCH / NOT_PUBLISHED`.

The issue body preserves the submitted report text, but it is not a canonical published artifact. No issue edit, reopen, retry, duplicate submission, manual canonical-file write, or publisher bypass was made. Do not create a second issue for the same run. The failed intake remains an immutable rejection record.

The Lean status is unchanged: `LEAN_UNTESTED`; the PR remains open/draft/unmerged. No theory, physical, scheduler, task, or campaign status changed.
