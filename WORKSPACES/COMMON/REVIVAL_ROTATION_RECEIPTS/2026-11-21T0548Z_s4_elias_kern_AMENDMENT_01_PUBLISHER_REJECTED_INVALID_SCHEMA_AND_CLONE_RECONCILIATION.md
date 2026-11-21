# Amendment 01 | h989:s4 | Publisher schema rejection and fifth clone-ledger event

**Status correction:** the initial h989:s4 receipt recorded publisher intake as `SUBMITTED_NOT_VERIFIED`. The publisher has now rejected issue #2255.

## Publisher result

- Issue: [#2255](https://github.com/Satobloc/HsH/issues/2255).
- Publisher workflow: [run #44873593954](https://github.com/Satobloc/HsH/actions/runs/44873593954), job #136753289670, conclusion SUCCESS.
- Publisher comment: [#7058345371](https://github.com/Satobloc/HsH/issues/2255#issuecomment-7058345371), `REJECTED: invalid schema`.
- The issue body contains exactly the four expected keys and its `content` matches the workspace report byte-for-byte at 10,476 characters. The SHA-256 is correct: `eac441416b34d1dc32ea61d690565a0c02f4ca574dd33dc7aae09cd57de817cd`.
- The payload used schema value `HSH-PUBLISH-V1`. The live `tools/issue_publish.py` validator requires the exact lowercase value `hsh-publish-v1`. The title prefix remains uppercase as required.
- The publisher script prints `REJECTED: invalid schema`, adds the rejection comment, and returns exit code 0. Therefore Actions `conclusion=success` is not publication success.
- The expected canonical artifact `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/elias-h989-s4-run-envelope-routing-20261121t0548z-001.md` is absent (404).

No retry, issue edit, duplicate submission, direct artifact write or publisher bypass was attempted. The report remains an internal workspace artifact; there is no canonical published artifact.

## Additional clone accounting

The publisher workflow itself performed one shallow checkout:

- Run #44873593954, attempt 1, workflow 385270319, job #136753289670, step 2.
- `actions/checkout@v4`, explicit `ref: main`, `fetch-depth: 1`.
- Hosted runner worker ID `6b7022ca-15e4-42b1-ad92-fd6669ede279`.
- The job log does not emit a post-checkout `HEAD`, `GITHUB_SHA` or `git log -1` line. Exact checkout SHA and match against the issue-event run head are therefore UNKNOWN.
- Clone-ledger event: `hsh-actions-checkout-44873593954-a1-j136753289670-s2`.
- Traffic attribution remains UNKNOWN.

The append-only clone ledger now contains 142 rows (137 before this run, five added). The existing WH-01 queue note was updated to include the publisher checkout. The run-created partition cursor remains unchanged; this is not a partition completion.

## Successor timing

Nadir h990:s0 run `a7950e10-1c4c-8323-9877-bab5777bf33f` started at 2026-11-21T06:02:38.150062Z with `chat_ref=null`. Any repository packet created after that observation is POSTSTART optional context only. No direct-thread delivery, consumption, acknowledgement, assignment, response obligation or ownership transfer is claimed.

## Supersession

This amendment supersedes the initial receipt's `SUBMITTED_NOT_VERIFIED` publisher status and 141-row clone-ledger count. It does not alter the report content or its original SHA-256. The original report and receipt remain unchanged.
