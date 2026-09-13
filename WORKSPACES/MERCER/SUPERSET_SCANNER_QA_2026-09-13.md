# Superset Conversation Scanner QA — 2026-09-13

**Status:** bounded archive/provenance QA under active theory standdown. No theory assessment.

## Trigger

Morrow's `JANUS_EXPORT_COMPARISON_2026-09-13.md` identified a false-positive path in `WORKSPACES/COMMON/scripts/find_superset_conversation_duplicates.py`: the scanner hashed selected content fields (`content_type`, `parts`) rather than the entire `content` object. A Janus tool message stored its body in `content.text`; a later export replaced an interior segment with `...[truncated]...`, but the old scanner treated the shared message as content-identical.

Tracked Common issue: `MORROW-SOURCE-001`.

## Independent code review

Read the full scanner. Two payload-policy omissions were found:

1. `content.text` and any other non-`parts` content fields were invisible because only `content_type` and `parts` were hashed.
2. `channel` was also omitted, although Morrow's documented conservative payload comparison includes channel as routing provenance.

The old comparison therefore did not implement the payload policy described by the Janus audit.

## Patch applied

Commit `88b947ac804bb716e91d36c6c1b89cdf061debe0` changes `canonical_message()` to hash:

- author role;
- author name;
- the **entire `content` object**;
- recipient;
- channel;
- create_time.

JSON object-key order is normalized; array order and string contents remain significant. The report text now states this metadata/content policy explicitly.

This is deliberately fail-closed with respect to future content shapes: a newly introduced field inside `content` changes the hash without requiring the scanner maintainer to know that field in advance.

## Regression case

Required retained regression:

- same message ID;
- `author.role=tool`;
- `content.content_type=execution_output`;
- earlier export contains the full body in `content.text`;
- later export replaces an interior section with the literal marker `\n...[truncated]...\n`;
- the two messages **must not** compare equal.

Additional regression worth retaining: identical content with different `channel` must not compare equal under the present payload policy.

An attempt to add a small executable regression-test file was blocked by the repository write guard. No test file is therefore claimed to exist. The case is preserved here for the next permitted test/documentation pass.

## Candidate-report regeneration

A repository code search found no committed `SUPERFLUOUS-PREFIX-CANDIDATE` report text to regenerate in place. Any previously generated artifact/report produced with the old scanner should be considered stale until rerun with the patched comparator. In particular, preserve the earliest Janus export A; do not disposition it based on pre-patch scanner output.

## Current issue status

`MORROW-SOURCE-001` is **partially resolved**:

- scanner equality bug: fixed;
- payload policy: documented in code/report output;
- exact Janus regression case: durably documented here;
- executable regression fixture: still pending due write guard;
- affected generated candidate reports: must be regenerated when their owning workflow/artifact path is available.

No Nathan decision is required.
