# EXP003 — Kernel Delta: What Changed After the Refined Handoff

**Date:** 2026-10-01  
**Status:** sandbox synthesis / next-test map

## 1. What this kernel improves over EXP002

### A. Carrier and frame are now properly separated

EXP002 mixed centerline finite-core geometry, support tensor dynamics, and readout more tightly than necessary.

The new kernel gives a cleaner hierarchy:

`X(s,tau)` = carrier history,

`Q(s,tau) in SO(4)` = transported frame,

`K_s` = transverse finite-core support,

`Omega_s = Q^-1 Q_s` = local frame generator.

This is better typed and gives each sector its own equations.

### B. The old UI normalization becomes kinematic

From

`X=rRn0`,

`n=Rn0`,

`Omega=R'R^-1`,

we get

`|X'|^2 = (r')^2 + r^2 |Omega n|^2`.

Under arclength parameterization,

`1/2 r_s^2 + 1/2 r^2 |Omega n|^2 = 1/2`.

This is a valuable cleanup: the historical `0.5` can be interpreted as unit-speed gauge normalization rather than a physical constant. Also, the physically relevant angular contribution is `|Omega n|^2`, not necessarily the full Frobenius norm `Omega:Omega`.

### C. ᚼ becomes generator recursion rather than a scalar penalty

EXP002 proposed a scalar residual

`h_H = omega_H - q_H e`.

That can survive as a reduced diagnostic, but the stronger formulation is

`Omega_(n+1) = H_n[Omega_n]`.

This moves ᚼ upstream: it acts on the generator of geometry rather than merely measuring one angle-expansion mismatch after the fact.

### D. Discreteness now has a sharper candidate source

Instead of attaching discrete labels or winding numbers, require both

`X(L)=X(0)`

and

`U_gamma = P exp int Omega ds in C`.

Quantization-like discreteness can then arise, if it arises at all, from isolated solutions of a continuous boundary-value problem.

This is mathematically cleaner and easier to falsify.

### E. The 3+3 question is now testable

The six SO(4) rotation generators decompose naturally as

`so(4) = su(2)_+ (+) su(2)_-`.

That provides a real 3+3 split at the algebra level.

The project-level question is now precise:

Does the independently developed 3+3 geometry reduce to or induce this self-dual / anti-self-dual split, or are they unrelated six-component structures?

## 2. How EXP002 should now be read

EXP002 is still useful for three pieces:

1. the independent finite-core readout integral;
2. the transverse/tangency crossover function `F(Lambda)`;
3. the explicit backreactive readout-field idea.

Its provisional `h_H` term should now be treated as a possible low-dimensional reduction of the fuller generator-recursion picture, not as the primary definition of ᚼᚼ.

Its phase-field resolver `phi` remains an optional mathematical import, not a core primitive.

## 3. Immediate combined architecture

The cleanest merged system now looks like

`(X,Q,K)`

`-> Omega_s, Omega_tau`

`-> H-recursion / preferred generator Omega_*`

`-> carrier + frame action`

`-> positional + holonomy closure`

`-> finite-core readout R_Sigma`

with optional medium/resolver dynamics.

A merged sandbox action is

`L = mu/2 |X_tau|^2 + I/2 ||Omega_tau||^2`

`    - T/2 |X_s|^2 - B/2 |X_ss|^2`

`    - C/2 ||Omega_s - Omega_*(K,chi,n)||^2`

`    - D/2 ||partial_s Omega_s||^2`

`    - V_core(K) - V_med - V_int`

`    + Lambda (|X_s|^2-1)`

plus, only if retained,

`+ g_R O[X,K,Sigma]`

or a resolver-field action whose thin-interface limit produces the readout functional.

## 4. Best next calculations

### Test 1 — Exact generator-recursion equivalence

Take an old recursive coordinate superhelix and derive its frame generator `Omega_n(s)`.

Then ask whether there exists a local recursion operator `H_n` such that

`Omega_(n+1)=H_n[Omega_n]`

reconstructs the same curve exactly after integrating

`Q_s=Q Omega_n`,

`X_s=Q e1`.

If no local `H_n` exists, that is a real structural limitation.

### Test 2 — Closed constant-generator solutions

Take constant

`Omega_s = Omega0 in so(4)`.

Then

`Q(s)=Q(0) exp(s Omega0)`.

Carrier tangent is

`X_s=Q(s)e1`.

Integrate over one period and impose

`X(L)=X(0)`

and

`exp(L Omega0) in C`.

This is the simplest nontrivial laboratory for positional + holonomy closure.

Because any `Omega0 in so(4)` can be brought to two commuting planar rotations with rates `omega1, omega2`, framed closure requires rational relations among

`omega1 L / 2pi`

and

`omega2 L / 2pi`.

The hard part is simultaneous positional closure of the integrated tangent. That should be calculated exactly before adding topology or interactions.

### Test 3 — Self-dual/anti-self-dual mode spectrum

Write

`Omega = Omega_+ + Omega_-`.

Let the quadratic frame energy be

`C_+/2 ||Omega_+ - Omega_*+||^2 + C_-/2 ||Omega_- - Omega_*-||^2`.

Then linearize.

If the two sectors decouple, the 3+3 split is dynamically meaningful. If cross-terms are forced by core geometry or readout, the simple split is only algebraic.

### Test 4 — Readout of a closed frame solution

Take any closed `(X,Q)` solution and compute the finite-core readout integral from EXP002.

Ask whether the observable section changes discontinuously when the holonomy class changes while the underlying carrier family varies continuously.

If yes, that could provide a concrete route from continuous geometry to discrete readout sectors.

## 5. One especially sharp conjecture

A useful conjecture to try to kill is:

> Discrete H(s)H sectors are not imposed winding labels but connected components of the solution space satisfying simultaneous carrier closure, framed holonomy closure, finite-core admissibility, and readout regularity.

Mathematically:

`M_phys = { (X,Q,K) : EL=0, X(L)=X(0), U_gamma in C, K admissible, R_Sigma regular } / gauge`.

The claim is that `pi_0(M_phys)` may be nontrivial even though the underlying field variables are continuous.

That is precise enough to fail.

## 6. Immediate warning

Do not infer particle identities from these components unless the spectrum and observables are independently derived.

The next job is geometry first:

- classify closed solutions;
- compute their holonomies;
- derive the normal-mode spectrum;
- add finite-core admissibility;
- only then inspect readout sectors.

That sequence prevents the old habit of recognizing the answer before the equations have produced it.
