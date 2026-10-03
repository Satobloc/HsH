# Ravel sandbox checkpoint — frozen gate-bank matched-filter closure

**Status:** GEN/CANDIDATE. This is a bounded solver result, not canonical H(s)H theory.

## Exact question

Can covariance whitening over the already frozen six finite-time gates close the late-tail precision gap at single-repeat noise `epsilon=3e-4` and `R=192` specimen plus `R=192` matched-tare repeats, without changing a gate or adding a constitutive mode?

## Sources actually consulted

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT-TO-STANDARD 2.txt` — **full sequential fetch/read**. Historical construction retained: the SAT time sheet is most conservatively typed as a spacelike foliation/clock-field wavefront, and competing sheet/filament pictures should be treated as foliation or frame choices rather than distinct ontologies. Its historical lattice, particle, mass, and universal-angle claims were not imported.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md` — **full sequential read**. Retained result: two observables can recover different combinations of one-sided support (`rho_+` from the topology threshold and `rho_++rho_-` from maximum contact measure); identifiability therefore depends on genuinely independent readouts, not repeated naming of one readout.
- Google Drive query `matched filter gate covariance` — **targeted index check; no results**.
- Public Slack search for `"matched filter"` and `covariance` in channel `C0C09NV79CL` — **targeted collision check**. It found the current Ravel lineage and other covariance packets, but no prior derivation of this six-gate matched filter.

No broad field scan was performed.

## SAT to current H(s)H translation

The old time-sheet picture becomes a declared resolving map acting on a finite-core history. A set of time gates is therefore a set of measurement functionals, not six new physical layers. Correlated-noise whitening may form a better coordinate on those functionals, but cannot create information outside their span. This is the readout analogue of the asymmetric-core result: different summaries matter only insofar as they carry independent geometric combinations.

## Frozen objects and assumptions

The relaxation grid, 13 tail displacements, native pole/residue responses, and gates were inherited unchanged. The six gate times are

\[
T=(96, 49.33945, 0.015, 0.0291856, 25.35814, 0.110490),
\]

with kernels

\[
G_T(\tau)=e^{-T/\tau}-e^{-2T/\tau}.
\]

Before tail scoring, the noise family was frozen as a unit-marginal Ornstein–Uhlenbeck covariance in log gate time,

\[
C_{ij}=\exp\!\left[
-\frac{|\log(T_i/T_j)|}{\log2}
\right].
\]

This assigns one-octave correlation length. Its eigenvalues range from `0.52699` to `1.61953`, with condition number `3.07316`; the result is not driven by a nearly singular covariance.

## Derivation

For gate-signal vector `s` and filter weights `w`, the corrected specimen-minus-tare mean has

\[
\operatorname{Var}(w^T\bar n)
=\frac{2\epsilon^2}{R}w^TCw.
\]

For a declared template `v`, the maximum-SNR linear filter is

\[
w_v=\frac{C^{-1}v}{\sqrt{v^TC^{-1}v}}.
\]

The preregisterable template was fixed without the 13 seed outcomes:

\[
v_i=\left\langle G_{T_i}(\tau)\right\rangle_{log\tau,;12<\tau\le48}.
\]

Its unit-variance weights in the original gate order are

\[
(-0.05785, 0.24235, 0.000916, 0.002371, 0.89308, 0.02154).
\]

For comparison only, the per-seed oracle ceiling is

\[
\mathrm{SNR}_{\rm oracle}
=\frac{\sqrt{s^TC^{-1}s}}{\sqrt{2/R}\,\epsilon}.
\]

Because it uses a different filter for every already-known displacement, this oracle is not an implementable preregistered detector. It is an upper bound on every linear combination of the frozen bank.

Both filter responses were combined in quadrature with the already-recorded native whitened response. The same 95% variance-estimation guard used in the preceding run was retained:

\[
g_{0.95}=1.07084545,
\qquad \nu=2(R-1)=382.
\]

## Candidate comparison

| Readout architecture | Guarded 12/13 noise ceiling | Gain over single `[96,192]` gate | Shortfall from `3e-4` | Repeat-only burden per arm |
|---|---:|---:|---:|---:|
| Frozen single late gate | `1.35706e-5` | 1.00x | 22.11x | 93,832 |
| One preregistered six-gate matched filter | `3.04445e-5` | 2.243x | 9.854x | 18,644 |
| Per-seed oracle linear-filter ceiling | `3.29044e-5` | 2.425x | 9.117x | 15,961 |

At the existing noise floor, the guarded count is **2/13** for both the preregistered filter and the oracle ceiling. The corresponding guarded 13/13 ceilings are `1.44420e-5` and `1.55657e-5`.

## Surviving result

Within the declared stationary covariance, covariance whitening materially improves the readout but cannot close the gap. More strongly, because the per-seed oracle is the maximum-SNR linear combination of the six measurements, **no linear filter confined to this frozen six-gate span can reach guarded 12/13 coverage at `epsilon=3e-4`, `R=192`.**

This closes the proposed linear matched-filter repair for the six-gate architecture under the declared covariance. It does not reject finite resolving thickness or late-time discrimination generally.

## Source / inference / conjecture boundary

- **SRC/HISTORICAL:** the archive supplies the time-sheet/foliation translation and a worldline-to-readout distinction.
- **SAT/DERIVED within the local asymmetric-support model:** independent observables recover distinct one-sided-support combinations.
- **GEN/DERIVED within this numerical fixture:** the generic and oracle precision boundaries above.
- **GEN/CANDIDATE:** a continuously weighted, zero-DC lock-in readout may access a stronger late-time direction outside the six rectangular gates.

## Failure conditions

The numerical closure must be revisited if:

1. measured gate noise is not approximately stationary in log gate time;
2. specimen/tare correlation invalidates the `2 epsilon^2/R` covariance;
3. a fresh tail ensemble has a materially different displacement subspace;
4. a claimed improvement changes a gate, uses seed-specific weights, or estimates covariance after inspecting tail outcomes;
5. covariance uncertainty is large enough that the frozen inverse-covariance filter becomes unstable.

## Prediction/test status

No external physical prediction is earned. The run produces a falsifiable solver result: under the declared covariance and budget, the six-gate linear span cannot meet the 12/13 criterion.

## Exact next dependency

Derive a continuous finite-duration temporal weighting `w(t)` on the already declared response interval, constrained to zero DC/tare response and unit stationary-noise norm. Before tail scoring, choose it by maximizing leverage on the unresolved `tau>12` spectral subspace while projecting out the existing pole/residue row space. Then test the unchanged 13 tails. If its oracle upper bound also remains below `epsilon=3e-4`, retire late-time linear readout at this intervention budget rather than adding more gates.

