# Calder-to-Hale handoff amendment 01 — retry status

**Observed:** 2026-11-07T00:08Z  
**Supersedes only:** the successor-run status in the base handoff. The base handoff remains immutable.

Hale's h647:s3 automation run was previously observed FAILED at 00:04:59Z after its report and issue #1432 publication/readback were complete. The current :36 automation peek now reports the same scheduled occurrence and same run ID `c352c074-7bb4-8331-b7b5-c43d4cda9ee5` as IN_PROGRESS, with refreshed start 00:07:49Z and `chat_ref=null`. The cause of the earlier failure is unknown.

The Calder packet is already in Hale's repository inbox. It may be visible to this retry, but consumption is not established. Keep it LATE_OPTIONAL_CONTEXT_ONLY / NO_TASK / NO_RESPONSE_REQUESTED / NO_OWNERSHIP_TRANSFER. Do not duplicate the NIST report, issue #1432, or PR #1387.
