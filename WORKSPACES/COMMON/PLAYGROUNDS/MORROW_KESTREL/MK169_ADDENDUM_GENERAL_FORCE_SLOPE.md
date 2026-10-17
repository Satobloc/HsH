# MK169 addendum: general force-slope discriminator
**SANDBOXED / Morrow–Kestrel / 2026-10-09.** Continuation of [MK169](MK169_2026-10-09_RADIATION_SILENCE_VS_TRIAD_STABILITY.md), not a new branch.

For three equal masses on a planar equilateral circular orbit under any smooth attractive central pair force of magnitude F(d), let d be the pair separation and define the **local** slope n=1-d(ln F)/d(ln d). With angular frequency omega²=3F(d)/(m d), the full 12×12 rotating-frame linearization has characteristic polynomial (z is frequency divided by omega):

chi(z)=z²(z²+1)²(z²+4-n)[4z⁴+(16-4n)z²+n²]/4.

For 2<n<4, unstable shape modes have real growth rate sqrt[(n-2)/2] per orbital radian. Therefore **absence of exponential shape instability requires local force falloff no steeper than inverse distance**, d ln F/d ln d >= -1, within this central-force model. Equality is marginal, not proven nonlinear stability. For a local power law F∝d^(-p), threshold is p=1. The inverse-square case p=2 gives growth 1/sqrt(2), or factor 85.0197 per orbit.

For the conditional softened potential V=-kg²/sqrt(d²+a²), n=3d²/(d²+a²), so the boundary n=2 gives a/d=1/sqrt(2). Distinguish interaction-softening a from physical filament-core radius. The solver in the task-thread MK169 bundle numerically checked six local power-law exponents and the full softened sweep.

**H(s)H discriminator:** calculate the actual interbraid/timesheet pair-force Jacobian at a proposed three-filament equilibrium. If its effective central radial falloff is inverse-square, a distinct noncentral, multibody, or director-frame coupling is needed for equilateral shape stability. This does not claim all possible H(s)H triads are unstable.

**Provenance:** source coverage and quarantine boundaries are recorded in the parent MK169 checkpoint. This addendum is independent classical-model algebra, not a recovered SAT theorem or particle prediction.
