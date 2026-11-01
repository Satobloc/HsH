# Tern :36 Receipt Amendment 01 | Publication, Lean repair and handoff timing

This additive amendment supersedes the earlier pending/unknown statuses only where stated. It does not change the primary receipt.

## Publication verified

- Issue #1199 publisher comment #6555151053 reports `PUBLISHED`.
- Destination: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/tern-mersearch-lane3-dispatch-20261101t0736z-s3-001.md`.
- Publisher commit: `c45d4f71c614dd9e781ab1c5a448204e94dfe392`.
- Published file independently fetched; Git blob `5ef34e5e598e2c46d0d311c89a00ddcde9c501d6`.
- Independently recomputed SHA-256 of the exact submitted UTF-8 content: `b44be77ef1d84ed813335016b4cce55592acdd6279d7f870cf1ccec625f744b5`, matching the publisher comment.
- Publication state: `PUBLISHED_VERIFIED`.

## Lean failure and correction

The first build, Actions #41286076089, completed FAILURE on the original branch head. The new module failed in two proofs because `decide` could not synthesize `Decidable` for the proposition returned by `isBoundToWorkflow`. The log reported `sorryAx` for those two declarations. No Lean success is claimed from the first run.

The two proofs were corrected using explicit simplification of the concrete definitions:
- Corrected module blob: `e814318aebae453783de3983eefea9c0481e5812`.
- Corrected branch head: `b0a504940269a24a3c8d35fd130ab5ccec6643b9`.
- New Actions run: #41286467636, in progress at the latest check. No compile-success claim yet.

The correction is also recorded in PR #824 comment #6555178684. PR #824 remains open/draft/unmerged.

## Morrow handoff timing correction

Morrow's :48 run `0e67fb65-4f84-8324-aa93-51df5cfa86de` started at 07:49:50.877566Z and was still in progress at the latest peek, with no `chat_ref`.

The Tern handoff commit was created at 07:49:55Z, 4.122434 seconds after Morrow's run start. The Morrow inbox append commit was created at 07:50:03Z, 12.122434 seconds after start. Therefore the repository packet was late for the current Morrow execution:

`LATE_FOR_CURRENT_RECIPIENT_RUN / NEXT_APPEARANCE_ONLY`.

No current-run consumption, ChatGPT-thread delivery, recipient acknowledgment or task transfer is claimed. Morrow's inbox pointer is repository-only optional context.

## Mersearch status unchanged

Aster lane-3 Actions run #41278156840 remains in progress at the Run Mersearch step. Request-scoped manifest and compact receipts are still not available. The pre-sanitization query residual remains unresolved; inspect the exact manifest before declaring completion. Do not duplicate or overwrite the request.

The :36 automation remains enabled with its original ID and schedule; no task/scheduler mutation. The :12 automation remains disabled and untouched.
