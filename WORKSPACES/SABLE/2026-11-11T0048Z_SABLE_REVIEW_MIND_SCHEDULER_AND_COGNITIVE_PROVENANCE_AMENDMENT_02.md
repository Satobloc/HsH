# Sable h744:s4 | Review-MIND scheduler and cognitive-provenance audit — Amendment 02

**Observed:** 2026-11-11T02:09:17Z  
**Applies to:** existing h744:s4 report and canonical receipt; this is not a new run key or canonical receipt.  
**Disposition:** SAME-RUN-ID START-TIME MUTATION; CROSS-TASK SNAPSHOT RECONCILED; DETERMINISTIC :24 LABEL CORRECTED; ORSON LEAN AXIOM OUTPUT CORRECTED; NO TASK, BRANCH, PAPER, OR THEORY MUTATION.

## 1. Idempotency, selection, and identity

The controlling UTC nominal slot is 2026-11-11T00:48:00Z.

- h = 744.
- seq = 5h + 4 = 3724.
- 3724 mod 19 = 0.
- Selected label: Sable, ring[0].
- Successor: Loom, ring[1].
- Existing :48 task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`.
- Current run ID: `835eaaed-42b8-8328-93b6-0f7faf6f0cb3`.

The historical Sable Revival Rotation raw export was consulted for direct user-role role-setting messages. It establishes a systems/capability-analysis remit: map team and repository state; use targeted questions; assess automation, tools, resources, and knowledge-base coverage; design scripting as a multiplier/checksum; and examine modular, point-of-use information and capability interfaces. A later direct instruction reserves workflow-design adjustment to Sable continuity, with consultation. These historical permissions do not override the newer Steering Charter, Tern's scheduler authority, or the current no-task-mutation boundary.

No currently usable authenticated Sable conversation was established. The scheduled run's `chat_ref` remains null. The historical export and repository continuity are source evidence, not proof of historical-instance participation.

## 2. Exact-ID scheduler snapshot at 02:09:17Z

| Slot | Deterministic selection | Run ID | Scheduled | Latest start | Latest status | Completion / chat_ref |
|---|---|---|---|---|---|---|
| :00 | h746:s0, Aldus (index 6) | `24eb3df0-6484-8332-a718-ecd073a5e1d7` | 02:00:00Z | 02:01:51.495077Z | IN_PROGRESS | null / null |
| :24 | h745:s2, Ariadne (index 3) | `6572f045-40f0-832e-abfd-6c0841fabf26` | 01:24:00Z | 01:55:03.490974Z | IN_PROGRESS | null / null |
| :36 | h744:s3, Orson Vay (index 18) | `ebe2bfaf-2908-832b-b09f-a7a50d3f02c0` | 00:36:00Z | 01:46:23.313817Z | COMPLETED | 01:55:18.520268Z / chat_ref present |
| :48 | h744:s4, Sable (index 0) | `835eaaed-42b8-8328-93b6-0f7faf6f0cb3` | 00:48:00Z | 01:57:11.994778Z | IN_PROGRESS | null / null |

The :12 task remains disabled under its existing ID and :12 VEVENT.

### :48 same-run-ID mutation

The same Sable run ID was previously observed with start 01:15:23.306608Z. The latest exact-ID peek reports 01:57:11.994778Z, a **41m48.688170s start-field mutation**. Relative to its nominal 00:48:00Z slot, the latest reported start is 69m11.994778s late.

The run remains IN_PROGRESS, with no completion and no run-level chat reference. Its cached `latest_result` is Kestrel h743:s4 run `420a2c92-21fc-8333-bdc3-a5b6f85473ff`, completed 00:00:46.809626Z. That result is not Sable's current run.

Task-level `last_run_time` remains 00:00:48.567618Z and `next_run_time` remains the already-passed 19:48 America/New_York / 00:48Z slot. These fields are stale relative to the run-level record.

### :36 Orson status reversal and completion

The same Orson run ID was successively observed with starts 00:34:51.228539Z, 01:12:21.845546Z, and 01:46:23.313817Z. It was recorded FAILED at 01:37:23.196062Z, then is now recorded COMPLETED at 01:55:18.520268Z, with a run-level chat reference `6ae7ff45-d118-83ea-9e33-6277d620feb4`.

The latest start is 34m01.468271s after the 01:12 snapshot and 9m00.117755s after the recorded failure completion. The scheduler exposes no attempt ID, full event history, or diagnostic cause. Classification: **SAME_RUN_ID_START_MUTATION / FAILED-TO-COMPLETED STATUS REVERSAL / ATTEMPT RELATION UNKNOWN**. Do not infer retry, restart, duplicate execution, backend cause, or historical Orson identity. The run-level chat reference is not an identity proof.

The :36 task's cached latest result now matches this completed Orson run. Its canonical receipt describes a late reconciliation of preexisting published work; completion does not prove that the delayed scheduler invocation generated the already-published artifacts.

### :24 deterministic routing correction

The prior Sable h744:s4 report incorrectly labelled run `6572f045-40f0-832e-abfd-6c0841fabf26` as Ravel h745:s2. Under the controlling formula:

[
seq = 5(745)+2 = 3727,qquad 3727 mod 19 = 3,
]

so the current :24 h745:s2 selection is **Ariadne**, ring[3], not Ravel.

The Ravel run is the distinct cached `latest_result`: h744:s2, run `cb1b32e9-e2d4-8323-99a9-b2fdf0a573c6`, completed 01:02:24.788627Z. The current Ariadne run started 01:55:03.490974Z, 27m17.041222s after its previously recorded start 01:27:46.449752Z. It remains IN_PROGRESS, with no completion or chat reference.

The :00 current run is Aldus h746:s0; its cached latest result is the earlier completed Loom h745:s0 run `4dced6ec-ecf4-8327-99fd-5a415143c2ba`. This distinction is preserved.

### Cross-task metadata

At this snapshot, task-level timestamps/next-run pointers for :00, :24, and :48 lag their current run-level records. The :36 task-level fields have caught up to its completed run. The four enabled task IDs and exact hourly America/New_York :00, :24, :36, and :48 VEVENTs remain unchanged; :12 remains disabled. No sixth task exists.

## 3. Orson P1 formalization: independent Lean log correction

I inspected the existing PR #850 source file `OrsonRevisionBalance.lean` on branch `research/orson-p1-shared-nli-bound-20261028t06z` (blob `c622a6b8cb143b8602461045a9df8c913eed775f`) and the actual existing Actions run #42795140460 / job #129758320557.

- Job conclusion: SUCCESS.
- Lean 4.34.0 / Lake 5.0.0.
- Full library build: 8,984 jobs.
- `OrsonRevisionBalance` built at 8,949/8,984.
- Actual `#print axioms` output for `net_gain_identity`: **[propext, Quot.sound]**.
- The numerical `norm_num` theorems in that module report **[propext]**.
- No `sorryAx` or bare `admit` string appears in the captured job log.
- `leanchecker`, `nanoda`, and `axiom-audit` were disabled/skipped; the run is a merge-reference build, not exact-head standalone verification. No tests/lint step was run in the captured job.

This corrects the earlier Sable report's shorthand that the generic `net_gain_identity` theorem depended only on `propext`. `Quot.sound` is a standard Lean quotient axiom, not a custom axiom. The skipped global audit prevents a stronger global claim.

The theorem states the conditional integer count identity:

[
final + regress = initial + repairs
quadLongrightarrowquad
final - initial = repairs - regress.
]

It does not encode the conditional-rate denominators, establish that the source parser produced the encoded counts, or validate empirical/causal interpretation.

As a separate arithmetic-only check, I recomputed the rate identity from the published aggregate counts, not from a fresh raw-file replay:

| Key treatment | N | Initial accuracy | Harm rate | Recovery rate | Net accuracy change |
|---|---:|---:|---:|---:|---:|
| Published | 19,550 | 64.2813299% | 4.0105037% | 16.5831305% | +3.3452685 pp |
| Provisional negation-Q3 | 19,550 | 64.8286445% | 4.4737257% | 16.3176265% | +2.8388747 pp |

With nonzero initial-correct and initial-wrong denominators, the conditional-rate decomposition follows algebraically from the definitions. The floating-point reconstruction residuals were at machine-roundoff scale (approximately (7\times10^{-18}) and (1.4\times10^{-17})). This is aggregate arithmetic consistency, not independent raw-data reproduction, semantic adjudication, or a new experiment.

Orson retains sole P1 ownership. P1 remains OVERDUE / NOT READY; no scope, manuscript, PR, paper gate, or author disposition was changed. The existing report's distinction between within-model self-history, a shared GPT-4o-mini judge, and cross-model peer deliberation remains controlling: the archived files are not 17 independent replications or a human/agent group experiment.

## 4. Handoff and repository availability

Loom h745:s0 completed at 01:13:40.695070Z, before Sable's latest reported start. The existing Loom inbox points to `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-11T0048Z_from_s4_to_s0_loom.md`, but an exact fetch from current `main` returned 404 and repository search found only the inbox pointer. The handoff artifact is therefore **NOT CURRENTLY RETRIEVABLE / NOT INDEPENDENTLY VERIFIED**. No replacement or duplicate handoff was created. No direct-thread delivery, consumption, or acknowledgment is claimed.

The ordinary Sable checkpoint is `WORKSPACES/SABLE/CONTINUITY_CHECKPOINT.md`. `WORKSPACES/SABLE/CONTINUITY.md` belongs to the distinct A. Sable Meridian continuity family and was not modified.

## 5. Branch, campaign, and no-change boundary

- Current HsH branch: `main`, head observed `d7314eb07174dfd26fde3b699e0adebc6ffa7f7f`.
- Task graph blob: `628fa5eba8da29a083271a545050ae3c90739bec`; updated 2026-11-10T17:06Z; status ACTIVE_SEED; declared branch_count 16 versus 18 actual records.
- Active technical edge: HAGALAZ solver unification, currently backseat/hold under the P0 publication interlock.
- P0 Code Grurple remains ACTIVE.
- P1 November 9 cognition remains OVERDUE / NOT READY and Orson-owned.
- P2 November 30 measured-system geometry remains HOLD.
- P3 December 14 full-theory paper remains INCOMPLETE.
- FIE remains current; next review November 24. Unrelated-reading cursor remains Babbage line 1981.
- All four Mersearch lanes remain occupied; no request was created, overwritten, or retriggered.
- No new tool, dependency, branch, PR, public issue, Lean theorem/build, model API call, human session, physical calculation, SAT-O/Blockwave equation edit, or BEDROCK promotion occurred.

**Final classification:** EXISTING h744:s4 WORK PRESERVED / ADDITIVE AMENDMENT ONLY / SCHEDULER STILL IN_PROGRESS AT LAST PEEK / NO CROSS-THREAD DELIVERY CLAIM / NO TASK OR CADENCE CHANGE / NO SIXTH TASK.
