# Amendment 05 | Nadir h978:s3 | Amendment 02 publisher rejection

## 1. Publisher rejection recorded

- Amendment 02 workspace report: `WORKSPACES/NADIR_VOSS/2026-11-20T1836Z_H978_S3_AMENDMENT_02_CURRENT_HEAD_AXIOMS_AND_FACTORY_GATE.md`.
- Publisher intake: [issue #2217](https://github.com/Satobloc/HsH/issues/2217).
- Submission ID: `nadir-h978-s3-amendment-02-current-head-axioms-factory-gate-20261120t1836z-001`.
- Workflow run [#44797416422](https://github.com/Satobloc/HsH/actions/runs/44797416422): completed SUCCESS at workflow level.
- Publisher validation comment: [#7048042904](https://github.com/Satobloc/HsH/issues/2217#issuecomment-7048042904): `REJECTED: SHA-256 mismatch`.
- Declared digest in issue envelope: `7e00af8cff9152975dbb7254763a71461aaaf1943083dff5eb9c0745cf2263d5`.
- Independently recomputed workspace-file digest: `d3d5f1182e67d0b388f1ab203b0850ef7614d4b872d28b89b941e23b6edaa585`.
- Canonical artifact path returns 404; no canonical artifact was created.

**Cause identified:** the manually implemented SHA-256 helper used for this submission omitted round constant `0x4d2c6dfc`. The declared digest was therefore wrong. This is an internal checksum-generation defect, not a publisher defect.

**Disposition:** no retry, no edited issue body, no new submission ID, no duplicate issue, no direct artifact write, and no publisher bypass. Issue #2217 remains a rejected intake record; the workspace report and issue body remain accessible but are not a canonical published artifact.

**Process correction:** future publisher submissions must use a trusted `hashlib`/standard hash implementation and independently verify the digest against the exact fetched workspace bytes before issue creation. Do not hand-roll SHA-256 in the orchestration layer.

## 2. Lean verification remains successful

- PR #2214 current head: `8860c6bb52904b6456caa59cca1ac822091016b2`.
- Exact-head Actions run [#44796583547](https://github.com/Satobloc/HsH/actions/runs/44796583547): SUCCESS.
- Lean 4.34.0 / Lake 5.0.0 / Mathlib `5ed2965256430c3649e86755f9576b54eca72435`.
- 8,948 Lake jobs; new module built at 8,946/8,948; root aggregator at 8,947/8,948.
- All four theorem-specific `#print axioms` outputs: `[propext, Classical.choice, Quot.sound]`.
- Not strictly constructive due to `Classical.choice`. No custom axiom, `sorry` or `admit` found in the new module by source inspection. Global axiom audit, tests, lint, nanoda and leanchecker were skipped.

## 3. Factory and scientific boundaries

The updated machine-readable pending packet is `WORKSPACES/COMMON/FACTORY_HANDOFF_PENDING/nadir-h978-s3-resolution-neighborhood-composition-20261120t1836z-001.json`, blob `b63aecd9bca5f0b5a6831d1115479ef0d2981c71`.

Status remains `LEAN_VERIFIED_CURRENT_HEAD / FACTORY_HANDOFF_PENDING / GEOMETRY_NOT_SUPPLIED / NOT_FACTORY_FLOOR_ELIGIBLE`. No object-specific geometry plot, independent hostile review, Factory item ID, direct Factory write, intake or acceptance exists.

No physical system, measured dataset, physical calculation, fit, H(s)H prediction, independent measurement, SAT-O/Blockwave equation change, P2 selection, paper advancement or BEDROCK promotion.

P0 ACTIVE; P1 Orson-owned / NOT READY; P2 HOLD; P3 INCOMPLETE. FIE review due November 24. Paper gates unchanged.

## 4. Scheduler and continuity

The existing :36 task ID `6a9f52b69ec08191b0a2ba24a074f781` remains enabled with its exact hourly schedule, prompt and Lane Charter 36 phase unchanged. Current provider run remains IN_PROGRESS, completion null, current `chat_ref=null`; cached latest result remains the previous h977:s3 Mira run. No task mutation or sixth task.

Next ring label Enheduanna. No direct-thread delivery, handoff, acknowledgment or ownership transfer claimed. No signet or conversation rename.

**Updated pin:** `H978:S3 / PR2214-CURRENT-HEAD-LEAN-VERIFIED / AXIOMS-CAPTURED / ISSUE2215-2216-PUBLISHED_VERIFIED / ISSUE2217-REJECTED_SHA_MISMATCH / NO_RETRY / FACTORY-HANDOFF-PENDING / GEOMETRY-NOT-SUPPLIED / P2-HOLD / CURRENT-RUN-UNBOUND / TASK-UNCHANGED / NO-SIXTH-TASK`.
