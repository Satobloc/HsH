# Meridian Run 126 — direct-readout endpoint reconstruction laws

**Date:** 2026-09-26  
**Status:** SANDBOXED / bounded translation result  
**Dependencies:** frozen `FINITE_CORE_TANGENCY_PACKET_002.md`; Meridian Runs 120–125.  
**Quarantine:** no `PRIOR_ART` or quarantined finite-thickness source opened or used.

## Bounded operation

Run 124 defined the observable normalization
\[
Y=\frac{8^{7/2}M_4}{K^3\ell_\parallel^7}=H(r),
\qquad
r=h/\varepsilon,
\]
and Packet 002 gives
\[
R=\varepsilon+h=\frac{K\ell_\parallel^2}{8}.
\]

Run 125 derived the two endpoint branches as \(Y\to0^+\):
\[
r_-(Y)=\frac{Y}{C_0}+O(Y^2),
\qquad
C_0=\frac{16\pi\sqrt2}{5},
\]
and
\[
\varepsilon_+/R\sim(Y/C_\infty)^{1/3},
\qquad
C_\infty=\frac{8\pi\sqrt2}{3}.
\]

Eliminate the internal normalization \(Y\) and total span \(R\) to obtain reconstruction laws directly in the local readouts \((M_4,K,\ell_\parallel)\).

## Theorem 1 — thin-slab branch

Because \(h_-/R=Y/C_0+O(Y^2)\),
\[
h_-
=
\frac{K\ell_\parallel^2}{8}
\frac{8^{7/2}M_4}{C_0K^3\ell_\parallel^7}
+O(RY^2).
\]

The constants collapse exactly:
\[
\frac{8^{5/2}}{C_0}
=
\frac{40}{\pi}.
\]

Therefore
\[
\boxed{
h_-
=
\frac{40}{\pi}
\frac{M_4}{K^2\ell_\parallel^5}
+O(RY^2).
}
\]

The complementary carrier scale is
\[
\boxed{
\varepsilon_-
=
\frac{K\ell_\parallel^2}{8}
-
\frac{40}{\pi}
\frac{M_4}{K^2\ell_\parallel^5}
+O(RY^2).
}
\]

So on the low-\(r\) branch, the leading slab thickness is linear in the four-volume readout.

## Theorem 2 — thin-carrier branch

From Run 125,
\[
\varepsilon_+
\sim
R\left(\frac{Y}{C_\infty}\right)^{1/3}.
\]

Substituting \(R\) and \(Y\),
\[
\varepsilon_+
\sim
\frac{K\ell_\parallel^2}{8}
\left[
\frac{8^{7/2}M_4}
{C_\infty K^3\ell_\parallel^7}
\right]^{1/3}.
\]

All dependence on \(K\) cancels. The coefficient reduces to
\[
\frac{8^{1/6}}{C_\infty^{1/3}}
=
\left(\frac{3}{4\pi}\right)^{1/3}.
\]

Hence
\[
\boxed{
\varepsilon_+
\sim
\left(
\frac{3M_4}{4\pi\ell_\parallel}
\right)^{1/3}.
}
\]

The complementary slab thickness is
\[
\boxed{
h_+
\sim
\frac{K\ell_\parallel^2}{8}
-
\left(
\frac{3M_4}{4\pi\ell_\parallel}
\right)^{1/3}.
}
\]

This cancellation is exact at leading asymptotic order: the small-carrier scale on the high-\(r\) branch can be estimated from \(M_4\) and contact span alone, without an independent \(K\) value.

## Dimensional discriminator

For the low branch,
\[
\left[\frac{M_4}{K^2\ell_\parallel^5}\right]
=
\frac{L^4}{L^{-2}L^5}=L.
\]

For the high branch,
\[
\left[\frac{M_4}{\ell_\parallel}\right]^{1/3}
=
(L^3)^{1/3}=L.
\]

Both direct-readout laws therefore have the required length dimension without hidden fitted scales.

## Branch-asymmetry consequence

The same small normalized four-volume has two observably different reconstruction laws:

\[
\boxed{
h_-\propto M_4
}
\]
on the thin-slab branch, but
\[
\boxed{
\varepsilon_+\propto M_4^{1/3}
}
\]
on the thin-carrier branch.

Thus the two-valued inverse is not only topologically two-branched; its endpoint branches carry different scaling exponents in directly measured quantities.

A numerical inverse implementation can use these formulas as endpoint regression fixtures. Failure to recover the linear versus cube-root asymptotics indicates an implementation or model mismatch.

## Publication-facing statement

Within the exact local finite-slab \(B^3\) quadratic-contact model, the two small-readout inverse branches admit simple direct reconstruction laws. The thin-slab branch has
\[
h\sim(40/\pi)M_4/(K^2\ell_\parallel^5),
\]
whereas the thin-carrier branch has
\[
\varepsilon\sim[3M_4/(4\pi\ell_\parallel)]^{1/3}.
\]
The latter loses all leading-order dependence on relative curvature \(K\). These are asymptotic geometric/readout statements, not physical identifications of a carrier or slab.

## Control / provenance disposition

Freshly read before this operation: `CURRENT_WORKFLOW_ORIENTATION_V2.md`; the direct War Room declaration in `HSH_RESOURCES/HQ/THE_WAR_ROOM/DECLARATION.txt`; its Common promotion; `ACTIVE_EDGE_SIGNAL_QUEUE.json`; the Meridian workspace directory/current checkpoint and math-provenance protocol; `WfCHRp_2026-09-24_ROT5.md`; `SWITCHBOARD_PROTOTYPE_OPERATIONALIZATION_2026-09-24.md`; `NATHAN_ON_TOOLS_LIBRARY_DIRECTIVE_2026-09-24.md`; the HSH_RESOURCES Tool Library directory and `workflow_switchboard_demo.py`; frozen Packet 002.

Fresh code-search queries for Kestrel/Alberr receipt labels returned incomplete zero-results, so no unread receipt content is imported. The ROT5 state itself was read from its actual Common path.

No quarantined source was opened.

## Next cursor

Use these direct-readout endpoint laws as regression fixtures in the consolidated finite-slab note. The consolidation now has a clean reader path: observable theorem (Run 124) → unique fold (123) → fold conditioning (122) → endpoint geometry (125) → direct asymptotic reconstruction (126).
