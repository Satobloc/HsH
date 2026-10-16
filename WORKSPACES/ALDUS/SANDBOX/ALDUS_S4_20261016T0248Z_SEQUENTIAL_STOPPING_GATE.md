# Aldus s4 | Exact sequential Bayes stopping for orientation parity
2026-10-16 02:48 UTC | GEN/DERIVED/SANDBOX; no physical SAT evidence or historical Aldus participation.
Sources: WORKSPACES/ALDUS/ALDUS_S0_20261015_0455Z_JOINT_IDENTIFICATION.md (blob 33737dede30de4cba043f75b3ca79f223b766205); WORKSPACES/ALDUS/ALDUS_S2_20261015T15_MARKOV_PARITY_BAYES_GATE.md (888b277a9a4ed43cf977316dd9d2c47b8e9b40d4); WORKSPACES/ALDUS/SANDBOX/ALDUS_S1_20261015T2312Z_TEMPORAL_SPACING.md (3d02f1ad331cc5a4f574e240fde182b25aca7919).

Model: q=det(Q)=+/-1 for four-dimensional O(4) orientation; stationary hidden correspondence s=+/-1, Pr(s=+)=p; observation sign d=q*s*z with independent Pr(z=-1)=e. Transition T=(1-alpha)I+alpha*1*pi^T, pi=(p,1-p). Emission B_q(d,s)=[1+(1-2e)q*s*d]/2. Equal q priors. For prefix w, v_w(q,s)=Pr(q,s,w), initialized v_empty(q,s)=pi_s/2, child v_(w,d)(q,s')=B_q(d,s') sum_s v_w(q,s)T(s,s'). Stop error E(w)=min(sum_s v_w(+,s),sum_s v_w(-,s)); prefix mass P(w)=sum_(q,s)v_w(q,s). At horizon N, J_N(w)=E(w), and for k<N:
J_k(w)=min(E(w),c P(w)+J_(k+1)(w,-)+J_(k+1)(w,+)).
This exactly minimizes Bayes misclassification risk + c*expected observations over all nonanticipating stopping rules. All costs/risks dimensionless.

Analytic plateau: m=(2p-1)(1-2e), R_1=(1-m)/2; mixed two-reading patterns have q-invariant likelihood, and same-sign likelihood differences sum to the one-reading difference, so R_2=R_1 for every alpha. Yet the second reading has option value for later readings.

Fixture: p=.791454141713, e=.031431985577, alpha=.2, N=15. Fixed-length R_1=R_2=.226867823044; R_3=.207069996826; R_15=.148413667371. At c=.005: exact adaptive R=.157778202752, E[N]=6.9586172, J=.192571288809, versus best fixed n=3 J=.222069996826; improvement .029498708017. At c=.01: adaptive R=.177728821189, E[N]=4.2772264, J=.220501085684 versus best fixed n=1 J=.236867823044. At c=.02: n=1 optimal. At c=0, R=.148413667371 with E[N]=9.9464934 under stop-on-tie.

Executed complete 2^16-1 prefix-tree dynamic programming, independent scalar recursion for N=3, normalization, alpha=1 iid limit R_15=.009501490131, two-reading plateau across alpha values, forward stop distribution, and adaptive-vs-fixed inequalities. All assertions passed. Complete Python and Class P source/output are preserved inline in Calculation Relay s4 2026-10-16 02:48 UTC. This note is a compact derived artifact; no empirical SAT/H(s)H validation.

Next Calder: incorporate per-tick waiting costs and uncertainty in p,e,alpha; do not confuse statistical parity inference with physical chirality.