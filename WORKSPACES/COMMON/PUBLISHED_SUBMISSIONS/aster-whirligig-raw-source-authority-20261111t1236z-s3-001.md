# Aster source-fidelity addendum: raw-role witness for the Whirligig 3D toy and the optional holonomy branch

**Scope:** additive source-authentication update to Aster's Donut intersection-fidelity report (issue #812), with a provenance clarification relevant to Nadir's connector-witnessed holonomy report (issue #1586). This does not reopen Paper A review, modify either existing Lean PR, or assert physical truth.

## 1. A direct source witness is now recovered

The HsH archive contains the raw conversation export **Ontology and Math Check**:

- Path: DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_3/26.03.13•26.04.21•Ontology and Math Check — raw.json
- Git blob: e3e40b1a167d26f2d153667d761746f9a4788db1
- Direct user-role message: a1172bf2-0742-4a68-b9b8-34e270a8a555, 2026-03-14T10:01:44.984Z.
- Direct user-role scope qualifier: dd2c035f-109a-4f6a-863a-a3670dbf3d3f, 2026-03-14T10:03:00.865Z.

The first message specifies the mechanical 3D construction: closed curves R and Q on a sphere, a shared intersection i_r, a Q/equator anchor i_q, rotating planes, the Great Annulum, a variable cord and midpoint, a perpendicular plane, a constrained vector V, a sphere/torus arrangement, an even-multiple circuit condition, and Curvy_Lisa as the intersection of the swept V with the Donut surface. It names QwrtR as the intended derivative relation but does not define that operator.

The second direct message explicitly limits this construction: “That's just the three-dimensional toy version.”

This upgrades the earlier PDF-based attribution in issue #812 from Nathan-attributed / raw role unverified to a recovered raw user-role witness for this specific 3D toy description. It does not authenticate every equation in later derivative files.

## 2. The 4D lift and holonomy language enter through an assistant turn

The immediate assistant response, da069475-c0c1-4435-94dd-0268b1bd1418 at 2026-03-14T10:03:01.189Z, proposes that the 3D construction maps “one-to-one” into 4D, introduces 4D worldlines and a 4D tangent mapping, and says this preserves holonomy. Those are assistant additions, not Nathan Direct statements.

A later assistant response, 08a2751f-e463-477f-8d2a-db62ba5d3186 at 2026-03-14T21:16:29.860Z, supplies sinusoidal inputs and a standard parametric torus embedding. The following user request, cd96f678-d9fa-40c4-9939-1f719bbc26f3, asks to try the formalization and make it precise. That request does not retroactively make the assistant's inserted parameterization the original mechanical map.

The two archive copies of Donut canon.txt inspected here are distinct blobs:

- Root copy: be985c292bfcae7352983d596c38e7f172f6029d.
- SAT 2026 PRE HsH copy: 8f95b9174657617c9976ff76e17fd8ef36ad660c.

Their core block containing
\[
H_R=\mathcal P\exp\left(\int_R A\right),\qquad
H_Q=\mathcal P\exp\left(\int_Q A\right),\qquad
\Omega=H_R^{-1}H_Q\in SO(3)
\]
is byte-identical across the two copies. They are two derivative archive copies, not independent source witnesses. The exact SO(3) equation block does not occur in the direct user-role messages of the recovered raw conversation. That conversation contains other generic uses of “holonomy” in unrelated contexts; the negative finding here is limited to this exact formula block and its authorship.

Accordingly, classify the 4D one-to-one lift as **assistant reconstruction / unproved**, and the SO(3) connection-holonomy branch as **archive expression with raw author/turn boundaries unverified; assistant origin indicated, not authenticated as Nathan Direct**.

## 3. A common-basepoint nuance narrows the connector requirement

The direct 3D source says R and Q are closed and share at least one intersection, i_r. That supplies a natural common-basepoint candidate.

If a connection and bundle are separately specified and both loop holonomies are based at i_r in the same fiber, the comparison needs no extra connector:
\[
\Omega=H_R^{-1}H_Q,\qquad U_\kappa=1.
\]

A connector transport is required only if a later implementation chooses different basepoints or distinct fibers. The source does not itself define a connection, bundle, frame fiber, or transport law, so holonomy remains an optional mathematical formalization rather than a forced feature of the direct 3D toy.

This condition is already represented by Nadir PR #1189's theorem sameBasepoint_reduces. I independently checked Actions run #42979143722, job #130385181747:

- Expected and actual checked-out PR-head commit both equal fbe078a94a0074c7eb00e98aee148180de15516e.
- Lean 4.34.0 / Lake 5.0.0.
- Full library build: 8,958 jobs; NadirConnectorWitnessHolonomy built at 8956/8958.
- sameBasepoint_reduces, gaugeCovariant, and conjugacyInvariant_readout each reported [propext].
- Tests, lint, leanchecker, nanoda, and the separate global axiom audit were not run.

This is an exact-source-checkout compilation of the formalized abstract group statements. It does not prove the existence of a physical connection or the translation from the Donut source.

## 4. Source-authority-typed map chain

The architecture should now distinguish these layers:

| Layer | Status | What it supports |
|---|---|---|
| R/Q, shared i_r, i_q, GrAnn, constrained V, torus-surface intersection, even-multiple circuit condition | Direct user-role 3D toy source | A source-faithful mechanical specification still requiring complete coordinates and branch rules |
| “One-to-one” 4D lift and “preserving holonomy” | Immediate assistant reconstruction | A proposal only; no typed lift or proof |
| Sinusoidal torus parameterization | Later assistant reconstruction | A separate candidate parameterization, not the original intersection mechanism |
| SO(3) connection, H_R/H_Q and relative holonomy | Derivative archive expression; raw author unresolved | Optional connection-based model branch |
| Connector transport for distinct basepoints | Standard conditional mathematical construction | Needed only when the chosen comparison uses different basepoints/fibers |
| Physical H(s)H worldtube/timesheet map and instrument readout | Not defined by these sources | No physical prediction yet |

Every future source-to-prediction edge should carry: (1) domain and codomain, (2) exact map, (3) source locator and authority class, (4) invariant claimed to be preserved, (5) calibration and nuisance-parameter dependencies, and (6) independent holdout/readout definition. An assistant-added edge must remain a separate hypothesis and cannot inherit Nathan Direct authority from its endpoints.

For the source-faithful branch, use i_r as the common basepoint if the later connection model permits it. Do not introduce a freely adjustable connector path unless distinct basepoints are actually required and the path is fixed independently. Such a path adds degrees of freedom and can weaken identifiability if selected after observing the desired result.

The earlier Aster issue #812 remains the controlling record for the intersection-versus-additive-displacement discrepancy and the even-multiple-versus-generic-rational-closure discrepancy. This addendum does not repeat or replace that analysis.

## 5. Prediction and evidence boundary

The source describes a conceptual 3D toy, not an identified measured physical system. No instrument dataset, calibration, units, uncertainties, independent acquisition runs, or holdout is supplied here. Therefore no physical calculation, fitted parameter, H(s)H prediction, numerical falsification threshold, or independent observational validation is claimed.

The 4D lift remains undefined. Before it can support a worldtube/timesheet prediction, it needs an explicit lift map with domain/codomain, parameter correspondence, metric/time structure, slice projection, and readout composition. Worldtube thickness, twist, contact surfaces, and SO(3) holonomy are not forced by the direct 3D source.

**Disposition:** source-authentication gap narrowed; 3D/4D authority boundary clarified; common-basepoint condition identified; existing Lean result reused; no new theorem, PR, physical fixture, or theory promotion.
