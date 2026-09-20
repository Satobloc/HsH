# Meridian Sandbox — Run 061: exact 4D ↔ 3D Donut bridge

**Status:** NEW CONSTRUCTIVE WORK / SANDBOX ONLY  
**Date:** 2026-09-20  
**Math status:** CLAIMED; algebraically and numerically checked in-run.  
**Purpose:** Keep the 4D carrier and the 3D Donut toy sharply distinct, then determine exactly what connects them and what survives the connection.

## 1. 4D product-torus carrier on S³

Take

\[
C(p,q)=(a\cos p,a\sin p,b\cos q,b\sin q),
\qquad a^2+b^2=\rho^2.
\]

This is a two-torus in the radius-\(\rho\) three-sphere embedded in \(\mathbb R^4\). The equal-radius case \(a=b=\rho/\sqrt2\) is the symmetric special case.

Its intrinsic metric is exactly

\[
ds_4^2=a^2dp^2+b^2dq^2,
\]

so the two phase directions are orthogonal and have constant scale factors \(a,b\).

For a parameterized curve \(p=p(\lambda),q=q(\lambda)\), the tangent-contribution angle is

\[
\tan\beta=\frac{b|q'|}{a|p'|},
\]

with the signs of \(p'\) and \(q'\) retained separately for orientation.

## 2. Exact north stereographic projection gives an ordinary ring torus

Project from the north pole \(N=(0,0,0,\rho)\) to the hyperplane \(x_4=0\):

\[
\Pi_N(x)=\frac{\rho}{\rho-x_4}(x_1,x_2,x_3).
\]

For the carrier above, with

\[
d_N=\rho-b\sin q,
\]

we obtain

\[
X_N=\left(
\frac{\rho a\cos p}{d_N},
\frac{\rho a\sin p}{d_N},
\frac{\rho b\cos q}{d_N}
\right).
\]

Let \(r_c=\sqrt{X_1^2+X_2^2}\) and \(z=X_3\). Then exactly

\[
(r_c-R)^2+z^2=r^2,
\]

with

\[
\boxed{R=\frac{\rho^2}{a}},
\qquad
\boxed{r=\frac{\rho b}{a}}.
\]

So the 3D Donut is not merely analogous to this 4D carrier: it is an exact stereographic image of it.

The projected torus satisfies the additional identity

\[
\boxed{R^2-r^2=\rho^2}.
\]

Thus the stereographic images form a restricted self-inversive family of ring tori, not arbitrary \((R,r)\) tori.

For the symmetric case \(a=b=\rho/\sqrt2\),

\[
R=\sqrt2\,\rho,\qquad r=\rho.
\]

## 3. Exact meridional-angle map

Write the ordinary 3D torus as

\[
r_c=R+r\cos\theta,\qquad z=r\sin\theta.
\]

For the north chart,

\[
\cos\theta_N=\frac{\rho\sin q-b}{\rho-b\sin q},
\qquad
\sin\theta_N=\frac{a\cos q}{\rho-b\sin q},
\]

and

\[
\boxed{\frac{d\theta_N}{dq}=-\frac{a}{\rho-b\sin q}}.
\]

Therefore one positive winding in the 4D \(q\)-circle becomes one negative meridional winding in this 3D chart. This is a fixed chart parity, not a dynamical chirality reversal.

## 4. Projection is conformal: Graticule tangent angle survives exactly

The induced 3D metric on the projected torus is

\[
ds_3^2=\Omega_N(q)^2\left(a^2dp^2+b^2dq^2\right),
\qquad
\Omega_N(q)=\frac{\rho}{\rho-b\sin q}.
\]

Hence the projection multiplies both orthogonal tangent components by the same local factor. It preserves their angle exactly:

\[
\boxed{\tan\beta_{3D}=\tan\beta_{4D}=\frac{b|q'|}{a|p'|}}.
\]

In standard torus coordinates,

\[
R+r\cos\theta_N=\Omega_N a,
\qquad
r\frac{d\theta_N}{dq}=-\Omega_N b.
\]

So the unsigned Graticule tangent decomposition is invariant under the projection, while the north-chart meridional orientation carries one fixed minus sign.

This is a strong exact use for the 3D Donut: topology and tangent-angle diagnostics can be visualized there without approximation.

## 5. What the 3D toy does NOT preserve

The 4D product torus is intrinsically flat:

\[
K_{4D\ torus}=0.
\]

The standard 3D ring torus has

\[
K_{3D}=\frac{\cos\theta}{r(R+r\cos\theta)},
\]

which changes sign across the torus.

Therefore the projection is not an isometry. Lengths, Gaussian curvature, extrinsic curvature, and naive bending energies are not carried unchanged from the 4D carrier into the 3D Donut.

Operational split:

- **4D carrier:** metric/action/solver calculations, frame transport, information-preserving dynamics;
- **3D Donut:** exact conformal/topological visualization, winding, angle/Graticule readout, chart diagnostics.

## 6. The old major/minor circumference observations fall out exactly — but as 3D chart geometry

At fixed \(q\), the north-projected azimuthal loop has circumference

\[
L_{\rm major}(q)=\frac{2\pi\rho a}{\rho-b\sin q}.
\]

Its only extrema occur at \(\cos q=0\):

\[
q=\frac\pi2:
\quad L_{\max}=2\pi(R+r),
\]

\[
q=\frac{3\pi}2:
\quad L_{\min}=2\pi(R-r).
\]

The meridional loop of the 3D torus has constant circumference

\[
L_{\rm minor}=2\pi r.
\]

Thus the familiar Donut facts — variable large circumference with unique outer/inner extrema and constant small circumference — are exact in the 3D image. In the underlying 4D product torus, by contrast, both factor-circle radii \(a,b\) are constant. The large-circumference variation is therefore a projection/chart effect, not a 4D intrinsic effect.

## 7. South chart and the exact inverse/anti partner

Project instead from the south pole:

\[
\Pi_S(x)=\frac{\rho}{\rho+x_4}(x_1,x_2,x_3).
\]

Then

\[
X_S=\left(
\frac{\rho a\cos p}{\rho+b\sin q},
\frac{\rho a\sin p}{\rho+b\sin q},
\frac{\rho b\cos q}{\rho+b\sin q}
\right),
\]

which lies on the same ring torus with the same \(R,r\).

Its meridional coordinate obeys

\[
\frac{d\theta_S}{dq}=+\frac{a}{\rho+b\sin q}.
\]

The two charts are related exactly by spherical inversion in \(\mathbb R^3\):

\[
\boxed{X_S=\frac{\rho^2}{\|X_N\|^2}X_N}.
\]

Because \(R^2-r^2=\rho^2\), this inversion maps the projected torus to itself. In particular, its outer and inner equators exchange because

\[
(R+r)(R-r)=\rho^2.
\]

This supplies a mathematically exact **candidate** for an ordinary/inverse Graticule pair: two conformal parameterizations of the same 3D Donut related by inversion, with opposite meridional orientation. It is not yet identified with the historical ordinary/anti construction without a source-by-source comparison.

## 8. Closed windings map to ordinary torus knots exactly

For

\[
p=m\tau+\phi_0,\qquad q=n\tau+\psi_0,
\qquad \tau\in[0,2\pi],
\]

with integers \(m,n\), the 4D curve closes. Under the north chart its torus homology class is

\[
\boxed{(m,n)\mapsto(m,-n)}.
\]

If \(\gcd(|m|,|n|)=1\), the projected image is the corresponding primitive torus knot (up to the fixed chart handedness). If the gcd is \(d>1\), the same primitive image is traversed \(d\) times. Irrational winding ratio remains non-closing/dense because stereographic projection is one-to-one on this torus.

For uniform closed winding,

\[
\tan\beta=\frac{b|n|}{a|m|}.
\]

Therefore closure discretizes the allowed Graticule tangent directions by integer winding sector.

## 9. Exact 4D curvature/bending ladder for winding sectors

For \(p=m\tau,q=n\tau\), define

\[
A=a^2m^2+b^2n^2,
\qquad
B=a^2m^4+b^2n^4.
\]

Then

\[
\|C'\|^2=A,
\qquad
\|C''\|^2=B,
\qquad
C'\cdot C''=0,
\]

so

\[
\boxed{\kappa^2=\frac{B}{A^2}},
\qquad
\boxed{\ell=2\pi\sqrt A}.
\]

The intrinsic bending integral is

\[
\boxed{\mathcal B_{m,n}=\int\kappa^2d\ell
=2\pi\frac{B}{A^{3/2}}}.
\]

At fixed \(a,b\), closed winding sectors therefore form a discrete classical geometric ladder indexed by integer \((m,n)\). This is a precise classical closure/quantization-like statement only; it is not by itself a quantum-mechanical result.

For the symmetric case \(a=b=\rho/\sqrt2\),

\[
\kappa^2=
\frac{2(m^4+n^4)}{\rho^2(m^2+n^2)^2},
\]

\[
\mathcal B_{m,n}=
\frac{2\sqrt2\pi}{\rho}
\frac{m^4+n^4}{(m^2+n^2)^{3/2}}.
\]

The \((1,1)\) sector gives \(\kappa=1/\rho\) and \(\mathcal B=2\pi/\rho\).

## 10. Uniform winding is the exact minimum of the reduced second-derivative score within a fixed sector

For fixed radii and endpoints

\[
p(L)-p(0)=2\pi m,\qquad q(L)-q(0)=2\pi n,
\]

the raw reduced score is

\[
I=\int_0^L\left[
 a^2\left((p'')^2+(p')^4\right)+
 b^2\left((q'')^2+(q')^4\right)
\right]d\lambda.
\]

Since \((p'')^2,(q'')^2\ge0\) and \(u^4\) is convex, Jensen's inequality gives

\[
\boxed{I\ge\frac{(2\pi)^4}{L^3}(a^2m^4+b^2n^4)},
\]

with equality exactly for constant winding rates

\[
p'=\frac{2\pi m}{L},\qquad q'=\frac{2\pi n}{L}.
\]

Thus on this restricted torus family, bending minimization does not search a complicated path inside a fixed topological sector: it selects uniform winding. Nontrivial derivational search must therefore alter additional structure — equation geometry, radii/frame/connection, coupling invariants, or sector transitions — rather than merely redistribute phase speed.

## 11. Moving 4D frames compress nested hyperhelices exactly

Let a nested 4D frame be

\[
Q_k=Q_{k-1}R_k\in SO(4).
\]

Define the body connection

\[
A_k=Q_k^TQ_k',
\qquad
B_k=R_k^TR_k'.
\]

Then exactly

\[
\boxed{A_k=R_k^TA_{k-1}R_k+B_k}.
\]

Differentiating gives

\[
\boxed{
A_k'=R_k^TA_{k-1}'R_k+[R_k^TA_{k-1}R_k,B_k]+B_k'
}.
\]

For a single-plane local rotation

\[
R_k=e^{\theta_kG_k},
\]

with fixed skew generator \(G_k\),

\[
B_k=\theta_k'G_k,
\qquad
B_k'=\theta_k''G_k.
\]

For a body carrier \(h\) and physical curve \(C=Qh\),

\[
\boxed{Q^TC'=h'+Ah},
\]

\[
\boxed{Q^TC''=h''+2Ah'+(A'+A^2)h}.
\]

Thus arbitrarily deep nested rotation can be compressed locally into \(A\) and \(A'\) for first/second derivative calculations instead of repeatedly expanding final 4D coordinates.

Numerical exactness check with five variable-angle noncommuting rotation levels:

- \(\|A_{recursive}-A_{direct}\|=3.87\times10^{-16}\)
- \(\|A'_{recursive}-A'_{direct}\|=9.87\times10^{-16}\)
- skew residuals for \(A,A'\) below \(5\times10^{-17}\).

This is the first directly useful hyper/superhelical efficiency result of the run.

## 12. Natural 4D Hagalaz extension: local Sim(4) connection

A similarity-frame carrier can be written in homogeneous coordinates as

\[
g(\lambda)=
\begin{pmatrix}
\sigma Q & c\\
0&1
\end{pmatrix}.
\]

Its local connection is

\[
\Xi=g^{-1}g'=
\begin{pmatrix}
\alpha I+A & v\\
0&0
\end{pmatrix},
\]

where

\[
\alpha=\sigma'/\sigma,
\qquad
A=Q^TQ',
\qquad
v=(\sigma Q)^{-1}c'.
\]

The 4D local state has 11 independent components: 6 rotation + 1 dilation + 4 translation.

For nested similarities \(g_k=g_{k-1}h_k\), with \(\eta_k=h_k^{-1}h_k'\),

\[
\boxed{\Xi_k=h_k^{-1}\Xi_{k-1}h_k+\eta_k},
\]

\[
\boxed{
\Xi_k'=h_k^{-1}\Xi_{k-1}'h_k+
[h_k^{-1}\Xi_{k-1}h_k,\eta_k]+\eta_k'
}.
\]

A three-level variable scale/rotation/translation numerical test agreed with direct homogeneous-matrix differentiation to \(2.13\times10^{-16}\) for \(\Xi\) and \(4.15\times10^{-16}\) for \(\Xi'\).

This is a NEW constructive extension, not a claim that historical Hagalaz already used Sim(4). It provides a natural exact route if Hagalaz is to become the transport layer for 4D nested carriers.

## 13. Why the 4D frame should remain primary

A general \(SO(4)\) rotation of the S³ carrier does **not** become an ordinary 3D similarity after stereographic projection. Rotations that move the projection pole induce nonlinear conformal/Möbius transformations in \(\mathbb R^3\).

Example: rotate in the \((x_1,x_4)\) plane by \(\alpha\). If \(X\in\mathbb R^3\) is the north-chart coordinate and \(S=\|X\|^2\), the projected denominator contains

\[
D=(1-\cos\alpha)S+(1+\cos\alpha)\rho^2-2\rho\sin\alpha\,X_1,
\]

so the transformed 3D coordinates are rational functions of \(X\), not an affine rotation/scale/translation except in pole-fixing special cases.

Consequences:

- a standard 3D Donut is a useful exact chart, not a full SO(4)-covariant carrier;
- arbitrary 4D frame motion is simpler and cleaner in 4D;
- an exact 3D-only transport layer would need conformal/Möbius capability beyond ordinary similarities, or else it must carry the 4D frame separately.

## 14. Run-060 invariant decoder conditioning — exact degeneracy structure

For the four-moment decoder let

\[
m_k=A x^k+B y^k,
\quad A=a^2,\ B=b^2,\ x=\omega^2,\ y=\nu^2.
\]

The full Jacobian of \((A,B,x,y)\mapsto(m_0,m_1,m_2,m_3)\) has determinant

\[
\boxed{\det J=-AB(x-y)^4}.
\]

Therefore exact invertibility fails when either amplitude vanishes or the squared frequencies collide, and conditioning deteriorates very rapidly near \(x=y\).

A controlled relative-noise stress test (moment noise \(10^{-10}\), \(A=B=1\), \(\omega=1\)) showed median maximum recovered-frequency errors approximately:

| \(\nu-\omega\) | median max error |
|---:|---:|
| 1e-1 | 1.0e-8 |
| 3e-2 | 9.0e-8 |
| 1e-2 | 7.8e-7 |
| 3e-3 | 8.8e-6 |
| 1e-3 | 8.3e-5 |
| 3e-4 | 1.5e-3 |
| 1e-4 | 1.5e-2 |

The exact decoder is therefore useful away from the collision set but should switch to a merged/degenerate representation near equal frequencies rather than pretending two components remain stably separable.

## 15. Current constructive consequences

1. **4D and 3D are now separated cleanly but linked exactly.** The Donut is an exact stereographic visualization of the restricted 4D torus carrier, not the carrier itself.
2. **Graticule angle/winding data survive projection exactly.** Metric/bending data do not.
3. **North/south charts give an exact inversion-related pair.** This is a strong candidate mathematical model for ordinary/inverse Graticule structure, pending historical comparison.
4. **Classical closure yields exact integer winding sectors and a discrete 4D bending ladder.** This is the cleanest current mathematical realization of the continuous-to-discrete twist/closure intuition, without importing quantum claims.
5. **Nested hyperhelices admit a compact moving-frame calculus.** Local \(SO(4)\) or Sim(4) connection data avoid coordinate explosion.
6. **The 3D similarity layer is not enough for arbitrary projected 4D frame motion.** Full 4D transport should remain primary unless the 3D layer is enlarged to conformal maps.
7. **The Run-060 moment decoder has a sharp collision singularity.** Adaptive representation is required near frequency degeneracy.

## 16. Next calculations

- derive a frame-covariant version of the moment decoder for a moving/nested \(SO(4)\) carrier;
- determine which winding/bending quantities remain invariant under allowed moving-frame gauges and which correspond to physical frame motion;
- test whether the north/south inversion pair reproduces the historical ordinary/anti Graticule axes and parity rules without adding new assumptions;
- express the Hagalaz transport candidate directly in connection/holonomy variables and compare its information budget against the full torus carrier;
- only then feed a nontrivial equation-geometry transformation through the nested 4D carrier and measure whether the geometric compression actually improves search efficiency.