# H1062:s4 Amendment 05 | Postwrite discovery freshness

**Purpose:** supersede only Amendment 04's latest-main/currentness locator after the public correction and continuity writes.

At the post-publication readback, HsH main was at c33c749ff3aaaaf13b3b2670032aa96f43870004, committed 2026-11-24T07:39:07Z by the Morrow CURRENT_WORK pointer update. The previous generated-discovery refresh was commit 2d5fd7bf20f0ff8bced7a8da7ff5fcaeaeaf86a4 at 07:14:48Z, changing only PUBLIC_SITE/generated/discovery.json (blob 1e74614d7e9604d8e48a2c976d8e291430d3ed46).

The last known generated-discovery refresh therefore predates the publisher artifact and subsequent Morrow report, receipt, BOOT and CURRENT_WORK writes. The 31.5 MB payload was not parsed, and no later postwrite refresh was observed. **P0 discovery currentness remains PENDING / UNVERIFIED.** No freshness PASS, record-safety acceptance or live visitor-route acceptance is claimed. Record safety remains FAIL from the last complete parse.

No manual refresh, duplicate publisher submission, code repair, deployment or release action was attempted. This amendment supersedes only the latest-main/currentness locator in Amendment 04; all other findings remain unchanged.

The :48 host run 8a7bf8a6-1910-832d-974d-feb1d2a14856 remained IN_PROGRESS at the final scheduler peek, with chat_ref=null. The original task identity, schedule, phase and enabled state remain unchanged.
