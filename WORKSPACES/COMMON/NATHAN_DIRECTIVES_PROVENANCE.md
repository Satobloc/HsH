# Nathan Directives Provenance Log

**Purpose:** preserve direct requests, standing directives, corrections, priority changes, and scope clarifications from Nathan with enough raw-message provenance to audit intended meaning later.

This is an operational/provenance record, not a theory surface.

## Recording rule

For every direct Nathan request/directive that materially changes work, scope, priority, quarantine, tooling, archive procedure, or interpretation policy, record when available:

- local timestamp and timezone;
- raw conversation ID;
- raw message ID / node ID;
- durable conversation path once archived;
- short directive summary;
- exact or near-exact quoted wording only when raw authorship is verified;
- affected files/workstreams;
- implementation/status;
- later correction/supersession pointer if applicable.

If a live conversation has not yet entered the raw archive, record the directive immediately with `PENDING RAW-ID BACKFILL` rather than inventing an ID. Backfill the exact conversation/message identifiers once the export appears. Direct-user provenance outranks assistant paraphrase where intended meaning is disputed.

---

## 2026-09-13 — Dashboard/quarantine scope; directive provenance; Viewer continuation

- **Local timestamp:** approximately `2026-09-13 05:00 EDT` (`America/New_York`)
- **Conversation ID:** `PENDING RAW-ID BACKFILL`
- **Message/node ID:** `PENDING RAW-ID BACKFILL`
- **Durable conversation path:** `PENDING LIVE EXPORT`
- **Authorship:** direct current-chat user instruction from Nathan; raw metadata not yet available in repository.
- **Directive summary:**
  1. Nathan's Dashboard is to remain open and usable as a navigation/overview surface; it is not itself quarantined.
  2. Quarantine should apply primarily to affected assistant-generated theoretical/interpretive work and dependencies. Indices, wayfinding, archive maps, and the Dashboard may still be used to navigate and determine what is current/new, with caution around theory-bearing claims inherited from the failed integration lane.
  3. The Dashboard should contain an explicit section showing what is quarantined and why.
  4. Direct Nathan requests/directives should henceforth be logged with conversation ID plus timestamp/message ID when available, so later archived JSON provides auditable provenance and priority.
  5. Continue the Conversation Viewer work attributed to Argus: collapsed/truncated windows should open when clicked and remain open as appropriate; non-conversation/internal/plumbing messages should be exempt from Typealong replay; an internal-only flagging interface should support upgrade/downgrade/flag/promote operations.
- **Affected records:** `QUARANTINE/2026-09-13_INTEGRATION_HALT/README.md`; original-archive `..[🎛️_NATHAN_DASH]/!_DASHBOARD.md`; Common coordination records; `CONVERSATION_VIEWER/*`.
- **Status:** quarantine manifest and Dashboard clarification committed; Viewer continuation committed; exact raw conversation/message provenance pending export backfill.

---

## Backfill procedure

When the corresponding live conversation JSON enters `LIVE CONVOS` or `DEVELOPMENT_FULL_CONVOS`:

1. identify this user message by timestamp + wording;
2. verify `author.role == user`;
3. replace the pending fields above with exact conversation ID, message/node ID, timestamp, and repository path;
4. do not alter the directive summary except to append a correction note if Nathan later changes it.
