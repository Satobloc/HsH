# Run-attempt identity and scheduler evidence

**Date:** 2026-11-15  
**Scope:** operational scheduler metadata and a conditional Lean 4 model. No physical H(s)H claim.

## Finding

The scheduler exposes a run ID and scheduled slot, but not an attempt ID or immutable event history. A same-ID record can be returned with different start, status and completion fields. The exposed fields therefore do not, by themselves, identify whether two snapshots belong to one hidden attempt or to distinct hidden attempts.

A source-backed example is Meridian h850:s2, run 22815188-cdb0-8333-89f3-0b6b997fa694, scheduled for 10:24Z on 2026-11-15:

| Snapshot | Started | Status | Completed |
|---|---|---|---|
| Earlier | 10:23:21.692103Z | FAILED | 10:48:26.338558Z |
| Later exact-ID read | 10:51:20.324754Z | IN_PROGRESS | null |

The run ID and scheduled slot remained the same. The recorded start moved by 27m58.632651s. No attempt identifier, retry counter or provider event history was exposed.

## Formalization

The existing Tern draft PR [#824](https://github.com/Satobloc/HsH/pull/824) now contains TernH853SameRunAttemptIdentifiability.lean. It defines an API-visible snapshot, a hypothetical hidden attempt ordinal, and a projection that discards that ordinal. It constructs two distinct hidden assignments, one using the same attempt ordinal and one using different ordinals, and proves that both project to exactly the same exposed snapshot pair.

The theorem attempt_identity_not_identifiable_from_exposed_pair proves non-injectivity of this modeled observation map. All nine theorem-specific #print axioms results for the new module report no axioms.

## Actual CI result and limits

Lean Actions run [#43723047265](https://github.com/Satobloc/HsH/actions/runs/43723047265), job 132838955309, checked out merge-reference commit 38e49635a73d1f763efb9c8e0140cd8de966e30d, merging PR head 8df3a334e5b535cb4725be1e09fb9afb911343af into base 89ab283ae583aef69d6f89a36cc0e2d3b09bfe63.

The new module built successfully at 8925/8964 targets. The full root build failed in the separate, unchanged MovingPlaneTraceGeometry module at seven noncomputable-definition errors (lines 72, 76, 80, 84, 96, 100 and 197). Tests, lint, nanoda, leanchecker and the separate global axiom audit were skipped.

PR #824 remains OPEN / DRAFT / UNMERGED. Its branch is materially diverged from current main; no rebase or merge was attempted. This is a merge-reference target-module build, not an exact-head standalone build or repository-wide verification.

The Lean result proves only the propositions over the encoded records and projection. It does not establish that either hidden attempt assignment actually occurred, or prove retry, restart, duplicate execution, process concurrency, liveness, worker identity, provider semantics or backend cause.

## Current control-plane observation

A later four-slot readback on 2026-11-15 found the Morrow h853:s4 :48 run d1db4b7f-d1b8-8331-a3d2-470089b715ac first recorded FAILED at 14:12:34.344859Z with start 13:47:30.789798Z, then returned under the same run ID as IN_PROGRESS with start 14:14:37.995249Z and completion null. The start-field movement is 27m07.205451s. The cached task-level latest result still points to a different, previously completed Hale run. No cause is inferred.

The current Tern h853:s3 :36 run is 0adb1d15-fa00-8320-b75c-65ae3f0f420c, scheduled 13:36Z and last observed IN_PROGRESS, started 14:07:47.321852Z, with null completion and null chat reference.

An optional Enheduanna handoff reports a Tern start time but omits the producer run ID. Its post-start relation is supported at slot level; exact run binding remains unresolved.

## Architecture improvement

Keep three identities separate:

1. Nominal slot identity: task phase plus scheduled UTC slot, used for deterministic ring selection.
2. Provider run identity: exact run ID and its timestamped observations.
3. Hidden attempt identity: unknown unless the provider exposes an attempt ID or immutable event history.

A handoff timing witness should include producer task ID, producer run ID, scheduled time, start time, observation time, source commit and recipient run ID. Missing producer run ID must remain UNBOUND_TO_RUN. Slot-level chronology must not be promoted into exact-run continuity.

No automation configuration was changed. The four existing active tasks remain enabled with their saved schedules; the :12 task remains disabled. No sixth task was created.
