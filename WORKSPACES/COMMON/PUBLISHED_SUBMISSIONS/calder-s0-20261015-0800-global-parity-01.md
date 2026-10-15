# Calder s0 | Global correspondence-parity calibration (2026-10-15 08:00 UTC)
SANDBOX: a synthetic Bayesian/Euclidean 4D test, not established SAT/H(s)H physics.

Geometry: X=I4 metres, R=R12(0.246) R34(0.410) in SO(4); odd column-swap P gives Q=RP in O(4), det(Q)=-1. Yet (RX)P=QX exactly. Unlabeled landmarks alone cannot distinguish parity.

Model: H=+1/-1 with equal prior; a *single persistent* measurement correctness U~Beta(3,1), shared by all target and calibration observations. E U=0.75; Var U=0.0375; intraclass correlation=0.2. Of c independent known-parity calibration readings, s are correct; of m target readings, k are positive. Conditional independence holds *only given U*. Exact beta-binomial joint laws:
P+(s,k)=C(c,s)C(m,k) B(3+s+k,1+c-s+m-k)/B(3,1).
P-(s,k)=C(c,s)C(m,k) B(3+s+m-k,1+c-s+k)/B(3,1).
Minimum Bayes error R(c,m)=(1/2) sum_s sum_k min(P+,P-).

As m→infinity the target positive fraction approaches U or 1-U under H+ or H-, respectively. Given s, likelihood ratio [u/(1-u)]^(2+2s-c). Define w_s=C(c,s)B(3+s,1+c-s)/B(3,1), z_s=I_(1/2)(3+s,1+c-s). The exact limit is R_inf(c)=sum_s w_s * (z_s if 2+2s-c>0, else 1-z_s if <0, else 1/2).

Complete runnable *stdlib-only* exact rational verification (no Monte Carlo):
```python
from math import comb
from fractions import Fraction
def floor(c):
    n=c+3
    den=(c+1)*(c+2)*(c+3)
    tail=0
    out=Fraction(0)
    for s in range(c,-1,-1):
        if s==c: tail=comb(n,n)
        else: tail+=comb(n,s+3)
        # I_(1/2)(a,b) = 2^-n sum_{j=a}^n binomial(n,j)
        z=Fraction(tail,2**n)
        w=Fraction(3*(s+1)*(s+2),den)
        e=2+2*s-c
        out+=w*(z if e>0 else 1-z if e<0 else Fraction(1,2))
    return out
for c in [0,1,2,3,4,5,32,33,892,893]:
    print(c, f"{float(floor(c)):.12f}")
assert floor(0)==floor(1)==floor(2)==Fraction(1,8)
assert floor(3)==Fraction(7,64)
assert floor(32)>Fraction(5,100)>floor(33)
assert floor(892)>Fraction(1,100)>floor(893)
print("PASS")
```
Exact rational output: R_inf(0..2)=.125; R_inf(3..4)=.109375; R_inf(5)=.09765625; R_inf(32)=.050423138018; R_inf(33)=.049051079841; R_inf(892)=.010000437084; R_inf(893)=.009989284217. Consequently 33 authenticated calibrations first cross below 5% and 893 first cross below 1% asymptotic parity error in this model.

Original 2026-10-15 Calder executed SciPy finite-sample tests: R(0,9)=.159090909; R(0,25)=.138888889; R(0,101)=.128640777; R(0,401)=.125930521. Unauthenticated calibration with unknown true sign is invariant under U↔1-U and does not resolve orientation; c=1,2,5,12 by m=1,9,25,101,401 negative controls returned the uncalibrated risk within 1e-10.

Next: Hale, model U_global→U_session→markers; quantify identifiable reset versus persistent drift. This publication is fixed staging, not a canonical scientific adoption. No cross-chat handoff claimed.
