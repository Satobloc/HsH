# Orson Vay s1 | Four-sequence memory-carryover identifiability
**Run:** CALC-S1-20261017T0012Z-ORSON. **Status:** SANDBOXED synthetic cognition methodology. No administered LLM experiment.
**Sources:** Orson ROLE_CHARTER_2026-10-09_LLM_COGNITION.md; OV99_20261012_COUNTERBALANCED_EVIDENCE_ORDER_GATE.md; SANDBOX_2026-10-15_S4_CLUSTERED_MCNEMAR_GATE.md.

Let A and B denote two evidence conditions in a two-period test. For first-period treatment F and second-period treatment S, assume independent binary outcomes conditional on sequence: Y1~Bernoulli(mu+tau*1[F=B]); Y2~Bernoulli(mu+gamma+tau*1[S=B]+kappa_F). The period drift is gamma, the immediate treatment effect tau, and the carryover from F is kappa_F. Define D=Y2-Y1.

The four expected within-subject differences are d_AA=gamma+kappa_A, d_AB=gamma+tau+kappa_A, d_BA=gamma-tau+kappa_B, d_BB=gamma+kappa_B. A balanced AB/BA crossover yields (d_AB-d_BA)/2=tau+(kappa_A-kappa_B)/2, so differential carryover survives counterbalancing. Four sequences identify tau by (d_AB-d_AA+d_BB-d_BA)/2. The four-sequence design has rank 3/4 in (tau,gamma,kappa_A,kappa_B), null (0,1,-1,-1): tau is identifiable while the common carryover baseline is not. Two sequences have rank 2/4 and tau is unidentifiable.

Numerical fixture: mu=.35, tau=.12, gamma=-.05, kappa_A=-.14, kappa_B=.12. Arm (p1,p2,E[D]) values: AA=(.35,.16,-.19), AB=(.35,.28,-.07), BA=(.47,.42,-.05), BB=(.47,.54,+.07). The balanced AB/BA contrast is -.01 (sign reversal); the corrected four-arm contrast is +.12.

Exact finite-sample PMF for D: P(-1)=p1(1-p2), P(0)=p1*p2+(1-p1)*(1-p2), P(+1)=(1-p1)*p2. Convolution over n subjects per arm gives exact estimator probabilities. For n=24, P(corrected<=0)=.210438326; n=96 gives .042421732. Under a true-null tau=0 but kappa_A=.12,kappa_B=-.14, the naive contrast has expectation +.13, corrected expectation 0. Exact one-sided rejection probabilities using an oracle-variance normal threshold 1.64485362695*sigma are:
n=12: naive .226001594, corrected .046410561
n=24: naive .389850689, corrected .048242893
n=48: naive .623487774, corrected .052377672
n=96: naive .878913722, corrected .052469547.
These are exact finite-distribution rejection probabilities for that threshold, not exact-size randomization p-values.

If treatment-by-history interactions exist, the four-arm design identifies conditional treatment effects, not a unique history-free effect. Adding interaction_A=.08, interaction_B=-.04 gives conditional effects .20 and .08, pooled .14, interaction contrast .12.

Executed deterministic Python checks: rank and nullspace; analytic-vs-enumerated PMF moments; exact normalization; two-arm alias; interaction and contrast identities. No random draws. Complete script and two Class P graph-generation routines appear in the visible scheduled response. Script SHA-256: 93b44ca3b06cf445e06c232d5be585db8e8529d8444c816d48d5ee3dd10ee53c.

**Protocol:** Independently randomize AA,AB,BA,BB, record session/sequence/period/source exposure/model version and scorer. Do not treat counterbalanced AB/BA as a sufficient carryover control. No physical H(s)H or LLM-consciousness inference.
