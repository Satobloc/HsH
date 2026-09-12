# Finite-Core Tangency and Readout Crossover Packet 002

Status: **frozen bounded local result; valid only for nondegenerate quadratic contact**.

## Exact narrow question

When the center-history is tangent to the resolving hypersurface, what replaces the singular transverse readout law, and can the resulting local scaling distinguish a full \(B^3\) core, a rank-two \(B^2\) support, a boundary-only \(S^2\) carrier, and finite resolving thickness?

## Sources and coverage

- Current finite-core construction-lab control prompt: controlling source.
- \`WORKSPACES/WORLDTUBE_LAB/FINITE_CORE_CROSS_SECTION_PACKET_001.md\`: full sequential read; direct dependency.
- \`synthesis/R4_FRAMED_CURVE_KINEMATICS.md\`: full sequential read; frame and normal-bundle type control.
- Slack \`#worldtube-lab\`: full channel history through the handoff of Packet 001; no later Ravel correction or reply.
- Google Drive: targeted search for Packet 001/worldtube; no result, so no Drive source was promoted.
- Repository search for an existing finite-core tangency construction: no result.

No new literature was searched.

## Object and dimensional type

Work locally in a four-length-coordinate representation. Let

\[
\gamma:I\to\mathbb R^4
\]

be a \(C^3\), arclength-parametrized center-history, and let the resolving interface be a \(C^2\) hypersurface

\[
\Sigma=\Phi^{-1}(0),
\]

where \(\Phi\) is signed distance near the contact point \(p=\gamma(0)\). Thus

\[
\nabla\Phi(p)=n,\qquad \|n\|=1.
\]

The finite carrier is

\[
X(s,y)=\gamma(s)+y+\text{higher-order normal-trivialization terms},
\qquad y\in K_s\subset N_s\gamma .
\]

The families compared are:

1. full bulk \(K_s=B^3_\varepsilon\);
2. restricted bulk \(K_s=B^2_\varepsilon\subset E_s\), with selected plane \(E_s\subset N_s\gamma\);
3. boundary carrier \(K_s=S^2_\varepsilon\);
4. a resolving slab \(|\Phi|\le h\);
5. a layered object carrying more than one of these measures.

The centerline is tangent to the sheet at \(p\):

\[
\Phi(\gamma(0))=0,\qquad
\alpha:=n\cdot T(0)=0.
\]

Because \(n\cdot T=0\), the sheet normal \(n\) is itself a member of the rank-three normal fiber \(N_0\gamma\).

## Definitions

Define the relative normal acceleration of the center-history against the sheet by

\[
A_{\rm rel}
:=
\left.\frac{d^2}{ds^2}\Phi(\gamma(s))\right|_{s=0}
=
n\cdot\gamma''(0)
+
\nabla^2\Phi_p(T,T).
\]

This definition avoids a sign convention for the second fundamental form. Reversing the signed-distance orientation sends \(A_{\rm rel}\mapsto-A_{\rm rel}\), so \(|A_{\rm rel}|\) is orientation-independent.

For a possibly asymmetric fiber, define its one-sided support radii along \(n\):

\[
\rho_+=\sup_{y\in K_0}n\cdot y,\qquad
\rho_-=-\inf_{y\in K_0}n\cdot y.
\]

For centrally symmetric radius-\(\varepsilon\) balls or spheres, \(\rho_+=\rho_-=\varepsilon\).

## Assumptions

1. \(A_{\rm rel}\ne0\): quadratic contact is nondegenerate.
2. The fiber scale and slab half-thickness are small compared with local curvature radii.
3. The normal bundle is smoothly trivialized across the contact neighborhood.
4. The quoted exact leading coefficients use circular/spherical fibers and a locally thin sheet.
5. No constitutive energy, particle label, Standard Model identity, or legacy repair factor is assumed.
6. Provisional ᚼ/ᚼᚼ expansion and rotation enter only through the actual support function of \(K_s\); they are not assigned an independent observable here.

## Derivation

Taylor expansion at \(p\) gives

\[
\Phi(\gamma(s)+y)
=
n\cdot y
+
\alpha s
+
\frac12 A_{\rm rel}s^2
+
O(s^3+s\|y\|+\|y\|^2).
\]

At exact tangency \(\alpha=0\), and the leading intersection condition is

\[
n\cdot y=-\frac12A_{\rm rel}s^2.
\]

For a symmetric carrier with support radius \(\rho_n\) along \(n\), an intersection exists while

\[
\frac12|A_{\rm rel}|s^2\le \rho_n.
\]

Hence the half-span of the resolved contact along the center-history is

\[
s_{\max}
=
\sqrt{\frac{2\rho_n}{|A_{\rm rel}|}},
\]

and the total contact span is

\[
\ell_\parallel=2s_{\max}.
\]

For a finite resolving slab \(|\Phi|\le h\), the leading existence condition becomes

\[
\frac12|A_{\rm rel}|s^2\le \rho_n+h,
\]

so

\[
s_{\max}(h)
=
\sqrt{\frac{2(\rho_n+h)}{|A_{\rm rel}|}}.
\]

Thus carrier thickness and resolving thickness are not separately identifiable from contact span alone: to leading order they enter through \(\rho_n+h\).

### Full bulk \(B^3_\varepsilon\)

Choose coordinates \(y=(u_1,u_2,z)\) in the normal fiber with \(z=n\cdot y\). The sheet selects

\[
z=-\frac12 A_{\rm rel}s^2,
\]

and the remaining disk has area

\[
\pi\left(\varepsilon^2-\frac{A_{\rm rel}^2s^4}{4}\right).
\]

Integrating over the tangency span yields the leading three-volume of the thin-sheet readout:

\[
V_\Sigma(B^3_\varepsilon)
=
\int_{-s_{\max}}^{s_{\max}}
\pi\left(\varepsilon^2-\frac{A_{\rm rel}^2s^4}{4}\right)ds
=
\frac{8\pi\sqrt2}{5}
\frac{\varepsilon^{5/2}}{\sqrt{|A_{\rm rel}|}}
+
o(\varepsilon^{5/2}).
\]

The exponent \(5/2\) is forced by two transverse bulk directions contributing \(\varepsilon^2\) and a tangency span contributing \(\varepsilon^{1/2}\).

### Boundary carrier \(S^2_\varepsilon\)

At fixed \(s\), the sheet cuts the spherical fiber in a circle of radius

\[
r(s)=
\sqrt{\varepsilon^2-\frac{A_{\rm rel}^2s^4}{4}}.
\]

Let

\[
C_4:=\int_0^1\sqrt{1-u^4}\,du.
\]

The leading two-area of the sheet/boundary intersection is

\[
A_\Sigma(S^2_\varepsilon)
=
4\pi\sqrt2\,C_4\,
\frac{\varepsilon^{3/2}}{\sqrt{|A_{\rm rel}|}}
+
o(\varepsilon^{3/2}).
\]

The induced-metric corrections are higher order under the small-core assumption.

### Rank-two support \(B^2_\varepsilon\)

Let \(E\subset N_0\gamma\) be the selected support plane and define

\[
\beta:=\|P_E n\|\in[0,1].
\]

If \(\beta>0\), the sheet cuts the disk fiber in a chord. The allowed span is

\[
s_{\max}
=
\sqrt{\frac{2\beta\varepsilon}{|A_{\rm rel}|}},
\]

and the leading two-area is

\[
A_\Sigma(B^2_\varepsilon)
=
4\sqrt{2\beta}\,C_4\,
\frac{\varepsilon^{3/2}}{\sqrt{|A_{\rm rel}|}}
+
o(\varepsilon^{3/2}).
\]

Here the orientation of the selected plane survives through the invariant relational scalar \(\beta\).

If \(\beta=0\), the entire support plane is orthogonal to \(n\). For an exactly thin sheet and nondegenerate quadratic contact, the leading intersection occurs only at \(s=0\) and is the whole \(B^2_\varepsilon\) fiber. This exceptional branch has area \(\pi\varepsilon^2\), not the generic \(\varepsilon^{3/2}\) law. Finite sheet thickness unfolds the branch.

## Transverse-to-tangent crossover

Retain a small nonzero incidence

\[
\alpha=n\cdot T.
\]

The leading contact equation is

\[
n\cdot y+\alpha s+\frac12A_{\rm rel}s^2=0.
\]

The transverse law dominates when the quadratic term is small over the linear contact span. This produces the dimensionless crossover parameter

\[
\Lambda
=
\frac{|\alpha|}
{\sqrt{|A_{\rm rel}|\rho_{\rm eff}}},
\qquad
\rho_{\rm eff}:=\rho_n+h.
\]

- \(\Lambda\gg1\): transverse regime; Packet 001's secant law applies.
- \(\Lambda\lesssim1\): tangency layer; the secant divergence is nonuniform and the square-root law controls.
- \(\Lambda=0\), \(A_{\rm rel}\ne0\): exact quadratic tangency.

This removes the false divergence of \(1/|n\cdot T|\): finite core scale and relative curvature regularize the readout.

## Localized perturbation and canonical residual

Let one localized perturbation change the normal support and relative curvature:

\[
\rho_{\rm eff}\mapsto
\rho_{\rm eff}+\eta f(s-s_0)\,\delta\rho,
\qquad
A_{\rm rel}\mapsto
A_{\rm rel}+\eta f(s-s_0)\,\delta A.
\]

Away from \(A_{\rm rel}=0\), the contact-span response is

\[
\frac{\delta\ell_\parallel}{\ell_\parallel}
=
\frac12
\left(
\frac{\delta\rho_{\rm eff}}{\rho_{\rm eff}}
-
\frac{\delta|A_{\rm rel}|}{|A_{\rm rel}|}
\right).
\]

For an isotropic \(B^3\), provisional normal rotation in ᚼ remains gauge because \(\rho_n=\varepsilon\) is independent of orientation. Expansion changes \(\rho_n\). For anisotropic or rank-two support, rotation can change \(\rho_n\) or \(\beta\) relative to the sheet and therefore becomes readable relationally.

The surviving local data are

\[
|A_{\rm rel}|,\qquad
\rho_{\rm eff},\qquad
\beta,\qquad
\Lambda.
\]

They are invariant under reparametrization by arclength, ambient coordinate changes preserving the local metric description, signed-distance orientation reversal after taking absolute value, and simultaneous normal-frame rotations. They are relational carrier/interface data, not properties of the carrier alone.

## Candidate comparison and containment

| Candidate | Generic tangency readout | Leading scale | Extra datum |
|---|---|---|---|
| bulk \(B^3\) | 3-volume in \(\Sigma\) | \(\varepsilon^{5/2}|A_{\rm rel}|^{-1/2}\) | none for isotropic core |
| boundary \(S^2\) | 2-area in \(\Sigma\) | \(\varepsilon^{3/2}|A_{\rm rel}|^{-1/2}\) | boundary measure |
| support \(B^2\), \(\beta>0\) | 2-area in \(\Sigma\) | \(\sqrt\beta\,\varepsilon^{3/2}|A_{\rm rel}|^{-1/2}\) | selected plane |
| support \(B^2\), \(\beta=0\) | exceptional \(B^2\) section | \(\varepsilon^2\) | exact alignment |
| finite slab | thickened contact region | depends on \(\rho_n+h\) at leading span order | independent \(h\) |
| layered | simultaneous bulk/boundary/support observables | multiple exponents possible | typed measure/readout map |

A full \(B^3\) contains \(S^2\) as its natural boundary. Given an additional selected plane \(E\), \(B^2=B^3\cap E\), but the plane field is extra structure and is not supplied by an isotropic bulk. A finite slab is a neighborhood of the resolving map, not a carrier boundary. A layered architecture can therefore contain the rival signatures without identifying their measures.

## Centerline limit

For \(\rho_n=O(\varepsilon)\) and fixed \(A_{\rm rel}\ne0\),

\[
\ell_\parallel=O(\varepsilon^{1/2})\to0.
\]

The centerline representation is recovered setwise, but not uniformly in incidence angle: tangential patches collapse more slowly than transverse \(O(\varepsilon)\) patches. Any centerline-limit theorem that assumes an angle-independent \(O(\varepsilon)\) readout diameter fails near tangency.

## Failure conditions

1. \(A_{\rm rel}=0\): quadratic contact is degenerate; cubic or higher contact order controls.
2. \(\Phi\) is not signed distance or is insufficiently smooth: the displayed \(A_{\rm rel}\) needs renormalization or is undefined.
3. Fiber asymmetry is ignored: the relevant one-sided support radius depends on the sign of \(A_{\rm rel}\).
4. \(\rho_n\) and \(h\) are inferred separately from contact span alone: the leading map identifies only their sum.
5. The \(B^2\) orientation branch \(\beta=0\) is treated as generic.
6. Constitutive dynamics or particle identities are inferred from a purely kinematic local intersection.
7. The secant law is extrapolated through \(\Lambda\lesssim1\).

## Prediction packet: finite-core tangency scaling

**Class:** solver-geometric, rival-candidate discriminator; not yet a particle-scale empirical prediction.

**Inputs:** carrier radius \(\varepsilon\), signed-distance sheet, measured \(A_{\rm rel}\), incidence \(\alpha\), optional slab half-thickness \(h\), and for \(B^2\) the independently specified \(\beta\).

**Forced outputs:**

\[
\ell_\parallel
=
2\sqrt{\frac{2(\rho_n+h)}{|A_{\rm rel}|}},
\]

\[
V_\Sigma(B^3)
\sim
\frac{8\pi\sqrt2}{5}
\varepsilon^{5/2}|A_{\rm rel}|^{-1/2},
\]

\[
A_\Sigma(S^2)\propto
\varepsilon^{3/2}|A_{\rm rel}|^{-1/2},
\qquad
A_\Sigma(B^2)\propto
\sqrt\beta\,\varepsilon^{3/2}|A_{\rm rel}|^{-1/2},
\]

and crossover at

\[
|\alpha|\sim\sqrt{|A_{\rm rel}|(\rho_n+h)}.
\]

**Units:** \([A_{\rm rel}]=L^{-1}\), \([\ell_\parallel]=L\), \([V_\Sigma]=L^3\), \([A_\Sigma]=L^2\), and \(\Lambda\) is dimensionless.

**Readout map:** direct mesh or voxel intersection of the declared carrier with \(\Phi=0\), with \(|\Phi|\le h\) evaluated separately.

**Independent comparator:** fit log-log slopes under a radius sweep without retuning geometry. The predicted leading slopes are \(5/2\) for full-bulk three-volume and \(3/2\) for boundary or generic rank-two two-area.

**Uncertainty:** omitted terms are controlled by the ratio of the contact span to the smallest local geometric variation length; leading relative error is generically \(O(\sqrt{\varepsilon/\ell_{\rm geom}})\).

**Rival contrast:** \(B^3\) and \(S^2/B^2\) differ in readout dimension and radius exponent; \(S^2\) and generic \(B^2\) share exponent but differ by topology and the \(\beta\) dependence. Span alone cannot distinguish carrier thickness from sheet thickness.

**Falsification:** with the assumptions enforced and numerical refinement demonstrated, failure to recover the square-root span, the crossover in \(\Lambda\), or the appropriate \(5/2\) versus \(3/2\) slope falsifies this local packet.

## Paper draft update

Working paper: **Finite-Core Object Hierarchy and Readout Non-Equivalence**.

New bounded section:

7. Tangency layer and failure of the uniform secant approximation.
   - signed-distance relative curvature;
   - square-root contact span;
   - bulk/boundary/support scaling exponents;
   - carrier-thickness/readout-thickness non-identifiability;
   - transverse/tangent crossover;
   - nonuniform centerline limit.

## Exact handoff / next dependency

Meridian: implement the local model

\[
z+\alpha s+\frac12A_{\rm rel}s^2=0
\]

for \(B^3_\varepsilon\), \(S^2_\varepsilon\), and tilted \(B^2_\varepsilon\); sweep \(\varepsilon\) and \(\alpha\) without fitting the output; return measured slopes, the crossover location in \(\Lambda\), and any mesh-resolution bias. Hold back particle identities and legacy angular or mass targets.
