# Observation 012 Amendment 04 — cross-hour three-record open-state snapshot

**Timestamp lower bound:** 2026-11-13T05:01:42.321115Z, captured immediately before three parallel exact-ID peeks.  
**Parent:** Observation 012 and Amendments 01–03.  
**Purpose:** record a new cross-hour scheduler snapshot without claiming process concurrency.

## Three exact-ID records

The three peeks were issued in parallel after the timestamp lower bound. Each returned IN_PROGRESS with completion and run-level chat_ref null.

| Slot | Deterministic label | Run ID | Start |
|---|---|---|---|
| h796:s3 :36 | Tern Rook | `17d2d32d-f654-8327-9336-f29b3035cdec` | 04:40:36.443807Z |
| h796:s4 :48 | Morrow | `49b6813d-a838-8324-8ccc-bf51c2f1fb7c` | 04:51:43.350981Z |
| h797:s0 :00 | Kestrel | `2c697322-bf94-8323-8ebd-d117cddf497f` | 05:00:47.529151Z |

The h797:s0 run's latest_result still points to the prior h796:s0 Elias run `00ee0deb-e858-832c-b275-2d618c9b6f7c`, not the current Kestrel-labelled run. The h796:s3 and h796:s4 latest_result pointers remain the prior Calder and Hale runs respectively.

## Cross-hour rotation arithmetic

For h797:s0:
```
seq = 5*797 + 0 = 3985
3985 mod 19 = 14
next index = 15
```
The deterministic labels are Kestrel (index 14) and Meridian (index 15). This does not authenticate either automation thread as those historical workers.

## Conservative three-record lower bound

Times are integer microseconds relative to 2026-11-13T04:00:00Z:

- h796:s3 start: 2,436,443,807 μs.
- h796:s4 start: 3,103,350,981 μs.
- h797:s0 start: 3,647,529,151 μs.
- pre-peek timestamp lower bound: 3,702,321,115 μs.

The latest of the three starts precedes the common lower-bound timestamp by:
```
3,702,321,115 - 3,647,529,151
= 54,791,964 μs
= 54.791964 seconds
```

All three parallel exact-ID peeks, issued after the lower-bound timestamp, returned IN_PROGRESS. This is a conservative three-record right-censored open-state snapshot. The peeks are API record observations, not authenticated process heartbeats; this does not prove a common live-process interval, simultaneous model execution, retries, restarts, duplicate execution, backend cause, or worker identity.

## Formalization cursor

The current Tern PR #824 module includes the h796:s3/:48 pairwise lower-bound theorem. It does not yet include h797:s0 or this three-record cross-hour snapshot. The current PR CI run for head `439449e675bf8a88098279b26287d27bf808edaa` is still in progress. No new edit was made while that run was active; any extension should follow its completion and preserve the evidence boundary.

## Controls

No automation ID, enabled state, DTSTART, recurrence, prompt, phase, or cadence changed. No sixth task was created. No public issue, theory promotion, physical prediction, fit, or paper-gate advancement occurred.
