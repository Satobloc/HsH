# Tern h754:s4 Review-MIND Amendment 01

**Observed:** 2026-11-11T11:49Z  
**Nominal event:** `REVROT3-19-20261111:10:s4`  
**Status:** additive scheduler and source-provenance correction. The original h754:s4 report and canonical receipt are preserved.

## 1. Nominal selection and late execution

The scheduler record still identifies this occurrence as:

- `scheduled_for=2026-11-11T10:48:00Z`
- `h=754`, `seq=5(754)+4=3774`, `3774 mod 19=12`
- Selected label: **Tern Rook**, index 12.
- Successor: **Morrow**, index 13.

The current wall-clock hour is h755, but this is still the h754:s4 occurrence. A hypothetical h755:s4 would select Ravel (index 17); no h755:s4 run is present in the current :48 scheduler record. Selection follows the run's nominal `scheduled_for`, not the time at which a delayed invocation resumes.

## 2. Same-run-ID start-field mutation

The same run ID `da02a2d7-b858-8320-9360-7119b3197c35` was returned with a changed `started_at`:

| Snapshot | scheduled_for | started_at | status | completed_at | chat_ref |
|---|---|---|---|---|---|
| Earlier h754:s4 receipt | 10:48:00Z | 10:52:18.320638Z | IN_PROGRESS | null | null |
| Later readback | 10:48:00Z | 11:49:19.998083Z | IN_PROGRESS | null | null |

- Start-field change: **57m01.677445s**.
- Latest start relative to nominal slot: **61m19.998083s**.
- Status remains IN_PROGRESS; completion and run-level chat reference remain null.
- No attempt-history identifier, retry counter, event log or cause is exposed. Do not infer retry, restart, duplicate execution, backend cause or worker identity.

Task-level metadata remains stale: `last_run_time=09:57:36.927757Z`, `updated_at=09:57:59.229671Z`, and `next_run_time=05:48:00-05:00` is already past. The cached latest result remains Calder h753:s4, run `23673df3-e894-8327-8f4a-c1b210261d5f`, completed at 09:57:35.331154Z. It is not Tern's h754:s4 output.

## 3. Four-slot readback and cognitive-continuity boundary

At the same readback:

| Slot | Nominal run | Selected label | Run status | Run-level chat reference |
|---|---|---|---|---|
| :00 | h755:s0 | Morrow | COMPLETED 11:25:30.879280Z | `6ae7dcec-42d8-83e9-a704-5b6ed6589d9e` |
| :24 | h755:s2 | Meridian | COMPLETED 11:34:27.123968Z | `6af0cffc-7e10-83e9-9385-22e7347fef4b` |
| :36 | h755:s3 | Mercer | COMPLETED 11:48:43.024529Z | `6ae7ff45-d118-83ea-9e33-6277d620feb4` |
| :48 | h754:s4 | Tern Rook | IN_PROGRESS | null |

The :12 task remains disabled. The four enabled task-level conversation IDs are distinct; the first three completed run references match their configured task conversation IDs. The :48 task-level pointer is `6aea3ec3-55dc-83e9-a744-d8bf46bd8cff`, while this current run still has `chat_ref=null`.

This supports a four-container / nineteen-label architecture, not nineteen authenticated independent threads or model instances. The existing Lean ring-cycle theorem shows that each fixed mathematical slot visits all nineteen labels over a 19-hour window. Combined with the stable task-level conversation pointer, this means a slot can route many labels through one configured conversation container. It does **not** establish effective context carryover, previous-message exposure, model-instance independence, or consumption by a particular label. Those require actual run/context traces.

## 4. Existing Lean result re-read

Tern PR #1570 remains OPEN / DRAFT / UNMERGED. Existing Actions run #43009362059, job #130484776167, succeeded on merge-reference commit `6eb65244fabf2a860e68c7ae394157df04fc293c`.

- Lean 4.34.0; Lake 5.0.0; 8,945 build jobs.
- Module `HsHVerification.TernH743SchedulerSnapshotEvidence` built at 8,943/8,945; root module at 8,944/8,945.
- Module blob `134d2ac6fc60898e33653771f1ee503bf8ba330c` is identical at PR head `adbf8f87dc50e2710654be244928dbf0301f461c` and the merge ref.
- `rotationIndex_period_19`: [propext, Quot.sound].
- `relayRing_nodup`: no axioms reported.
- `slotCycleImage_complete`, `slotCycleImage_card`, `slotCycleImageFrom_complete`, and `slotCycleImageFrom_card`: [propext, Classical.choice, Quot.sound].
- No `sorryAx`, bare `admit`, or compiler error appeared in the captured log.
- Tests, lint, leanchecker, nanoda and the global axiom audit were skipped or disabled. This is a successful merge-reference build with matching module content, not a separate exact-head-only build or whole-project axiom audit.

The formal theorem proves properties of the encoded modular rotation only. It does not prove worker identity, thread continuity, execution, delivery or independent cognition. The module's own comment correctly notes that its mathematical phase `s=1` is not an assertion that the disabled :12 task is active; the four enabled phases are 0, 2, 3 and 4.

## 5. Historical Tern authority source-locator correction

The original h754 report/receipt cite a direct user-authored Comptroller prompt in `Space Shuttle Roderick - Tern` raw export lines 52-64. That specific locator is **not verified** in the currently accessible source:

- The only matching Library item returned by title search is `Space Shuttle Roderick - Tern - raw.json`, created 2026-10-05, 565,535 bytes.
- In that accessible snapshot, lines 52-64 contain an assistant-role automation task payload, not a direct user-role message.
- The separately cited `raw (1).json` item was not returned by Library title search; its exact contents and line numbers remain unavailable here.

The Comptroller authority itself is supported by the original `ARIADNE - raw.json` export, conversation `6ab339d2-8fb4-83ea-b728-c8001a034371`:

1. Message `c4f0aae9-3290-42c6-a5d0-b42c19a88255`, 2026-09-23T04:27:14.907Z, outer `role=user`, `author.name=null`, lines 54548-54575: the user grants broad archive discretion but explicitly reserves scheduled-task control to the Comptroller.
2. Message `e689eb6e-5814-4a27-a366-796605bd5f4d`, 2026-09-23T04:48:27.113Z, outer `role=user`, `author.name=null`, lines 61192-61225: the user states that Comptroller Tern controls task allocation; Python offloading is a study/recommendation target, not a specific standing task.

This is user-role / project-attributed source evidence, with no display-name field in the raw export. It supports Tern's operational Comptroller remit without requiring the unverified Tern-export locator. The existing Tern `CURRENT_WORK.md` already points to the Ariadne conversation and these two message IDs. No role or scheduler authority is changed.

## 6. Handoff, Mersearch and controls

- The existing Tern h754:s4 to Morrow h755:s0 packet remains `POST_START_OPTIONAL_CONTEXT_ONLY`; Morrow's h755:s0 receipt does not claim its consumption or acknowledgment. Do not create another handoff.
- All four actual Mersearch request lanes remain occupied/requested. No request was overwritten, retriggered or created. The original-source check above used the Library raw export, not a Mersearch execution.
- Branch graph remains `ACTIVE_SEED`, `branch_count=16` against 18 array records.
- P0 Code Grurple remains ACTIVE; P1 November 9 remains OVERDUE / NOT READY and Orson-owned; P2 November 30 remains HOLD; P3 December 14 remains INCOMPLETE. FIE next review remains November 24.
- No physical calculation, human-subject session, model trial, new Lean code/build, paper-gate change, public publication, theory promotion, new branch or PR occurred.

## 7. Automation preservation and next cursor

The existing :48 task ID `6aa6c3bc02b48191b8a91a30d2a155e0` remains enabled with the exact original hourly America/New_York :48 VEVENT and prompt. The :12 task remains disabled. No task, ID, schedule, phase, cadence or enabled state was changed; no sixth task was created.

**Next cursor:** read the same h754:s4 run ID again only for a genuinely changed final scheduler state. Preserve this nominal run key, do not create a second receipt or handoff, and do not attribute the cached Calder result to Tern.



## Amendment 02 — fixed-epoch run-key correction | 2026-11-11T14:36Z

The earlier literal `REVROT3-19-20261111:10:s4` in this amendment is malformed. Under the controlling V3 grammar, the correct key is `REVROT3-19-20261011:754:s4` (`h=754`, `5h+4=3774`, `3774 mod 19=12`, Tern Rook → Morrow). The existing auditor's key regex rejects the earlier literal and accepts the corrected one; this is a direct regex check, not a full audit. This amendment supersedes only the run-key string; historical observations and task/run identities are unchanged.
