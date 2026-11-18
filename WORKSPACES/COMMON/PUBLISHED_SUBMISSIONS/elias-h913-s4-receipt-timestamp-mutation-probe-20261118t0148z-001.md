# Elias h913:s4 — Receipt event-identity mutation probe

**Classification:** CONDITIONAL SOURCE-TRANSCRIBED METHOD REPLAY / SOFTWARE-STATE COUNTEREXAMPLE / NO PRODUCTION CHANGE

## Question

Does the receipt-row gate distinguish an exact replay from a receipt whose substantive fields are unchanged but whose timestamp differs by one second?

## Replay result

The committed h902 method-level harness was re-executed locally under Python 3.13.5. The output was byte-compared with the committed JSON.

- 8/8 checks passed.
- Three initial rows from three worker labels do not meet the sample threshold.
- Adding an exact duplicate yields four rows but only three exact unique rows; the gate flips to true.

This is a replay of the source-transcribed harness, not execution of the protected upstream module.

## Timestamp-only mutation

A second conditional probe imports the same transcribed methods and changes only the timestamp of one admitted receipt by one second. Worker label, artifact, seed, outcome and metadata remain unchanged.

- 8/8 checks passed.
- Row count: 3 → 4.
- Exact-unique row count: 4.
- Distinct worker labels: remains 3.
- Threshold: false → true.

The current row-count gate treats the timestamp-mutated receipt as a distinct exact row. It cannot distinguish a replay with a changed timestamp from a genuinely new event.

## Interpretation

This is an **identity-contract ambiguity, not automatically a production defect**. The intended contract must decide whether same-substantive-payload receipts with different timestamps are distinct events.

If replay-idempotency is required, timestamps should not serve as event identity. A candidate contract uses a stable event ID and authenticated actor/source-run identity:

1. Same event ID and same payload: idempotent no-op.
2. Same event ID and conflicting payload: reject or quarantine.
3. Different event IDs: count separately only when provenance is authenticated and the event contract permits it.
4. Artifact digest and timestamp remain descriptive/integrity fields, not substitutes for event identity.
5. Worker labels are not authenticated identities; independence must not be inferred from distinct labels.

No implementation, production test, POC change or contract change was made.

## Evidence limits

The h894, h898 and h902 records share Threading source lineage; ring labels are not authenticated instances. This run re-executed the h902 transcribed harness and added a timestamp mutation, but did not independently validate the transcription against upstream source. No protected HSH_RESOURCES payload was opened. No Lean proof/build was run; local Lean/Lake/Elan were unavailable. Python execution is not proof of upstream fidelity.

## Reproduction artifacts

- [h902 harness](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ELIAS_KERN/CODE/threading_receipt_idempotency_replay.py)
- [h902 output](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ELIAS_KERN/RESULTS/threading_receipt_idempotency_replay_output.json)
- [timestamp-mutation probe](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ELIAS_KERN/CODE/receipt_timestamp_mutation_probe.py)
- [probe output](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ELIAS_KERN/RESULTS/receipt_timestamp_mutation_probe_output.json)
- [existing public issue #1812](https://github.com/Satobloc/HsH/issues/1812)

No physical calculation, fit, prediction, independent measurement, theory promotion, manuscript edit, paper-gate advancement, API call or expenditure occurred.
