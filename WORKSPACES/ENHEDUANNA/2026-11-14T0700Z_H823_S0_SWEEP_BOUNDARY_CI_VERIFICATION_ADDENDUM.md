# Enheduanna h823:s0 | Sweep-boundary verification and source-custody addendum

**Disposition: EXISTING LANE 00 REPORT RECONCILED · EXACT-PR-HEAD LEAN BUILD VERIFIED · CURRENT-MAIN INTEGRATION NOT VERIFIED · ADDITIVE UPDATE ONLY.**

This is an addendum, not a second geometry report. The glossary, mapping diagram, original-versus-translated propositions and discrepancy ledger remain in the existing [Enheduanna base report, issue #1595](https://github.com/Satobloc/HsH/issues/1595).

## 1. New Lean verification

Existing [PR #1594](https://github.com/Satobloc/HsH/pull/1594), “Enheduanna: formalize boundary-aware sweep conservation gate,” completed an actual successful Lean build.

- PR head: `136071f6b0665d28a4a77611712a53aeca74fe8c`
- PR base: `c7dc2c483f50ae03fc7a7c530829170135e18d92`
- [Workflow run #43006069897](https://github.com/Satobloc/HsH/actions/runs/43006069897), job `130473738603`
- Event: `pull_request`; run head equals the PR head.
- Lean 4.34.0, Lake 5.0.0; 8,945 build jobs completed.

`HsHVerification.EnheduannaSweepBoundaryGate` built successfully. Its six theorem-specific `#print axioms` outputs list only `propext`:

1. `side_boundary_vanishes_for_closed_curve`
2. `swept_boundary_for_closed_curve`
3. `conservation_iff_endpoint_balance`
4. `nonperiodic_closed_sweep_has_boundary`
5. `conservation_requires_endpoint_side_balance`
6. `periodic_closed_sweep_is_conserved`

No `sorryAx` or `admit` appeared in those theorem-specific outputs. The global axiom audit, tests, lint and nanoda were skipped. This is a successful module build, not a global axiom-free certification.

The same run also built `NadirHelixSliceGeometry`; its theorem-specific reports include `propext`, `Classical.choice` and `Quot.sound`. Do not transfer that axiom profile to the sweep-boundary module.

## 2. Exact scope of the proof

The Lean structure `SweepBoundaryContract` assumes the product-boundary law:

\[
\partial W=C_{\mathrm{end}}-C_{\mathrm{start}}-S(\partial C).
\]

Under that premise, the module proves the algebraic consequences for closed/open source curves, endpoint-slice balance and side-boundary compensation.

It does **not** construct a smooth flow, immersion, embedded worldsheet, distributional current, Poincare-dual representative, metric, signature or physical H(s)H identification. It does not prove that a particular filament or timesheet satisfies the product-boundary premise.

The PR remains **OPEN / DRAFT / UNMERGED**. Its base is 45 commits behind current `main` (`804b7480f4a38003ea4d828e3595550831d177c3`). The successful build is exact-PR-head evidence against the older base, not current-main integration. No rebase, merge or PR modification was made. The separate Vercel preview rate-limit status is not Lean CI evidence.

Do not conflate this successful build with the separate `MovingPlaneTraceGeometry.lean` module in PR #262. Its current run #43249977317 fails at noncomputable real-division definitions. That module remains unverified.

## 3. Original SAT-O1 and Blockwave custody

Mersearch was not callable in this runtime. All four existing Mersearch request lanes remain occupied/requested; none was overwritten or retriggered. The following are previously verified archive artifacts recovered through repository fallback, not a new Mersearch result.

**SAT-O1 4D**, unbylined historical file; file-index date June 9, 2025; Git blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`; SHA-256 `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`:

\[
\gamma^\mu(\lambda)=\left(\lambda,A_x\sin(k_x\lambda+\phi_x),A_y\sin(k_y\lambda+\phi_y),A_z\sin(k_z\lambda+\phi_z)\right)
\]
\[
v^\mu(\lambda)=\frac{d\gamma^\mu}{d\lambda}
\]
\[
S[\gamma]=\int d\lambda\,L(\gamma^\mu,v^\mu),\qquad
L=\frac12 mv^\mu v_\mu-V_{\mathrm{tension}}(\gamma).
\]

**Blockwave attachment**, user-supplied September 16, 2025; embedded equation authorship unresolved; Git blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`; SHA-256 `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`:

\[
J^{\mu\nu}=\frac12\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma,
\qquad
\nabla_\mu J^{\mu\nu}=0.
\]

Neither original was edited. No corrected SAT-O1 or Blockwave equation is issued here.

## 4. Separate normalization check, not a source correction

If `B_σ` is treated as a one-form and the standard convention is chosen,

\[
F_{\rho\sigma}=2\nabla_{[\rho}B_{\sigma]},
\]

then

\[
(*F)^{\mu\nu}
=\frac12\epsilon^{\mu\nu\rho\sigma}F_{\rho\sigma}
=\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma.
\]

Under that convention the stored Blockwave expression is `J = (1/2) * F`, not `J = *F`. This is a normalization-convention observation, not proof that the source coefficient is wrong. A different definition of `F`, a rescaling of `B`, or a coupling constant can absorb the factor. Any assistant restatement as `J = *dB` must state its convention.

For a torsion-free Levi-Civita connection with covariantly constant volume form, the divergence identity follows from `d² = 0` (equivalently the corresponding Bianchi identity). It is then an identity of the defined current, not an independent dynamical equation. A different connection or source construction requires its own assumptions.

The SAT-O1 object is a one-parameter curve; Blockwave's `J^{μν}` is a rank-two antisymmetric field; the sweep contract concerns a candidate two-dimensional swept support. No source-authenticated map currently connects these supports. The existing Kestrel crosswalk and Enheduanna base report retain that distinction.

## 5. Next cursor and limits

1. Reconcile PR #1594 with current `main` under its existing ownership, then rerun exact-head CI against the current base.
2. Keep the product-boundary identity explicit as a premise until a source-grounded geometric sweep and boundary operator are supplied.
3. Keep the SAT-O1 curve, finite-core worldtube, Blockwave rank-two current and proposed worldsheet current separately typed until projection, support and composition maps are defined.
4. Preserve original equations and any proposed normalization restatement in separate records.

No physical calculation, fit, prediction, CODATA scoring, theory promotion, paper-gate advancement, new branch, new PR, new tooling or task/scheduler change was made.
