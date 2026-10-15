# Aldus s1 | Repeated correspondence-parity identifiability | 2026-10-15 00:15 UTC

**Status:** GEN/DERIVED mathematical sandbox. Source-grounded continuation of `WORKSPACES/ALDUS/ALDUS_S2_ORDER_PRIOR_PARITY_GATE_2026-10-14.md`; not a historical Aldus turn, physical chirality claim, or empirical SAT/H(s)H validation.

## Exact distinction: fixed nuisance versus resampled nuisance

In 4D Euclidean coordinates, take `X=diag(1,1,1,epsilon)` with length unit L, `Y_j=Q X P_j+E_j`, `det Q=q=±1`, independent isotropic Gaussian `E_j` entries with standard deviation `sigma` (L). The first three landmarks are unlabeled. Let `s_j=det P_j`, and use only the determinant-sign readout `d_j=sign det Y_j=q*s_j*z_j`. Under the stipulated noise, `Pr(z_j=-1)=e`.

The S3 Mallows prior `Pr(P)∝exp(-lambda*inv(P))` has `t=exp(-lambda)`, partition function `Z=1+2t+2t²+t³`, and `p=Pr(s=+1)=(1+2t²)/Z`. Single-readout crossover probability is

```
r = (1-p) + (2p-1)*e.
B_n(x) = Pr[Binomial(n,x) > n/2] + 0.5*Pr[Binomial(n,x)=n/2].
```

**Protocol A, fixed P:** A single hidden correspondence permutation is held fixed across n independent noisy readings. The sign-only Bayes risk is exactly

```
R_fixed(n) = (1-p) + (2p-1)*B_n(e)  -->  1-p.
```

The floor is structural. Since the three equal-radius landmarks admit an odd permutation symmetry, a parity-reversing Q and an odd-relabelled P generate the same noiseless geometry. Independent noise removal does not resolve the sign of P.

**Protocol B, independently resampled P_j:** A fresh permutation is independently drawn for each noisy reading, with the same prior. The sign-only Bayes risk is

```
R_resampled(n) = B_n(r)  -->  0     (p>1/2 and e<1/2).
```

The second limit does not rescue Protocol A; it changes the nuisance model. Both formulas are exact for determinant-sign readouts; full matrix data with a shared Q could improve Protocol B.

For one sign reading, information about uniform q is `1-H2(r)` bits. In Protocol A the asymptotic ceiling is `1-H2(1-p)` bits.

## Executed independent numerical fixture

`epsilon=0.4 L`, `sigma=0.2 L`, `lambda=2`, seed `2026101500`. An independent 250,000-sample Rao-Blackwell integration over the first three Gaussian rows gives `e=0.03143198558 ± 0.0000204254` (MC standard error). Formula: `e=E_A Phi(-epsilon*det(A[:,:3])/(sigma*sqrt(det(A A^T))))`.

`p=0.7914541417`, `r=0.2268678230`, **fixed floor `1-p=0.2085458583`**.

| Odd n | Fixed exact risk | Resampled exact risk |
|---:|---:|---:|
| 1 | 0.22686782 | 0.22686782 |
| 3 | 0.21023734 | 0.13105370 |
| 5 | 0.20871845 | 0.08063665 |
| 11 | 0.20854608 | 0.02163757 |
| 21 | 0.20854586 | 0.00287529 |
| 51 | 0.20854586 | 0.00000965 |
| 101 | 0.20854586 | <1e-8 |

Independently resampled P reaches ≤1% error at **n=15** odd readings and ≤0.1% at **n=27**. Fixed P cannot reach either threshold for this lambda. A seeded 180,000-trial Monte Carlo experiment per row and protocol agreed with analytic probabilities within its 5-SE tolerance. The fixed floor is reached numerically by n≈11, despite repeated measurement.

Negative controls passed: `lambda=0` yields 50% risk for every n; `e=0.5` yields 50%; `p=1` recovers `B_n(e)` for both protocols; `e=0` leaves the fixed floor; even-n randomized ties, and n→∞ limits checked.

## Minimal independent reproducer

```python
import numpy as np
from scipy.stats import binom
p=(1+2*np.exp(-4))/(1+2*np.exp(-2)+2*np.exp(-4)+np.exp(-6))
e=0.03143198557693108
r=(1-p)+(2*p-1)*e
B=lambda n,x:binom.sf(n//2,n,x) if n%2 else binom.sf(n//2,n,x)+.5*binom.pmf(n//2,n,x)
for n in (1,3,5,11,21,51,101):
 print(n,(1-p)+(2*p-1)*B(n,e),B(n,r))
```

The full executed solver additionally generates an exact formula-based Class P figure, seeded Monte Carlo comparisons, and a JSON receipt. Local working copy: `aldus_fixed_vs_resampled_correspondence_gate.py` (available in the automation artifact bundle, not presumed committed here).

**Calder question:** Which physical/data-acquisition protocols justify fixed versus genuinely redrawn correspondences? Test partially persistent P (Markov parity) and determine the nonzero error floor and sample complexity as a function of persistence. Preserve the distinction between inference from data and prior orientation information.
