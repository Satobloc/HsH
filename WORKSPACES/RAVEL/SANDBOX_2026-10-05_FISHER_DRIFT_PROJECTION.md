# Ravel sandbox checkpoint — covariance-weighted drift projection

**Status:** STD/DERIVED operator; SAT→H(s)H sandbox translation; not canonical theory and not an empirical detection.

## Exact narrow question

Given crossed calibration and test estimates of a five-bin readout channel, what is the smallest explicit operator that separates drift compatible with the declared common mirror-covariant basis \(\{B,V\}\) from row-local/off-basis drift without discarding the remainder?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT++.txt` — substantial sequential/targeted read: lines 1–260 and 1150–1500 of 7433. Used only for the old construction's typed skeleton: scale × SO(4) action is insufficient for a filament unless the contour parameter is carried; SO(4) rotation needs an explicit generator; an interpretation requires an explicit map. Its numerical constants, lattice claims, particle labels, and example constitutive laws were not imported.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/WORKING_GROUP_1.txt` — full sequential read, lines 1–384. Used for current controls: forward construction before reconciliation, dependency typing, a complete chain through readout and independent test, and a frozen finite-core/readout packet as a non-authoritative dependency.

## Source fact / inference / conjecture boundary

- **Source fact:** the archive itself identifies a missing map/operator between geometric language and observables.
- **Source fact:** the September working-group record requires calibration data, fits, holdouts, derived results, and validation data to remain distinct.
- **Inference:** the previously declared adjacent-bin channel basis must therefore be treated as a fitted tangent model of the readout map, not as the carrier ontology.
- **Sandbox conjecture:** if one finite-core deformation acts through a shared downstream readout channel, crossed channel drift should lie predominantly in the common two-dimensional span; row-specific carrier/readout faults should leave a covariance-significant orthogonal remainder.

## Object and dimensional type

- Calibration and test channels: row-stochastic matrices \(K_c,K_t\in\mathbb R^{5\times5}\).
- Measured drift: \(\Delta=K_t-K_c\), a row-sum-zero channel tangent.
- Declared common post-channel tangent basis:
  \[
  B=-I+\frac{R+L}{2},\qquad V=\frac{R-L}{2},
  \]
  where \(R,L\) shift one reported bin right/left with terminal clamping.
- Design columns: \(G=[\operatorname{vec}(K_cB),\operatorname{vec}(K_cV)]\in\mathbb R^{25\times2}\).

This object is measurement geometry. It does not decide whether the upstream carrier is a bulk core, material support, boundary, or layered object.

## Derivation

For independent row-frequency estimates with labelled counts \(n_{c,r},n_{t,r}\), define

\[
C(p)=\operatorname{diag}(p)-pp^\top,
\qquad
\Sigma_r=\frac{C(\hat p_{c,r})}{n_{c,r}}+
\frac{C(\hat p_{t,r})}{n_{t,r}}.
\]

Let \(W=\bigoplus_r\Sigma_r^+\), using the Moore–Penrose inverse on the observable multinomial tangent. The generalized least-squares common-channel coordinates are

\[
\hat\theta=
\begin{pmatrix}\hat b\\\hat v\end{pmatrix}
=(G^\top WG)^+G^\top W\operatorname{vec}(\Delta).
\]

The preserved off-basis component and its statistic are

\[
R_\perp=\Delta-K_c(\hat bB+\hat vV),
\qquad
T_\perp=\operatorname{vec}(R_\perp)^\top W\operatorname{vec}(R_\perp).
\]

The candidate common channel is physically admissible only if \(|\hat v|\leq\hat b\leq1\). An unconstrained estimate outside this cone is itself a model-failure flag; it must not be silently clipped and called a fit.

## Structured-zero correction

The nominal matrix is sparse. Therefore the familiar interior-multinomial count of \(5(5-1)-2=18\) residual degrees of freedom is not automatically available. The observable local rank is

\[
d_{\rm obs}=\sum_r\operatorname{rank}(\Sigma_r),\qquad
d_\perp=d_{\rm obs}-\operatorname{rank}(G^\top WG).
\]

For a drift confined to the nominal adjacent support, the synthetic fixture gives \(d_{\rm obs}=8\) and \(d_\perp=6\). A common channel that opens additional reported bins gives \(d_{\rm obs}=14\) and \(d_\perp=12\). Hence a fixed \(\chi^2_{18}\) reference would be a type error at this boundary. The null law must be calibrated by parametric bootstrap from the fitted common-channel model with the actual row counts.

## Synthetic discriminator results

No empirical observable was used as a target. Exact synthetic fixtures test the operator:

| Fixture | recovered \((\hat b,\hat v)\) | Fisher-weighted fraction explained | residual rank | cone status |
|---|---:|---:|---:|---|
| common \((0.001,0.0003)\) | \((0.0010000,0.0003000)\) | 100.000% | 12 | admissible |
| terminal row-0 leak | \((1.19877,1.20026)\times10^{-4}\) | 24.885% | 6 | outside by \(1.49\times10^{-7}\) |
| interior row-2 leak | \((1.21159,0)\times10^{-4}\) | 24.690% | 6 | admissible but strongly incomplete |
| common + terminal leak | \((0.00110006,0.00039999)\) | 94.927% | 12 | admissible; nonzero remainder retained |

The common fixture is recovered to numerical precision. Equal-scale row-local leakage projects only about one quarter into the common span, so the remainder distinguishes “shared deformation” from “one-row readout fault.” The mixture shows why the residual must be reported even when the common fit looks excellent.

## Surviving covariance/invariant

Under mirror relabelling \(M(A)=JAJ\), the calculation gives

\[
\hat b\mapsto\hat b,\qquad
\hat v\mapsto-\hat v,\qquad
T_\perp\mapsto T_\perp.
\]

All synthetic checks satisfy these identities within \(5\times10^{-19}\) in residual norm and \(4\times10^{-17}\) in fitted coordinates. Thus the sign of \(v\) is parity-covariant, while the residual norm is relabelling-invariant.

## Candidate-family comparison

- **Single shared post-readout channel:** predicts \(R_\perp\) consistent with bootstrap noise; it cannot by itself identify bulk/support/boundary carrier geometry.
- **Row-local support/boundary defect:** generically leaves \(R_\perp\neq0\), even when part of the fault aliases into \((b,v)\).
- **Layered architecture:** naturally contains both: a shared downstream \((b,v)\) coordinate plus upstream row-local residual modes. This is currently the least lossy representation.

## Failure condition

The operator fails as a two-coordinate identifier if \(G^\top WG\) loses rank. Its standard \(\chi^2\) calibration fails at structural-zero or stochastic-cone boundaries. The common-channel hypothesis fails when bootstrap-calibrated \(T_\perp\) rejects, or when the unconstrained fit lies outside \(|v|\le b\le1\).

## Exact next test

Insert the actual crossed count tensors \(N_{c,rj},N_{t,rj}\), fit \((b,v)\), and parametric-bootstrap \(T_\perp\) under the fitted common channel while preserving the measured row allocations. Report \((\hat b,\hat v)\), cone status, observable/residual ranks, \(T_\perp\), bootstrap \(p\)-value, and the full signed \(R_\perp\) matrix. Do not disclose or use any target scale while fitting.

## Artifacts

- `fisher_drift_projection.py`
- `fisher_drift_projection.json`
- `fisher_drift_projection.svg`
- `fisher_drift_projection.png`

