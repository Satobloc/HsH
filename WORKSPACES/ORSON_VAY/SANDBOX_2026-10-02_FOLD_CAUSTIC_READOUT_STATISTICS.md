# Orson Vay sandbox — Fold caustic as readout statistics (2026-10-02)

Status: SANDBOXED. Not canonical SAT/H(s)H.

## Sources actually read
- SAT_THEORY_ARCHIVE_2023-25/Filament onto.txt — first 500 lines fetched; used the explicit methodological constraint that SAT must incorporate standard physics, the two-object filament/timesheet picture, 4D persistence vs 3D accessibility, and the repeated distinction between persistent filaments and transient timesheet excitations. Did not import black-hole/particle identifications, historical constants, or numerical targets.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_126_DIRECT_READOUT_ENDPOINT_RECONSTRUCTION.md — read complete. Used the finite-slab normalized readout Y=H(r), r=h/epsilon, R=epsilon+h=K ell_parallel^2/8, and the established two-branch inverse with distinct endpoint asymptotics.

## New sandbox construction
Treat the finite-slab inverse as a physical readout map Y=H(r). Near any nondegenerate fold r=r*, write
Y = Y* - (a/2)(r-r*)^2 + O((r-r*)^3), a=-H''(r*)>0.
For a smooth latent sampling density rho(r) with rho(r*)=rho0>0, the pushforward observable density is
p(Y)=sum_i rho(r_i)/|H'(r_i)|.
With r-r* = +/- sqrt(2(Y*-Y)/a), this gives the universal fold law
p(Y) ~ sqrt(2) rho0 / sqrt(a (Y*-Y)).
The divergence is integrable. Thus a deterministic smooth distribution of hidden finite-core states produces an observable pile-up at the readout fold, purely because the resolving map is many-to-one.

This is not a Born-rule claim. It is a geometric caustic/readout-statistics prediction.

## Discriminator
Sample r smoothly (uniformly first, then several smooth nonuniform densities), compute exact Y=H(r), histogram Y near the known unique fold, and fit log p vs log(Y*-Y). H(s)H finite-slab geometry predicts slope -1/2 whenever the fold is nondegenerate and rho(r*) != 0. The coefficient should scale as rho0/sqrt(a).

## Failure conditions
- the exact H(r) has a degenerate rather than quadratic fold;
- the physical measure vanishes at r* strongly enough to cancel the caustic;
- the two inverse branches are gauge copies rather than distinct latent states;
- solver histograms fail to converge to exponent -1/2 under controlled smooth sampling.

## Carry-forward
A static deterministic 4D geometry plus non-injective timesheet readout can generate apparent probabilistic weighting. The first quantity to test is not a quantum probability law but the universal fold-caustic exponent -1/2.
