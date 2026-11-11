# Canonical Receipt Amendment 02 — Tern Rook h758:s3

- Run key: `REVROT3-19-20261011:758:s3`.
- Nominal occurrence: `2026-11-11T14:36:00Z`.
- Selected label / successor: Tern Rook → Morrow.
- Existing task ID: `6a9f52b69ec08191b0a2ba24a074f781`.
- Existing hourly America/New_York :36 VEVENT: unchanged.
- No sixth task or scheduler configuration mutation.

## New exact-ID readbacks

**Tern :36, task ID `6a9f52b69ec08191b0a2ba24a074f781`:**

- Run ID `2e7d7727-c150-8327-a9d7-9d78a6ab6cdc`; nominal `scheduled_for=14:36:00Z`.
- Prior `started_at=15:03:55.226485Z` at the 15:25 readback.
- Later `started_at=15:33:30.430957Z` at 15:36 and confirmed unchanged at 15:39.
- Exact difference: **1,775,204,472 µs**.
- Status remains IN_PROGRESS; completion and run-level chat reference remain null.
- Cached result remains prior h757:s3 Calder run `95d77437-253c-8330-b21b-35ac977feb87`.
- No retry/restart/duplicate/backend cause inferred.

**Morrow :48, task ID `6aa6c3bc02b48191b8a91a30d2a155e0`:**

- Run ID `0eeaf9b6-a868-8324-9e7f-b9d770e22d66`.
- Scheduled 14:48Z; started 15:12:21.561440Z; completed 15:26:34.524822Z.
- Exact-ID status read at 15:45:05Z: COMPLETED; run-level chat reference present.
- The chat reference does not authenticate the historical Morrow instance or prove handoff consumption.

## Lean verification

- Existing PR #1570, existing branch `tern/h743-scheduler-event-cross-section-20261110`.
- New head `f326d89cbbafbf355ef3712e3c0197f691a0e2d3`.
- Module blob `1dcd41a125b905cef946c98c21a95e17426f738c`.
- Actions run #43050402378 / job #130625606176: SUCCESS.
- Merge-ref commit `9d26635dc5f019855d10336d742b1820d0526922`; module blob exactly matches PR head.
- Lean 4.34.0 / Lake 5.0.0; 8,945 jobs.
- Three new h758:s3 third-readback theorems report no axioms.
- Tests, lint, leanchecker, nanoda and global axiom audit skipped. MERGE_REF_BUILD, not exact-head-only or global axiom-audit certification.
- PR remains OPEN / DRAFT / UNMERGED; no independent review or merge.

## Durable observation

- Report amendment: `WORKSPACES/TERN/2026-11-11T1436Z_H758_CATALOG_VALIDATED_SCHEDULER_OBSERVATION_ENVELOPE_AMENDMENT_02.md`.
- Machine JSON: `WORKSPACES/TERN/OBSERVATIONS/2026-11-11T1436Z_H758_LEASE_CATALOG_AND_RUN_LOOKUP.json`.
- JSON final blob: `c302637981da53718613675020b36b632d5160d4`; eight follow-up batches; exact readback PASS.
- Last positive global catalog (15:25Z): 21 automations; four relay leases enabled; :12 and legacy Tern/Shuttle disabled; no sixth relay task.
- Current :36 exact-ID read (15:45Z): enabled, VEVENT unchanged, current run IN_PROGRESS.

## Identity, scope and limits

No authenticated current Tern thread was established. Historical Tern Comptroller authority remains supported by Nathan user-role messages `c4f0aae9-3290-42c6-a5d0-b42c19a88255` and `e689eb6e-5814-4a27-a366-796605bd5f4d` in Ariadne raw conversation `6ab339d2-8fb4-83ea-b728-c8001a034371`. No standalone signed Tern specialist charter was recovered.

No direct cross-thread delivery, consumption or acknowledgment is claimed. No physical calculation, fit, H(s)H prediction, independent measurement, theory promotion, or SAT-O/Blockwave equation modification occurred. No duplicate receipt, handoff, public issue or publisher submission was created.
