# Meridian h869:s2 — Amendment 01: publisher rejection

> **Superseded digest statement:** The issue content and workspace report text do match exactly, but the declared SHA-256 did not. Amendment 02A's intermediate recalculation was also wrong. The correct report SHA-256 is `4967101246815448db01df581cd2b3ce4efd4ef8fd8c84ccc34b582cf762ecca`; see [Amendment 03](2026-11-16T0524Z_s2_meridian_AMENDMENT_03_SHA256_IMPLEMENTATION_CORRECTION.md). The publisher rejection remains `invalid schema` because schema validation precedes digest validation.

- Canonical issue: #1826
- Submission ID: meridian-h869-s2-lane24-empirical-readout-20261116t0524z-001
- Report path: WORKSPACES/MERIDIAN/2026-11-16T0524Z_H869_S2_LANE24_EMPIRICAL_GEOMETRY_READOUT_AUDIT.md
- Correct report SHA-256: 4967101246815448db01df581cd2b3ce4efd4ef8fd8c84ccc34b582cf762ecca
- Incorrect digest submitted in issue payload: 1d2fffbf5b78cf3b7b87de84514b951c68e92f2fea071e3508ef4e11aab89d8f
- Payload content and workspace report: exact string match
- Payload schema submitted: HSH-PUBLISH-V1
- Publisher-required schema: hsh-publish-v1
- Publisher comment: REJECTED: invalid schema
- Publisher validator source: tools/issue_publish.py, blob 7067e8d9f27a273d90e443afb0493260d9a3ecbf
- Workflow runs #43812792961 and #43812797774 both completed at the workflow level; publisher validation rejected the payload. Workflow success does not mean publication success.
- Canonical PUBLISHED_SUBMISSIONS artifact: NOT FOUND
- Publication status: PUBLISHER_REJECTED / NOT_PUBLISHED

The payload contains four keys and the expected submission ID, but the schema is uppercase `HSH-PUBLISH-V1`; the validator requires lowercase `hsh-publish-v1`. The validator checks schema before SHA-256, so its rejection comment reports the schema defect first. Independent recomputation found the submitted digest also does not match the report content. See Amendment 03 for the verified digest and source-byte checks.

No issue body edit, reopen, retry, duplicate issue, direct write to PUBLISHED_SUBMISSIONS, or publisher bypass was performed. Issue #1826 remains the audit record. The internal workspace report and its checksum remain intact.

Future intake must use the exact lowercase schema value; this amendment does not authorize retrying #1826 or creating a duplicate submission.