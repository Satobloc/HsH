# Ravel sandbox checkpoint — zero-radius plateau no-go and smooth C3 repair

**Date:** 2026-10-02  
**Status:** sandbox construction; not canonical SAT/H(s)H  
**Question:** Does the pointwise zero-radius plateau in the partial-collapse phase-slip packet survive the full smooth Euler–Lagrange equations?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2023-24 FRAMEWORK DEVELOPMENT/SAT Lagrangian and Variational Derivation (1).txt` — **full sequential read** of the complete file returned by GitHub (SHA `9d5db44f16f1f2d853332efd8d91995a37e8d394`). It supplies a historical scalar kinetic term, a threefold (cos(3\theta_4)) pinning term, a constrained vector field, and summary Euler–Lagrange equations. Its overloaded (	heta_4), asserted kink, and incomplete constraint analysis remain historical source claims, not controls.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_105_EXACT_FINITE_SLAB_FOLD_UNIQUENESS.md` — **full sequential read** (SHA `653b53a9900c6e080fc2ec79737ed314bdd090bf`). It proves one fold for a leading (B^3) finite-slab inverse map and explicitly limits the theorem to its local model. Used only as a method precedent: declare the model class, prove uniqueness there, and report rank-loss/failure conditions.
3. Google Drive targeted searches for “phase slip amplitude collapse finite core” and “SAT Lagrangian Variational Derivation” — **indexed / targeted collision check**. They surfaced historical chat exports containing phase-slip language and the user’s “hold one parameter still” method, but no zero-radius stationary theorem.
4. Slack search for “phase collapse” — **indexed / targeted collision check**. It found the three immediately preceding Ravel checkpoints and no independent no-go result.

## Source fact → translation → new conjecture

- **Source fact (historical):** the archive used an angular field with threefold pinning.
- **Translation:** if that angle becomes an internal orientation of a finite core, the angle is undefined when the core amplitude/radius vanishes. A radial amplitude must therefore accompany it.
- **New sandbox conjecture:** H(s)H should use a Cartesian finite-core order parameter near collapse. Threefold angular pinning is a derived anisotropy of that order parameter, not a standalone angle potential valid through zero radius.

## Minimal stationary mechanics

Let (s) be arclength along a restricted material carrier, (ho(s)=a(s)/a_0\ge0) its dimensionless core amplitude, and (u(s)) its internal orientation. Consider

[
E[ho,u]=int dsleft[
rac C2(ho')^2+rac K2ho^2(u')^2+
raclambda4(ho^2-1)^2+Jho^2Y(u)
ight].
]

Here (C,K) have units energy·length and (lambda,J) have units energy/length. The stationary equations, where (Y) is differentiable, are

[
Cho''=Kho(u')^2+lambdaho(ho^2-1)+2Jho Y(u),
]

[
(Kho^2u')'=Jho^2Y'(u).
]

## No-go for a smooth zero-radius plateau

Assume a local stationary solution with:

- (ho\ge0) and (hoin C^2);
- (u,u') bounded near a proposed collapse point;
- bounded (Y(u));
- local smooth/Lipschitz constitutive coefficients.

If (ho(s_0)=0), nonnegativity makes (s_0) a local minimum, so (ho'(s_0)=0). The radial equation is a locally Lipschitz second-order ODE of the form

[
ho''=ho,Q(s,ho).
]

The initial data (ho(s_0)=ho'(s_0)=0) have the unique solution (hoequiv0) on the connected regular interval. Therefore a nontrivial smooth stationary profile cannot descend to zero, remain there for finite width, and restart. It cannot even touch zero at an isolated smooth radial minimum.

**Consequence:** the earlier pointwise plateau is not a (C^2) stationary solution of this smooth polar model. It is either an avoided collapse (ho_{min}>0), a singular/nonsmooth event, a time-dependent slip, or evidence for a nonlocal/free-boundary constitutive law.

## Why the (Jho^2Y(u)) term fails at collapse

Set the Cartesian order parameter

[
psi=X+iZ=ho e^{iu}.
]

If (V_{m an}=Jho^2Y(u)) had a (C^2) extension at (psi=0), Taylor expansion along every unit ray (n(u)) would require

[
JY(u)=rac12 n(u)^{T}Hn(u)
]

for one Hessian (H). A two-dimensional quadratic form has only angular harmonics (0) and (2). A nonconstant threefold-periodic (Y) has harmonics divisible by (3). The only common possibility is the constant mode. Hence a nonconstant (C_3) pinning law proportional to (ho^2) is not (C^2) at the collapsed core.

A generic smooth local (C_3)-invariant Cartesian potential instead begins as

[
V(psi)=V_0+alpha|psi|^2-g,mathrm{Re}(psi^3)+eta|psi|^4+cdots
]

or

[
V(ho,u)=V_0+alphaho^2-gho^3cos(3u)+etaho^4+cdots.
]

Additional symmetries may suppress the cubic term, but they can only move the first anisotropy to higher order, not back to a nonconstant quadratic angular law.

## Candidate-family comparison

| Architecture | Collapse behavior | Interpretation |
|---|---|---|
| Smooth bulk (B^3) or material (B^2) order parameter | No finite zero plateau; generic threefold pinning vanishes as (ho^3) or faster | Zero is a regular Cartesian point; polar coordinates fail there |
| Boundary/contact/readout law | A (ho^2Y(u)) term may be admitted as a nonsmooth interface law | Any compact plateau belongs to the interface constitutive rule, not smooth bulk mechanics |
| Time-dependent slip | (ho) may transiently approach/cross zero | Requires dynamical action and event boundary data; not a static saddle |
| Nonlocal or higher-gradient core | No-go need not apply | Must exhibit the term that breaks local ODE uniqueness |

A smooth Cartesian trajectory can pass through (psi=0) only transversely, with (psi'(s_0)
e0). Then (ho=|psi|) has a cusp and the zero is isolated—not a smooth radial plateau.

## Prediction/solver packet earned

**Invariant scaling discriminator**

[
T_3:=-partial_uV.
]

- smooth generic bulk (C_3) model:
  [
  T_3=-3gho^3sin(3u)+O(ho^4),
  qquad |T_3|/ho^2	o0;
  ]
- quadratic contact law:
  [
  T_3=-Jho^2Y'(u),
  qquad T_3/ho^2	o-JY'(u)
  ]
  where defined.

**Units:** (T_3) is energy per length in the one-dimensional reduction.  
**Readout:** infer (ho) from the resolved core cross-section, then measure angular restoring torque or the phase-mode curvature at several small amplitudes.  
**Uncertainty:** the exponent is fixed only after deciding whether the active law is smooth bulk, boundary/contact, or nonlocal.  
**Falsification:** a claimed smooth local bulk model is false if a nonconstant (T_3/ho^2) remains finite as (ho	o0), or if its converged stationary solver produces a finite exact zero plateau without a singular coefficient.

## Exact solver test

Run the same adjacent-sector boundary conditions in two formulations:

1. projected polar variables ((ho,u)) with (Jho^2Y(u));
2. unconstrained Cartesian variables ((X,Z)) with a smooth (C_3) potential beginning at (-g,mathrm{Re}(psi^3)).

Use mesh refinement and report (ho_{min}), zero-set width, action, and Hessian spectrum. In the smooth Cartesian model, a finite zero plateau must disappear; any zero is isolated and transverse. If a plateau converges, identify the explicit non-Lipschitz, nonlocal, higher-gradient, or free-boundary term supporting it. A polar solver that clips (hoge0) and retains a grid-sized plateau has produced a representation artifact.

## Failure boundary

This no-go does not cover unbounded (u'), non-Lipschitz contact potentials, nonlocal resolver coupling, higher derivatives, active/time-dependent dynamics, topology-changing free boundaries, or a core variable that is not an order-parameter amplitude.

## Next dependency

Meridian: implement the two-formulation mesh-refinement test and determine whether the previous plateau width shrinks to zero, becomes an avoided collapse, or survives only after an explicitly declared nonsmooth interface law.
