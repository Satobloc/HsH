# Run 073 — Block-Hankel TLS recurrence negative control

**Status:** SANDBOX / CLAIMED numerical benchmark / negative result retained  
**Actual start:** 2026-09-20 10:30:11 -04:00

## Question
Can a noise-aware total-least-squares acquisition of the exact order-4 palindromic recurrence from Run 072 recover the two rates from the same noisy 4D coordinate samples, avoiding the ordinary-least-squares errors-in-variables failure?

## Primitive data
Same model family and sampling regime as Run 072: `a=1.2`, `b=0.65`, `w=1.1`; 161 samples on `[-2,2]`, `dt=0.025`; iid Gaussian noise independently added to every 4D coordinate with `sigma=1e-4`. Tested rate gaps `0.1, 0.03, 0.01, 0.003`, 400 trials each.

For each coordinate, form all five-sample windows into one stacked block-Hankel matrix. The smallest right singular vector is the TLS annihilating-filter estimate. Project that vector onto the palindromic family

`h = [1, -s1, s2, -s1, 1]`,

then decode `q=cos(rate*dt)` from

`q^2 - (s1/2) q + (s2-2)/4 = 0`.

No frame/director information is used.

## Result
Noiseless sanity checks succeed: gap `0.10` decoded rates `[1.0, 1.1]`; gap `0.03` decoded approximately `[1.06999997, 1.10000003]`.

Under the stated coordinate noise, however, raw block-Hankel TLS remains catastrophically unstable:

| true gap | valid trials | median relative separation error | 95% relative separation error |
|---:|---:|---:|---:|
| 0.100 | 398/400 | 320.1 | 1244.7 |
| 0.030 | 399/400 | 2428.6 | 4151.4 |
| 0.010 | 400/400 | 8520.3 | 12456 |
| 0.003 | 400/400 | 27905 | 41520 |

## Interpretation
This repairs the narrow OLS errors-in-variables defect but does **not** rescue the raw small-`dt` recurrence representation as a practical coordinate-noise decoder. The exact recurrence remains valid; the acquisition remains ill-conditioned because the roots are clustered extremely near `z=1` and the five adjacent-sample columns are nearly dependent. A generic TLS null-vector estimate can therefore be badly perturbed while still fitting the noisy Hankel structure.

Do not promote this to a theorem about all structured low-rank or recurrence estimators. This run tested one direct block-Hankel TLS construction with palindromic projection. More sophisticated structured low-rank approximation, matrix-pencil/ESPRIT-style subspace methods, decimation/larger lag, or explicitly noise-modeled estimators may behave differently.

## Decision / next cursor
Do not spend the next bite merely swapping OLS for another adjacent-sample recurrence fit. The higher-information next operation is to test whether **lag/decimation itself** removes the small-`dt` conditioning defect while preserving the exact recurrence architecture: construct the same palindromic recurrence at stride `L`, scan a bounded set of `L`, and compare conditioning/recovery at the easy gap `0.1` before any near-collision work. If no reasonable stride restores stable recovery, retain Gram as the practical curve-only baseline and move back toward source-first Whirligig/UI/Hagalaz representation work.

## Provenance / exposure
Mathematical construction follows sandbox Runs 067–072 only. No external literature, historical archive, nLab, PRIOR_ART, quarantine, Kerr, or Kelvin material used. Current Common controls and Meridian checkpoint were reread before work. Suspended Integration handoffs were not executed.
