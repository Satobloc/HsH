# Loom h840:s0 — O0-A Mode 2 curvature bridge: source fidelity and type gate

**Status:** SOURCE_FIDELITY_ADDENDUM_COMPLETE / CURVATURE_BRIDGE_UNDEFINED / FORMALIZATION_BLOCKED_BY_SOURCE_DEFINITIONS / NO_PHYSICAL_VALIDATION.

This is an additive crosswalk, not a replacement for the existing Loom O0-A state-space/map contract. The new question is narrower: can the June 2025 O0-A Mode 2 quantity \(\langle K\rangle\) be identified with the later D4 strain tensor \(S_{\mu\nu}\), its Ricci response, or a standard GR curvature observable? The inspected sources do not yet define the maps needed to do so.

## 1. Scope, non-duplication, and source status

The existing Loom O0-A ledger already records the three-mode description, its proposed state spaces, and the missing inheritance maps. The Sable timewave crosswalk already distinguishes the O0-A mode ladder from the separate continuous allocation of dynamics between a filament and a time surface. The Nadir EQ-0007 report already audits the D4 Ricci expression. This addendum does not repeat those audits. It connects the O0-A Mode 2 curvature target to the D4 strain/curvature equation chain and checks the types required for that connection.

| Source | Status and custody | Use here |
|---|---|---|
| SAT BIG PAPER, June 2025 | Bylined Nathan historical document. Archive-recorded PDF SHA-256: d13d32109ca32b15dabd5e8d4084995d3a36f9e8ab8a5dcac45ae2f150a9a1d9. Extracted-text blob: 69b0085c86f6c4876aacc0556243dd2fccdc0aef. | Primary historical statement of O0-A Modes 1–3 and Mode 2’s \(\langle K\rangle\) target. |
| Module_0A_interpretive_modes.tex | Author/date fields blank; archive ingestion recorded 2026-09-04; blob 2238dbe4447276b60e53f202153527585e16e5c5. | Derivative source only; not silently backdated to June 2025. |
| SAT4D_8.txt | Historical July 2025 source; blob 6a1ef773c40f805aace5fd61e3584ba50c21241d; author not authenticated in the inspected record. | Distinct Mode 2/3 variant. |
| CODE-LOCKED DERIVS.txt | Historical equation artifact; commit d3f5fa0223f66a2d2b74c2beca7c6b262b616bdc, 2025-10-27T01:15:21Z; blob 783b05d39d59bf854b92090e15d205e6823b51c8. Embedded authorship is not established by the file alone. | D4 strain, induced-metric, and Ricci-response equations. |
| Nadir EQ-0007 D4 curvature audit | Assistant/researcher analysis dated 2026-10-23; blob 7552c4df9c9838ee552ee4cc91f116e3cb18c497. | Existing symbolic counterexample, dimensional/rank checks, and corrected linearized-Ricci expression. |
| 2026-02-23 raw conversation | Raw role-tagged user message 0fc22772-0f00-4052-846e-052f05d5065a, timestamp 2026-02-23T12:57:36.902Z. | Direct model/ontology qualification. |
| FIE, 2026-02-26 | Historical document, page 6, lines 174–182. | Distinguishes a useful geometric map from the additional leap of treating it as physical reality. |
| 2026-11-08 methodology record | Assistant-prepared transcription of a Nathan Direct position; no immutable raw message UUID in the inspected record. | Current operational clarification: 4D realism is a formalism, not an ontological requirement; worldtube and timesheet are the working minimal pair. |
| 2026-11-05 equivalence clarification | Reported as Nathan Direct in Ariadne’s source report; raw message locator was not recovered here. | Retained as a reported intended representational equivalence, not independently re-authenticated. |
| Current 2026-11-14 instruction | Direct user instruction. | Treat equivalences as test hypotheses; require explicit projection/composition maps; do not promote theory without review. |

The 2026-02-23 user message explicitly says a worldline construction can function as a model without having to possess physical reality. The FIE passage separately calls the move from a useful map to physical reality a major additional step. These are not claims that the model is false; they constrain what may be inferred from its usefulness.

## 2. Geometry and equation cluster

### 2.1 O0-A Mode 2

The June 2025 Big Paper calls Mode 2 **Triggered Dynamics**. Its stated sequence is:

1. The three-dimensional resolving surface \(\Sigma_t\) passes through the four-dimensional construction.
2. Its passage triggers local changes in filament parameters.
3. The emerging three-geometry is intended to match Einstein curvature to first order.
4. The text says \(\langle K\rangle\) is pegged to GR and that minimal filament adjustments are back-solved.

The document does not define, in this passage, the tensor type of \(K\), the averaging domain or measure, the GR target component, or the update functional that produces the filament adjustments.

### 2.2 July 2025 Mode 2 variant

SAT4D_8 calls Mode 2 **Semi-Dynamic Block**. It describes localized, constrained adjustments at high strain or entanglement and mentions possible modeling of collapse, decoherence, or entropy. Its use is restricted to non-core derivations or simulations.

This is not identical wording for the June Mode 2. The June source foregrounds first-order GR-curvature matching through \(\langle K\rangle\); the July source foregrounds a high-strain/entanglement trigger and a scope restriction. They may be compatible, but the trigger-to-curvature map is not supplied. Matching ordinal labels do not establish semantic identity.

The corresponding Mode 3 labels also differ: June **Crystallisation** describes a completed history with \(\Sigma_t\) reduced to an ordering label; July **Solidification Front** uses more explicit physical crystallization/decoherence-front language and prohibits that mode in falsifiability-grounded SAT.O modules. The current formalism/ontology qualification prevents treating the July physical phrasing as an automatic current ontological commitment.

### 2.3 D4 strain and curvature chain

The historical D4 artifact defines the symmetric derivative:

\[
S_{\mu\nu}=\nabla_\mu u_\nu+\nabla_\nu u_\mu.
\]

It also proposes an ensemble-induced metric:

\[
\widetilde g_{\mu\nu}=\langle v_\mu v_\nu\rangle_F,
\qquad
g_{\mu\nu}=(\widetilde g_{\mu\nu})^{-1}.
\]

The printed Ricci-response expression is:

\[
\delta R_{\mu\nu}
=
\nabla^\rho\nabla_{(\mu}S_{\nu)\rho}
-\frac12\nabla_\mu\nabla_\nu S^\rho{}_\rho
-\frac12 g_{\mu\nu}\nabla^2 S^\rho{}_\rho.
\]

The source presents \(S_{\mu\nu}\) as a strain-like object and relates it to a metric perturbation, but the scale and full geometric typing of that relation are not supplied.

The existing Nadir EQ-0007 audit found that the printed Ricci operator fails a transverse symbolic test. Its separately labeled flat-background correction, for a metric perturbation \(h_{\mu\nu}\), is:

\[
\delta R_{\mu\nu}
=
\frac12\left(
\partial^\rho\partial_\mu h_{\nu\rho}
+\partial^\rho\partial_\nu h_{\mu\rho}
-\Box h_{\mu\nu}
-\partial_\mu\partial_\nu h
\right),
\qquad h=\eta^{\rho\sigma}h_{\rho\sigma}.
\]

This corrected expression is not the historical D4 equation and must not be written back over it. It is a standard linearized-Ricci reconstruction. The Nadir test is a symbolic algebraic counterexample/check, not an observational validation or a measured gravitational result.

## 3. Typed map diagram

The proposed bridge currently has two disconnected branches:

~~~text
O0-A Mode 2 (June 2025)

  Σ_t passage
      |
      ?  trigger/update functional
      v
  local filament-parameter changes Δp_i
      |
      ?  induced-geometry construction
      v
  emerging 3-geometry
      |
      ?  define K, domain, measure, averaging
      v
  <K>
      |
      ?  identify the GR target and comparison map
      v
  first-order GR-curvature match


D4 historical equation chain

  Σ_t + u^μ
      |
      v
  S_{μν} = ∇_μ u_ν + ∇_ν u_μ
      |                         |
      | ? hypersurface          | ? dimensionally typed
      |   projection/pullback   |   metric-perturbation map
      v                         v
  K_{ij}                    δg_{μν} = ℓ S_{μν}  (candidate)
      |                         |
      ? trace/average            v
      v                       δΓ
  <K>                           |
                                v
                             δR_{μν}
~~~

Every question mark is a missing source-defined map, not a claim that the map cannot exist.

## 4. Conditional standard-geometry bridge (assistant reconstruction)

A possible bridge can be stated conditionally, but it is not present as a complete construction in the inspected sources.

Let \(e_i{}^\mu\) be tangent vectors to \(\Sigma_t\), let \(u^\mu\) be a unit normal, and let \(h_i{}^\mu\) denote the corresponding tangent projection. With a declared sign convention, define

\[
K_{ij}=e_i{}^\mu e_j{}^\nu\nabla_\mu u_\nu.
\]

If \(u^\mu\) is hypersurface-orthogonal and the projected second fundamental form is symmetric, then

\[
e_i{}^\mu e_j{}^\nu S_{\mu\nu}=2K_{ij}
\]

up to the chosen sign convention. A mean curvature could then be defined by

\[
K=h^{ij}K_{ij}.
\]

But \(\langle K\rangle\) still requires an explicit averaging domain, measure, weighting, and normalization. It might be a spatial average, a filament-weighted average, or something else; none is selected by the source.

Further, \(K\) is not the four-dimensional Ricci tensor. Relating the intrinsic geometry of \(\Sigma_t\), its extrinsic curvature, and the ambient four-dimensional curvature requires the Gauss–Codazzi relations and the full induced metric and second fundamental form. A scalar mean curvature alone does not determine the full three-geometry or \(R_{\mu\nu}^{(4)}\).

The D4 source's \(S_{\mu\nu}\) is four-dimensional. The candidate \(K_{ij}\) is a projected tensor on the three-dimensional hypersurface. The pullback/projection is therefore essential.

## 5. Dimensional and algebraic gates

1. **Mean curvature versus Ricci curvature.** If \(K\) means mean/extrinsic curvature, its dimension is \(L^{-1}\). A Ricci tensor or scalar curvature has dimension \(L^{-2}\). “\(\langle K\rangle\) pegged to GR” must identify a GR quantity of matching type and dimension, or supply a length scale/derivative relation. Direct equality to an unspecified Ricci object is not typed.
2. **Strain versus metric perturbation.** With dimensionless \(u^\mu\) and length-valued coordinates, \(S_{\mu\nu}\) has dimension \(L^{-1}\), whereas \(\delta g_{\mu\nu}\) is dimensionless. The relation \(\delta g\sim S\) needs a scale such as \(\ell S\), or an explicitly different coordinate/unit convention.
3. **Projection is missing.** The unprojected \(S_{\mu\nu}\) is not automatically the hypersurface extrinsic-curvature tensor. A tangent projector, induced metric, normal normalization, and sign convention are required.
4. **Averaging is missing.** The brackets in \(\langle K\rangle\) have no defined domain, measure, weighting, or time dependence in the inspected Mode 2 passage.
5. **The update law is missing.** “Minimal filament tweaks are back-solved” requires an objective functional, admissible parameter set, constraints, and a map from curvature residual to \(\Delta p_i\).
6. **The D4 Ricci expression is defective as printed.** The Nadir EQ-0007 symbolic test distinguishes it from the corrected flat-background linearized-Ricci operator. The correction remains separate from the original.
7. **The induced metric may be singular.** \(\widetilde g_{\mu\nu}=\langle v_\mu v_\nu\rangle_F\) is Gram/covariance-like. Its inverse requires full rank; a rank-three ensemble is singular. The existing Nadir audit records this check.
8. **Stress-energy typing remains incomplete.** The D4 historical expression for \(T_{\mu\nu}\) does not, by itself, supply a fully typed conserved rank-two tensor.
9. **Mode 2 version drift remains open.** June's GR-curvature-matching trigger and July's high-strain/entanglement trigger are not yet joined by a source-defined map.
10. **Current primitives are not silently substituted.** The 2026 working model uses worldtube and timesheet as its minimal pair. A one-dimensional historical filament and a finite-core worldtube are not interchangeable without an explicit thickening/representation map.

## 6. Original versus translated propositions

| Proposition | Classification | Disposition |
|---|---|---|
| Mode 2 uses \(\Sigma_t\)-triggered local filament changes and targets first-order GR curvature through \(\langle K\rangle\). | Historical bylined June 2025 document. | Preserved; \(K\), averaging, target, and update law remain undefined. |
| Mode 2 is a localized high-strain/entanglement response with restricted use. | Historical July 2025 document. | Preserved as a separate variant, not silently merged with June. |
| \(S_{\mu\nu}\) is the symmetrized derivative of \(u_\mu\). | Historical D4 equation artifact. | Preserved verbatim. |
| \(S_{\mu\nu}\) projects to twice the extrinsic curvature. | Standard conditional reconstruction. | Plausible only with unit normal, hypersurface orthogonality, projection, and sign conventions. Not Nathan Direct. |
| \(\langle K\rangle\) is the GR curvature target. | Historical O0-A wording. | Not yet typed; do not identify it with \(R_{\mu\nu}\) or \({}^{(3)}R\) without a definition. |
| The printed D4 Ricci equation is the correct linearized operator. | Historical D4 equation. | Fails the existing Nadir symbolic test; corrected equation remains separately labeled. |
| The mode formulations are equivalent representations of one construction. | Reported as a 2026-11-05 Nathan Direct clarification, but raw message not recovered in this pass. | Retained as an intended equivalence claim; current instruction requires treating it as a test hypothesis. |

## 7. Formalization status

**No new Lean module or PR was created. No new Lean run is claimed.**

The local runtime has no lean, lake, or elan executable. The source-specific theorem is not yet faithfully expressible because the source has not fixed the types and definitions of \(K\), \(\langle K\rangle\), the hypersurface projection, the averaging measure, the Mode 2 update map, or the GR target.

Existing formalization evidence was checked rather than duplicated:

- Kestrel PR #873 contains generic projection/fiber-factorization and intersection-dimension work. Its recorded merge-reference build #43202552666 succeeded at 8,957 targets, but the PR base was recorded 18,069 commits behind current main. Current-main integration is not verified.
- That generic theorem can express a condition for a deterministic observable to descend through a projection: the target must be constant on each projection fiber. It does not instantiate the O0-A/D4 curvature bridge.
- The Nadir EQ-0007 report records its D4 symbolic checks and says Lean CI was pending. No later D4-specific Lean run was found in the inspected current work record.

A future source-faithful Lean target, after definitions are supplied, is the conditional projected identity between \(S_{\mu\nu}\) and \(K_{ij}\), followed by a typed definition of the averaging/readout map. This would prove only the formalized conditional statement, not the truth of the physical premises or the fidelity of an invented translation.

## 8. Loom role, controls, and next cursor

The historical Loom source is the raw “Tag Conversation Corpus” conversation 6aa67478-541c-83e9-b8fa-32d6d575eeb9, blob 6668ca60e451f8737903423727da7f9a430484e1, with ten user-role messages. It establishes cumulative corpus tagging, source chronology, terminology crosswalks, correction tracking, and preservation of source/role distinctions. No separate signed specialist charter was found. The earlier h593 role-attribution error assigning Meridian's geometric-formalization remit to Loom was corrected by its existing Amendment 01. This h840 Lane 00 assignment is a one-run allocation and does not change Loom's continuing role.

The next research cursor is:

1. Recover the primary source/message that defines \(K\), \(\langle K\rangle\), and the Mode 2 back-solve.
2. Identify whether \(K\) is mean extrinsic curvature, intrinsic scalar curvature, a projected component, or another object.
3. Specify \(\Sigma_t\), \(u^\mu\), the induced metric, tangent projector, sign convention, averaging measure, and domain.
4. Define the dimensional map from \(S_{\mu\nu}\) to \(\delta g_{\mu\nu}\), and keep the corrected Ricci operator separate from the historical expression.
5. Define the Mode 2 trigger and optimization/update functional.
6. Only then test the June/July Mode 2 correspondence and instantiate Lean.

No physical system or measured dataset was selected. No physical calculation, fit, prediction, independent measurement, CODATA comparison, paper-gate advancement, or BEDROCK theory promotion was performed. Math Hopper, existing Lean PRs, Whirligig, and connected SciSpace were checked as existing resources; no new tooling, dependency, fork, subscription, or expense was introduced. Mersearch had no callable action in this runtime; the four shared request lanes remain occupied/requested, so bounded GitHub retrieval is not represented as a Mersearch run. HSH_RESOURCES root/start documentation was read, but its private research payload was not opened.

P0 remains ACTIVE. P1 November 9 remains OVERDUE / NOT READY, Orson-owned. P2 November 30 remains HOLD. P3 December 14 remains INCOMPLETE. FIE next full review remains November 24; the 14-day threshold has not arrived.

Unrelated reading completed from Loom's existing cursor: fun break - lx.txt, lines 1641–1680. Next cursor: line 1681. This was lateral reading, not a physical break.

No task graph, P0 ownership, paper gate, scheduler, task ID, schedule, phase, cadence, or enabled state was changed. No sixth task, signet, or conversation rename. No successor handoff was created because no actionable dependency requires Aster to take ownership. No authenticated current Loom thread or cross-thread delivery is claimed.

**Classification:** LOOM_H840_S0 / O0A_MODE2_D4_CURVATURE_BRIDGE / SOURCE_FIDELITY_ADDENDUM / CURVATURE_MAP_UNDEFINED / FORMALIZATION_BLOCKED_BY_SOURCE_DEFINITIONS / NO_PHYSICAL_CALCULATION / NO_CODATA / NO_THEORY_PROMOTION.
