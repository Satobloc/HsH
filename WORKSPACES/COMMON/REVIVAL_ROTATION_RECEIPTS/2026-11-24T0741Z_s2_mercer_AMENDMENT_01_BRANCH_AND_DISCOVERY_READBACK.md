# Mercer h1063:s2 | Amendment 01 | Branch and discovery readback

**Applies to:** `2026-11-24T0724Z_s2_mercer.md`  
**Purpose:** correct the receipt's phrase “final prewrite inspection” and record the later full discovery parse. This amendment supersedes only the branch locator/currentness statement; it does not alter the Paper A/B source findings or P0 ownership.

## Branch chronology

- The earlier read at `22c6cd2b55ea33da76af67306336d336d4a85f4d` (2026-11-24T07:38:41Z) was not the final prewrite read.
- Immediate prewrite main was `05f9305aac1b833c33640c2a17b0a475d703dbfe` (2026-11-24T07:40:28Z), Morrow h1062:s4 Amendment 05.
- After the Mercer receipt, README, Ravel packet and Ravel INBOX writes, main was `232b54afa42b89136d24edc11f1f1d5a08eddf33` (2026-11-24T07:40:58Z).
- Last generated-discovery commit: `2086530fadfdfab6ce92fa84e655489a3e0f27b4`, 2026-11-24T07:40:11Z, parent `c33c749ff3aaaaf13b3b2670032aa96f43870004`. Exact compare: current main is six commits ahead of that generated commit.

## Latest full discovery parse

- Blob: `9c4e97e886494c6989145faf129e121c567d3948`.
- Updated: 2026-11-24T07:40:02Z; 31,570,261 bytes.
- Embedded HsH source: `c33c749ff3aaaaf13b3b2670032aa96f43870004`.
- Embedded SAT source: `028862e6f1b0ffad2f56f4989a2cd0a769d266fd`.
- Both repository scans complete.

Counts:
- 17,684 total documents.
- 10,752 workspace records; all 10,752 have generic reader targets and lack `presentation_state`.
- Zero `PRESENTATION_PENDING`; 10,506 workspace excerpts.
- 48/48 rolling-docket entries are workspace records.
- 577 visuals; 417 square-rule visuals; zero currently ineligible visual paths under the inspected path/suffix/exclusion predicate.
- Six extraction errors.

## Final status at this readback

- `DISCOVERY_FRESHNESS=PENDING`: current main is six commits beyond the last generated-discovery commit.
- `RECORD_SAFETY=FAIL`: generic workspace readers, missing presentation state and workspace docket entries persist.
- `LIVE_ROUTE_ACCEPTANCE=NOT_OBSERVED`: no authenticated visitor browser context; no route probe.
- No generator change, PR merge, deployment, route acceptance, release or standdown.

The next authorized worker should independently fetch the latest main and generated discovery blob before making any currentness claim. The complete snapshot above is the last parsed snapshot, not a current-main snapshot.
