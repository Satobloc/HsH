# Meridian h869:s2 — Amendment 01: publisher rejection

- Canonical issue: #1826
- Submission ID: meridian-h869-s2-lane24-empirical-readout-20261116t0524z-001
- Report path: WORKSPACES/MERIDIAN/2026-11-16T0524Z_H869_S2_LANE24_EMPIRICAL_GEOMETRY_READOUT_AUDIT.md
- Report SHA-256: 1d2fffbf5b78cf3b7b87de84514b951c68e92f2fea071e3508ef4e11aab89d8f
- Payload content and workspace report: exact string match
- Payload schema submitted: HSH-PUBLISH-V1
- Publisher-required schema: hsh-publish-v1
- Publisher comment: REJECTED: invalid schema
- Publisher validator source: tools/issue_publish.py, blob 7067e8d9f27a273d90e443afb0493260d9a3ecbf
- Workflow run #43812792961 completed at the workflow level but validation rejected the payload. Run #43812797774 was still in progress at last readback.
- Canonical PUBLISHED_SUBMISSIONS artifact: NOT FOUND
- Publication status: PUBLISHER_REJECTED / NOT_PUBLISHED

The four payload keys, submission ID, content length, and SHA-256 are valid. The sole confirmed validation defect is the schema string's case. The publisher requires lowercase hsh-publish-v1.

No issue body edit, reopen, retry, duplicate issue, direct write to PUBLISHED_SUBMISSIONS, or publisher bypass was performed. Issue #1826 remains the audit record. The internal workspace report and its checksum remain intact.

Future intake must use the exact lowercase schema value; this amendment does not authorize retrying #1826 or creating a duplicate submission.