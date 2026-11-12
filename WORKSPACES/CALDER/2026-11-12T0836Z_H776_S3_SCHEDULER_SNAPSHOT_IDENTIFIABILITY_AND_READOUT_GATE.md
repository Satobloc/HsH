# Calder h776:s3 — scheduler snapshot identifiability and readout gate

**Record type:** internal operational observation and architecture refinement.  
**Nominal slot:** 2026-11-12T08:36:00Z.  
**Run key:** `REVROT3-19-20261011:776:s3`.  
**Selection:** (h=776, seq=5h+3=3883, 3883\bmod19=7): Calder. Successor: Hale, index 8.  
**Participation:** `REVIVAL_SOURCE_RECONSTRUCTED_IN_RUN`; no authenticated historical Calder instance/thread continuity is claimed.

## 1. Source and authority

The historical empirical-Calder role is supported only by the 2026-09-12 self-report in `WORKSPACES/COMMON/CHECKINS.md` (blob `886069e71d4aec7a3f8d199d6d889b930a05c17e`, lines 55–99) and the assistant-maintained Calder continuity packet (blob `265c4dc41b0bed8fef942103d009394e57c7acd7`). No standalone signed Nathan-authored Calder specialist charter or authenticated current empirical-Calder thread was recovered.

The usable historical method is empirical/statistical and adversarial: source/provenance separation, local-null design, independent-unit discipline, covariance/representation checks, and preservation of negative results. The 2026-09-12 check-in explicitly quarantines theory-bearing outputs produced while external scanning and SAT interpretation were mixed. Those outputs were not used here.

The separate `⚗️ CALDER — Construction Story Retelling / Foundational Covariance` identity is not this empirical Calder and was not used as a substitute. The bounded search covered the current Calder workspace, inbox, current-work card, prior h761 receipt, and Common check-in. No exact current historical Calder thread was verified. No new ChatGPT thread was created.

The h776:s2 Aldus report `WORKSPACES/ALDUS/2026-11-12T0824Z_SOURCE_CUSTODY_CORRECTION_AND_SCHEDULER_READOUT.md` was read as optional predecessor context. The addressed h776:s2→s3 handoff and canonical receipt were not recovered under the expected paths; no handoff consumption is claimed. Tern's h776 observation Amendment 01 was read, but its referenced parent observation file was not found. This report adds an independent later readback without editing Tern's observation.

## 2. Live preflight and repository state

Read the live HsH BEDROCK, the 2026-11-08 Primary Operational Guideline, the 2026-10-26 Steering Charter and Three-Paper Campaign, three-repository onboarding, current workflow orientation, V3/V4 revival rules, thread-first rule, navigation preflight, scheduler authority, upkeep/break cadence, Mersearch worker instructions/releases, reference desk, current task graph, current Calder continuity/inbox, Tern continuity/inbox, and recent receipts.

Key current source identities:
- BEDROCK: `0253ace674bbc361464b7bbaac2c41aa3d8e8867`
- Primary Operational Guideline: `a8e333b1d5b5aa1d9772366945dd88769d24153c`
- Steering Charter: `04822f3e48f746e9e464d893636ed4a670d68683`
- Three-Paper Campaign: `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`
- Revival V3: `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14`
- Revival V4: `6761337dfcd0847226ee7baad84db0a9c496760a`
- Thread-first rule: `e79707587914edb76afca1c32f9f4dad4d0324b7`
- Scheduler authority: `9f7ffbbf0fe77fd4c561a110c9dbb2b686a88b45`

Prewrite main heads:
- HsH: `7365aba7d91057179f067a53f7b15c2c20d3fbde`
- SAT archive: `37fcbdc49b331cd11209d203384c0b64a604c7b9`
- HSH_RESOURCES: `bd27eec89cbd666d073c807d9a9d9b941994d764`

Task graph remains `ACTIVE_SEED`, with 16 declared branches and 18 records. No graph mutation was made.

All four Mersearch request lanes remain `requested`; no lane was free. No request was overwritten, retriggered or created. The existing stable 1.0/three-repository bridge was inspected, but no Mersearch search was run. GitHub code search was used only for control-plane path/run-key checks, not represented as Mersearch.

Existing tooling was checked before proposing anything new: Calder PR #1515, Ravel PR #1133, Tern PR #1570, Math Hopper issue #578 / PR #991, Whirligig Kernel 0, SciSpace, the HSH_RESOURCES Tool Chest and existing workflow routes. No new tool, dependency, fork, subscription or expenditure was introduced. No local repository checkout or Lean/Lake/Elan executable was present. The existing issue publisher is not an appropriate writer for internal scheduler evidence; no general repository-writer Actions workflow was available, so the permitted GitHub Contents connector is used as the bounded write fallback.

## 3. Fresh scheduler readback

Observation time: **2026-11-12T09:46:21Z**. These are returned scheduler-record snapshots, not authenticated process events.

| Lease | Nominal run key | Task ID | Last-run ID | scheduled_for | reported started_at | status / completion | chat_ref |
|---|---|---|---|---|---|---|---|
| :00 | h776:s0 / Alberr | `6aa1fe0de5e48191b886496095b1343f` | `63b3db79-db10-832a-b4a0-ec138d91fcf4` | 08:00Z | 09:28:47.110907Z | IN_PROGRESS / null | null |
| :24 | h776:s2 / Aldus | `6abda4c8eda88191bf23a6f2849e9a17` | `c1a3e362-2e18-8331-b9eb-335bbf2a30a4` | 08:24Z | 09:41:23.830500Z | IN_PROGRESS / null | null |
| :36 | h776:s3 / Calder | `6a9f52b69ec08191b0a2ba24a074f781` | `176ed4b4-8aa4-8325-8702-b1fb12c147ee` | 08:36Z | 09:34:39.929750Z | IN_PROGRESS / null | null |
| :48 | h775:s4 / Ariadne, previous slot | `6aa6c3bc02b48191b8a91a30d2a155e0` | `a662f219-45c4-832b-a191-fe980a00bbb4` | 07:48Z | 08:55:14.372180Z | FAILED / 09:04:34.992718Z | null |

The :48 task's next scheduled slot is 09:48Z (h776:s4 / Hale), but no h776:s4 run object was exposed at this readback. The failed :48 record above is h775:s4 / Ariadne, **not** Hale's h776:s4 slot.

### Same-record changes

**:36 h776:s3.** The same run ID and scheduled_for were previously observed with reported starts 08:49:16.688830Z and 09:01:03.531138Z. The current value is 09:34:39.929750Z, a +33m36.398612s change from the 09:01 value and +45m23.240920s from the 08:54 value. The 09:34 value remained unchanged at the 09:46 readback. Relative to the nominal 08:36Z slot, the current reported start is +58m39.929750s.

**:24 h776:s2.** The same run ID was observed at 09:34 with `started_at=09:07:25.984445Z`, status FAILED and `completed_at=09:32:28.729293Z`. At 09:46 the same ID reports `started_at=09:41:23.830500Z`, status IN_PROGRESS and `completed_at=null`. The reported start field advanced by +33m57.846055s; the previously populated completion was cleared. This is a same-record status reversal / field rewrite. It is not evidence of a retry, restart, second process or backend cause.

**:48 h775:s4 / Ariadne.** Tern's earlier amendment recorded 08:10:00.591533Z; the current record reports 08:55:14.372180Z, a +45m13.780647s change. The record later completed FAILED. Its cached latest-result run ID matches this old h775:s4 run.

**:00 h776:s0.** Current record reports 09:28:47.110907Z and IN_PROGRESS. No earlier same-slot snapshot was used to infer a start-field change.

At 09:46, three run objects (:00, :24, :36) are recorded IN_PROGRESS. This does not establish three live processes or process-level concurrency. Reported start order differs from nominal slot order; it is not an authenticated execution order.

### Cached-result and task-summary separation

The :00, :24 and :36 `latest_result.run_id` values point to earlier runs, not their current `last_run.id`. The :48 old h775:s4 result pointer matches its current last-run ID. Task-level `updated_at` / `last_run_time` and `next_run_time` fields for :00, :24 and :36 remain stale relative to the current run objects. A cached result is not a current-run receipt.

The global automation catalog still shows 21 automations, four enabled Workshop Relay leases (:00/:24/:36/:48), and the existing :12 lease disabled. The :36 lease remains enabled; its original identity, saved hourly VEVENT, prompt and phase are unchanged. No task, ID, cadence, schedule, phase or enabled state was mutated. No sixth task was created.

## 4. Substantive architecture improvement: an observation-identity envelope

The scheduler snapshots expose several distinct identities that must not be collapsed:

1. **Nominal slot identity:** deterministic ring key (h,s).
2. **Lease identity:** task ID and immutable saved schedule.
3. **Scheduler record identity:** returned run ID.
4. **Snapshot identity:** observation timestamp plus exact returned field values.
5. **Attempt identity:** not exposed in the current record.
6. **Result identity:** `latest_result.run_id` and its own timestamps.
7. **Conversation identity:** `chat_ref`, absent on the current run objects.
8. **Worker identity:** ring selection is a label, not authentication of an instance or thread.

The evidence envelope for future scheduler comparisons should preserve all eight separately. Claims about attempt count require an immutable attempt ID or event history; liveness requires an independent heartbeat/process signal; output attribution requires a matching current-run result; actor identity requires authenticated thread/instance evidence; causal ordering requires immutable event timestamps or an external event log.

The current records establish mutable returned fields and stale result pointers. They do **not** establish how many underlying attempts occurred, whether a process remained alive, why a field changed, or which historical worker instance produced it.

This is the new operational improvement: compare versioned observations, not mutable run objects as though they were append-only event logs. Tern retains scheduler authority; this report routes evidence rather than changing the control plane.

## 5. Two-layer identifiability gate for H(s)H predictions

The same mathematical *inference criterion* can be used in physical-model testing, without asserting physical equivalence between a scheduler and H(s)H.

**Layer 1 — deterministic readout sufficiency.** For a complete observation map (P:X\to Y) and a target (q:X\to Z), the target is determined by the readout only if it is constant on every fiber of (P). Existing Ravel PR #1133 formalizes the generic factorization/fiber-constancy condition. A hidden geometric distinction that is erased by the projection cannot be recovered from that readout alone.

**Layer 2 — statistical distinguishability.** After the same instrument response, selection/missingness process, calibration and nuisance treatment, compare the observable laws induced by SAT/H(s)H and the standard comparator on untouched independent acquisition units. If the induced observable laws coincide on the predeclared holdout, this design does not distinguish the models. If they differ, a statistic and rejection threshold must be frozen from the actual covariance and uncertainty before scoring.

| Test element | Required contract | Current status |
|---|---|---|
| Hypothesis | A specified worldtube thickness/twist/contact-surface extension changes a defined observable | Candidate only; exact map absent |
| Shared parameters | Same established-physics parameters and instrument/nuisance treatment in both models | Not instantiated |
| Calibration | Predeclared calibration units; no holdout refit | Not selected |
| Holdout | Whole independently acquired runs/realizations, not frames, pixels, angles or channels | Design rule available; no data |
| Observable | Calibrated readout/residual distribution after selection and processing | Not selected |
| Standard comparator | Mature standard model under the same observation map | Not instantiated |
| Falsification threshold | Preregistered from real covariance, uncertainty and independent-unit structure | Not estimable yet |

**Conditional consequence:** extra worldtube thickness, twist or contact surfaces are not forced by the abstract factorization theorem. They become empirically constrained only if their specified maps alter a preregistered observable beyond the shared calibration/nuisance model. If they change only latent representation while leaving the observable law unchanged, they are not distinguished by that experiment.

No physical system or raw measured dataset was selected in this run. No physical calculation, fit, numerical prediction, covariance estimate, significance test or independent measurement was performed. P2 remains HOLD / NOT_TEST_READY. No numeric falsification threshold was invented.

## 6. Formal proof triage and limits

Existing proof assets were reused rather than duplicated:

- **Ravel PR #1133:** head `19479ee3fad0e96c4f0ddb4f79842f4a5ab9bb61`; exact-head Actions run #43109180575 SUCCESS, Lean 4.34.0 / Lake 5.0.0. The existing readout/fiber-factorization formalization is a generic mathematical scaffold. PR remains OPEN / DRAFT / UNMERGED and stacked on open infrastructure PR #262.
- **Calder PR #1515:** exact head `4cfb6803b641ad16cfe0918680f22fa54559e29a`; Actions run #42722996625 SUCCESS. `unitFold_factorization_iff_unitConsistency`, `fold_conflict_witness` and `unitFold_unique` formalize channel-to-acquisition-unit split consistency. The theorem-specific axiom reports include Classical.choice / propext / Quot.sound as recorded in the PR. The separate NumPy SVD design check in that PR is explicitly quarantined as a protocol violation and was not reused.
- **Tern PR #1570:** head `cc1ed1d4c2be3b2d73c2583708fb1a1b267e0443`; latest Actions run #43090161764 FAILURE. It is draft/unmerged. Its earlier scheduler snapshot formalization is not treated as a successful proof for the current h776 observations.

No local Lean/Lake/Elan runtime was available and no new Lean module or build was attempted. The scheduler-specific observation envelope and its mapping to actual hidden attempt histories remain unformalized. Existing Lean results verify only their encoded abstract statements, not the soundness of the scheduler transcription, the translation to a physical system, or any H(s)H premise.

## 7. Project gates and freshness

- P0 Code Grurple: ACTIVE. Comparison from prior verified baseline `9518c27086de458189fcf265df50a0b474584b1f` to prewrite main `7365aba7d91057179f067a53f7b15c2c20d3fbde`: 14 commits ahead, 0 behind; the eight changed paths contain no protected Paper A/B source/control path. The prior 8/8 exact pin check therefore remains intact. Both legacy routes remain PRESENTATION_PENDING / NOT_OBSERVED; no live route probe or acceptance is claimed.
- P1 November 9 cognition: OVERDUE / NOT READY, Orson-owned.
- P2 November 30 geometry: HOLD / no selected measured system.
- P3 December 14 full theory: INCOMPLETE.
- FIE rereview: last completed November 10; next November 24.

Unrelated reading completed: Lewis Carroll, *Alice's Adventures in Wonderland*, Project Gutenberg eBook #11, lines 381–420; next cursor line 421. No physical break is claimed.

No SAT-O/Blockwave equation was recovered or modified. No manuscript, BEDROCK, theory status, branch graph, PR, public issue, access control or automation was changed. The scheduler observation is internal operational evidence, not a public scientific result; no public issue was created.

## 8. Next cursor

1. Tern retains scheduler authority. Review this readback as an observation, not a request to alter tasks.
2. Preserve separate slot, lease, run-record, snapshot, attempt, result, conversation and actor identities. Do not infer retries, restarts, liveness or worker identity without their respective evidence.
3. Hale is the deterministic next ring label. The :48 task's h776:s4 run object was not yet exposed at the 09:46:21Z readback. A repository-only optional handoff is provided; no direct thread delivery or consumption is claimed.
4. For P2, wait for a real system/dataset with provenance, units, calibration, covariance, acquisition IDs and untouched holdout before calculating or fitting anything.

**Final state:** `REVIVAL_SOURCE_RECONSTRUCTED_IN_RUN / CALDER_LABEL_NOT_AUTHENTICATED / SNAPSHOT_IDENTIFIABILITY_GATE_ADDED / PR1133-AND-PR1515-EXISTING-PROOFS-REUSED / PR1570-FAILED-AND-NOT-RELIED-UPON / P0-ACTIVE / P1-NOT-READY / P2-HOLD / P3-INCOMPLETE / NO-PHYSICAL-CALCULATION / NO-TASK-MUTATION`.
