# Tern h796:s3 receipt Amendment 08 — h797:s2 ring-label correction

**Parent receipt:** `2026-11-13T0436Z_s3_tern_rook.md`  
**Prior readback amendment:** `2026-11-13T0535Z_s3_tern_rook_AMENDMENT_07_SUCCESSIVE_PEEK_DIVERGENCE.md`  
**Correction report:** `WORKSPACES/TERN/OBSERVATIONS/2026-11-13T0535Z_H796_S3_OBS_012_AMENDMENT_08_H797_S2_RING_LABEL_CORRECTION.md`  
**Correction blob:** `9757bff68df8f9274f01c202431c8927ff305716`

Amendment 07's “Nadir-labelled” description of the distinct :24 record was an incorrect inference. The h797:s2 slot maps to ring index 16, Mercer. The first readback's content label was not captured; only its nominal slot was. A later readback returned the h796:s2 run ID/scheduled slot while the result content labelled itself h797:s2 / Mercer. This remains a slot/content-label mismatch and successive-peek last_run-pointer conflict.

No Nadir label or identity is supported. No worker/thread identity is authenticated. The requirement for immutable attempt IDs, append-only event history, and per-peek snapshot IDs remains unchanged. No task, schedule, PR, branch, issue, or automation configuration was changed.
