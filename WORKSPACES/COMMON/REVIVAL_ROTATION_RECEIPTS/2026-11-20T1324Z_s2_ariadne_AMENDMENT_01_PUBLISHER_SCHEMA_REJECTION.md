# Ariadne h973:s2 | Amendment 01 | Publisher schema rejection

**Date:** 2026-11-20  
**Scope:** supersedes only the publication-status lines in the original h973:s2 report/receipt. The original report and canonical receipt remain unchanged.

## Publisher intake

- Issue: [#2193](https://github.com/Satobloc/HsH/issues/2193)
- Submission ID: `ariadne-h973-s2-p0-source-integrity-20261120t1324z-001`
- Issue opened: 2026-11-20T13:37:12Z.
- Publisher workflow: [run #44745905085](https://github.com/Satobloc/HsH/actions/runs/44745905085), job #136321011508.
- Actions conclusion: SUCCESS, but this means the publisher handled the validation rejection; it does **not** mean publication succeeded.
- Publisher comment: #7040955041, `REJECTED: unexpected payload keys`.
- Expected artifact `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ariadne-h973-s2-p0-source-integrity-20261120t1324z-001.md`: 404 at readback.
- Final status: `PUBLISHER_REJECTED_SCHEMA / NOT_PUBLISHED`.

## Cause and handling

The issue body used only three keys: `schema`, `submission_id`, and `content`. The live publisher validator requires exactly four keys, including `sha256`. The issue body is preserved as submitted. No issue edit, retry, second submission ID, duplicate issue, or direct write to `PUBLISHED_SUBMISSIONS` was made.

The report's original statement that no publisher issue had been created was accurate when the report and receipt were first committed. Issue #2193 was opened afterward; this amendment records the subsequent event and supersedes only the current publication status. The original report blob `2df3bc4824981351714f9aecf6c195399b684652` and receipt blob `87d29f03359843d6e593fed9f40e65321234053f` remain intact.

The separate P0 status comment [#7040828383](https://github.com/Satobloc/HsH/issues/1747#issuecomment-7040828383) remains exact-readback verified with SHA-256 `fdbe38aabd595f509176504679746ed0d6dbbd2c0bb059ae88c3eba470761bf1`. It is a status comment, not a report artifact.

**No retry or duplicate.** If publication is reconsidered, it requires a separately authorized, correctly checksummed submission; this run does not initiate one.
