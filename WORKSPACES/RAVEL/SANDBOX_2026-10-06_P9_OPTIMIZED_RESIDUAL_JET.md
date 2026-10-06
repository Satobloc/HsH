# Ravel sandbox checkpoint — P9 optimized-residual jet

**Status:** sandbox calculation, not canonical theory or a particle identification.

## Sources actually read

### Controlling onboarding and resource routing

Read before construction:

- 'Satobloc/HsH/WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md'
- 'Satobloc/HsH/WORKSPACES/COMMON/REFERENCE_DESK/README.md'
- 'Satobloc/HsH/WORKSPACES/COMMON/CURRENT_WORKFLOW_ORIENTATION_V2.md'
- the relevant symbol, citation, toolbox-namespace, task-graph, and three-repository onboarding pointers named there
- 'Satobloc/HSH_RESOURCES/!_HSH_RESOURCES_INDEX.md'
- 'Satobloc/HSH_RESOURCES/info/NATHAN_PREFERENCES/BOOT.md'
- 'Satobloc/HSH_RESOURCES/HQ/TOOL_CHEST.md'
- 'Satobloc/HSH_RESOURCES/info/TOOLKIT_DIGESTION.md'
- 'Satobloc/HSH_RESOURCES/HQ/THE_WAR_ROOM/DECLARATION.txt'

HSH_RESOURCES was used for routing/familiarization only. 'PRIOR_ART' was not opened.

### Fresh archive source

- 'Satobloc/SAT_THEORY_ARCHIVE_2023-25/WORLDTUBE THOUGTS.txt' — read completely. This mixed historical/current discussion explicitly distinguishes intrinsic arclength from evolution parameter, insists that readout/coarse graining remain a typed map, and proposes effective inertia as the quadratic response of **minimized** worldtube energy to imposed transport. Its Kerr, particle, cosmological, numerical-scale, and BV claims were not imported.

### Fresh H(s)H source

- 'Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md' — read completely. Within its quadratic contact model, the topology threshold depends on the curvature-facing one-sided support while maximum contact measure depends on the support sum. Reversal exchanges which support is curvature-facing. No particle interpretation is asserted.

## Correction to the preceding checkpoint

The prior small-amplitude script described the omitted-mode amplitude \(\delta\) as if it displaced the support-asymmetry coordinate \(a\) across a nearby contact threshold. That was a type error:

\[
\delta:\text{P9 morphology-moment perturbation},
\qquad
a:\text{support asymmetry}.
\]

Changing \(\delta\) never changes \(a\), so no paired \(\pm\delta\) probe crossed the support-contact boundary. The raw calculations and resolver-dependence result remain valid; only that explanation was wrong. The earlier checkpoint and script commentary have been corrected.

## Source facts, inference, and new construction

**Source facts.** The archive source treats response after minimization as the meaningful effective coefficient. Run 110 shows that a finite-core contact map is piecewise and relational: branch membership depends on a one-sided support and orientation.

**Ravel inference.** The correct local P9 observable is a derivative of the nuisance-minimized residual map inside a fixed contact cell. Differencing two already-squared residual norms is numerically inferior and can mix local response with finite-amplitude curvature.

**New sandbox construction.** Differentiate the optimized held-out residual vector before forming its norm.

Let

\[
e(\delta)
=c_1\delta+c_2\delta^2+c_3\delta^3+c_4\delta^4+O(\delta^5)
\]

be the covariance-whitened held-out residual after strict nuisance refitting. Then

\[
\lambda(\delta)=\|e(\delta)\|^2
=\langle c_1,c_1\rangle\delta^2
+2\langle c_1,c_2\rangle\delta^3+O(\delta^4).
\]

With the existing dimensionless amplitude \(x=\delta/s\), the true local signed response is

\[
\boxed{
F_0=\frac BA
=s\frac{2\langle c_1,c_2\rangle}
{\langle c_1,c_1\rangle}
}.
\]

This residual-jet estimator does not subtract two \(O(\delta^2)\) norms to recover an \(O(\delta^3)\) difference. It numerically differentiates the optimized residual map itself.

## Test design

For each resolver, evaluate three orientation coordinates around the previously estimated zero and fit the local transverse zero:

- original geometric 16-height ladder;
- deterministically jittered 16-height ladder;
- dense 24-height ladder.

The two support settings were

\[
a_\pm=a_*\pm10^{-4},
\qquad
a_*=0.06125742185040761.
\]

Signed amplitudes were

\[
|\delta|\in
\{0.00035,0.00070,0.00105,0.00140,0.00210,0.00280\}.
\]

Two jets were compared: a narrow window ending at \(0.00140\) and a wide window ending at \(0.00280\). Every sample used four fixed nuisance-fit starts.

## Result

The narrow residual jet reproduces the earlier paired-quotient roots:

- maximum shift from the preceding coarse estimate: \(9.11\times10^{-5}\);
- minimum transverse slope: \(3.02\times10^{-2}\);
- maximum narrow-jet residual error: \(3.34\times10^{-7}\) noise-\(\sigma\);
- minimum nuisance Hessian eigenvalue: \(1.21\times10^4\);
- maximum distinct nuisance solutions: one;
- protected lower-moment drift: \(6.09\times10^{-13}\).

The local zeros are:

| Resolver | \(o_0(a_*-10^{-4})\) | \(o_0(a_*+10^{-4})\) | sided difference |
|---|---:|---:|---:|
| original 16 | -0.0217001 | -0.0129929 | +0.0087071 |
| jittered 16 | -0.0143995 | -0.0144778 | -0.0000784 |
| dense 24 | -0.00896224 | -0.00900527 | -0.0000430 |

At the lower support setting, the root spread across resolvers is

\[
0.0127378;
\]

at the upper setting it is

\[
0.00547256.
\]

Therefore the P9 zero remains decisively resolver-relative after moving differentiation ahead of the residual norm.

The amplitude-window comparison isolates a second effect. Jittered-16 and dense-24 roots change by at most \(3.76\times10^{-6}\) between narrow and wide jets. The original ladder changes by \(8.20\times10^{-4}\) below its contact boundary and \(2.11\times10^{-3}\) above it. Thus:

1. the narrow local zero is genuinely resolver-dependent;
2. the original ladder additionally acquires strong finite-amplitude curvature near its contact stratum.

The earlier sharp excursion was not one phenomenon. It combined a resolver-dependent local projection with finite-amplitude contamination specific to a nearby branch boundary.

## 4D consequence

If the carrier is treated as an extended 4D history and the measurement as a finite intersection/readout, the minimal map must be written as

\[
W(a,o,\delta)
\xrightarrow{R_H}
y_H
\xrightarrow{\operatorname*{argmin}_{\theta}\Phi_H}
\widehat y_H,
\]

and local response belongs to the derivative of the composite optimized map,

\[
D_\delta\!\left[
y_H-\widehat y_H
\right],
\]

not to a visually inferred feature of one sampled trace.

The present P9 zero is therefore a coordinate in a resolver-calibration atlas, not a recovered carrier modulus.

## Failure condition and discriminator

An intrinsic carrier zero requires

\[
\sup_{H,H'\in\mathcal H_N}
|o_0(a;H)-o_0(a;H')|
\longrightarrow0
\]

under nested, independently jittered resolver families. The current spread fails this requirement by orders of magnitude relative to numerical error.

The residual-jet conclusion would fail if direct automatic/implicit differentiation produced resolver-invariant roots or showed that the fitted residual jets are biased by finite polynomial windows. The next calculation should therefore solve the differentiated nuisance normal equations for \(c_1\) and \(c_2\) directly within each fixed contact cell, then repeat over \(N=16,24,32,48\) and multiple jitter seeds.

## Reproducibility

- 'WORKSPACES/RAVEL/CODE/p9_residual_jet_audit.py'
- 'WORKSPACES/RAVEL/DATA/p9_residual_jet_audit.json'
- 'WORKSPACES/RAVEL/FIGURES/p9_residual_jet_audit.svg'

