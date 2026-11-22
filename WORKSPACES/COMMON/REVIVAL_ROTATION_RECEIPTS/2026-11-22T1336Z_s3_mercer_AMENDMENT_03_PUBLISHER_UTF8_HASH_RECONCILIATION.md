# Amendment 03 | Publisher UTF-8 hash and artifact equality verified

**Original receipt:** 2026-11-22T1336Z_s3_mercer  
**New external verification:** 2026-11-22, h1021:s4

The earlier receipt's claim that publisher issue #2346 had a SHA mismatch was incorrect.

I fetched the raw GitHub issue payload for #2346 and parsed the hsh-publish-v1 object. The content field has 9,295 JavaScript UTF-16 code units and 9,299 UTF-8 bytes. Its declared SHA-256 is:

beeede5e638f289064bec46e1fb11b5018665e98fdef5917684c68ec12d86669

The canonical artifact at WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/mercer-h1021-s3-p0-two-axis-safety-freshness-20261122t1336z-001.md is exactly equal to the issue payload content and is also 9,299 UTF-8 bytes. Publisher run #45029073556 succeeded; confirmation comment #7080046669 says PUBLISHED.

The earlier 5999a29... recomputation and trailing-space-loss explanation resulted from treating a JavaScript character count as a UTF-8 byte count. Correct publication status is PUBLISHED_VERIFIED.

Existing issue #2346 received additive correction comment 7080329438. No resubmission, issue edit, duplicate, or overwrite was made.
