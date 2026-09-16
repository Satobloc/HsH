# Null-helix seed — REJECTED / superseded

**Date:** 2026-09-16 EDT  
**Status:** REJECTED AS H(s)H CONSTRUCTION  
**Reason:** Ravel imported a `(-,+,+,+)` Lorentz-signature metric into a framework Nathan explicitly requires to be formulated natively in `++++` geometry (or a possible `+++ , +++` construction). This was a category error, not a cosmetic notation issue.

The rejected version remains recoverable in Git history at commit `ca656c9546c5bd95b35a0d2d5c637963eeb32d91`. Do not use its `null tangent`, `timelike centerline`, or minus-sign norm cancellation as H(s)H premises.

## What survives from the failed pass

Only the geometric question survives:

> Is a time-directed helical **history** sliced differently from a simultaneous ring support, such that a large history/winding radius can coexist with a much smaller local filament thickness?

That question does not require Lorentz signature and should now be rebuilt in native H(s)H coordinates.

## Native rebuild starting point

Use four equal-sign length coordinates

\[
X=(w,x,y,z),
\qquad
\|dX\|^2=dw^2+dx^2+dy^2+dz^2.
\]

No coordinate is made timelike by a metric sign.

Let `u` be the distinguished timesheet/propagation direction supplied by the H(s)H construction, with `||u||=1`. For a curve tangent `T=dX/ds`, decompose

\[
T=T_{\parallel}+T_{\perp},
\]

where

\[
T_{\parallel}=(T\cdot u)u,
\qquad
T_{\perp}=T-(T\cdot u)u.
\]

Define the geometric departure angle from propagation by

\[
\cos\theta_4=\frac{T\cdot u}{\|T\|},
\qquad
\tan\theta_4=\frac{\|T_{\perp}\|}{|T\cdot u|}.
\]

In this language, the SAT/H(s)H `null` or vacuum-aligned condition is to be treated as an **orientation/interaction condition** (alignment with the propagation direction / no transverse encounter), not as a zero metric norm produced by sign cancellation.

A minimal Euclidean helix can then be written schematically as

\[
H(s)=
\bigl(w(s),\,a\cos\phi(s),\,a\sin\phi(s),\,z(s)\bigr),
\]

with

\[
\|H'(s)\|^2
=w'^2+a^2\phi'^2+z'^2>0
\]

for any nontrivial curve.

The correct next calculation is therefore to derive the relation among:

- history radius `a`;
- local tube thickness `epsilon`;
- propagation component `T_parallel`;
- transverse winding component `T_perp`;
- intersection angle `theta_4`;
- timesheet slice footprint;

using only `++++` geometry and the H(s)H propagation/readout rules.

## Explicit discard

Do **not** carry forward from the rejected pass:

- `eta(H',H')=0`;
- microscopic `null` vs coarse `timelike` classification;
- a Lorentz boost inserted as the primitive transformation;
- derivation of time dilation from `(-,+,+,+)` norm preservation;
- any claim that H(s)H requires or assumes Lorentzian metric signature at the foundational level.

Those may later appear as emergent/effective descriptions only if independently recovered from the native all-plus construction.
