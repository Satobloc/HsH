# Ravel sandbox checkpoint — P9 local limit and resolver audit

**Status:** sandbox construction, not canonical H(s)H theory. Historical labels and constants were not used as targets.

## Material actually read

### Controlling H(s)H front door and routing

- `Satobloc/HsH/WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` — read in full; followed its source-order, quarantine, and checkpoint rules.
- `Satobloc/HsH/WORKSPACES/COMMON/REFERENCE_DESK/README.md` — read in full for retrieval routing.
- `Satobloc/HsH/WORKSPACES/COMMON/CURRENT_WORKFLOW_ORIENTATION_V2.md` — read in full for workspace and claim-status discipline.
- `Satobloc/HsH/WORKSPACES/COMMON/terminology/SYMBOL_REGISTRY.md` — read in full; no new canonical symbol is asserted here.
- `Satobloc/HsH/WORKSPACES/COMMON/REFERENCE_DESK/SAT26_BIGBOOK_INDEX_2026-10-05.md` — inspected as a routing index only.
- `Satobloc/HSH_RESOURCES/HQ/THE_WAR_ROOM/DECLARATION.txt` — read in full as routing/familiarization. The packet remained quarantined; no prior-art item was used to generate the construction below.

### Fresh SAT archive source

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT THEORY — Worldlines.txt` — read lines 1–1800. The usable historical residue is the distinction between an extended 4D carrier/history and a lower-dimensional intersection/readout, together with the idea that coarse graining can make a finite carrier look pointlike. Historical lattice, particle-identification, scale, and constant claims were excluded.

### Fresh H(s)H source

- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_105_EXACT_FINITE_SLAB_FOLD_UNIQUENESS.md` — read in full. It proves a unique finite-slab fold, two inverse branches below the fold maximum, rank loss at the fold, and the need for branch-aware numerical reporting plus direct/reduced quadrature checks.

## Source facts, inference, and conjecture boundary

**Source facts.** The old SAT text treats the observed trace as an intersection/readout of an extended history. Run 105 shows that a finite-slab map can be smooth on branches yet lose rank at a unique fold, so inversion near a stratum must not silently assume one smooth branch.

**Ravel inference.** If a finite-core worldtube is read through a finite acquisition-height set, a sharp feature in an inferred particle coordinate can come from either (i) carrier morphology or (ii) the readout map changing branch/contact class. A cancellation curve is intrinsic only if it survives both a local-response limit and controlled changes of the resolver.

**New sandbox conjecture tested here.** The P9 cancellation zero is a piecewise-smooth readout observable. Its jump is a contact-stratum effect, while its absolute location is resolver-dependent. Therefore it is not yet an intrinsic worldtube modulus.

## Construction

Let the held-out residual norm after nuisance refitting be

\[
\lambda(x)=A x^2+B x^3+C x^4+\cdots,\qquad x=\delta/s,
\]

where (s) is the script's fixed P9 scaling. Replace a finite-amplitude cubic fit by the paired local quotient

\[
F_\delta(a,o;H)
=s\,\frac{\lambda(+\delta)-\lambda(-\delta)}
{\delta[\lambda(+\delta)+\lambda(-\delta)]}
\longrightarrow \frac{B}{A}.
\]

For each deformation (a), orientation coordinate (o), and acquisition-height set (H), solve

\[
F_\delta(a,o;H)=0
\]

with strict four-start nonlinear nuisance refits. The audit used four amplitudes

\[
\delta=(3.5,1.75,0.875,0.4375)\times10^{-3}
\]

and three resolvers: the original 16-height geometric grid, a deterministically jittered 16-height grid, and a denser 24-height grid. A separate same-stratum check used

\[
\delta=(8,4,2,1)\times10^{-5}
\]

at (a=a_*\pm10^{-4}), where the original grid has a contact threshold

\[
a_*=0.06125742185040761.
\]

## Numerical result

The coarse local quotient is stable with amplitude away from numerical subtraction loss:

- maximum last-step root change: (2.53\times10^{-5});
- maximum even-power extrapolation RMSE: (2.01\times10^{-5});
- maximum root residual: (1.21\times10^{-6});
- every strict nuisance fit found one numerical solution;
- minimum Hessian eigenvalue: (1.21\times10^4);
- maximum lower-moment drift: (6.38\times10^{-13}).

But the extrapolated zero is not resolver-invariant. Across the three height sets its spread is

| (a) | spread in inferred local zero |
|---:|---:|
| 0.040000 | 0.003784 |
| 0.058000 | 0.006136 |
| (a_*-10^{-4}) | 0.012759 |
| (a_*+10^{-4}) | 0.005481 |
| 0.070000 | 0.003383 |

Near the original contact stratum the three coarse extrapolated roots below threshold are

\[
o_0=(-0.021721,-0.014409,-0.008962)
\]

for original-16, jittered-16, and dense-24 respectively. Thus the largest feature moves or disappears when the acquisition heights move; it is readout morphology.

The smaller-amplitude check sharpens the numerical audit. The support settings are fixed separately at (a=a_*\mathbin{\pm}10^{-4}), while (delta) perturbs only the ninth morphology moment; it does **not** move (a) or cross a contact threshold. At (delta=8\times10^{-5}),

\[
o_-(a_*-10^{-4})=-0.0217192,
\qquad
o_+(a_*+10^{-4})=-0.0130203.
\]

The jump therefore persists between the two fixed contact classes. This is consistent with a piecewise-smooth readout map whose coefficients change discontinuously when one acquisition height changes branch/contact status.

## What follows if the 4D picture is taken seriously

The smallest productive architecture now has three distinct objects:

1. a finite 4D carrier/worldtube with smooth deformation parameters;
2. a stratified intersection operator (R_H) indexed by resolver geometry (H);
3. an inferred particle coordinate obtained only after nuisance projection and inversion.

Schematically,

\[
W(a,o)\xrightarrow{R_H}y_H
\xrightarrow{\text{fit/project}}\widehat o_H.
\]

The data reject identifying (widehat o_H) with an intrinsic carrier coordinate: changing (H) shifts the zero by up to (1.28\times10^{-2}). A legitimate particle-like invariant must instead be formed before (R_H), or be explicitly renormalized across a family of resolvers.

## Failure condition

This P9 zero fails as an intrinsic worldtube discriminator if its resolver spread does not converge to zero under increasingly dense, independently jittered acquisition families. The present data already fail invariance at 16 versus 24 heights.

There is also a numerical certification boundary. Roots become noisy below roughly (delta=4\times10^{-5}): the quotient subtracts two (O(\delta^2)) residual norms to isolate an (O(\delta^3)) difference. The smaller-amplitude sequence has up to (1.80\times10^{-3}) last-step motion and cannot certify the literal double-precision (delta\to0) limit. The original script commentary incorrectly described (delta) as if it displaced the support coordinate across the nearby contact threshold; this checkpoint now corrects that type error. The resolver-dependence result does not rely on that description.

## Tight next test

Replace finite differencing by analytic or automatic differentiation through the nuisance optimum. Using the implicit Hessian solve for the refit parameters, compute (A) and (B) directly and solve (B/A=0) on each fixed contact stratum. Then repeat for nested height families (N=16,24,32,48) and at least eight deterministic jitters.

Discriminator:

\[
D_N(a)=\operatorname{MAD}_{H\in\mathcal H_N}o_0(a;H).
\]

An intrinsic candidate requires (D_N(a)\to0) with a reproducible convergence rate away from contact strata. A nonzero limit, or jumps that track individual height contacts, classifies P9 as a resolver observable rather than a carrier invariant.

## Reproducibility artifacts

- `WORKSPACES/RAVEL/CODE/p9_local_limit_grid_audit.py`
- `WORKSPACES/RAVEL/DATA/p9_local_limit_grid_audit.json`
- `WORKSPACES/RAVEL/FIGURES/p9_local_limit_grid_audit.svg`
- `WORKSPACES/RAVEL/CODE/p9_contact_sided_limit.py`
- `WORKSPACES/RAVEL/DATA/p9_contact_sided_limit.json`
