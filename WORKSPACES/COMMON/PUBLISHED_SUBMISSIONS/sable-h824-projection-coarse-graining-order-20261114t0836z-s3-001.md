# Projection versus coarse-graining: operational order test

**Class:** METHOD / OPEN SANDBOX TEST DESIGN  
**Authority:** BEDROCK-recorded Nathan Direct questions ND-2026-10-18-07 and ND-2026-10-18-04.  
**Status:** Proposal only. Not established physics, an H(s)H prediction, an empirical result or a BEDROCK promotion.

## 1. The open problem

[BEDROCK, ND-2026-10-18-07](https://github.com/Satobloc/HsH/blob/main/BEDROCK.md#L507-L530) distinguishes structural coarse-graining \(C\) of nested worldtubes from timesheet intersection/projection \(P\). It asks whether \(P(C(G))\) and \(C_3(P(G))\) agree after the operators and observable are specified, and explicitly warns that formal noncommutation alone does not establish an observable consequence.

This note adds an acceptance contract: define the complete map chains, compare them in a common codomain, then test the difference after the calibrated measurement map on an untouched holdout.

## 2. Typed map contract

Keep these objects distinct:

- \(G\): full nested worldtube configuration at a declared resolution.
- \(C:G\to G_c\): structural coarse-graining, with scale, object-counting rule and preserved variables.
- \(\gamma^1\): one-dimensional carrier/centerline candidate.
- \(W^4\): finite-core worldtube target. If treated as a bundle over \(\gamma\), specify \(\pi:W\to\gamma\) and intrinsic fibers \(F_\lambda^3=\pi^{-1}(\lambda)\).
- \(\Sigma_t^3\hookrightarrow M^4\): independent timesheet/hypersurface.
- \(S_t=W\cap\Sigma_t\): observed support on that timesheet, distinct from \(F_\lambda\).
- \(P_{\Sigma_t}\): intersection/projection with support, boundary and transversality conditions.
- \(C_3\): coarse-graining of the resulting three-dimensional trace, with its own scale and counting rule.
- \(\kappa_1,\kappa_2\): comparison maps from the two route outputs into a common typed codomain \(Z\), unless the outputs already have the same type.
- \(K_\delta:Z\to Y\): calibrated instrument/resolution map.
- \(O:Y\to\mathcal O\): measured observable with units and uncertainty model.

Compare:

1. \(O\circ K_\delta\circ\kappa_1\circ P_{\Sigma_t}\circ C\)
2. \(O\circ K_\delta\circ\kappa_2\circ C_3\circ P_{\Sigma_t}\)

All domains and codomains must compose. Use the same calibrated instrument map for both routes, or independently calibrate and compare route-specific maps.

A 3D spatial fiber \(F_\lambda\), a 3D timesheet \(\Sigma_t\), and a 3D intersection slice \(S_t\) are not interchangeable because they share a dimension. Under transverse intersection, a 3D fiber and 3D timesheet in a 4D ambient space intersect in 2D. This is a conditional dimension result; the physical maps are not thereby constructed. [Ravel PR #1133](https://github.com/Satobloc/HsH/pull/1133) contains the relevant generic intersection/readout machinery, but this specific instance was not separately compiled.

## 3. Source boundary: forced versus conditional

- **Intrinsic thickness:** BEDROCK records \(\varepsilon\) as a qualitative historical commitment and separates it from the historical \(\ell_f\) coil radius. No numerical \(\varepsilon\), profile or constitutive law is established here. The original message-level locator for this note was not independently reopened in this run.
- **SAT-O1:** [Mercer issue #1732](https://github.com/Satobloc/HsH/issues/1732) identifies an unbylined 1D curve/action and worldtube prose describing a swept volume, but no explicit sweep, cross-section, thickening or embedding map. The missing map is a construction obligation, not a dimensionality contradiction.
- **Blockwave:** the supplied attachment's embedded authorship remains unresolved. A rank-two current is not itself a 4D worldtube; support/duality and any inclusion or thickening map must be explicit. No equation is reproduced or changed here.
- **Braid and interaction:** [BR-006](https://github.com/Satobloc/HsH/blob/main/BEDROCK.md#L351-L360) retains cumulative braid history and interbraid/back-tug as framework premises. These do not automatically define a local twist connection, phase law or separate contact surface.
- **Responsive medium:** remains a provisional third primitive, not an automatic addition.
- **Timesheet:** an independent hypersurface, not a material medium or intrinsic spatial fiber.

A finite-core construction therefore needs an explicit cross-section/fiber map. Twist and contact surfaces remain conditional on source-defined maps and readouts. BEDROCK's ideal straight, uniform tube slice formula is explicitly not a universal law for finite helical, hollow, oscillatory or composite tubes.

## 4. Test matrix

| Element | Required specification |
|---|---|
| H0 | Minkowski-first construction plus minimally sufficient established physics |
| H1 | Same frozen system and shared parameters, with both declared operator orders and source-authorized H(s)H structure |
| Shared parameters | Measured geometry, masses/material properties, instrument calibration, environmental nuisance and full covariance |
| H(s)H-only parameters | Only source-authorized cross-section, coupling or response parameters; no free rescue kernel |
| Calibration / holdout | Declared fit/calibration subset plus untouched acquisition block or condition |
| Predicted observable | Both instrument-level readout vectors after comparison, instrument response and observable maps |
| Standard comparator | Ordinary Minkowski and established physics; full finite-support model where required by the apparatus |
| Falsification | Preregistered joint predictive region using measurement, calibration, nuisance and model covariance |

Decision rules:

- If routes differ geometrically but their measured readouts agree within declared uncertainty, no observable difference is demonstrated at that resolution.
- If the difference is absorbed by shared standard-model parameters or calibration, it is not a distinctive H(s)H prediction.
- If it survives the frozen measurement map and untouched holdout outside the preregistered region, the chosen reduced pipeline is inadequate for that readout. This does not uniquely identify thickness, twist, contact or medium.
- Missing maps, covariance or holdout means `PREDICTION_NOT_FORMED`, not `PASS`.

## 5. Real-system control and limits

The NIST/BIPM torsion-balance study is an existing standard-physics control for information loss under geometric reduction. [Ravel issue #1716](https://github.com/Satobloc/HsH/issues/1716) establishes why the full finite-support Newtonian model, not a point-mass approximation, is the proper comparator for that apparatus. This note does not repeat its calculation, select NIST as a P2 system, or identify the apparatus with an H(s)H worldtube. Raw time series and the complete CMM point cloud were not retrieved here; no new physical calculation or numerical threshold is claimed.

## 6. Formalization and non-duplication

[Ravel PR #1133](https://github.com/Satobloc/HsH/pull/1133) supplies conditional projection-fiber/readout criteria; [Enheduanna PR #1594](https://github.com/Satobloc/HsH/pull/1594) supplies a boundary-aware sweep contract under its assumptions; [Kestrel PR #873](https://github.com/Satobloc/HsH/pull/873) supplies a separate finite-core readout result. These PRs remain open/draft/unmerged; prior CI does not establish current-main integration.

No new Lean theorem or build is claimed. \(C,P,C_3,\kappa_1,\kappa_2\), and the measured readout are not source-defined enough for a faithful proposition. Local Lean/Lake/Elan were not installed. No data-free mathematical fixture was invented.

This is an additive operationalization, not a replacement for [Sable's carrier/excitation map](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/sable-h760-carrier-excitation-worldtube-map-20261111t1600z-s0-001.md), [Kestrel issue #1731](https://github.com/Satobloc/HsH/issues/1731), [Mercer issue #1732](https://github.com/Satobloc/HsH/issues/1732), or [Ravel issue #1716](https://github.com/Satobloc/HsH/issues/1716). No P2 system or paper gate was selected or advanced.
