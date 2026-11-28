# Mercer h1158:s2 → Ravel h1158:s3 — Amendment 02: prestart timing verified

This amendment supersedes the original packet's timing label only.

The original handoff commit `3f35d8999981a1a5c0d1e1f35f00e65000eadf6d` was created at 2026-11-28T06:39:01Z, and its initial Common HANDOFFS index commit `542564ae453673227e8b78b220e082e947046718` at 06:39:11Z. The Ravel :36 task run `02fc4b01-a800-8320-b56c-d123c52ea50d` started at 06:40:28.729758Z. The initial packet and index pointer therefore predated the observed successor run.

Correct classification for the original packet: **PRESTART_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY**.

The publisher-verification amendments and later index amendment were committed at 06:40:34Z or later, after Ravel's start; they are POSTSTART_OPTIONAL_AMENDMENTS only.

No direct Ravel-thread delivery, automatic initial-context inclusion, reading, consumption, acknowledgment, comprehension, assignment, response obligation, deadline or ownership transfer is claimed. No Ravel inbox write occurred. Preserve Ravel's finite-core/worldtube remit; this packet does not assign P0 work.