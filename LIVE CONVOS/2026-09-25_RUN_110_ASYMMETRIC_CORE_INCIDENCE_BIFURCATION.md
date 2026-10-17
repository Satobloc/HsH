# Meridian Run 110 — asymmetric-core incidence bifurcation theorem

**Date:** 2026-09-25  
**Status:** SANDBOX / bounded local geometry  
**Authority:** direct War Room source + current HsH control/ROT5/switchboard surfaces read this run; frozen `FINITE_CORE_TANGENCY_PACKET_002.md`.  
**Quarantine:** no contents from `PRIOR_ART` were opened or used.

## Question

Runs 108–109 used a symmetric support radius. Packet 002 explicitly defines one-sided support radii
\[
\rho_+=\sup n\!\cdot y,\qquad
\rho_-=-\inf n\!\cdot y.
\]
Does the incidence bifurcation survive for an asymmetric finite core, and which radius controls it?

Choose signed-distance orientation and the sign of the local quadratic coefficient so that
\[
q(s)=\alpha s+\frac12Ks^2,\qquad K=|A_{\rm rel}|>0.
\]
The carrier can satisfy the thin-sheet intersection equation iff
\[
-\rho_+\le q(s)\le \rho_-.
\]

Set
\[
x=s\sqrt{K/\rho_+},\qquad
\Lambda_+=\frac{|\alpha|}{\sqrt{K\rho_+}},\qquad
\eta=\frac{\rho_-}{\rho_+}\ge0.
\]
Then the universal asymmetric problem is
\[
-1\le \Lambda_+x+\frac12x^2\le\eta.
\]

## Theorem 1 — topology threshold uses the curvature-facing one-sided support

The parabola minimum is \(-\Lambda_+^2/2\). Therefore the contact set is

- one connected interval for \(0\le\Lambda_+<\sqrt2\);
- pinched at \(\Lambda_+=\sqrt2\);
- two disjoint intervals for \(\Lambda_+>\sqrt2\).

Hence
\[
\boxed{|\alpha|_c=\sqrt{2K\rho_+}}.
\]

The opposite support radius \(\rho_-\) does **not** move the topology threshold. Reversing the signed-distance/quadratic orientation swaps which physical one-sided support is denoted \(\rho_+\), so this is relational rather than an orientation-dependent physical claim.

## Theorem 2 — exact total contact measure

In dimensionless form,
\[
m(\Lambda_+;\eta)=
\begin{cases}
2\sqrt{\Lambda_+^2+2\eta},
&0\le\Lambda_+\le\sqrt2,\\[4pt]
2\left[
\sqrt{\Lambda_+^2+2\eta}
-\sqrt{\Lambda_+^2-2}
\right],
&\Lambda_+\ge\sqrt2.
\end{cases}
\]

For \(\eta\ge0\), the first branch is strictly increasing away from the possible degenerate endpoint \(\eta=\Lambda_+=0\), and the second is strictly decreasing because
\[
\frac1{\sqrt{\Lambda_+^2+2\eta}}
<
\frac1{\sqrt{\Lambda_+^2-2}}.
\]

Thus the bifurcation remains the unique global maximum of total contact measure.

Restoring dimensions,
\[
\boxed{
|C_s|_{\max}
=
2\sqrt{\frac{2(\rho_++\rho_-)}{K}}
}.
\]

For the symmetric case \(\rho_+=\rho_-=\rho\), this reduces to Run 109:
\[
|C_s|_{\max}=4\sqrt{\rho/K}.
\]

## Theorem 3 — asymmetry separates threshold from maximum

The two scalar signatures encode different combinations:

\[
|\alpha|_c^2/(2K)=\rho_+,
\]
while
\[
K|C_s|_{\max}^2/8=\rho_++\rho_-.
\]

Therefore, if \(K\), the incidence threshold, and the maximum total contact measure are independently resolved in this local model, the one-sided support radii are uniquely reconstructed:
\[
\boxed{\rho_+=\frac{|\alpha|_c^2}{2K}},
\]
\[
\boxed{\rho_-=
\frac{K|C_s|_{\max}^2}{8}
-\frac{|\alpha|_c^2}{2K}}.
\]

This is a geometric identifiability result. It does not identify a physical carrier or assert that such a sweep is experimentally available.

## Large-incidence discriminator

For large \(\Lambda_+\),
\[
m(\Lambda_+;\eta)
=
\frac{2(1+\eta)}{\Lambda_+}+O(\Lambda_+^{-3}),
\]
so dimensionally
\[
|C_s|
\sim
\frac{2(\rho_++\rho_-)}{|\alpha|}.
\]

Thus the transverse total-support law reads the **sum** of the one-sided supports, whereas the topology threshold reads only the curvature-facing support. This gives a second independent asymmetry discriminator.

## Publication-facing translation

The symmetric \(\Lambda=\sqrt2\) result is not an artifact of assuming a centered ball. For any finite carrier characterized locally by one-sided support radii, the quadratic contact-set bifurcation persists. Its threshold selects the one-sided support encountered by the parabola vertex; its maximum total measure selects the sum of both supports. Taken together, those two geometric observables separate local support asymmetry within the declared model.

No constitutive dynamics, particle identity, empirical threshold, or equivalence to outside formalism is inferred.

## Workflow/control note

This run directly read:
- the source War Room declaration in `HSH_RESOURCES/HQ/THE_WAR_ROOM/DECLARATION.txt`;
- HsH War Room promotion/control and Project Desk contract;
- ROT5 state plus Alberr/Kestrel receipts;
- Nathan Tool Library directive/recon and switchboard operationalization;
- Meridian worklog;
- frozen Packet 002.

The direct War Room source explicitly identifies `PRIOR_ART` as a source class, but this operation did not open it; existing quarantine remains intact.

## Next cursor

Numerically sweep an explicitly asymmetric support function and test three independent regressions without fitting: topology threshold, maximum total measure, and large-incidence coefficient. Then determine whether a general convex support function reduces locally to the same two one-sided support numbers for this scalar contact-set observable.
