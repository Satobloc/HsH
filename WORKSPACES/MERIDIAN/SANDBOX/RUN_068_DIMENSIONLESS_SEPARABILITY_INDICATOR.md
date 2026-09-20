# RUN 068 — Dimensionless separability indicator for four-moment decoder

**Status:** SANDBOX / CLAIMED numerical benchmark  
**Date:** 2026-09-20 05:27 -04:00  
**Purpose:** continue Run 067 by asking whether the exact determinant `D=m0 m2-m1^2=AB(x-y)^2` can be normalized by the estimated measurement/noise scale into a useful dimensionless warning indicator.

## Setup

Moment packet:

`m_k = A x^k + B y^k`, `k=0..3`, with `A=a^2`, `B=b^2`, `x=omega^2`, `y=nu^2`.

Fixed numerical state:
- `A=1.44`
- `B=0.4225`
- `x=1.21`
- independent relative Gaussian perturbation of each moment: `epsilon=1e-12`
- 3,000 trials per rate gap.

For `D=m0 m2-m1^2`, first-order propagation of independent relative moment noise gives the estimated one-sigma determinant noise

`sigma_D = epsilon * sqrt(2 (m0 m2)^2 + 4 m1^4)`.

Define the dimensionless determinant separability signal

`eta_D = |D| / sigma_D`.

This is not asserted as a complete condition number. It asks only whether the two-mode determinant is resolved above the assumed moment-noise floor.

## Numeral-by-numeral randomized results

| `Delta=|x-y|` | exact `D` | `eta_D` | median relative frequency-pair error | 95% error | valid decodes |
|---:|---:|---:|---:|---:|---:|
| 1e-1 | 6.084e-3 | 5.077e8 | 1.958e-9 | 5.843e-9 | 3000/3000 |
| 3.162e-2 | 6.084e-4 | 4.949e7 | 1.926e-8 | 5.641e-8 | 3000/3000 |
| 1e-2 | 6.084e-5 | 4.909e6 | 1.909e-7 | 5.662e-7 | 3000/3000 |
| 3.162e-3 | 6.084e-6 | 4.896e5 | 1.977e-6 | 5.650e-6 | 3000/3000 |
| 1e-3 | 6.084e-7 | 4.892e4 | 1.983e-5 | 5.673e-5 | 3000/3000 |
| 3.162e-4 | 6.084e-8 | 4.891e3 | 1.907e-4 | 6.542e-4 | 2946/3000 |
| 1e-4 | 6.084e-9 | 4.891e2 | 2.686e-3 | 7.430e-3 | 2843/3000 |
| 3.162e-5 | 6.084e-10 | 4.891e1 | 2.616e-2 | 7.441e-2 | 2951/3000 |
| 1e-5 | 6.084e-11 | 4.890 | 2.601e-1 | 9.486e-1 | 2988/3000 |

## Result

`eta_D` is a useful **rank-separability warning**, but not by itself an accuracy certificate. In this fixed-amplitude/noise family, reconstruction is already percent-level by `eta_D ~ 50`, and catastrophically unstable for many trials by `eta_D ~ 5`. Thus the naive rule `D is many sigma above zero, therefore the decoded two-rate parameters are reliable` is false.

The observed scaling is consistent with the stronger inverse sensitivity of root separation: `D` itself scales as `Delta^2`, while decoding `S,P` divides by `D` and then resolves roots separated by `Delta`. The exact map therefore compounds sensitivity before exact collision.

## Architectural implication

Use at least two gates:
1. **rank/separability gate:** is `D` resolved above its propagated uncertainty (`eta_D`)?
2. **parameter-recovery gate:** is the requested decoded rate/amplitude accuracy acceptable under perturbation propagation or Monte Carlo?

A native connection/SVD representation should be compared under the **same primitive noise model** before claiming superior conditioning. Adding equal noise directly to `A` is not a fair comparison if `A` itself was reconstructed from noisy curve samples.

## Limits / status

- This is one fixed amplitude ratio and one relative-noise model.
- `sigma_D` uses first-order independent-error propagation.
- No universal switch threshold is claimed.
- The benchmark is `CLAIMED`; it is a computational stress test, not a full validation of the decoder architecture.
- No external literature, PRIOR_ART, nLab, or quarantine material used.

## Next cursor

Construct a fair same-primitive-noise comparison: generate noisy sampled 4D carrier coordinates, estimate both (a) moment/high-derivative packet and (b) connection/frame packet from those same samples, then compare rate-separation recovery as `Delta -> 0`. This tests whether the apparent native-connection advantage survives reconstruction cost rather than assuming the connection is given for free.
