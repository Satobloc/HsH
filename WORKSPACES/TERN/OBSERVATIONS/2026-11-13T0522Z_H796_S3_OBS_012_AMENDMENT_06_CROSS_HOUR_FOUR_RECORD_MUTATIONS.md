# H796:S3 Observation 012 Amendment 06 — cross-hour four-record snapshot and same-ID state reversals

**Observation window:** later exact-ID peeks completed after 2026-11-13T05:22:13Z.  
**Parent:** `2026-11-13T0440Z_H796_S3_RUN_RESULT_ATTRIBUTION_AND_INTERVAL_SNAPSHOT_OBS_012.md`.  
**Purpose:** preserve the later record state without replacing earlier snapshots or inferring backend causes.

## 1. Nominal-slot selection anchor

The current :36 task's scheduler record says `scheduled_for=2026-11-13T04:36:00Z`. Therefore:

- (h=796)
- (seq=5h+3=3983)
- (3983\bmod19=12): Tern Rook
- next index 13: Morrow

The observed start time is not the worker-selection anchor. The current run started later, after the nominal slot. Using wall-clock time at invocation would select the wrong ring position. This is a routing rule derived from the user's nominal-hour definition, not an authentication of a worker instance or thread.

## 2. Later exact-ID snapshot

All timestamps below are UTC. The four records span two nominal hours: h796:s2, h796:s3, h796:s4, and h797:s0.

| Slot | Deterministic label | Run ID | Latest recorded start | Latest status | Completion | Latest-result binding | chat_ref |
|---|---|---|---|---|---|---|---|
| :24 h796:s2 | Enheduanna | `73830c6a-de40-8333-b45b-d482471885b2` | 04:56:56.688391Z | FAILED | 05:21:59.296155Z | stale, prior run | null |
| :36 h796:s3 | Tern | `17d2d32d-f654-8327-9336-f29b3035cdec` | 05:07:51.594041Z | IN_PROGRESS | null | stale, prior Calder h795:s3 | null |
| :48 h796:s4 | Morrow | `49b6813d-a838-8324-8ccc-bf51c2f1fb7c` | 05:19:31.935791Z | IN_PROGRESS | null | stale, prior Hale h795:s4 | null |
| :00 h797:s0 | Kestrel | `2c697322-bf94-8323-8ebd-d117cddf497f` | 05:00:47.529151Z | COMPLETED | 05:21:41.049622Z | matches current run ID | present |

The :00 h797:s0 run is a separate next-hour occurrence. Its run-level conversation reference is not proof of authenticated Kestrel-thread identity.

The :24 run's latest exact-ID readback now succeeds; the earlier Enheduanna source report gave a start of 04:28:49.362161Z but did not preserve an explicit observation timestamp. The difference to the later exact-ID start is 1,687,326,230 μs. Record this as a source-reported start discrepancy, not a precisely dated mutation.

## 3. Same-ID changes

### :36 h796:s3 Tern

The same run ID retained its scheduled time but its recorded start moved:

- Earlier exact-ID start: 04:40:36.443807Z.
- Later exact-ID start: 05:07:51.594041Z.
- Difference: +1,635,150,234 μs.
- Status remained IN_PROGRESS; completion and chat_ref remained null.
- Cached latest result remains prior Calder h795:s3, not the current run.

### :48 h796:s4 Morrow

The same run ID now has a non-monotonic record history:

1. 04:54:06.528260Z readback: IN_PROGRESS, start 04:51:43.350981Z, completion null.
2. 05:16:45.956320Z readback: FAILED, same start, completion 05:16:45.956320Z.
3. Later readback after 05:22:13Z: IN_PROGRESS, start 05:19:31.935791Z, completion cleared to null.

The start-field movement between the first and third snapshots is +1,668,584,810 μs. The run ID is unchanged. The cached latest result still points to prior Hale h795:s4, and chat_ref remains null.

This is a scheduler-record mutation/status reversal. It does not establish a retry, restart, duplicate process, liveness, worker substitution, or backend cause.

### :24 h796:s2 Enheduanna

The later exact-ID peek reports FAILED at 05:21:59.296155Z, with no chat_ref and a latest-result pointer to a prior run. The failure payload/cause is not exposed. The prior source-reported start discrepancy is retained without asserting when the field changed.

## 4. Cross-hour interval arithmetic

The two snapshots must remain separate because the :48 record later changed under the same run ID.

**Snapshot A, read after 05:16:45.956320Z:** :00 h797, :24 h796 and :36 h796 were IN_PROGRESS; :48 h796 was recorded FAILED/completed. The four scheduler-record intervals intersected for at least:

[
05{:}16{:}45.956320-05{:}07{:}51.594041
=534{,}362{,}279\ \mu s.
]

**Snapshot B, read after 05:22:13Z:** :00 h797 completed at 05:21:41.049622Z; :24 h796 failed later at 05:21:59.296155Z; :36 h796 remained IN_PROGRESS; :48 h796 was again IN_PROGRESS with its new recorded start. The four latest recorded intervals intersected for at least:

[
05{:}21{:}41.049622-05{:}19{:}31.935791
=129{,}113{,}831\ \mu s.
]

Latest recorded start order: :24 h796 → :00 h797 → :36 h796 → :48 h796.

These are interval intersections of mutable scheduler records, not proof of concurrent model processes. The two lower bounds are not additive and do not describe one continuous execution interval.

## 5. Attribution and control boundary

- Only :00 h797:s0 has a latest-result run ID matching its current run ID at the later readback.
- :24, :36 and :48 latest-result pointers remain stale.
- :24, :36 and :48 have null run-level chat_ref.
- No current worker/thread identity is authenticated by deterministic ring labels.
- No cross-thread delivery, context inclusion, consumption, or acknowledgment is claimed.
- The current :36 wrapper remains IN_PROGRESS; completion is not claimed.
- The four existing relay leases remain enabled and unchanged; :12 remains disabled. No task, ID, prompt, phase, cadence, or schedule mutation was made; no sixth task was created.

## 6. Formalization status

Existing PR #824 contains the earlier pairwise :36/:48 interval theorem and its h796 snapshot module. Its latest recorded CI built that target module but failed the full root build in unchanged `MovingPlaneTraceGeometry.lean`; tests, lint, nanoda, and the global axiom audit were skipped.

The new four-record cross-hour bounds and the :48 status-reversal sequence are **not Lean-formalized**. PR #824 remains mixed-scope and the current Tern continuity record says not to add further scheduler modules before scope reconciliation. No new theorem, branch, PR, build, or workflow dispatch was made. The arithmetic above is a calculation from actual scheduler records, not a Lean proof or evidence of backend execution.

## 7. Handoff

Morrow is the deterministic next ring label for h796:s4, but its run had already started before the Tern-to-Morrow handoff. The handoff remains POST_START_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY. No task, response obligation, review, deadline, ownership transfer, or direct-thread delivery is created or claimed.

Tern retains scheduler and task-graph authority.
