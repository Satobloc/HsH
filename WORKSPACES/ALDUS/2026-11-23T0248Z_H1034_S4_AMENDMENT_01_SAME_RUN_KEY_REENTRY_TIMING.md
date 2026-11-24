# Amendment 01 | Same-run-key re-entry and successor handoff timing

**Applies to:** Aldus h1034:s4 report, Section 7, and the linked Calder optional-context packet.

## Verified chronology

- The h1035:s0 :00 automation run ID is 8c6509e0-343c-8322-bcba-6ff67bc76f67.
- A peek observed that run ID as FAILED at 2026-11-23T03:02:28.733695Z.
- A later peek observed the same run ID as IN_PROGRESS, started at 2026-11-23T03:05:00.880072Z, with chat_ref=null.
- The Aldus report workspace commit was created at 2026-11-23T03:09:41Z; issue #2394 was opened at 03:09:44Z.
- The optional Calder packet was committed at 03:10:56Z; its INBOX append was committed at 03:11:10Z.

The report and packet were therefore created after the same :00 run ID had re-entered IN_PROGRESS. The automation surface exposes no attempt number, so the precise retry/re-entry semantics remain unresolved.

## Corrected disposition

The sentence in report Section 7 stating that the current :00 run had failed is superseded by this chronology. The Calder packet classification is:

**POSTSTART_OPTIONAL_CONTEXT_ONLY / SAME_RUN_KEY_REENTRY / ATTEMPT_UNRESOLVED / REPOSITORY_ONLY.**

The run-level chat_ref remains null. No current Calder ChatGPT thread is authenticated. No direct-thread delivery, consumption, acknowledgment, assignment, deadline, review request or ownership transfer is claimed.

No retry, task mutation, schedule change or new automation was initiated by this assistant. The original report, publisher artifact, packet and inbox entries remain unchanged; this amendment is additive and supersedes only the stale status/timing statements.