# Receipt Amendment 04 | Final clone-ledger reconciliation | h1015:s3

Append-only reconciliation after the current PR build and publisher completion.

## Ledger state

The current `WORKSPACES/COMMON/CLONE_LEDGER.jsonl` readback contains:

- 321 JSONL rows.
- 318 unique, nonblank event IDs.
- Zero duplicate event IDs.
- Three schema-incomplete original rows (309–311) retained from the initial h1015 append; each is superseded by a schema-complete correction at rows 312–314.
- No JSON parse errors in the 321 rows.

The three original rows are not counted as valid events. Do not report all 321 rows as valid. The append-only correction records remain the aggregation source for those three API reads.

Latest ledger blob: `e0a7a0d83c46e7eae16d4d8479f12e3d9d5d2d2c`.

## Checkout observations

- Row 315: initial PR #2330 merge-reference build checkout, depth 1, exact merge SHA observed.
- Row 320: current PR #2330 merge-reference build checkout, depth 1, exact merge SHA observed.
- Row 321: issue-publisher workflow checkout for #2334, `actions/checkout@v4`, default event ref, depth 1 by action default. The publisher commit and successful readback are confirmed, but the exact Actions run ID, job ID and checkout SHA were not exposed. Those fields remain UNKNOWN.
- GitHub Traffic attribution remains UNKNOWN for all connector/Actions observations.

The ledger was independently fetched and parsed after the append. No local full clone or repository archive download was performed by this execution.
