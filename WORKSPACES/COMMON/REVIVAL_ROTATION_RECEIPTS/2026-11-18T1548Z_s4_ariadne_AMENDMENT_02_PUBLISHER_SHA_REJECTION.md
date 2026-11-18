# H927:s4 amendment 02 | publisher checksum rejection

Issue **#1988** publisher comment: `REJECTED: SHA-256 mismatch`. Expected artifact `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ariadne-h927-s4-kerr-transcript-source-custody-20261118t1548z-001.md` returned 404. Status: **PUBLISHER_REJECTED_SHA / NOT_PUBLISHED**.

- Report file and issue-payload `content` compare exactly.
- Declared SHA-256: `c5b85159bd3d653d4665f26e7e6ffb0c6a82d20b9819703050eb30c50d1fafd8`.
- Independently recomputed SHA-256 of exact 5,784-byte UTF-8 content: `add83330634e5df9f7532dc5377ae173ad0fe8797a8babf731798d6fbea2a763`. The local SHA-256 implementation was checked against the standard `abc` vector.
- The original issue body and workspace report are preserved. No retry, issue edit, duplicate issue, or direct write to the publisher destination was made.

Research/report status is unchanged; only publication failed.