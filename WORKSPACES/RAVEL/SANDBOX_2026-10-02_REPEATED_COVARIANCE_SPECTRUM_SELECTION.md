# Ravel sandbox checkpoint — repeated-covariance relaxation-spectrum selection

Status: **sandbox candidate, not canonical theory**.

## Narrow question

Does the discrete two-relaxation-channel result survive when the complex-pole covariance is estimated from repeated measurements, and when the rival is a positive continuous relaxation band rather than only a one-pole reduction?

## Sources actually read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H Dev +/H(s)H NOTATION.txt` — full sequential fetch/read (connector display truncated after retrieval). This historical notation exercise enumerates six 4D rotation planes, handed variants, expansion labels, and large combinatoric state matrices. It supplies no noise, likelihood, or constitutive law. Retained motif: state labels must be typed consistently; combinatorial representational capacity is not evidence that every label is dynamically load-bearing. Historical cosmology, shell assignments, and symbolic clusters were not imported.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_105_EXACT_FINITE_SLAB_FOLD_UNIQUENESS.md` — full sequential read. It proves that one inverse observable can leave two branches and that a fold causes local rank loss; global uniqueness requires branch information or an independent observable. Used only as an inverse-problem method analogue.
- Google Drive targeted searches for repeated-pole covariance and positive relaxation spectra — no relevant internal construction found. One unrelated conversation spreadsheet surfaced and was not used.
- Slack targeted collision search after construction — found the immediately preceding memory-tomography and correlated-likelihood checkpoints, but no earlier repeat-estimated covariance or continuous-band comparison.

## Construction

The injected model remains

\[
D_2(z;a)=a^{-2}-z^2-iz\sum_{j=1}^2
\frac{A_{0j}a^q}{1-iz\tau_j}=0,
\]

with

\[
q=2.4,\quad
(\tau_1,\tau_2)=(0.25,2.0),\quad
(A_{01},A_{02})=(0.012,0.008).
\]

At each of 41 radii, 96 repeated complex-pole vectors were generated with relative single-repeat noise \(3\times10^{-4}\), radius correlation \(\rho=0.75\), and same-radius real/imaginary correlation \(\eta=0.35\). The full \(82\times82\) covariance was then estimated from repeats using standardized Ledoit–Wolf shrinkage; the fitting code received only the repeat mean and estimated covariance.

Three candidate response families were frozen before scoring:

1. one discrete pole;
2. two discrete poles;
3. one positive continuous log-normal band,

\[
\rho(\ln\tau)=
\frac{A}{\sqrt{2\pi}\sigma}
\exp\!\left[-\frac{(\ln\tau-\ln\tau_0)^2}{2\sigma^2}\right].
\]

The band response is

\[
M_{\rm band}(z)=
\int_0^\infty
\frac{\rho(\ln\tau)}{1-iz\tau}\,d\ln\tau.
\]

It is a specific single-band continuum, not an arbitrary positive spectral density.

All candidates use the same observable reality closure,

\[
g_i(\theta)=\operatorname{Im}\left[
z_i^2+iz_i a_i^qM(z_i;\theta)
\right],
\]

with propagated covariance

\[
C_g=JC_{\bar z}J^T,\qquad
C_{\bar z}=\widehat C_z/96.
\]

Five interleaved interior-radius folds were scored by the correlated conditional predictive likelihood

\[
-2\log p(g_*|g_T,\theta)=
(g_*-\mu_{*|T})^TS_{*|T}^{-1}(g_*-\mu_{*|T})
+\log\det S_{*|T}+n_*\log(2\pi).
\]

The multistart grid deliberately excluded the injected two-pole parameter vector.

## Result

Covariance estimation was imperfect but usable:

\[
\lambda_{\rm shrink}=0.2377,
\qquad
\frac{\|\widehat C_z-C_z\|_F}{\|C_z\|_F}=0.2473.
\]

The median recovered adjacent-radius correlation was \(0.5754\) versus injected \(0.75\); recovered real/imaginary correlation was \(0.2862\) versus injected \(0.35\). Thus the test did not rely on knowing the true covariance.

Foldwise predictive advantages over the two-pole model were

\[
\Delta_{1-2}
=(203.8453,67.9099,180.8671,404.5963,148.5318),
\]

\[
\boxed{\sum\Delta_{1-2}=1005.7503},
\]

and

\[
\Delta_{\rm band-2}
=(1.6215,8.4253,9.1974,60.7830,5.5461),
\]

\[
\boxed{\sum\Delta_{\rm band-2}=85.5733}.
\]

Every held-out fold therefore favors two discrete poles over both rivals in this fixed realization.

The two-pole recovery was stable:

- \(q\in[2.39953,2.40205]\);
- \(\tau_1\in[0.25215,0.25983]\);
- \(\tau_2\in[2.01644,2.07277]\);
- \(A_{01}\in[0.012047,0.012199]\);
- \(A_{02}\in[0.007882,0.007987]\).

The continuous band compromises at approximately

\[
q\approx2.28,\qquad
\tau_0\approx2.2,\qquad
\sigma\approx2.0,
\]

becoming very broad while retaining structured closure error. This is the continuous analogue of the wrong one-pole model collapsing two knees into one effective response.

## Interpretation and status

**STD/DERIVED conditional:** covariance estimation, shrinkage, Gaussian propagation, and conditional predictive likelihood for the declared synthetic experiment.

**SAT/CANDIDATE:** interpreting the two relaxation poles as two finite-core/resolving-medium channels.

The surviving discriminator is out-of-radius predictive likelihood after estimating the complete joint complex-pole covariance from repeats. Merely giving a rival more representational capacity does not make it dynamically adequate.

The result does **not** reject all continuous spectra. It rejects the declared one-band positive log-normal spectrum for this injected separated two-pole fixture.

## Failure conditions

Reject or enlarge this conclusion if:

1. the ordering fails across independently seeded repeat ensembles;
2. fewer repeats make covariance shrinkage dominate the answer;
3. a bimodal or nonparametric positive spectrum matches or exceeds two-pole held-out likelihood;
4. covariance estimated from real apparatus repeats is state- or radius-dependent beyond this stationary model;
5. the two recovered poles merge, swap erratically, or drift with the radius window;
6. full complex-dispersion residuals contradict the reality-closure result.

## Tight next test

Repeat the frozen experiment over independent seeds and a repeat-count ladder

\[
R\in\{8,16,32,64,96,192\}.
\]

For each \(R\), compare one pole, two poles, one continuous band, and a regularized nonparametric positive spectrum. Report selection probability, covariance error, pole-collapse rate, and the smallest \(R\) at which both relaxation times remain separated with at least 95% recovery probability.

Artifacts:

- `WORKSPACES/RAVEL/SCRIPTS/repeated_covariance_spectrum_selection.py`
- `WORKSPACES/RAVEL/VISUALS/repeated_covariance_spectrum_selection.svg`

