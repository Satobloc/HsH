# Meridian Run 141 — gauge-safe hierarchical triangle residual

**Status:** SANDBOXED / local formalization candidate  
**Date:** 2026-09-26  
**Dependencies:** Run 076 candidate Hagalaz similarity convention; Run 140 unique triangle completion.  
**Quarantine:** PRIOR_ART/nLab/quarantined comparison sources not opened.

## Bounded question

For the candidate ᚼ edge representation, a triangle residual is
\[
R_\triangle=\widehat H_{20}\circ H_{12}\circ H_{01}.
\]
Write
\[
R=(t,\sigma,Q),\qquad x\mapsto t+\sigma Qx,
\]
with \(\sigma>0\), \(Q\in SO(4)\).

Under a similarity-frame change \(G=(g,r,P)\), the same loop is represented by
\[
R'=GRG^{-1}.
\]

## Linear conjugacy invariant

The linear part is \(L=\sigma Q\). Under conjugation,
\[
L'=PLP^{-1}=\sigma PQP^T.
\]

Define
\[
\boxed{
D_{\rm lin}(R)=(\log\sigma)^2+\|Q-I\|_F^2.
}
\]

Orthogonal conjugation preserves the Frobenius norm, so
\[
\boxed{D_{\rm lin}(GRG^{-1})=D_{\rm lin}(R).}
\]

Moreover,
\[
\boxed{D_{\rm lin}=0\iff \sigma=1\text{ and }Q=I.}
\]

Thus \(D_{\rm lin}\) is an exact gauge-invariant discriminator for failure of the loop's linear part to close.

## Translation is not a raw scalar residual

The translation transforms as
\[
\boxed{t'=rPt+(I-L')g.}
\]

Therefore \(\|t\|\) is not generally invariant. A naive full residual such as
\[
\|t\|^2+(\log\sigma)^2+\|Q-I\|_F^2
\]
mixes coordinate-origin dependence into the score.

## Hierarchical exact-closure theorem candidate

On the locus \(D_{\rm lin}=0\), \(L'=I\), so
\[
t'=rPt.
\]
Hence
\[
\boxed{t'=0\iff t=0.}
\]

Therefore
\[
\boxed{
R=e
\iff
[D_{\rm lin}(R)=0]\ \text{and then}\ [t=0].
}
\]

The second test is gauge invariant as a zero/nonzero statement, although a nonzero translation magnitude rescales under arbitrary similarity gauge.

## Intrinsic affine obstruction off the linear-closure locus

For \(L\ne I\), changing origin modifies \(t\) by an element of \(\operatorname{im}(I-L)\). Thus the origin-independent translation information is the quotient class
\[
\boxed{[t]\in\mathbb R^4/\operatorname{im}(I-L).}
\]

Using the Euclidean structure, a canonical representative is
\[
\boxed{t_{\rm obs}:=\Pi_{\ker(I-L^T)}t.}
\]

Its vanishing is invariant under origin shifts:
\[
\boxed{
t_{\rm obs}=0\iff t\in\operatorname{im}(I-L).
}
\]

If \(I-L\) is invertible, every translation residual can be removed by changing origin; there is then no independent translational conjugacy obstruction.

## Benchmark consequence

For the blinded triangle benchmark, do not score the residual with a naive Euclidean tuple norm. Report instead:

1. \(D_{\rm lin}\);
2. when \(D_{\rm lin}>0\), whether \(t_{\rm obs}\) vanishes;
3. when \(D_{\rm lin}=0\), whether \(t\) vanishes.

This separates intrinsic linear failure from translation that is merely an origin artifact.

## Scope

Conditional on the Run-076 candidate representation of ᚼ edges as oriented similarities. This does not establish the canonical September-11 ᚼ operator, equivalence among UI/TX, Three Spheres, Whirligig and ᚼ, physical dynamics, or empirical realization.

## Control / provenance disposition

Freshly read: direct War Room declaration; live Meridian checkpoint through Run 076; Tool-Library switchboard executable. Current repository searches returned no literal ROT5 receipt or headline-pressure label on the queried default branches; no remembered substitute was used. Quarantine remained closed.

A repository write was attempted and blocked by the connector safety gate. Durable state is therefore this sandbox artifact; no repository commit is claimed.

## Next cursor

Use Run 140's withheld-third-edge prediction to generate \(R_\triangle\), then inject separately: scale mismatch, rotation mismatch, removable translation mismatch, and non-removable translation mismatch. The present result supplies the analytic classification before comparison to Three-Spheres or Whirligig readouts.
