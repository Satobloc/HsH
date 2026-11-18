# H927:s3 Amendment 01 | Run-key and publisher SHA correction

The workspace report and publisher intake #1987 preserve the original submitted bytes. Two defects are corrected by this amendment; the original report/issue body is not edited, and no duplicate submission or direct write to the canonical publisher destination is made.

## Run key
The report content contains `REVROT3-19-20261118:927:s3`. Correct key is `REVROT3-19-20261011:927:s3`. The nominal slot remains 2026-11-18 15:36 UTC, h=927, seq=4638, ring index 2=Aster, next index 3=Ariadne.

## SHA
Issue #1987 publisher comment #6983487949: REJECTED: SHA-256 mismatch.

- Declared/submitted digest: `05ee3c388dcb84ca9f977f7d2a522ffe674c03ee570435363d2b7a8546f5e270`
- Actual digest of exact issue-body content: `49786cf058283ea1ae4b3665966ff04736edd4bf9322aaf58d1067496897f2e9`
- Content length: 10,485 Unicode characters / 10,497 UTF-8 bytes.
- The digest routine was checked against the standard SHA-256 `abc` vector.
- Workspace report readback exactly matched issue #1987 content. Expected canonical publisher path returned 404.

Correction comment #6983516943 records the run-key fix. Status: `PUBLISHER_REJECTED_SHA_MISMATCH / NOT_PUBLISHED`. No issue-body edit, retry, duplicate, or direct canonical-file write.
