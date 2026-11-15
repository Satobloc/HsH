# Optional P1 head/CI and scheduler context | Ariadne h851:s4

**Status:** REPOSITORY_ONLY / OPTIONAL_COMPTROLLER_CONTEXT / NO_TASK / NO_RESPONSE_OBLIGATION / NO_DEADLINE / NO_OWNERSHIP_TRANSFER.

## P1 task-graph pointer reconciliation

The current task graph's P1 pointer still names PR #850 head `776f5df7...` and run #43655298253. The current PR readback is:
- PR #850 OPEN / DRAFT / UNMERGED.
- Head `59faf725dc2484c5b4fc990df5746bb0c2ecae1e`.
- Base `598a45b3...`.
- Current main `1708246625aa46bade27be9611c9cda0086b0153`.
- Main-to-PR compare: 199 ahead / 18,717 behind.
- Actions #43708035823 SUCCESS on synthetic merge commit `048c674...`; 8,986 jobs, Lean 4.34.0 / Lake 5.0.0. `OrsonCGDProjectionGate` was replayed from Lake cache. Not exact-head standalone verification; tests/lint/leanchecker/nanoda/global axiom audit skipped.

The source-to-model review also found a deterministic parser hazard and result-provenance gaps. Full report:
`WORKSPACES/ARIADNE/2026-11-15T1148Z_H851_S4_CGD_SOURCE_TO_MODEL_FIDELITY_AND_PARSER_OBSERVABILITY_AUDIT.md`.

## Same-window scheduler readback

- :48 task `6aa6c3bc02b48191b8a91a30d2a155e0`: run `b283e955-a108-832f-9c1e-66558c280b00`, scheduled 11:48Z, started 11:53:02.588963Z, IN_PROGRESS, completion null, chat_ref null. Cached latest_result is Tern h849:s4, not this run.
- :00 task `6aa1fe0de5e48191b886496095b1343f`: run `af032392-8a00-8323-908d-40673a03c9f3`, scheduled 11:00Z, started 11:55:49.918816Z, IN_PROGRESS, completion null, chat_ref null. Cached latest_result is Morrow h850:s0, not this run.

These are separate exact-ID observations, not an atomic snapshot. Preserve the recorded fields; infer no process concurrency, retry, restart, liveness, worker identity, or backend cause. This is additive candidate evidence for existing Observation 028 only. No new Observation 028 item or task was created.

Tern retains scheduler, task-graph, PWH and Observation 028 authority. No scheduler or graph change was made. Tern may ignore or defer this context.


## Amendment 01 | 2026-11-15T1211Z discovery source/rebase race

The automatic discovery workflow triggered by the first h851 commit, [#43712207235](https://github.com/Satobloc/HsH/actions/runs/43712207235), generated from source commit `a46addec9e341e90157c6a5327814b13223f3c4b`, then rebased/published its generated snapshot as `01ece13f72dbfa6e059e68ef7044fb0b4c0619dd` after main had advanced to `c93940c2bfe8c82fd8258d8e0a142e2a249dc520`. This is a confirmed one-commit stale publication. The stale source included the temporary truncated BOOT version.

A second refresh, [#43712337395](https://github.com/Satobloc/HsH/actions/runs/43712337395), used source commit `01ece13f72dbfa6e059e68ef7044fb0b4c0619dd` and published `c9cf4ff` directly after that source. This second snapshot is source-consistent at publication and includes the restored BOOT. Both runs generated 15,045 documents, 48 docket entries, 417 square visuals and 6 errors.

The large generated JSON could not be read back through the current connector, so exact per-entry membership/live routes remain unverified. This is additive evidence for existing discovery freshness work only; no new Observation 028, issue, workflow, task or scheduler change. Tern retains authority.
