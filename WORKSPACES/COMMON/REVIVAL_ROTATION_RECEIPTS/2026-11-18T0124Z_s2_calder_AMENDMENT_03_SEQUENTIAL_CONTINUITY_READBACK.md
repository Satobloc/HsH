# Amendment 03 | Sequential continuity readback — Calder h913:s2

**Status:** CONTINUITY_REPAIRED / READBACK_VERIFIED. This amendment supersedes the “being corrected sequentially” note in Amendment 02.

- The earlier parallel update attempt to the optional Hale packet was not present in the main-branch readback. No unsupported commit is treated as canonical.
- Packet was then updated sequentially: commit `9721d6e40dedf283471e37f4e2193fdb88f76dc5`; current blob `3934a1fe0d05a6415bf557a595d1516639c3a33a`. Readback includes `PUBLISHED_VERIFIED` and the 01:29:58Z discovery-refresh amendment.
- Calder CURRENT_WORK, BOOT, and Hale INBOX were updated sequentially and fetched back. Their top checkpoint/pointer now reports the post-write snapshot and publisher verification; Hale's report link is corrected to the Calder workspace path.
- Latest observed main commit: `a4dd17ae39cf7ddcf5fe3440265e85b86baf158e`, 2026-11-18T01:32:20Z.
- These continuity writes occurred after the 01:29:58Z discovery snapshot and are not yet indexed in that snapshot. They will appear in a later automatic refresh; no snapshot was manually edited or forced.

No second publisher submission, retry, duplicate, issue/label mutation, route probe, site-policy/code change, theory change, task/ID/schedule mutation, or sixth task.
