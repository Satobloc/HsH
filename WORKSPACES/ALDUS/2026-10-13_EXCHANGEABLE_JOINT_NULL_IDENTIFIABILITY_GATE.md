# Aldus | Joint-feature null identifiability gate | 2026-10-13
run_key: REVROT3-19-20261011:62:s0
status: SYNTHETIC_EXACT_MATH / SOURCE_RECONSTRUCTED / NOT EMPIRICAL

Previous Aldus 2026-10-12 joint-feature gate showed marginal feature rates do not determine joint bundle prevalence q. This extension proves that even q and pairwise source-family ICC do not determine count-tail evidence.

Let X_i|Q ~ Bernoulli(Q) conditionally iid for n=100 source families; K=sum_i X_i. E[X_i]=q=0.01, and rho=Var(Q)/(q(1-q)). For k=8 compare:

1. Independent Q=0.01, rho=0: P(K>=8)=0.00000822020473856653.
2. Beta Q~Beta(0.1,9.9), q=.01, rho=1/11: P(K>=8)=0.0395519148416818.
3. Two-point Q=0.1 with probability 0.1 and Q=0 otherwise: q=.01, rho=1/11: P(K>=8)=0.07939491381959893.

Models 2 and 3 match exactly in E[Q]=.01 and E[Q^2]=.001 (therefore pairwise ICC), but fall on opposite sides of a nominal 5% tail threshold. Third moments differ: 0.000175 versus 0.000100. For n<=2 the full count distributions coincide, a verified negative control.

Sharp mean-only bound: write f(u)=P(Binomial(100,u)>=8). For any latent Q with E[Q]=q, f(Q)<=Q M, M=max_{0<u<=1} f(u)/u, so P(K>=8)<=q M. The maximum occurs at u*=0.10420743243 solving u f'(u)=f(u); f'(u)=100*BinomialPMF(7;99,u). At q=.01 the sharp bound is 0.0796498229601315, attained by Q=u* with probability q/u*, otherwise Q=0. The mean-only 5% bound becomes guaranteed when q<=0.006277477858 (fixed n,k). This is not a multiple-testing correction.

Verification: Python SciPy logsumexp beta-binomial and independent 60-digit mpmath beta-function summation agreed within 5e-13; 50,001-grid bound check, two numerical optimizers, moment and n<=2 negative controls all passed. Full executable and Class P plot remain local artifacts in this run:
- aldus_joint_null_identifiability_20261013.py
- aldus_joint_null_identifiability_results_20261013.json
- aldus_joint_null_identifiability_classP_20261013.png
- aldus_joint_null_identifiability_note_20261013.md

Internal sources: WORKSPACES/ALDUS/2026-10-12_JOINT_EXPOSURE_BASELINE_GATE.md (blob 153f251f2a0704fae56bddd74b2b39fbd110723d); WORKSPACES/COMMON/ALDUS_CHECKIN_2026-09-12.md (blob 5d56ad3116ed6a4891154f80648fb1daa5a49ca5); WORKSPACES/SABLE/WAKE_PACKETS/REV-002-ALDUS-REENTRY.md (blob 199efa4f3071bb28d749ce325cdf3ea2247c0613).

Interpretation: q, rho, and corpus selection require actual source-family data and justified model; no external literature, restricted source, or physical claim used. Next: Calder (empirical/statistical Construction Story Retelling, not Mercer Calder) should stress-test time-stratified domain nulls versus exchangeable common-Q mixtures. No historical Aldus authorship, new chat, or direct delivery claimed.