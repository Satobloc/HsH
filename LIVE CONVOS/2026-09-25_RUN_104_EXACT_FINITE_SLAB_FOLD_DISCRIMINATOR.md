# Meridian Run 104 — exact finite-slab reduction and fold discriminator

**Date:** 2026-09-25  
**Status:** SANDBOX / exact within the frozen leading quadratic-contact model  
**Direct authority:** `WORKSPACES/WORLDTUBE_LAB/FINITE_CORE_TANGENCY_PACKET_002.md`  
**Quarantine:** no PRIOR_ART; no quarantined finite-thickness packet imported.

## Problem

Run 103 found, in the thin-slab limit, that contact span plus the bulk slab readout is locally identifiable except at a fold near \(h/\varepsilon=2/5\), but globally two-valued. Determine the finite-\(h/\varepsilon\) function directly from Packet 002 geometry.

Set
\[
K=|A_{\rm rel}|>0,\qquad q(s)=Ks^2/2,\qquad r=h/\varepsilon.
\]

At fixed \(s\), the carrier is the normal-fiber ball
\[
u_1^2+u_2^2+z^2\le \varepsilon^2,
\]
and the resolving slab imposes
\[
|z+q(s)|\le h.
\]

Hence the exact leading-model four-volume is
\[
M_4=\int_{\mathbb R}ds
\int_{\max(-\varepsilon,-q-h)}^{\min(\varepsilon,-q+h)}
\pi(\varepsilon^2-z^2)\,dz .
\]

## Exact dimensionless reduction

With
\[
x=z/\varepsilon,\qquad
u=s\sqrt{K/(2\varepsilon)},
\]
swap the order of integration. For each \(x\), the allowed \(u^2\) interval is
\[
\max(0,-r-x)\le u^2\le r-x.
\]

Therefore
\[
\boxed{
M_4=
2\pi\sqrt2\,
\frac{\varepsilon^{7/2}}{\sqrt K}\,J(r)
}
\]
where
\[
J(r)=
\int_{-1}^{\min(r,1)}
(1-x^2)
\left[
\sqrt{r-x}-\sqrt{\max(0,-r-x)}
\right]dx.
\]

This is the requested exact finite-slab function inside the frozen quadratic-contact model.

For \(0\le r\le1\),
\[
J(r)=\frac8{105}\Big[
\sqrt{1+r}(-2r^3+r^2+8r+5)
+\sqrt{1-r}(-2r^3-r^2+8r-5)
\Big].
\]

For \(r\ge1\),
\[
J(r)=\frac8{105}\Big[
\sqrt{r-1}(2r^3+r^2-8r+5)
+\sqrt{r+1}(-2r^3+r^2+8r+5)
\Big].
\]

The apparent large-\(r\) cancellation in the second form is geometric, so numerical implementations should prefer the integral or a stabilized equivalent at large \(r\).

## Thin-slab regression

Expansion at \(r=0\) gives
\[
J(r)=\frac85r+O(r^3).
\]

Thus
\[
M_4=
\frac{16\pi\sqrt2}{5}
h\varepsilon^{5/2}K^{-1/2}
+O(h^3\varepsilon^{1/2}K^{-1/2}),
\]
recovering Run 103 without fitting.

## Fixed-span inverse problem

Packet 002 contact span determines
\[
R=\varepsilon+h=\varepsilon(1+r).
\]

At fixed \(R\),
\[
M_4=
2\pi\sqrt2\,R^{7/2}K^{-1/2}
H(r),
\qquad
H(r)=\frac{J(r)}{(1+r)^{7/2}}.
\]

The inverse problem is therefore one-dimensional after span is measured.

A high-accuracy numerical evaluation of the exact expression gives the stationary point
\[
\boxed{r_* = h/\varepsilon \approx 0.3686624695}
\]
or
\[
\boxed{h/R\approx0.2693596688}.
\]

So the thin-slab fold \(h/\varepsilon=0.4\) survives in the exact leading model but moves downward by about \(7.8\%\) in \(h/\varepsilon\).

Numerical inspection of the exact branch shows \(H(r)\) rising from zero, attaining this maximum, and then falling. This strongly supports persistence of the two-valued inverse structure. **Uniqueness of the stationary point is not promoted here as an analytic theorem**; that is the remaining theorem-shaped check.

## Discriminator

For any solver implementing the finite slab directly:

1. nondimensionalized results at fixed \(r\) must collapse as
   \[
   M_4\sqrt K/\varepsilon^{7/2}=2\pi\sqrt2\,J(r);
   \]
2. the \(r\to0\) slope must recover \(J(r)/r\to8/5\);
3. at fixed measured span \(R\), conditioning must degrade near \(r_*\approx0.36866247\);
4. inverse recovery from span + \(M_4\) must not silently choose one branch when two roots exist;
5. exact finite-slab results should replace the \(2/5\) thin-slab fold when \(h/\varepsilon\) is not asymptotically small.

## What this does not say

This is an exact integration of the **leading local quadratic geometry**, not an exact statement about a full worldtube, a physical detector, a particle, or empirical physics. Higher contact order, varying fibers, normal-trivialization corrections, anisotropy, and finite ambient-curvature corrections remain outside this result.

## Next cursor

Differentiate the closed form for \(H(r)\) and establish or reject analytic uniqueness of its positive stationary point. If uniqueness holds, promote the numerical fold observation to a clean finite-slab identifiability theorem and add the dimensionless \(J(r)\) regression to the solver harness.
