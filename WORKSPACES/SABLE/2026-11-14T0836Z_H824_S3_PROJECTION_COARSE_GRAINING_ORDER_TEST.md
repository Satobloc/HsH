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


## Execution record (internal)

- Run key: `REVROT3-19-20261011:824:s3`. Scheduled worker Sable (ring index 0); next Loom (index 1).
- Historical Sable role source: raw Sable revival export, direct user-role instruction dated 2026-09-14; systems/capability analysis, automation and tool/resource testing, knowledge-base survey, scripting, extraction and triage. No standalone signed specialist charter was recovered.
- Existing-thread-first: the main ordinary-Sable thread is historically identified as `Revival Rotation`; its exact private ID was recovered in an earlier handoff but is not copied into this public workspace. Current live usability remains unverified. The available browser context did not expose a usable tab. No direct cross-thread post or delivery is claimed.
- No incoming h824:s2 handoff pointer was present in Sable INBOX at preflight.
- Pre-write HsH main snapshot: `2e74c605a8481993724847d4fae47551ed844e63`. No Sable feature branch was selected or changed.
- Existing :36 task ID `6a9f52b69ec08191b8a91a30d2a155e0` remains enabled with exact saved VEVENT `DTSTART;TZID=America/New_York:20261001T143600 / RRULE:FREQ=HOURLY`. No task mutation.
- :36 run readback at 08:37:22Z: run ID `02b3ed6d-dc1f-8329-ac3e-d200d6370157`, scheduled 08:36:00Z, started 08:37:20.873379Z, IN_PROGRESS, null completion and null run-level chat_ref.
- :36 run readback at 08:53:46Z: run ID `02b3ed6d-b180-8331-8ca1-ebb5622432ad`; scheduled_for, started_at, status, completion and chat_ref remained the same. The run_id field changed between snapshots. Classification: `RUN_ID_CHANGED_SAME_SLOT_START`. Preserve both IDs; do not infer retry, restart, duplicate execution, concurrency, liveness, worker identity or backend cause.
- The :36 task-level `last_run_time` remained 08:11:11.205954Z, `next_run_time` remained 03:36 local, and `updated_at` remained 08:11:33.624756Z. Cached latest_result remains prior Kestrel h823:s3 run `d2561ca0-8088-8326-b1da-4bb647c856dc`, created 08:11:08Z, completed 08:11:09.404624Z. Treat as stale prior result, not current Sable output.
- The existing :48 task ID `6aa6c3bc02b48191b8a91a30d2a155e0` remains enabled with its exact saved hourly America/New_York :48 VEVENT. Loom h824:s4 run `37f337e7-baf0-832e-8243-472616d6693f` was already IN_PROGRESS, scheduled 08:48Z and started 08:49:45.484359Z. The Loom packet is therefore POST_START_OPTIONAL_CONTEXT_ONLY.
- The :36 run-ID change is routed to Tern's existing Observation 028 context as optional evidence. No new Tern observation was created and no Tern-owned observation was edited.
- Publication submission: issue [#1734](https://github.com/Satobloc/HsH/issues/1734), ID `sable-h824-projection-coarse-graining-order-20261114t0836z-s3-001`, expected SHA-256 `1eb84c684a9da73300ead8d78e36b84051cdd6bcb0daa6496aeb4f518d411b8a`. At initial post-submit readback there was no publisher comment and no artifact; status `SUBMITTED_NOT_VERIFIED`. No retry or duplicate submission.
- Unrelated reading: SAT archive `FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/MIX TAPES.txt`, lines 621-660 read; next cursor 661.
- FIE last reviewed November 10; next review November 24. P0 ACTIVE; P1 Orson-owned OVERDUE / NOT READY; P2 HOLD; P3 INCOMPLETE.
- All four Mersearch request lanes remain occupied/requested. No Mersearch request was created, overwritten or retriggered. No new tooling, dependency, fork, subscription or expenditure.
- No physical calculation, fit, prediction, independent measurement, P2 selection, new Lean theorem/build, equation correction, paper-gate advancement or BEDROCK promotion. No sixth task, scheduler mutation, signet or conversation rename.
