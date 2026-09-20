# Run 077 — Literal Hagalaz composition from source definitions

**Status:** SANDBOX / CLAIMED VERIFIED algebraically for the recovered source convention  
**Date:** 2026-09-20  
**Control:** Nathan correction: do not replace explicit solver architecture with analogies. `Hagalaz ties Whirligig, UI/TX, and Three Spheres together` is treated as a literal architecture constraint; only the exact mechanism remains to reconstruct.

## 1. Source convention recovered

The September-11-era `rotoexpando_geometry_definition.tex` defines framed-sphere/UI states

\[
\mathcal S_i=(c_i,r_i,F_i),\qquad F_i\in SO(d),
\]

with relative data

\[
\sigma_{ij}=\frac{r_j}{r_i},\qquad
Q_{ij}=F_jF_i^{-1},\qquad
\Delta c_{ij}=c_j-c_i.
\]

It then defines Hagalaz by

\[
\mathsf H_{ij}:=(\sigma_{ij},Q_{ij})
\]

or, retaining translation,

\[
\mathsf H_{ij}:=(\Delta c_{ij},\sigma_{ij},Q_{ij}),
\]

with Euclidean similarity map

\[
T_{ij}(x)=c_j+\sigma_{ij}Q_{ij}(x-c_i).
\]

The same source states that Three Spheres is a special constrained configuration inside the more general UI state space.

A separate solver-canon source defines UI/TX as the broad relative-frame/metrology space, Whirligig/Donut as the constrained comparison/composition engine created to remove proto-UI freedom, and Spheres as a distinct constrained interaction/bifurcation solver under reconstruction. Nathan's later correction explicitly states that Hagalaz ties these solver components together.

## 2. Exact Hagalaz composition theorem

For three UI states \(\mathcal S_i,\mathcal S_j,\mathcal S_k\), define the Hagalaz maps by the source convention above. Then

\[
T_{jk}\circ T_{ij}=T_{ik}.
\]

Proof by substitution:

\[
\begin{aligned}
T_{jk}(T_{ij}(x))
&=c_k+\sigma_{jk}Q_{jk}(T_{ij}(x)-c_j)\\
&=c_k+\sigma_{jk}Q_{jk}\bigl(\sigma_{ij}Q_{ij}(x-c_i)\bigr)\\
&=c_k+(\sigma_{jk}\sigma_{ij})(Q_{jk}Q_{ij})(x-c_i).
\end{aligned}
\]

But

\[
\sigma_{jk}\sigma_{ij}
=\frac{r_k}{r_j}\frac{r_j}{r_i}
=\frac{r_k}{r_i}
=\sigma_{ik},
\]

and

\[
Q_{jk}Q_{ij}
=(F_kF_j^{-1})(F_jF_i^{-1})
=F_kF_i^{-1}
=Q_{ik}.
\]

Therefore

\[
\boxed{T_{jk}\circ T_{ij}=T_{ik}}.
\]

Ambient center differences also telescope:

\[
\Delta c_{ij}+\Delta c_{jk}=\Delta c_{ik}.
\]

Thus the recovered Hagalaz relations form a similarity-transformation groupoid over framed UI states. This is not an analogy or an added physical interpretation; it is a direct algebraic consequence of the recovered definitions.

## 3. Loop closure

For any exactly compatible cycle,

\[
T_{ki}\circ T_{jk}\circ T_{ij}=\mathrm{id}.
\]

Equivalently,

\[
\sigma_{ki}\sigma_{jk}\sigma_{ij}=1,
\qquad
Q_{ki}Q_{jk}Q_{ij}=I,
\]

with anchored center transport closing exactly.

A fresh random 4D numerical witness using independent centers, positive radii and random \(SO(4)\) frames gave:

- direct-vs-composed point-map error: \(6.71\times10^{-15}\);
- three-edge loop return error: \(1.66\times10^{-15}\);
- scale-composition error: \(0\) to machine precision;
- rotation-composition Frobenius error: \(6.31\times10^{-16}\);
- ambient center-difference telescoping error: \(5.09\times10^{-16}\).

These are floating-point witnesses of the exact symbolic identity, not empirical validation.

## 4. Literal solver consequences

### UI/TX
UI supplies the object space: framed states and their relative transformations. Hagalaz is the recovered relative-similarity operator on those states.

### Three Spheres
Three Spheres is explicitly a constrained configuration inside UI. Therefore its three pairwise state relations inherit Hagalaz maps directly. The three-edge closure identity is consequently an exact compatibility condition for an ideal consistent Three-Spheres UI configuration. Bifurcation/event behavior is extra structure of the Spheres solver, not an analogy for Hagalaz.

### Whirligig / Donut
Do not replace the stated integration with a resemblance claim. The solver canon says Whirligig is a constrained comparison/composition engine: two faithfully encoded structures are placed under hard transformation constraints to produce a forced output. The rotoexpando source additionally treats Whirligig as a lower-dimensional compression/projection of a broader two-phase/toroidal representation, but explicitly says its exact status must be established by explicit transformation rather than assumed.

Therefore the next mathematical task is not to ask whether Whirligig 'looks like' Hagalaz. It is to recover/build the explicit maps connecting Whirligig's encoded input states, contact/transport frames and output trace to the Hagalaz/UI state variables defined above.

## 5. What is *not* carried forward

Retire as unsupported unless independently sourced:

- the suggestion that the June symbolic Hagalaz/Hail-cycle discussion is a mathematical antecedent of the September operator;
- the suggestion that Whirligig merely 'reads out an edge mismatch';
- the suggestion that a shared Bishop-frame motif by itself explains Hagalaz integration;
- any family-resemblance argument offered in place of Nathan's explicit statement that Hagalaz ties the solvers together.

These may be investigated historically or mathematically if sources demand them, but they are not premises.

## 6. Next exact target

Construct the typed interface diagram from recovered definitions only:

1. UI object/state type \(\mathcal S=(c,r,F,\ldots)\).
2. Hagalaz relation/operator \(\mathsf H_{ij}\) and its exact composition/inverse laws.
3. Three-Spheres constraints as a restricted UI configuration plus its event/bifurcation state.
4. Whirligig input encoding and mechanical transformation as explicit maps into/out of the UI/Hagalaz state representation.
5. Identify what extra channels (phase/material director/chirality/etc.) are required for lossless integration; never silently absorb them into \(Q\).

Only after these exact maps are typed should blinded solver-stack benchmarks be run.
