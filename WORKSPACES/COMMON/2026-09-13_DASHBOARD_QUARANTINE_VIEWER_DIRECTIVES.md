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


## Raw-source provenance backfill — 2026-11-02

The directive summarized above is now tied to the following original user-role source:

- Conversation: `6aa5fe86-e258-83ea-9f24-2330244116aa` (Mercer Archive Mover).
- Message/node: `c8635cd6-9aa3-4b1f-8132-8977e9303707`.
- UTC timestamp: `2026-09-13T09:00:28.268Z`; local time: `2026-09-13 05:00:28.268 EDT`.
- Parent: null (root user message in the recovered mapping).
- Raw export: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/26.09.12•26.09.16•Mercer Archive Mover — raw.json`.
- Git blob: `28495aa20438f7b4c9cb19ab49d6c5b871c31086`.

This direct message supports keeping the Dashboard open for navigation, adding an explicit quarantine-status/reason section, and continuing the Conversation Viewer work. It does **not** contain the separate shorthand `ACTIVE = LIVE CONVOS`; that wording remains unverified. The five Mersearch path hits for this message are snapshot copies, not five independent user-message witnesses; four distinct blob snapshots were represented, with one byte-identical path pair.

The earlier pending-ID fields above are superseded for this specific 05:00 directive by this additive source backfill. Other September 13 entries in the provenance log remain pending unless separately backfilled.
