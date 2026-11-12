# Lean amendment to the :00 geometry-fidelity delta

This amendment records an existing formalization found after the source-fidelity addendum was published. No new Lean file, branch, or PR was created.

## Existing exact-gradient proof

- PR #1135: https://github.com/Satobloc/HsH/pull/1135
- State: open, draft, unmerged.
- Head branch: research/ariadne-scalar-hessian-antisym-20261031t0312z
- Head SHA: af66f06c90d6410b54a9329f8174f35adf6a7f20
- Lean verification run: #41164589389
- Job: #124429317733, success.
- File: FORMAL_VERIFICATION/HsHVerification/ScalarHessianAntisymZero.lean

The file formalizes the conditional chain:

1. A C2 scalar has symmetric second Frechet derivative.
2. With symmetric connection coefficients as an explicit torsion-free coordinate premise, the covariant Hessian's antisymmetric part vanishes.
3. Therefore the local field-strength expression derived from A_mu = alpha_* nabla_mu theta vanishes, and its local contraction with an arbitrary J_mu_nu is zero.

The run executed lake build successfully. The file prints axioms for the scalar-Hessian and coordinate-covariant-Hessian theorems; the observed lists include propext, Classical.choice, Quot.sound, and Lean.ofReduceBool, with no sorryAx in those theorem outputs.

Limits: the theorem assumes C2 regularity and symmetric connection coefficients. It does not derive the connection premise from a physical geometry, establish a global holonomy/winding sector, prove the Blockwave action's source translation, or validate any physical premise. The PR workflow runs lake update and lake build; tests, lint, and a repository-wide axiom audit are not part of this run.

This is the correct proof-first disposition: reuse the existing exact-head formalization, do not create a duplicate theorem PR, and keep the local F=0 result separate from global holonomy and from physical interpretation.