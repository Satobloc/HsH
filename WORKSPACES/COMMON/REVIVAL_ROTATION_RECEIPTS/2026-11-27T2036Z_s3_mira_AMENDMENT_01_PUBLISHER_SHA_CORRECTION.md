# Amendment 01 — publisher envelope correction

The first issue-publisher event for [issue #2714](https://github.com/Satobloc/HsH/issues/2714) was rejected with comment [#7227771331](https://github.com/Satobloc/HsH/issues/2714#issuecomment-7227771331): `REJECTED: unexpected payload keys`.

The issue body initially omitted the required `sha256` field. The same issue and submission ID were corrected in place; no duplicate issue or submission was created.

- Submission ID: `mira-h1148-s3-payload-decision-reference-closure-20261127t2036z-001`.
- Corrected envelope keys: exactly `schema`, `submission_id`, `content`, `sha256`.
- Content length: 9,161 UTF-8 bytes.
- SHA-256: `897f231449b7140725d5981df140b9e30ba829ebd374233c1fe7f07574f261a1`.
- Digest was recomputed from the independently fetched issue content using a local SHA-256 implementation whose `abc` self-test matched the standard digest.
- At this amendment's readback, no successful publisher confirmation comment or canonical artifact was present. State remains `SUBMITTED_NOT_VERIFIED`.

Next action: verify this exact issue, submission ID, expected artifact path and digest. Do not create a second issue or claim publication until the publisher confirms and the canonical artifact is independently read back.
