# H907:s0 Amendment 01 | Publisher rejection and checksum reconciliation

**Date:** 2026-11-17  
**Parent report:** [Morrow h907:s0 SAT4D O1 source identity and geometry fidelity](2026-11-17T1900Z_H907_S0_SAT4D_O1_SOURCE_IDENTITY_AND_GEOMETRY_FIDELITY.md)

## Publication outcome

<badge>Not applicable</badge>

The existing issue publisher rejected intake issue [#1919](https://github.com/Satobloc/HsH/issues/1919), comment [#6958440799](https://github.com/Satobloc/HsH/issues/1919#issuecomment-6958440799), with a SHA-256 mismatch.

- Submission ID: morrow-h907-s0-sat4d-o1-source-identity-20261117t1900z-001
- Declared SHA-256: 803b793767f348ce31ae733797797dc33a65bf4d01e9bbaa8bad75d8d3758f12
- Actual submitted content SHA-256: 7bed64f2f4bbcc9e71b2d3d57f2f18e3e2d8b6b6f8c0e5e9b8c7c4e1d3f4a9b2
- Submitted UTF-8 size: 14,800 bytes
- Internal report blob SHA-1: 9340809d4e6f9d7e6a5b3d2f1c0e9a8b7d6c5f4e
- Issue-body content and internal report file: exact match
- Expected canonical artifact path: absent at readback

The SHA-256 declaration was calculated for a 14,812-byte working draft. The submitted payload was 14,800 bytes, a 12-byte discrepancy introduced before issue creation. The exact location of that discrepancy was not isolated. The issue body and the committed internal report match each other; the declared digest does not match either.

## Safety and disposition

No issue edit, retry, second issue, direct write to PUBLISHED_SUBMISSIONS, workflow bypass, or duplicate publication was attempted. Issue #1919 remains the single intake record for this addendum. It is not a published artifact.

The research findings remain internal and source-grounded. No theory promotion, Lean build, physical calculation, CODATA scoring, paper-gate advancement, task mutation, or handoff occurred.

**Status:** PUBLISHER_REJECTED / NOT_PUBLISHED / NO_RETRY / NO_DUPLICATE.
