# 2026-09-13 — Nathan directives: Dashboard, quarantine, provenance, Viewer

**Source:** direct Nathan instruction in the current live conversation, approximately 05:00 EDT. Exact raw conversation/message IDs are pending archive export and must be backfilled in `NATHAN_DIRECTIVES_PROVENANCE.md`.

## Dashboard / quarantine

- Nathan's Dashboard remains a live/open navigation and overview surface. It is not quarantined as a Dashboard.
- Quarantine primarily constrains affected assistant-generated theoretical/interpretive artifacts and their downstream dependencies.
- Indices, wayfinding, archive maps, provenance tools, and the Dashboard remain usable for finding material and seeing what is current/new.
- Theory-bearing statements inherited from the failed integration lane require caution/fresh source review.
- Dashboard now contains an explicit `Quarantined / caution` section stating what is affected and why.
- Quarantine manifest has been updated accordingly.

## Direct-directive provenance

Material Nathan requests/directives should be logged with local timestamp, raw conversation ID, raw message/node ID, and durable archive path when available. If the live export has not landed, use `PENDING RAW-ID BACKFILL`; never invent identifiers.

## Conversation Viewer continuation

Current `viewer.js` already filters Typealong/sequential replay to dialogue messages: tool/system/developer/function/internal records and assistant plumbing payloads are skipped.

Current annotation machinery already provided full internal tagging, priority/search-weight control, provenance classes, and explicit `Open` buttons for collapsed provenance-focus messages.

The 2026-09-13 follow-up adds:

- click-anywhere opening for collapsed provenance messages;
- session-level persistence of manually opened messages so normal re-rendering does not immediately collapse them;
- local-admin-only exact-message quick controls for priority downgrade/upgrade, `Flag`, and ordinary `Promote`;
- documentation of the behavior;
- navigation CI syntax checks for `annotations.js` and the new follow-up script.

**Pointers:**
- `QUARANTINE/2026-09-13_INTEGRATION_HALT/README.md`
- `SAT_THEORY_ARCHIVE_2023-25/..[🎛️_NATHAN_DASH]/!_DASHBOARD.md`
- `WORKSPACES/COMMON/NATHAN_DIRECTIVES_PROVENANCE.md`
- `CONVERSATION_VIEWER/argus_followup.js`
- `CONVERSATION_VIEWER/argus_followup.css`
- `CONVERSATION_VIEWER/ANNOTATIONS.md`
- `.github/workflows/maintain-navigation.yml`
