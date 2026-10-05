# Meridian Run 100 — Hagalaz Sim(4) closure gate

**Status:** SANDBOX / non-canonical  
**Date:** 2026-10-05  
**Role:** Meridian  
**Central question:** If SAT is right as a largely standard-physics 4D map, how should H(s)H work?

## Sources actually read

### Old SAT archive, substantial sequential reads

1. \`Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt\`, requested/read lines 1–280. This covered the old R4/S3 construction, recursive superhelix, Universal Indicatrix \(y=rRx_0\), \(\Omega=\dot R R^{-1}\), several historical Master-Lagrangian variants, and the old attempt to identify mass/quantization/particle sectors. Historical constants, particle assignments, zero-parameter claims, lattice primacy, and target-matching formulas were NOT imported as current assumptions.

2. \`Satobloc/SAT_THEORY_ARCHIVE_2023-25/HYPERFOAM THEORY/UNIVERSAL_INDICATRIX.txt\`, requested/read lines 280–620. This covered the older internal critique of manifold ambiguity, the distinction between a representational encoder and a law-generating geometry, and the attempt to constrain the UI by specifying manifold, metric, symmetry group, projection, and action.

### Current / September H(s)H reads

3. \`Satobloc/HsH/WORKSPACES/MERIDIAN/SANDBOX/RUN_091_HAGALAZ_SUPERHELIX_INTERLINGUA_V01.md\`, requested/read lines 1–360. This defines the current candidate framed-sphere state \(S_n=(c_n,r_n,F_n)\), the full 11-DOF relative similarity, the compact eight-slot rung-locked specialization, and the recursive update
\[
c_{n+1}=c_n+r_nF_nd,\qquad r_{n+1}=\mu r_n,\qquad F_{n+1}=F_nQ.
\]

4. \`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/RUN_141_GAUGE_SAFE_HAGALAZ_TRIANGLE_RESIDUAL.md\`, requested/read lines 1–320. This establishes the gauge-safe treatment of a general similarity residual \(R=(t,\sigma,Q)\), the conjugacy-safe linear residual, and the quotient obstruction for translation off the linear-closure locus.

## Source fact / inference / conjecture boundary

**Source fact:** old UI uses scale + SO(4) rotation as a 4D map; current Hagalaz candidate augments this with relative placement/translation and has both an 11-DOF general form and an eight-slot rung-locked specialization.

**Inference:** once translation is included, the correct algebraic envelope is the orientation-preserving similarity group
\[
\mathrm{Sim}^+(4)=\mathbb R^4\rtimes(\mathbb R^+\times SO(4)).
\]

**New sandbox result:** the compact 8-slot rung-locked state is not a subgroup / Lie subalgebra when all six SO(4) rotation channels are active. Its minimal algebraically closed envelope is the full 11-dimensional \(\mathrm{Sim}^+(4)\).

No external prior art was consulted before this construction.

## 1. Full similarity grammar

Write a finite Hagalaz edge as
\[
H=(t,L),\qquad L=\mu Q,\quad \mu>0,\quad Q\in SO(4),
\]
acting by
\[
x\mapsto Lx+t.
\]

Composition is
\[
(t_2,L_2)\circ(t_1,L_1)
=
(t_2+L_2t_1,\;L_2L_1),
\]
and
\[
(t,L)^{-1}=(-L^{-1}t,L^{-1}).
\]

The parameter count is
\[
4\ \text{translation}
+1\ \text{scale}
+6\ \text{rotation}
=11.
\]

## 2. Exact finite translation commutator

Let
\[
S=(0,L),\qquad T_d=(d,I).
\]

Then the exact group commutator is
\[
\boxed{
S\,T_d\,S^{-1}\,T_d^{-1}
=
T_{(L-I)d}.
}
\]

For the Hagalaz linear part \(L=\mu Q\),
\[
\boxed{
\Delta t_{\rm comm}=(\mu Q-I)d.
}
\]

Thus a closed loop in the scale/rotation sector can leave a pure translation residue because translation is a semidirect, not direct, factor.

This is a finite exact result, not a BCH approximation.

## 3. Rung-locked specialization and the closure problem

The compact 8-slot candidate takes
\[
d=\xi e_w
\]
with six arbitrary SO(4) rotation channels plus \(\log\mu\) and \(\xi\).

For a pure bend in the \(xw\) plane by angle \(\theta\),
\[
Qe_w
=
-\sin\theta\,e_x+\cos\theta\,e_w
\]
up to orientation convention. Therefore
\[
(\mu Q-I)d
=
\xi\left[
-\mu\sin\theta\,e_x
+
(\mu\cos\theta-1)e_w
\right].
\]

Its exact norm is
\[
\boxed{
\frac{\|\Delta t_{\rm comm}\|}{|\xi|}
=
\sqrt{\mu^2+1-2\mu\cos\theta}.
}
\]

At \(\mu=1\),
\[
\boxed{
\|\Delta t_{\rm comm}\|
=
2|\xi|\,|\sin(\theta/2)|.
}
\]

Any nonzero bending rotation therefore generates a transverse translation residue.

## 4. Infinitesimal closure theorem

Represent a similarity Lie-algebra element by
\[
X=
\begin{pmatrix}
aI+\Omega & v\\
0&0
\end{pmatrix},
\qquad
a\in\mathbb R,\quad
\Omega\in\mathfrak{so}(4),\quad
v\in\mathbb R^4.
\]

For
\[
X=(a,\Omega,v),\qquad
Y=(b,\Psi,w),
\]
the bracket is
\[
\boxed{
[X,Y]
=
\left(
0,\;
[\Omega,\Psi],\;
(aI+\Omega)w-(bI+\Psi)v
\right).
}
\]

Suppose the translation sector is constrained to one dimension,
\[
v,w\in\mathrm{span}\{e_w\}.
\]

Closure requires
\[
\Omega e_w\in\mathrm{span}\{e_w\}
\]
for every allowed \(\Omega\). But \(\Omega\) is skew, so
\[
e_w\cdot\Omega e_w=0.
\]
If \(\Omega e_w\) is also parallel to \(e_w\), it must vanish:
\[
\boxed{\Omega e_w=0.}
\]

Therefore a one-dimensional rung-translation subspace is closed only under rotations that stabilize \(e_w\), namely the normal-space \(\mathfrak{so}(3)\) twist sector.

The three bending generators
\[
J_{xw},\ J_{yw},\ J_{zw}
\]
violate this condition.

## 5. Minimal-closure theorem

Start with:
- all six generators of \(\mathfrak{so}(4)\);
- one dilation generator;
- one nonzero translation \(P_w\).

Then
\[
[J_{xw},P_w]\propto P_x,\qquad
[J_{yw},P_w]\propto P_y,\qquad
[J_{zw},P_w]\propto P_z.
\]

Hence Lie closure generates all four translations.

Therefore the minimal closed algebra containing the eight-slot ingredients is
\[
\boxed{
\mathfrak{sim}(4)
=
\mathbb R^4\rtimes
(\mathbb R\oplus\mathfrak{so}(4)),
}
\]
with dimension
\[
\boxed{4+1+6=11.}
\]

So the 8-slot candidate is not an 8-dimensional Lie subgroup when its bending channels are active.

## 6. Correct interpretation of the eight-slot core

This does NOT kill the rung-locked Hagalaz representation.

It changes its type.

The eight-slot object can consistently be one of:

1. a **body-frame step rule** in which \(e_w\) is redefined with the moving frame after every step;
2. a **section / constrained coordinate chart** inside the full \(\mathrm{Sim}^+(4)\) edge space;
3. a dynamical ansatz whose constraint must be re-imposed after composition.

It cannot be treated as a closed ambient-frame subgroup under unrestricted composition.

This distinction explains why repeated rung-locked recursion can work numerically while generic Hagalaz triangle composition needs the full translation vector.

## 7. Candidate ᚼ / ᚼᚼ grammar

A cleaner typing is:

\[
\boxed{
ᚼ_{\rm local}
=
(\xi,\alpha,\Omega)
}
\]
as a body-frame local generator, where \(\xi e_w\) is constrained local advance.

Integration produces a general finite edge
\[
\boxed{
H_{\rm finite}=(t,\mu,Q)\in\mathrm{Sim}^+(4),
}
\]
where \(t\) is generally a full four-vector even if every infinitesimal advance was rung-locked.

Then a natural second-order residue is
\[
\boxed{
ᚼᚼ
\supset
(\mu Q-I)d
}
\]
for the elementary scale/rotation-versus-advance commutator.

This is not asserted to be the unique meaning of ᚼᚼ. It is one exact, typed noncommutation channel that the candidate grammar necessarily contains.

## 8. Numerical fixture

A homogeneous-matrix test with
\[
\mu=1.13,\qquad
\theta=0.61,\qquad
d=e_w
\]
gave
\[
(\mu Q-I)d
=
(-0.64734023,\,0,\,0,\,-0.07379774)
\]
and the directly multiplied group commutator returned the same translation vector with residual
\[
1.11\times10^{-16}.
\]

## 9. Failure conditions

This construction fails as an H(s)H identification if:

1. translation/placement is not part of the intended Hagalaz finite edge at all;
2. the rung coordinate is meant only as an external bookkeeping parameter and never composes with \(Q,\mu\);
3. actual solver histories show that the re-locked body-frame rule does not reproduce full finite relative centers;
4. a different canonical group than \(\mathrm{Sim}^+(4)\) is independently derived from the worldtube action.

The algebra itself does not fail: given affine similarities, the semidirect-product result is exact.

## 10. Tight next solver test

Take an actual recursive superhelix sequence with states
\[
(c_n,r_n,F_n).
\]

At each step infer the body-frame rung scalar
\[
\xi_n
=
e_w^T F_n^T(c_{n+1}-c_n)/r_n
\]
and the off-rung leakage
\[
\boxed{
\ell_n
=
\left\|
(I-e_we_w^T)
F_n^T(c_{n+1}-c_n)/r_n
\right\|.
}
\]

The rung-locked model predicts
\[
\ell_n\approx0
\]
for each primitive step.

Then compose multiple steps without re-locking and compare the resulting full translation vector with the exact \(\mathrm{Sim}^+(4)\) product.

This separates two questions cleanly:

- **local constraint:** is each primitive step truly rung-locked?
- **global closure:** does accumulated geometry require the full 4-vector translation sector?

The expected generic answer is local rung-lock with global full-vector displacement.
