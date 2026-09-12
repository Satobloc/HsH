# Conversation Viewer provenance annotations

The Conversation Viewer has a separate annotation layer for provenance, editorial status, search promotion, timeline links, and viewer-only visibility. Raw conversation exports remain untouched.

## Core provenance

`Core provenance evidence` is the strongest conversation-level designation. It means the conversation contains unusually strong primary evidence for the origin, authorship, chronology, or development of a significant SAT/H(s)H idea. It does **not** mean that every statement in the conversation is current, correct, or endorsed.

Conversation provenance classes are:

- `normal`
- `supporting`
- `core`

Each conversation can also have a 0–100 provenance priority, a search weight, and an explicit 1-based default opening anchor. If no explicit anchor is set, the Viewer opens a provenance-focused conversation at its highest-weighted promoted message/range, breaking ties toward the earliest range.

When promoted message/range annotations exist, the Viewer enters provenance-focus mode: promoted passages (plus one message of context on either side) are open and other messages are collapsed. `Show full conversation` restores the ordinary transcript view. Search hits open normally.

## Message and range annotations

Internal annotation mode supports a single message or a contiguous range. Shift-clicking message selectors inherits selection across the intervening range. Discontiguous selections are saved as separate contiguous ranges.

Useful tags include:

- `provenance-anchor`
- `milestone`
- `important`
- `interesting`
- `fun`
- `timeline-candidate`
- `superseded`
- `misleading`
- `counterfactual`
- `not-currently-held`
- `rejected`
- `re-adopted`
- `current`

Free-form thematic tags such as `QCD`, `electrogravity`, `worldtube`, or `torus` can be added alongside the standard tags.

A historically important passage may therefore be both `provenance-anchor` and `superseded`, or `milestone` and `re-adopted`. Historical importance and current theoretical status are intentionally orthogonal.

## Search behavior

Conversation search first requires a real textual/date match. Among matching conversations, provenance class and provenance priority promote stronger primary evidence. Core provenance does not cause an unrelated conversation to beat an actually relevant result.

Within-conversation search ranks promoted message hits ahead of ordinary hits and preserves message number plus the original message date/time in each result entry.

## Public versus internal

The controls themselves are available only from the local launcher in internal annotation mode. The launcher stores the editable annotation source outside the repository at:

`~/.hsh_conversation_viewer/annotations.json`

The internal file can include private notes and internal-only metadata. `Publish public projection` writes a stripped projection to:

`CONVERSATION_VIEWER/data/annotations.json`

Two separate controls matter:

- **Content visibility**: `Public in viewer` or `Hidden in public viewer`.
- **Metadata audience**: `Public metadata` or `Internal only`.

A hidden conversation/range is omitted from the public Viewer, while an internal-only annotation can remain private even when the underlying conversation text is public.

**Important:** Viewer visibility is curation, not repository security. If the canonical raw conversation exists in a public GitHub repository, hiding it from the Viewer does not make that source file private.

## Timeline links

Conversation- and range-level annotations can carry timeline links as `Label | target`. `timeline-candidate` is the low-friction staging tag for material that should be reviewed for a proper timeline document later.

The intended workflow is:

`read → tag → provenance-promote → timeline-candidate → timeline document → cross-linked primary evidence`

## Local annotation mode

Run the normal one-click launcher. It opens the Viewer on loopback with an ephemeral admin token and exposes local-only save/publish endpoints. Public GitHub Pages never receives those controls or the private annotation source.

The local toolbar provides:

- Tag conversation
- Tag selected messages/ranges
- Clear selection
- Publish public projection
- Export private annotation JSON

Every raw conversation remains source-preserved throughout this process.
