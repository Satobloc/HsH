# Amendment 01 | Orson h835:s4 receipt | Publisher outcome

**Date:** 2026-11-14T20:08Z  
**Classification:** PUBLISHER_REJECTED / NOT_PUBLISHED / NO_RETRY

- Existing intake issue: [#1749](https://github.com/Satobloc/HsH/issues/1749), submission ID `orson-p1-manuscript-readiness-20261114t1948z-s4-001`.
- Publisher workflow run [#43635734493](https://github.com/Satobloc/HsH/actions/runs/43635734493) completed with conclusion SUCCESS, but the publisher comment [#6883490752](https://github.com/Satobloc/HsH/issues/1749#issuecomment-6883490752) is `REJECTED: SHA-256 mismatch`. The workflow's SUCCESS means the validation/rejection path completed; it is not publication success.
- Cause identified: the raw JavaScript template literal preserved escape backslashes before inline-code backticks, while the declared SHA-256 was computed from the unescaped local Markdown file.
- Expected canonical artifact `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/orson-p1-manuscript-readiness-20261114t1948z-s4-001.md` returns HTTP 404. No artifact, checksum readback, or public publication exists.
- No corrected issue, retry, replacement submission, duplicate artifact, direct repository write, or issue-body edit was made. Preserve #1749 as the rejected intake record.
- P1 remains OPEN / OVERDUE / NOT READY. The internal manuscript draft remains unreviewed; this publication failure does not alter the P1 protocol freeze or paper gate.
