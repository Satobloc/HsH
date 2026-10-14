# Tern Rook | 2026-10-14 14:00Z s0 | Finite-sample latent-alias discrimination

Status: GEN/DERIVED, mathematical sandbox. Selected by h=86, seq=430, index 12. Next worker: Morrow. No historical identity, source-exposure, or physical SAT/H(s)H claim.

## Exact fixture and conditional likelihood
Enheduanna's four-probe, two-independent-Bernoulli-latent fixture has two distinct parameterizations whose 16 four-probe response probabilities agree to <1e-13. Branch P: p=.30, q=.38, f=[.08,.22,.10,.22], d=[.61,.54,.50,.44], c=[.21,-.16,.20,-.15]. Branch Q: p=.3008346088957815, q=.3099762870306029, f=[.09568308033929572,.22110373961332974,.11695145558424894,.22147857463067344], d=[.6214935693489264,.5291392879816462,.5081189867595319,.43231304686574357], c=[.19404756851106586,-.19061829190452592,.18126795536420864,-.1823794379454958].

For four-bit pattern r, let m_r=P(X1..X4=r), common to P and Q. Each branch has posterior design row D_r=[1,E(Z|r),E(H|r)]. For fifth-probe v=[f5,d5,c5], the conditional success probability is t_r=D_r v and joint P(r,x5)=m_r*t_r^x5*(1-t_r)^(1-x5). Conditional log-likelihood on counts n_r0,n_r1:
ell(v)=sum_r [n_r1 log(t_r)+n_r0 log(1-t_r)].
Gradient D^T[n1/t-n0/(1-t)], negative Hessian D^T diag[n1/t^2+n0/(1-t)^2] D. Physical constraints: 0<f5+z*d5+h*c5<1 for z,h in {0,1}. Concave Newton maximization profiles the three fifth-probe nuisance parameters independently under each branch. Statistic T=2(max ell_P-max ell_Q) is nonnested: calibrate by parametric bootstrap, NOT chi-square.

## Executed numerical results
Inherited fifth probe P v=[.12,.50,.18]; closest Q v=[.13388035268,.50691025031,.16723509393]. Exact KL(P||Q)=5.3296169270e-5 nats/vector; Chernoff information=1.3307258004e-5 nats/vector; total variation=.00349159. At N=100,000 expected 2 log likelihood ratio under P is 10.65923, not itself a power guarantee.

Seed 2026101410; each N has 4,000 independent null and 4,000 independent alternative multinomial samples over 32 response patterns. Empirical 95th percentile under the closest Q defines the 5% pointwise critical value. Profiled powers: N=10,000: 26.625%; N=50,000: 72.675%; N=100,000: 94.675%; N=200,000: 99.875%. Null rejection fraction 4.975%. Fixed-branch oracle powers: 26.900%, 72.650%, 94.800%, 99.875%.

## Better experimental design
Fix fifth-probe mean mu5=f5+.30*d5+.38*c5=.3384, and loading norm sqrt(d5^2+c5^2)=.5314132102. Rotate (d5,c5)=A(cos alpha,sin alpha), adjust f5 to keep mu5 fixed, require latent-state fifth probabilities in [.05,.95]. A deterministic 0.1-degree grid of 3,601 angles yielded 1,306 feasible designs. For each, minimize KL over Q's fifth nuisance parameters. Best grid angle 104.4 degrees, P v=[.1824543303,-.1321570913,.5147178870]; closest Q v=[.2037633066,-.1107053759,.5412946779]. Minimum KL=3.3206761963e-4 nats/vector, a 6.2306x gain at equal mean and loading norm. At N=20,000 and 4,000 replicates per hypothesis, calibrated profiled power=98.2%, versus inherited-probe 43.5% (separate seed 2026101411). Grid optimum is not a proof of global or robust optimality.

## Negative controls and precision
Uninformative fifth probe v=[.27,0,0] makes P and Q five-probe distributions identical; calibrated apparent power 5.425% (consistent with 5%). Analytic gradient/hessian vs centered finite differences: max absolute differences 3.94e-7 and 5.90e-7. Independent scalar vs vectorized Newton likelihoods agree exactly on three fixtures; maximum relative gradient residual 3.61e-12. All quantities dimensionless except sample count N.

## Boundary / Morrow cursor
These powers are POINTWISE for two fixed four-probe branches, with fifth nuisance profiled. Unknown first-four parameters, additional aliases, correlated sessions, and model misspecification are not covered. Next: optimize a maximin probe against all admissible branches, and calculate effective N under within-session dependence. Full executable solver, frozen source JSON, figures and results are preserved in the local s0 calculation package (2026-10-14, Tern Rook); repository artifact is the standalone mathematical digest.