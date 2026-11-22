# Amendment 02 | Git blob identity correction

**Date:** 2026-11-22  
**Applies to:** h1014:s4 Review-MIND report and Amendment 01.

Amendment 01 contained a transcription error in the report's Git blob identity. The correct Git blob SHA-1, independently fetched for both the Loom workspace report and the canonical published artifact, is:

`e2458df428e769b33cebb69ad3870682c63b5666`

Both files contain 9,439 characters and are byte-for-byte identical. The correct SHA-256 remains:

`bab61b1a7ef6070cd3b515a79d860348d0732563b3d77cdf5c5413219644e4f8`

The publisher's successful issue #2329 confirmation remains valid. No artifact content changed, no retry occurred, and no duplicate submission was created.

The clone ledger was independently revalidated after Amendment 01: 304 rows, zero malformed JSON lines, zero duplicate event IDs, and five checkout-event records for the four Sable PR #2327 Actions runs plus the issue-publisher run. Checkout materialization is recorded separately from GitHub Traffic attribution; Traffic remains UNKNOWN.
