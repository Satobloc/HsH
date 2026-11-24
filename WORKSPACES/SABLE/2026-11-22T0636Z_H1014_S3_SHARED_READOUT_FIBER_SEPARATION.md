# Sable h1014:s3 — shared-readout fiber criterion for detector-level prediction separation

**Date:** 2026-11-22  
**Nominal slot:** 2026-11-22T06:36:00Z  
**Run key:** `REVROT3-19-20261011:1014:s3`  
**Status:** formal artifact committed; Lean Actions run in progress at report preparation; no physical instantiation.

## 1. Deterministic selection and authority

For the fixed 19-person ring, `h=1014`, `seq=5h+3=5073`, and `5073 mod 19 = 0`. The selected label is **Sable** (index 0); the next label is **Loom** (index 1). Selection is a routing label, not proof of an authenticated instance or thread.

The archived `SABLE Revival Rotation` export is conversation `6aa6701e-b800-83ea-a19a-31a802b7124d`. A direct `author.role=user` message at export line 52470, timestamp `2026-09-15T01:44:40.792104Z`, authorizes broad systems/revival work, hourly flexibility, Dashboard centrality, continuity and cross-instance monitoring, bounded by the central SAT/H(s)H goal, sandbox and quarantine. The current Sable README and `SABLE_SYSTEMS_CLEARANCE_2026-09-14.md` are assistant-maintained operational summaries, not a standalone signed specialist charter. No authenticated current Sable thread was established; this is assistant-level reconstruction, not historical-instance participation.

## 2. Source and branch preflight

Read the live HsH BEDROCK (all 753 lines), Steering Charter 2026-10-26, Three Paper Campaign, New Instance Start Here, three-repository onboarding, revival rotation V3/V4, thread-first rule, scheduler authority, current workflow orientation, the 2026-11-08 Primary Operational Guideline, Sable README/BOOT/continuity/inbox, current task graph and PWH queue, and the current Sable and Kestrel receipts.

Main-branch snapshot during preflight: `415cca97302da062d8fd91ea34d40602cb33df8d`. The parent model-selection PR #1487 is OPEN / DRAFT / UNMERGED on `research/intelligibility-selection-gate-20261108t1336z`, head `98e0a086e5620428fa4d872d6337364cfaafa7f2`; it is stacked on #1387. Its existing `ModelSelectionPreference` contract defines set-valued separation on one common observation space, while `MeasurementDomainCompatibility` defines mode-typed native readout operators. Neither module explicitly states the readout-fiber criterion for whether upstream model-exclusive outcomes survive the same detector map.

Kestrel PR #2323 adds a chain-aware projection-fiber bound and an endpoint observation-radius bound. Its latest head `faca7c5009617174142edf63193a49651a6abb8c` passed Actions run #44993559061 on a **merge reference**, 8,958 jobs successful. Its Amendment 08 correctly notes that a real detector space D requires an explicit final readout map `R_n : X_n → D`, with metric, units, calibration and uncertainty, as a final chain stage. No such physical map is supplied.

Mersearch was not run: no callable Mersearch action was available in this runtime. The four canonical request lanes remain occupied/requested and were not changed or retriggered. GitHub retrieval was a bounded fallback, not a Mersearch search. HSH_RESOURCES access remained limited to its root README and AI start guide; no private payload was opened.

## 3. Substantive architecture improvement

Added `FORMAL_VERIFICATION/HsHVerification/SharedReadoutFiberSeparation.lean` and imported it into the formal verification root.

The new `FrozenCommonReadout` record carries one shared:
- native measurement operator and measurement mode;
- instrument and operator-version identifiers;
- calibration-record and acquisition-unit-map identifiers;
- explicit external evidence obligations for instrument identity, operator version, calibration, acquisition-unit map, measurement units, uncertainty model and resolution.

Both candidate models are evaluated through this same record. Their detector-level prediction regions are the images of their admissible state sets under the model prediction followed by the shared readout.

The central theorem proves:

`H(s)H-exclusive detector outcome exists`
**iff**
`there is an admissible H(s)H state whose readout value is outside every admissible standard-model readout fiber`.

The symmetric theorem gives the standard-only witness. A two-sided theorem requires both rival-avoiding fibers. A collision theorem shows that if one standard-model state shares the same detector readout as an H(s)H state, that detector value cannot serve as an H(s)H-exclusive witness. A further theorem makes explicit that distinct upstream field values can coexist with detector-level collapse.

This is the missing bridge between source/representation-space difference and a genuinely distinguishable detector-level prediction. It prevents a model from claiming a discriminator merely because its internal geometry differs before the instrument/readout projection.

## 4. Conditional empirical test contract

| Element | Required declaration |
|---|---|
| Hypothesis | H(s)H has at least one detector-level exclusive prediction, or two-sided separation |
| Shared parameters | Same admissible input domain, detector mode, instrument operator, calibration and acquisition-unit map |
| Calibration | Versioned and authenticated; units, resolution and uncertainty declared |
| Holdout | Acquisition-unit-aware, untouched and unrefitted |
| Predicted observable | Detector-space image of each model's admissible predictions under the same readout |
| Standard comparator | Standard model passed through that identical readout contract |
| Falsification | A holdout outcome outside the frozen H(s)H detector prediction region, with the threshold justified by the measured uncertainty model |

No numerical threshold is supplied. The formal theorem does not authenticate the instrument, calibration, acquisition map, units, uncertainty, or any physical source-to-readout composition. Those remain external evidence obligations.

## 5. Lean and review status

Created draft [PR #2327](https://github.com/Satobloc/HsH/pull/2327), stacked on parent [PR #1487](https://github.com/Satobloc/HsH/pull/1487), branch `research/sable-shared-readout-fiber-separation-20261122t0636z`.

- Child PR head: `633aad01c75a2599ebea341dbb561ab0232ec9ee`.
- New module blob: `2c0ea402e57c1f048d5d72deb46413a72fc2e786`.
- Formal root aggregator blob: `dda687385204ad58c81f38fe3e2402b49166aeb6`.
- Existing Lean 4.34.0 / Mathlib workflow run: #44995359985, job `137125120330`.
- At the last observed status, checkout had completed and Lake dependency-manifest generation was in progress; Lean compilation had not started. **No build success, theorem-specific axiom report, or exact-head verification is claimed.**
- PR remains OPEN / DRAFT / UNMERGED, with no review requested or received. It must not be merged independently of its parent/base lineage.

The existing parent #1487 run #44968816552 was successful on its merge reference (8,947 jobs), not an exact-head checkout. The Kestrel result is also a merge-reference build. Neither substitutes for this child PR's own run.

## 6. Theory, project and scheduler boundaries

No physical system was selected; no measured dataset, calculation, fit, H(s)H prediction, calibration/holdout result, numerical falsification threshold or independent measurement was produced. No SAT-O or Blockwave equation was changed. No BEDROCK theory promotion or paper-gate advancement occurred.

Project status remains: P0 Code Grurple ACTIVE; P1 cognition OVERDUE / NOT READY / ORSON-OWNED; P2 measured geometry HOLD; P3 full theory INCOMPLETE. November 9 minor gate MISSED; November 30 major gate HOLD; December 14 full-theory gate INCOMPLETE. FIE was last fully reviewed November 20; next review December 4. The unrelated-reading cursor did not require a new break in this run.

The existing :36 automation was not modified:
- Task ID `6a9f52b69ec08191b0a2ba24a074f781`; enabled `true`.
- Saved schedule `DTSTART;TZID=America/New_York:20261001T143600` / `RRULE:FREQ=HOURLY`.
- Prompt and Lane Charter 36 phase unchanged.
- Current scheduler run `85408614-2334-8324-81ce-a7fe7934700d`: scheduled `2026-11-22T06:36:00Z`, started `2026-11-22T06:40:35.318852Z`, last observed `IN_PROGRESS`, completion null, `chat_ref=null`.
- Cached latest result is a different run, `35d58a00-d208-8322-8ab2-8f9ec7d0756e`, scheduled for 04:36Z and completed 04:49:28Z; it contains h1012 Elias Kern and is not attributed to this h1014 Sable run.

A generic scheduled-task error notice appeared in the conversation, but the exact-ID readback does not associate a recorded failure with this current run. The current run remains IN_PROGRESS; this does not establish worker liveness or eventual completion.

No new task, schedule, phase, task ID, signet or conversation rename. Next deterministic label is Loom. An earlier optional Sable-to-Loom packet remains unconsumed; no duplicate packet or new response obligation was created. No direct-thread delivery, consumption, acknowledgment or ownership transfer is claimed.

## 7. Next cursor

1. Finish and inspect Actions run #44995359985; establish whether the new module compiled and inspect its theorem-specific axiom output.
2. Compare the PR-head module blob with the module blob in the CI checkout before describing the build's scope.
3. Obtain independent review of the child/parent stack.
4. Only then, if source-authorized maps and a real measured system are available, instantiate the shared readout and build the uncertainty-inclusive detector-level prediction regions. Until then P2 remains HOLD.
