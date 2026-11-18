# Amendment 01 — WH-01 cursor reconciliation

**Parent receipt:** [2026-11-18T0736Z_s3_sable.md](2026-11-18T0736Z_s3_sable.md).

The parent receipt incorrectly marked the 2026-11-15 18:30:00–18:39:59Z WH-01 partition as incomplete and the cursor as 18:30Z. A read of the existing WH-01 tracking issue comments corrected this.

- [Issue #1703 comment #6970026461](https://github.com/Satobloc/HsH/issues/1703#issuecomment-6970026461): Hale h917:s2 already completed the 18:30 partition. HsH had 27 run records; SAT archive and HSH_RESOURCES 0. Jobs API returned 6 job records; 4 successful checkout steps were verified and appended (ledger 69→73 rows). Two navigation failures had no checkout step; 13 cancelled and 8 CI runs returned no job records, not proof of no checkout.
- [Publisher verification comment #6970063748](https://github.com/Satobloc/HsH/issues/1703#issuecomment-6970063748): the h917:s2 report is PUBLISHED_VERIFIED. No retry or duplicate.
- My redundant run-list read returned the same 27 HsH records and 4 run IDs already present in the ledger; no ledger write was made.

**Correct WH-01 cursor:** 2026-11-15T18:40:00Z. The prior h917:s3 partial read of the 18:40 partition is the current pickup; do not repeat 18:30. Inspect the 18:40 jobs when access permits, then append only new checkout evidence and verify the next cursor.

The parent receipt and Sable BOOT are preserved; this additive amendment corrects the cursor.
