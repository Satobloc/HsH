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

Collapsed provenance-focus messages can also be opened by clicking the collapsed message body, not only the small `Open` button. A manual open is remembered for that conversation/message during the browser session so ordinary Viewer re-rendering does not immediately collapse it again.

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

### Internal quick curation

The local/admin Viewer additionally exposes compact per-message quick controls:

- `−` — reduce that exact message's priority by 10;
- `+` — increase priority by 10;
- `Flag` — toggle an internal review flag;
- `Promote` — toggle ordinary `important`/search promotion, with a modest priority/search-weight floor.

These controls are available only in local internal annotation mode. `Promote` is intentionally weaker than declaring a passage a `provenance-anchor` or a conversation `core`; those stronger judgments still belong in the full annotation editor.

## Search behavior

Conversation search first requires a real textual/date match. Among matching conversations, provenance class and provenance priority promote stronger primary evidence. Core provenance does not cause an unrelated conversation to beat an actually relevant result.

Within-conversation search ranks promoted message hits ahead of ordinary hits and preserves message number plus the original message date/time in each result entry.

## Replay behavior

Typealong and sequential message replay operate on dialogue messages rather than blindly replaying every raw record. `tool`, `system`, `developer`, `function`, and `internal` records are excluded; assistant messages that look like tool/plumbing payloads are also skipped. Ordinary user, assistant, and companion dialogue remains eligible.

This filtering affects presentation only. The raw messages remain in the source conversation and can still be exposed through ordinary Viewer/internal-message controls where supported.

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

Per-message quick controls provide the faster upgrade/downgrade/flag/promote pass; the full editor remains available for provenance class, exact status, labels, notes, timeline links, visibility, and richer tagging.

Every raw conversation remains source-preserved throughout this process.
