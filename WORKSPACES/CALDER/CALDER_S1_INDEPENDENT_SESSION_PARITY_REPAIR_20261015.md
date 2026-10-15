# Calder s1 | Independent-session repair of parity-marker confounding
2026-10-15 04:12 UTC | GEN/DERIVED mathematical sandbox | selected h=100, seq=501, index=7; next Hale.

## Exact geometric control
For length L=1 m, X=L I4, R=R12(0.246)R34(0.410) in SO(4), and transposition P=(12), the two models (R X)P and (RP)X coincide entrywise, max residual 0 m, while det(R)=+1 and det(RP)=-1. No unlabeled-geometry parity identification is claimed.

## Independent sessions rather than independent reads
Hidden H=+/- has equal prior. Each session j draws U_j~Beta(a=3,b=1), independently across sessions; r binary order readings are conditionally iid correct with probability U_j. Hence marginal p=.75 and within-session ICC rho=.20; readings are dimensionless. Under H=+, k positive readings have BetaBinomial(r,3,1) probability
  f_r(k)=3(k+1)(k+2)/[(r+1)(r+2)(r+3)].
Under H=- the probability is f_r(r-k). For r=3, f_3=[.05,.15,.30,.50], giving log-likelihood increments [-ln10,-ln2,+ln2,+ln10]. For m independent sessions, the exact sufficient-statistic log likelihood is
  S_m=(N3-N0)ln10+(N2-N1)ln2.
The Bayes risk is P_+(S_m<0)+P_+(S_m=0)/2. Exact dynamic programming on (N3-N0,N2-N1) computes it without Monte Carlo.

| Independent sessions m (3 readings each) | Exact full-count Bayes risk | Compressed session-majority risk | Fully independent 3m-reading risk |
|---:|---:|---:|---:|
| 1 | .200000000 | .200000000 | .156250000 |
| 3 | .083750000 | .104000000 | .048927307 |
| 5 | .039020000 | .057920000 | .017299838 |
| 7 | .018998309 | .033344000 | .006422710 |
| 9 | .009479626 | .019581440 | .002449967 |

**First odd m for risk <=5%:** full-count m=5 (15 readings); majority-compressed m=7 (21 readings); fully independent benchmark m=3 (9 readings).
**First odd m for risk <=1%:** full-count m=9 (27 readings); compressed m=13 (39 readings); independent benchmark m=7 (21 readings).
Compression discards information: the full session count beats its majority sign. Truly independent session resets eliminate the single-session asymptotic floor, but cost more observations than fully independent readings.

## Observable session-boundary diagnostic without knowing H
For m sessions of r observations, compute W=within-session fraction of agreeing pairs, B=between-session fraction. With independent U_j,
  E[B]=p²+(1-p)²=.625;
  E[W]=E[B]+2 Var(U)=.700;
  E[W-B]=2p(1-p)rho=.075.
Assuming p>.5, estimate p_hat=.5+sqrt(max((B-.5)/2,0)); rho_hat=(W-B)/[2 p_hat(1-p_hat)]. Degenerate denominators are explicitly undefined.

Seeded NumPy simulation (seed 2026101504; 4,000 replicates, 200 sessions each, 5 readings/session) returned:
- independent readings: mean W-B=.0001860, mean rho_hat=.0004808;
- independently reset Beta(3,1) sessions: mean W-B=.0751049, mean rho_hat=.1997131;
- **global shared Beta(3,1) across purported sessions:** mean W-B=-.0000110, mean rho_hat=-.0001673 (0.25% undefined), so this segmentation test misses the global common mode.
Empirical one-sided 5% null threshold for rho_hat=.0379741; rejection rates .0500, 1.0000, .05125 respectively. The global-shared model has asymptotic parity-error floor I_(1/2)(3,1)=.125; at n=255 its exact error=.12645914, versus independent Bernoulli error=5.01563e-18. Thus the diagnostic is **not a certificate of independence**.

## Reproducibility
Full executable Python and machine-readable outputs were saved locally:
- calder_s1_session_segmentation_gate.py
- calder_s1_session_results.json
- calder_s1_classP_session_risk.png
The script uses numpy, scipy, matplotlib; includes SO(4) determinant/residual checks, normalized BetaBinomial controls, exact DP, design thresholds, and three dependence-model negative controls. Minimal reproduction of the full-count r=3 DP:
```python
import numpy as np
N=101; P=[.05,.15,.30,.50]
s=np.zeros((2*N+1,2*N+1)); s[N,N]=1
i=np.arange(-N,N+1)
score=i[:,None]*np.log(10)+i[None,:]*np.log(2)
for m in range(1,N+1):
    t=np.zeros_like(s)
    t[:-1,:]+=P[0]*s[1:,:]
    t[:,:-1]+=P[1]*s[:,1:]
    t[:,1:]+=P[2]*s[:,:-1]
    t[1:,:]+=P[3]*s[:-1,:]
    s=t
    if m in (1,3,5,7,9):
        print(m,s[score<-1e-13].sum()+.5*s[np.abs(score)<1e-13].sum())
```

## Limiting cases and boundaries
rho=0 recovers pooled binomial independent markers. m=1 recovers BetaBinomial single-session risk. A single U shared across all readings retains .125 asymptotic error; falsely relabeling those readings as independent sessions cannot remove it. The sign of p-.5 is not identified by agreement statistics without assuming p>.5. No empirical or physical SAT/H(s)H validity claim. Source: immediate Calder s2 checkpoint CALDER_S2_OBSERVED_ORDER_MARKER_BETABINOMIAL_GATE_20261015.md; no wider archival audit.

## Next: Hale
Test a hierarchical two-level U_global/U_session model and design a diagnostic that detects global confounding using independent calibration experiments or externally known H. Quantify risk and cost against the independent-session repair. Do not treat the W-B test alone as evidence of genuine session resets.
