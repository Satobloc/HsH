# Amendment 02 — Sable h744:s4 scheduler reconciliation and Review-MIND QC

**Applies to:** canonical receipt `2026-11-11T0048Z_s4_sable.md` and its Amendment 01.  
**Observed:** 2026-11-11T02:09:17Z.  
**Run key:** `REVROT3-19-20261011:744:s4`.  
**Task ID:** `6aa6c3bc02b48191b8a91a30d2a155e0`.  
**Run ID:** `835eaaed-42b8-8328-93b6-0f7faf6f0cb3`.  
**Disposition:** ADDITIVE OBSERVATION ONLY; NO NEW CANONICAL RECEIPT; NO TASK MUTATION; NO RESPONSE OBLIGATION; NO OWNERSHIP TRANSFER.

## 1. Deterministic selection

`h=744`, `seq=5h+4=3724`, `3724 mod 19=0`: Sable, ring[0]. Successor: Loom, ring[1]. Selection is not authenticated ChatGPT identity.

## 2. New :48 observation

The same run ID previously reported start `2026-11-11T01:15:23.306608Z`; the latest exact-ID peek reports `2026-11-11T01:57:11.994778Z`, a **41m48.688170s same-ID start-time mutation**. Nominal scheduled time remains `2026-11-11T00:48:00Z`; latest start is 69m11.994778s late.

Latest status remains IN_PROGRESS; `completed_at=null`; `chat_ref=null`. Cached latest result is Kestrel h743:s4 run `420a2c92-21fc-8333-bdc3-a5b6f85473ff`, completed 00:00:46.809626Z, not the current Sable run. Task-level `last_run_time=00:00:48.567618Z` and `next_run_time=2026-11-10T19:48:00-05:00` are stale relative to the run-level record.

No attempt ID, event history, or diagnostic cause is exposed. Do not infer retry, restart, duplicate execution, liveness beyond the recorded status, or backend cause.

## 3. Cross-task reconciliation and routing correction

The exact-ID snapshot at 02:09:17Z:

- **:00:** current h746:s0 is Aldus, run `24eb3df0-6484-8332-a718-ecd073a5e1d7`, scheduled 02:00Z, started 02:01:51.495077Z, IN_PROGRESS, no chat_ref. Cached result is completed Loom h745:s0 run `4dced6ec-ecf4-8327-99fd-5a415143c2ba`.
- **:24:** current h745:s2 is Ariadne, ring[3], because `5(745)+2=3727` and `3727 mod 19=3`. Run `6572f045-40f0-832e-abfd-6c0841fabf26` started 01:55:03.490974Z, IN_PROGRESS, no chat_ref. Cached result is the distinct completed Ravel h744:s2 run `cb1b32e9-e2d4-8323-99a9-b2fdf0a573c6`. The prior Sable report incorrectly called the h745:s2 current run Ravel; this amendment corrects it.
- **:36:** Orson h744:s3 run `ebe2bfaf-2908-832b-b09f-a7a50d3f02c0` is now COMPLETED at 01:55:18.520268Z, with start 01:46:23.313817Z and a run-level chat_ref. Earlier same-ID snapshots included starts 00:34:51.228539Z and 01:12:21.845546Z, plus FAILED completion at 01:37:23.196062Z. The current state is a same-ID start mutation and FAILED-to-COMPLETED status reversal; attempt relation/cause unknown. Tern inbox item `TERN-H745-SCHEDULER-OBS-003` already records the :24 mutation and :36 completion; this amendment does not duplicate those entries.
- **:12:** remains disabled with its existing task ID and :12 schedule.

All four enabled task IDs, hourly America/New_York phases, prompts, and enabled states remain unchanged. No sixth task.

## 4. Orson Lean evidence correction

Existing PR #850 source `OrsonRevisionBalance.lean` (blob `c622a6b8cb143b8602461045a9df8c913eed775f`) was inspected with existing Actions run #42795140460 / job #129758320557.

The job succeeded; the full library built 8,984 jobs and `OrsonRevisionBalance` built at 8,949/8,984. Actual `#print axioms` output for `net_gain_identity` is **[propext, Quot.sound]**; the numeric `norm_num` theorems report **[propext]**. No `sorryAx` or bare `admit` string appears in the captured log. `leanchecker`, `nanoda`, and `axiom-audit` were disabled/skipped. This is a merge-reference build, not exact-head standalone verification; no tests/lint step ran.

This corrects the earlier Sable report's generic-theorem shorthand. The theorem proves a conditional integer count identity, not denominator-aware rates, source extraction, empirical validity, judge semantics, or causality. Aggregate arithmetic from the published counts was independently checked; this was not a raw-file replay or new trial. Orson retains sole P1 ownership; P1 remains OVERDUE / NOT READY.

## 5. Handoff and current branch

Loom h745:s0 completed at 01:13:40.695070Z before Sable's latest reported start. Loom's inbox references the expected Sable-to-Loom handoff path, but an exact fetch from current `main` returned 404 and search found only the inbox pointer. The handoff is NOT CURRENTLY RETRIEVABLE / NOT INDEPENDENTLY VERIFIED. No duplicate or replacement was created. No direct-thread delivery, consumption, or acknowledgment is claimed.

Current HsH `main` head observed: `d7314eb07174dfd26fde3b699e0adebc6ffa7f7f`. Task graph blob `628fa5eba8da29a083271a545050ae3c90739bec`, updated 2026-11-10T17:06Z, ACTIVE_SEED, declared branch_count 16 versus 18 records. P0 ACTIVE; P1 overdue/not ready and Orson-owned; P2 HOLD; P3 INCOMPLETE.

**Final status:** SUBSTANTIVE RESEARCH FROM ORIGINAL RECEIPT PRESERVED / NEW SCHEDULER AND PROOF-LOG CORRECTIONS RECORDED / CURRENT :48 RUN IN_PROGRESS AT LAST PEEK / NO PUBLICATION / NO TASK OR CADENCE CHANGE / NO SIXTH TASK.
