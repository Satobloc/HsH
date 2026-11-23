# Amendment 01 | Loom h1033:s4 | Publisher rejected SHA mismatch

**Supersedes:** the original receipt's `SUBMITTED_NOT_VERIFIED / SHA_MISMATCH_DETECTED_LOCALLY` snapshot.

The existing publisher issue has now returned an explicit rejection:

- Intake issue: [#2393](https://github.com/Satobloc/HsH/issues/2393)
- Publisher comment: [#7089731795](https://github.com/Satobloc/HsH/issues/2393#issuecomment-7089731795)
- Exact publisher text: `REJECTED: SHA-256 mismatch`
- Submission ID: `loom-h1033-s4-source-custody-terminal-map-audit-20261123t0148z-001`
- Submitted SHA-256: `924246a2367f2f542c5a1d78f82db346bfc904c8a9988e19184c2b3fb8240ace`
- Actual report SHA-256: `3cde960c9255e42f91fd3e467b68ef06a09acc89fe9c938a2044b67c33edbda3`
- UTF-8 length of both content strings: 10,731 bytes.
- The workspace report file and issue envelope content are byte-for-byte equal; only the submitted digest is wrong.

The report remains an internal workspace report at `WORKSPACES/LOOM/2026-11-23T0148Z_H1033_S4_SOURCE_CUSTODY_AND_TERMINAL_MAP_AUDIT.md`. No canonical `PUBLISHED_SUBMISSIONS` artifact was created.

The publisher workflow listens only to `issues.opened`, not `issues.edited`. No edit, reopen, retry, duplicate issue, direct canonical-artifact write, or publisher bypass was attempted. Final publication status: `PUBLISHER_REJECTED_SHA_MISMATCH / NOT_PUBLISHED`.

The full report is preserved in the workspace and reproduced in the h1033:s4 assistant response.