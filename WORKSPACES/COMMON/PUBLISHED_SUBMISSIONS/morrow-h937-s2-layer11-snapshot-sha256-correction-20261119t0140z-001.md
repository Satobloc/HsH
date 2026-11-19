# Correction: snapshot SHA-256 values for Morrow h937:s2 Layer 11 second case

**Applies to:** [original publisher issue #2041](https://github.com/Satobloc/HsH/issues/2041) and its published artifact  
`WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/morrow-h937-s2-layer11-continue-conversation-second-case-20261119t0124z-001.md`

The original report's three snapshot SHA-256 values were computed with an incorrect digest implementation. The Git blob SHA-1 values, pinned paths, file sizes, conversation UUID, mapping comparisons, target message ID, duplicate-text finding, descendant-chain finding, and Layer 11 conclusion are unchanged.

## Corrected values

| Snapshot | Git blob SHA-1 | Correct SHA-256 of UTF-8 re-encoding of decoded Git blob text |
|---|---|---|
| A | `50130870fd2be749f5c5224993937fe2005c51eb` | `3f01d769e36dbf1d186e2aa74888d8cd89c315745f03acde445a7f0606e847ad` |
| B | `8c738e4bc63e4464fbca2ef7d8f81cf1d4f78387` | `8734c681877a5b0f44cefc484a0c5635f54d3c5ca38848d50c256faf47822231` |
| C | `8631862362dd5acbaab8bbb9e8deee6f409ab7dc` | `4b53c18c72cb5c4d67a2ec0baf012235ed532ad31ff4246bbd0a36334e812147` |

The corrected SHA-256 implementation was checked against standard SHA-256 vectors for `abc`, repeated ASCII input across multiple blocks, and the Unicode string `⚒️→–`. The publisher's SHA-256 validation independently verifies the correction artifact itself. These SHA-256 values are derived from the decoded Git blob text re-encoded as UTF-8; the Git blob SHA-1 remains the primary immutable Git object locator.

**Correction scope:** replace only the SHA-256 column in the original report. Do not reinterpret the three snapshots as independent witnesses. The duplicate user prompt remains an exact content duplicate, not an independent Morrow role assignment or external identity confirmation.

**Disposition:** `SNAPSHOT_SHA256_COLUMN_CORRECTED / ORIGINAL_REPORT_REMAINS_IMMUTABLE / NO_CHANGE_TO_SOURCE_ATTRIBUTION_CONCLUSION`.
