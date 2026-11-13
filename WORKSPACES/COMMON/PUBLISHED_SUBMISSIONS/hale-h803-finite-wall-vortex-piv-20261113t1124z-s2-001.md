# Lane 24 | Finite-wall vortex-ring collision: measured contact candidate

**Date:** 2026-11-13  
**Disposition:** SOURCE-VERIFIED MEASURED-SYSTEM CANDIDATE / NOT SELECTED FOR P2 / NO H(s)H PREDICTION / NO THEORY PROMOTION.  
**Relationship:** Additive to the existing empirical-candidate reconnaissance in [issue #1339](https://github.com/Satobloc/HsH/issues/1339) and the P2 docket [#565](https://github.com/Satobloc/HsH/issues/565). This is a distinct finite-wall experiment and DOI, not a duplicate of the bubble-vortex, free-surface, or rotating-fluid candidates already recorded.  
**Provenance:** Assistant-prepared source note. The deterministic roster label for this run is Hale; no authenticated historical Hale instance or current Hale thread is claimed.

## 1. Primary source

William N. McAtee and Vrishank Raghav, “Secondary vorticity defines finite-edge effects in vortex ring collisions with plane walls,” *Journal of Fluid Mechanics* 1028, A40 (2026), published online 6 February 2026. [DOI 10.1017/jfm.2026.11137](https://doi.org/10.1017/jfm.2026.11137). The full article is open access under CC BY 4.0.

## 2. Identifiable measured system

The experiment generates laminar vortex rings in a 45 × 45 × 45 cm water tank and drives them into interchangeable flat circular plates. The nozzle inner diameter is 25.4 mm and its exit is chamfered at 15°. The plate diameters span 1.5–10 nozzle diameters, with a fixed formation-length ratio L/Dₙ = 2. A syringe-pump/linear-actuator system is controlled through LabVIEW; an encoder checks actuator motion and a flow meter measures fluid flow rate. The paper reports actual circulation from processed flow fields rather than treating prescribed Reynolds number as the final measured value.

The explored vortex Reynolds-number range is approximately 600–2800 for flow visualization and 1280–1925 for quantitative PIV. The paper reports three operational plate-size regimes: large plates with no detectable edge effect, intermediate plates with weak edge-generated vorticity, and small plates where edge roll-up dominates the interaction. These are source-reported findings within the explored apparatus and parameter range, not a universal wall law.

## 3. Measurement and observation chain

- Time-resolved planar PIV uses 20 μm polyamide particles, a 1 mm laser sheet, a Phantom VEO 640L camera at 2560 × 1600 pixels, 60 Hz image-pair acquisition, and an effective saved rate of 20 Hz (every third pair). The reported image scale is about 27 pixels/mm.
- Processing uses DaVis 10, a 64 × 64-pixel first pass at 50% overlap, followed by three 32 × 32-pixel passes at 75% overlap, outlier rejection, interpolation of empty regions, and 3 × 3 smoothing.
- The quantitative PIV measurement is 2D2C in a symmetry plane through one core in the cross-section of the 3D vortex ring. The paper explicitly says that it does not collect a full 3D velocity field.
- Separate planar laser-induced fluorescence (LIF) visualizations use two dyes to distinguish the primary vortex and wall/boundary-layer structures. These images are 11 fps and are only approximately time-matched to PIV because the camera synchronization is limited; they are qualitative morphology evidence, not exact synchronized samples.
- Derived quantities include circulation, core trajectory and velocity, core eccentricity, and a boundary-layer separation indicator. Core identification uses a 10% swirl-strength threshold and local maxima of the Γ₁ field. The separation-point procedure is explicitly not claimed to locate the precise physical separation point.

## 4. Uncertainty and data availability

The authors report five experimental runs for each plate-size/Reynolds-number condition. The maximum initial-condition variability is a 5.6% standard deviation of the mean at the highest-Reynolds-number case. The effective plate size is 2.84 ± 0.07 Dₙ for the nominal 3 Dₙ plate and 1.57 ± 0.034 Dₙ for the smallest plate. The 10 Dₙ plate's uncertainty is described as indeterminate, although it lies outside the field of view and is classified as effectively infinite. The reported average PIV velocity uncertainty is about 2% of peak velocity for the smallest-Reynolds-number case.

The separation-point data are phase-averaged and intended to distinguish surface separation from edge separation, not to establish a precise location. The reported 2% PIV uncertainty is not a complete covariance budget for all derived circulation, trajectory, or separation observables.

The article's data statement is: “Data will be made available upon reasonable request.” Three supplementary flow-visualization movies are linked through the article DOI. No raw PIV image pairs, processed vector fields, per-run data package, calibration files, or full covariance package were retrieved in this run. No author data request was sent.

## 5. Explicit observation-map limit

A source-faithful measurement-map reconstruction is

\[
O_{\Pi}(u)=\left.(u_x,u_y)\right|_{\Pi},
\]

where \(u(x,y,z,t)\) is the 3D fluid-velocity field and \(\Pi\) is the measured symmetry plane. The reported PIV data are 2D in-plane velocity components, not a 3D reconstruction.

This observation operator is non-injective on general 3D velocity fields: different off-plane fields and unobserved normal components can produce the same in-plane record. Therefore the measured plane can support a cross-sectional vorticity and core-history analysis, but it cannot uniquely determine the full 3D vorticity field or a complete 3D worldtube without additional measurements or explicit symmetry/regularity assumptions. This is a mathematical identifiability limit of the measurement operator, not an H(s)H-specific result and not an equation asserted by the paper.

A future formalization would need to state the function spaces, restriction/projection map, measured components, plane geometry, and any additional assumptions used to claim a 3D lift. No Lean theorem or physical map was instantiated here.

## 6. Relation to existing Lane 24 candidates

- [Issue #1339](https://github.com/Satobloc/HsH/issues/1339) already records 3D bubble-vortex interaction, buoyant particle-vortex interaction, and a separate 2026 free-surface vortex-ring study. This finite-wall DOI is not present there.
- [Issue #1665](https://github.com/Satobloc/HsH/issues/1665) records synchronized free-surface and volumetric-flow measurement. That experiment has a richer 3D observation architecture but its supporting data are available on request.
- [Issue #1662](https://github.com/Satobloc/HsH/issues/1662) records rotating-fluid vortex-ring PIV. Its separate PIV planes do not supply a simultaneous 3D field.
- The present JFM paper is comparatively strong in open full-text method and uncertainty reporting for a controlled contact/finite-boundary experiment, but its quantitative PIV is 2D2C. It is not a substitute for the 3D candidates.

## 7. Formalization, CODATA, and disposition

No Lean executable, Lake, or Elan is installed in this runtime. The related Nadir PIV formalization remains in draft PR #1189 and its exact-head CI has a parser failure; the generic Lean CI PR #262 remains open/unmerged. PR #873 is an existing, unrelated source-faithful formalization. No existing PR was modified, no new theorem was claimed, and no new tooling or dependency was built.

The existing CODATA source/evaluation audits remain in [#1558](https://github.com/Satobloc/HsH/issues/1558), [#1438](https://github.com/Satobloc/HsH/issues/1438), and [#1405](https://github.com/Satobloc/HsH/issues/1405). This note uses no CODATA numerical value and makes no numerical comparison.

**Next evidence gate:** if P2 is released, obtain the raw PIV image pairs or vector fields, per-run records, flow-meter and encoder time histories, calibration/scale records, actual plate geometry/alignment, and covariance/uncertainty for the derived observables before attempting any forward or inverse H(s)H comparison.

**Final status:** candidate only; P2 remains HOLD. No raw-data reanalysis, physical calculation, fit, independent prediction, H(s)H validation, P2 selection, paper-gate advancement, or BEDROCK promotion.
