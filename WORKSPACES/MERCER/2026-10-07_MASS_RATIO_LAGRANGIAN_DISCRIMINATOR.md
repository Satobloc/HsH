# Sandbox note — mass-ratio Lagrangian discriminator (2026-10-07)

**Status:** SANDBOX / noncanonical.

## Sources actually read
- Old archive: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt`, lines 1–260. Relevant recovered claims: Euclidean 4D filament/superhelix, SAT action language, baryon triplet, B-family mass-ratio assertion.
- H(s)H: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/[SAT26 PRE-ROUNDUP - init]/H(s)H MANIFOLDS.txt`, lines 1–500. Relevant recovered machinery: worldtube/UI language, quadratic rotation/action forms, recursive action, mass/topology claims. This file also preserves now-disfavored dual-shell/H0+c material; not imported as current theory.
- Front-door/reference routing reviewed before work; HSH_RESOURCES treated only as support/routing.

## Independent construction
Take the operational bending sector
[
L_b={\kappa\over2}\|H''\|^2.
]
For a normal mode (H=A u e^{i\omega\lambda}):
[
\|H''\|^2=A^2\omega^4,qquad E_b\propto {\kappa\over2}A^2\omega^4.
]
Therefore a mode ratio (\omega_e/\omega_0=B) gives a genuine fourth-power response (E_e/E_0=B^4). This is a possible origin of the historical electron-side (B^4), but the premise (\omega_e/\omega_0=B) remains to be derived.

For three equal orthogonal baryon components (H_a), quadratic action gives
[
\sum_{a=1}^3\|H_a''\|^2=3A^2\omega^4.
]
Thus a quadratic energy functional naturally produces **3**, not (\sqrt3). (\sqrt3) occurs only at the unsquared amplitude norm (\|(q,q,q)\|=\sqrt3 q), and squaring restores 3.

For a symmetric 120-degree three-filament cross-section, pair separation is (\sqrt3 A), while a quadratic pair potential sums to (3\times3A^2=9A^2). Hence (\sqrt3) can be a geometric length, but cannot survive as an energy numerator without a linear-norm constitutive law.

## Numerical audit (scripted)
With (B=3/(4\pi)=0.238732414637843):
- (3/(2B^5)=1934.34664951), +5.3478% relative to 1836.15267343.
- (\sqrt3/(2B^5)=1116.79555880).
- Required (B) for the 3-numerator formula: 0.241232875657.
- Required (B) for the sqrt(3)-numerator formula: 0.216134635736.
- Holding (B=3/(4\pi)), the exponent needed by a pure (3/(2B^n)) fit is (n=4.963629753), i.e. close to but not equal to 5. This is diagnostic only, not a fitted replacement.

## New discriminator
The historical numerator can be decided from the constitutive level:
- additive/quadratic strand energy -> 3;
- unsquared three-component amplitude -> sqrt(3);
- symmetric quadratic pair-coupling -> 9 times its single-pair coefficient.
No target mass value is needed for this test.

## Helix check
For a circular helix (x=(r\cos t,r\sin t,a t)), one-turn bending energy is
[
E_{turn}=\pi\kappa/[r(1+(a/r)^2)^{3/2}].
]
So ordinary Euler-Bernoulli helix bending does **not** generically generate a lone (B^{-1}) proton factor. The missing edge remains: derive (B^{-1}) from the actual equilibrium geometry/constraint, or reject that historical factor.

## Failure condition
If the current Lagrangian is purely quadratic in the relevant proton mode variables and no later mass map takes a square root, a sqrt(3) numerator is structurally excluded. If the proton (B^{-1}) factor cannot be obtained from an independently specified geometric constraint, the historical (B^{-5}) mass formula is not a Lagrangian derivation.

## Next solver test
Build a minimal 3-filament variational model with 120-degree phases, finite-core pair coupling, and time-normal coupling. Symbolically integrate one period, minimize over radius/pitch, then compare the dimensionless proton/electron stationary-action ratio without using 1836 as an input. Track separately strand self-energy, pair energy, and time-normal work.
