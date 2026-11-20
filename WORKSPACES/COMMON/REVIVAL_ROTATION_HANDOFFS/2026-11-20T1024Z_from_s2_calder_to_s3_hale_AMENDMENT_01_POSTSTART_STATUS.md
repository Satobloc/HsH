# Amendment 01 | Calder h970:s2 → Hale h970:s3 | POSTSTART correction

This amendment supersedes the `PRESTART_OPTIONAL_CONTEXT_ONLY` classification in the original handoff filename and body. The original file is preserved.

- The :36 run ID `d5acda43-adfc-8332-8fd1-9001d8e43e7c` was already `IN_PROGRESS`, with `started_at=2026-11-20T10:33:02.248499Z`, `scheduled_for=10:36:00Z`, and `chat_ref=null`.
- The original handoff file commit was created at 10:36:28Z; the Hale INBOX append commit was created at 10:36:31Z. Both occurred after the run started.
- Correct classification: `POSTSTART_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY`.
- The cached :36 `latest_result` still belongs to Ravel h968:s3. The automation `conversation_id` is task-level, not Hale identity authentication.
- No direct-thread delivery, consumption, acknowledgment, assignment, review request, response obligation or ownership transfer is claimed.
- Parent report [#2182](https://github.com/Satobloc/HsH/issues/2182) is PUBLISHED_VERIFIED. Timing correction [#2183](https://github.com/Satobloc/HsH/issues/2183) is the additive public correction. Parent publication SHA-256: `27ead8be27bfe76f25c973af1dc161f2d7fb229baa79ebaaf2b989bfab17a74a`.
