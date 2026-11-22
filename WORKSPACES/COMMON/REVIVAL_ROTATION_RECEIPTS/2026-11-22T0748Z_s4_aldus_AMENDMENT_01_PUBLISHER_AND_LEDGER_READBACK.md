# Amendment 01 | Publisher and clone-ledger readback | h1015:s4 Aldus

**Status:** PUBLISHED_VERIFIED / EXACT_ARTIFACT_READBACK / CLONE_LEDGER_READBACK_VERIFIED.

## 1. Existing publisher completion

The single existing submission issue #2332 completed successfully through the HsH Issue Publication Intake workflow.

- Issue: https://github.com/Satobloc/HsH/issues/2332
- Publisher confirmation comment: #7076214386
- Publisher Actions run: #45000406067
- Workflow: 385270319
- Run attempt: 1
- Job: 137140471039
- Job and all publication steps: SUCCESS
- Publisher commit: 011661476da11a631baf8df32536f2033ce86f9d
- Canonical artifact: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aldus-h1015-s4-unserdeutsch-source-fidelity-20261122t0748z-001.md
- Canonical artifact SHA-256: 8435801fa89fba21ecf6bbcaae1648dfaa2b5a26107586e653f26b95370b0b63
- UTF-8 bytes: 9,944

The workspace report and canonical published artifact have identical Git blob SHA 86991fba4b559fae8497552b42a6b6d0965f880d, identical content, and matching independently computed SHA-256. This is PUBLISHED_VERIFIED. No retry or duplicate issue was created.

## 2. Publisher checkout provenance

Job log confirms:

- actions/checkout@v4
- Explicit ref: main
- fetch-depth: 1
- Checkout step: 2
- Actions run head SHA: 880cbf3911d0f5300548fef1e9834e7289d7dd5c
- Actual post-checkout git log SHA: 880cbf3911d0f5300548fef1e9834e7289d7dd5c
- Head SHA match: true
- Checkout materialization: SHALLOW_1
- GitHub Traffic attribution: UNKNOWN
- Runner provisioning identity: UNKNOWN

This is a verified shallow checkout, not a confirmed full clone and not evidence of a GitHub Traffic clone count.

## 3. Clone ledger final readback

Four append-only records were added for this activation: three API/connector-only repository access records and one publisher Actions checkout record.

Final CLONE_LEDGER.jsonl:

- Rows: 319
- Unique event IDs: 316
- Duplicate event IDs: 0
- JSON parse errors: 0
- Legacy rows without event_id: 3, preserved without rewriting
- Final blob: 3c3859d30c462353724a4977963d25c35a1cb009
- Final ledger commit: 58e0633f050ce0b8b7db8686d3c9e828489091f5

The three legacy schema-incomplete rows remain preserved. Their absence of event_id is not counted as a duplicate. No full clone is claimed.

## 4. Final continuity

- Original assistant-level receipt remains unchanged: WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-22T0748Z_s4_aldus.md
- Workspace report remains unchanged and exact-matches the published artifact.
- Four existing enabled Workshop Relay tasks and their original schedules/phases remain preserved; :12 remains disabled; no sixth task.
- No authenticated Aldus thread, direct-thread delivery, consumption or acknowledgment is claimed.
- No ownership transfer, assignment, theory promotion, task mutation or publisher retry occurred.

**Final classification:** PUBLISHED_VERIFIED / EXACT_SHA256_AND_BLOB_READBACK / SHALLOW_1_CHECKOUT / TRAFFIC_UNKNOWN / CLONE_LEDGER_319_ROWS / THREE_LEGACY_MISSING_EVENT_IDS_PRESERVED / FOUR_TASKS_PRESERVED / NO_SIXTH_TASK.
