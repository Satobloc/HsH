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
   - The generated-data commit stage now tolerates concurrent `main` updates: on a push race it fetches/reset to newest `origin/main`, rebuilds the Viewer, rechecks path existence, and retries up to four times instead of leaving validated output stranded.

## Regression behavior

For a dry-run manifest record with `status: planned`, existing `old_path`, and nonexistent proposed `new_path`, the Viewer must catalog `old_path` and generate URLs from it.

If a rename later materializes and `new_path` exists, the Viewer may use `new_path`.

If neither manifest path exists, the Viewer should omit that dead source record rather than publish a broken link. The source manifest itself remains the place to investigate or document the stale record.

Every non-external Viewer catalog entry must resolve to a real repository file.

## Additional stale-manifest finding

The new existence gate exposed a separate development-manifest residue:

`DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_6/25.12.29•25.12.30•Court Filing Guidance — raw.json`

The file is no longer present in the repository tree, but the development manifest still referenced it as `status: unchanged`, `message_count: 78`, with old/new path identical. This is consistent with the earlier scoped privacy deletion. The Viewer should not resurrect or publish a dead source path merely because the stale manifest still lists it.

## Commits / workflow evidence

- `f2f0d8082f55abb3201114d6e6662fdd9e1ac798` — initial existence-aware Viewer path resolver wrapper.
- `e70d276ba8d6fd0cf3b52b672eb642daf3b4fd3b` — workflow uses wrapper and validates repository source-path existence.
- Viewer run `34788105816` failed in build because the first wrapper fallback recursively called the monkeypatched resolver.
- `6ef257698796ab34e0442e9e9be6154fe074dc19` — preserved the original fallback, eliminating that recursion.
- Viewer run `34788150612` then built the catalog successfully; validation failed only on the stale deleted `Court Filing Guidance` manifest path.
- `92b7b37459e648b682d28dfad9a36765825eac99` — changed resolver behavior so records with no materialized source path are omitted from Viewer output.
- Viewer run `34788195121` built and validated the repaired catalog successfully (`374` conversations; `365` development; `9` live; zero missing-path assertion failures), but its generated-data commit lost a concurrent push race and therefore did not reach `main`.
- `f1bee23ba9e94848e427a6adb86e8d6bc830a610` — hardened the generated-data commit stage with fetch/reset/rebuild/path-revalidation/push retry behavior.
- Viewer run `34791027403` completed successfully, including generated-catalog build, full source-path validation, and generated-data commit/push.

## Final validation state

The repaired Viewer catalog is now committed on `main` with:

- `374` total conversations;
- `365` development conversations;
- `9` live conversations;
- development manifest acceptance reduced to `364` because the dead source record is no longer admitted into Viewer output.

The workflow's source-path assertion passed against the landed catalog, so every non-external Viewer entry—including all nine LIVE entries—resolved to an existing repository file during the successful run.

A direct search of the committed Viewer catalog found zero `Court Filing Guidance` matches. The stale development-manifest record still exists upstream, but it is no longer exposed through the Viewer.

## Manifest-owner follow-up — Run 10

The owning regeneration path is now identified rather than inferred:

- `.github/workflows/maintain-navigation.yml` owns navigation regeneration.
- Its `Date-tag stable developmental exports` step runs `tools/date_conversation_exports.py DEVELOPMENT_FULL_CONVOS --apply --manifest indexes/manifests/development-conversation-dates.json`.
- `tools/date_conversation_exports.py` constructs a fresh record list by recursively enumerating the files that currently exist under the supplied root and then rewrites the manifest. It does not intentionally preserve records for files no longer present.
- The current development manifest header reports `generated_at_utc: 2026-09-13T12:30:33.434526+00:00`, `mode: apply`.
- Repository history records the public-corpus privacy deletion of `Court Filing Guidance` later, at `2026-09-13T13:41:24Z`, commit `655db2d384867c43fc59c5047403f6feade5a88c`.

Therefore the residual record has a straightforward timing explanation: the currently committed manifest predates the deletion. It is not evidence that the generator reintroduced a deleted source, nor does it require hand-editing a generated artifact.

At inspection time, a newer serialized `Maintain H(s)H navigation` run (`34793981748`) was pending on current `main`. Because that workflow is the canonical owner and will rebuild the manifest from currently present files, Mercer did not manually alter the generated manifest. Follow-up should verify the successor maintained state after that owner run lands; if the dead record survives a fresh successful regeneration, that would become a generator/workflow defect rather than ordinary staleness.

## Canonical-workflow reconciliation — Run 11

Run `34793981748` did not become the required successful owner regeneration: GitHub records it as `completed/cancelled`, with no jobs returned by the run-jobs endpoint. The committed development manifest therefore remains the older `2026-09-13T12:30:33.434526+00:00` generation and still contains the deleted `Court Filing Guidance` record.

While tracing that owner path, a second Viewer consistency defect was found: `.github/workflows/maintain-navigation.yml` was still invoking `python tools/build_conversation_viewer.py`, bypassing the existence-aware resolver already made canonical in the dedicated Viewer workflow. A successful navigation run could therefore regenerate a Viewer catalog using the old dry-run-path semantics and undo the earlier LIVE-path repair before publication.

Commit `44548450fa4af2905f711e81ce07139b393983d6` reconciles the two workflow paths:

- canonical navigation maintenance now invokes `tools/build_conversation_viewer_resolved.py`;
- its generated-navigation validation now asserts that every non-external Viewer source path exists in the checkout, matching the dedicated Viewer workflow's critical integrity gate.

This closes the workflow-divergence defect but does not yet establish a fresh successful owner regeneration. At immediate post-commit inspection no check run/status had attached to the commit yet. The stale manifest should therefore remain classified as generation lag pending one successful `Maintain H(s)H navigation` completion after the privacy deletion.

## Remaining follow-up

- Verify the next successful canonical navigation regeneration removes the deleted-source record from `indexes/manifests/development-conversation-dates.json`; do not hand-edit the generated manifest unless its owner path demonstrably fails.
- Verify that the canonical navigation run passes the new Viewer source-path existence assertion.
- If the deleted-source record survives a fresh successful regeneration, diagnose the generator/workflow as defective rather than ordinary staleness.
- If desired later, fold the existence-aware selection directly into `tools/build_conversation_viewer.py`; the wrapper is a narrow compatibility repair.
