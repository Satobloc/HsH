# Meridian | Lorentz-native ᚼᚼ contact + finite active-wavefront sweep
**Date:** 2026-10-10. **Status:** SANDBOX, tested geometry, not adopted physics. **Scope:** straight SAT worldlines in flat Minkowski, candidate filled-ball finite cores. Not ER/Kerr/Pauli.
**Source boundary:** Old SAT `SAT_THEORY_ARCHIVE_2023-25/RMS Spacetime Filaments.txt` (complete, 10,663 chars); `WORLDTUBE THOUGTS.txt` (substantial 19k/22.4k, mixed authorship). HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt` (complete, 9,258 chars); `4D THINKING PRIMER.txt` (complete, 4,291 chars). Current front door, Oct 9 scope, symbol/namespace and workflow controls read; HSH_RESOURCES War Room/toolkit/index/Tool Chest/navigation familiarization. No Hypothesis H or direct Schreiber materials read. No outside source imported as premise.

## Recovered SAT construction
Aligned straight vacuum filaments, 4D worldlines, advancing time wavefront, filament–wavefront interactions. New derivation below is not present in these sources.

## Exact LOCAL:MERIDIAN-SWEEP construction
Use a 2+1 Minkowski section with w=ct, c=1; timelike inertial centerlines X_i(w)=(w,x_i^0+v_i w), |v_i|<1. Rest-core radius R_i is a disposable test parameter, not an inferred Kerr radius. At common wavefront w the Fermi-normal filled ball is
```
r·r + gamma_i^2 (v_i·r)^2 <= R_i^2, gamma_i=(1-|v_i|^2)^(-1/2).
Q_i=R_i^2(I-v_i v_i^T)
h_i(n)=R_i sqrt(1-(n·v_i)^2), |n|=1.
```
For initial center separation d e_x, instantaneous contact threshold is
```
dcrit(0)=min_{n_x>0} (h_1(n)+h_2(n))/n_x.
```
For finite linear active-wavefront slab w∈[-Delta_w/2,+Delta_w/2], the initial-separation contact-opportunity region is the Minkowski sum of the two ellipsoid bodies and a relative-velocity sweep segment. Thus
```
dcrit(Delta_w)=min_{n_x>0} [h_1(n)+h_2(n)+(Delta_w/2)|n·(v_1-v_2)|]/n_x.
```
**New invariant/grammar:** contact support adds linearly under finite wavefront sweep. Lorentz contraction generates contact anisotropy without importing a material-frame ellipse. This is a *geometric opportunity*, not a force, medium, persistent EM field, or Pauli exclusion proof.

## Calculated fixture
R1=R2=1, v1=(0.8/sqrt(2),0.8/sqrt(2)), v2=(0,0), initial separation along x.
- Delta_w=0: dcrit=1.780264126608; optimum separating-normal angle 0.2221786930 rad.
- Delta_w=0.2: dcrit=1.848704199433; optimum angle 0.1914218041 rad.
- For d=1.82, w=0 cores do NOT intersect (gap ~0.03878); w=-0.1 cores DO intersect (polygon overlap area ~0.00604). The finite slab increases threshold by ~3.844%.
- 2,000 random Minkowski/ellipse identity checks passed; exact static/equal-velocity special cases passed; independent convex-hull polygon contact threshold within 1.5e-6 of analytic support minimization.

## Crucial negative control and limits
A nonconvex annulus of radii [.9,1.1] and concentric disk radius .2 have overlapping convex hulls but no physical intersection. Therefore **do not apply the convex support-hull criterion directly to a Kerr ring, hollow shell or toroidal singular support**. Need actual-set intersection / signed-distance solver. A wavefront-gated contact test depends on the chosen wavefront geometry; full 4D intersection is coordinate invariant. Flat-space geometry does not imply quantum antisymmetry.

## Next test
In 3+1 Minkowski, compare for the *same* worldtube histories: (1) local Fermi chart regularity; (2) nonconvex Kerr-like singular-support and shell actual intersections; (3) active-wavefront slab contact. Retain strict geometry/constitutive/exclusion distinction. Return to independent coiling selection after the contact gate is certified.

Full executable solver, plots, numerical test and 7.6k-character checkpoint delivered in the Meridian conversation package `meridian_wavefront_sweep_2026-10-10.zip`.
