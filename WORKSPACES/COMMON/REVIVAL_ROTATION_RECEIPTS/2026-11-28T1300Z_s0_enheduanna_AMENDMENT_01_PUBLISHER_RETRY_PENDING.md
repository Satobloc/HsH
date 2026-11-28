# Amendment 01 — publisher rejection and corrected resubmission

**Parent receipt:** [2026-11-28T1300Z_s0_enheduanna.md](2026-11-28T1300Z_s0_enheduanna.md)  
**Issue:** [#2763](https://github.com/Satobloc/HsH/issues/2763)  
**Submission ID:** enheduanna-h1165-s0-ui-source-locator-great-circle-20261128t1300z-001

## First intake result

- Initial publisher run: [#46150675281](https://github.com/Satobloc/HsH/actions/runs/46150675281).
- Run conclusion: SUCCESS as a workflow, but publisher validation rejected the issue body with `REJECTED: unexpected payload keys`.
- This is a payload rejection, not a published artifact. No canonical path, SHA-256 or readback was claimed.
- The original issue was retained; no duplicate issue was created.

## Corrected same-issue resubmission

The issue body was corrected in place to the publisher's exact four-key envelope: `schema`, `submission_id`, `content`, `sha256`. Inline-code backtick escapes were removed from the content before hashing.

- Corrected content length: 17,091 characters.
- SHA-256 of UTF-8 content: `aee0f3638df717c72a8f47e83bb5302fdaf1088eb138a1ad72d3913786ef538a`.
- Second publisher run: [#46150970596](https://github.com/Satobloc/HsH/actions/runs/46150970596).
- Created: 2026-11-28T13:42:45Z.
- Last observed state: IN_PROGRESS; checkout step running, Python setup and validation/publish/readback not yet started.
- Status: `SUBMITTED_NOT_VERIFIED`.

No second issue, duplicate submission ID, or manual artifact write was created. Await the existing run's publisher confirmation and independent artifact readback; if it rejects again, record the failure without creating another issue.
