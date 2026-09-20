# Whirligig variational local check — 2026-09-20

**Status:** SANDBOX / constructive mathematical reconstruction / local check only  
**Scope:** candidate functional recovered from the near-primary Deep Dive/UI-Whirligig witness; this note does not validate or disclaim the wider Whirligig or GR↔QM programme.

## Candidate geometry

Take the constant-radius specialization

\[
H(s)=\big(R\cos(\omega_s s+\phi_0),R\sin(\omega_s s+\phi_0),r\cos(\omega_h s+\psi_0),r\sin(\omega_h s+\psi_0)\big).
\]

Then

\[
\|H\|^2=R^2+r^2,
\qquad
\|H''\|^2=R^2\omega_s^4+r^2\omega_h^4.
\]

The candidate functional is

\[
J[H]=\int ds\left[\frac{\kappa}{2}\|H''\|^2+\frac{\lambda}{2}(\|H\|^2-\rho^2)^2+\frac K2\|H-G\|^2\right],
\]

where I have renamed the constraint target radius `rho` to avoid colliding it with the first-plane amplitude `R`.

## Euler–Lagrange equation

For fixed `G(s)`, direct variation gives

\[
\kappa H''''+2\lambda(\|H\|^2-\rho^2)H+K(H-G)=0.
\]

This follows from two integrations by parts of the `H''` term. No physical interpretation is used.

## Constant-radius uncoupled test

Set `K=0` and define

\[
\Delta=R^2+r^2-\rho^2.
\]

Each nonzero rotating plane must satisfy

\[
\kappa\omega_s^4+2\lambda\Delta=0,
\qquad
\kappa\omega_h^4+2\lambda\Delta=0.
\]

Therefore, for this literal functional and this constant-radius ansatz,

\[
\omega_s^4=\omega_h^4=-\frac{2\lambda\Delta}{\kappa}.
\]

For real positive frequencies this requires `-2 lambda Delta / kappa >= 0`. In particular, if `kappa>0`, `lambda>0`, and `Delta>0`, there is no nonzero real-frequency stationary solution of this uncoupled form.

## Why the recovered `omega_h^4 = -2 lambda r^2 / kappa` can appear

If the target radius is set to the first-plane amplitude, `rho=R`, then `Delta=r^2`, giving

\[
\omega_h^4=-\frac{2\lambda r^2}{\kappa}.
\]

But the same substitution also gives

\[
\omega_s^4=-\frac{2\lambda r^2}{\kappa}.
\]

So the displayed `omega_h` relation is algebraically recoverable from the literal candidate functional, but it is not by itself a special internal-frequency consistency law: under the same assumptions the external plane obeys the identical fourth-power condition.

There is also a notation/constraint issue: if the penalty was intended to constrain the full 4D curve to a sphere of radius `R`, then with first-plane radius also called `R`, the ansatz has `||H||^2-R^2=r^2`; the penalty does not vanish unless `r=0`. This may be a notation collision rather than the intended geometry, hence the neutral `rho` above.

## Repair branches worth testing next

1. Distinguish the embedding radius `rho` from both rotating-plane amplitudes and recover the intended relation among them from source.
2. Retain the coupling `K(H-G)`; it can change the plane-by-plane stationary conditions and may be essential rather than optional.
3. Check whether the intended constraint term had a different sign, multiplier formulation, or exact `S^3` constraint instead of a positive penalty.
4. Restore slowly varying `R(s)` rather than the constant-radius specialization and calculate the adiabatic correction terms explicitly.
5. Determine whether `omega_s` and `omega_h` are meant to be independently prescribed encoding frequencies rather than variational degrees of freedom.

## Current verdict

**LOCAL DEFECT / REPAIR REQUIRED in the literal constant-radius, uncoupled presentation.** The fourth-order Euler–Lagrange structure is internally derivable. The advertised internal-frequency relation is also derivable after `rho=R`, but then (a) the same relation constrains the other rotating plane, and (b) positive bending and positive penalty coefficients with positive `Delta` give the wrong sign for a real nonzero frequency. This is not a verdict on the wider solver because the coupling, radius semantics, sign convention, and adiabatic terms have not yet been reconstructed/worked through.
