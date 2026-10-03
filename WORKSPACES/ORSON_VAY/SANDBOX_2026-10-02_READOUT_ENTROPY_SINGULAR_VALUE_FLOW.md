# ORSON VAY SANDBOX — READOUT ENTROPY AS SINGULAR-VALUE FLOW
Date: 2026-10-02
Status: speculative sandbox; not canonical SAT/H(s)H.

## Sources actually read
1. SAT_THEORY_ARCHIVE_2023-25/SAT-TO-STANDARD 1.txt — read complete (21,760 chars). Extracted: particle=worldtube/intersection; timesheet=foliation/section; projection-dependent observables; projection as information loss; coarse-graining as slicing/RG; rope/twine hierarchy as effective-field hierarchy. Historical phenomenology/constants were not imported.
2. HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/4D THINKING PRIMER.txt — read complete (4,291 chars). Extracted: full 4D worldtube ontology; apparent events as sections; dynamics as 4D structure; phase/orientation and topology emphasis. Strong ontology statements are treated here as sandbox premises, not established physics.

## Independent construction
Let q be a local finite-core 4D H(s)H state with covariance Sigma. A resolving apparatus/timesheet supplies noisy readout
y = C(t) q + eta,  eta ~ N(0,N).
For linear-Gaussian local fluctuations the information accessible in one section is
I_t = 1/2 log det[I + Sigma C(t)^T N^{-1} C(t)].
Define readout/coarse entropy relative to a reference fine readout C_0 by
S_R(t)/k_B = I_0 - I_t.
Thus entropy production is not postulated from the static 4D block. It appears only when the family of resolving maps becomes progressively less informative.

SVD-whitened form: if A=N^{-1/2} C Sigma^{1/2} has singular values s_i,
I_t = 1/2 sum_i log(1+s_i^2),
so
d(S_R/k_B)/dt = - sum_i [s_i/(1+s_i^2)] ds_i/dt.
A sufficient arrow condition is ds_i/dt <= 0 for all accessible modes. Geometry alone does NOT guarantee this.

Nested coarse-graining gives a data-processing inequality. If y_{n+1}=P_n y_n + fresh noise, then
I(q;y_{n+1}) <= I(q;y_n),
hence S_R,n+1 >= S_R,n.
This supplies a precise candidate relation between the old SAT timesheet/coarse-graining intuition and H(s)H emergence.

## Scripted toy check
For a fixed correlated 4-mode Gaussian state and noise variance 0.2, successive nested readouts retaining 4,3,2,1 coordinates gave mutual information
3.92285, 3.15587, 2.21838, 1.19895 nats.
Lost information therefore increased monotonically under the deliberately nested projection. This was a check of the algebra, not a physical fit.

## Physical interpretation / conjecture
If H(s)H is a static 4D history, an arrow of apparent macroscopic dynamics cannot come merely from 'moving through the block.' A candidate arrow arises when the effective resolving/coarse-graining channel forms a semigroup of lossy maps. The thermodynamic-looking direction is then the direction of decreasing observable singular values / increasing response-equivalence classes.

This is stronger than saying projection loses information: it makes entropy production calculable from the spectrum of the readout operator.

Potential multiscale link:
fine worldtubes -> response quotient -> Schur elimination -> reduced readout C_l -> singular-value flow -> constitutive entropy production.
The same machinery could define when a bundle becomes a higher-scale effective individual: internal singular directions collapse while a small external response subspace remains stable.

## Critical boundary
Readout entropy is not automatically thermodynamic entropy. To earn that identification H(s)H must derive a macrostate measure or constitutive entropy current and show consistency with energy conservation, fluctuation-dissipation/response, and standard thermodynamic limits.

## Failure conditions
- The physical readout family is not nested/contractive and singular values revive generically.
- History observability restores the supposedly lost modes, making S_R only instantaneous ignorance.
- S_R fails to track entropy in a standard many-body benchmark.
- The result depends on arbitrary coordinate choice rather than invariant singular values after physically defined whitening/noise metric.
- The completed H(s)H dynamics has no mechanism selecting a retarded/contractive readout semigroup.

## Solver test
Take one finite-core H(s)H simulation with known full state q(t). Construct the physically defined timesheet/readout Jacobian C(t), whiten it by the state covariance and measurement metric, and track singular values s_i(t). Independently compute a conventional coarse entropy (Gibbs/Boltzmann or hydrodynamic entropy current) from the same simulation. Preregister the comparison:
dS_R/dt = -k_B sum_i s_i/(1+s_i^2) ds_i/dt.
If the signs and rates fail systematically, reject readout entropy as a thermodynamic bridge. If they agree in a controlled coarse-grained regime without fitting, promote it as a candidate constitutive bridge.

— Orson Vay
