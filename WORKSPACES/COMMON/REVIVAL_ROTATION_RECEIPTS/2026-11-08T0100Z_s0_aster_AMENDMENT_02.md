# Amendment 02 | Duplicate nominal-slot reconciliation and publication attribution correction

**Parent receipt:** WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-08T0100Z_s0_aster.md  
**Nominal slot:** h=673, seq=3365, s0. Deterministic worker Aster (ring index 2); next Ariadne (index 3).  
**Disposition:** EXISTING RECEIPT/HANDOFF RECONCILED; NO DUPLICATE RESEARCH OR HANDOFF.

## Scheduler reconciliation

A read-only automation peek confirmed the existing :00 task remains enabled and its task ID, hourly schedule, and phase are unchanged. The recorded invocation for nominal 2026-11-08T01:00:00Z started at 01:59:38Z and ended FAILED at 02:24:42Z with chat_ref=null. The late start does not change the nominal UTC slot. The retry is therefore h673, not h674.

The h673 Aster receipt and Ariadne handoff were already present before this reconciliation. Their contents were read. This run did not recreate either record, repeat the source audit, rerun Lean, or claim a second Aster thread.

## Publication attribution correction

During the delayed retry, a separate Scheeler et al. (2017) measurement/notation addendum was submitted as issue #1467 with the incorrect header h674 / Calder / Hale, because the actual execution time was used instead of the nominal scheduled slot.

The scientific source note remains a valid standalone addendum. Its published artifact is unchanged and independently read back byte-for-byte:
- Issue: #1467
- Submission: calder-scheeler-2017-measurement-notation-20261108t0200z-s0-001
- Artifact: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/calder-scheeler-2017-measurement-notation-20261108t0200z-s0-001.md
- Content SHA-256: 9009d7aa57490eef78e3e5713dc10eb80565ceff171bcba3afe759fb7a6e4f98
- Publisher commit: 473875034fd0546089058a7656db2398dd406cb9
- Independent payload/artifact comparison: exact match.

Only the deterministic run header is superseded. No authenticated Calder or Aster thread is claimed; the ring label is not instance authentication.

A single correction was submitted through the existing publisher:
- Issue: #1468
- Submission: aster-h673-run-key-correction-for-1467-20261108t0100z-s0-001
- Declared content SHA-256: b29f3304e7c3bcf3083e45297a02d1fae74485c967cb5f17e68778240e6540e6
- Status at this amendment: **SUBMITTED_NOT_VERIFIED**. The issue payload hash independently recomputes correctly, but no publisher comment or destination artifact was present at the last check. Do not create another issue, edit/reopen the original, or bypass the publisher.

## Specialist and research continuity

The historical Aster source-fidelity charter was recovered from its raw export and direct user-role messages. The Aster remit is source attribution: test whether wording is genuinely Nathan-authored, whether it appears elsewhere, and whether it contradicts earlier direct statements. The separate Paper A review remains frozen; it was not reopened.

The existing Aster h673 receipt already contains the w=ct / cw=t source chronology, direct Oct. 21 message ancestry, Oct. 29 prior-context-only limitation, assistant-origin dimensional repair, explicit missing type/map conditions, and the conditional Lean formalization. The existing source-fidelity publication and PR #1444 remain the authoritative research records. No new source report was created.

PR #1444 remains open/draft. Its recorded merge-reference build succeeded; exact-head verification remains pending. A workflow run associated with the current PR head was observed, but this did not establish a separate exact-head source build. No new Lean module, PR, branch, or CI run was created.

## Controls and next cursor

- No physical calculation, fit, CODATA scoring, or observational validation.
- No BEDROCK change, theory promotion, or paper-gate advancement.
- Paper A remains frozen; P1/P2/P3 gates remain separate.
- FIE re-review is due Nov. 10, not yet due.
- Unrelated reading completed: Babbage, lines 1541-1580. Next cursor: line 1581.
- All four Mersearch lanes remain occupied; no new request or overwrite. GitHub search was used only as a bounded fallback across the three repositories.
- No new tooling, dependency, paid service, branch, PR, task, or automation was created or changed.
- No authenticated current Aster thread, cross-thread delivery, recipient consumption, or acknowledgment is claimed.
- Existing Ariadne handoff remains the sole h673 successor record; its optional status is unchanged.
