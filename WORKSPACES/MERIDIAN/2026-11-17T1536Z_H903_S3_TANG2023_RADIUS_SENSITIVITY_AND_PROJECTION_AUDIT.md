# Workshop Relay h903:s3 | Tang 2023 ring-radius sensitivity and projection audit

**Run key:** REVROT3-19-20261011:903:s3  
**Selected ring label:** Meridian (index 15)  
**Next ring label:** Mercer (index 16)  
**Disposition:** SOURCE-GROUNDED SENSITIVITY ANALYSIS COMPLETE / PROJECTION UNCERTAINTY LOCALIZED / NO H(s)H PREDICTION / P2 HOLD.

This is a source-grounded assistant execution under the supplied Lane Charter 36, not authenticated participation by a historical Meridian ChatGPT thread. The current Meridian workspace has no standalone signed specialist charter or authenticated current-thread locator. The standing Code Grurple P0 assignment is unchanged; this is a one-run Lane 36 overlay.

## 1. Historical source and current controls

The historical Meridian role was recovered from original user-role messages, not inferred from the assistant-authored role title.

- Role-clarification conversation: 6a9aa91b-11f4-83ea-80a1-4d502522e441; raw Git blob d21e251df093013903cc19789ded562f83b6e6ea.
- Direct user messages: 054d1aea-cf67-4154-93c8-e302dc3ce1ea (2026-09-08 02:45:59Z), 39299849-e2a4-4b63-88a0-5612c700cc1a (03:11:46Z), and f6a2377c-8873-41ee-9107-41aeeb0d2589 (09:51:01Z). They establish configurable geometric solvers, graticule/UI/Whirligig exploration, reproducible input-to-calculation workflows, explicit solver limits, and comparisons against traditional methods.
- Meridian Free Build: conversation 6ac45d1f-17b0-83ea-ad1f-fa524602378b; raw Git blob 7af1561b321f4d9364da5eb111df689efc652827; direct user message 97d301cb-5174-4861-a273-ac4cc0b60d8b (2026-10-09 10:38:10.722Z) says preserve multiple valid answers and prefer the least-wild route. This is a solver-design preference, not a theorem that every problem has multiple solutions.
- The same raw source contains direct user messages 28b2378a-846d-4c3f-a242-91f9007ce261 and 1178f25c-9f92-4d1c-b43b-06482e6bf1b1 (2026-10-09 07:39–07:40Z): the proposed first-order coil scale ell_f is not filament thickness epsilon; begin with the 4D filament and do not mistake a 3D intersectional trace for the 4D filament itself. The source wording calls the scale a “diameter” and then gives a “radius” value, so no silent normalization or corrected equation is made here.
- The 2026-11-08 Primary Operational Guideline keeps worldtube/worldline and timesheet as the two minimal primitives, with responsive medium provisional; it explicitly says ordinary-fluid vortex cores and SAT matter worldtubes are distinct unless an explicit derived map identifies them.

The live BEDROCK, Primary Operational Guideline, October 26 Steering Charter, Phase Steering, Three Paper Campaign, onboarding, revival V3/V4, current Meridian BOOT/CURRENT_WORK, latest Meridian receipts, Common HANDOFFS, task graph, PWH queue and h903 predecessor reports were read. HsH, SAT archive and HSH_RESOURCES front doors were checked. HSH_RESOURCES was limited to its root README; no private payload was opened.

The HsH main commit before this run's writes was af71e029df6edc31ba43b6ef47735fefb2265d84.

## 2. Why this is new work rather than a duplicate

The existing h869 Meridian script already fits a circle to the nine-particle Tang dataset and performs 20,000 diagonal-error Monte Carlo draws. The h884 Meridian report already supplies a two-campaign Kelvin-vortex comparison matrix. Kestrel h903:s2 (#1906) already separates generator, translator and physical readout, and introduces fiber-aware minimality. Nadir h902:s3 (#1903) already adds the quarter-turn readout theorem for the separate 2026 air-water vortex experiment.

This run does not repeat those results. It adds a finite-difference Jacobian and per-coordinate uncertainty attribution to the existing Tang 2023 nine-particle ring-radius calculation, then uses that result to identify which projection layer limits the observable.

## 3. Measured system and source-to-observation map

Primary source: Tang et al., Nature Communications 14, 2941 (2023), “Imaging quantized vortex rings in superfluid helium to evaluate quantum dissipation,” DOI https://doi.org/10.1038/s41467-023-38787-w. The calculation uses the nine-particle coordinate rows and per-coordinate 1-sigma uncertainties in Supplementary Information p. 6, Supplementary Table 1.

The input is not raw imaging and not independent 3D tomography. The paper reconstructs 3D particle positions from an image-plane x-z ellipse and a projection-angle relation. The reconstruction uses the ellipse-axis ratio to infer the viewing angle and fixes the ellipse-centre depth coordinate at y0 = 0. The existing source script records this limitation explicitly.

The actual chain is:

1. Physical system: a quantized vortex ring in superfluid helium-4 with trapped deuterium tracer particles.
2. Tracer dynamics: particles follow the vortex-ring flow subject to the paper's tracer/force model.
3. Instrument projection: a laser-sheet/camera observation yields image-plane particle positions.
4. Ellipse fit: image-plane coordinates yield ellipse parameters and orientation.
5. Conditional 3D reconstruction: a circular-ring assumption, projection angle and y0 = 0 map image-plane observations to author-derived 3D particle coordinates.
6. Geometric readout: PCA/SVD plane fit, projection into that plane, and nonlinear least-squares circle fit produce the fitted major ring radius R_ring.

Thus the composition is F_circle ∘ P_circular ∘ E_ellipse ∘ I_camera ∘ T_tracer. The P_circular stage is conditional on the source's circularity/projection assumptions. The new Jacobian is downstream of that stage; it does not propagate uncertainty in the upstream ellipse fit, shared projection parameters, camera calibration or the circularity assumption.

**Scale typing matters:**

- R_ring is the major radius of the vortex ring's centreline.
- The a_i values in the helium experiment describe tracer-particle radii, not vortex-core thickness.
- The bare quantized-vortex core scale is a separate model quantity, not directly imaged by this nine-particle reconstruction.
- The classical air-water vortex paper's a_air-core(z,t) is a measured core radius in a different physical system.
- SAT epsilon (intrinsic filament thickness) and ell_f (proposed first-order coil radius/scale in the historical user source) are distinct from all of the above.

No map from the SAT 4D filament/worldtube and timesheet to the helium vortex, tracer dynamics or instrument readout is established. Similar vortex language does not supply that map.

## 4. New calculation: Jacobian and uncertainty attribution

The upstream script was fetched from HsH main and its Git blob was independently reproduced locally:

- Existing input script: WORKSPACES/MERIDIAN/reproduce_h869_tang2023_nine_particle_circle_fit.py
- Exact Git blob SHA-1: 8ef3f7bc1b4d5155baef841d07127e6a88040753
- Units: mm for coordinates and 1-sigma coordinate uncertainties.
- Source DOI: 10.1038/s41467-023-38787-w.
- Runtime: Python 3.13.5, NumPy 2.3.5, SciPy 1.17.0.
- Monte Carlo: 20,000 draws, seed 20261116.
- No new dependency was installed.

The new script computes a central finite-difference Jacobian of fitted radius with respect to all 27 derived coordinate components, propagates the published diagonal coordinate errors to first order, repeats the source script's Monte Carlo, and performs a leave-one-particle-out influence check.

| Quantity | Result |
|---|---:|
| Reproduced ring radius | 310.085134 µm |
| Radial fit RMS | 0.939146 µm |
| Plane-fit RMS | 0.234153 µm |
| Linearized diagonal-error SD | 1.305610 µm |
| Monte Carlo diagonal-error SD | 1.308872 µm |
| Difference between SD estimates | 0.2492% |
| Monte Carlo 2.5%–97.5% interval | 307.555825–312.689072 µm |
| Leave-one-particle-out radius range | 309.865597–310.279824 µm |
| Leave-one-out span | 0.414227 µm |

The linearized SD remains stable across central-difference steps from 1e-4 to 1e-7 mm: 1.305610152 to 1.305612506 µm. This is numerical step-size stability, not an independent measurement.

**The new result is the uncertainty attribution:**

| Coordinate axis | Share of propagated diagonal variance |
|---|---:|
| x | 15.66% |
| y (reconstructed depth) | **79.19%** |
| z | 5.16% |

The inferred y coordinates dominate the calculated variance. The y coordinate of particle row 3 contributes 36.76%; row 1 contributes 24.42%. Together those two coordinate terms contribute 61.18% of total variance. By particle, rows 1 and 3 contribute 32.76% and 38.73%, respectively, or 71.49% combined.

Under the published diagonal-error model, the radius is not controlled by a single particle: omitting any one row moves the fitted radius within a 0.414 µm span. But the uncertainty budget is strongly projection-sensitive. Improving only image-plane x/z localization would not address the dominant propagated terms; a better depth/projection constraint and the shared covariance of the reconstruction are the important missing inputs.

The 0.25% agreement between linearized and Monte Carlo SDs is a cross-check of two numerical methods under the **same** independent-diagonal-Gaussian assumption. It is not independent validation. The full coordinate covariance, shared ellipse-fit covariance, projection-angle uncertainty and model/systematic uncertainty are absent. The reported interval is therefore a conditional sensitivity interval, not a complete confidence interval.

Reproducible artifacts:

- WORKSPACES/MERIDIAN/audit_h869_tang2023_radius_sensitivity.py
- WORKSPACES/MERIDIAN/h903_tang2023_radius_sensitivity_output.json

New script SHA-256: ff89bfa25804ff6d2810f1ffe6ea3b7acadc7d4f7949a9fdcbee3d7392a836dc  
Output JSON SHA-256: e156ceb6db7092c7625508d7e510ba0d634c902a6fa3cd81737c20d24c73ddc9

Both scripts use the existing source fit and NumPy/SciPy already required by it. The upstream source file was not modified.

## 5. Conditional H0/H1 test matrix and what remains unidentifiable

| Case | H0 standard comparator | H1 H(s)H requirement | Shared parameters / calibration | Holdout and observable | Falsification status |
|---|---|---|---|---|---|
| Tang 2023 helium ring | Standard two-fluid vortex-ring and tracer dynamics, with the paper's image/ellipse/circular-projection reconstruction | An explicit map from the 4D filament/timesheet representation to the 3D ring centreline, tracer trajectories and camera readout, plus a distinct predicted residual | Temperature, tracer properties, ring geometry, camera scale/time base, ellipse parameters, projection angle and their joint covariance | R_ring(t), tracer trajectories and fit residuals on a separately identified acquisition | No numeric threshold: raw acquisition manifest and full covariance are unavailable; the 9-particle table alone is not an independent holdout |
| 2026 air-water vortex (existing Kestrel/Nadir work; not re-analysed here) | Standard Rankine/hollow-core Kelvin-wave model with measured core radius, circulation and axial flow | A source-authorized map to the measured a(z,t) and eta(z,t) fields, and a predicted observable beyond the standard mode/readout account | Same-run camera calibration, contour extraction, PIV/PTV and cross-channel uncertainty | S_a, S_eta, cross-spectrum and held-out forcing/acquisition, as already specified in #1906/#1903 | Raw bytes, acquisition IDs and joint covariance remain outstanding; no H(s)H numerical prediction exists |

The two experiments are not pooled: the helium-4 vortex ring and the classical air-water vortex core are different physical systems. The 2026 air-water two-channel readout is already represented in existing Lean work; it is not a map from an ordinary-fluid vortex core to a SAT worldtube.

A valid future H(s)H comparison must first define the source-faithful forward map and a prediction that differs from H0. Calibration parameters must be frozen before an independent acquisition/condition is unblinded. The falsification threshold must be pre-registered from the full predictive and measurement covariance. No numerical threshold is invented here.

## 6. Lean status and proof boundary

No new Lean theorem or CI run was made for the finite-difference sensitivity calculation. The new object is a numerical Jacobian of a source-specific PCA/SVD plus nonlinear least-squares pipeline. A source-faithful formalization would first need a precise differentiable map, optimizer uniqueness/stability conditions, SVD branch conventions, and the missing joint covariance. Treating the numerical finite-difference output as an exact symbolic derivative would overstate what was proved.

The existing map formalizations were checked and reused by reference:

- Kestrel PR #873 exact-head Lean build: Actions #44090154878, successful; PR remains OPEN / DRAFT / UNMERGED.
- Nadir PR #1189 exact-head Lean build: Actions #44106198466, 8,961 jobs successful; PR remains OPEN / DRAFT / UNMERGED.

Those builds verify their encoded conditional map/readout statements, not the Tang projection model, the new Jacobian, the source-to-H(s)H translation, or any physical premise. They are prior results, not new proofs in this run.

## 7. Research and governance disposition

Mersearch-first was attempted as a capability preflight. No callable Mersearch action or local pinned mersearch-stable-1.0 checkout was available. The four canonical request lanes were already occupied/requested; none was overwritten, released or retriggered. GitHub source search and the recovered HsH raw conversation blobs are bounded fallbacks, not Mersearch results. The exact SAT archive root README was read; HSH_RESOURCES was limited to its root README. No private payload was accessed.

Existing solver/verification resources were checked before adding anything: the upstream Meridian fit script, Math Hopper #578 / PR #991, Whirligig Kernel 0, Kestrel PR #873, Nadir PR #1189, SciSpace and the relevant HsH workspaces. The new sensitivity script is a small additive analysis over the existing script; no new package, service, fork, subscription or expenditure was introduced.

No SAT-O or Blockwave equation was transcribed, changed, corrected or promoted. Their originals and source pins remain untouched. No BEDROCK theory promotion, Factory Floor admission, paper-gate advancement, task-graph mutation or P0 change occurred.

Current campaign status remains:

- P0 Code Grurple: ACTIVE.
- P1 Orson cognition: OVERDUE / NOT READY, protected.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- FIE next review: November 24 (last review November 10; not yet due).
- November 9 minor gate remains overdue; November 30 major and December 14 full-theory gates remain separate.

No independent measurement, H(s)H physical prediction, raw-data holdout, numerical falsification threshold or full covariance analysis is claimed. The useful advance is a source-specific localization of the dominant uncertainty to the inferred depth/projection layer.

## 8. Successor and automation boundary

The next ring label is Mercer. Any repository-only context packet is optional and creates no task, review request, deadline, response obligation, ownership transfer, or authenticated-thread delivery claim.

The existing :36 automation identity, enabled state, exact hourly schedule and Lane Charter 36 phase were left unchanged. No sixth task, replacement, schedule change, phase change, signet or conversation rename.

**Return pin:** H903:S3 / MERIDIAN-LABEL / MERCER-NEXT / TANG2023-NINE-PARTICLE / JACOBIAN-SENSITIVITY / Y-PROJECTION-79.19-PERCENT / ROW1-ROW3-61.18-PERCENT / LINEAR-MC-0.249-PERCENT / LEAVE-ONE-OUT-SPAN-0.414-UM / RING-RADIUS-NOT-CORE-THICKNESS / NO-HSH-FORWARD-MAP / NO-NEW-LEAN-PROOF / ISSUE-PENDING-VERIFICATION / P2-HOLD / P0-UNCHANGED / AUTOMATION-UNCHANGED / NO-SIXTH-TASK.
