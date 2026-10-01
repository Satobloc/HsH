# Date-Tagger / Conversation Viewer Manifest Ownership — 2026-10-01

**Status:** active repair / validation checkpoint  
**Worker:** Ariadne Vellum

## What looked wrong

The development conversation date manifest continued to show pending/planned renames after the collision-deadlock repair had landed, creating the appearance that the repaired date tagger was still failing to apply its backlog.

Earlier repair:
- `61890ca2668ff041052c3a417f334ec65c8968f9` — isolate collisions instead of blocking all safe renames;
- `8bcce0da4a02304a8a468cfbd6ad039c6407d9c0` — regression test.

## What is actually happening

There are two producers for the same canonical manifest path:

1. `.github/workflows/maintain-navigation.yml`
   - runs `tools/date_conversation_exports.py DEVELOPMENT_FULL_CONVOS --apply`;
   - the resulting manifest is an **execution/audit record** and can contain `renamed` statuses;
   - the workflow stages source-file renames plus the manifest.

2. `tools/build_conversation_viewer_resolved.py`, invoked by `.github/workflows/build-conversation-viewer.yml`
   - intentionally rescans the live conversation roots for Viewer freshness;
   - before this repair it wrote those rescans directly back to the **same canonical manifest paths** with `apply=False`;
   - the Viewer workflow then committed those dry-run manifests.

Concrete evidence:
- Viewer refresh commit `f5db652f5eca75558431e307df17991b13589013` explicitly changed `indexes/manifests/development-conversation-dates.json` while preserving `"mode": "dry-run"`.
- `tools/build_conversation_viewer_resolved.py` explicitly called `dater.write_manifest(..., False, records)` on the canonical manifest paths.
- The maintenance workflow itself still correctly calls the date tagger with `--apply`.

Therefore the canonical file was serving two incompatible meanings:
- **maintenance execution audit**, and
- **Viewer discovery cache**.

The Viewer could overwrite a valid post-apply audit with a fresh dry-run snapshot, making completed rename work look pending again.

## Backlog interpretation corrected

The old backlog was not simply stuck forever.

The maintenance bot has committed successfully many times after the original repair, including `6fd2ba592876c9c84eaf4cbf75d29569b0dd8ad2` on 2026-10-01.

At the later Oct. 1 checkpoint, after a large upload burst, the Viewer-generated dry-run manifest showed:
- unchanged: 549
- skipped: 1348
- planned: 26
- collision: 1

This is materially smaller than the earlier 106/110 pending counts and is consistent with the old backlog having largely been consumed, followed by fresh undated uploads arriving after the last maintenance pass.

So distinguish:
- **historical collision deadlock:** repaired;
- **fresh post-upload renames:** normal backlog until maintenance runs;
- **manifest state confusion:** separate producer-ownership bug discovered here.

## Repair applied

### Viewer now uses private temporary manifests

Commit:
- `e0eb0cf3932322e2ce60d31a1eb78cf6c23e4a2d` — keep Viewer refresh from overwriting date-tag audit manifests.

`tools/build_conversation_viewer_resolved.py` now:
- recursively rescans the actual conversation roots as before;
- writes Viewer-only dry-run manifests into a temporary directory;
- builds the Viewer catalog from those fresh private manifests;
- relabels the published Viewer input metadata back to the stable canonical manifest names;
- leaves `indexes/manifests/development-conversation-dates.json` and the live equivalent untouched.

This preserves Viewer freshness while giving maintenance/date-tagging ownership of the canonical audit manifests.

### Regression coverage

Commit:
- `025cb3da024816f04162165a07c2eafc80a399d2` — add regression test asserting Viewer-private refresh does not mutate sentinel canonical audit manifests.

Import/test compatibility:
- `adc347c1f79fc875c0e1bbafa56d386052c5ec26` — make the resolved Viewer builder importable both as `tools.build_conversation_viewer_resolved` and as a directly executed script.

## Validation still required

Do not mark the repair fully validated until both of these are observed after the commits above:

1. a Conversation Viewer workflow run completes successfully and any resulting Viewer refresh commit **does not include the canonical date manifests** merely because the Viewer rescanned them;
2. a maintenance run applies the current safe pending rename set, after which the canonical development manifest is an apply/execution audit produced by maintenance rather than immediately being replaced by a Viewer dry-run snapshot.

## Broader workflow lesson

Generated files need explicit producer ownership. If two workflows write the same path for different purposes, a syntactically valid artifact can still become semantically misleading.

Recommended pattern:
- one canonical producer per durable state/audit artifact;
- read-only consumers may derive private/ephemeral caches;
- if multiple durable views are genuinely useful, give them separate filenames with explicit semantics rather than sharing one path.
