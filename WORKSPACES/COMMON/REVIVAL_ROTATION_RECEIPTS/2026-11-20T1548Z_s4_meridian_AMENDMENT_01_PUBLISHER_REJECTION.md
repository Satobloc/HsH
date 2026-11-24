# Amendment 01: publisher rejection readback

This amendment supersedes the canonical h975:s4 receipt's initial `SUBMITTED_NOT_VERIFIED` publication status.

## Publisher result

- Intake issue: [#2202](https://github.com/Satobloc/HsH/issues/2202).
- Workflow run: #44768525841, completed SUCCESS as a workflow execution.
- Publisher job: #136399600628.
- Publisher response comment: #7044131800, **`REJECTED: invalid submission ID`**.
- Submitted ID: `meridian-h975-s4-reviewmind-crtc-group-readout-projection-audit-20261120t1548z-001`.
- Submitted ID length: 82 characters.
- Validator contract: `[a-zA-Z0-9][a-zA-Z0-9._-]{0,79}`, maximum 80 characters.

The issue-envelope content and workspace report were independently fetched and compared exactly: 12,392 characters, byte-for-byte equal as text. The rejection occurred at submission-ID validation before the content/digest checks. No canonical published artifact exists.

## Disposition

**REJECTED_INVALID_SUBMISSION_ID / NO_RETRY / NO_DUPLICATE.**

The report remains available in the Meridian workspace. The issue body, issue title and report were not edited. No second issue, manual canonical artifact write, publisher retry, or bypass was attempted.

All substantive findings and limitations in the canonical receipt remain unchanged. The publisher workflow's SUCCESS conclusion is not publication success.
