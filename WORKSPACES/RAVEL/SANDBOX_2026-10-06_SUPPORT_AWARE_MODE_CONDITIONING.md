# Ravel sandbox — support-aware finite-core mode conditioning

**Status:** GEN/CANDIDATE, sandbox only  
**Question:** If a finite 4D carrier is read by intersection with a resolving structure, how many projected morphology modes are practically recoverable once endpoint support is uncertain?

## Source/provenance boundary

### Fresh archive source actually read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/SAT26 THOUGHTS ROUNDUP.txt` — read completely (all headings and entries). The useful historical construction is the distinction between a persistent filament/history and its local “intersectional trace” on a moving resolving surface. The file also contains many numerical constants, lattice claims, particle assignments, and engineering extrapolations; none is imported here. ⟦ARCHIVE:SAT26_THOUGHTS_ROUNDUP·Foundational Ontology/Intersectional Trace⟧
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/H(s)H FIRST BUILD.txt` — substantial read of the opening reconstruction/audit program and the later observation-engine material. Used only for the explicit instruction to replace desired-target steering with falsifiable geometry and for the historical proposal that readout integrates unresolved history. Its Euclidean ontology, BV losslessness, historical constants, particle labels, and claimed physical identifications are not adopted. ⟦ARCHIVE:HSH_FIRST_BUILD·opening audit + Sector 4 observation engine⟧

### Fresh H(s)H source actually read

- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_126_DIRECT_READOUT_ENDPOINT_RECONSTRUCTION.md` — read completely. It derives two endpoint inverses for the exact finite-slab model: a thin-slab branch linear in `M_4` and a thin-carrier branch proportional to `M_4^{1/3}`. This is a sandboxed geometric/readout result, not a particle identification. ⟦HSH:RUN126·Theorems 1–2 and branch-asymmetry consequence⟧

### Controls/supporting resources

- Refreshed `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, its Reference Desk, symbol/citation/toolbox controls, current workflow orientation, scheduler rule, branching map, and exploration router.
- Reviewed the 5 October HSH_RESOURCES packet through the Common Reference Desk/War Room routing surface. No `PRIOR_ART` path was opened. No external theory content enters the construction below.
- Issued Mersearch 1.0 bridge request `2026-10-06-ravel-support-aware-conditioning-001` with query `("finite thickness" OR "finite core" OR support) AND (noise OR conditioning OR inverse)`. Its results, if used, remain discovery evidence and are cross-pollinated only after the independent construction below.

## Source facts versus inference

**Source facts (SRC/HISTORICAL or GEN/CANDIDATE):**

1. Old SAT repeatedly separates a persistent filament/history from the localized intersection seen on a resolving surface.
2. Run 126 shows that one exact finite-slab observable can possess two inverse endpoint branches with different scaling exponents.

**Inference (GEN/ACTIVE):** a finite carrier should not be considered reconstructed merely because a tail series is algebraically invertible. Practical identifiability is controlled by the singular spectrum of the actual thickness/orientation sampling operator, including support uncertainty.

**New sandbox conjecture (GEN/CANDIDATE):** useful finite-core tomography is concentrated near contact and crossover. Deep-tail measurements can prove low-order asymptotics, but they are exponentially/polynomially poor at recovering detailed morphology. Reversal of orientation should be treated as a genuine second view, not redundant repeat data.

## Local geometry and readout

All symbols in this section are local Ravel-sandbox symbols.

Let `u in [-1,1]` label projected material, with unequal positive/negative supports

\[
z(u)=
\begin{cases}
\varrho_+u,&u\ge0,\\
\varrho_-u,&u<0,
\end{cases}
\qquad
(\varrho_+,\varrho_-)=(0.70,1.30).
\]

Probe departures from a uniform reference distribution with Legendre modes:

\[
p(u)=\frac12+\sum_{\ell=1}^{6}b_\ell\frac{2\ell+1}{2}P_\ell(u).
\]

The `b_l` are local tangent-space morphology coordinates, not particle quantum numbers. For finite amplitudes positivity of `p` must be reimposed.

Use the exact quadratic-contact kernel inherited from the prior finite-readout sandbox:

\[
\mathcal K_h(z;\varrho)=
\frac{\sqrt{(h-z)_+}-\sqrt{(-h-z)_+}}{\sqrt{h+\varrho}}.
\]

The two oriented readouts are

\[
\mathcal O_+(h)=\int_{-1}^{1}p(u)\mathcal K_h(z(u);\varrho_+)\,du,
\qquad
\mathcal O_-(h)=\int_{-1}^{1}p(u)\mathcal K_h(-z(u);\varrho_-)\,du.
\]

For parameter vector

\[
\vartheta=(\delta\ln\varrho_+,\delta\ln\varrho_-,b_1,\ldots,b_6),
\]

the local measurement Jacobian is `J_{i alpha}=partial O_i/partial vartheta_alpha`. With independent Gaussian readout noise `sigma_obs` and optional fractional support prior `sigma_rho`,

\[
\mathcal I
=\frac{1}{\sigma_{\rm obs}^2}J^TJ+
\operatorname{diag}(\sigma_\varrho^{-2},\sigma_\varrho^{-2},0,\ldots,0).
\]

The smallest singular value of the whitened augmented Jacobian is the practical bottleneck. The local Cramér–Rao bound is

\[
\operatorname{Cov}(\widehat\vartheta)\succeq\mathcal I^{-1}.
\]

## Solver experiment

`support_aware_mode_conditioning.py` evaluates the exact kernels using 3,200-point Gauss–Legendre quadrature and finite-differences only the two support coordinates. It compares 16-thickness ladders at `sigma_obs=10^{-4}` with a 1% support prior:

| ladder | range `h/rho_max` | paired condition number | mode SNR for a 1% amplitude |
|---|---:|---:|---:|
| deep tail | 30–600 | `>1e9` (numerical-floor sensitive) | `4.0e-5` to `5.0e-4` |
| mixed log | 0.08–30 | `19.8` | 12–17 |
| near contact | 0.04–2.5 | `20.9` | 13–21 |
| greedy D-optimal | 0.184–1.029 | `24.0` | 16–25 |

The D-optimal dimensionless thicknesses are

\[
0.1838,0.1923,0.2012,0.2106,0.3795,0.3971,0.4155,0.4761,
0.4981,0.5212,0.5971,0.7158,0.7490,0.9394,0.9830,1.029.
\]

For that ladder the paired-readout CRLB standard deviations for `b_1,ldots,b_6` are

\[
(4.71,4.31,6.08,4.80,3.98,4.18)\times10^{-4}.
\]

Using only the `+` orientation worsens the condition number from `24.0` to `86.4`; its worst mode uncertainty rises to `2.29e-3`. Removing the support prior changes the paired D-optimal condition number only from `24.04` to `24.10`: in this fixture, crossover data self-calibrate the endpoints locally. Deep-tail data do not. Re-evaluating the fixed mixed and D-optimal ladders at 6,400 quadrature points changed mode CRLBs by at most 2.6% and 3.7%, respectively; the near-kink integration error is therefore visible but does not change the qualitative separation.

The deep-tail smallest singular directions fall close enough to numerical differentiation/quadrature floors that their quoted condition number is only an order-of-magnitude lower bound; the stable practical statement is the enormous mode CRLB and sub-`10^{-3}` SNR for a 1% perturbation.

## Mechanism and discriminator

For `h >> rho_max`, mode `ell` enters only through successively higher inverse powers of `h`; the morphology columns of `J` therefore become nearly collinear and vanish relative to noise. Near contact, clipping points sweep across the finite support. Each morphology mode changes the kink/crossover pattern differently, so the Jacobian retains independent directions.

This yields a direct discriminator:

> If finite-core intersection is the relevant mechanism, paired orientation data concentrated around `0.18 <= h/rho_max <= 1.03` should recover local shape perturbations far more efficiently than an equal-count deep-tail ladder. For the stated fixture/noise model, the predicted gap is at least four orders of magnitude in 1%-mode SNR.

A display-only trace model with no transported finite support need not show this support-locked, reversal-assisted singular-spectrum improvement.

## Failure conditions

This candidate fails or must be narrowed if any of the following occurs:

1. repeated data generated from the exact kernel do not reproduce the reported Jacobian/SVD spectrum under quadrature refinement;
2. nonlinear, positivity-constrained inference shows that the local Fisher bounds are grossly optimistic at 1% morphology amplitude;
3. support drift between the two orientations destroys the common-carrier fit;
4. correlated or thickness-dependent noise erases the predicted crossover advantage;
5. another admissible morphology family gives indistinguishable crossover curves at the claimed precision, restoring a nonlocal inverse degeneracy;
6. experimental thickness cannot be calibrated relative to `rho_max`, making the proposed ladder circular.

## Tight next test

Run a blinded nonlinear Monte Carlo with positivity-constrained density, unknown `varrho_+` and `varrho_-`, correlated noise, and withheld modes `P_7`–`P_10`. Compare deep, mixed, and D-optimal ladders on out-of-sample thicknesses. Pass only if:

- support bias is below 0.2%;
- each injected 1% mode through `P_6` is recovered above 5 sigma;
- the held-out prediction residual is statistically compatible with the noise model;
- unmodeled higher modes trigger lack-of-fit rather than being silently absorbed into support.

## Durable disposition

The result does **not** establish a particle, a literal ontology, or six physical internal modes. It establishes a measurement-design candidate: if H(s)H uses finite-core intersection readout, tail-only tomography is practically inadequate, while paired near-contact sampling can make local morphology and support jointly identifiable.

**Next cursor:** implement the blinded positivity-constrained Monte Carlo and stress the D-optimal clustering against correlated noise and minimum-thickness-spacing constraints.
