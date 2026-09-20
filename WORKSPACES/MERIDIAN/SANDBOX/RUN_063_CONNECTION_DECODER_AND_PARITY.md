# Meridian Sandbox — Run 063: connection decoder / adaptive rank / Graticule parity

**Status:** NEW CONSTRUCTIVE WORK / SANDBOX ONLY  
**Date:** 2026-09-20  
**Math status:** CLAIMED; algebraically and numerically checked in-run.  
**Purpose:** Replace the high-derivative constant-carrier decoder where a frame connection is already carried; distinguish true equal-rate information loss from avoidable numerical instability; extract an exact orientation/parity scalar relevant to the north/south Graticule pair.

## 1. Connection spectrum decodes twist rates directly on a fixed torus

For the Run-062 adapted frame, set \(\chi'=0\). The body connection \(A=F^TF'\) has characteristic polynomial

\[
\boxed{
\det(\lambda I-A)=
(\lambda^2+(p')^2)(\lambda^2+(q')^2)
}.
\]

Because \(A\) is real skew-symmetric, its singular values are

\[
\boxed{
\{|p'|,|p'|,|q'|,|q'|\}
}.
\]

Therefore a solver that already carries the moving frame/connection can recover the two unsigned local twist rates from one \(4\times4\) skew matrix, without constructing \(C''\) or \(C'''\).

This is computationally distinct from the Run-060 four-moment decoder, which inferred rates from norms through third derivative order.

## 2. Variable torus latitude: what the scalar invariants retain

For general \(\chi'\), the exact invariants are

\[
\boxed{
S=-\frac12\operatorname{tr}(A^2)
=(\chi')^2+(p')^2+(q')^2
}
\]

and

\[
\boxed{\det A=(p'q')^2}.
\]

Thus if \(\chi'\) is retained as an explicit scalar state channel, then

\[
U=(p')^2+(q')^2=S-(\chi')^2,
\]

and the squared twist magnitudes are roots of

\[
z^2-Uz+(p'q')^2=0.
\]

Without \(\chi'\) or equivalent director information, the conjugacy class of \(A\) does not contain enough scalar information to separate all three rates \(\chi',p',q'\).

This is a clean information-budget boundary rather than a numerical failure.

## 3. Pfaffian gives the signed relative-winding product

For the oriented adapted frame, the Pfaffian is

\[
\boxed{\operatorname{Pf}(A)=-p'q'}.
\]

This result is independent of \(\chi\) and \(\chi'\).

Consequently:

- \(\det A\) retains only \((p'q')^2\);
- \(\operatorname{Pf}(A)\) retains the sign of the relative winding product once a 4D orientation convention is fixed;
- proper \(SO(4)\) conjugations preserve the Pfaffian;
- an orientation-reversing frame transformation flips its sign.

A natural geometric orientation diagnostic is therefore

\[
\boxed{\epsilon_{pq}=\operatorname{sgn}(p'q')
=-\operatorname{sgn}\operatorname{Pf}(A)}.
\]

This is a geometric winding-parity/chirality diagnostic only; no physical chirality claim is inferred from it.

## 4. North/south Graticule charts display opposite winding parity exactly

Run 061 gave

\[
\frac{d\theta_N}{dq}<0,
\qquad
\frac{d\theta_S}{dq}>0.
\]

Therefore, for fixed positive scale factors,

\[
\operatorname{sgn}(p'\theta_N')
=-\operatorname{sgn}(p'q')
=\operatorname{sgn}\operatorname{Pf}(A),
\]

while

\[
\operatorname{sgn}(p'\theta_S')
=\operatorname{sgn}(p'q')
=-\operatorname{sgn}\operatorname{Pf}(A).
\]

Hence the two inverse stereographic charts display opposite 3D winding handedness for the same oriented 4D carrier.

This is an exact chart-parity effect. It is a strong candidate mathematical explanation for an ordinary/anti Graticule mirror relation, but it is **not** a dynamical chirality reversal.

## 5. Why the connection decoder is numerically better when the connection is native state

A controlled synthetic benchmark compared:

1. Run-060 moment decoding from \((m_0,m_1,m_2,m_3)\) with relative perturbations \(10^{-10}\);
2. twist-rate recovery from the singular values of an adapted skew connection \(A\) with comparably scaled skew perturbations \(10^{-10}\).

With baseline rates \(p'=1\), \(q'=1+\Delta\), representative median maximum rate errors were:

| \(\Delta\) | moment decoder | connection SVD |
|---:|---:|---:|
| 1e-1 | ~1.0e-8 | ~4e-11 |
| 1e-2 | ~7.8e-7 | ~4e-11 |
| 1e-3 | ~8.3e-5 | ~4e-11 |
| 1e-4 | ~1.5e-2 | ~4e-11 |

The moment inversion deteriorates rapidly because its full parameter Jacobian contains

\[
-AB(x-y)^4.
\]

The skew-matrix singular values, by contrast, are a well-conditioned native spectral readout and remain stable even as the two rates become equal.

**Critical caveat:** this advantage exists when \(A\) is a carried frame/connection state variable. If \(A\) must first be reconstructed from the same noisy point-curve data, the frame-estimation problem can reintroduce the lost conditioning. The result therefore supports carrying Hagalaz/frame information; it does not conjure extra information from a bare curve.

## 6. Equal rates: rate recovery is fine; amplitude separation is what truly disappears

For fixed \(\rho\) and \(\chi\), the speed is

\[
V^2=\|C'\|^2=a^2(p')^2+b^2(q')^2,
\qquad a^2+b^2=\rho^2.
\]

If \((p')^2\neq(q')^2\), a curve-only scalar reconstruction can infer

\[
\boxed{
a^2=\frac{V^2-\rho^2(q')^2}{(p')^2-(q')^2}},
\qquad
b^2=\rho^2-a^2.
\]

But at

\[
(p')^2=(q')^2=\Omega^2,
\]

we have simply

\[
V^2=\rho^2\Omega^2,
\]

independent of \(a,b\).

Thus:

- the common twist rate remains perfectly meaningful and can be read stably from the connection;
- the decomposition into two factor radii is genuinely absent from the bare trajectory;
- the correct equal-rate model is the lower-rank great-circle carrier from Run 062;
- if \(\chi\) is carried explicitly as state, the radius split is retained by that channel rather than inferred from the curve.

This sharply separates **numerical inversion failure** from **true information loss**.

## 7. Adaptive rank diagnostic

Define the dimensionless squared-rate gap

\[
\boxed{
\delta=\frac{|(p')^2-(q')^2|}{(p')^2+(q')^2}
}.
\]

Exact mathematics:

- \(\delta>0\): generic two-rate torus carrier;
- \(\delta=0\): curve collapses to the rank-one great-circle family unless an external frame/latitude channel is used to preserve the hidden decomposition.

Numerical implementation:

- compare \(\delta\) with an uncertainty-derived tolerance rather than a hard universal number;
- if the gap is unresolved, return a merged/common-rate carrier and do not report separately inferred \(a,b\);
- preserve the two-radius split only when it is directly carried by frame/\(\chi\) state or statistically resolvable.

This avoids unstable pseudo-precision near the true degeneracy set.

## 8. Finite-window interpretation of near-degeneracy

When \(p'=\omega\), \(q'=\nu\), the relative phase evolves at

\[
\Delta\omega=\omega-\nu.
\]

The beat/relative-phase scale is

\[
\boxed{L_{beat}=\frac{2\pi}{|\Delta\omega|}}.
\]

Over windows \(L\ll L_{beat}\), a near-degenerate two-rate trajectory remains close to a single great-circle presentation. Curve-only inference should therefore be expected to struggle even if exact infinite-precision local formulas remain formally invertible.

A carried connection bypasses this only because it stores the local frame-rate decomposition as state rather than trying to rediscover it from the almost-collapsed trace.

## 9. Practical carrier packet

For the current 4D solver, a more efficient native state candidate is now:

\[
\boxed{
(\rho,\chi,F,A)
}
\]

plus derivatives only as required by the chosen action/search step.

From this packet:

- \(\rho,\chi\) give the two 4D torus radii exactly;
- \(F\) preserves director/orientation information;
- \(A\) gives local twist/transport information;
- singular values/Pfaffian give fast invariant diagnostics;
- Cartesian \(C,C',C''\) can be generated when needed rather than treated as the primary stored representation.

This is a candidate compact Hagalaz/Whirligig carrier state, not a historical attribution.

## 10. Next calculations

- test a truly nested carrier in which an outer noncommuting \(SO(4)\) frame acts on the Run-062 \((\rho,\chi,p,q)\) core and verify exact recursive demodulation;
- compare operation count and numerical drift against direct Cartesian expansion as nesting depth increases;
- use \(\operatorname{Pf}(A)\), holonomy, and the conformal Graticule coordinates as candidate invariant constraints in a Whirligig transformation search;
- source-check the ordinary/anti Graticule historical definitions before identifying them with north/south inversion;
- preserve the equal-rate great-circle family as a positive lower-rank sector, not an error state.