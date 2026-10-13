# Ariadne calculation playground | Two-view R4 helix observability | 2026-10-13

**Status:** sandbox mathematical geometry, not a physical SAT/H(s)H claim. Source route: HsH Cross-Formalism Index CF-001/002/003/004 and Ariadne workspace. All quantities dimensionless.

## Construction
Let X(s)=(R cos(ms), R sin(ms), A cos(ns), A sin(ns)), s in [0,2pi), R=1, A=0.35, m=1, n=+/-3. Two 3D observers record
P1 X=(x1,x2,x3),
P2 X=(x1,x2,cos(alpha)x3-sin(alpha)x4).
Stack M=[P1;P2]. Six scalar channels have independent N(0,sigma^2) noise, sigma=0.08. For N=64 equally spaced samples, compare the opposite signs of n.

## Exact result
M^T M=2I-u u^T-v v^T, where u=e4, v=sin(alpha)e3+cos(alpha)e4. Eigenvalues: {2,2,1+|cos(alpha)|,1-|cos(alpha)|}. For alpha not 0 or pi:
- rank(M)=4; condition number kappa2=sqrt(2/(1-|cos(alpha)|)).
- Model-free pointwise least-squares total 4D mean squared error = sigma^2[1+2/sin^2(alpha)].
- At alpha=pi/2, kappa=sqrt(2), MSE=3sigma^2.
- As alpha->0, kappa~2/|alpha|, MSE~2sigma^2/alpha^2.
- At alpha=0, rank(M)=3, and opposite chirality gives identical observations even without noise.

A **separate, stronger model-conditioned classifier**, which already knows R,A,m,|n|, phase and sample positions, distinguishes n=+3 from n=-3 by the second view's last scalar channel. Their difference is 2A sin(alpha) sin(ns). The optimum equal-prior Gaussian error is
P(error)=Phi[-A |sin(alpha)| sqrt(N/2)/sigma].
This is NOT the error rate for unconstrained 4D reconstruction.

## Computed numerical results
Fixed RNG seed 202610131713, 2000 pointwise noise trials and 30000 curve classification trials per nondegenerate angle. Exact SVD/LS identities, Monte Carlo bounds, and negative controls all passed.

| alpha | kappa2 | pointwise MSE | exact chirality error | simulated chirality error |
|---|---:|---:|---:|---:|
| 90 deg | 1.4142 | 0.01920 | 1.60e-135 | 0 |
| 30 deg | 3.8637 | 0.05760 | 1.80e-35 | 0 |
| 10 deg | 11.4737 | 0.43089 | 8.63e-6 | 0 |
| 3 deg | 38.2016 | 4.67955 | 0.097617 | 0.097433 |
| 1 deg | 114.5930 | 42.03059 | 0.332898 | 0.332167 |
| 0 deg | undefined (rank 3) | undefined | 0.5 | degenerate |

Negative controls: first-view traces are identical for n=+3 and n=-3 to machine precision; both have opposite exact hidden-plane winding; any arbitrary x4 perturbation remains invisible in P1; a second separated view detects it. Exact noise-free inversion works for alpha>0. All values arise from a synthetic geometric model, not observations.

## Minimal reproducible code
```python
import numpy as np
from scipy.special import ndtr
N,A,sigma=64,.35,.08
for deg in [90,30,10,3,1,0]:
    a=np.deg2rad(deg)
    P1=np.eye(4)[:3,:]
    P2=np.array([[1,0,0,0],[0,1,0,0],[0,0,np.cos(a),-np.sin(a)]])
    M=np.vstack([P1,P2]); sv=np.linalg.svd(M,compute_uv=False)
    rank=np.linalg.matrix_rank(M,tol=1e-10)
    k=sv[0]/sv[-1] if rank==4 else None
    mse=sigma**2*(1+2/np.sin(a)**2) if rank==4 else None
    pe=ndtr(-A*abs(np.sin(a))*np.sqrt(N/2)/sigma)
    print(deg,rank,k,mse,pe)
```

**Boundary:** A 4D projection geometry/observability gate, not evidence that SAT filaments obey this torus ansatz. Model-conditioned classification cannot be advertised as generic reconstruction. Future test: unknown phase, amplitudes, correlated measurement noise, and arbitrary observer SO(4) frames.
