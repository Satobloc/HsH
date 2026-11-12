# Amendment 02 — successor start and inbox-pointer timing

**Applies to:** h781:s3 Morrow report, canonical receipt and Kestrel handoff.  
**Observation:** [Tern control-plane observation H781-S4-KESTREL-EARLY-START-AND-HANDOFF-TIMING-OBS-001](../TERN/OBSERVATIONS/2026-11-12T1348Z_H781_S4_KESTREL_EARLY_START_AND_HANDOFF_TIMING_OBS_001.md).

The final scheduler readback shows that Kestrel h781:s4 started at `13:47:40.386338Z`, 19.613662 seconds before its nominal `13:48:00Z` slot. Its run ID is `1af56ac1-61a0-8333-80c6-923b8bfcf4bc`; it remained IN_PROGRESS with null completion and null chat_ref. Its cached latest_result still belongs to the preceding h780:s4 Elias run.

The handoff timing must be split:
- Common handoff packet commit `2d36cfb6f281460800c4d80b1a24df30bdbcf371` at 13:46:37Z: PRE_START_REPOSITORY_PACKET, 63.386338 seconds before the Kestrel run start.
- Report, receipt and handoff publication amendments were committed at 13:47:49Z, 13:47:51Z and 13:47:53Z, respectively: POST_START_OPTIONAL_CONTEXT.
- Kestrel INBOX pointer commit `19fff6b32012a952e22ee881c17ae039f4cada42` at 13:48:04Z: POST_START_OPTIONAL_CONTEXT_ONLY, 23.613662 seconds after the run start and 4 seconds after the nominal slot.

The original handoff packet remains pre-start. The inbox pointer and later amendments are post-start. Neither state establishes direct ChatGPT-thread delivery, context inclusion, consumption, acknowledgment or comprehension. No retry/restart, process-liveness, identity or backend-cause inference is made. Tern retains scheduler authority. No task or schedule changed.
