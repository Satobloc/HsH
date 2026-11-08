# Amendment 01 — Enheduanna h690:s0 receipt

Canonical receipt (preserved, not replaced): `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-08T1800Z_s0_enheduanna.md`

Run key: `REVROT3-19-20261011:690:s0`  
Worker label: Enheduanna (index 11); successor: Tern Rook (index 12).  
This amendment records a distinct source-fidelity extension. It is not a second run receipt, does not supersede issue #1495, and does not create a new handoff.

## Additional research publication

- Issue: #1496, `[HSH-PUBLISH-V1] Enheduanna | Moving-slice kinematics and geometry fidelity | 2026-11-08`.
- Submission ID: `enheduanna-moving-slice-kinematics-fidelity-20261108t1800z-s0-001`.
- Artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/enheduanna-moving-slice-kinematics-fidelity-20261108t1800z-s0-001.md`.
- Publisher commit: `8467cf4a754ca663c2d65e6318d1b1eb1cf2b65a`.
- SHA-256: `a60e5d2e9208646899388f934925727521f6aa9858e52f5cfbda0fb7f9074000`.
- Publisher comment #6725737902 reports PUBLISHED and readback verified. Independent GitHub file retrieval confirmed the artifact path and content.
- Full companion report: `enheduanna_geometry_fidelity_20261108.md`, SHA-256 `daa2a94b4f34c8f0bece842ef93a88797312e5d9759a698562c7fc2db15422ac`.
- Three normalized schematic plots were generated and displayed: `helix_moving_slice_3d.png`, `helix_slice_circle.png`, and `two_point_separation_comparison.png`. They are not physical data, a measured fixture, or fits; no binary was committed to the repository.

## New source-fidelity findings

1. The 2024 direct moving-plane construction has one helix intersection per fixed plane. The assistant's initial “spiral of intersection points” reading was corrected by Nathan. The helix-slice radius is the radial distance from the axis; pitch and slice speed control phase rate.
2. The 2024 two-point steady-rate request proposed two opposing parabolas, but the assistant only paraphrased it. A conditional reconstruction gives quadratic separation for parabolas and linear separation for two straight lines. The straight-line construction has constant separation-rate magnitude away from contact; the labelled points pass through unless a cusp/reflection rule is added.
3. The 4D carrier types remain distinct: 1D curve `γ¹`, 2D worldsheet `W²`, and finite 4D support `V⁴` have different generic intersections with a 3D time surface. SAT-O1 calls `γ` a 1D curve but its worldtube a 4D volume without a thickening/sweep map. Blockwave's assistant-generated `J^{μν}` is a worldsheet/two-form current. The 2026 “4D filament / 3D trace” remains under-typed.
4. The 2026 direct update preserves one helical core and a hollow outer coil, no second core; coil scale is not filament thickness. The earlier reciprocal filament/timesheet-deformation model is superseded by the Klein Fabric label. The donut-curvature/acceleration claim is separately marked a working hypothesis without proof.
5. SAT-O1, Blockwave minimal action, Blockwave unified assistant action, `θ_BW`, and SAT `θ₄` remain distinct provenance/types. No canonical action or constitutive map was selected.
6. Existing `NadirHelixSliceGeometry` was reused, not extended: PR #1455 merge-reference run #42390677035, job #128457402086, Lean 4.34.0/Mathlib, 8,945 jobs, SUCCESS. This verifies only the formalized conditional helix/slice statements, not source translation or physical premises. PR #1455 remains open/draft/unmerged.

## Scheduler and duplicate-run reconciliation

- The canonical h690 receipt already records the scheduler occurrence as failed with `chat_ref=null`; the cached result was an older h685 output. No authenticated Enheduanna thread was established.
- A prior late handoff described the h690 occurrence as already started around 18:03Z; the live task observation in this invocation reported a later start around 18:30Z. This timestamp discrepancy remains unresolved. It does not authenticate a thread or establish cross-thread delivery.
- The existing :00 automation remains enabled and unchanged. No task ID, schedule, phase, enabled-state, or cadence was changed; no sixth task was created.
- The existing optional Tern handoff is preserved. This amendment adds a research pointer only; no task, review request, response obligation, ownership transfer, or cross-thread delivery/consumption/acknowledgment is claimed.

## Controls retained

No CODATA scoring, physical calculation, new tooling/dependency, branch, PR, Lean module, BEDROCK promotion, or paper-gate advancement. All four Mersearch request lanes remain occupied; no new request was created. The 9 November, 30 November, and 14 December paper gates remain separate. FIE rereview remains due 10 November. Tern retains task-branch graph reconciliation ownership (16 declared branches versus 18 records).
