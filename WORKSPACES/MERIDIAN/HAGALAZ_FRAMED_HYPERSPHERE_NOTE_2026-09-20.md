# Hagalaz framed-hypersphere relation — bounded reconstruction note

**Worker:** Meridian Solver Loop  
**Date:** 2026-09-20  
**Status:** working formalization; not a physical claim; not a derivation of SAT/H(s)H dynamics

## Why this note exists

Nathan identified a convergence among UI, Hagalaz, Three Spheres, and superhelical scale relations: they can be represented as framed (hyper)spheres related by offset, rotation, and scale. This note isolates the minimal geometry without importing physical interpretation.

## 1. Base object

Represent a framed hypersphere by

\[
\mathcal S_i=(c_i,D_i,F_i;\mathcal P_i),
\]

where:

- \(c_i\) is the center in a common ambient coordinate space;
- \(D_i>0\) is diameter (or another explicitly declared positive scale variable);
- \(F_i\) is an attached orthonormal frame;
- \(\mathcal P_i\) denotes internal state/plumbing not reducible to frame orientation (phase, chirality, carrier/director state, etc., as separately defined).

The separation of \(F_i\) and \(\mathcal P_i\) is deliberate: relative frame rotation must not silently absorb independent internal variables.

## 2. Relative Hagalaz relation

Reserve the rune **ᚻ** for the Hagalaz relation pending notation-ledger confirmation; **ᚼ** already has an inductive-angle lineage and should not be overloaded without an explicit decision.

Define

\[
ᚻ_{ij}=(\Delta c_{ij},\sigma_{ij},Q_{ij}),
\]

with

\[
\Delta c_{ij}=c_j-c_i,\qquad
\sigma_{ij}=\frac{D_j}{D_i},\qquad
Q_{ij}=F_jF_i^{-1}.
\]

This is a **relative-state tuple**, not yet a dynamical operator. In particular, \(\Delta c_{ij}\) is center displacement in the common ambient frame. Do not confuse it with the translation parameter \(b\) of a generic similarity map \(x\mapsto \sigma Qx+b\).

If that affine-coordinate representation is needed, then

\[
b_{ij}=c_j-\sigma_{ij}Q_{ij}c_i,
\]

which is a different coordinate choice and has different composition bookkeeping.

## 3. Immediate mode embeddings

### UI mode

The center-pinned/coincident-center case is

\[
\Delta c_{ij}=0,
\]

leaving relative scale and frame rotation available. Thus UI can be represented as a constrained subspace of the Hagalaz relation space rather than as a separate geometric species.

### Hagalaz mode

Opening the displacement degree of freedom gives the full three-part relative tuple

\[
(\Delta c,\sigma,Q).
\]

A reduced historical form that omits displacement is naturally interpreted as a restricted Hagalaz mode, not evidence that displacement is intrinsically absent.

### Three Spheres mode

Three Spheres is represented by three framed nodes with pairwise relations, e.g.

\[
\mathcal S_1\xleftrightarrow{ᚻ_{12}}\mathcal S_2
\xleftrightarrow{ᚻ_{23}}\mathcal S_3.
\]

Any center-pinning to adjacent-scale spheres should be encoded as a constraint to test, not built into the base object.

### Adjacent superhelical orders

If \(D_n\) is chosen as the diameter of the order-\(n\) coil, then an adjacent-order relation can be encoded by

\[
\sigma_{n,n+1}=D_{n+1}/D_n,
\]

plus center displacement and relative frame rotation. This establishes a representation map from adjacent superhelical geometry into the same relation coordinates. It does **not** by itself establish that the superhelix dynamics are equivalent to Hagalaz dynamics.

## 4. Closure / consistency checks

For a closed three-node cycle in a common ambient frame, the displacement and scale coordinates obey

\[
\Delta c_{12}+\Delta c_{23}+\Delta c_{31}=0,
\]

\[
\sigma_{12}\sigma_{23}\sigma_{31}=1.
\]

For frames, with \(Q_{ij}=F_jF_i^{-1}\), composition gives

\[
Q_{31}Q_{23}Q_{12}=I
\]

when maps are composed in the stated order. These are representation-consistency identities, useful as solver tests.

## 5. What is established here vs. open

**Established by definition / elementary geometry in this note:**

1. the tuple can encode center displacement, scale ratio, and relative frame orientation;
2. coincident-center UI is a constraint slice \(\Delta c=0\);
3. three-node closure identities follow from the chosen relative coordinates;
4. adjacent coil diameters can be represented by the scale-ratio coordinate.

**Open and requiring source excavation or explicit modeling:**

1. which historical Hagalaz versions omitted which degree of freedom and when;
2. the exact map from UI's internal variables into \(\mathcal P\);
3. whether Three Spheres center-pinning is essential, provisional, or erroneous in each historical version;
4. whether Gendarme and Whirlygig act as alternate encodings/readouts/transport structures on this state space;
5. what dynamical law, if any, acts on \(ᚻ\) and \(\mathcal P\);
6. invariants under global translation, global frame rotation, and common rescaling;
7. whether \(D\) should be diameter, radius, curvature scale, or a typed scale field in the generalized implementation.

## 6. Next bounded solver cursor

Construct a minimal computational representation test with 2- and 3-sphere cases that verifies:

- invariance of \(ᚻ_{ij}\) under global translation;
- conjugation behavior of \(Q_{ij}\) under global frame rotation (or strict invariance if frames are stored in a co-rotating convention);
- invariance of \(\sigma_{ij}\) under common rescaling;
- the three closure identities above;
- explicit distinction between center-displacement coordinates and affine-similarity translation coordinates.

Only after those tests should the representation be connected to H(s)H dynamics or physical interpretation.
