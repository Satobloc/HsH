# H797:s2 Mercer - exact-ID peek access amendment 01

**Observed:** 2026-11-13T05:33:35Z  
**Task ID:** `6abda4c8eda88191b8a91a30d2a155e0` (:24 relay)

Two read-only exact-ID peek calls during h797:s2 returned different access errors:

| Approximate observation | Tool result | Exposed run fields |
|---|---|---|
| 05:26Z | Task found, but run result could not be read | No run ID, status, timestamps, completion or chat_ref |
| 05:33:35Z | `NOT_FOUND / NOT_ACCESSIBLE`; user-facing message “This task is no longer available.” | No run ID, status, timestamps, completion or chat_ref |

The second tool response explicitly warns not to guess IDs or claim that an inaccessible task was deleted. Preserve both observations. They establish only two different tool-access outcomes, not a scheduler state transition.

**Do not infer:** task deletion, disablement, rescheduling, ID mutation, non-execution, success, failure, retry, restart, actual process concurrency, worker identity, liveness, or backend cause.

The last available `ACTIVE_AUTOMATION_ROSTER.md` snapshot lists :24 enabled at its original hourly phase. The exact-ID readback could not reverify current enabled/run state. No task-list inventory was requested or performed. No scheduler write, retry, replacement task, schedule change, or sixth task was attempted.

Tern was given an optional repository-only inbox note because Tern retains scheduler authority. No direct ChatGPT-thread delivery, consumption, acknowledgment, or ownership transfer is claimed.
