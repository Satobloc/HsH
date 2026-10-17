# Meridian Run 105 — exact finite-slab fold uniqueness theorem

**Date:** 2026-09-25
**Status:** SANDBOX / theorem-shaped local-geometry result
**Authority:** `WORKSPACES/WORLDTUBE_LAB/FINITE_CORE_TANGENCY_PACKET_002.md` plus the direct finite-slab integration continued in Meridian Run 104.
**Scope:** isotropic \(B^3_\varepsilon\), nondegenerate quadratic contact, leading local quadratic model. No PRIOR_ART or quarantined finite-thickness machinery used.

## Result

Run 104 reduced the exact finite-slab four-volume to
\[
M_4=2\pi\sqrt2\,R^{7/2}K^{-1/2}H(r),
\qquad
r=h/\varepsilon,\quad R=\varepsilon+h,\quad K=|A_{\rm rel}|>0,
\]
where \(H(r)=J(r)/(1+r)^{7/2}\).

### Branch \(0<r<1\)

Set
\[
t=\sqrt{\frac{1-r}{1+r}},\qquad 0<t<1.
\]
Then
\[
H(t)= -\frac4{105}(t-1)
(3t^6+3t^5+10t^4+10t^3+10t^2+3t+3),
\]
and
\[
\frac{dH}{dt}
=
-\frac{4t}{15}(3t^5+5t^3-2).
\]

Let \(P(t)=3t^5+5t^3-2\). For \(t>0\),
\[
P'(t)=15t^4+15t^2>0.
\]
Since \(P(0)=-2\) and \(P(1)=6\), \(P\) has exactly one root in \((0,1)\). Because \(dr/dt<0\), \(H(r)\) has exactly one stationary point in \(0<r<1\).

Numerically,
\[
t_*=0.6791764561\ldots,
\]
hence
\[
\boxed{r_*=h/\varepsilon=0.3686624731\ldots}
\]
and
\[
\boxed{h/R=0.2693596707\ldots}.
\]
The sign changes from increasing \(H(r)\) below \(r_*\) to decreasing above it, so this is a strict maximum.

### Branch \(r>1\)

Set
\[
u=\sqrt{\frac{r-1}{r+1}},\qquad 0<u<1.
\]
Then
\[
H(u)=
-\frac4{105}(u-1)^3(3u^4+9u^3+11u^2+9u+3),
\]
and
\[
\frac{dH}{du}
=
-\frac{4u}{15}(u-1)^2(3u^3+6u^2+4u+2)<0.
\]
Since \(dr/du>0\), \(H(r)\) is strictly decreasing throughout \(r>1\). Continuity at \(r=1\) leaves no additional stationary point.

## Theorem-shaped conclusion

Within the frozen leading quadratic-contact model, at fixed measured contact span \(R=\varepsilon+h\), the exact finite-slab \(B^3\) four-volume has one and only one positive fold as a function of \(h/\varepsilon\). It occurs at the unique \(t\in(0,1)\) solving
\[
3t^5+5t^3-2=0.
\]

Consequently, generic compatible data below the maximum retain two inverse branches; at the fold the inverse map loses local rank; and global uniqueness requires branch information or a third independent observable.

This is a geometric inverse-problem statement, not a physical identification or equivalence claim.

## Solver discriminator

A conforming finite-slab inverse solver should recover the dimensionless fold without fitting, show exactly one derivative sign change for \(r>0\), report both inverse branches when present, and flag rank loss near \(r_*\).

## Headline-pressure relation

This is a native example of **CONSTRAIN → SURVIVORS → DISCRIMINATE**: span leaves a one-parameter survivor family; exact slab volume reduces it to two branches; the fold theorem locates the unique local rank loss. No equivalence to outside bootstrap/amplitude machinery is asserted.

## Next cursor

Put \(J(r)\), the exact fold polynomial, branch-aware inversion, and regression tests into the Meridian/Mercer solver harness. Independently check numerical implementation against direct ball/slab quadrature before treating any visualization as canonical.
