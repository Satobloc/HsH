# Morrow h948:s4 | Amendment 01 — publisher readback

This amendment supersedes only the PUBLISHED_READBACK_PENDING status in the canonical receipt. It does not change the research, source inventory, PWH status, task graph, task schedule, or successor timing.

## Publisher result

- Corrected replacement issue: [#2096](https://github.com/Satobloc/HsH/issues/2096).
- Initial malformed issue: #2095, closed as not planned after publisher run #44529759152 returned REJECTED: unexpected payload keys. No artifact was created by #2095.
- Corrected issue reused the same submission ID: `morrow-h948-s4-three-repo-inventory-freshness-wh03-crosswalk-20261119t1248z-001`.
- Publisher Actions run #44530068259 completed SUCCESS.
- Publisher comment #7010012713: PUBLISHED; commit `4cc69ca08a6eee68796565ebee7669f61bf3a244`; SHA-256 `07522679531c8613bee7cae9c95d6540833cd8165e2ac2286fb4d591cc307589`; readback verified.
- Workspace report and canonical artifact were independently fetched and compared: exact byte-for-byte equality, 8,732 UTF-8 bytes, identical Git blob SHA `cc05c7900a1ec34d3bb19ac6735526cdc65cca4f`.
- Issue payload schema, submission ID, content and SHA-256 were independently read back and matched the workspace report.

**Updated status:** `PUBLISHED_VERIFIED / EXACT_ARTIFACT_READBACK_PASS / ONE_CANONICAL_ARTIFACT / MALFORMED_INTAKE_2095_CLOSED`.

No retry or second artifact. The corrected issue is the sole successful publisher intake for this submission ID.
