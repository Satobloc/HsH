# Sable h1029:s4 receipt amendment 02 | Clone ledger readback

**Publisher status remains:** PUBLISHED_VERIFIED.

## Append-only ledger

Six Sable h1029:s4 events were appended to `WORKSPACES/COMMON/CLONE_LEDGER.jsonl`:

1. HsH API-only source reads.
2. SAT archive API-only source read and unrelated-reading segment.
3. HSH_RESOURCES navigation-only API read.
4. HsH API-only writes for reports, report-series pointers, assignment progress, receipt and continuity.
5. HsH API-only publisher/readback verification.
6. Publisher Actions shallow checkout.

Final ledger readback:

- Rows: 433.
- Unique non-null event IDs: 430.
- Legacy rows without event IDs: 3, preserved.
- Duplicate event IDs: 0.
- Parse errors: 0.
- Ledger blob: `6035461ddc67da2488873e33032188944301b47f`.
- Ledger update commit: `fd09fb7fe5a2c4ae0d5118bfb0f3cb6a79487aa4`.

The publisher checkout is recorded as a depth-1 GitHub Actions checkout at `efd13307867e0bd826939e1ba89e3edfe6208c99`, run #45075509612, job #137371728728, with run-head and checkout-head matching. It is not a full clone. Traffic attribution remains UNKNOWN.

No local repository clone or checkout was created by this run.

## Scheduler readback

The :48 task remains enabled with the original ID `6aa6c3bc02b48191b8a91a30d2a155e0` and exact original hourly schedule. Its current run remains IN_PROGRESS with `chat_ref=null`; cached result remains the preceding Kestrel h1028:s4 run.

The :00 task is also enabled with its original ID and schedule. Its h1030:s0 run is IN_PROGRESS with `chat_ref=null`; no direct Loom delivery or acknowledgment is claimed. The :24 and :36 tasks remain enabled; :12 remains disabled. No sixth task or scheduler mutation.

Final HsH main commit after ledger append: `fd09fb7fe5a2c4ae0d5118bfb0f3cb6a79487aa4`.
