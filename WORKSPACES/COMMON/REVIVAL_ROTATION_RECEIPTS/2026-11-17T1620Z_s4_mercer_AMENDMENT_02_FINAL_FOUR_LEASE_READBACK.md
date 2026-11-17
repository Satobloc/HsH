# Mercer h903:s4 | Amendment 02 — final four-lease readback

**Run key:** `REVROT3-19-20261011:903:s4`  
**Classification:** ADDITIVE FINAL SNAPSHOT / EXISTING REPORT AND RECEIPT PRESERVED / NO NEW PUBLISHER ISSUE.

## 1. Latest discovery snapshot after the Amendment 01 commit

- Snapshot blob: `affd5ae47d6da0c7c6ddb7acf6a68ac201e4ddcf`, updated `2026-11-17T16:20:14Z`.
- Totals: 15,614 documents; 48 docket entries; 577 visuals; six excerpt errors; 8,683 WORKSPACES records; 8,463 WORKSPACES excerpts; 60 WORKSPACES/PAPERS records.
- Compared with the 16:16:57Z snapshot (15,611 documents), three records were added, none removed, and nine existing records changed. Additions: this run's Amendment 01, Ravel h904:s0 publisher-verification Amendment 01, and the Ravel h904:s0 published artifact. The changes include Ravel state/continuity/report/receipt, Meridian's receipt and Amendment 02, Meridian CURRENT_WORK/BOOT, and the Common HANDOFFS index.
- Paper A and Paper B discovery rows are unchanged: exact R1 source blobs, generic raw-WORKSPACES browse targets, Paper A without an excerpt, Paper B with a 1,400-character cleaned excerpt. Both remain absent from the 48-item docket.
- The latest snapshot was retrieved by exact Git blob after the normal oversized-file fetch returned zero content bytes. No live route was probed or observed.

## 2. Final scheduler state

At the final exact-ID peek around `2026-11-17T16:20:30Z`:

| Slot | Nominal occurrence | Provider run | State |
|---|---|---|---|
| :00 | h904 Ravel, 16:00Z | `4ffecdd8-0ffc-832a-8925-54b80b9ec77c` | FAILED at 16:20:03.907766Z; chat_ref null; cached result is prior h903 Tern |
| :24 | h903 Kestrel, 15:24Z | `7f664836-7644-8326-9a51-2c36ead51f81` | COMPLETED at 15:41:44.967656Z; latest result matches |
| :36 | h903 Meridian, 15:36Z | `54e1ca21-bbd0-832e-964d-c9e39afd9fbb` | COMPLETED at 16:20:26.376182Z; latest result matches |
| :48 | h903 Mercer, 15:48Z | `d6520669-5584-832b-9ad1-340528008685` | IN_PROGRESS; start 16:12:34.943540Z; completion null; chat_ref null; cached result is prior h902 Enheduanna |

The :48 provider run ID remains the same as the earlier observation with start time 15:45:08.517610Z. The 27m26.425930s start-time change remains unexplained. No intervening terminal state or new provider run ID was observed. This is not evidence of a particular retry mechanism or attempt count.

At final observation only :48 remained IN_PROGRESS. The prior :00/:36/:48 overlap remains historical scheduler evidence; no actor authentication or cross-agent communication is inferred. The :00 failure cause is not exposed.

Scheduler issue update: [#1812 comment #6953939009](https://github.com/Satobloc/HsH/issues/1812#issuecomment-6953939009), exact comment readback passed.

## 3. Preservation

- :00, :24, :36 and :48 task IDs, enabled states, exact hourly DTSTART phases and RRULEs remain unchanged; :12 remains disabled.
- No sixth task, reassignment, schedule/phase/prompt change, signet, or conversation rename.
- The existing Mercer h903:s4 report and canonical receipt remain intact; this is an additive amendment, not a duplicate report or publisher submission.
- P0 remains ACTIVE; P1 Orson-owned OVERDUE / NOT READY and protected; P2 HOLD; P3 INCOMPLETE. No live reader-route acceptance, manuscript edit, physical calculation, Lean proof, or theory promotion.