# HsH Conversation Viewer

A static, source-preserving viewer for the raw conversation archive.

## What it does

- browses `DEVELOPMENT_FULL_CONVOS` and `LIVE CONVOS` through one compact catalog;
- loads a selected raw JSON export on demand rather than duplicating conversation data;
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

## Build the catalog

From the repository root:

```bash
python tools/build_conversation_viewer.py
```

This generates only:

`CONVERSATION_VIEWER/data/conversations.json`

The catalog is derived from the existing development/live conversation-date manifests. Raw JSON is fetched from its canonical repository path only when a viewer selects it.

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

The directory is GitHub-Pages-ready because all viewer assets are static and conversation sources are fetched from the public raw GitHub repository. A deployment workflow can publish this directory once Pages is enabled for the repository.

## Provenance rule

The viewer is a derived presentation layer. It must never rewrite, normalize in place, reorder on disk, deduplicate, or replace the raw archive conversations. Direct links are presentation addresses; archive provenance remains the exact repository source path.
