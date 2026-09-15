# HsH Conversation Viewer

A static, source-preserving viewer for the public conversation archive.

## What it does

- browses `DEVELOPMENT_FULL_CONVOS`, `LIVE CONVOS`, hand-registered external sources, and structurally discovered eligible conversations in the public `SAT_THEORY_ARCHIVE_2023-25` (`[[GLASS]]`) repository through one compact catalog;
- deduplicates public cross-repo discovery by source SHA-256 so archival copies already represented in HsH do not flood the Viewer;
- keeps private `HSH_RESOURCES` outside automatic public discovery;
- loads a selected raw JSON/JSON-in-TXT export on demand rather than duplicating conversation data;
- follows the active ChatGPT branch (`current_node` → parents) when that structure is present;
- colors speakers distinctly;
- progressively renders long conversations in bounded batches;
- supports within-conversation search with timeline hit markers and a result drawer;
- supports direct message links with `?c=<conversation-id>&m=<message-number>`;
- adds a draggable conversation-position slider;
- provides previous/next message and previous/next conversation navigation;
- includes **Cruise**, **Message replay**, and simulated **Typealong replay** modes;
- leaves every raw source conversation untouched.

Typealong is a reconstruction, not historical token timing. The exports preserve message timestamps, not the original token emission schedule.

## Discovery model

The public Viewer follows an inclusion invariant:

> Every eligible public, non-quarantined conversation source should either be represented in the Viewer or have an explicit exclusion/routing reason.

HsH's normal development/live roots are discovered recursively. The build workflow also checks out public `[[GLASS]]` and structurally recognizes ChatGPT mapping exports there, including JSON stored with a `.txt` extension. It prunes any `PRIOR_ART` path before descent and does not scan private `[RESOURCES]` for public Viewer inclusion.

Public GLASS files whose SHA-256 is already represented by an HsH development/live source are suppressed as duplicate archive copies. Unique recognized GLASS conversations are cataloged as external sources pointing to their original repository path; they are not copied or moved into HsH.

The generated cross-repo discovery ledger is:

`CONVERSATION_VIEWER/data/discovered_external_conversations.json`

`CONVERSATION_VIEWER/EXTERNAL_CONVERSATIONS.json` remains the hand-maintained registry for unusual external formats or sources that cannot be recognized by the normal structural scanner.

Because GLASS is a separate repository, the Viewer workflow performs an hourly convergence sweep in addition to ordinary HsH-triggered builds.

## Build the catalog

From the repository root, the minimal HsH-only/manual-external build remains:

```bash
python tools/build_conversation_viewer_resolved.py
```

The normal automated public cross-repo build first runs:

```bash
python tools/discover_external_conversations.py \
  --hsh-root . \
  --external-root _viewer_external/GLASS \
  --external-repository Satobloc/SAT_THEORY_ARCHIVE_2023-25 \
  --output CONVERSATION_VIEWER/data/discovered_external_conversations.json
```

and then runs `build_conversation_viewer_resolved.py`.

The catalog output is:

`CONVERSATION_VIEWER/data/conversations.json`

The catalog is derived from the refreshed development/live conversation-date manifests plus the generated external discovery file when present. The latter already includes the hand-registered external entries. External records point to their canonical source repository rather than copying that source into HsH.

Raw source JSON is fetched from its canonical repository path only when a viewer selects it. If partial curation rules are present, the builder may also create derived viewer-only copies under `CONVERSATION_VIEWER/data/curated/`; these preserve source coordinates and do not replace or modify the raw archive conversations. Whole-conversation hiding changes only the derived catalog.

## Run locally

Browsers restrict `fetch()` from `file://` pages, so serve the repository with any tiny static HTTP server:

```bash
python -m http.server 8000
```

Then open:

`http://localhost:8000/CONVERSATION_VIEWER/`

## Keyboard controls

- `/` — focus search
- `J` — next message
- `K` — previous message
- `Space` — start/pause replay

## GitHub Pages

The directory is GitHub-Pages-ready because all viewer assets are static and conversation sources are fetched from their public raw GitHub repository. A deployment workflow can publish this directory once Pages is enabled for the repository.

## Provenance rule

The viewer is a derived presentation layer. It must never rewrite, normalize in place, reorder on disk, deduplicate, or replace the raw archive conversations. Deduplication in cross-repo discovery means only that an identical archival copy is not listed twice; the source file remains untouched. Direct links are presentation addresses; archive provenance remains the exact repository source path.

## Provenance annotation mode

The one-click local launcher opens an **internal annotation mode**. It adds conversation- and message/range-level controls for core/supporting provenance, priority/search promotion, milestones, editorial status (`superseded`, `misleading`, `counterfactual`, `not-currently-held`, `re-adopted`, etc.), timeline links, and Viewer visibility.

Private working metadata is stored outside the repository at `~/.hsh_conversation_viewer/annotations.json`. The toolbar's **Publish public projection** action writes only the public-safe projection to `CONVERSATION_VIEWER/data/annotations.json`; internal notes never enter that file.

Core provenance conversations are promoted within genuine search matches. If promoted message/range annotations exist, the conversation opens in provenance-focus mode: promoted passages and one message of surrounding context are expanded while other messages are collapsed. An explicit default anchor overrides the automatic highest-weighted anchor.

Within-conversation search results include the original message date/time and respect public visibility plus provenance promotion.

See `CONVERSATION_VIEWER/ANNOTATIONS.md` for the schema and workflow. Viewer-level hiding is curation only: it does not make a raw source private if that source remains in a public repository.
