# Ravel sandbox checkpoint — repeat-count identifiability boundary

Status: **siloed sandbox result; not canonical H(s)H theory and not a particle claim**.

## Narrow question

How many statistically independent repetitions are required before an 82-component complex-pole readout can both prefer and correctly recover two separated relaxation channels when its covariance is estimated from those same repetitions?

## Sources actually read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H Dev +/HsH ARCHITECT.txt` — substantial direct read. Nathan's controlling points used here are: treat the object as a finite worldtube rather than an essentialized worldline; preserve dimensional/proportional structure across scales; and do not repair calculations with optional attenuation, elasticity, holonomy, lattice, or braid factors. The document's Kerr, event-horizon, particle, electrogravity, and battery proposals were not adopted as facts or numerical inputs.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_090_TANGENCY_DIMENSIONAL_DISCRIMINATOR.md` — full sequential read. It shows that exponent agreement is insufficient unless the fixed-s density has the correct dimension, and distinguishes slice, swept, boundary, and projected measures. Used as a method constraint: type the observation vector and covariance dimension before interpreting fitted channels.
- Google Drive targeted search for `covariance repeat relaxation spectrum` — no relevant internal construction returned.
- Slack targeted collision search after the independent construction — found the immediately preceding covariance/spectrum checkpoint and no prior repeat-rank boundary result.

## Source fact, inference, conjecture boundary

**Source-derived facts:** the historical program prefers finite worldtubes, proportional geometry, explicit readout, and dimensional/type discipline. It supplies no repeat-count law or covariance model.

**Standard derivation:** the rank bound below follows from elementary sample-covariance linear algebra. The Monte Carlo result is conditional on the declared synthetic fixture.

**Sandbox conjecture:** if a finite-core H(s)H realization produces multiple relaxation channels in an observable pole trajectory, separating those channels will require a repeat budget controlled by readout dimension and covariance structure. This is a metrology statement, not evidence that the channels are physical.

## Exact construction

At each repeat, concatenate the real and imaginary parts of the complex pole measured at (N=41) radii:

\[
y_r=(\Re z_1,\ldots,\Re z_N,\Im z_1,\ldots,\Im z_N)^T\in\mathbb R^{2N}.
\]

For (R) independent repetitions, the centered sample matrix has at most (R-1) independent rows. Therefore

\[
\operatorname{rank}\widehat C_y\le \min(R-1,2N).
\]

For (N=41), an unregularized full-rank covariance is generically possible only when

\[
\boxed{R\ge 2N+1=83.}
\]

This boundary is exact. Ledoit–Wolf shrinkage can produce an invertible matrix for (R<83), but the missing covariance directions then come from the shrinkage target rather than from independent sample support.

The injected synthetic response was kept fixed from the preceding checkpoint:

\[
D_2(z;a)=a^{-2}-z^2-iz\sum_{j=1}^2
\frac{A_{0j}a^q}{1-iz\tau_j}=0,
\]

with (q=2.4), ((\tau_1,\tau_2)=(0.25,2.0)), ((A_{01},A_{02})=(0.012,0.008)), relative single-repeat pole noise (3\times10^{-4}), adjacent-radius correlation (0.75), and same-radius real/imaginary correlation (0.35).

For each (R\in\{8,16,32,64,96,192\}), 40 independently seeded repeat ensembles were generated. Each ensemble estimated its own standardized Ledoit–Wolf covariance. One-pole and two-pole models were fitted on a fixed interleaved training set and compared on held-out radii by conditional Gaussian predictive NLL.

The predeclared success event required all of:

\[
\Delta\mathrm{NLL}_{1-2}>0,
\quad \tau_2/\tau_1>3,
\quad \max_j|\log(\tau_j/\tau_j^*)|<0.25,
\quad |q-q^*|<0.20.
\]

The injected truth was used only to score recovery after fitting, not to initialize or constrain the fit.

## Result

| repeats (R) | raw covariance rank | median shrinkage | median held-out \(\Delta\mathrm{NLL}_{1-2}\) | selection + recovery | Wilson 95% interval |
|---:|---:|---:|---:|---:|---:|
| 8 | 7/82 | 0.673 | 136.2 | 15/40 = 37.5% | 24.2–53.0% |
| 16 | 15/82 | 0.634 | 127.5 | 26/40 = 65.0% | 49.5–77.9% |
| 32 | 31/82 | 0.491 | 137.2 | 24/40 = 60.0% | 44.6–73.7% |
| 64 | 63/82 | 0.325 | 180.2 | 36/40 = 90.0% | 76.9–96.0% |
| 96 | 82/82 | 0.248 | 219.5 | 36/40 = 90.0% | 76.9–96.0% |
| 192 | 82/82 | 0.137 | 315.1 | 38/40 = 95.0% | 83.5–98.6% |

The smallest tested repeat count meeting the **point-estimate** 95% criterion was

\[
\boxed{R=192.}
\]

This is not a 95%-confidence certification that the true recovery probability is at least 95%; 40 trials leave the Wilson lower bound at 83.5%. The nonmonotonic 16-to-32 fluctuation is likewise compatible with finite Monte Carlo resolution and the strict compound success rule.

## Surviving discriminator

The main result is the separation of three statements that were previously easy to conflate:

1. **Model discrimination:** median held-out likelihood favored two poles at every tested (R).
2. **Covariance support:** the raw 82-dimensional covariance cannot be full rank below (R=83).
3. **Parameter identifiability:** correct separated-channel recovery reached only 90% at (R=96) and a 95% point estimate at (R=192).

Thus a preferred two-pole likelihood is not sufficient evidence that both memory scales have been faithfully reconstructed. The exact rank law generalizes to

\[
\boxed{R_{\rm full-rank}=2N+1}
\]

for (N) complex sampling locations. That scaling is forced by readout dimension and is independent of any H(s)H ontology.

## Failure conditions

Reject or revise this boundary if:

1. independent seed banks materially move the 192-repeat point threshold;
2. nested selection of the shrinkage model changes the ordering;
3. a regularized nonparametric positive spectrum matches or exceeds the discrete model;
4. recovery changes strongly with radius-window placement or holdout pattern;
5. apparatus repeats are nonstationary or not independent;
6. full complex-dispersion scoring contradicts the reality-closure scoring used here.

## Exact next dependency

Add a positive nonparametric spectrum on a fixed log-τ grid with nonnegative weights and a smoothness penalty chosen inside the training fold. Run it only at (R=96) and (R=192) first. The decisive outcome is whether a smooth or multimodal continuum can achieve equal held-out likelihood without concentrating into two narrow peaks.

Artifacts:

- `WORKSPACES/RAVEL/SCRIPTS/repeat_count_identifiability_boundary.py`
- `WORKSPACES/RAVEL/DATA/repeat_count_identifiability_boundary.json`
- `WORKSPACES/RAVEL/VISUALS/repeat_count_identifiability_boundary.svg`
