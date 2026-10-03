# Ravel sandbox checkpoint — continuous zero-DC temporal readout null

**Status:** GEN/CANDIDATE structured null. This closes one readout architecture at the declared intervention/noise budget; it does not reject a finite core, SAT, or H(s)H.

## Exact question

Can one scalar, finite-duration, smooth temporal readout on the resolving-intersection history recover the already frozen unresolved relaxation tail (`tau > 12`) at single-repeat noise `epsilon = 3e-4` and `R = 192` matched specimen/tare repeats, without changing the 13 tail specimens or adding a constitutive mode?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/WHIRLIGIG -- REDEFINING SUCCESS.txt` — **full sequential read**. I used Nathan's methodological correction that an admissible constrained transformation path can be a valid success even when a unique inversion is unavailable, and that embedding/coupling/projection/equivalence rules must be stated. Generated ontological confidence language was not promoted.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_133_CURVATURE_FREE_B2_RADIUS_RECONSTRUCTION.md` — **full sequential read**. I used the typed-observable lesson: a residual degeneracy is broken only by an independently typed datum; combining readouts is not new object structure.
3. Google Drive targeted searches for `zero DC temporal readout late time tail` and `late-time readout` — **metadata/search coverage only**. No relevant technical source was found; one unrelated spreadsheet was returned.
4. Public Slack channel `#all-hsh-working-group-one`, targeted searches for `"zero DC"` and `readout` — **targeted read/search coverage**. No earlier zero-DC continuous-filter derivation was found. The search recovered this run's frozen causal-zero, orthogonal-gate, single-gate, and six-gate precursor chain, so the present step is continuous with—but not duplicated by—that chain.

## Source / inference / conjecture boundary

- **Source fact:** old SAT requires explicit admissible representation/readout maps rather than a target-matching transformation.
- **Source fact:** the H(s)H B2 reconstruction separates object structure from the independently typed observable needed to break a degeneracy.
- **Inference:** the six discrete gates should be replaced by one continuous linear functional only after its function class, DC response, and noise norm are fixed independently of the tail outcomes.
- **New sandbox construction:** an 18-function cubic B-spline weight on log time, constrained to zero DC and unit one-octave OU-noise norm, selected by projected tail leverage outside the frozen pole/residue row space.

## Construction

The object is one scalar linear readout functional on a finite intersection history, not a new finite-core object:

\[
y_w=\int_{0.015}^{192}w(t)x(t)\,dt.
\]

The causal relaxation impulse response is

\[
h(t;\tau)=\tau^{-1}e^{-t/\tau},
\]

whose integral on `[T,2T]` reproduces the previously frozen gate kernel. Let `w(t)=sum_j beta_j B_j(log t)` with 18 cubic B-splines. Impose

\[
\int w(t)\,dt=0,
\qquad
\iint w(t)C(t,t')w(t')\,dt\,dt'=1,
\]

with

\[
C(t,t')=\exp\{-|\log(t/t')|/\log 2\}.
\]

Let `V_old` be the frozen 22-dimensional identifiable row space of the calibrated pole/residue operator, `P_perp=I-V_old V_old^T`, and `D_tail=diag(1[tau>12])`. The filter is chosen, before reading any seed displacement, from the leading generalized eigenvector of

\[
Q=A^T H P_\perp D_{tail}P_\perp H^T A,
\qquad
Q\beta=\lambda M\beta,
\]

inside the exact zero-DC nullspace. Here `A` includes time quadrature, `H_ik=h(t_i;tau_k)`, and `M=A^T C A`.

Numerical constraints close to machine accuracy: DC residual `-1.39e-13`; noise norm `1.0000000000`. The selected spectral kernel has novelty sine `0.04229` relative to the old row space. Its projected energy fraction actually lying above `tau=12` is only `0.001687`: zero-DC plus the frozen noise metric prevents a high-amplitude clean tail channel.

## Candidate comparison and failure

| Candidate | Guarded 12/13 epsilon ceiling | Resolved at epsilon=3e-4 |
|---|---:|---:|
| Frozen single `[96,192]` gate | `1.35706e-5` | `0/13` |
| Frozen six-gate generic filter | `3.04445e-5` | `2/13` |
| Frozen six-gate per-seed oracle | `3.29044e-5` | `2/13` |
| Smooth zero-DC selected filter | `6.58722e-6` | `0/13` |
| Smooth zero-DC same-basis per-seed oracle | `1.03139e-5` | `0/13` |

The oracle is a feasibility ceiling, not an implementable filter: each seed receives its own best weight within the same smooth, zero-DC, unit-noise space. It still fails all 13 at the current noise. A 36-case sensitivity grid—12/18/24/30 splines, 200/320/500 time samples, and ridge scales `1e-10/1e-12/1e-14`—never exceeds `1.03765e-5` for the oracle 12/13 boundary; the best individual seed reaches only `1.68461e-4`; maximum current-noise coverage remains `0/13`.

**Failure condition met:** the oracle resolves fewer than 12/13 fixed tails at `epsilon=3e-4`. Therefore retire the smooth late-time linear readout under this function class, covariance family, time support, repeat budget, and zero-DC constraint. The null is about a readout architecture, not the carrier.

## Prediction/test disposition

No external prediction is earned. The result is a preregisterable internal falsification packet: any implementation claiming recovery by this architecture must reproduce a unit-noise, zero-DC functional whose same-basis oracle beats the stated ceiling on the unchanged 13 tails. Otherwise it is changing the specimen, noise model, support, or operator class.

## Exact next dependency

**Ravel:** leave linear late-time weighting and test one genuinely different typed readout: the frozen nonlinear first-passage/threshold-crossing time of the resolving-intersection history, with the threshold fixed from tare data alone. Compare its 13-tail oracle ceiling at the same `epsilon=3e-4, R=192`; do not add material modes or retune the tails.

