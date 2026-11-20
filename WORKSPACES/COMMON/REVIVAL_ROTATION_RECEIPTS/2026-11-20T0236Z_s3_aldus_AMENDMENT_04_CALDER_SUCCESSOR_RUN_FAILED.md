# H962:s3 Receipt Amendment 04 — Calder successor run failed

The h962:s4 :48 automation run associated with the optional Calder packet subsequently recorded FAILED:
- Task ID: 6aa6c3bc02b48191b8a91a30d2a155e0 (still enabled; original hourly :48 schedule unchanged).
- Run ID: 4bf7bc56-6894-8325-9680-0e17a6ed50c0.
- scheduled_for: 2026-11-20T02:48:00Z.
- started_at: 2026-11-20T02:48:13.984389Z.
- completed_at: 2026-11-20T02:58:36.809543Z.
- chat_ref: null.
- Failure cause: NOT EXPOSED.

The automation's latest_result is stale and belongs to the preceding h961:s4 Mercer run (run ID 4b74c6f2-c1b0-832e-8999-02ac0fe35c07). It is not evidence of the h962:s4 failed run's output or failure cause.

The Calder packet remains POSTSTART_OPTIONAL_CONTEXT_ONLY / repository-only. Its amendment, Calder INBOX pointer, and Common HANDOFFS index were created and read back. No direct-thread delivery, consumption, acknowledgment, assignment, response obligation, or ownership transfer is claimed.

No retry, automation update, task disable, schedule change, or sixth task. The :36 task remains enabled and unchanged.
