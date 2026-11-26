# Workshop Relay :36 | h1123:s3 | Morrow

**Disposition:** `SOURCE_CUSTODY_GATE_EXTENDED / ISSUE1865_LABEL_MISMATCH_CONFIRMED / PUBLISHER_CODE_CHANGE_PROPOSED_NOT_IMPLEMENTED / NO_THEORY_WORK`.

## 1. Historical authority and scope

The latest recovered Morrow source is conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36`, Git blob `ee394b446b2e36d35fd1e5ecd004685c0422457b` (697 mapping nodes, 17 direct user-role messages).

- Nathan's provisional Team Archivist assignment is direct user message `402ade01-7116-4efb-9b14-31e477754458` (2026-09-08T03:25:36.187Z): broad corpus appraisal, flexible action plan, and GitKeeper coordination.
- The direct theory stop is user message `934e87de-4e61-4622-a0ea-e5047aa235c6` (2026-09-13T00:11:10.939Z): stop theory work and quarantine unique theory artifacts.
- The later trial invitation is user message `99ae959b-fbeb-4c1e-9326-a6723c2b9557` (2026-09-13T15:31:22.757Z): archive maintenance, provenance, chronology, source comparison and bounded mathematical/equation checking are permitted; it does not expressly revoke the theory stop.

No standalone signed Morrow specialist charter was recovered. This run remained within source custody and operational verification. No theory integration, equation correction, Lean theory proof, physical calculation/prediction, paper work or BEDROCK promotion occurred.

## 2. Substantive workflow improvement

Added **Layer 20 — Publisher issue-label and prior-publication binding** to `WORKSPACES/MORROW/SOURCE_IDENTITY_GATE.md`.

The new control separates:
- issue resource identity `(repository, issue.id, issue.number)`;
- human-readable title/run label;
- content submission `(submission_id, exact content SHA-256)`;
- publisher execution/event evidence;
- canonical artifact identity; and
- the originating scheduled run, which remains unbound without separate evidence.

When both title and submission ID encode a worker/run label, they must agree. A mismatch is `ISSUE_SUBMISSION_LABEL_MISMATCH`. A matching label is only a consistency check, not authentication. A previously published issue remains bound to its prior submission and must not be repurposed for another run.

This is deliberately additive to Elias h1088:s3 issue #2538, which addresses event/execution/artifact composition and `ORIGIN_RUN_UNBOUND`. Layer 20 adds the missing human-readable title/submission-label comparison; it does not duplicate the event-identity model.

## 3. Applied witness: issue #1865

The source-level mismatch is concrete:

| Field | Existing record |
|---|---|
| Issue title | `[HSH-PUBLISH-V1] Morrow h888:s0 \| Lane 00 source-custody addendum` |
| Prior publisher confirmation | Comment #6933327250 |
| Original h888 artifact blob | `cd54c2ff22f16efcfb68eec85908543694c0d007` |
| Current body submission ID | `morrow-h1116-s0-equation-transcription-correction-20261126t1224z-001` |
| Current declared body SHA-256 | `23f73da839728101865ce714b0aa03d38b9374ecda04160d50a6bc365a915d5b` |
| Rejection comments | #7191982352 and #7192014379: `REJECTED: SHA-256 mismatch` |
| h1116 canonical artifact | Not found |

The h888 artifact remains present and identifies h888:s0. The current issue title still identifies h888:s0 while its body carries h1116:s0. The current body is not a verified h1116 publication.

The current workflow `.github/workflows/issue-publisher.yml` (blob `66e3261ff13e05bcc915809683b652ea9043703f`) listens to `issues.opened` and `issues.edited`. The current `tools/issue_publish.py` (blob `7067e8d9f27a273d90e443afb0493260d9a3ecbf`) checks the publisher title prefix and owner association, then validates the body and digest; it does not compare a run token in the title with the run token in `submission_id`.

This is a bounded code-path finding. It does not establish that the title mismatch caused the digest rejection, and no publisher run/attempt was bound to the two comments in this audit.

## 4. Proposed maintainer regression cases

1. Title h888:s0 + submission ID h1116-s0: reject before artifact write as `ISSUE_SUBMISSION_LABEL_MISMATCH`.
2. Title h1116:s0 + submission ID h1116-s0: pass label consistency only; originating run remains unbound absent separate evidence.
3. No run token in title: `TITLE_RUN_LABEL_UNSPECIFIED`; do not infer a match.
4. Previously published issue edited to a different submission ID: preserve prior-publication binding and reject reuse.

No publisher code, workflow, PR, existing issue, original artifact, scheduler, task ID or cadence was changed. Issue #1865 was not edited, retried, or replaced. No duplicate h1116 publication was created.

## 5. Repository evidence

- HsH main before the source-gate update: `f2fb03b4f44d0bdbb42c96427ca4cbad29b068a6`.
- Source Identity Gate prior blob: `33f10a019cd576b85c50ae8b61ffa743bce6d06e`.
- Source Identity Gate updated blob: `6f969f4185f46980f867a8757b2d81b081923744`.
- Source-gate update commit: `41d79d5a93b62b78bc0b948874555f80eda888ea`.
- Independent readback: exact updated blob and Layer 20 content retrieved from main.

Local repository checkout was unavailable in this runtime. The existing issue publisher is fixed-destination staging and cannot update this worker-owned source-control file; no generic approved Actions dispatch route was available. The direct Contents API update was therefore used as the documented fallback with the current blob SHA, followed by independent readback.

**Status:** `SOURCE_CUSTODY_GATE_WRITE_VERIFIED / ISSUE1865_H1116_NOT_PUBLISHED / MAINTAINER_CHANGE_PROPOSED_NOT_IMPLEMENTED / NO_RETRY / NO_DUPLICATE_ISSUE / NO_THEORY_PROMOTION`.
