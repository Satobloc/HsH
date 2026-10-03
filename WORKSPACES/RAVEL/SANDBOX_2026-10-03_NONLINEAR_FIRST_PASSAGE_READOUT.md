# Ravel sandbox checkpoint — nonlinear first-passage readout

**Status:** GEN/CANDIDATE structured readout failure. This result concerns an event-time readout of the frozen relaxation histories, not a new carrier mechanism or a physical phase transition.

## Exact question

After the smooth zero-DC linear family failed, can a threshold-crossing time calibrated exclusively from tare histories recover at least 12 of the same 13 relaxation-tail perturbations at single-repeat noise `epsilon=3e-4` and `R=192` specimen/tare repeats?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/H UNIVERSES/H_UNIVERSE_DESIGN.txt` — **substantial sequential read**. The controlling user-authored instruction asks for nonlinear threshold behavior that changes regime without forcing runaway, and for dense telemetry that exposes when and why an event occurs. Generated simulator equations and claims of emergent physics were not promoted.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_104_EXACT_FINITE_SLAB_FOLD_DISCRIMINATOR.md` — **full sequential read**. It supplies the finite-resolver warning: thresholded or integrated readouts may have folds and branch ambiguity; an event readout must not silently be identified with unique underlying geometry.
3. Google Drive searches for `first passage threshold crossing tare` and `nonlinear event time readout` — **targeted search/index coverage**. No relevant construction was found; the only returned file was an unrelated broad conversation spreadsheet and was not used.
4. Public Slack `#all-hsh-working-group-one` searches for `"first passage"` and `"threshold crossing"` — **targeted search coverage**. No prior implementation was found.

## Source / inference / conjecture boundary

- **Source fact:** threshold behavior is useful only with diagnostic state/time telemetry and should not be hard-coded as physical truth.
- **Source fact:** finite-slab readouts can be non-injective; a crossing event need not uniquely identify carrier geometry.
- **Inference:** a valid nonlinear repair must freeze its false-alarm threshold from tare histories before exposing the tail ensemble.
- **Sandbox construction:** direct cumulative intersection-state histories with a tare-calibrated first-passage time.

## Construction

Use the cumulative relaxation-state kernel

\[
Q(t;\tau)=1-e^{-t/\tau}
\]

on `t in [0.015,192]`. For a frozen spectral displacement `delta mu`,

\[
s(t)=\sum_k\delta\mu_k Q(t;\tau_k).
\]

The observed specimen-minus-tare history is

\[
Y(t)=s(t)+\sigma_{\rm eff}Z(t),
\qquad
\sigma_{\rm eff}=\sqrt{2/R}\,\epsilon,
\]

where `Z` has the same frozen one-octave OU covariance in log time used by the preceding gate tests. The nonlinear readout is

\[
T_\times=\inf\{t:|Y(t)|\ge b_\alpha\sigma_{\rm eff}\}.
\]

The familywise threshold was frozen from 60,000 null histories with a 95% nonparametric upper-confidence guard on the 95th percentile:

\[
b_\alpha=3.45814.
\]

An independent 60,000-history tare batch returned false-alarm rate `0.05068`. Power used 30,000 additional histories per seed. Success was preregistered as at least 12/13 seeds reaching 80% power at `alpha=0.05` and `epsilon=3e-4`.

## Candidate comparison

| Frozen readout | Tails at >=80% power, current noise | 12/13 epsilon boundary |
|---|---:|---:|
| Impulse-history first passage | 0/13 | not promoted |
| Cumulative occupancy first passage | 2/13 | `3.60728e-5` |
| Single terminal occupancy at `t=192` | 2/13 | `4.20266e-5` |

The terminal sample outperforms the nonlinear crossing time. All tail displacements grow mainly at late times; searching 320 possible crossing times therefore pays a look-elsewhere penalty without gaining an earlier characteristic event.

The endpoint kernel

\[
q_{192}(\tau)=1-e^{-192/\tau}
\]

has principal-angle novelty sine only `0.04372` relative to the frozen 22/97 pole/residue row space. Its apparent gain is therefore mostly an almost-constant total spectral-mass/gain direction, not a clean new tail coordinate.

## Failure and surviving discriminator

The declared failure condition is met: only 2/13 tails reach 80% power rather than 12/13. A threshold crossing does not rescue the late-tail problem at the present intervention budget.

The useful discriminator is nevertheless sharper:

\[
\text{event-time value requires an actual earlier event morphology;}\quad
\text{monotone late accumulation favors a terminal readout.}
\]

Thus a first-passage interpretation should be rejected for this fixture. The stronger endpoint statistic is likely a gain/total-mass channel already largely represented by the calibrated pole/residue experiment.

## Prediction/test disposition

No external prediction is earned. Internal falsification target: any proposed threshold-crossing repair on the unchanged histories must beat both the tare-only `b_alpha=3.45814` boundary and the terminal-occupancy power curve without using tail outcomes to choose the threshold or time window.

## Exact next dependency

**Ravel:** compute the full joint covariance between terminal occupancy and the existing pole-location/residue estimator using the same calibrated repeats. Project the endpoint channel through that covariance. If its guarded joint 12/13 boundary does not exceed `epsilon=3e-4`, close cumulative occupancy as a redundant gain direction and leave this spectral fixture rather than adding another readout transformation.

