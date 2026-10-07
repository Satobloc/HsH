# Mercer sandbox checkpoint — exact temporal coarse-graining of a circular worldline
**Date:** 2026-10-07
**Status:** SILOED PLAYGROUND / standard-physics map; not canonical theory.

## Sources actually read
- Old archive: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT THEORY — Worldlines.txt`, requested lines 1–1200. Quarry: macroscopic worldlines as coarse-grained cords; orbital windings/vibrational modes treated geometrically; much surrounding generated ontology/numerology is not imported.
- HsH Sep-30 dump: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT WEIRD IDEAS — Kirch.txt`, requested lines 1–1200. Quarry: literal helical worldline / timesheet / down-axis geometry discussion. Generated claims are not authority.
- Onboarding: `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, Reference Desk, required symbol/citation/tool/workflow controls; HSH_RESOURCES War Room/Tool Chest/index/preference/toolkit routers overviewed. PRIOR_ART not entered.

## Result
For a charge q in uniform circular motion r(t), the exact source is
rho(x,t)=q delta^3(x-r(t)), j(x,t)=q v(t) delta^3(x-r(t)).
Period averaging gives a uniformly charged ring and exactly the steady loop current I=q/T=q f.

Because Maxwell equations are linear, averaging the *equations* over one period annihilates all time derivatives of periodic fields. Therefore, away from singular source points and with the periodic steady-state solution,
< E >_T = E_uniformly-charged-ring,
< B >_T = B_current-loop
exactly, not merely for beta<<1.

So the 4D helix -> 3D ring+loop map is an exact zero-frequency projection of standard electrodynamics. Retardation/radiation information resides in nonzero temporal harmonics and in nonlinear observables, not in the mean fields.

For any field component F(t)=sum_n F_n exp(i n omega t), a finite rectangular averaging window Delta t gives
Fbar_Delta = sum_n F_n exp(i n omega t0) sinc(n omega Delta t/2).
At Delta t=T all integer n != 0 vanish exactly. This is a calculable coarse-graining transfer function, not a new SAT law.

Radiation is the clean discriminator: <F_rad> can vanish while <S_rad> does not, because Poynting flux is quadratic. For circular motion the standard relativistic Lienard power is
P = q^2 gamma^4 a^2/(6 pi eps0 c^3)
  = [q^2 c/(6 pi eps0 R^2)] beta^4 gamma^4,
with a=v^2/R.
Thus information discarded by the exact mean-field map scales as beta^4 gamma^4 in this radiation diagnostic.

## Failure condition
If exact numerical Lienard-Wiechert period averages disagree with the static ring/loop fields at fixed nonsingular observer points after reaching periodic steady state, the derivation or boundary assumptions are wrong. Mean force/energy cannot in general be inferred by multiplying mean fields because averaging does not commute with nonlinear products.

## Next solver
Numerically integrate retarded Lienard-Wiechert E,B for a circular orbit at several beta and observer d/R; verify mean fields against direct Coulomb-ring/Biot-Savart integrals, then compare RMS harmonic residual and Poynting flux. This cleanly separates exact dimensional coarse-graining from information lost in the nonzero harmonics.

— Mercer
