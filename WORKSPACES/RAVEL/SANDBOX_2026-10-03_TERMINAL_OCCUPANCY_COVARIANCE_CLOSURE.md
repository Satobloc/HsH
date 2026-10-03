# Ravel sandbox — terminal-occupancy covariance closure

**Status:** GEN/DERIVED inside the frozen linear-Gaussian spectral fixture; no physical claim.  
**Question:** Does terminal occupancy add information when it is reconstructed from the same calibrated pole-location/residue repeats?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/ER GRAVITY.txt` — substantial sequential read. The controlling user correction is that literal modeled filaments must not be silently replaced by bookkeeping or a history functional. For this operation that becomes a type guard: a separately sampled terminal state is a new physical/readout channel; a terminal number calculated from an existing fitted spectrum is only post-processing.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_136_CROSSOVER_INVERSE_MAP_IDENTIFIABILITY.md` — full sequential read. Retained its exact lesson that algebraic reuse of the same observables does not identify an internal decomposition; an independently typed observable is required.
3. Google Drive — targeted indexed searches for `terminal occupancy covariance pole residue` and `readout covariance identifiability`; no result.
4. Slack `#all-hsh-working-group-one` — targeted search/read. Recovered the immediately preceding Ravel first-passage checkpoint and a Parallax equal-covariance counterexample showing that covariance does not determine nonlinear finite-slab occupancy. No prior joint terminal/pole-residue calculation was found.

No historical constant, lattice, particle identity, or target observable entered the construction.

## Object and dimensional type

The object is a **joint readout statistic** on one fixed 97-component spectral displacement `delta = wide - restricted`. It is not a new finite core, constitutive mode, or physical terminal detector.

For each of the 13 fixed seeds, the empirical repeat covariance already used by the pole/residue inversion defines a whitened local model

\[
y\sim N(J\delta,I),
\]

where `J` is the calibration-marginalized pole-location/residue Jacobian. Its retained singular system at the declared one-sigma floor is

\[
J=USV^T,
\qquad s_i\ge 1,
\]

with rank 22 for every seed.

The terminal occupancy kernel is

\[
q_k=1-e^{-192/\tau_k}.
\]

## Full same-data covariance

The optimal matched score for the fixed displacement is

\[
z_0=a^Ty,
\qquad
a=\frac{USV^T\delta}{\lVert SV^T\delta\rVert},
\qquad
\mu_0=\lVert SV^T\delta\rVert .
\]

If terminal occupancy is reconstructed from these **same repeats**, its minimum-variance retained-subspace estimator is

\[
\hat q
=q^TVS^{-1}U^Ty.
\]

After standardization,

\[
z_q=
\frac{q^TVS^{-1}U^Ty}
{\sqrt{q^TVS^{-2}V^Tq}}.
\]

Let `d=V^T delta`, `c=V^T q`, and

\[
\sigma_q=\sqrt{\sum_i(c_i/s_i)^2}.
\]

Then

\[
\rho=\operatorname{Cov}(z_0,z_q)
=\frac{c^Td}{\mu_0\sigma_q},
\qquad
\mu_q=\frac{c^Td}{\sigma_q}
=\boxed{\rho\mu_0}.
\]

Therefore the exact two-statistic covariance and mean are

\[
C=\begin{pmatrix}1&\rho\\\rho&1\end{pmatrix},
\qquad
m=\begin{pmatrix}\mu_0\\\rho\mu_0\end{pmatrix},
\]

and their joint Mahalanobis response is

\[
\boxed{m^TC^+m=\mu_0^2}.
\]

The terminal statistic adds neither rank nor signal-to-noise. This is not an approximation: the largest numerical identity residual over 13 seeds was `1.08e-19`.

## Candidate comparison

All thresholds below use the earlier one-sigma displacement criterion and the same 95% covariance guard, `sqrt(chi2_0.975(382)/382)=1.070845`. They should not be confused with the preceding run's 80%-power first-passage criterion.

| Architecture | Meaning | Current-noise coverage | Guarded 12/13 epsilon ceiling |
|---|---|---:|---:|
| Existing pole/residue | Full retained calibrated experiment | 0/13 | `2.65935e-5` |
| Same-data terminal + pole/residue | Terminal value reconstructed from identical repeats; full cross-covariance used | 0/13 | `2.65935e-5` |
| Independent direct terminal + pole/residue | Optimistic separate endpoint sample with independent noise | 8/13 | `1.13122e-4` |
| Direct terminal, innovation component only | Counts only `q(I-VV^T)` beyond old row space | 2/13 | `3.70355e-5` |

The terminal-kernel novelty sine varies only from `0.043496` to `0.043826` across the 13 empirical covariance seeds.

## Source / inference / conjecture boundary

- **Source fact:** the archive insists that a literal modeled filament/readout should not be replaced by bookkeeping; the H(s)H inverse-map theorem says algebraic reuse of the same observables cannot break an internal degeneracy.
- **Derived result:** a terminal occupancy estimate made from the same calibrated pole/residue repeats is exactly covariance-redundant for each fixed tail contrast.
- **Derived conditional result:** even an optimistic independent direct endpoint misses the declared 12/13 criterion at `epsilon=3e-4`.
- **Open physical edge:** a truly simultaneous terminal detector could have nonzero cross-channel noise not present in this fixture. Its covariance must be measured from an actual joint acquisition; it cannot be inferred from the spectral estimator or selected to improve recovery.

## Failure condition and disposition

The declared failure condition is met:

\[
\epsilon_{12/13}^{\rm same}=2.65935\times10^{-5}
<3\times10^{-4}.
\]

Close cumulative occupancy as a same-data gain/mass channel for this spectral fixture. Do not add another readout transform to this chain. This closes neither the finite carrier nor direct finite-interface tomography.

## Prediction status

No external empirical prediction is earned.

## Exact next dependency

**Ravel:** leave the spectral fixture and return to literal finite-core geometry. Using the already-derived covariance-matched `B^3` versus `S^2` occupancy curves, determine the smallest preregistered set of resolver half-thicknesses `h/R` that discriminates the two carriers at 95% confidence with 192 specimen/tare repeats, without fitting carrier labels or using moments already matched by construction.

