# Aldus s2 | Order-prior rescue of SO(4) parity | 2026-10-14 20:24 UTC

**Status:** GEN/DERIVED mathematical sandbox, source-grounded Aldus continuation; not authentic historical Aldus participation or a physical SAT/H(s)H claim.

## Assumptions and exact derivation

Extend `ALDUS_SO4_PARITY_INFERENCE_GATE_2026-10-14.md` and `aldus_unknown_correspondence_parity_gate_20261014.py`. In a four-dimensional Euclidean landmark experiment, let `X=diag(1,1,1,epsilon)` in length units L, `Y=QXP+E`, `det(Q)=q∈{±1}` with equal priors, `P` permuting the first three indistinguishable landmarks, and `E_ij iid N(0,sigma²)` in L. A time-order prior assigns `Pr(P)∝exp(-lambda*inv(P))` with dimensionless lambda.

The S3 inversion-count polynomial is `Z(t)=1+2t+2t²+t³`, `t=exp(-lambda)`. Even permutation mass is `p=(1+2t²)/Z(t)`. Under isotropic noise, `sign(det Y)=q sign(P) Z_noise`, with `Pr(Z_noise=-1)=e` independent of q,P. Therefore the Bayes-optimal parity error (for lambda≥0, e≤1/2) is **exactly** `r=(1-p)+(2p-1)e`. An ordering prior can restore identifiability but injects the information; it does not establish geometric chirality.

For `A`, the first three rows of `X+E`, `B=A[:,:3]`, Cauchy-Binet gives `||cofactor_row4||²=det(AAᵀ)`. Conditioning on A and integrating the Gaussian last row gives an exact variance-reduced noise integral:

`e=E_A Phi(-epsilon*det(B)/(sigma*sqrt(det(AAᵀ))))`.

This is the classical determinant orientation test with nuisance-permutation prior, not an emergent force.

## Executed numerical fixture

`epsilon=0.4 L`, RNG seed `2026101420`, 250,000 first-three-row Rao-Blackwell samples per sigma; independent direct 100,000 full-matrix trials per lambda at sigma=0.2 L.

| sigma/L | e (RB) | lambda for r≤5% | lambda for r≤1% |
|---:|---:|---:|---:|
| 0.05 | <1e-8 | 3.636546 | 5.288229 |
| 0.10 | 0.00004184 | 3.637341 | 5.292380 |
| 0.20 | 0.03141969 ± 0.00002043 MC SE | 4.593721 | impossible |
| 0.30 | 0.13642836 | impossible | impossible |
| 0.40 | 0.25354671 | impossible | impossible |

At sigma=0.2 L, lambda=2: `p_even=0.7914541`, predicted error `0.22686066`, direct simulated error `0.22699000 ± 0.00132463` (1 SE), agreement 0.098 standard errors. lambda=0 gives 0.500000 expected versus 0.500850 measured. lambda=4 gives 0.06451992 expected versus 0.064580 measured.

## Reproducer (NumPy + SciPy)

```python
import numpy as np
from scipy.special import ndtr
from scipy.optimize import brentq
rng=np.random.default_rng(2026101420)
def p(lam):
 t=np.exp(-lam)
 return (1+2*t*t)/(1+2*t+2*t*t+t**3)
def r(lam,e): return 1-p(lam)+(2*p(lam)-1)*e
def noise(eps,sigma,n=250000):
 vals=[]
 for k in range(0,n,25000):
  m=min(25000,n-k)
  A=rng.normal(0,sigma,(m,3,4))
  A[:,0,0]+=1; A[:,1,1]+=1; A[:,2,2]+=1
  B=np.linalg.det(A[:,:,:3])
  D=np.sqrt(np.linalg.det(A@A.transpose(0,2,1)))
  vals.append(ndtr(-eps*B/(sigma*D)))
 v=np.concatenate(vals)
 return v.mean(),v.std(ddof=1)/np.sqrt(n)
for sigma in (.05,.1,.2,.3,.4):
 e,se=noise(.4,sigma)
 needed=lambda target: brentq(lambda x:r(x,e)-target,0,35) if e<target else float('inf')
 print(sigma,e,se,needed(.05),needed(.01))
```

**Boundary/falsifying cases:** lambda=0 yields 50% parity error for every sigma; lambda→∞ gives labeled-landmark error e; epsilon=0 yields e=50% for any sigma>0, so even perfect ordering cannot recover parity from rank-deficient geometry. sigma→0 with epsilon>0 yields e→0. Hence temporal correspondence priors can rescue an inference only when geometry has full rank and noise is sufficiently small.

**Calder handoff:** Test nonuniform time-order priors and correlated measurement errors. Does any experimentally justifiable correspondence prior beat the `r≥e` floor without presupposing the sought orientation?
