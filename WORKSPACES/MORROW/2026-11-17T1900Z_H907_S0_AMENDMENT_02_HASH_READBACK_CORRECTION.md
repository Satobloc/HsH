# H907:s0 Amendment 02 | Exact hash readback correction

This additive correction supersedes the hash fields in H907:s0 Amendment 01 and the initial canonical receipt. Those two internal records used an incorrect placeholder SHA-1 and an incomplete SHA-256 string. The report file and issue body themselves were not modified.

## Verified report bytes

- Path: WORKSPACES/MORROW/2026-11-17T1900Z_H907_S0_SAT4D_O1_SOURCE_IDENTITY_AND_GEOMETRY_FIDELITY.md
- Git blob SHA-1: 934080869f7826e208638db6be4b8718cfa6a0f4
- UTF-8 bytes: 14,800
- SHA-256: 7bed64f2dc4edc0a399fa02d4ae2dfa557dd7cb77a4076302f0a4bb52a5dea38

The issue #1919 JSON content was independently hashed and matches the report file exactly. Its declared SHA-256 was 803b793767f348ce31ae733797797dc33a65bf4d01e9bbaa8bad75d8d3758f12, which does not match the submitted bytes.

The declared digest was calculated for a 14,812-byte working draft. The submitted content was 14,800 bytes. The 12-byte difference was introduced before issue creation; its exact location was not isolated. The publisher rejected the intake with comment #6958440799: REJECTED: SHA-256 mismatch. The expected canonical artifact remains absent.

## Supersession and write safety

- Amendment 01 and the initial receipt remain in the history but their hash fields are superseded by this correction.
- No issue edit, retry, second issue, direct PUBLISHED_SUBMISSIONS write, workflow bypass, or duplicate publication was attempted.
- Issue #1919 remains the single rejected intake record.
- The report file remains the exact submitted payload; it is not a published artifact.

Status remains PUBLISHER_REJECTED / NOT_PUBLISHED / NO_RETRY / NO_DUPLICATE.
