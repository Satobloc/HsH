# Mercer Sandbox — Chirality Cancellation Extensivity Test — 2026-10-05

**Status:** SILOED PLAYGROUND / not canonical theory.

## Sources actually read
1. Old archive: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H Dev +/H(s)H REWORK.txt`, opening July-5 Hessian-audit / reconstruction sequence. Read the explicit correction that the long-wave k^2 term must come from genuine line/network tension or an interaction Hessian rather than calibration, and the warning against repair factors.
2. HsH Sep-30 dump: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/H(SAT)H - init/HsH Classic Run.txt`, opening through Nathan's methodological correction. Read the Kelvin-vortex/electrogravity proposal, chirality-cancellation idea, battery discussion, and Nathan's explicit prohibition on using braid smoothing / collective attenuation / similar factors as numerical repairs.

## Independent sandbox construction
Let N microscopic worldtube contributions have equal unsigned response q and signed chirality variables s_i in {+1,-1}, with E[s_i]=epsilon and Var(s_i)=1-epsilon^2.

Net response:
Q_N = q sum_i s_i.

Then
E[Q_N] = q epsilon N,
Var(Q_N) = q^2 N(1-epsilon^2),
sigma_Q = q sqrt(N(1-epsilon^2)).

### Exact-symmetry regime
If epsilon=0:
typical |Q_N| ~ q sqrt(N),
so |Q_N|/N ~ q/sqrt(N).
This is non-extensive. A naive random-sign chirality-cancellation mechanism therefore cannot by itself produce a universal weak force proportional to bulk amount of matter.

### Biased regime
If epsilon != 0:
mean response is extensive, q epsilon N.
Relative stochastic fluctuation is
sigma_Q/|E[Q_N]| = sqrt(1-epsilon^2)/(|epsilon| sqrt(N)).

Thus a scale-independent weak residual requires a nonzero, approximately universal microscopic chirality bias (or an equivalent correlation structure that produces an O(N) term). Random cancellation supplies only the subleading O(sqrt(N)) noise.

For the arbitrary illustration epsilon=10^-6, relative fluctuation is ~3.16e4 at N=10^3, 1 at N=10^12, and 1e-6 at N=10^24. These are demonstration values only, not fitted SAT constants.

## H(s)H translation
If electrogravity is a medium response sourced by signed worldtube stirring, the constitutive source must decompose into an extensive parity-even/universal component plus any chirality-sensitive fluctuating component. Calling the latter “gravity after cancellation” is insufficient unless the geometry independently generates the required nonzero mean or long-range correlations.

## Failure condition
If the microscopic H(s)H ensemble is exactly chirality symmetric and short-range correlated, while the proposed gravity-like response is only the uncancelled signed vortex sum, the mechanism fails the extensivity test.

## Solver / experiment discriminator
Simulate ensembles with controllable chirality bias epsilon and correlation length n_c. Measure Q_N versus N. Fit exponent beta in |Q_N| proportional to N^beta.
- beta ~ 1/2: random-cancellation regime; unsuitable as sole bulk gravity source.
- beta ~ 1: extensive constitutive source exists.
Then test whether beta and Q_N/N remain stable under composition / braid-statistics changes. Material dependence would be a direct warning sign for a universal gravity-like sector.

No historical magic number or particle constant was used as a target.
