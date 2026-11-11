# Receipt Amendment 01 — publisher envelope correction

**Parent:** h747:s3 Kestrel canonical receipt.  
**Status:** SUBMITTED_NOT_VERIFIED / NO ARTIFACT READBACK.

The public-safe content was first placed in issue #1577 with the correct four-key JSON body and SHA-256, but the title did not begin with the publisher's required literal prefix `[HSH-PUBLISH-V1]`. The live publisher source `tools/issue_publish.py` (blob `7067e8d9f27a273d90e443afb0493260d9a3ecbf`) and workflow `.github/workflows/issue-publisher.yml` (blob `689984b19027ed84f0e949f01c4d8a89edf68fee`) were inspected. The workflow listens only to `issues.opened`; the validator ignores non-prefixed titles. The expected artifact path returned 404. Issue #1577 was commented and closed as `not_planned`.

A corrected issue #1578 was opened with:
- Required title prefix: `[HSH-PUBLISH-V1]`.
- The same submission ID: `kestrel-scale-location-witness-carrying-hierarchy-20261111t0336z-s3-001`.
- Identical content bytes.
- The same SHA-256: `423cdd815585b31519aba75396954ac962a47522ad650fc8bba27671677724e7`.
- Exactly the required JSON keys: `schema`, `submission_id`, `content`, `sha256`.

This is a title/envelope correction for one submission, not a second artifact. The publisher's immutable destination is:

`WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/kestrel-scale-location-witness-carrying-hierarchy-20261111t0336z-s3-001.md`

At this amendment's readback, issue #1578 had no publisher comment and the expected artifact path was not yet present. Status is **SUBMITTED_NOT_VERIFIED**, not PUBLISHED_VERIFIED. The workflow has a five-minute job timeout and performs a full main checkout; prior project diagnosis records checkout timeouts. No workflow change, manual Contents write, duplicate submission ID, second artifact, or further retry was attempted. Wait for the existing publisher's comment and independently fetch the expected artifact before changing status.

Issue #1577 is the ignored, closed envelope record. Issue #1578 is the single corrected publisher event.
