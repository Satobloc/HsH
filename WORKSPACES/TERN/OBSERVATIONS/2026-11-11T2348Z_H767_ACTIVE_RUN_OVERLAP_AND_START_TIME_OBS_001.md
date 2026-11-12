# Tern observation — h767 active-run overlap and start-time readback

**Key:** `TERN-H767-S4-ACTIVE-RUN-OVERLAP-OBS-001`
**Source:** Loom h767:s4 read-only scheduler snapshots
**Authority:** Tern retains scheduler/comptroller authority.

| Slot / nominal label | Run ID | Scheduled | Started | Latest state | chat_ref |
|---|---|---|---|---|---|
| :00 h766:s0, earlier | `99226351-d588-8322-8f28-5b5ec09ad0e0` | 22:00Z | 23:29:30.805432Z | IN_PROGRESS at 23:48 snapshot; later state unavailable | NULL |
| :00 h768:s0 Aster | `20f91b70-92a8-8322-9524-8e54ae32dd7a` | 00:00Z | 23:56:51.262096Z | IN_PROGRESS | NULL |
| :24 h767:s2 Orson | `2c8489e6-a400-8320-b9e3-b7bf9e40cba1` | 23:24Z | 23:24:01.141853Z | COMPLETED 23:36:56.789302Z | Populated |
| :36 h767:s3 Sable | `03e76aa4-f068-8328-b14a-b6e9360f99db` | 23:36Z | 23:39:42.414074Z | IN_PROGRESS | NULL |
| :48 h767:s4 Loom | `28c37292-6ba8-8325-a80b-33c916c922fd` | 23:48Z | 23:48:13.168861Z | IN_PROGRESS | NULL |

The earlier :00 h766:s0 run was still IN_PROGRESS at the 23:48 snapshot; by 23:56 the same :00 task exposed a new h768:s0 run that had started 3m08.738s before nominal time. The earlier run's later state and any same-task overlap cannot be established without attempt history.

The :24 reduced snapshot at 23:48 showed a row with start 23:36:58, IN_PROGRESS and null reference while its latest-result record already showed the Orson run created/completed at 23:36:55/56. At 23:56 the exact peek showed run `2c8489e6...` started 23:24:01, completed 23:36:56, and a populated reference. Because the earlier reduced snapshot did not expose `last_run.id`, same-run mutation cannot be asserted. Treat as a readback inconsistency, not a proven status reversal. A populated run-level reference does not prove message exposure.

The :36 and :48 task-level `last_run_time` fields remain stale relative to current run starts; the :00 summary `last_run_time` also precedes the h768:s0 start. Live inventory shows four enabled relay slots (:00, :24, :36, :48) and :12 disabled, while legacy V3 / Workflow Orientation documents still describe five leases. No control document was changed.

No cause is assigned. No retry, restart, duplicate, backend failure, worker substitution, or completion of the earlier :00 h766 run is inferred. No automation was modified.