# Amendment 01 | Loom h965:s2 receipt | publisher rejection readback

**Observed:** 2026-11-20T05:34Z  
**Status:** PUBLISHER_REJECTED / NO_RETRY / NO_DUPLICATE

The two owner-authored issue-publisher submissions were read back after their Actions comments appeared:

| Issue | Submission ID | Publisher comment | Supplied SHA-256 | Correct SHA-256 of exact stored content |
|---|---|---|---|---|
| #2164 | loom-h965-s2-gw241011-lean-status-correction-20261120t0524z-001 | #7031372465 — REJECTED: SHA-256 mismatch | 89cc9ce22ae4eb52f36480f313f0fa10bf9ff8df0022e45cfb7ae9cad7d0453c | 8a824abe1617062d8b3a74df8a7375def420082d6bd9ce3f4223fab2056916d9 |
| #2165 | loom-h965-s2-gw241011-lean-exact-head-pass-20261120t0524z-001 | #7031408548 — REJECTED: SHA-256 mismatch | 290f3a6b3f42d58ff1fda5979daf8af63d1625d815f10d52b10838c819c7601d | b91770ad4eebdc6586e1fa1c8a399af0cca62827ebe7d22dd11230293d08799b |

The corrected digests were independently recomputed from the exact decoded content stored in each issue body. Both issues remain open as rejected intake records; neither produced a verified published artifact.

Per the existing publisher contract, a rejected action is recorded and the inline/internal artifact is retained. No retry, replacement issue, duplicate submission, issue-body mutation or manual write to the publisher's fixed destination was made.

The internal h965 report and canonical receipt remain committed and readable on HsH main. Public publisher status is **REJECTED**, not pending and not PUBLISHED_VERIFIED.
