# Meridian Sandbox — Run 065: nested equation-geometry positive / hostile control

**Status:** NEW CONSTRUCTIVE WORK / SANDBOX ONLY  
**Date:** 2026-09-20  
**Math status:** CLAIMED; analytic target plus numerical optimization checked in-run.  
**Purpose:** Put a real equation-geometry transformation inside a nested moving 4D representation and test whether frame-aware geometric search recovers the correct algebraic transform while a deliberately frame-blind search fails.

## 1. Controlled equation family

Use the already-tested constant-coefficient family

\[
y''+p y'+q y=0.
\]

Apply

\[
U=e^{cx}y.
\]

In \(U\)-coordinates the equation is

\[
U''+(p-2c)U'+(q-pc+c^2)U=0.
\]

The normal-form value is therefore

\[
\boxed{c_*=p/2},
\]

which removes the first derivative term.

The optimizer is not supplied with \(c_*\); it is asked to minimize a geometric residual.

## 2. Exact coefficient geometry

Represent the transformed differential operator by the coefficient vector

\[
\boxed{
h(c)=
(1,\ p-2c,\ q-pc+c^2,\ 0)^T
\in\mathbb R^4
}.
\]

The desired normal-form operator family is the 2-plane

\[
W=\operatorname{span}(e_1,e_3)
\]

using one-based coefficient labels \((U'',U',U,\text{padding})\); equivalently, in zero-based numerical coordinates this is the plane spanned by components 0 and 2.

The squared geometric distance to this plane is exactly

\[
\boxed{d(h(c),W)^2=(p-2c)^2}.
\]

Thus minimizing distance to the lower-dimensional normal-form subspace is mathematically identical to discovering the first-derivative-eliminating transform, but is posed as a geometric projection problem.

## 3. Wrap the equation geometry in a genuinely moving nested frame

Let

\[
Q(x)=R_1(x)R_2(x)\cdots R_8(x)\in SO(4)
\]

with eight noncommuting variable-angle plane rotations, and represent the operator as

\[
C(x,c)=Q(x)h(c).
\]

Transport the target subspace covariantly:

\[
W_x=Q(x)W.
\]

The frame-aware distance satisfies identically

\[
\boxed{d(C(x,c),W_x)^2=d(h(c),W)^2=(p-2c)^2}.
\]

Therefore the representation motion cannot change the correct optimum if the frame is retained.

## 4. Positive control

Choose

\[
p=1.7,\qquad q=2.4,
\]

so

\[
c_*=0.85.
\]

Numerical one-dimensional minimization gave:

- body-frame geometric search: \(c=0.8500000000000002\)
- nested frame-aware search: \(c=0.8500000000000005\)
- residuals effectively zero at floating-point precision.

This is a PASS.

The result is not surprising mathematically — covariance predicts it — but it is a useful end-to-end positive control that the nested representation machinery preserves the equation transformation exactly.

## 5. Hostile control: deliberately discard the frame

Now compare the moving represented vector \(C(x,c)\) against the **fixed untransported** plane \(W\), averaging over the same x-window.

This score is representation contaminated.

For the same source equation, the optimizer returned

\[
\boxed{c_{naive}\approx1.0036932783}
\]

instead of \(0.85\), with a large nonzero residual.

Thus the frame-blind solver reports a false “best transformation” created solely by representation rotation.

This is the exact failure the W3/Hagalaz frame channel was intended to prevent.

## 6. Multi-case check

Using the same eight-level moving frame, additional source equations gave:

| \(p\) | \(q\) | exact \(p/2\) | frame-aware/body recovery | frame-blind optimum |
|---:|---:|---:|---:|---:|
| 0.6 | 1.2 | 0.300 | 0.3000000000 | 0.4259167085 |
| 1.1 | -0.3 | 0.550 | 0.5500000000 | 0.4684052461 |
| 2.4 | 3.7 | 1.200 | 1.2000000000 | 1.3743748682 |
| -1.6 | 0.9 | -0.800 | -0.8000000000 | -0.7416659103 |
| 0.85 | 2.2 | 0.425 | 0.4250000000 | 0.5915759770 |

The frame-aware result is exact to numerical precision in every case; the frame-blind optimum moves unpredictably with the irrelevant outer representation.

## 7. What this benchmark establishes

At toy/controlled level, the current architecture can now perform the sequence

\[
\text{equation}
\to\text{coefficient geometry}
\to\text{nested moving 4D representation}
\to\text{covariant target subspace}
\to\text{geometric optimization}
\to\text{decoded algebraic transform}
\]

without the outer hyperhelical representation changing the answer.

The negative control proves that this is not automatic: discarding the frame genuinely produces a false derivational result.

This is stronger than a visualization check because the output parameter \(c\) is an actual algebraic transformation coefficient.

## 8. What it does NOT establish

- The target subspace \(W\) was chosen from a known normal-form goal; the solver did not autonomously invent the concept “remove the first derivative term.”
- The coefficient-vector encoding is exact for this linear operator family but is not yet a general nonlinear/PDE encoder.
- The outer frame is a representation stress test, not yet a physical H(s)H interaction.
- No GR↔QM relation follows from this benchmark.
- No claim is made that geometric projection will outperform specialized algebra on such a simple equation.

## 9. Next stronger test

Remove more hand guidance.

A useful next benchmark is to give the solver a small admissible transformation family and a complexity objective defined only by invariant operator geometry — for example rank, sparsity, symmetry, or distance to a family of canonical strata — and ask it to discover which term can be eliminated without being told in advance which coefficient should vanish.

That would test whether the Whirligig search is doing useful transformation discovery rather than merely executing a geometrized version of a specified algebraic instruction.