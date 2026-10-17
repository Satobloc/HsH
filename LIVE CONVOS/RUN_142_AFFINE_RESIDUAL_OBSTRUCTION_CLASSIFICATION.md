# Meridian Run 142 — affine residual obstruction classification

**Status:** SANDBOXED / bounded formalization candidate  
**Date:** 2026-09-26  
**Dependencies:** Run 076 candidate ᚼ similarity convention; Runs 140–141.  
**Quarantine:** PRIOR_ART, nLab, and quarantined comparison sources not opened.

## Bounded question

Run 141 identified the origin-independent translational obstruction of a triangle residual
\[
R=(t,\sigma,Q),\qquad x\mapsto t+\sigma Qx
\]
as the quotient class
\[
[t]\in\mathbb R^4/\operatorname{im}(I-\sigma Q),
\]
equivalently the projection of \(t\) onto
\[
\ker(I-\sigma Q)^T.
\]

Classify exactly when that quotient can be nontrivial.

## Classification theorem candidate

Let
\[
L=\sigma Q,\qquad \sigma>0,\quad Q\in SO(4).
\]

A nonzero origin-independent translation obstruction exists iff \(1\) is an eigenvalue of \(L\). Since every eigenvalue \(\lambda_Q\) of an orthogonal matrix satisfies
\[
|\lambda_Q|=1,
\]
the equation
\[
\sigma\lambda_Q=1
\]
is possible only when
\[
\boxed{\sigma=1}
\]
and
\[
\boxed{\lambda_Q=1}.
\]

Therefore:

\[
\boxed{
\sigma\ne1
\Longrightarrow
I-\sigma Q\ \text{invertible}
\Longrightarrow
[t]=0\ \text{for every }t.
}
\]

So whenever the loop has any net scale mismatch, **all of its translation term is removable by a change of origin**. Translation supplies no additional affine conjugacy obstruction in that branch.

When \(\sigma=1\),
\[
L=Q
\]
and
\[
\ker(I-L^T)=\ker(I-Q^T)=\operatorname{Fix}(Q),
\]
because an orthogonal transformation and its transpose have the same fixed subspace.

Hence the complete origin-independent translation obstruction is

\[
\boxed{
t_{\rm obs}=\Pi_{\operatorname{Fix}(Q)}t
\qquad(\sigma=1).
}
\]

It is nonzero exactly when the residual translation has a component along a direction fixed by the residual rotation.

## Dimension statement

Let
\[
m=\dim\operatorname{Fix}(Q).
\]

Then, for \(\sigma=1\),
\[
\boxed{
\dim\left(
\mathbb R^4/\operatorname{im}(I-Q)
\right)=m.
}
\]

Thus the translational obstruction has exactly as many independent components as the residual rotation has fixed directions.

Special cases:

- \(m=0\): \(I-Q\) is invertible; every translation is origin-removable.
- \(m>0\): only the component of \(t\) in \(\operatorname{Fix}(Q)\) is intrinsic.
- \(Q=I\): \(m=4\); all translation is intrinsic, recovering Run 141's linear-closure branch.

## Constructive origin shift

When \(I-\sigma Q\) is invertible, choose
\[
\boxed{
g=-(I-\sigma Q)^{-1}t.
}
\]
Then the conjugated residual has zero translation:
\[
t+(I-\sigma Q)g=0.
\]

When \(I-Q\) is singular, the removable component is the projection onto
\[
\operatorname{im}(I-Q)=\operatorname{Fix}(Q)^\perp,
\]
while \(t_{\rm obs}\) remains.

## Benchmark hierarchy

The blinded triangle benchmark should therefore classify a residual in this order:

1. **scale:** is \(\sigma=1\)?
   - if no, translation is entirely origin-removable;
2. **rotation:** if \(\sigma=1\), determine \(\operatorname{Fix}(Q)\);
3. **intrinsic translation:** compute
   \[
   t_{\rm obs}=\Pi_{\operatorname{Fix}(Q)}t;
   \]
4. **exact closure:** require
   \[
   \sigma=1,\quad Q=I,\quad t=0.
   \]

This is stronger than a generic quotient-space warning: it says exactly which similarity residuals can carry independent translational information.

## Scope

Conditional on the Run-076 candidate representation of ᚼ edges as oriented similarities. This is an affine/similarity-geometry statement, not an assertion that the representation is the canonical September-11 ᚼ operator. It establishes no equivalence among UI/TX, Three Spheres, Whirligig and ᚼ, and asserts no physical dynamics or empirical realization.

## Control / provenance disposition

Freshly read this run:
- direct War Room declaration;
- live Meridian checkpoint/current-work surface;
- Tool-Library switchboard executable.

The War Room continues to require literal-source discipline, workspace/current-work state, tool awareness, and epistemic separation. The switchboard still types Meridian toward reconstructible solver geometry and prevents workflow state from promoting sandboxed theory.

Fresh GitHub code searches for literal ROT5 and headline-pressure labels returned zero matches/incomplete search results on the queried default branches. Those surfaces are not represented as freshly read, and no remembered copies were substituted.

No quarantined source was opened.

## Durable next cursor

Run 141's residual classification can now be simplified in implementation:

\[
\sigma\ne1\Rightarrow\text{ignore translation as an independent conjugacy obstruction};
\]

\[
\sigma=1\Rightarrow
t_{\rm obs}=\Pi_{\operatorname{Fix}(Q)}t.
\]

Use this exact branch structure when generating the blinded Run-140 triangle perturbation suite. Include at least one residual with \(\sigma\ne1\), one fixed-point-free \(Q\), one \(Q\) with a nontrivial fixed subspace, and the \(Q=I\) pure-translation limit.
