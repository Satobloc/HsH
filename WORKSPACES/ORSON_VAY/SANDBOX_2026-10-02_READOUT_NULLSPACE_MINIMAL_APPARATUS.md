# Orson Vay Sandbox — Readout Nullspace and Minimal Apparatus

Status: SANDBOX / noncanonical.

## Sources read
- SAT_THEORY_ARCHIVE_2023-25/2026/SAT++.txt — substantially read the section where Nathan restates SAT as a largely standard-physics Minkowski/worldline map: internal particle degrees as nested 4D superhelical structure; external forces as perturbations; two extra physical moves are timesheet↔worldline coupling through theta_4 and force transmission along filaments; equivalent bookkeeping can place response in filament, timesheet, or both.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_136_CROSSOVER_INVERSE_MAP_IDENTIFIABILITY.md — read complete. Exact local inverse recovers rho_eff=rho_n+h and signed incidence alpha from (K, ell_parallel, Xi), but cannot split rho_n from h.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md — read complete as internal cross-check after construction. Its independent one-sided support observables demonstrate the general strategy of adding a geometry-sensitive observable to lift a hidden support degeneracy.

## New construction
Treat the timesheet as a measurement map, not a passive movie screen. For latent q=(rho_n,h,alpha) at fixed K,

ell = 2 sqrt(2(rho_n+h)/K),
Xi = alpha/sqrt(K(rho_n+h)).

The Jacobian J=d(ell,Xi)/d(rho_n,h,alpha) has rank 2 and exact null vector

v0=(-1,+1,0).

Thus the unresolved direction is not vague "hidden information": it is specifically exchange of normal support and thickness at fixed total effective support.

Define a contrast coordinate

chi=(rho_n-h)/(rho_n+h).

Then the augmented map q -> (ell,Xi,chi) has

det d(ell,Xi,chi)/dq = 2 sqrt(2) / [K(rho_n+h)^2] > 0.

So ONE additional scalar observable transverse to v0 is locally sufficient to make the leading latent state identifiable.

General apparatus criterion: if y=R(q) has Jacobian J_R and nullspace N, extra observables z=D(q) complete the readout iff ker J_R intersect ker J_D = {0}. Minimum number of independent scalar channels is at least dim ker J_R.

## Physical implication
If SAT is a 4D map and H(s)H makes the map finite-core, emergence can be formulated as quotienting latent geometry by an observer/readout map. "Observer completeness" is rank, not metaphor. Missing readout channels create equivalence classes of 4D states; memory kernels are required only if unresolved null directions affect subsequent dynamics and cannot be supplied by instantaneous extra observables.

## Solver test
Use an actual finite-core geometry and compute J_R by automatic differentiation. Extract its singular vectors. Design one candidate geometric observable whose gradient overlaps the null vector. Verify smallest singular value of augmented Jacobian rises from zero and held-out latent reconstructions become unique without fitting.

For Run 136, test any proposed thickness-sensitive D by checking dD(v0) != 0. The contrast chi is a mathematical witness, not yet a claimed physical observable.

Independent script checks:
- SymPy gives rank(J)=2 and null(J)=span{(-1,1,0)}.
- SymPy gives augmented determinant 2*sqrt(2)/(K(rho_n+h)^2).
- Numerical sweep of Run 110 contact measure for eta={0.25,1,4} peaks at Lambda=sqrt(2) to grid precision, matching its analytic theorem.

## Failure conditions
Demote if rho_n and h are gauge-equivalent rather than physically distinct; if no admissible observable couples to v0; if the full H(s)H action removes this latent decomposition; or if an augmented observable restores algebraic identifiability but does not improve dynamical prediction.

## Next cursor
Compute the observability matrix for a dynamical finite-core model: [J_R; J_R A; J_R A^2; ...]. This distinguishes a state invisible in one frame from one invisible for an entire history. That is the clean bridge from static 4D geometry to apparent temporal memory.
