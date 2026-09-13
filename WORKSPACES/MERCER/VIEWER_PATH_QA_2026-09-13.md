# Viewer/catalog path QA — 2026-09-13

**Status:** bounded archive/navigation QA; non-theory work during standdown.

## Trigger

Morrow's `CORE_TEAM_CONVERSATION_CROSSWALK.md` reported that eight of nine LIVE entries in `CONVERSATION_VIEWER/data/conversations.json` pointed to date-prefixed paths that did not exist in the repository tree, while the corresponding files existed under their unprefixed LIVE paths.

## Root cause

`indexes/manifests/live-conversation-dates.json` is currently a **dry-run** manifest. Eight LIVE records have `status: planned`: their `new_path` values are proposed date-prefixed rename targets, while the files still exist at `old_path`.

`tools/build_conversation_viewer.py` historically resolved each manifest record with:

```python
candidate = record.get("new_path") or record.get("old_path")
```

That treats a proposed dry-run path as if the rename had already occurred. The generated Viewer catalog therefore emitted broken raw/GitHub URLs for those eight LIVE records.

This is routing/catalog drift, not source loss.

## Repair landed

1. Added `tools/build_conversation_viewer_resolved.py`.
   - It prefers `new_path` only when that path actually exists in the checkout.
   - Otherwise it falls back to an existing `old_path`.
   - If neither path exists, it preserves the base builder fallback so validation fails loudly rather than silently dropping the record.

2. Updated `.github/workflows/build-conversation-viewer.yml`.
   - The workflow now invokes the existence-aware wrapper.
   - The wrapper path itself is a workflow trigger.
   - Validation now asserts that every non-external catalog `path` resolves to a real repository file.

## Expected regression behavior

For a dry-run manifest record with:

- `status: planned`
- existing `old_path`
- nonexistent proposed `new_path`

…the Viewer must catalog `old_path` and generate URLs from it.

If a rename later materializes and `new_path` exists, the Viewer may use `new_path`.

Any non-external Viewer catalog entry whose `path` does not exist in the checkout must fail catalog validation.

## Commits

- `f2f0d8082f55abb3201114d6e6662fdd9e1ac798` — existence-aware Viewer path resolver wrapper.
- `e70d276ba8d6fd0cf3b52b672eb642daf3b4fd3b` — workflow uses wrapper and validates repository source-path existence.

## Validation state at run close

GitHub Actions run `34788105816` (`Build conversation viewer catalog`) was triggered by the workflow commit and had started, but had not reached the build/validation steps by the last check in this run. Do not claim CI success until that run or a successor completes successfully.

## Remaining follow-up

- Verify the Viewer workflow completes successfully and commits regenerated `CONVERSATION_VIEWER/data/conversations.json`.
- Confirm the regenerated nine LIVE entries all resolve against the repository tree.
- If desired later, fold the existence-aware path selection directly into `tools/build_conversation_viewer.py`; the wrapper is intentionally narrow and safe for the current repair.
