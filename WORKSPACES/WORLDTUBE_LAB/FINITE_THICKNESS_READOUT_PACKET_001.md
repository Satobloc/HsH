> **QUARANTINED — 2026-09-13:** Nathan halted this integration lane after identifying a category failure in its assessment process. This generated artifact is preserved only as history and must not control theory, predictions, papers, or future work. See [quarantine manifest](../../../QUARANTINE/2026-09-13_INTEGRATION_HALT/README.md).

# Finite-Thickness Readout Packet 001

**Date:** 2026-09-12  
**Role:** standard-mathematics discriminator for the finite-core/readout comparison  
**Claim boundary:** local affine readout plus an explicitly modeled blur/kernel; no physical carrier or resolver mechanism is selected.

## Setup

Let \(Y\) be a centered random vector distributed over a declared core/support/boundary fiber, and let

\[
L_\Sigma(y)=y-T\,\frac{n_\Sigma\cdot y}{n_\Sigma\cdot T}
\]

be the transverse linear crossing map from FC-BASE-002. Represent finite resolving thickness, reconstruction blur, or instrumental spread by a centered sheet-coordinate random vector \(Z\). The observed coordinate is

\[
X=L_\Sigma Y+Z.
\]

Assume for the baseline that \(Y\) and \(Z\) are independent and have finite second moments.

## Frozen covariance law

\[
Q_X=L_\Sigma Q_Y L_\Sigma^{\mathsf T}+Q_Z.
\]

This is the covariance-of-independent-sums identity. Consequently, the observed second moment does not by itself identify material/core width separately from resolving width.

More strongly, if only \(Q_X\) is known, every positive-semidefinite matrix \(A\preceq Q_X\) supplies a valid algebraic decomposition

\[
L_\Sigma Q_YL_\Sigma^{\mathsf T}=A,\qquad Q_Z=Q_X-A.
\]

The decomposition is therefore non-unique unless the kernel covariance, the carrier covariance, or another independent constraint is supplied.

For an isotropic scalar-width reduction this becomes

\[
\sigma_{\mathrm{obs}}^2=\sigma_{\mathrm{core,proj}}^2+\sigma_{\mathrm{resolver}}^2.
\]

It is not valid to identify resolver thickness \(\delta\) with core radius \(\epsilon\), or to infer either from \(\sigma_{\mathrm{obs}}\), without a calibrated forward model.

## Higher-moment consequence

Independent cumulants add before normalization. The normalized fourth radial moment \(\chi\) in FC-BASE-002 is therefore not generally preserved by finite-thickness convolution. Its canonical values remain exact for the declared unblurred fiber measures and usable after a proved deconvolution or negligible-kernel limit; they are not direct finite-thickness observables by default.

## Status

- covariance composition and second-moment non-identifiability: STD/DERIVED/FROZEN under the stated affine, centered, independent finite-moment assumptions;
- canonical \(\chi\) under finite blur: OPEN until the kernel and estimator are specified;
- correlated core–resolver interaction, curved sheets, tangency, clipping, and nonlinear reconstruction: OPEN;
- physical carrier, constitutive law, and resolver mechanism: not selected.

If \(Y\) and \(Z\) are correlated, cross-covariance terms enter. That does not restore identifiability without additional structure; it adds unknowns.

## Freeze/use condition

Any empirical finite-core width or moment claim must provide at least one of:

1. an independently calibrated resolver kernel;
2. a controlled family of resolver widths permitting extrapolation;
3. an observable invariant proved insensitive to the admissible kernel class;
4. a coupled forward model whose extra parameters are independently constrained.

## Controlled-thickness extrapolation (FC-BASE-004)

If the resolver kernels form a centered scale family

\[
Z_\delta=\delta Z_1,\qquad Q_{Z_\delta}=\delta^2 Q_{Z_1},
\]

then

\[
Q_{\mathrm{obs}}(\delta)=Q_0+\delta^2Q_K,
\qquad Q_0=L_\Sigma Q_YL_\Sigma^{\mathsf T}.
\]

Thus every covariance component and the trace must be affine in \(\delta^2\). For two settings,

\[
Q_{\mathrm{obs}}(\delta_2)-Q_{\mathrm{obs}}(\delta_1)
=(\delta_2^2-\delta_1^2)Q_K.
\]

A preregistered multi-\(\delta\) experiment can estimate the zero-thickness intercept \(Q_0\) without identifying \(\delta\) with core radius. Systematic non-affinity falsifies this scale-family/linear-independent-kernel model, not necessarily the carrier.

**Status:** the affine-in-\(\delta^2\) law is `STD/DERIVED/FROZEN` conditional on the declared kernel family and FC-BASE-003 assumptions. Existence and controllability of such an H(s)H resolver family remain `OPEN`.

## Exact handoff question

Can the proposed H(s)H resolving wavefront supply an independently measurable kernel or a controlled \(\delta\)-family? If not, width and normalized-moment claims must remain readout-model dependent.
