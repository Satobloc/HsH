# Ravel h858:s2 | Elliptic vortex-ring wall collision: measurement map and projection-fiber audit

**Date:** 2026-11-15  
**Disposition:** SOURCE-VERIFIED MEASURED-SYSTEM CANDIDATE / PROJECTION MAP SPECIFIED / P2 HOLD / NO H(s)H PREDICTION / NO THEORY PROMOTION.

**Relationship to existing HsH records:** Additive to [#1684](https://github.com/Satobloc/HsH/issues/1684), which covers circular vortex rings colliding with finite-diameter plates, and [#1662](https://github.com/Satobloc/HsH/issues/1662), which covers vortex rings in rotating water. This is a different paper, geometry, and perturbation: elliptic rings with AR = 2 and 4 colliding with a large flat wall at selected axis-switching stages. It is not a duplicate of the finite-edge or rotating-fluid studies. The broader candidate docket remains [#1339](https://github.com/Satobloc/HsH/issues/1339) and [#565](https://github.com/Satobloc/HsH/issues/565).

## 1. Primary source and measured system

Bowen Xu and T.H. New, “Collisions of elliptic vortex rings upon flat walls,” *Journal of Fluid Mechanics* 1011, A19 (2025), DOI [10.1017/jfm.2025.401](https://doi.org/10.1017/jfm.2025.401). The article is open access under CC BY 4.0. The paper reports laboratory experiments using planar laser-induced fluorescence (PLIF) and time-resolved particle-image velocimetry (TR-PIV), with elliptic vortex rings of aspect ratios AR = 2 and 4 at Reynolds number Re = 4000.

The apparatus used a 500 mm × 500 mm × 500 mm water tank. The equivalent orifice diameter was de = sqrt(d_major d_minor) = 40 mm. The AR = 2 orifice was 56.6 mm × 28.3 mm; the AR = 4 orifice was 80 mm × 20 mm. Piston stroke was L = 50 mm, so L/de = 1.25. A 20 mm-thick large flat plate served as the collision surface. The wall separation was chosen from the freely translating ring's axis-switching stages.

Published dimensionless collision locations s/de were:

| Ring aspect ratio | Quarter cycle | Half cycle | Three-quarter cycle | Full cycle |
|---|---:|---:|---:|---:|
| AR = 2 | 0.63 | 1.28 | 2.09 | 2.95 |
| AR = 4 | 0.65 | 1.66 | not reported | not reported |

These are source-reported apparatus and operating parameters, not new measurements by this audit.

## 2. Measurement and readout chain

The major and minor planes are two orthogonal planar measurement configurations aligned with the elliptic orifice's major and minor diameters.

- PLIF: 1920 × 1080 pixels at 60 frames/s; field of view approximately 238 mm × 134 mm.
- TR-PIV: 1600 × 1200 pixels; field of view approximately 175 mm × 131 mm; 20 μm polyamide seeding particles; 250 frames/s.
- PIV processing: PIVLab, three-pass multi-grid cross-correlation with 96 × 96, 48 × 48 and 24 × 24 pixel interrogation windows, followed by global/local validation and replacement of rejected vectors.
- Vortex-core circulation: Gamma = integral over core area A of omega dot dS, where omega is absolute vorticity. The core boundary is the closed contour at vorticity magnitude 10 s^-1. The paper then reports Gamma* = Gamma/Gamma_max.
- Core-centre coordinates are vorticity-weighted area integrals, e.g. x_c = integral_A x omega dot dS / integral_A omega dot dS, with the corresponding expression for y_c.

The paper states that upper and lower core locations were averaged to reduce experimental uncertainty. It also reports that PLIF-based secondary-vortex-core tracking becomes less reliable at later stages because the dye is released inside the generating tube and secondary cores entrain less dye; the authors therefore prefer TR-PIV trajectories.

The paper's data-availability statement says the supporting data are available from the corresponding author upon reasonable request. The article provides supplementary movies, but no public run-level TR-PIV vector-field archive, calibration package, masks, per-run covariance matrix or complete uncertainty budget was retrieved in this pass. The paper does not provide a numerical uncertainty budget for the derived circulation and trajectory series in the inspected text. No raw-data reanalysis is claimed.

## 3. Explicit observation maps

Let the laboratory space-time domain be M = R^3 × I. Let Pi_major and Pi_minor be the two measurement planes, and let Sigma_j = Pi_j × I be their time-extended measurement sheets.

For a three-dimensional velocity field u(x,t), the planar measurement maps are restrictions to each plane followed by projection onto the two in-plane velocity components:

P_j[u](xi,t) = proj_Pi_j u(iota_j(xi),t), for j in {major, minor}.

The measured planar fields generate vorticity fields omega_j and the source-defined core readouts:

Gamma_j(t) = integral over A_j(t) of omega_j dot n_j dA,

c_j(t) = [integral over A_j(t) xi (omega_j dot n_j) dA] / [integral over A_j(t) (omega_j dot n_j) dA].

This is the forward geometry-to-observable chain actually supported by the paper: measurement plane -> planar velocity -> planar vorticity -> threshold-defined core region -> circulation and core-centre trajectory.

The reverse map is not established. Two planar restrictions do not, by themselves, uniquely determine a general three-dimensional velocity field or the complete three-dimensional finite-core support. The paper's three-dimensional vortex-flow reconstructions are explicitly based on experimental results and observations; they are reconstructions, not direct volumetric 3D PIV measurements.

## 4. Projection-fibre nonuniqueness witness

A simple mathematical counterexample shows why an unrestricted two-plane inverse is not unique, even within smooth divergence-free vector fields. Align coordinates so the two planes are x = 0 and y = 0. Let psi(x,y,z) = x^2 y^2 and define

delta_u = (d_y psi, -d_x psi, 0) = (2 x^2 y, -2 x y^2, 0).

Then div(delta_u) = d_x(2 x^2 y) + d_y(-2 x y^2) = 4xy - 4xy = 0. The perturbation vanishes identically on x = 0 and on y = 0, but delta_u(1,1,z) = (2,-2,0), so it is nonzero away from both planes.

Therefore the pair of plane-restriction maps has a nontrivial kernel on the unrestricted smooth divergence-free field class. A field u and the distinct field u + delta_u have identical restrictions to both planes.

This is a mathematical noninjectivity witness only. It is not asserted to satisfy the experiment's boundary conditions, Navier-Stokes dynamics, initial conditions, finite-energy requirements or measured flow. It is not a synthetic physical fixture or a physical calculation. It establishes that additional constraints are required before a unique 3D reconstruction can be inferred from two planar observations.

## 5. Existing conditional Lean evidence and limits

Ravel PR #1133 already contains the generic support/slice and readout-fibre modules:

- RavelCarrierSliceReconstruction: complete-section recovery, same-readout identifiability when coverage holds, and noninjectivity when coverage fails.
- RavelJointAccommodationReadout: a readout descends to a tube-only quotient exactly when it is constant on same-tube fibres; a sheet-sensitive readout can forbid a tube-only reduction.
- RavelRepresentationConversionCoherence: pairwise representation conversion does not by itself establish dynamics compatibility or readout invariance.

The existing PR-associated Actions run #43636677645, job #132628836752, checked out synthetic merge commit 7b004af65ab3d4bf143e4c21539c3e632efa2435, merging PR head 17dd47829bad180d1fa3f6fb885ff447a5e76f88 into stacked base 89ab283ae583aef69d6f89a36cc0e2d3b09bfe63. The relevant Ravel modules built, including RavelCarrierSliceReconstruction and RavelJointAccommodationReadout. The theorem-specific log reports [propext, Quot.sound] for readoutNoninjectiveIfUncovered and [Quot.sound] for timesheet_sensitive_readout_forbids_tube_only_reduction. The root build then failed in the unrelated MovingPlaneTraceGeometry declarations. Tests, lint, nanoda, leanchecker and the global axiom audit were skipped. This is a PR merge-reference module build, not an exact-head standalone or current-main integration build.

The support-level theorem is conditional on the formalized coverage/readout definitions. The field perturbation above has not been added to Lean or compiled. No source-specific theorem yet formalizes the PIV observation operator, its field-level kernel, the experiment's boundary conditions or a 3D reconstruction map. Lean status does not establish the physical premises or validate the translation from the paper's apparatus to these abstract objects.

## 6. Worldtube/timesheet bookkeeping without equivalence claims

If K_t is a three-dimensional finite-core region, its time history W_K = {(x,t) : x in K_t} is a four-dimensional region in M. Its spatial boundary, swept through time, is a three-dimensional boundary worldtube. If C_t is a one-dimensional vortex centreline, its time history is a two-dimensional worldsheet.

Each Sigma_j = Pi_j × I is a three-dimensional measurement sheet in laboratory space-time. It is not automatically an H(s)H timesheet. The measured data are restrictions of the flow to these observation sheets. A source-defined map from the reconstructed vortex geometry to an H(s)H worldtube/timesheet or responsive-medium state has not been supplied.

A valid reconstruction would need explicit domains and codomains for: the physical core/filament representation; its evolution law and boundary conditions; the embedding or projection into each measurement plane; the instrument/readout operator; and the uncertainty/covariance propagation. The two-plane counterexample shows why a reconstruction rule cannot be assumed from plane coverage alone.

## 7. Candidate disposition and falsification boundary

This is a distinct, source-verified finite-core/contact candidate. It complements, but cannot be numerically merged with, the circular-ring finite-edge study in #1684: the studies vary different geometric factors and use different apparatus and measurement pipelines. It also remains distinct from the rotating-fluid candidate in #1662 and the rope-contact source audit in #1643.

P2 remains HOLD / NOT SELECTED. The article is peer-reviewed and the measured system is identifiable, but raw PIV fields and calibration records are not public in the inspected source, and a numerical uncertainty/covariance budget for the derived observables is not available there. A future data request would need the raw TR-PIV fields, calibration and processing metadata, masks/core contours, per-run trajectories and circulation, repeat-run identifiers, uncertainty/covariance information, and the inputs used for the authors' 3D reconstruction.

No H(s)H prediction, fit, residual, independent measurement, CODATA comparison, P2 selection or theory promotion was performed. CODATA is not relevant to this hydrodynamic measurement. No climbing-rope equivalence is claimed; the rope mechanics record remains separate in #1643. The current result is an observation-map and identifiability audit, not physical validation of H(s)H.
