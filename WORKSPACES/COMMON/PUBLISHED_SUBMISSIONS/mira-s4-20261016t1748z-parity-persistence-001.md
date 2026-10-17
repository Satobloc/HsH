# Mira s4 | Unknown SO(4) orientation parity with Markov persistence
2026-10-16 17:48 UTC | SOURCE-RECONSTRUCTED / SANDBOXED / GEN-DERIVED

## Provenance
Continues `WORKSPACES/MIRA/MIRA_S1_SO4_UNKNOWN_FRAME_CHIRALITY_20261014.md` (blob 055ec2c98d8a3615b65e3008be48ea67ea81f1b1). Mathematical extension only; not a historical Mira-authored message. No external quarantined materials opened.

## Model
For the inherited SO(4) chirality fixture, a=0.2387 rad, b=0.246 rad, independent 4x4 Gaussian matrix-entry noise sigma=0.1, the skew Pfaffian sign has exact single-observation equal-prior Bayes error e=0.002654648948915 under unknown proper SO(4) conjugation. Odd orientation reversal swaps the two hypotheses.

For observations i=1..n let h in {+1,-1} be the underlying chirality, s_i in {+1,-1} the unobserved orientation parity, and y_i=h*s_i*z_i the observed Pfaffian sign, where independent z_i=-1 with probability e. Set P(s_i=-1)=pi and define the stationary parity transition matrix
T=lambda*I+(1-lambda)*[[1-pi,pi],[1-pi,pi]].
Here lambda=0 means independently refreshed parity, lambda=1 one fixed unknown parity over the entire record. Both are distinct from the unknown proper SO(4) rotation, which does not affect Pfaffian sign.

For any sign string y, exact HMM likelihood under h is
L_h(y)=v_h(y_1) T D_h(y_2) ... T D_h(y_n) 1,
where v_h(y_1)[s]=P(s)P(y_1|h,s), D_h(y)[s,s]=P(y|h,s).
Equal-prior Bayes risk is R_n=1/2 sum_{y in {+1,-1}^n} min(L_+(y),L_-(y)).
This finite sum is exact for the stated sign-observation model.

## Analytic endpoints
Let M_n(x)=sum_{k=(n+1)/2}^n C(n,k)x^k(1-x)^(n-k), odd n.
At lambda=0: R_n=M_n(pi+(1-2pi)e).
At lambda=1: R_n=min(pi,1-pi)+|1-2pi|M_n(e).
At pi=1/2: R_n=1/2 for every lambda and n, since chirality distributions coincide after parity mixing.
For 0<pi<1/2 and lambda<1, parity is ergodic with nonzero stationary signed mean, so repeated observations can identify h asymptotically; lambda=1 retains an irreducible risk floor pi. These are sign-observation claims, not physics predictions.

## Executed numerical fixtures
SciPy quadrature of the noncentral chi-square expression for e, and NumPy vectorized enumeration of all 2^n sign strings; deterministic, no random simulation.
pi=.10:
lambda=0, n=1/3/5/9/13: .1021237192, .0291576136, .0090858496, .0009820737, .0001136335
lambda=.25, n=13: .0032603874
lambda=.75, n=13: .0497437884
lambda=.95, n=13: .0949862734
lambda=1, n=13: .1000000000
pi=.25, n=13: lambda=0 -> .0249903188; lambda=.75 -> .1812367833; lambda=1 -> .2500000000.
pi=.50, every tested lambda and n -> .5000000000.
Endpoint binomial formulas and all likelihood normalizations passed 1e-12 tolerances. `ALL_ASSERTIONS_PASSED`.
Full tested executable Python source and Class P plot code were included in the visible October 16 17:48Z Calculation Relay s4 response; this repository note records equations, fixtures, and provenance without claiming a separate historical worker action.

## Scope and next
An unknown *proper* frame is not a parity uncertainty. Repeated samples cannot remove one shared unobserved odd/even orientation ambiguity without a parity reference. The correlation lifetime of orientation parity must therefore be specified before interpreting repeated Pfaffian signs. No physical chirality readout, dynamics, or physical value of pi/lambda is established.
Optional Aldus adversarial continuation: construct a frame-parity nuisance identifiability negative control with independent sign flips versus a shared parity variable; compare exact HMM and naive independent-binomial likelihoods. Autonomous acceptance or rejection is valid.
