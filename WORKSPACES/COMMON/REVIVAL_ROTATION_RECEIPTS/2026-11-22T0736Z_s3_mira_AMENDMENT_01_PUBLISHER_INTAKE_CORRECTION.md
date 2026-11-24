# Receipt Amendment 01 | Publisher intake correction | h1015:s3

This is an append-only correction to the h1015:s3 receipt. The original receipt accurately records the initial submission attempt as pending at the time it was written; subsequent publisher evidence changed the status.

## 1. Initial intake rejection

Issue [#2331](https://github.com/Satobloc/HsH/issues/2331) was rejected by the existing publisher:

- Publisher response: [comment #7076200969](https://github.com/Satobloc/HsH/issues/2331#issuecomment-7076200969)
- Exact response: `REJECTED: Expecting value: line 1 column 1 (char 0)`
- Cause: the initial body included a `HSH-PUBLISH-V1` text prefix and used an incorrect envelope shape. The publisher requires the issue body itself to be raw JSON with exactly `schema`, `submission_id`, `content`, and `sha256`; schema value must be `hsh-publish-v1`.
- No canonical artifact was created from #2331.

The rejection was not bypassed. No direct write to the published-submissions directory was made.

## 2. Corrected intake

A corrected envelope was submitted as [issue #2333](https://github.com/Satobloc/HsH/issues/2333), using the same submission ID and exact content SHA-256:

- Submission ID: `assistant-h1015-s3-evidence-gated-candidate-admission-20261122t0736z-001`
- Content SHA-256: `fe618ec12a89d4395fdd74aef23d21c69bd8bb4458ad4d32e898fd657bc07d93`
- Correct schema: `hsh-publish-v1`
- Body: raw JSON only, exactly four required keys.
- The corrected issue has no publisher response yet.
- The canonical artifact path remains absent on readback.

Status: **SUBMITTED_NOT_VERIFIED**. Do not claim publication success until the existing publisher posts a receipt and the canonical artifact is independently read back with the expected digest.

Issue #2331 remains the rejection audit record. Issue #2333 is the corrected intake, not a second artifact. No third issue or duplicate submission was created.

## 3. Return action

Check issue #2333 for the existing publisher response. If accepted, verify the canonical artifact byte-for-byte and append a second receipt amendment. If the publisher does not trigger or returns another error, preserve the pending state and diagnose the trigger/validation boundary; do not write around the publisher.
