# Meridian Calculation 027 | Forced parity leakage: transported metric versus Euclidean material

**Date:** 2026-10-13. **Status:** SANDBOX, mathematical/conditional numerical result, not a derived H(s)H constitutive law. **Continuation:** [Meridian 026](MERIDIAN_026_TRANSPORTED_METRIC_SYMMETRY_GATE_2026-10-12.md), which supplied the half-turn and metric/material distinction.

## Exact fixture and units

Take dimensionless periodic parameter `s in [0,2pi)` and a radius-one-metre curve

`H(s)=(cos(2s),sin(2s),cos(3s),sin(3s))/sqrt(2) m`.

Let `A=E13+E31`, `S=I+eps A` (`|eps|<1`), `P=diag(1,1,-1,-1)`, `Htilde=S H`, `G=S^-T S^-1`. The periodic elastic operator is

`L0= kappa D_s^4+k I+4 lambda H H^T`

with `kappa=0.05 N/m, k=1 N/m, lambda=1 N/m^3`, periodic boundary conditions through the third derivative, and force `f_eps(s)=S (cos s,0,0,0)^T N`. All response components have units metres. The forcing is deliberately transformed with S to isolate the material-law effect.

## Two different constitutive hypotheses on the identical visible curve

**Transported metric (coordinate-only):** the Riesz operator is
`L_G = kappa D_s^4 + kI + 4lambda Htilde (Htilde^T G)`.
Writing `eta=S zeta` reduces exactly to `L0 zeta=f0`.

**Fixed Euclidean material (physical shear):** `L_E=kappa D_s^4+kI+4lambda Htilde Htilde^T`. In pulled-back variables,
`[L0+4lambda H H^T (S^T S-I)] zeta=f0`.
The two laws have identical sheared carrier `Htilde`, and differ solely in the constitutive metric.

Define the involution `T zeta(s)=P zeta(s+pi)`, and forbidden even sector `zeta_+=(zeta+Tzeta)/2`. Because `T f0=-f0` and `[L0,T]=0`, the transported-metric response has `zeta_+=0` exactly.

For Euclidean material `S^T S=I+2eps A+eps^2 A^2`. Differentiating the forced equation at eps=0 gives

`L0 zeta1 = -8lambda H H^T A zeta0`, with `zeta0=L0^-1 f0`.

The right side is T-even, hence the first-order forbidden response is precisely `eps zeta1`. The positive definite periodic operator L0 is invertible for the stated positive kappa,k and nonnegative lambda.

## Independent numerical result

FFT pseudospectral `D_s^4`, conjugate-gradient solves in the Euclidean physical frame, spectral diagonal preconditioner. Even grids `N=64,96,128` agree on the values shown to at least 11 printed significant digits. The reported observable is the dimensionless G-norm amplitude fraction `q=||zeta_+||_L2/||zeta||_L2`; the forbidden power fraction is `q^2`.

| eps | q, fixed Euclidean material | q, transported metric |
|---:|---:|---:|
| 0 | <2e-16 | <2e-16 |
| 0.005 | 0.002854472410638 | <2e-16 |
| 0.01 | 0.005708870666385 | <2e-16 |
| 0.02 | 0.01141714790387 | <2e-16 |
| 0.05 | 0.02853246351172 | <2e-16 |
| 0.10 | 0.05698999114841 | <2e-16 |
| 0.20 | 0.1133617617868 | <2e-16 |
| 0.30 | 0.1683998150076 | <2e-16 |

Analytic first-order coefficient computed by solving the separate linear sensitivity equation:
`q(eps)=0.570896953746 |eps|+O(eps^2)`.
At eps=0.1, forbidden power fraction is `0.00324785909110` (0.325%); at eps=0.2 it is `0.0128508890354` (1.285%). For eps=0.005 the numerical slope differs from the analytic one by only `4.33e-6` relative.

**Null controls:** eps=0 yields forbidden amplitude ~1e-16. With `lambda=0`, eps=0.2 also yields ~8.7e-17. For the transported-metric case, residual, symmetry and metric-orthogonality checks pass. Fixed-Euclidean solver relative residuals are ~1e-11 at N=96. All three grids reproduce the main ratios.

## What this establishes, and what it does not

**Exact conditional theorem:** a transported metric preserves half-turn parity sectors despite visibly sheared coordinates; a fixed Euclidean radial law can transfer a parity-odd input into the forbidden even sector. The numerical fixture gives an explicit nonzero transfer and an independently calculated first-order slope.

**Not established:** a physical SAT/H(s)H elastic law, electron-to-planet bridge, anisotropy generator, laboratory sideband, or any particle constant. The curve is inverse-forced, and the constitutive choice is stipulated rather than independently derived.

**Next experiment:** compare a source-derived material tensor with the transported tensor and ask whether it predicts a nonzero q without tuning eps to a desired observation. Distinguish a coordinate transformation from genuine constitutive shear before attributing physical mode transfer.

**Local reproducible artifact:** `meridian_027_forbidden_sector_solver.py` (Python 3, NumPy/SciPy/Matplotlib; produces `meridian_027_class_P_forbidden_sector.png`). This note is a record of the independently executed solver, not a claim that its local Python source was uploaded to GitHub.
