# Calder s4 | pooled parity covariance alias | 2026-10-15T11:48Z

SANDBOXED mathematical result. Synthetic binary parity markers; not a physical H(s)H prediction.

## Exact result
Track group g has weight pi_g, stationary hidden parity mean a_g, Markov refresh eigenvalue r_g in (0,1), and independent readout-flip probability e_g. The observed sign has mean mu_g=a_g(1-2e_g) and conditional positive-lag covariance w_g*r_g^k, where w_g=(1-2e_g)^2*(1-a_g^2).

Let mu=sum_g pi_g*mu_g and B=sum_g pi_g*(mu_g-mu)^2. The covariance pooled across tracks is
C_k=B+sum_g pi_g*w_g*r_g^k (k>=1).
After centering by known group means, C_k(within)=sum_g pi_g*w_g*r_g^k.

For any nonnegative mixture C_k=sum_i W_i*lambda_i^k with positive rates, the discriminator
Delta=C_1*C_3-C_2^2
=sum_(i<j) W_i*W_j*lambda_i*lambda_j*(lambda_i-lambda_j)^2.
Therefore Delta can be positive even when EVERY track has exactly one persistence eigenvalue. The between-group term B acts as an additional mode of rate 1. With equal means but heterogeneous rates, group-centering alone does not fix the alias. The per-group population Delta is zero.

## Exact fixtures
Each group has pi=0.5.
A. a=(.6,.6), r=(.92,.35), e=(.03,.03): Delta(pooled)=Delta(within)=0.008364056427.
B. a=(.3,.75), r=(.65,.65), e=(.03,.03): B=0.04473225; Delta(pooled)=0.002120433584; Delta(within)=0.
C. a=(.6,.6), r=(.65,.65), e=(.03,.03): Delta(pooled)=Delta(within)=0.

An independent executed Monte Carlo with 3,000 tracks/group, 384 readings/track, 250 stratified track-bootstrap replicates gave Delta estimates A=0.008609614, B=0.002322721, C=0.000118951. The respective 95% bootstrap intervals were [0.00828565,0.00890788], [0.00195751,0.00262655], and [-0.00011839,0.00038547]. For B, within-group centering gave 0.000168627, interval [-0.00013240,0.00042683]. These intervals assume known generating group means and observed group labels.

## Complete independent exact verifier (Python 3 standard library)
```python
from math import isclose

def covariance(groups, k, within=False):
    mean = sum(pi*a*(1-2*e) for pi,a,r,e in groups)
    B = sum(pi*(a*(1-2*e)-mean)**2 for pi,a,r,e in groups)
    signal = sum(pi*(1-2*e)**2*(1-a*a)*r**k for pi,a,r,e in groups)
    return signal if within else signal+B

def delta(groups, within=False):
    c1,c2,c3=(covariance(groups,k,within) for k in (1,2,3))
    return c1*c3-c2*c2

fixtures = {
    'rates':[(.5,.6,.92,.03),(.5,.6,.35,.03)],
    'means':[(.5,.3,.65,.03),(.5,.75,.65,.03)],
    'null':[(.5,.6,.65,.03),(.5,.6,.65,.03)]
}
for name,g in fixtures.items():
    print(name, f'{delta(g):.12f}', f'{delta(g,True):.12f}')
assert delta(fixtures['rates'],True)>0
assert delta(fixtures['means'])>0
assert isclose(delta(fixtures['means'],True),0,abs_tol=1e-14)
assert isclose(delta(fixtures['null']),0,abs_tol=1e-14)
print('PASS')
```

Interpretation: pooled lag-curvature is not unique evidence of interacting hidden correspondence factors. Distinguish group-rate heterogeneity, group-mean heterogeneity, and within-track multiplicity before assigning mechanisms. Complete expanded simulation and Class P plotting code preserved in originating ChatGPT conversation.