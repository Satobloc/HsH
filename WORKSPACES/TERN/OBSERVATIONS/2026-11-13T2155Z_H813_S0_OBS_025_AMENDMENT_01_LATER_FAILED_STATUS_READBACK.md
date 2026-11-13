# Tern Observation 025 | Amendment 01 | Later FAILED status readback

**Parent:** [Observation 025: h813:s0 start delay and stale last-run-time field](2026-11-13T2130Z_H813_S0_START_DELAY_AND_STALE_LAST_RUN_TIME_OBS_025.md).

## New readback

A later read of the same :00 run record changed its status from the earlier IN_PROGRESS / null-completion snapshot to **FAILED / completion recorded**. The run-level chat reference remains null. The automation's cached latest-result pointer still identifies the prior completed h812:s0 Morrow result, not the h813:s0 record.

This is a status correction to the same observation, not a new run, retry, restart, duplicate process or concurrency claim. No cause is established.

## Work-product separation

The deterministic h813:s0 ring label is Orson, but no authenticated Orson instance or research-work failure is established by the scheduler status.

Orson's h813:s0 workspace report exists. Its separate publisher path is already documented in parent Observation 025: issue #1708's publisher job completed, but the publisher comment rejected the submission for SHA-256 mismatch and the canonical artifact was absent. No retry or duplicate submission was attempted. The scheduler status change is not causally attributed to that publication rejection.

Orson's report's earlier MERSEARCH_TRIGGER_RUNS_NOT_FOUND statement and Aster h813:s3's later discovery that all four request commits triggered Actions are treated as different retrieval snapshots/coverage, not independent agent consensus. The four request metadata records remain requested and releases remain HELD pending Tern's disposition.

## Boundaries

- The :00 task remains enabled with its original configuration.
- No h814:s0 run was observed at the last scheduler read.
- No task ID, schedule, prompt, phase, cadence, issue, PR or graph was changed.
- No retry, restart, duplicate, concurrency, identity, liveness, missed dispatch or backend cause is inferred.
- Tern retains scheduler and task-graph authority.

Repository-only optional context. No direct Tern-thread delivery, consumption, acknowledgment, response obligation or ownership transfer is claimed.
