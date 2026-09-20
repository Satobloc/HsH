# Meridian Sandbox — Run 062: compact 4D carrier / connection kernel

**Status:** NEW CONSTRUCTIVE WORK / SANDBOX ONLY  
**Date:** 2026-09-20  
**Math status:** CLAIMED; algebraically and numerically checked in-run.  
**Purpose:** Turn the Run-061 4D/3D bridge into an efficient local calculus for variable-scale, variable-torus, nested hyper/superhelical carriers; explain the Run-060 decoder singularity geometrically rather than treating it as a numerical defect.

## 1. Canonical 4D toroidal coordinates

Write the 4D carrier as

\[
C(\lambda)=\rho(\lambda)
\begin{pmatrix}
\cos\chi\cos p\\
\cos\chi\sin p\\
\sin\chi\cos q\\
\sin\chi\sin q
\end{pmatrix}.
\]

Equivalently,

\[
a=\rho\cos\chi,\qquad b=\rho\sin\chi.
\]

For fixed \(\rho\) this is an \(S^3\) coordinate system; fixed \(\chi\) gives the 2-torus carrier used in Run 061.

The Euclidean \(\mathbb R^4\) metric becomes exactly

\[
\boxed{
 ds^2=d\rho^2+
 \rho^2\left[d\chi^2+\cos^2\chi\,dp^2+\sin^2\chi\,dq^2\right]
}.
\]

Thus \(\rho,\chi,p,q\) are mutually orthogonal coordinates.

For a fixed-\(\chi\) torus, stereographic projection gives

\[
R=\rho\sec\chi,\qquad r=\rho\tan\chi,
\]

so

\[
\boxed{\sin\chi=\frac rR},
\qquad
\boxed{\rho=\sqrt{R^2-r^2}}.
\]

The exact reverse dimensional map is

\[
\boxed{
\rho=\sqrt{R^2-r^2},\quad
 a=\frac{R^2-r^2}{R},\quad
 b=\frac{r\sqrt{R^2-r^2}}{R}
}.
\]

Therefore every ordinary ring torus \(R>r\), with its absolute scale retained, has a corresponding fixed-\(\chi\) 4D product-torus carrier under this stereographic construction.

## 2. Adapted orthonormal frame

Define

\[
r_1=(\cos p,\sin p,0,0),
\qquad
r_2=(0,0,\cos q,\sin q),
\]

\[
t_1=(-\sin p,\cos p,0,0),
\qquad
t_2=(0,0,-\sin q,\cos q).
\]

Then use the orthonormal frame

\[
E_0=\cos\chi\,r_1+\sin\chi\,r_2,
\]

\[
N=-\sin\chi\,r_1+\cos\chi\,r_2,
\]

with \(t_1,t_2\). The physical point is simply

\[
C=\rho E_0.
\]

This basis isolates four distinct local effects:

- radial scale change \(\rho'\);
- torus-latitude/radius redistribution \(\chi'\);
- first phase/twist \(p'\);
- second phase/twist \(q'\).

## 3. Compact first derivative — no 4D coordinate expansion required

In the adapted frame \((E_0,N,t_1,t_2)\),

\[
\boxed{
C'=
\rho' E_0+
\rho\chi' N+
\rho\cos\chi\,p' t_1+
\rho\sin\chi\,q' t_2
}.
\]

Therefore

\[
\boxed{
\|C'\|^2=
(\rho')^2+
\rho^2\left[
(\chi')^2+\cos^2\chi\,(p')^2+\sin^2\chi\,(q')^2
\right]
}.
\]

This is exactly the metric result above expressed as a local velocity calculation.

## 4. Compact second derivative

Let \(c=\cos\chi\), \(s=\sin\chi\). Write

\[
C''=w_0E_0+w_\chi N+w_p t_1+w_qt_2.
\]

Direct differentiation and collection in the moving orthonormal frame gives

\[
\boxed{
w_0=\rho''-\rho\left[(\chi')^2+c^2(p')^2+s^2(q')^2\right]
}
\]

\[
\boxed{
w_\chi=
\rho\chi''+2\rho'\chi'+
\rho sc\left[(p')^2-(q')^2\right]
}
\]

\[
\boxed{
w_p=
\rho\left[c\,p''-2s\chi'p'\right]+2\rho'c\,p'
}
\]

\[
\boxed{
w_q=
\rho\left[s\,q''+2c\chi'q'\right]+2\rho's\,q'
}.
\]

Hence

\[
\boxed{\|C''\|^2=w_0^2+w_\chi^2+w_p^2+w_q^2}.
\]

A direct symbolic-coordinate differentiation test with variable \(\rho,\chi,p,q\) agreed with the compact frame formula to \(4.0\times10^{-16}\).

This is a concrete efficiency gain: curvature/bending calculations can be performed from the local scalar state and its first two derivatives without expanding nested trigonometric 4D coordinates.

## 5. Intrinsic curvature in local variables

Define the first-derivative component vector

\[
u=(\rho',\rho\chi',\rho c p',\rho s q')
\]

and the second-derivative component vector

\[
w=(w_0,w_\chi,w_p,w_q).
\]

Because the adapted basis is orthonormal at each point,

\[
\|C'\|^2=u\cdot u,
\qquad
\|C''\|^2=w\cdot w,
\qquad
C'\cdot C''=u\cdot w.
\]

Therefore the ordinary geometric curvature is

\[
\boxed{
\kappa^2=
\frac{(u\cdot u)(w\cdot w)-(u\cdot w)^2}
{(u\cdot u)^3}
}.
\]

This gives a parameterization-correct curvature calculation directly from the compact carrier state.

## 6. Local frame connection

Let

\[
F=(E_0,N,t_1,t_2)\in SO(4).
\]

Its body connection \(A=F^TF'\) is

\[
\boxed{
A=
\begin{pmatrix}
0&-\chi'&-c p'&-s q'\\
\chi'&0&s p'&-c q'\\
c p'&-s p'&0&0\\
s q'&c q'&0&0
\end{pmatrix}
}.
\]

Thus the entire local toroidal kinematics enters one \(\mathfrak{so}(4)\) element.

Its conjugacy invariants are

\[
\boxed{-\frac12\operatorname{tr}(A^2)=
(\chi')^2+(p')^2+(q')^2}
\]

and

\[
\boxed{\det A=(p'q')^2}.
\]

When \(\chi'=0\), the two principal rotation rates are exactly \(|p'|\) and \(|q'|\). When \(\chi'\neq0\), the conjugacy class contains only two independent scalar rotation invariants and cannot by itself recover all three labeled rates \(\chi',p',q'\).

This is an information-budget result: scalar frame invariants are sufficient for some classification tasks but not for full labeled decoding. Full decoding must retain either the adapted director labels or extra channels such as \(\chi\) and its derivative.

## 7. Conformal Graticule rectangle

For fixed \(\rho,\chi\), the Run-061 north-chart metric is

\[
ds_3^2=\Omega^2\left(a^2dp^2+b^2dq^2\right).
\]

Define

\[
\eta=\frac ba q=\tan\chi\,q.
\]

Then

\[
\boxed{
ds_3^2=(\Omega a)^2\left(dp^2+d\eta^2\right)}.
\]

Thus \((p,\eta)\) is an exact conformally flat rectangular coordinate grid for the 3D Donut.

A uniform winding

\[
p=m\tau,\qquad q=n\tau
\]

is a straight line on this rectangle with slope

\[
\boxed{
\frac{d\eta}{dp}=\frac{bn}{am}=\tan\beta
}.
\]

This gives a precise mathematical interpretation of the Graticule tangent angle: it is literally the Euclidean direction angle of the straight lifted winding in the conformal rectangle.

Because rational and irrational winding ratios are both dense in the real line, a binary closed/non-closing coloring as angle varies will switch at arbitrarily fine resolution. This supplies a clean mathematical basis for the old rational/irrational “flicker” intuition. It does **not** create a dynamical chirality reversal.

## 8. The Run-060 equal-frequency singularity is genuine geometry

For constant radii and phases,

\[
C(\lambda)=
(a\cos(\omega\lambda+\phi),a\sin(\omega\lambda+\phi),
 b\cos(\nu\lambda+\psi),b\sin(\nu\lambda+\psi)).
\]

If

\[
|\omega|=|\nu|=\Omega,
\]

then the curve can always be written

\[
\boxed{C(\lambda)=U\cos(\Omega\lambda)+V\sin(\Omega\lambda)}
\]

for fixed orthogonal vectors \(U,V\) with

\[
\|U\|=\|V\|=\rho.
\]

Therefore the apparent two-plane carrier has collapsed to a single great circle of the radius-\(\rho\) S³.

Consequences:

- the separate amplitudes \(a,b\) are not identifiable from the curve alone;
- the four-moment decoder singularity at \(\omega^2=\nu^2\) reflects genuine geometric rank collapse, not merely a bad formula;
- near equality, the decomposition is necessarily ill-conditioned because the curve approaches a single-frequency great circle;
- the correct repair is an adaptive lower-rank carrier description near the collision set, not forced two-frequency separation.

This explains the exact Jacobian factor from Run 061,

\[
\det J=-AB(\omega^2-\nu^2)^4.
\]

## 9. Equal-frequency 3D image is an exact oblique circle

Take the canonical phase-zero branch \(p=q=\tau\). In 4D this is a great circle.

Under north stereographic projection it lies in the 3D plane

\[
\boxed{Z=\frac ba X}.
\]

Choose orthonormal plane coordinates \((u,v)\) with \(v=Y\) and \(u\) along the \((X,Z)\) plane direction. Then the projected curve obeys

\[
\boxed{u^2+(v-r)^2=R^2}.
\]

The opposite-winding branch \(p=-q=\tau\) obeys

\[
\boxed{u^2+(v+r)^2=R^2}.
\]

So the two equal-magnitude winding branches become two exact oblique circles of radius \(R\), with centers displaced by \(\pm r\) in the cutting plane. In standard torus language these are the familiar oblique circle sections of a ring torus.

For the symmetric 4D carrier \(a=b\), the conformal winding angle is \(\beta=45^\circ\).

Again, the apparently special 3D circle is the projected image of the exact 4D great-circle rank collapse.

## 10. Moving-frame demodulation of nested carriers

If an outer moving frame is known,

\[
C=Q(\lambda)h(\lambda),
\qquad Q\in SO(4),
\]

define the lab angular connection

\[
\Omega=Q'Q^T.
\]

Then the transport-subtracting derivative

\[
\mathcal D_Q=\frac d{d\lambda}-\Omega
\]

obeys

\[
\boxed{\mathcal D_Q(Qv)=Qv'}.
\]

Therefore

\[
\boxed{\mathcal D_Q^k C=Qh^{(k)}}
\]

for every derivative order for which the state is smooth.

This means a declared outer frame can be peeled off exactly before applying an inner-carrier decoder. The operation is not invariant under arbitrary reassignment of motion between \(Q\) and \(h\); the transport split is part of the carrier semantics. But once that split is declared, nested hyperhelical levels can be demodulated recursively without expanding the full final coordinate expression.

For a similarity layer

\[
C=c+Lh,\qquad L=\sigma Q,
\]

the corresponding connection

\[
\Gamma=L'L^{-1}
\]

gives

\[
\left(\frac d{d\lambda}-\Gamma\right)(C-c)=Lh'
\]

after subtracting the translation derivative appropriately, or exactly in homogeneous-coordinate form. This matches the Sim(4) recursion developed in Run 061.

## 11. Holonomy / closure distinction

For a moving frame \(Q\), the body connection

\[
A=Q^TQ'
\]

satisfies

\[
Q'=QA.
\]

Hence

\[
Q(\lambda_1)=Q(\lambda_0)\,
\mathcal P\exp\left(\int_{\lambda_0}^{\lambda_1}A\,d\lambda\right).
\]

Two closure notions must be kept separate:

1. **position closure:** \(C(L)=C(0)\);
2. **full framed closure:** \(Q(L)=Q(0)\).

For a representation \(C=Qx_0\), position closure only requires the holonomy to lie in the stabilizer of \(x_0\); full framed closure requires identity holonomy.

This is important for information conservation: a closed point-curve can hide residual frame twist. If frame/director information is meant to survive, positional closure alone is insufficient.

For commuting constant double rotation

\[
A=\omega G_{12}+\nu G_{34},
\]

full frame closure over period \(L\) gives

\[
\omega L=2\pi m,\qquad \nu L=2\pi n,
\]

recovering the integer winding lattice as a holonomy-closure condition. For noncommuting nested motion the corresponding exact condition is the path-ordered holonomy, not separate scalar winding integers.

This is the natural extension of the classical twist/closure mechanism to genuinely nested carriers.

## 12. Current operational picture

The compact 4D carrier can now be handled in layers:

\[
(\rho,\chi,p,q)
\longrightarrow
\text{adapted frame }F
\longrightarrow
A=F^TF'
\longrightarrow
(u,w)
\longrightarrow
\kappa,\text{ bending, winding, holonomy diagnostics}.
\]

An outer Hagalaz/Sim(4) transport layer can then be composed by the Run-061 connection recursion rather than by full coordinate expansion.

The 3D Donut remains an exact conformal display/readout chart for fixed-\(\chi\) slices. Its Graticule is naturally the flat \((p,\eta)\) rectangle modulo periods. Its metric curvature is not substituted back into the 4D action.

## 13. Next calculations

- formulate the adaptive rank switch between generic two-frequency torus carrier and equal-frequency great-circle carrier;
- benchmark numerical conditioning of connection-based frequency recovery against the Run-060 third-derivative moment decoder;
- extend \((\rho,\chi,p,q)\) to one explicit nested outer-frame example and measure operation count / numerical stability against direct coordinate expansion;
- compare north/south inversion of the conformal Graticule with the historical ordinary/anti quadrant rules;
- use holonomy rather than raw phase labels as the first candidate conserved quantity in a noncommuting nested Whirligig search.