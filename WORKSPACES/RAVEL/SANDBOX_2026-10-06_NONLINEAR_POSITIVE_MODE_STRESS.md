# Ravel sandbox — nonlinear positive-mode stress test

**Status:** GEN/CANDIDATE; siloed sandbox, not canonical theory  
**Question:** Does the paired near-contact design still recover finite-core morphology when density positivity is enforced and noise is correlated, and do omitted higher modes announce themselves rather than masquerading as support motion?

## Source and provenance boundary

### Fresh archive source actually read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT_H(s)H Skill Development — raw - .TXT` — sequentially read lines 1–260 and 3,950–4,380. The latter span contains Nathan's correction that the filament had already been treated as finite-thickness and bendable; only its externally accessible thickness/interaction properties belong to readout, while ER/Kerr/closed-string descriptions remain model candidates. It also separates code conformance, execution qualification, numerical-behavior evaluation, and model evaluation. No Kerr identity, particle label, historical constant, or claimed ontology is imported. ⟦ARCHIVE:SAT_HSH_SKILL_DEV·1–260,3950–4380⟧

### Fresh H(s)H source actually read

- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_126_DIRECT_READOUT_ENDPOINT_RECONSTRUCTION.md` — read completely. Its finite-slab inverse has two endpoint branches with different direct-readout exponents, showing that an exact forward law does not license unqualified inverse reconstruction. Used as inverse-method discipline and as a reminder to test endpoint/support confusion; its asymptotic formulas are not inputs to the solver below. ⟦HSH:RUN126·complete⟧

### Controls and post-construction retrieval

- Refreshed `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, current workflow orientation, Reference Desk, symbol/citation/toolbox controls, HSH_RESOURCES Tool Chest, toolkit digestion router, human-readable index, Nathan preference BOOT, and War Room declaration. The listed HSH_RESOURCES packet was treated as routing/familiarization only. No `PRIOR_ART` path was opened.
- Read the completed Mersearch 1.0 result for request `2026-10-06-ravel-support-aware-conditioning-001` (`("finite thickness" OR "finite core" OR support) AND (noise OR conditioning OR inverse)`): 3,987 non-quarantined archive files, 6,597,201 records, 227 hits. The useful cross-pollination was methodological: numerical evaluation should explicitly test conditioning, tolerance, sensitivity, discretization, solver dependence, and repeatability. Most lexical hits were unrelated. Mersearch result commit: `bdf3673c7c1803f3c199778c11a4c4c5369ec1c2`.

## Source fact, inference, and new conjecture

**Source fact / historical model record:** old/project material distinguishes a persistent finite carrier from the localized intersection available to a resolving surface. Run 126 shows that even an exact finite-slab observable can have inequivalent inverse branches.

**Inference:** a finite-core readout model needs a misspecification test. A numerically stable low-mode estimate is not enough if omitted internal structure can shift support parameters without leaving a residual.

**New sandbox conjecture:** paired crossover measurements can do two jobs at once: estimate a positive low-order morphology and expose unresolved higher morphology on withheld thicknesses. The discriminator is not merely parameter SNR; it is whether a low-order fit predicts a separate thickness ladder with the declared covariance.

## Positive finite-core family

Retain the prior local projected coordinate `u in [-1,1]` and asymmetric support

\[
z(u)=\begin{cases}
\varrho_+u,&u\ge 0,\\
\varrho_-u,&u<0,
\end{cases}
\qquad (\varrho_+,\varrho_-)=(0.70,1.30).
\]

Replace the earlier tangent-space density with an exponential Legendre family,

\[
p_\eta(u)=
\frac{\exp\!\left(\sum_{\ell=1}^{L}\eta_\ell P_\ell(u)\right)}
{\int_{-1}^{1}\exp\!\left(\sum_{\ell=1}^{L}\eta_\ell P_\ell(v)\right)dv}.
\]

This is normalized and strictly positive for every finite parameter vector. The reported morphology coordinates are the moments

\[
b_\ell=\int_{-1}^{1}p_\eta(u)P_\ell(u)\,du,
\]

not the exponential coefficients themselves.

The exact local contact kernel remains

\[
\mathcal K_h(z;\varrho)=
\frac{\sqrt{(h-z)_+}-\sqrt{(-h-z)_+}}{\sqrt{h+\varrho}},
\]

with paired orientations

\[
\mathcal O_+(h)=\int p_\eta(u)\mathcal K_h(z(u);\varrho_+)du,
\qquad
\mathcal O_-(h)=\int p_\eta(u)\mathcal K_h(-z(u);\varrho_-)du.
\]

The estimator fits `P1..P6` plus `ln(varrho+/0.70)` and `ln(varrho-/1.30)`. Truth is generated either inside that family or with deliberately withheld `P7..P10` moments.

## Correlated-noise and holdout test

For each orientation, thickness-index noise has AR(1) correlation `phi=0.60`; matching thicknesses across orientations have correlation `0.25`. Thus

\[
\Sigma=\sigma^2
\begin{pmatrix}1&c\\c&1\end{pmatrix}
\otimes A_\phi,
\quad
(A_\phi)_{ij}=\phi^{|i-j|},
\]

with `sigma=10^-4`. A 1% fractional Gaussian support prior is retained. GLS residuals are Cholesky-whitened.

Two sixteen-thickness designs are compared:

1. the prior Fisher D-optimal cluster, minimum adjacent ratio `1.0462`;
2. a mechanically spaced crossover ladder `h/rho_max = geomspace(0.14,1.55,16)`, minimum adjacent ratio `1.1739`.

Each fitted model predicts 24 independent held-out thicknesses per orientation over `0.055 <= h/rho_max <= 3.2`. The 5% lack-of-fit threshold is calibrated only from in-family Monte Carlo trials, then frozen before testing withheld modes.

## Numerical result

The solver used 1,400-point Gauss–Legendre quadrature and 80 trials per ladder/scenario.

| design | successful in-family fits | weakest empirical SNR for joint 1% `P1..P6` | max in-family support bias | withheld `P7..P10` | holdout rejection |
|---|---:|---:|---:|---:|---:|
| clustered prior D-opt | 78/80 | 12.04 | 0.017% | alternating 0.3% moments | 100% |
| spaced crossover | 77/80 | 13.36 | 0.0044% | alternating 0.3% moments | 100% |

For the in-family truth, every injected 1% mode clears the preregistered 5-sigma gate by more than a factor of two. Mean mode biases are at most `1.50e-4` for the clustered ladder and `3.78e-5` for the spaced ladder. Calibrated in-family holdout rejection is 5.1–5.2%, as intended.

With omitted `P7..P10`, the low-order fit becomes biased and tries to deform the common support:

| design | `varrho+` bias | `varrho-` bias | median holdout generalized chi-square | calibrated threshold |
|---|---:|---:|---:|---:|
| clustered prior D-opt | +0.279% | -0.582% | 198.29 | 70.34 |
| spaced crossover | +0.220% | -0.464% | 177.57 | 75.81 |

The important result is therefore mixed but clean: omitted higher morphology **does** contaminate support if one looks only at fitted parameters, but it does **not** pass the independent thickness prediction. Every successful withheld-mode trial was rejected by the frozen holdout gate.

The spaced design is at least as useful as the clustered one in this stress test: it retains all low-mode SNR gates, reduces in-family bias, preserves 100% misspecification detection, and relaxes the minimum thickness separation from 4.6% to 17.4%. The old D-optimum's tight clusters are therefore not necessary under this fixture.

## Mechanism and discriminator

The crossover kernel moves a clipping boundary across finite support. Low and high Legendre structure can imitate one another over a narrow set of thicknesses, and the optimizer can partially trade omitted structure against endpoint location. A separated holdout ladder changes where clipping occurs; the same false support shift cannot reproduce all crossings.

This produces a sharper discriminator than the previous Fisher result:

> At `sigma=10^-4` with the declared correlations, a positive six-mode carrier with joint 1% moments should be recoverable from sixteen paired crossover settings at empirical SNR at least 12. A positive carrier containing additional alternating 0.3% `P7..P10` moments should fail a separately calibrated 48-observation thickness holdout essentially always in this fixture, even though an unrestricted report of the fitted supports alone could look superficially plausible.

A display-only trace model with no transported common support has no reason to obey this train/holdout covariance and support-closure pattern.

## Failure and qualification

This candidate fails or narrows if:

1. an independent implementation does not recover the reported in-family bias/SNR and nominal 5% holdout rejection;
2. quadrature refinement materially changes the Monte Carlo conclusion (a 700-to-1,400 forward comparison gave RMS change about `0.14 sigma` and maximum change about `0.53 sigma`, so the remaining numerical floor is visible);
3. optimizer convergence failures persist above a few percent—this run had 2–3 failures per 80 trials and therefore does not qualify a production estimator;
4. weaker or differently phased higher modes evade the holdout while shifting support by more than 0.2%;
5. real noise is nonstationary, heavy-tailed, orientation-dependent, or correlated with thickness calibration beyond the declared covariance;
6. the two orientations do not share a transported carrier/support;
7. another positive morphology family reproduces both training and holdout curves at the stated precision.

The result does not establish six physical modes, a particle identity, or ontology. It qualifies a measurement-and-model-check architecture for a finite-core representation.

## Exact next calculation

Sweep withheld-mode amplitude and phase, including sparse single-mode `P7`, `P8`, `P9`, and `P10` alternatives, to map the 80%-power detection boundary. Simultaneously replace the generic optimizer with a continuation/multistart fit and require zero unexplained convergence failures. The next promotion gate is: all in-family 1% modes above 5 sigma, support bias below 0.2%, calibrated false rejection near 5%, and at least 80% holdout power at a declared higher-mode amplitude chosen before simulation.

## Artifacts

- `nonlinear_positive_mode_stress.py` — executable solver.
- `nonlinear_positive_mode_stress.json` — complete fixture and Monte Carlo summary.
- `nonlinear_positive_mode_stress.svg` — Class-P diagnostic: holdout statistic distributions and empirical mode SNR.

