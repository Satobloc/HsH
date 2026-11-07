# Receipt amendment 06 | Kestrel h671:s3 | duplicate invocation reconciliation

**Actual invocation preflight:** 2026-11-07T23:35:28Z  
**Nominal slot:** 2026-11-07T23:36:00Z  
**Run key:** `REVROT3-19-20261011:671:s3`  
**Deterministic selection:** Kestrel (index 14); next Meridian (index 15).  
**Disposition:** `DUPLICATE_RUN_KEY_RECONCILIATION / NO_REPEAT_OF_SUBSTANTIVE_WORK`.

## Existing event verified

The current main branch already contained a completed canonical receipt for this exact run key and its linked artifacts before this invocation began substantive work:

- Canonical receipt `2026-11-07T2336Z_s3_kestrel.md`, blob `a2874087683f767f01cb2fbcd7cba3096ac61d1b`.
- Five earlier linked amendments, `AMENDMENT_01` through `AMENDMENT_05`.
- Kestrel source-crosswalk artifact `WORKSPACES/KESTREL/2026-11-07T2336Z_THETA4_REFERENCE_CROSSWALK_AND_TWO_KNOB_TEST_MATRIX.md`, blob `32eb11744e71a2166c8c847a19f61f1d06b5fa0e`.
- Existing successor handoff `2026-11-07T2336Z_from_s3_to_s4_meridian.md`, blob `cb0e06721befe20646a9fcabdd2a4194c5e2b820`.

The receipt, report and handoff were fetched and read back. No second canonical receipt, new Meridian handoff, publisher issue, PR, experiment, calculation or Mersearch request was created.

## Current branch / CI reconciliation

- HsH main before this guard change: `7284212bf4710cedf6982ca8ec671decebd7392f`, commit timestamp 2026-11-07T23:33:33Z.
- Kestrel PR #873 remains open, unmerged and draft/open on branch `research/kestrel-original-slice-fidelity-20261028t0900z`, head `1971e3d58a28f7c6de5cf024039dbcedb133121c`, base branch `infra/lean4-verification-20261023`, base `61cc8b65ffed70296e0121dbae067892a79c81d4`.
- Existing Actions run #42153410233 completed SUCCESS on 2026-11-06T03:00:38Z, event `pull_request`, with the same PR head and base SHAs. This remains the recorded merge-reference build; exact-head-only verification and separate global axiom audit are not claimed. No new CI run was triggered.

## Source and role preflight

The historical Kestrel role source was re-read from HsH conversation `6ab070ce-2384-83e9-b76f-4661c55867c4`, raw blob `100267f3f11f3cce09c7d802ce85ad03879d5744`. Direct Nathan user messages:

- `c6803d67-a76f-48e4-bf71-f49cb7b224ee`: Kestrel is asked to straddle the quarantine/non-quarantine line, hold the large-scale outline, and give Nathan's instincts credulity by default without becoming another overclaim-prevention/audit voice.
- `3c07680d-5205-48a3-93d5-ce33a8cf86a6`: Kestrel should not search hard unless a concrete question calls for it; the dedicated teams already do that work; the working ground rule is to reason forward from what has been seen while acknowledging it may be wrong.

This is a historical role-source read, not authentication of a currently active Kestrel ChatGPT thread.

The current three-repository onboarding and repository signage were consulted. HSH_RESOURCES remains private internal reference infrastructure, not a public cross-link target. Mersearch lane files 1–4 were inspected; all remain occupied/requested, including the existing Kestrel lane-4 source request. No lane was overwritten and no new Mersearch search was submitted.

## New workflow improvement

This duplicate invocation exposed that the relay protocol specified unique receipts and deterministic run keys but did not explicitly say how to handle a second invocation of an already-completed key.

Created and read back:

- `WORKSPACES/COMMON/REVIVAL_ROTATION_DUPLICATE_RUN_KEY_GUARD_2026-11-07.md`, blob `c042b7749d826ea835034a0dc272fe50a62864b5`.
- Updated `WORKSPACES/COMMON/REVIVAL_ROTATION_V3_2026-10-11.md` with a pointer and short rule; new blob `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14`.

The guard distinguishes nominal slot time from actual invocation time, prevents duplicate research/receipts/handoffs/publication, allows only a missing-step amendment when an existing run is incomplete, and freezes writes on conflicting canonical receipts. It is explicitly assistant-authored workflow clarification, not Nathan Direct and not theory authority.

## Next worker and delivery

Next deterministic worker remains Meridian, ring index 15, target `h671:s4`. Existing handoff remains repository-only optional context. The historical Meridian Free Build candidate `6ac45d1f-17b0-83e9-b76f-4661c55867c4` is not authenticated as a currently usable thread; no authenticated cross-thread posting action exists. No delivery or acknowledgment is claimed. Do not create another handoff for this run key.

## Integrity boundaries

No task ID, enabled state, cadence, phase, ring, worker remit, branch ownership, access control or scheduler allocation changed. No signet or chat rename. No BEDROCK, SAT-O or Blockwave equation change; no theory promotion. P1 Nov 9, P2 Nov 30 and P3 Dec 14 remain separate gates. The prior unrelated-reading cursor remains Babbage, line 713; no new source-reading extent or physical break is claimed in this duplicate reconciliation.
