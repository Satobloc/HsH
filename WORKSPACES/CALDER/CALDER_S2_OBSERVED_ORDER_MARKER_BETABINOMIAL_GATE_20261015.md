# Calder s2 | Measured order markers versus SO(4) parity alias
2026-10-15 00:24 UTC | GEN/DERIVED | synthetic statistical fixture, not physical evidence.

## Question and geometric control
The preceding Calder checkpoint `WORKSPACES/CALDER/calder_mallows_parity_prior_gate_20261014.py` used an imposed Mallows correspondence prior to resolve an otherwise exact parity ambiguity. Replace that prior with a *measured* binary sequential marker and ask how many readings are required, allowing shared-channel errors.

Set L=1 m, X=L I_4, R=R_12(0.246 rad) R_34(0.410 rad), P=the permutation matrix swapping columns 1 and 2, and Q=RP. Then det R=+1, det Q=-1, rank X=4, and **(RX)P=QX exactly**, with maximum residual 0 m. Unlabeled 4D geometry alone cannot decide proper versus improper parity, even for sigma=0.02 L Gaussian position noise. The same unlabeled observation has both explanations.

## Measured sequential witness model
Let hidden parity H=+/- with equal prior. Each binary order witness M_i agrees with H with marginal probability p=0.75. All marker outcomes are dimensionless. Conditional on session accuracy U, readings are independent, Pr(M_i=H|U)=U.

* Independent benchmark: U=p deterministically, K=#correct ~ Binomial(n,p).
* Correlated session model: U~Beta(a,b), a=p(1/rho-1), b=(1-p)(1/rho-1), where rho=Corr(1[M_i=H],1[M_j=H])=1/(a+b+1). For odd n, K~BetaBinomial(n,a,b).

Because a>b, the likelihood ratio for observed + votes is monotone in their count, so majority vote is Bayes-optimal under equal H priors. The exact Bayes error for odd n is

E(n,rho) = sum_{k=0}^{(n-1)/2} binom(n,k) B(k+a,n-k+b)/B(a,b),

with rho=0 replaced by the binomial formula. Crucially, as n tends to infinity at fixed rho>0,

E(infinity,rho)=Pr(U<1/2)=I_{1/2}(a,b),

an **irreducible session-confounding floor**. At rho=0 the floor is zero. The limits rho->0 and n->infinity are nonuniform for practical finite sample sizes.

## Exact numeric fixture (Bayes error probability)
| odd n | rho=0 | rho=.05 | rho=.10 | rho=.20 |
|---:|---:|---:|---:|---:|
| 1 | .2500000 | .2500000 | .2500000 | .2500000 |
| 9 | .0489273 | .0849832 | .1147889 | .1590909 |
| 25 | .0033704 | .0385242 | .0786117 | .1388889 |
| 101 | <.0000001 | .0173503 | .0597072 | .1286408 |
| 401 | <.0000001 | .0126448 | .0547032 | .1259305 |
| n -> infinity | 0 | .0111579 | .0529887 | .1250000 |

Smallest odd n to reach 5% error: n=9 if rho=0; n=19 if rho=.05; **impossible for rho=.10 or .20**. To reach 1%: n=19 if rho=0; impossible at rho>=.05. At n=25, rho=.20 gives **41.208 times** the independent-model error, despite identical single-reading accuracy.

Independent computational check: seeded NumPy beta/binomial Monte Carlo, 200,000 simulated sessions at n=25, rho=.20, gives error 0.1370300 versus exact 0.1388889 (z=-2.404; within predeclared 5-sigma check). Boundary checks: n=1 error=.25 for every rho; n=3 independent error=.15625; rho=1e-7 approaches binomial; at n=5001, rho=.2 approaches the .125 floor; full-rank SO(4) geometry equality residual=0 m.

## Reproduction (Python 3, scipy)
```python
import numpy as np
from scipy.special import gammaln, betaln, betainc, logsumexp
from scipy.stats import binom
p=.75
def risk(n,rho):
    assert n%2==1
    if rho==0: return float(binom.cdf((n-1)//2,n,p))
    a,b=p*(1/rho-1),(1-p)*(1/rho-1)
    k=np.arange((n-1)//2+1)
    v=gammaln(n+1)-gammaln(k+1)-gammaln(n-k+1)
    v+=betaln(k+a,n-k+b)-betaln(a,b)
    return float(np.exp(logsumexp(v)))
for n in [1,9,25,101,401]:
    print(n, [risk(n,r) for r in [0,.05,.1,.2]])
for rho in [.05,.1,.2]:
    a,b=p*(1/rho-1),(1-p)*(1/rho-1)
    print('floor',rho,betainc(a,b,.5))
```

## Falsifier and handoff
This result is a **counterexample to treating repeated order readings as independent evidence**. Repeatedly measuring a single shared session cannot drive error below its latent-accuracy floor. Conversely, genuinely independent *sessions* each with a newly drawn U can restore asymptotic identifiability; the floor applies only to the stated shared-session design.

**Hale:** devise an *observable* marker/channel segmentation diagnostic, then quantify how many independent sessions are needed to recover 5% and 1% parity discrimination. Preserve the odd-symmetry geometry and distinguish new-session evidence from repeated reads within one session.

Provenance: source-grounded Calder reconstruction, not authenticated Calder participation. No claim of a physical H(s)H prediction or ChatGPT message delivery.
