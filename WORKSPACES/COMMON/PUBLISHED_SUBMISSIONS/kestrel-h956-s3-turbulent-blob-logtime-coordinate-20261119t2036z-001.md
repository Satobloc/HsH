# Kestrel h956:s3 | Turbulent-blob sampling clock, physical time, and virtual-origin separation

**Disposition:** `SOURCE_BASED_ARCHITECTURE_IMPROVEMENT / P2_CANDIDATE_ONLY / NO_RAW_DATA_REANALYSIS / LEAN_PENDING / NO_H(s)H_TIME_MAP`.

## 1. Rotation, authority, and scope

Nominal UTC hour `h=956` (2026-11-19 20:00Z): `seq=5h+3=4783`; `4783 mod 19 = 14`. Selected ring label: **Kestrel**, index 14; next: **Meridian**, index 15.

This is assistant reconstruction under a deterministic ring label, not authenticated participation by the historical Kestrel instance or a current Kestrel thread. Kestrel's recovered direct role-setting messages in the historical *Science Made Stupid* conversation (conversation `6ab070ce-2384-83e9-b76f-4661c55867c4`, raw blob `100267f3f11f3cce09c7d802ce85ad03879d5744`) establish a trust-first, forward-looking, cross-boundary synthesis-companion remit. Kestrel is not the primary auditor, formal-verification owner, or experimental-data acquisition lane. This is a one-run Lane 36 overlay; the standing Kestrel geometry cursor is not replaced.

The improvement is a source-specific temporal-coordinate contract for the P2 turbulent-blob candidate. It does not select that system, add a physical mechanism, or promote a theory claim.

## 2. The new distinction: three clocks and two origins

Matsuzawa, Zhu, Goldenfeld and Irvine deliberately use a nonuniform acquisition schedule. For the `n=-2` trigger design, Supporting Information §A.4 gives

\[
\Delta(t)=(t-t_0)\exp\!\left(\frac{d}{\sqrt{2c}}-1\right),
\qquad
\tau(t)=\log(t-t_0).
\]

Here `d` is the target particle displacement and `c` is the amplitude in the assumed decay law `q=c(t-t0)^n`; it is not the later closure coefficient `c₀`.

Let

\[
\rho=\exp\!\left(\frac{d}{\sqrt{2c}}-1\right)>0,
\qquad
t_{k+1}=t_k+\rho(t_k-t_0).
\]

Then

\[
t_{k+1}-t_0=(1+\rho)(t_k-t_0),
\qquad
\tau_{k+1}-\tau_k=\log(1+\rho).
\]

Thus the ideal `n=-2` trigger schedule is equally spaced in **logarithmic sampling coordinate** `τ`, not in laboratory time `t`. The source uses `τ` to make the sampling/visualization convenient; the turbulent-energy PDE remains written in physical time `t`. This is a sampling-coordinate transformation, not a physical time dilation, a new temporal dimension, or evidence that an H(s)H time-surface equals `τ`.

The required clock ledger keeps these fields distinct:

| Field | Meaning | Evidence status |
|---|---|---|
| `t_lab` | Physical/laboratory timestamp | Must come from acquisition metadata |
| `k_frame` | Integer sample index | Acquisition record |
| `Δt_k` | Actual trigger interval between samples | Source-reported range; per-frame series not acquired here |
| `τ_k` | `log(t_lab - t0_schedule)` analysis/sampling coordinate | Derived coordinate |
| `t0_schedule` | Virtual origin used to design the trigger schedule | Source uses a power-law assumption; exact per-run manifest not acquired |
| `t0_fit` | Virtual origin selected in scaling regression/cross-validation | Fitted parameter, not an observed event |
| `t_stop` | Physical forcing-stop / last-ring-arrival event time | Separate physical event record |
| `σ_t` | Timestamp/trigger uncertainty and clock calibration | Not recovered in the inspected source/data summary |

The paper uses `t₀` in both the sampling derivation and scaling fits. Until the per-run acquisition manifest establishes whether those values coincide, `t0_schedule` and `t0_fit` must remain separate provenance fields. Neither is interchangeable with `t_stop`.

## 3. What the measured record actually says

Primary source: Matsuzawa et al. (2026), “Nonlinear diffusion and decay of a blob of turbulence spreading into a quiescent fluid,” *PNAS* 123(7), e2526858123. DOI: `10.1073/pnas.2526858123`. Supporting Information: §A.4–A.5 and Table S7. Figure-data deposit: Zenodo DOI `10.5281/zenodo.18380405`; associated University of Chicago Knowledge record DOI `10.6082/bztvb-5gq91` (version 1, 2026-02-12).

Source-reported acquisition facts:

- The long PIV record spans 1050 s (17.5 min); frame intervals range from 2.5 ms to 1 s.
- The ratio of the largest to smallest reported interval is `1 s / 0.0025 s = 400`. This is the **range ratio**, not the per-frame geometric growth factor `1+ρ`.
- The PIV image scale is 86 μm/pixel. The trigger is designed to keep particle displacement within the PIV dynamic range; the SI discusses approximately 1–16 pixels.
- The study reports 2D2C PIV ensembles for large and small blobs (`n=21` and `n=10` respectively) and a separate single-realization 3D PTV record (`n=1`). The single 3D PTV realization is not an independent replicated 3D holdout.
- The paper tests trigger designs corresponding to `n=-1,-2,-3` and reports similar PIV quality. The `n=-2` schedule is an acquisition design choice, not a claim that every measured decay exponent equals `-2`.

Table S7 reports fitted power-law exponents and virtual origins that differ by dataset: large blob `n≈-1.32`, `t₀≈-0.15 s`; small blob `n≈-1.10`, `t₀≈-1.5 s`; double-grid `n≈-2.04`, `t₀≈-2.72 s`; single-grid `n≈-2.06`, `t₀≈-1.63 s`. These are source-reported fit outputs, not new estimates from raw data. The difference between the acquisition trigger assumption and the fitted physical decay exponent is precisely why the trigger coordinate must not be mistaken for the dynamics.

The SI's virtual-origin/exponent cross-validation splits the fitting interval into equal-count subregions and uses a geometric midpoint in its displayed convention, `t_m = sqrt(t_a t_b)`. With log-spaced samples, equal counts correspond to approximately equal spans in log-time, not equal durations in laboratory time. This is an explicit weighting/design choice, not automatically an error. A reproduction must preserve the source's exact shifted-time convention rather than silently reinterpret `t_a,t_b` as absolute timestamps.

No raw Zenodo/HDF5 bytes, per-frame timestamp series, or per-run acquisition manifest were acquired in this run. No raw-data fit, reanalysis, timestamp-uncertainty estimate, or independent measurement is claimed.

## 4. Lean 4 / Mathlib formalization

A source-linked module was added to the existing isolated formal-verification project:

- Draft PR: [#2126](https://github.com/Satobloc/HsH/pull/2126)
- Branch: `research/kestrel-logtime-sampling-20261119t2036z`
- Exact PR head at submission: `f513a24e663076313988c8f8ed0c9b53590dee4b`
- Module: `FORMAL_VERIFICATION/HsHVerification/KestrelLogTimeSampling.lean`
- Module blob: `c935dd53e5ecefe314bd7613ebbcd9e8cc54d9f3`
- Base: `infra/lean4-verification-20261023`; the current `main` branch does not carry the active Lake project.

The formalized results are the source-step offset identity, constant log-clock increment for the `n=-2` schedule, and positivity of that increment. Exact rational `#eval` checks use the source-reported values `1 s`, `2.5 ms`, and `1050 s`, returning `400` and `35/2` minutes. The module prints theorem-specific axiom dependencies.

At report creation, exact-head checkout had passed in Actions run `44611776425`; Lake dependency-manifest generation was still in progress. Therefore the state is `LEAN_PENDING`, not `LEAN_VERIFIED`. The project pins Lean 4.34.0 and Mathlib v4.34.0 but does not commit a generated `lake-manifest.json`; tests, lint, global axiom audit, leanchecker and nanoda are not run by the existing workflow. These limits must remain visible even if the build succeeds.

The theorem verifies only the discrete mathematical coordinate identity. The continuous chain-rule conversion of a PDE from `t` to `τ` is identified as a required next formalization, not yet proved in this module. Neither result authenticates the source translation, validates the PIV timestamps, proves the turbulent PDE, or establishes any physical H(s)H proposition.

## 5. Lane 36 prediction architecture

The useful H0/H1 distinction is now explicit:

| Item | H0: standard turbulent-energy closure | H1: H(s)H extension |
|---|---|---|
| Physical time | Laboratory `t` | Must map explicitly to laboratory `t` |
| Sampling coordinate | Trigger/index map `k ↔ t ↔ τ` | Same instrument map; `τ` is not a new physical field |
| Measured inputs | Initial `q`, measured/filtered `ℓ(t)`, calibrated PIV fields | Same shared inputs unless H(s)H independently predicts `ℓ(t)` |
| Parameters | Frozen `c₀`, `ε₀`, virtual-origin and preprocessing choices | Source-authorized geometric/constitutive parameters, not yet defined |
| Predicted outputs | Held-out `q(x,y,t)`, front profile and moment-based radius | Must map worldtube/timesheet state to the same physical-time observables |
| Holdout | Entire independent realizations, not adjacent frames | Same holdout, sealed before tuning |
| Falsification | Pre-registered covariance-aware residual outside the frozen H0 predictive region | Failure to predict held-out physical-time fields without retuning geometry, `t₀`, trigger law or calibration |

The paper's fitted virtual origin, logarithmic trigger law and cross-validation weighting are part of the observation/fitting architecture. They are not free physical degrees of freedom for H(s)H to absorb.

A decisive coordinate check is: re-express the same frozen physical-time prediction in `τ`, apply the correct chain-rule/Jacobian transformation, and transform back. The predicted physical-time field must be invariant within numerical and measurement uncertainty. If the result changes because sample index or `τ` was treated as physical time, the implementation fails its coordinate contract.

A stronger empirical schedule test would require matched-condition independent acquisitions under constant-rate and logarithmic triggering. The inspected study does not provide a demonstrated same-condition matched pair for that test. Its existing runs must not be relabeled as such.

No numerical falsification threshold is instantiated: the per-frame timestamp uncertainty, full calibration covariance, and raw realization-level covariance were not acquired. The threshold must be preregistered from those quantities before holdout unblinding.

## 6. What is forced, and what remains optional

**Forced by this source:** a nonuniform acquisition-time map; explicit physical timestamps; a distinct logarithmic sampling coordinate for the `n=-2` trigger design; and separation of the virtual origin used in fitting from physical event times.

**Not forced:** physical logarithmic time, an extra time dimension, a specific H(s)H time-surface, worldtube thickness, twist, contact surfaces, or a medium-to-force law. The source is a classical turbulent-energy/transport experiment, not a direct H(s)H constitutive measurement.

The source-faithful chain is:

`physical fluid state → 2D2C PIV acquisition → timestamped velocity samples → derived q(x,y,t) and spectral ℓ(t) → log-time analysis coordinate τ`.

The H(s)H chain remains uninstantiated:

`worldtube/timesheet geometry → ? medium response → ? physical-time q(x,y,t) → PIV observation`.

No analogy supplies either missing map.

## 7. Project boundaries and next cursor

- The PNAS turbulent-blob system remains `P2_CANDIDATE_ONLY / NOT_SELECTED`; P2 remains HOLD.
- The existing Hale h955:s2 source/closure report is not duplicated. Its issue #2122 was rejected for an extra publisher payload key; it was not retried or edited. This Kestrel report adds a distinct time-coordinate/virtual-origin architecture note.
- No SAT-O or Blockwave equation was retrieved, copied, corrected, or modified. Mersearch was not callable and all four request lanes remain occupied; no request was overwritten or retriggered.
- HSH_RESOURCES was used only through its public root/AI routing instructions. No private payload or internal source file was opened. External PNAS literature is treated as prior art and empirical constraint, not as the generative basis of H(s)H.
- No physical calculation beyond exact arithmetic on source-reported acquisition values; no raw-data analysis, fit, prediction, numeric falsification threshold, or independent measurement.
- No Factory Floor intake: the theorem is an acquisition-coordinate identity, not a submitted physical geometry; no precise object plot or independent hostile geometry review exists. This is not a showroom/promotion item.
- No BEDROCK theory promotion, paper-gate advancement, task change, new automation, sixth task, signet, or chat rename.

**Standing Kestrel geometry cursor remains:** recover the raw November 9 spin/timesheet-curvature source and define its missing maps before further formalization, as retained in the h835/h949 continuity records. This Lane 36 overlay adds a bounded subcursor: recover the exact source-authorized physical-time/time-surface map from the relevant Nathan Direct SAT-O/Blockwave originals before attempting to identify it with any external sampling coordinate. Preserve verbatim source equations and separate any corrected reconstruction. The present report is a measurement-architecture constraint, not a replacement for that source recovery.
