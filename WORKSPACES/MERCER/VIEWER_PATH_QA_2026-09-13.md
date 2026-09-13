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
   - If neither supported manifest path exists, it returns `None` so the Viewer does not publish a dead URL. The stale manifest record remains available for separate provenance/index repair.

2. Updated `.github/workflows/build-conversation-viewer.yml`.
   - The workflow now invokes the existence-aware wrapper.
   - The wrapper path itself is a workflow trigger.
   - Validation now asserts that every non-external catalog `path` resolves to a real repository file.

## Regression behavior

For a dry-run manifest record with `status: planned`, existing `old_path`, and nonexistent proposed `new_path`, the Viewer must catalog `old_path` and generate URLs from it.

If a rename later materializes and `new_path` exists, the Viewer may use `new_path`.

If neither manifest path exists, the Viewer should omit that dead source record rather than publish a broken link. The source manifest itself remains the place to investigate or document the stale record.

Every non-external Viewer catalog entry must resolve to a real repository file.

## Additional stale-manifest finding

The new existence gate exposed a separate development-manifest residue:

`DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_6/25.12.29•25.12.30•Court Filing Guidance — raw.json`

The file is no longer present in the repository tree, but the development manifest still referenced it. This is consistent with the earlier scoped privacy deletion. The Viewer should not resurrect or publish a dead source path merely because the stale manifest still lists it.

## Commits / workflow evidence

- `f2f0d8082f55abb3201114d6e6662fdd9e1ac798` — initial existence-aware Viewer path resolver wrapper.
- `e70d276ba8d6fd0cf3b52b672eb642daf3b4fd3b` — workflow uses wrapper and validates repository source-path existence.
- Viewer run `34788105816` failed in build because the first wrapper fallback recursively called the monkeypatched resolver.
- `6ef257698796ab34e0442e9e9be6154fe074dc19` — preserved the original fallback, eliminating that recursion.
- Viewer run `34788150612` then built the catalog successfully; validation failed only on the stale deleted `Court Filing Guidance` manifest path.
- `92b7b37459e648b682d28dfad9a36765825eac99` — changed resolver behavior so records with no materialized source path are omitted from Viewer output.

## Validation state at run close

The third repair commit had landed but no successor Viewer workflow run was yet visible at the final check. CI success is therefore **not** claimed in this run.

## Remaining follow-up

- Verify a successor Viewer workflow run completes successfully and commits regenerated `CONVERSATION_VIEWER/data/conversations.json`.
- Confirm all nine materialized LIVE Viewer entries resolve against the repository tree.
- Confirm the deleted `Court Filing Guidance` residue no longer appears in Viewer output.
- Separately reconcile the stale development-manifest record so the manifest itself reflects the intended deletion state.
- If desired later, fold the existence-aware selection directly into `tools/build_conversation_viewer.py`; the wrapper is a narrow compatibility repair.
