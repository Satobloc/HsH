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
