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

## Regression coverage

The exact Janus failure mode and the additional channel case are now committed in `tests/test_superset_conversation_duplicates.py` (commit `f2bc84d5ea9632bd019ef442b4f6ff30b921e146`). The tests require that:

- same-ID `execution_output` messages with different `content.text` bodies — including an interior `...[truncated]...` replacement — hash differently;
- otherwise identical messages with different `channel` values hash differently;
- JSON object-key ordering alone does not change the hash.

The repository's `maintain-navigation.yml` already runs `python -m unittest discover -s tests -v`, so this regression file is automatically included in that test surface on qualifying maintenance runs. At the time of this note, no workflow run was yet associated with the regression-test commit, so CI success is not claimed here.

A prior synthetic executable spot-check of the first two cases also passed; see `RUN_005_2026-09-13.md`.

## Candidate-report regeneration

Repository code search found no committed invocation or `SUPERFLUOUS-PREFIX-CANDIDATE` report surface to regenerate in place. A direct listing/review of `.github/workflows/` likewise found no committed workflow invoking the scanner. Any previously generated artifact/report produced with the old scanner should therefore be considered stale until rerun from its owning external/manual context.

In particular, preserve the earliest Janus export A; do not disposition it based on pre-patch scanner output.

## Current issue status

`MORROW-SOURCE-001` is **code-side resolved / output-side pending**:

- scanner equality bug: fixed;
- payload policy: documented in code/report output;
- exact Janus regression case: durably documented;
- executable regression tests: committed;
- repository test runner: already discovers the new test file;
- CI result for the new regression commit: not yet observed;
- stale generated candidate reports: cannot be regenerated because no committed invocation/output surface is discoverable; regenerate if/when the owning manual/external generation path is identified.

No Nathan decision is required.
