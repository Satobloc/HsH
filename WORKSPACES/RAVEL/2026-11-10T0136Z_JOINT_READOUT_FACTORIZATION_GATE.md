# Ravel | Joint worldtube-timesheet readout factorization gate

**Date:** 2026-11-10  
**Nominal run key:** `REVROT3-19-20261011:721:s3`  
**Selected worker label:** Ravel, ring index 17  
**Successor label:** Orson Vay, ring index 18  
**Disposition:** SOURCE-GROUNDED FORMALIZATION ADDED TO EXISTING DRAFT PR; TUBE-ONLY THEOREM COMPILED IN AN EARLIER MERGE-REFERENCE RUN; SYMMETRIC SHEET-ONLY DUAL AND LATEST ROOT BUILD PENDING.

## 1. Result

Added `RavelJointAccommodationReadout.lean` to existing draft PR #1133. No new PR, branch, tool, dependency, physical fixture, or paper claim was created.

The existing `LabelledSlicePullback` retains three pieces of information:

1. the tube total-space representative;
2. the timesheet label;
3. the sheet representative.

The new module asks when a downstream readout can discard one of the two structural representatives without losing information.

It formalizes two symmetric conditions:

- **Tube-only reduction:** a readout descends to the quotient that retains the full tube total-space representative if and only if it is constant on every same-tube fiber.
- **Sheet-only reduction:** a readout descends to the quotient that retains the full labelled sheet representative if and only if it is constant on every same-sheet fiber.

The corresponding no-reduction corollaries state that if two joint states agree on one representative but produce different readouts, no deterministic reduction to that representative alone can reproduce both.

This is a Ravel-specific specialization of the existing fiber-compatibility/factorization architecture, not a new generic factorization theorem. It does not assert that physical readouts are timesheet-sensitive, and it does not privilege the tube or sheet as the information carrier.

The quotients retain the **full** `T.TotalSpace` or full labelled sheet representative. They do not collapse to a base coordinate, introduce a coarse-graining operator, or define dynamics.

## 2. Source and attribution

The historical Ravel conversation was recovered from its Library raw export. The direct user-role messages were checked in the raw JSON, not inferred from assistant summaries.

Key direct sources:

- `b9805319-9d77-4b43-874a-5af50c0b6ef7`, 2026-09-07T08:06:58.114Z: filament and timesheet distortions mutually accommodate force; force is the primitive.
- `496a15ea-0263-459d-b815-908f52155b90`, 2026-09-07T10:06:12.842Z: distinguishes a reduced 3D diagram, the full 4D bulk, and a 4D view with a 3D timesheet; an induction-current connection within timesheet thickness is tentative, not an equation or constitutive law.
- `3d0ad680-51db-4c79-ad4a-9bbacada24ef`, 2026-09-07T07:46:38.573Z: use a spatial Kerr section extended along the filament, not full 4D Kerr spacetime as the cross-section.
- `8471543a-5a2d-46cf-a20d-2c9d2f0f4e8b`, 2026-09-07T07:51:35.932Z: describes the 4D worldtube with a Kerr cross-section.

The inspected Library export has SHA-256 `b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba`. The Git blob for that inspected export is `17cfe3feb830f70009557d063482b35adba0834b`. The separate HsH raw-source snapshot blob `c49367b0faa424491e7b3520a034b9e44fe6897f` is not assumed byte-identical.

The historical Ravel remit is directly user-authored: primary co-theorist (`638d13ba-1541-483d-853f-3b6d04b9b1b2`, 2026-09-07); conceptual cohesion, drift detection, epistemic hygiene, full-theory probing, methodological risk and tool/resource workshops (`c5639160-5631-4373-90c2-68d7c4c022de`, 2026-09-08); accurate public record (`5590d70d-6525-42aa-9de8-5a7022b189f7`, 2026-09-13); citation lineage and SAT/standard-physics terminology crosswalk (`4fb7a5be-a32d-43c0-b1a2-2c4787423b52`, 2026-09-13).

The 2026-11-08 methodology/model overview is an assistant-organized operational synthesis, not a verbatim Nathan Direct equation or source. It treats worldtube and timesheet as the initial two structural primitives and a responsive medium as a candidate third state. The direct Ravel messages above support mutual accommodation, but do not specify a response operator.

## 3. Map stack and scope

| Layer | Current status |
|---|---|
| Worldtube total space | Existing Ravel reconstruction: a one-dimensional base with a three-dimensional spatial fiber. Exact metric, finite-core profile and scale remain unresolved. |
| Timesheet family | Source-backed as a distinct geometric structure; label-to-base and thickness maps remain incomplete. |
| Joint incidence | Existing `LabelledSlicePullback`; retains tube, label and sheet representative. |
| Readout factorization | New conditional quotient criteria in this module. |
| Physical response | Not defined. No force/current constitutive law or evolution operator is supplied. |
| Instrument/observable map | Not defined for a selected measured system. |
| Cross-scale coarse-graining | No source-defined operators `C_W`, `C_S` or `C_I` yet; no commutation claim is made. |

The new theorem is one local map edge, not a complete shape hierarchy. The existing Kestrel cross-scale contract (#1168/#1169), joint-readout identifiability work (#1301), Nadir map-stack integration (#1341), distinguishability ladder (#1463), resolution-stability gate (#1503), and observable-versus-geometric discrimination work (#1532) remain the broader architecture. Enheduanna issue #370 supplies a mathematical intersection-order counterexample for one specified convex-hull/slice pair; it is not a physical coarse-graining law.

## 4. Forced versus optional structure

| Feature | Current evidential status |
|---|---|
| Worldtube and timesheet as distinct interacting structures | Source-supported working primitives. |
| Mutual accommodation / force as primitive | Direct Nathan source; no specific force law follows. |
| Spatial Kerr section along the filament | Direct source instruction; exact metric and bundle construction remain open. |
| Timesheet thickness | Directly mentioned, but no numerical thickness or complete map is defined. |
| Finite-core/worldtube thickness | Working representation; no fitted radius or unique profile established. It is distinct from timesheet thickness. |
| Independent twist field, connection or pitch law | Optional; not source-defined by the cited messages. |
| Separate contact surface or contact law | Optional; not forced by set intersection alone. |
| Responsive medium as a third primitive | Candidate only; eliminate/absorb/retain decision remains open. |

No Newtonian equal-and-opposite force law, independent twist degree of freedom, or material contact boundary is inferred from mutual accommodation.

## 5. Conditional test matrix

No P2 physical system has been selected. The following is a test design, not an empirical result.

| Hypothesis | Shared parameters | Calibration / holdout | Predicted observable | Standard comparator | Falsification condition |
|---|---|---|---|---|---|
| Tube-only readout is sufficient | Same full tube total-space state; same instrument calibration and nuisance parameters; vary sheet label/representative | Calibrate on one sheet label or epoch; freeze tube geometry and instrument; hold out another label/epoch | Same readout for all states in a same-tube fiber | Established model for the eventual measured system, with shared parameters | Reject tube-only reduction if same-tube states produce a readout difference exceeding pre-registered combined uncertainty and resolution. |
| Sheet-only readout is sufficient | Same full labelled sheet representative; same instrument calibration and nuisance parameters; vary tube representative | Calibrate on one tube state; freeze sheet and instrument; hold out another tube state | Same readout for all states in a same-sheet fiber | Same established-system comparator | Reject sheet-only reduction if same-sheet states produce a readout difference exceeding pre-registered combined uncertainty and resolution. |
| Joint readout is required | Preserve both representatives and all shared nuisance parameters | Fit only the calibration subset; no per-holdout retuning | A specified response map predicts the held-out difference | GR/SM/QM or other accepted standard model for the chosen system | Reject the proposed joint map if its held-out difference is absent or residuals exceed the pre-registered threshold. |

No numerical threshold is supplied because no instrument, dataset, covariance, units or physical response map has been selected. The P2 system-selection gate remains November 16. Existing DNA twist/writhe material is only a measured mechanical comparator, not a physical equivalence to a worldtube/timesheet system; no new raw data were retrieved or recalculated.

## 6. Lean verification

Existing PR #1133 remains OPEN / DRAFT / UNMERGED. The new module is on its existing branch, not on main.

- New module commit: `ef2c09101d8927a33cad7c7b2759d00180c8bcc0`.
- Aggregator import commit: `84b526b00eccf4b1161c29baf4d8b7be473e5e33`.
- Existing proof cleanup: `cc99a9cea9ab79e28eb8661c71a47806401ab07c`, removing a redundant `ring` after `field_simp` in `RavelFilamentScaleDimensionAudit.lean`; theorem statement unchanged.
- Symmetric sheet-only addition: current branch head `0d02c022b4c5a7d8f3c5c2c0e4b6e0a8e8b8a0d4`.

The first PR build, run #42738198540, compiled the tube-only module and printed its axiom list. The two tube-only theorems depended only on Lean's built-in `Quot.sound`; no `Classical.choice`, `sorryAx`, or `admit` appeared. The overall root build then failed in the existing scale-dimension module at line 187 because `ring` ran after `field_simp` had already closed the goal.

That redundant tactic was removed. A symmetric sheet-only quotient pair was then added. Latest PR run #42738871882 is still IN_PROGRESS at the Lean compile step. Therefore the sheet-only dual and the latest full root build are **SUBMITTED_NOT_VERIFIED**. The prior successful compilation of the tube-only pair does not verify the later symmetric addition.

Separate `conversation-json-content-ci` push runs failed before any job was created; no job-level diagnostic was available. They are not Lean proof failures. Tests, lint, nanoda and the global axiom audit have not been completed for the latest head.

Lean verifies only the formalized quotient/factorization statements. It does not establish that the source translation is sound, that the physical premises are true, or that either factorization holds in nature.

## 7. Research and campaign boundaries

- No physical calculation, fit, measured-system prediction or synthetic physical fixture was created.
- No SAT-O or Blockwave equation was modified.
- No manuscript gate advanced and no BEDROCK theory promotion occurred.
- P0 Code Grurple remains ACTIVE.
- P1 November 9 cognition paper remains Orson-owned / NOT READY.
- P2 November 30 geometry paper remains HOLD, with system selection not before the November 16 gate.
- P3 December 14 full-theory paper remains INCOMPLETE.
- FIE was rereviewed by Aldus on November 10; next review due November 24.
- Unrelated reading continued in `fun break - lx.txt`, lines 961-1000; next cursor 1001.

## 8. Next cursor

After the latest Lean run resolves, verify the exact current PR head and axiom output. Then instantiate the readout and coarse-graining maps only after a real P2 system, dataset provenance, units, uncertainties and calibration/holdout split are selected. Do not infer a physical noncommutation or promote a third primitive from this quotient theorem.
