# Meridian Sandbox — Run 064: nested-frame throughput benchmark

**Status:** NEW CONSTRUCTIVE WORK / SANDBOX ONLY  
**Date:** 2026-09-20  
**Math status:** CLAIMED; exact formulas plus numerical/symbolic benchmarks checked in-run.  
**Purpose:** Test whether the connection formulation actually reduces the practical burden of nested hyper/superhelical calculations, without overstating the numerical complexity advantage.

## 1. Benchmark carrier

Use a variable Run-062 core

\[
h(\lambda)=\rho
(\cos\chi\cos p,\cos\chi\sin p,
 \sin\chi\cos q,\sin\chi\sin q)
\]

with nonconstant \(\rho,\chi,p,q\), and wrap it in an outer frame

\[
C(\lambda)=Q(\lambda)h(\lambda),
\]

where

\[
Q=R_1R_2\cdots R_N\in SO(4)
\]

is a product of noncommuting variable-angle plane rotations.

The test used \(N=8\) with repeated mixing among the six coordinate 2-planes.

## 2. Direct Cartesian derivative route

If \(Q,Q',Q''\) are explicitly propagated, then

\[
C'=Q'h+Qh',
\]

\[
C''=Q''h+2Q'h'+Qh''.
\]

This is exact and numerically reasonable when the product is retained in factored matrix form. The problem appears when the full coordinate expressions are symbolically expanded or repeatedly simplified.

## 3. Connection route

Define

\[
A=Q^TQ',
\qquad
A'=\frac d{d\lambda}(Q^TQ').
\]

Then in the body frame

\[
\boxed{u=h'+Ah}
\]

and

\[
\boxed{w=h''+2Ah'+(A'+A^2)h}.
\]

Because \(Q\) is orthogonal,

\[
\|C'\|^2=\|u\|^2,
\qquad
\|C''\|^2=\|w\|^2,
\qquad
C'\cdot C''=u\cdot w.
\]

Therefore curvature and any score depending only on these inner products can be evaluated **without constructing the global frame \(Q\) or the final Cartesian curve \(C\)**.

The nested connection is updated level by level with

\[
A_k=R_k^TA_{k-1}R_k+B_k,
\qquad
B_k=R_k^TR_k',
\]

\[
A_k'=R_k^TA_{k-1}'R_k+
[R_k^TA_{k-1}R_k,B_k]+B_k'.
\]

The state dimension of \(A,A'\) remains fixed as nesting depth grows.

## 4. Eight-level noncommuting numerical witness

For the \(N=8\) variable outer-frame benchmark, direct Cartesian propagation and connection-body propagation gave:

- \(\|C'-Qu\|=4.30\times10^{-16}\)
- \(\|C''-Qw\|=9.42\times10^{-16}\)
- speed-squared disagreement \(1.33\times10^{-15}\)
- acceleration-squared disagreement \(3.55\times10^{-15}\)
- curvature-squared disagreement \(1.33\times10^{-15}\).

Representative common result:

\[
\kappa^2\approx2.06218879559413.
\]

So the compact connection route reproduces the fully propagated nested 4D kinematics to floating-point precision.

## 5. Symbolic expansion stress test

To measure the actual practical problem, products of independent 4D plane rotations were symbolically expanded and applied to a generic four-component vector.

For the **position only**, total symbolic operation count grew approximately:

| nested rotations \(N\) | expanded ops | additive terms |
|---:|---:|---:|
| 1 | 10 | 6 |
| 4 | 111 | 19 |
| 6 | 315 | 39 |
| 8 | 907 | 85 |
| 10 | 2403 | 183 |
| 12 | 5670 | 372 |
| 15 | 22421 | 1181 |

For the **second derivative** with independent constant angular rates, expansion grew faster:

| \(N\) | expanded \(C''\) ops | additive terms |
|---:|---:|---:|
| 1 | 23 | 6 |
| 2 | 134 | 17 |
| 3 | 439 | 41 |
| 4 | 1184 | 93 |
| 5 | 2124 | 158 |
| 6 | 5298 | 339 |
| 7 | 12390 | 697 |
| 8 | 25019 | 1268 |

This is the practical symbolic-expression explosion the compact state avoids.

## 6. Correct complexity claim

Do **not** claim that connection recursion makes generic numerical nested rotation sublinear in depth.

- factored direct matrix propagation is already \(O(N)\) in nesting depth;
- connection recursion is also \(O(N)\);
- both use small fixed-size matrices.

The genuine gain is instead:

1. no need to expand the final Cartesian trigonometric expressions;
2. fixed-size local state for derivative/invariant calculations;
3. curvature and similar scalar scores can be computed without ever constructing global \(Q\) or \(C\);
4. outer levels can be peeled/demodulated recursively;
5. frame/holonomy information remains explicit rather than becoming buried in coordinate algebra.

This is exactly the kind of efficiency relevant to a hyper/superhelical solver.

## 7. Relation to Whirligig search

For a candidate nested carrier, a search step can operate on

\[
(h,h',h'',A,A')
\]

or on the still more compact Run-062 local variables plus connection, score invariant quantities in the body frame, and postpone global Cartesian reconstruction until:

- visualization;
- an observable explicitly requires lab coordinates;
- a decoder requires the global frame;
- a cross-representation comparison is being tested.

Thus the solver can search over nested geometric structure without paying the symbolic cost of fully materializing every candidate curve.

## 8. Hagalaz consequence

If Hagalaz is used as a transport layer, its most useful role is not merely to store successive relative similarities. It can propagate the local Lie-algebra connection needed for:

- derivative transport;
- holonomy;
- frame-aware decoding;
- compact invariant scoring.

The Run-061 Sim(4) recursion supplies the affine version when scale/translation are required.

This remains a NEW constructive interpretation, not historical attribution.

## 9. Next calculation

The machinery is now efficient enough for a more meaningful test: encode one nontrivial but controlled equation-geometry transformation as an inner carrier, wrap it in a genuinely nested outer frame, hide the known algebraic relation from the geometric search, and test whether the compact invariant search recovers the same transformation with fewer symbolic degrees of freedom than direct algebraic manipulation.