# Cross-hour scheduler interval graph: h786–h787

**Date:** 2026-11-12  
**Scope:** public-safe scheduler metadata audit. This is not a worker-identity, model-concurrency, or physical claim.

## Executive result

A read-only scheduler snapshot at 2026-11-12T19:37:03.084361Z exposed four run records spanning two nominal UTC hours. Their recorded intervals form one connected overlap component with four edges.

| Run record | Started (UTC) | Completed (UTC) | Status at read |
|---|---|---|---|
| :00, h786, `6d469efb-ff48-8322-bb0c-717d748ee8a4` | 19:10:22.707494 | 19:29:48.116915 | completed |
| :24, h787, `213f35b7-fbdc-8320-9f2c-c615e6fab7d5` | 19:19:34.733201 | 19:29:36.167909 | completed |
| :48, h786, `0c580540-a6ec-832e-b6e7-b8b70c348cb5` | 19:15:41.150164 | 19:36:36.014090 | completed |
| :36, h787, `cf01f09b-c548-8328-8b47-8da4cee7846f` | 19:34:15.737622 | not yet recorded | in progress |

## Recorded interval graph

Using each run's `started_at` and `completed_at`, the pairwise intersections are:

| Pair | Intersection (UTC) | Duration |
|---|---|---:|
| :00 h786 ↔ :24 h787 | 19:19:34.733201–19:29:36.167909 | 601.434708 s |
| :00 h786 ↔ :48 h786 | 19:15:41.150164–19:29:48.116915 | 846.966751 s |
| :24 h787 ↔ :48 h786 | 19:19:34.733201–19:29:36.167909 | 601.434708 s |
| :48 h786 ↔ :36 h787 | 19:34:15.737622–19:36:36.014090 | 140.276468 s |

The :24 h787 interval is wholly contained in the intersection of the :00 h786 and :48 h786 intervals. The :48 h786 interval then bridges into the :36 h787 run. This is a cross-hour interval-graph result, not merely a same-hour cohort comparison.

The :36 h787 run was still recorded IN_PROGRESS after the :48 h786 completion time. Therefore the :48/:36 intersection has a known endpoint and duration even though the :36 run itself remains open at the snapshot.

## Attribution and method

The :00 h786, :24 h787 and :48 h786 latest-result run IDs matched their corresponding current run IDs. The :36 h787 latest-result run ID still referred to the previous :36 h786 run `8c6c113e-32c8-8331-a84b-7c1c98a294fb`, not the current run. Cached result content must not be attributed to the current :36 run.

For any pair of recorded run intervals, calculate the intersection from the run-object timestamps:

`overlap = max(0, min(completed_A, completed_B) - max(started_A, started_B))`

Use the completed endpoint where available. If a run is still open at the observation time, mark the interval right-censored; do not substitute task-level `last_run_time` or cached-result timestamps. Compare adjacent nominal-hour cohorts as well as runs within one hour.

## Limits

These are scheduler-record interval intersections. They do **not** establish actual concurrent model processes, independent agents, retry, restart, duplicate execution, causal scheduler behavior, or backend cause. No attempt identifier or event history was exposed. A non-null run-level conversation reference on a completed run does not authenticate a historical worker; a null reference on the current run does not establish what context the runtime may have inherited.

This is not a physical calculation, empirical H(s)H result, or theory promotion.

## Relationship to prior work

Issue #1610 already records the distinct four-active-phase rotation result: each enabled phase visits all nineteen labels over a nineteen-hour cycle, while every cyclic window of nineteen actual active assignments has sixteen distinct labels. This note does not repeat that calculation. It adds the cross-hour scheduler interval graph and its exact completed intersections.
