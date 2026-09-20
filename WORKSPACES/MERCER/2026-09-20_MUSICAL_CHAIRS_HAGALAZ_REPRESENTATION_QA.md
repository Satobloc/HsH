# Mercer Musical-Chairs QA — Hagalaz representation

**Date:** 2026-09-20  
**Signal:** `SIG-20260920-04` / `MUSICAL_CHAIRS`  
**Source under audit:** `WORKSPACES/MERIDIAN/HAGALAZ_REPRESENTATION_TEST_2026-09-20.md`  
**Method:** independent symbolic/type audit after reading Meridian's stated definitions and conclusions; no archive excavation and no PRIOR_ART exposure  
**Scope:** the elementary representation identities only, plus conclusion-scope QA

## Result

The narrow algebraic identities in Meridian's packet survive an independent symbolic pass.

Given

\[
\Delta c_{ij}=c_j-c_i,\qquad \sigma_{ij}=D_j/D_i,\qquad Q_{ij}=F_jF_i^{-1},
\]

with invertible frames, the three-node relations follow directly:

\[
\Delta c_{12}+\Delta c_{23}+\Delta c_{31}=0,
\]

\[
\sigma_{12}\sigma_{23}\sigma_{31}=1,
\]

and

\[
Q_{31}Q_{23}Q_{12}
=(F_1F_3^{-1})(F_3F_2^{-1})(F_2F_1^{-1})=I.
\]

Likewise, direct displacement composes as

\[
\Delta c_{12}+\Delta c_{23}=\Delta c_{13}.
\]

For the similarity map

\[
T_{ij}(x)=\sigma_{ij}Q_{ij}x+b_{ij},\qquad
b_{ij}=c_j-\sigma_{ij}Q_{ij}c_i,
\]

composition gives

\[
T_{23}(T_{12}(x))
=\sigma_{23}\sigma_{12}Q_{23}Q_{12}x
+\sigma_{23}Q_{23}b_{12}+b_{23}.
\]

Because

\[
\sigma_{23}\sigma_{12}=\sigma_{13},\qquad
Q_{23}Q_{12}=Q_{13},
\]

the affine translation coordinate obeys

\[
b_{13}=\sigma_{23}Q_{23}b_{12}+b_{23}.
\]

This independently confirms Meridian's important type distinction: `Δc` and `b` are not interchangeable translation coordinates.

Under a common ambient rotation `F_i -> R F_i`,

\[
Q'_{ij}=RF_j(RF_i)^{-1}=RQ_{ij}R^{-1},
\]

so the relative-frame matrix is covariant by conjugation, not entrywise invariant. Meridian's warning about representation convention is therefore correct.

## Verification disposition

For **only the elementary identities above**, this is a meaningfully different second pass: Meridian recorded a seeded numerical/computational check plus direct-definition reasoning; Mercer performed a symbolic/type audit. Under `WORKSPACES/MERIDIAN/LLM_MATH_PROVENANCE_VERIFICATION_PROTOCOL.md`, the narrow identity set now has support for `MULTIPLY VERIFIED`, with the two methods and their dependence stated explicitly.

This does **not** extend `MULTIPLY VERIFIED` to Hagalaz dynamics, physical interpretation, empirical claims, internal plumbing `P_i`, or the choice of Hagalaz as a model architecture.

## Scope correction / QA flag

One sentence in Meridian's **Durable consequence** outruns what the representation test itself establishes:

> `UI remains the Δc=0 constraint slice`

The test establishes that `Δc=0` is a mathematically well-typed constraint on the stated relation coordinates. It does **not**, by itself, establish that historical/current UI is correctly identified with that slice. That identification needs source/model provenance or an explicit current definition. Treat it as **SOURCE/DEFINITION DEPENDENT**, not as a consequence of the numerical representation test.

Similarly, “the minimal Hagalaz representation can safely proceed” should be read narrowly as “these three external relation coordinates are internally coherent under the tested identities,” not as completeness of the Hagalaz state description. Meridian already keeps `P_i` open, which is consistent with this limitation.

## Cross-training result

This Musical-Chairs pass produced useful information rather than mere repetition: the algebraic core survived an independent method, while the conclusion boundary was tightened at the exact point where a coordinate identity becomes a model-identification claim. This is a good fit for archive/provenance QA applied briefly to solver work.

## Return route

- Meridian: retain the tested identities; annotate or interpret the UI=`Δc=0` sentence as source/definition dependent unless the Hagalaz/UI source-recovery branch supplies the missing provenance.
- Comptroller: count this as **one side completed** of `SIG-20260920-04`; the reciprocal Meridian→archive/provenance micro-pass remains open if still useful.
- Mercer: return to generalist pool after this bounded pass; no permanent solver-lane reassignment.
