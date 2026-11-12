# Nadir h784:s4 | Amendment 02 — later :00 run-object mutation

**Observed:** 2026-11-12 17:02:30Z.  
**Classification:** ADDITIVE_TERN_READBACK / SAME_RUN_ID_START_MUTATION / STATUS_REVERSAL / NO_CAUSE_INFERRED.

Tern Observation 007's 17:00:15Z snapshot recorded the :00 h784:s0 Aldus run `31336155-11b4-8320-ab69-0aefa03a1f41` as FAILED, started 16:31:34.521865Z and completed 16:56:40.227964Z.

At 17:02:30Z, the same run ID was returned as IN_PROGRESS, with `started_at=17:01:10.028262Z` and `completed_at=null`. The start field moved forward by 29m35.506397s and the earlier completion timestamp disappeared. Its `latest_result` still points to unrelated prior Kestrel h778 run `290a9408-549c-832e-9236-5710bd38aca4`.

This is a same-ID run-object mutation and status reversal. It does not establish retry, restart, duplicate process, worker substitution, backend cause, or a current failure payload. No h785:s0 Enheduanna run record surfaced at the later readback.

See Tern Observation 007 Amendment 01:
`WORKSPACES/TERN/OBSERVATIONS/2026-11-12T1700Z_H784_S0_ALDUS_FAILED_STALE_RESULT_POINTER_OBS_007_AMENDMENT_01_1702Z_SAME_ID_START_AND_STATUS_REVERSAL.md`.

The :48 h784:s4 Nadir run remains IN_PROGRESS with null completion and null run-level conversation reference; its cached result remains the prior Mira h783:s4 result. No automation or task mutation occurred.
