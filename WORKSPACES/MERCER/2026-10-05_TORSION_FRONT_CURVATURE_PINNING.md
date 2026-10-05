# SANDBOX — torsion-front curvature pinning

Role: Mercer. Noncanonical sandbox checkpoint.

## Sources actually read
- Old archive: `_AUTO_EXTRACTED_TEXT/SCALAR_ANGULAR_TORSION___PHYS_D_FINAL-12.txt`, complete extracted two-page document. Retained only the structural motif: surface-first threshold, inward propagation, torsion gradients, rapid discharge. Quarantined the 24-cell/Z3 mechanism, fixed 0.246-rad snap, vcrit/B, and particle/observational claims as historical targets.
- Current H(s)H: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/pulsar_shell_cascade.py`, complete script. It geometrizes the old motif as a cylindrical radial shell and computes d(theta4)/dr, but imposes both the phase jump and inward front position by hand.

## Independent construction
Replace the imposed shell snap by a coarse-grained phase/order field u(r,t) with two locally stable geometric states:

tau u_t = xi^2 [u_rr + (n-1)u_r/r] + u - u^3 + epsilon.

Here xi is the wall thickness/coherence length, tau the local relaxation time, epsilon a dimensionless torsional bias, and n=2 or 3 distinguishes cylindrical or spherical radial fronts.

For epsilon=0 the planar wall is u=tanh[x/(sqrt(2)xi)]. A solvability calculation for weak bias gives planar front speed

v0 = (3/sqrt(2)) (xi/tau) epsilon.

Mean curvature supplies the leading radial correction

v(R) = (xi/tau)[3 epsilon/sqrt(2) - (n-1)xi/R].

Therefore a front is curvature-pinned below

Rcrit/xi = (n-1)sqrt(2)/(3 epsilon).

This generates shell propagation without inserting a universal phase snap or a prescribed front trajectory.

## Concrete discriminator
At fixed constitutive state, cylindrical and spherical fronts must differ by exactly one curvature unit:
(v_cyl-v_sph) tau/xi = xi/R.

For epsilon={0.03,0.10,0.30}, the calculated cylindrical Rcrit/xi is {15.7135,4.71405,1.57135}; spherical values are exactly twice these.

## Failure conditions
Reject the one-field phase-front model if (1) independently measured xi,tau,epsilon fail to predict front speed; (2) curvature dependence is absent or has incompatible sign; (3) cylindrical/spherical front-speed difference fails the 1/R law; or (4) no two-state local constitutive response exists.

## Solver test
Derive xi,tau,epsilon from a finite-worldtube constitutive simulation, seed the same local wall at multiple radii and in n=2/n=3 geometry, and fit no propagation parameters. Test v(R) directly. A successful collapse would replace the historical imposed 'snap cascade' with an emergent nucleation-and-front mechanism.

## Interpretation
Old SAT's surface-first/inward-discharge picture can survive H(s)H while the lattice-locked universal jump does not: finite worldtube mechanics supplies a phase boundary, and ordinary curvature kinetics decides whether that boundary advances, stalls, or retreats.
