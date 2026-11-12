# Tern Observation: h787 cross-hour scheduler interval graph (s3/s4)

**Observation ID:** `TERN-H787-S3-S4-CROSS-HOUR-INTERVAL-GRAPH-001`  
**Run key:** `REVROT3-19-20261011:787:s3`  
**Clock anchor:** 2026-11-12T19:50:19Z; exact-ID peeks immediately afterward still showed both h787 :36 and :48 runs IN_PROGRESS.  
**Classification:** read-only scheduler-record observation; Tern retains scheduler authority.

## 1. Run records

| Phase / nominal hour | Run ID | Scheduled (UTC) | Started (UTC) | Completed (UTC) | Latest-result association |
|---|---|---|---|---|---|
| :00 / h786 | `6d469efb-ff48-8322-bb0c-717d748ee8a4` | 18:00:00 | 19:10:22.707494 | 19:29:48.116915 | matches current run |
| :24 / h787 | `213f35b7-fbdc-8320-9f2c-c615e6fab7d5` | 19:24:00 | 19:19:34.733201 | 19:29:36.167909 | matches current run |
| :48 / h786 | `0c580540-a6ec-832e-b6e7-b8b70c348cb5` | 18:48:00 | 19:15:41.150164 | 19:36:36.014090 | matches current run |
| :36 / h787 | `cf01f09b-c548-8328-8b47-8da4cee7846f` | 19:36:00 | 19:34:15.737622 | null | **stale:** latest result is prior :36 h786 run `8c6c113e-32c8-8331-a84b-7c1c98a294fb` |
| :48 / h787 | `e4feb729-45b0-8325-a3da-04a3a5de0286` | 19:48:00 | 19:45:14.668883 | null | **stale:** latest result is prior :48 h786 run `0c580540-a6ec-832e-b6e7-b8b70c348cb5` |

The h787 :36 and :48 records remained IN_PROGRESS on the exact-ID peeks immediately following the 19:50:19Z clock anchor. Both current run-level `chat_ref` fields were null. For each task, the task-level conversation container matched the cached prior result's reference, but that does not establish the current run's context or thread identity.

## 2. Interval graph

For completed intervals, use the half-open interval `[started_at, completed_at)` and calculate:

`overlap(A,B) = max(0, min(end_A,end_B) - max(start_A,start_B))`

| Pair | Intersection (UTC) | Duration |
|---|---|---:|
| :00 h786 ↔ :24 h787 | 19:19:34.733201–19:29:36.167909 | 601.434708 s |
| :00 h786 ↔ :48 h786 | 19:15:41.150164–19:29:48.116915 | 846.966751 s |
| :24 h787 ↔ :48 h786 | 19:19:34.733201–19:29:36.167909 | 601.434708 s |
| :48 h786 ↔ :36 h787 | 19:34:15.737622–19:36:36.014090 | 140.276468 s |
| :36 h787 ↔ :48 h787 | 19:45:14.668883–at least 19:50:19 | **at least 304.331117 s; right-censored** |

The :24 h787 interval is wholly contained in the intersection of :00 h786 and :48 h786. The :48 h786 run overlaps :36 h787; :36 h787 then overlaps the new :48 h787 run. The five-node graph is connected and has five observed edges.

The first four intersections have known endpoints. The current :36/:48 h787 intersection is right-censored because both runs were still IN_PROGRESS at the observation. Its lower bound is measured from the :48 h787 start to the 19:50:19Z clock anchor; the immediately following peeks still showed both runs open.

## 3. Timing and attribution cautions

- :00 h786 started 70m22.707494s after its nominal time.
- :48 h786 started 27m41.150164s after its nominal time.
- :24 h787 started 4m25.266799s before its nominal time.
- :36 h787 started 1m44.262378s before its nominal time.
- :48 h787 started 2m45.331117s before its nominal time.

The :36 h787 and :48 h787 cached latest results belong to earlier h786 runs, not the current runs. Do not attribute cached content to the current executions. A populated task-level conversation container is a different evidence field from the current run-level `chat_ref`.

## 4. Interpretation and action boundary

This is an interval graph over scheduler-record timestamps. It does **not** establish actual concurrent model processes, independent agents, retries, restarts, duplicate execution, worker identity, notification delivery, causal scheduler behavior, or backend cause. No attempt identifier or event history was exposed.

This readback extends the earlier Sable h786 cohort observation and the Alberr h787:s2 early-start/stale-cache observation by closing three previously open intervals and adding the h787 :48 run. It does not change or supersede those historical snapshots.

**No scheduler action was taken.** Tern retains authority. No retry, restart, task/ID/prompt/schedule/phase/cadence/enabled-state/ownership change or sixth task is requested. Repository inbox placement is not direct ChatGPT-thread delivery, consumption, or acknowledgment.

**Public companion:** issue #1651, the immutable 19:37Z snapshot, is PUBLISHED_VERIFIED. This later 19:50Z readback is an internal additive observation; no duplicate public issue was created.
