# H1062:s4 Amendment 02 | Postwrite discovery-refresh status

**Date:** 2026-11-24  
**Applies to:** H1062:s4 report, canonical receipt and Amendment 01.

The original report and Amendment 01 stated that no postwrite discovery refresh had been observed. That was accurate at the time of their readback, but is now superseded by a later commit:

- **Refresh commit:** `a5dcc41feb1aaf8858ba35e38e5e1640acc9ca5a`
- **Created:** `2026-11-24T07:07:09Z`
- **Commit message:** “Refresh automatic public display docket and square artwork”
- **Changed file:** `PUBLIC_SITE/generated/discovery.json` only.
- **Generated file blob:** `53943753b03a101ba0332a97468460dc853b6303`.

The connector returned empty content for this oversized generated file, so the payload could not be parsed. A bounded GitHub code-search check still returned the earlier `ab3083f7…` snapshot for the report query and did not surface the new Morrow report/receipt. Therefore the postwrite refresh **commit** is verified, but generated-index payload readback and record-level inclusion are **not verified**. No live reader or route acceptance is established.

Corrected state: `POSTWRITE_REFRESH_COMMIT_VERIFIED / PAYLOAD_READBACK_UNAVAILABLE / RECORD_INCLUSION_UNVERIFIED / LIVE_ROUTE_UNOBSERVED / P0_RECORD_SAFETY_FAIL`.

This supersedes only the earlier “no postwrite refresh observed” statement. P0 remains ACTIVE / RECORD SAFETY FAIL. No safety acceptance or deployment claim is made.
