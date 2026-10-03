# Ravel sandbox checkpoint — frozen late-gate precision burden

**Status:** GEN/CANDIDATE; sandbox result, not canonical H(s)H theory.

## Exact question

With the previously frozen late-time readout

\[
G_{96,192}(\tau)=e^{-96/\tau}-e^{-192/\tau},
\]

what single-repeat additive precision is required, with 192 specimen repeats and 192 matched-tare repeats, for at least 12 of the 13 already-fixed zero-tail perturbations to exceed one joint whitened standard deviation? No gate endpoint, tail seed, or threshold is retuned after seeing the result.

## Sources actually read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/.[⚙️_AI_FILES]/LLM_WORKSPACES/Argus/XW-012_NAIVE_TIMESHEET_TO_FINITE_SLAB_LINEAGE.md` — **full sequential read**. Source fact used: Nathan proposed replacing the naïve zero-thickness timesheet by a finite slab with flow dynamics; the slab thickness and core radius are distinct quantities; an exact thickness/readout kernel remained unresolved.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_136_CROSSOVER_INVERSE_MAP_IDENTIFIABILITY.md` — **full sequential read**. Source fact used: an effective incidence/support profile can be identifiable while its decomposition into core profile and resolving thickness is not; a thickness-sensitive observable is required to break that degeneracy.
- Google Drive targeted search, `late time gate tare covariance relaxation spectrum` — **targeted index check; no results**.
- Slack channel `C0C09NV79CL`, targeted search for `"late-time gate" "noise"` — **targeted index check; no results**.

No external literature scan was performed.

## Translation into current H(s)H language

The old SAT timesheet becomes a finite resolving operator, not a passive geometric plane. A finite core supplies a relaxation spectrum. The resolving slab integrates that spectrum over a declared interval. The earlier centerline model is the limit in which transverse support collapses and only its integrated amplitude survives. The thickness/core degeneracy therefore cannot be broken by the native response alone; it needs a second readout whose temporal support differs from the native one.

## Construction

### Definitions frozen before scoring

- Thirteen tail-perturbed spectra and their native readout responses are inherited unchanged from `spectral_causal_zero_nullspace.json` and `spectral_causal_zero_expanded_support.json`.
- The auxiliary resolving slab is the previously frozen interval `[96,192]`.
- Each specimen is corrected by an independently measured unit-impulse tare.
- There are `R=192` specimen repeats and `R=192` tare repeats.
- Each single repeat has independent additive standard deviation `epsilon` in the dimensionless readout normalization.

For a tail displacement `delta w(tau)`, the auxiliary signal is

\[
\delta y_G=\int G_{96,192}(\tau)\,\delta w(\tau)\,d\tau.
\]

The corrected mean has standard deviation

\[
\sigma_G=\sqrt{\frac{2}{R}}\,\epsilon.
\]

If `r_0` is the already-recorded native whitened response, the joint two-readout response is

\[
r_{\mathrm{joint}}(\epsilon)=
\sqrt{r_0^2+
\left(\frac{|\delta y_G|}{\sqrt{2/R}\,\epsilon}\right)^2}.
\]

Solving `r_joint=1` gives the per-seed maximum tolerable single-repeat noise

\[
\epsilon_{\max}=
\frac{|\delta y_G|\sqrt{R/2}}{\sqrt{1-r_0^2}}.
\]

Because the specimen and tare variances are estimated rather than known, a preregistered 95% upper standard-deviation guard is applied using `nu=2(R-1)=382` degrees of freedom:

\[
g_{0.95}=\sqrt{\frac{\chi^2_{0.975,382}}{382}}
=1.07084545,
\qquad
\epsilon_{\max}^{\mathrm{guard}}=epsilon_{\max}/g_{0.95}.
\]

## Result

| Criterion | Point boundary | 95% guarded boundary | Improvement from `epsilon=3e-4` | Repeats per specimen and tare if noise is unchanged |
|---|---:|---:|---:|---:|
| At least 12/13 tails exceed 1σ | `1.45320e-5` | `1.35706e-5` | `22.11x` | `93,832` |
| All 13 tails exceed 1σ | `6.82911e-6` | `6.37730e-6` | `47.04x` | `424,884` |

The count under the point estimate is:

| Single-repeat noise `epsilon` | Tails above 1σ |
|---:|---:|
| `3e-4` | 0/13 |
| `1e-4` | 2/13 |
| `5e-5` | 7/13 |
| `2e-5` | 10/13 |
| `1.5e-5` | 11/13 |
| `1e-5` | 12/13 |
| `6e-6` | 13/13 |

## Boundary between source, inference, and conjecture

- **Source fact:** finite resolving thickness was proposed historically, and current H(s)H work identifies an unresolved profile/thickness inverse-map degeneracy.
- **Inference from the frozen numerical specimen:** the `[96,192]` gate is geometrically sensitive to every tested tail but is not experimentally sufficient at `epsilon=3e-4`; zero of 13 tails cross the declared 1σ criterion.
- **New sandbox conjecture:** a finite resolving slab may act as a genuine discriminator only when its late-time channel is measured with lock-in/matched-filter precision, rather than by raw repeated integration. This is a proposed architecture, not an established mechanism.

## Surviving discriminator and failure condition

The surviving result is a precision boundary, not a particle assignment or a physical prediction. Under the stated independent-noise model, the frozen gate requires `epsilon <= 1.35706e-5` for guarded 12/13 coverage. The result fails as an H(s)H discriminator if any of the following holds:

1. the tare and specimen noises are materially correlated or nonstationary, invalidating `sqrt(2/R)` scaling;
2. the late-time signal is not reproducible under a preregistered gate;
3. the 12/13 boundary shifts materially under a fresh, independently generated tail ensemble;
4. achieving the required precision requires changing the gate after inspecting tail outcomes.

## Test / prediction candidate

This run earns a solver-test candidate, not an external empirical prediction. Freeze the existing six-window gate bank and a stationary additive-noise covariance before scoring. Derive the covariance-whitened matched filter and test whether it brings at least 12/13 fixed tails above 1σ at `epsilon=3e-4`, `R=192`, without adding a constitutive mode or changing the windows. A miss is a clean rejection of this readout architecture at the declared intervention budget.

## Exact next dependency

Derive the optimal linear matched filter over the already frozen six gate windows under a declared stationary-noise covariance, then determine whether the guarded 12/13 precision burden falls below `epsilon=3e-4` at `R=192`. Freeze the covariance family before tail scoring.

