# H1062:s4 Amendment 01 | Prewrite main-head correction

**Date:** 2026-11-24  
**Applies to:** [Morrow H1062:s4 report](2026-11-24T0648Z_H1062_S4_ASTER_REPOST_SOURCE_CUSTODY_AND_THREAD_FIRST_RECONCILIATION.md) and canonical receipt.

The report's P0 section incorrectly named `6838b1d5f7f3675c736e962c8a44a215f9020af8` as the prewrite main head. The fresh main-head search immediately before the first workspace write returned:

- **Correct prewrite main head:** `ab3083f7f2fa6d7a9d54553b8bcbbc94cfae3e95`
- **Commit time:** `2026-11-24T06:59:05Z`
- **Commit message:** “Refresh automatic public display docket and square artwork”
- **Changed file:** `PUBLIC_SITE/generated/discovery.json` only.

The `6838b1d5…` commit was the preceding discovery refresh and is superseded as the prewrite-head locator. The corrected statement is: the discovery snapshot was refreshed at `ab3083f…` before this run's first workspace write; no postwrite discovery refresh was observed after the report, receipt, Morrow INBOX, CURRENT_WORK and BOOT commits. P0 record safety remains FAIL; this amendment does not claim live-route acceptance or public-site safety.

The original report and receipt remain immutable. This additive correction supersedes only the incorrect prewrite commit locator.
