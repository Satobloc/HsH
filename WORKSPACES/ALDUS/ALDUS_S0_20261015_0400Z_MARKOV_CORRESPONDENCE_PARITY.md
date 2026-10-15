# Aldus s0 | Markov-persistent SO(4) correspondence parity
2026-10-15 04:00 UTC | Mathematical sandbox, not empirical SAT physics or original historical Aldus participation.

Continuation: WORKSPACES/ALDUS/ALDUS_S1_FIXED_VS_RESAMPLED_CORRESPONDENCE_PARITY_2026-10-15.md (blob 1026f81716c8d38a10acc4c0d300eb66ce84ccdf).

## Model and exact algorithm
Given the preceding landmark geometry X=diag(L,L,L,epsilon), Y_j=Q X P_j+E_j, retain only determinant signs d_j=q s_j z_j where q=det(Q)=±1, s_j=det(P_j)=±1 and Pr(z_j=-1)=e. The prior even-permutation probability p=(1+2 exp(-2 lambda))/(1+2 exp(-lambda)+2 exp(-2 lambda)+exp(-3 lambda)); lambda=2 gives p=0.7914541417127793. Use the preceding independent Gaussian-sign fixture epsilon=0.4L, sigma=0.2L, e=0.03143198557693108. All statistical parameters are dimensionless.

At each new observation, retain hidden s with probability 1-alpha or independently refresh from (p,1-p) with probability alpha. The exact transition matrix, rows/columns (+,-), is
T=[[1-alpha(1-p),alpha(1-p)],[alpha*p,1-alpha*p]].
Stationary pi=(p,1-p); nontrivial eigenvalue rho=1-alpha.

For q in (+1,-1), forward-filter a_1(s;q)=pi(s)Pr(d_1|q,s), a_j(s;q)=Pr(d_j|q,s)sum_{s'} a_{j-1}(s';q)T[s',s], with emission Pr(d_j|q,s)=1-e if d_j=q*s else e. Exact equal-prior Bayes risk R_n=(1/2)sum_{d in {±1}^n} min(Pr(d|q=+1),Pr(d|q=-1)). Enumerated 2^n strings through n=17; evaluated larger n with 40,000 seeded simulated histories per alpha and a normalized HMM forward filter.

## Rigorous limiting cases
alpha=0: fixed correspondence; R_n=(1-p)+(2p-1) B_n(e) for odd n, converging to 1-p=0.20854585828722.
alpha=1: independently refreshed correspondence; R_n=B_n((1-p)+(2p-1)e).
For any alpha>0, p≠1/2, e≠1/2, ergodicity gives n^-1 sum d_j -> q(2p-1)(1-2e) almost surely. Thus even sample-mean classification is consistent, hence optimal risk tends to zero. For p=1/2 or e=1/2, risk is exactly 1/2 at every n.

Let mu=(2p-1)(1-2e). For k>=1, Cov(d_j,d_{j+k}|q)=(1-2e)^2[1-(2p-1)^2](1-alpha)^k. Therefore
Var(sum d_j)=n(1-mu^2)+2(1-2e)^2[1-(2p-1)^2]sum_{k=1}^{n-1}(n-k)(1-alpha)^k.
Variance-equivalent n_eff=n²(1-mu²)/Var(sum d_j) at n=511 is 1.21, 6.90, 32.79, 193.09, 511 for alpha=0,.02,.1,.5,1 respectively. This n_eff is NOT an iid substitution for the HMM Bayes error.

## Executed numeric fixture
Seed 2026101504, 40,000 histories per alpha. Exact n=17 risks: alpha=0 0.20854586; .02 0.20661976; .1 0.17920301; .5 0.05959643; 1 0.00635255.
Simulated n=255 risks: 0.20720, 0.11045, 0.00910, 0/40000, 0/40000 respectively.
Simulated n=511 risks: 0.20720, 0.058375 (SE .0011723), 0.000550 (SE .0001172), 0/40000, 0/40000 respectively.
Slow-mixing alpha=.02: n=1023 risk 0.01855 (SE .0006747), n=1535 0.005575 (SE .0003723), n=2047 0.001875 (SE .0002163). alpha=.1: n=767 risk .00005, n=1023 0/40000. Zero simulated errors never proves zero risk.

25 exact-versus-MC comparisons max discrepancy 2.041 Monte Carlo SE. Negative controls passed: stationary law, transition eigenvalue, alpha=0/1 analytic reductions, unbiased p=1/2, e=1/2, epsilon=0 -> e=1/2. Closed-form covariance sums checked independently.

Interpretation: the orientation prior supplies identifiability, not geometry alone. A positive but very small alpha eventually removes the fixed-correspondence floor; for finite data it can remain severe. No measured alpha or external physics evidence is claimed.

Full local executable package delivered to Nathan: ALDUS_S0_20261015_MARKOV_CORRESPONDENCE_PARITY.md, aldus_markov_parity.py, results.json, markov_parity_classP.png, markov_effective_sample_classP.png. Next Calder: evaluate actual acquisition protocols and how to estimate or bound alpha without assuming orientation labels.