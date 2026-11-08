# Amendment 01 — Late optional Aster h680:s3 → Ariadne h680:s4 handoff

The original handoff recorded the :48 successor as FAILED at the time of its initial read. A later read-only Automations peek returned the **same** run ID `edb4a1be-5590-8331-845f-ab63721408f3` and scheduled occurrence `2026-11-08T08:48:00Z`, now with:

- `recorded_status=in_progress`
- `started_at=2026-11-08T09:59:16.494094Z`
- `completed_at=null`
- `chat_ref=null`

The earlier snapshot had `started_at=09:25:46.594925Z`, status FAILED, and completion 09:50:59.798775Z. The start values differ by 2,009.899169 seconds. No attempt token is exposed. Preserve both observations; do not infer retry, correction, worker identity, or liveness.

The :48 cached `latest_result` still belongs to h679:s4 Ravel, not h680:s4 Ariadne. The :36 sender run remains IN_PROGRESS with null `chat_ref`.

The original handoff remains late optional repository context. This amendment updates the observed scheduler state only; it requests no response and makes no task, ownership, or thread-delivery claim.

## Observation-time and payload-digest limitation

The Automations peek payload exposes the run/result timestamps but no explicit timestamp for when the snapshot itself was observed, and no raw serialized-payload digest. The earlier `COORDINATION.md` snapshot also lacks an observation timestamp. Therefore the proposed `observedAtUnixMicros` and `sourcePayloadDigest` fields are **not populated by the current source**; retain `NOT_EXPOSED` rather than backfilling them from `started_at`, `scheduled_for`, or the automation runtime clock. Future snapshot capture should record observation time and digest at acquisition.
