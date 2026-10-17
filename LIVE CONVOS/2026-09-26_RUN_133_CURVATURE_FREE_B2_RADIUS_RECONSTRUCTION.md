# Meridian Run 133 — curvature-free rank-two radius reconstruction

**Date:** 2026-09-26  
**Status:** SANDBOXED / bounded local-geometry translation  
**Dependencies:** frozen `WORKSPACES/WORLDTUBE_LAB/FINITE_CORE_TANGENCY_PACKET_002.md`; Meridian Run 132.  
**Quarantine:** no PRIOR_ART, nLab, or quarantined comparison source opened or used.

## Bounded operation

Run 132 eliminated the carrier radius from the generic rank-two support \(B^2_\varepsilon\) laws. Reverse the elimination in the useful direction: reconstruct the carrier radius \(\varepsilon\) and orientation factor \(\beta\) directly from the measured section area and contact span.

For \(0<\beta\le1\), Packet 002 gives

\[
\ell_\parallel=2\sqrt{\frac{2\beta\varepsilon}{K}},
\]

and

\[
A_\Sigma
=
4\sqrt{2\beta}\,C_4\,
\frac{\varepsilon^{3/2}}{\sqrt K}
+
o(\varepsilon^{3/2}),
\]

where

\[
K=|A_{\rm rel}|>0,
\qquad
C_4=\int_0^1\sqrt{1-u^4}\,du.
\]

Run 132 equivalently obtained

\[
A_\Sigma
=
\frac{C_4}{4\beta}K\ell_\parallel^3
+
o(K\ell_\parallel^3).
\]

## Radius reconstruction

The span relation gives

\[
\beta=\frac{K\ell_\parallel^2}{8\varepsilon}.
\]

Substitute this into the radius-eliminated area law:

\[
A_\Sigma
\sim
\frac{C_4}{4}
\frac{8\varepsilon}{K\ell_\parallel^2}
K\ell_\parallel^3.
\]

All dependence on \(K\) and \(\beta\) cancels:

\[
\boxed{
A_\Sigma\sim2C_4\,\varepsilon\,\ell_\parallel.
}
\]

Hence the generic rank-two carrier radius is reconstructed at leading order by

\[
\boxed{
\varepsilon
\sim
\frac{A_\Sigma}{2C_4\ell_\parallel}.
}
\]

This is curvature-free: once section area and longitudinal contact span are supplied, the leading \(B^2\) carrier radius does not require an independent relative-curvature estimate.

## Orientation reconstruction

After reconstructing \(\varepsilon\), the span relation gives

\[
\boxed{
\beta
\sim
\frac{C_4K\ell_\parallel^3}{4A_\Sigma}.
}
\]

Thus the same local tuple separates naturally:

- \((A_\Sigma,\ell_\parallel)\) reconstructs the carrier radius;
- \(K\) then reconstructs the support-orientation factor \(\beta\).

This factorization is useful for implementation because radius and orientation need not be solved simultaneously.

## Admissibility discriminator

The physical generic branch requires

\[
0<\beta\le1.
\]

Therefore

\[
\boxed{
A_\Sigma\ge\frac{C_4}{4}K\ell_\parallel^3,
}
\]

recovering Run 132's lower envelope, now interpreted as the condition that the reconstructed orientation factor not exceed its allowed range.

Equivalently, after radius reconstruction,

\[
\boxed{
K\ell_\parallel^2\le8\varepsilon.
}
\]

A tuple violating either equivalent inequality cannot be represented by the generic \(0<\beta\le1\) rank-two support model at this leading order.

## Boundary/support translation

For the boundary carrier \(S^2_\varepsilon\), Packet 002 instead gives

\[
\varepsilon_{S^2}
=
\frac{K\ell_\parallel^2}{8}.
\]

For generic rank-two support,

\[
\varepsilon_{B^2}
\sim
\frac{A_\Sigma}{2C_4\ell_\parallel}.
\]

Therefore, if an independent carrier-radius datum is available, the two hypotheses make different reconstruction demands except where their leading readouts coincide.

At the Run-132 degeneracy \(\beta=1/\pi\),

\[
A_\Sigma
=
\frac{\pi C_4}{4}K\ell_\parallel^3,
\]

so

\[
\varepsilon_{B^2}
=
\frac{\pi K\ell_\parallel^2}{8}
=
\pi\,\varepsilon_{S^2}.
\]

Thus the apparent \(S^2/B^2\) degeneracy in the triplet \((A_\Sigma,K,\ell_\parallel)\) does **not** extend to an independently observed carrier radius:

\[
\boxed{
\varepsilon_{B^2}=\pi\,\varepsilon_{S^2}
\quad\text{at the leading area/span degeneracy.}
}
\]

This supplies a concrete additional observable that breaks the Run-132 degeneracy.

## Publication-facing theorem candidate

**Rank-two reconstruction theorem.**  
Within the generic nondegenerate \(B^2_\varepsilon\) quadratic-contact branch, the leading carrier radius is reconstructed from section area and longitudinal span alone,

\[
\varepsilon\sim A_\Sigma/(2C_4\ell_\parallel),
\]

while relative curvature enters only in the subsequent orientation reconstruction

\[
\beta\sim C_4K\ell_\parallel^3/(4A_\Sigma).
\]

At the unique leading \(S^2/B^2\) area/span degeneracy \(\beta=1/\pi\), the two carrier hypotheses require radii differing by an exact factor \(\pi\). Therefore an independent radius datum breaks that degeneracy.

These are local geometric/readout statements in the frozen quadratic-contact model. They do not identify a physical carrier, establish experimental realization, supply dynamics, or establish equivalence to another formalism. The exceptional \(\beta=0\) branch remains excluded and separately typed.

## Control / provenance disposition

Freshly read before this operation: current workflow orientation v2; direct War Room declaration; active-edge/headline queue; ROT5 workflow chirp/state and Alberr/Kestrel receipt paths; Meridian checkpoint/current work; switchboard operationalization, README, and executable prototype; frozen Packet 002. The switchboard continues to type Meridian as reconstructible-solver geometry and locks sandboxed theory against workflow promotion. Current headline pressure remains visible SANDBOXED Paper-A posting/version verification, with ᚼ solver unification preserved as the return priority.

No quarantined source was opened.

## Durable next cursor

Use the factor-\(\pi\) radius split as the explicit "how to break the residual degeneracy" statement immediately after Run 132 in the finite-core discriminator section. Do not claim area/span/curvature alone distinguishes the models.
