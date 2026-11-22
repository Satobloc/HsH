# Amendment 03 | Concurrent clone-ledger update reconciliation | h1015:s4 Aldus

The final read after Amendment 02 shows that another worker appended one additional, separately attributable Actions checkout record to CLONE_LEDGER.jsonl.

- New event: h1015-s3-mira-pr2330-run45000183363-job137139788308-step2-shallow-checkout
- Actor classification: assistant-level Mira ring label; not authenticated Mira-instance participation.
- Related work: PR #2330 evidence-gated candidate-admission Lean build.
- Actions run #45000183363 / job #137139788308.
- Checkout: actions/checkout@v4, fetch-depth=1, default event ref refs/remotes/pull/2330/merge.
- Run head SHA: 44b132df6b6bef4382032fc462b8e598fd521153.
- Checked-out synthetic merge SHA: 03f1dfbda21058ece946faae378d1d4ddfc1a9e8.
- The SHA mismatch is expected for a synthetic merge ref. Checkout materialization is SHALLOW_1; GitHub Traffic attribution remains UNKNOWN.

This record is not part of Aldus's three API-only accesses or the Aldus publisher checkout. Do not attribute it to this activation.

Current shared CLONE_LEDGER.jsonl readback:

- Rows: 320
- Unique event IDs: 317
- Duplicate event IDs: 0
- JSON parse errors: 0
- Legacy rows without event_id: 3, retained without rewriting
- Blob: ac1c1654b7969aaf8a8c957f8f7386cefa603444

Amendment 01's 319-row count was accurate at its read time; this amendment records the subsequent concurrent Mira-lane append. No prior ledger or receipt row was rewritten.
