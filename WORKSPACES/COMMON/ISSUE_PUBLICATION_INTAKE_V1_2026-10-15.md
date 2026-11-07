# HsH publication intake v1 | operator handoff
Date: 2026-10-15. Status: **END-TO-END SMOKE VERIFIED**, public-text fixed-destination v1. On 2026-10-15, issue #31 triggered Action run 38702627728 (conclusion: success), produced commit 831617d59af2421a2dcf34d8912df98879f5f603, returned a verified issue comment, and an independent connector `fetch_file` read confirmed the published text. This verifies one submission, not general reliability.

## Why
Direct ChatGPT GitHub contents writes intermittently fail. Local git is unavailable in some worker runtimes; existing Actions cannot be dispatched generically by the connector. The GitHub connector DOES expose `create_issue`. GitHub issue `opened` events are separately executable by GitHub Actions. This version deliberately uses the event as a second initiating interface.

## Canonical submission operation
1. Worker does scientific work FIRST and reproduces its full artifact inline in its ChatGPT response for manual archival.
2. Only PUBLIC, NON-SENSITIVE, <=45,000-byte UTF-8 **text** is eligible. This repository and GitHub issues are public. No private research, credentials, protected sources, personal records or executable user-content processing.
3. Compute `sha256 = SHA256(content.encode('utf-8')).hexdigest()` for EXACT artifact bytes, including newlines. Choose collision-resistant, descriptive `submission_id` matching `[A-Za-z0-9][A-Za-z0-9._-]{0,79}`. Never reuse an ID for changed content.
4. Via existing GitHub connector `create_issue` on `Satobloc/HsH`, title starting `[HSH-PUBLISH-V1]`; **body is raw JSON**, not a fenced block:

```json
{
  "schema": "hsh-publish-v1",
  "submission_id": "example-worker-20261015-unique-001",
  "content": "# Result\\nComplete public Markdown artifact here.\\n",
  "sha256": "<64 lowercase hexadecimal SHA-256 of exact decoded content>"
}
```

5. GitHub workflow `.github/workflows/issue-publisher.yml` listens to owner-authored issues opening. Existing `tools/issue_publish.py` validates the schema, length, ID, sha256, and repository-owner authorship; it never executes the submitted content. It writes an immutable, fixed-destination file `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/<submission_id>.md` on main, using GitHub's Contents REST endpoint from inside Actions (not ChatGPT's direct contents connector), then rereads exact bytes. On success it comments with commit SHA and digest.
6. Check issue comments, workflow job conclusion, then `fetch_file` the expected path and compare exact SHA-256. Only then mark `PUBLISHED_VERIFIED`. An issue creation response alone means `SUBMITTED`, not published.
7. Existing identical ID+bytes = idempotent acknowledgment. Existing same ID with different bytes is collision and REJECTED. No arbitrary destination paths, no rewriting shared state, and no bulk actions.

## Contract
`SUBMIT (GitHub issue) -> VALIDATE (Action) -> COMMIT (fixed inbox) -> READBACK (Action and caller) -> REPORT (issue comment)`.

This is a **staging intake**, not automatic migration into a worker-owned final research path. Reviewed workers may ingest from staging into their authorized destinations using existing house tools. Do not imply that a staged scientific artifact has been adopted into SAT/H(s)H theory canon.

## Safety and operations
- This Action accepts issues from repository `OWNER` only; it cannot be a universal multi-worker publisher until identity/authorization and submission surfaces are explicitly provisioned. If a scheduled worker's GitHub connector acts as repository owner, it may submit; verify actual authorship first.
- Do not place secret or private material in the issue. Issue bodies persist publicly independently of subsequent publication failures.
- Submission is a separate connector **write category**: if `create_issue` is rejected too, no independent initiation exists for that runtime. Preserve artifact completely inline and record `SUBMISSION_ROUTE_UNAVAILABLE` without asserting a universal GitHub outage.
- GitHub workflow token requires `contents: write` and `issues: write`; branch protection may block commit. Check run logs for real cause.
- No worker should repeatedly attempt failed GitHub contents `create_file` or `update_file` calls to trigger this publisher.
- This v1 does not accept attachments/binary files, arbitrary destination paths, multiple files per submission, private repository data or instruction execution inside the submitted content.

## Acceptance test
Use issue #31: `publisher-smoke-20261015-001`, expected path `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/publisher-smoke-20261015-001.md`, expected SHA-256 `711435f7b020eaa8c362f07f499203d7bcd2cee67c5ae6ca5394ffd25d7d23da`. Inspect GitHub Action workflow run and issue comment and independently reread published path. Only if all match is this transport VERIFIED.

## Next integration
Once tested, add a tiny one-sentence pointer to core worker activation rather than copying this guide into every recurrence. Research workers calculate. The publication interface owns transport. Keep completed code/equations in visible conversation for Nathan's manual archival fallback.

## Asynchronous turn timing (Nathan Direct, 2026-10-15)

GitHub Actions activation and completion are asynchronous. A successful issue submission is **not** a synchronous publication guarantee. For a worker with an already completed eligible public artifact, use this order when practical:

1. **BEGINNING OF TURN:** compute the exact UTF-8 SHA-256 and submit the owner-authored publication issue immediately. Record the issue number, submission ID, digest and expected fixed destination. Do not fabricate numerical results to submit early.
2. **MIDDLE OF TURN:** perform independent, useful research, solver checks or a different calculation while GitHub Actions works. Do not occupy the turn with polling.
3. **END OF TURN:** check the GitHub Actions run/issue receipt and independently fetch the published file; match exact content SHA-256 before reporting `PUBLISHED_VERIFIED`.
4. If still queued/running, report `SUBMITTED_NOT_VERIFIED` and carry forward the issue ID, expected path, and hash. **At the START of the next authorized turn**, verify that outstanding submission before creating a duplicate. Do not wait indefinitely, spin on status, or assume completion before readback.

If the current research artifact is created during the turn rather than ready at its start, submit when complete and perform whatever meaningful work remains before one bounded end-of-turn check; a later turn may need to verify. Publication checks never supersede the calculation-first priority or privacy safeguards.

## Asynchronous publication across turns (Nathan Direct, 2026-10-15)

GitHub issue-triggered Actions may start and finish after the initiating ChatGPT turn. **Never assume same-turn completion and never submit duplicate issues because a receipt is delayed.**

**At start of every research turn:** check for a carried `submission_id` and GitHub `issue_number` from the previous turn. If present, look up that issue's comments, Action status and expected repository file FIRST; a successful independently checked readback marks `PUBLISHED_VERIFIED`. If still pending, retain `SUBMITTED_NOT_VERIFIED` and the identifiers, then proceed with real calculations. Do not create a second issue for identical content.

**For newly completed eligible artifacts:** validate content and compute SHA-256, then initiate issue submission **as soon as the artifact is ready**, preferably early enough to do substantial calculations or tests afterward. Record `submission_id`, `issue_number`, destination and digest immediately; initial status is `SUBMITTED_NOT_VERIFIED`. At END of the turn, check the issue/Action and independently read back the committed bytes/hash. If pending, hand off `submission_id + issue_number + expected path + sha256` in one compact line for the next scheduled worker or next turn to verify. Pending processing is not a failure and does not justify resubmission.

**Timeout/retry rule:** On a missing, slow, or unclear receipt, re-read the original issue by number before taking any action. If issue exists, DO NOT resubmit even if the Action has not finished. For a rejected/failed Action record its actual result and keep inline artifact. If issue creation call itself returned ambiguously, search for the original exact ID before any retry; never assume it failed. Preserve complete code and math inline regardless of publication status.

**Work scheduling:** this is a two-point asynchronous check, not a blocking wait: submit early (once ready), do research while GitHub runs, check near turn end, carry unresolved receipt to the next turn. Research remains the priority. Do not invent elapsed-time completion guarantees.


## Exact-envelope preflight and acceptance semantics (2026-11-07)

The v1 validator requires **exactly four top-level JSON keys**: `schema`, `submission_id`, `content`, and `sha256`. `filename` is not accepted; the publisher derives the destination as `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/<submission_id>.md`. Do not add `filename`, `destination_path`, `artifact_path`, or other metadata.

The validator checks the exact key set before checking the digest. In addition, `tools/issue_publish.py` posts a `REJECTED:` comment and returns exit code 0 on validation errors. Therefore an Actions `conclusion: success` is **not** publication acceptance. The only acceptance state is a `PUBLISHED` (or idempotent-publication) comment plus an independently fetched artifact whose UTF-8 bytes exactly equal the issue's `content` and whose SHA-256 matches.

**Observed counterexample:** issue #1447, submission `nadir-map-stack-integration-contract-20261107t0736z-s3-001`, created 2026-11-07T07:57:42Z. Its payload had five keys (`schema`, `submission_id`, `filename`, `content`, `sha256`); the extra `filename` caused `REJECTED: unexpected payload keys`. Actions run #42353422378 nevertheless concluded `success`, consistent with the validator's return-0 rejection path. The exact content was 18,520 UTF-8 bytes. An independent SHA-256 recomputation gave `bf3e2b4bb3cba3bfe5280266f4ec07f41399a282878cc90e22cadb41aa8c9386`, not the declared `86cff3e468cdfa00474c94bf2a0c486ad1093240bf641a9de8c075a59d851582`. The publisher did not reach digest validation because the key-set check failed first. The expected artifact path returned 404. Status: `PUBLISHER_REJECTED_SCHEMA_AND_SHA256 / NOT_PUBLISHED`.

No edit/reopen retry, duplicate issue, or direct write to the publication destination was made. The workflow listens only to `issues.opened`; editing or commenting on an existing issue does not replay its original event. Keep the original issue as the single public incident record.

**Preflight before every new submission:** parse the raw JSON; assert the exact four-key set; check the literal lowercase schema; validate the submission-ID pattern; count UTF-8 content bytes; recompute SHA-256 over the exact `content` bytes; only then open the issue. After opening, inspect the publisher comment and independently fetch the fixed artifact path. Never infer acceptance from a green Actions run alone.
