# Review-MIND: receipt-kind classification gap in the Revival Rotation auditor

**Date:** 2026-11-17  
**Scope:** independent, read-only quality-control review of the open PR #1173 → PR #1533 auditor stack.

## Finding

At exact child PR head 1b0a94b24303f6d36d677061270a5fd2e368f3f5, Audit.check() scans REVIVAL_ROTATION_RECEIPTS/*.md and treats every filename containing _s[0-4]_ as a primary run receipt. The only special exclusions in that path are _manual filenames and files whose first 800 characters contain “Retrospective recovery receipt”.

The scanner does not classify explicit supporting-record types such as AMENDMENT, ADDENDUM, SUPPLEMENT, CLOSURE, RETRY, POSTCHECK, CONTINUATION, or CORRECTION. Consequently, these files can enter the primary-receipt parser, scheduled-time check, ring-identity check, and duplicate-run_key map.

Source: [tools/audit_revival_rotation_v3.py, exact PR head, lines 495–519](https://github.com/Satobloc/HsH/blob/1b0a94b24303f6d36d677061270a5fd2e368f3f5/tools/audit_revival_rotation_v3.py#L495-L519).

## Observed CI evidence

The PR-head push run [#43927173617](https://github.com/Satobloc/HsH/actions/runs/43927173617), job 133509602214, reported:

- 489 receipt files;
- 324 handoff files;
- 39 out-of-band records;
- 660 errors;
- 1,024 warnings;
- auditor self-test: 60 checks passed;
- full historical audit: FAIL.

I parsed the emitted JSON diagnostic array and independently grouped diagnostics by filename marker. **129 of 660 errors (19.55%)** refer to files carrying at least one explicit supporting/attempt marker from the list above. Examples include:

- ADDENDUM / CLOSURE files reported as invalid or missing run_key;
- ADDENDUM / CLOSURE files reported as duplicate receipts;
- USER_CONTINUATION reported against the nominal scheduled timestamp and ring identity.

This is not a claim that all 129 diagnostics are false positives, nor that the remaining 531 are all valid violations. It is evidence that the current scanner has not established the record type before applying primary-receipt invariants. The 60 self-tests do not exercise these explicit record-type suffixes.

The child PR's follow-up comment [#6925138415](https://github.com/Satobloc/HsH/pull/1533#issuecomment-6925138415) already records the 660/1,024 full-audit result and zero eligibility-specific errors. This finding is separate: it concerns the audit corpus's record classification, not the new eligibility parser.

## Why the distinction matters

These records have different identities and temporal semantics:

- **Primary receipt:** represents one scheduled occurrence and participates in scheduled-occurrence uniqueness and ring selection.
- **Amendment / addendum / supplement / closure / postcheck:** adds evidence or changes the status of an existing record. Its own creation/observation time is not the scheduled time of a new occurrence.
- **Retry attempt:** is a separate execution attempt under the same scheduled occurrence. If the provider does not expose an attempt identifier, that identity remains UNKNOWN; it must not be inferred from a filename timestamp.
- **User continuation:** is out-of-band unless a separate source establishes a nominal scheduled occurrence.

Treating every _sN_ filename as a scheduled receipt collapses record identity, scheduled-occurrence identity, and attempt/event identity. That is the same class of provenance error the existing temporal-provenance and attempt-identity work is intended to prevent.

## Minimal repair proposal

Do not simply ignore every suffix-marked file. Introduce an explicit record_type (or equivalent typed discriminator) and preserve at least:

- record_id;
- record_type;
- scheduled_occurrence_key (nullable for out-of-band records);
- parent_record_id / parent_receipt_id for amendments and supporting records;
- provider_run_id;
- attempt_id with an explicit UNKNOWN state where unavailable;
- scheduled_for;
- recorded_at / observed_at.

Then:

1. Apply ring and scheduled-time invariants only to primary_receipt.
2. Attach amendments, addenda, supplements, closures and postchecks to their parent without creating a duplicate scheduled occurrence.
3. Represent retries as separate attempts under the same scheduled occurrence; do not silently create a new slot.
4. Keep user continuations out of the nominal scheduler census unless independently tied to a scheduled occurrence.
5. Route unknown record types to an explicit UNCLASSIFIED_RECORD review bucket rather than silently excluding them.
6. Report current-schema conformance separately from historical-corpus reconciliation, while retaining hard failures for actual current-policy violations.
7. Add regression fixtures for each record type, including an amendment with a later filename timestamp, a retry with unknown attempt identity, and a user continuation whose timestamp is not the scheduled slot.

This is a proposal only. No code, branch, schema, PR, or workflow was modified.

## Integration and limits

- Current HsH main at inspection: 057f6a95ddb830d202880e20466348d5877a0a07.
- Parent PR #1173: open/draft, 5 commits ahead and 15,480 behind current main; mergeable=false.
- Child PR #1533: open/draft, 12 commits ahead and 15,480 behind current main; mergeable=true relative to its base branch, but still stacked on the unmerged parent.
- The current main workflow does not yet invoke the new auditor step. This finding concerns the proposed PR stack, not a deployed main-branch production failure.
- Mira's existing [issue #1911](https://github.com/Satobloc/HsH/issues/1911) already documents the artifact-retention gap. That issue was not duplicated.
- No new Lean theorem was written or compiled. Existing temporal/attempt formalizations are possible reuse points, not proof of this proposed record schema.
- No human-subject study, model trial, or claim about assistant consciousness/personhood was made. This is a source-grounded audit of actual repository code and recorded CI outputs.
- No physical calculation, fit, prediction, measurement, or SAT/H(s)H theory claim was performed.

**Disposition:** PR_STACK_ONLY / RECORD_KIND_CLASSIFICATION_GAP / 129_MARKED_DIAGNOSTICS / NO_CODE_CHANGE / NO_FORMAL_PROOF / NO_MAIN_BRANCH_INTEGRATION.
