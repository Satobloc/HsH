# Infrastructure log — Conversation Viewer conversation-ID references

**Date:** 2026-09-13  
**Scope:** `CONVERSATION_VIEWER`  
**Reason:** Nathan requested a small conversation-ID tag in the viewer so conversations can be referenced and searched unambiguously during archive/provenance work.

## Changes

- Added `CONVERSATION_VIEWER/conversation_ids.js`.
- Loaded the helper from `CONVERSATION_VIEWER/index.html`.
- Conversation cards and saved-version rows now expose the existing 12-character viewer catalog ID as a compact clickable/copyable tag.
- Conversation-filter UI now advertises ID lookup; entering a unique viewer-ID prefix and pressing Enter opens that conversation.
- When a raw ChatGPT export contains a top-level `conversation_id`, the open-conversation header additionally displays that full source UUID as `CID`.
- Raw sources are not rewritten.

## Reference example

`DIMENSIONAL GRAVITY`

- Viewer ID: `971cf397671e`
- Raw ChatGPT conversation ID: `252d05c0-22ed-4ea2-a474-7966ab13145a`
- Source: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`

## Commits

- `e343cc831ea9401937f5f0e333e2b5d4ee8b8840` — add conversation ID helper
- `205160206f93002eeedac04fe7d52a3a5bb7e37d` — load helper from viewer

## Provenance note

Use the raw ChatGPT conversation UUID where available for source identity; retain the viewer ID because it is the stable catalog/navigation key used by the current viewer and URL parameter `c=`.