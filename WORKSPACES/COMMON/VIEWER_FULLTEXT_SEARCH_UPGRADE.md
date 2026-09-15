# Conversation Viewer — Full-Body Search Upgrade

**Owner:** Sable systems / infrastructure QA  
**Status:** PLANNED / SAFE TO IMPLEMENT WHEN CONVENIENT  
**Raised:** 2026-09-15 by Nathan

## Goal

Conversation-list search should search **conversation body text**, not only title/path/date metadata.

Current state: the Viewer list filter matches title/path/date metadata. Thread search searches only inside the currently opened conversation.

## Requirements

- Search all Viewer-eligible, non-quarantined conversations.
- Preserve current title/path/date ranking while allowing body hits to surface conversations whose titles do not match.
- Do not force the browser to download every raw multi-megabyte conversation before search can work.
- Do not index text hidden/omitted by Viewer curation rules.
- Keep generated search data rebuildable from source; it is derivative infrastructure, not source authority.
- Prefer compact deterministic indexing and graceful fallback if the full-text index is unavailable.
- Support useful multiword queries; phrase/snippet support is desirable if size/performance permits.

## Likely implementation

Build a separate generated full-text search index during the Viewer workflow rather than bloating `conversations.json` with complete message bodies.

Candidate designs to benchmark:
1. per-conversation normalized unique token sets + multi-token intersection;
2. global inverted token -> conversation-ID postings index;
3. compact hashed postings / prefix index if corpus size requires it;
4. optional small snippets/message coordinates for result explanation without storing the full corpus twice.

Measure generated size, browser load time, query latency, and false-positive/false-negative behavior before selecting.

## QA

Regression tests should cover:
- a phrase/term present only in message body returns the conversation;
- title-only search continues to work;
- multiword body queries work predictably;
- hidden conversations and omitted curated message ranges do not leak through search;
- newly uploaded conversations enter the search index automatically;
- search index source IDs exactly match eligible Viewer catalog IDs.

## Related Viewer inclusion invariant

Separately from full-text search, every eligible non-quarantined conversation source should either appear in the Viewer or have an explicit machine-readable exclusion reason. The Viewer build must not silently depend on stale manifests.
