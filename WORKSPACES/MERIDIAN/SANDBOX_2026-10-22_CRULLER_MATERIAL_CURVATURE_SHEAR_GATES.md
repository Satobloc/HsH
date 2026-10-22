# Meridian — Cruller material curvature versus inter-worldtube shear
**Date:** 2026-10-22 · **Status:** mathematical SANDBOX, executed native-four-dimensional kinematics, **no** gravitational/optical prediction and **no** new constitutive law.

## Source and method
- **BEDROCK** ND-2026-10-20-02 and ND-2026-10-22-03: four-dimensional material bending/rotation is actual curve curvature; calculate shear and expansion independently; the operative SAT.O/Blockwave/Back Hallways primary archive is the second technical authority, while historical supersessions and failures remain subject to audit.
- **Mersearch FIRST:** Orson run 39692587169 finished successfully. Receipt: \`indexes/mersearch_requests/2026-10-21-orson-nlm-big-haul-math-001/SEARCH_RECEIPT.md\`. It counts 34,983 matches in 13,897 scanned files and 1,627 distinct source paths. This is a navigation receipt, **not** independent confirmation of any equation or comprehensive reading of the 80 MB results.
- **Historical originals directly read:** \`DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Back hallways .txt\`: cross-domain projections and holdouts (maps invertible only when information allows). \`DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt\`: formerly proposed strain kernel containing projected \(\nabla u\), phase, filament current and multiple explicit free coefficients. This is a source constraint **not adopted** as a validated current dynamics; its pure-gradient phase term requires its own holonomy audit. \`Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT-O Theory Work/SATO.4D Coherence Project Instructions.txt\`: historically mandated core/derived/speculative separation. \`DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH ARCHITECT.txt\` (Nathan Direct: rotating structures have complete worldtubes), earlier Meridian S³ rigid/shearing and Mercer worldtube rapidity audits.
- **Forest status:** No source-derived, dynamically specified physical interaction thickness, constitutive modulus, light transport or native Forest normalization is imported. The following example is an explicitly declared **affine-time material kinematic fixture** in the native \((++++)\) four-space. All \(r,w\) in Planck lengths and all angular rates in reciprocal Planck lengths. No fifth physical coordinate.

## Exact material history with nonrigid differential rotation

Use native coordinates \(X=(x,y,z,w)\), where the fourth coordinate \(w\) increases along the chosen fixed affine simultaneity readout. Label one material point by initial \((r,\phi,z)\). Define its four-dimensional history:
\[
\boxed{X(w;r,\phi,z)=
(r\cos[\phi+\omega(r)w],r\sin[\phi+\omega(r)w],z,w).}
\]
This is a congruence of marked material histories in a four-dimensional ambient space; the parameter \(w\) is not an additional dimension.

A given material element has \(|\mathbf v|=r|\omega(r)|\) and \(|\mathbf a_3|=r\omega(r)^2\), measured against the fixed affine \(w\) parameter. Its true ambient Euclidean curve curvature is
\[
\boxed{\kappa_{4,E}(r)=\frac{r\,\omega(r)^2}{1+r^2\omega(r)^2}.}
\]
**Crucially, \(\omega'(r)\) is absent from this one-particle curvature.** The history's shape depends on the angular rate of *that element*, not on how the neighboring material is circulating.

### Neighbor interaction geometry
For a fixed simultaneity section \(w\), the 3D spatial material map is
\[
\Phi_w:(r,\phi,z)\mapsto (r,\phi+\omega(r)w,z).
\]
Its pulled-back Euclidean slice metric is exactly
\[
h_w=dr^2+dz^2+r^2[d\phi+w\omega'(r)\,dr]^2.
\]
Thus \(h_{rr}=1+r^2w^2(\omega')^2,\ h_{r\phi}=r^2w\omega',\ h_{\phi\phi}=r^2\), with determinant \(r^2\). The 3D material volume remains unchanged:
\[
\det h_w=\det h_0=r^2,\qquad \nabla\cdot \mathbf v=0.
\]
Nevertheless the material lines *shear*. The engineering shear measured with respect to their initial radial/azimuthal material coordinates is
\[
\boxed{\gamma_{r\phi}(w)=r\,w\,\omega'(r).}
\]
The instantaneous Euclidean rate-of-deformation tensor in an orthonormal \((e_r,e_\phi,e_z)\) basis has
\[
D_{\hat r\hat\phi}=\frac{r\omega'(r)}2,\qquad
\|D\|^2=\frac{r^2[\omega'(r)]^2}{2},\qquad \mathrm{tr}D=0.
\]
The vorticity scalar along \(z\) for this conventional cylindrical 3D slice is \((\nabla\times\mathbf v)_z=2\omega+r\omega'\). This is material vorticity, not automatically a 4D Riemann curvature or an optical effect.

### Complete 4D pullback, geometry-versus-label safeguard
The ambient Euclidean \((++++)\) line element in material labels is
\[
\boxed{ds_E^2=dr^2+dz^2+dw^2+r^2[d\phi+\omega(r)\,dw+w\omega'(r)\,dr]^2.}
\]
It contains derivative-dependent off-diagonal coefficients and still has \(R^A{}_{BCD}=0\) because it is the pullback of flat Euclidean space by a smooth invertible coordinate map on a regular annulus. Its four-volume Jacobian has determinant \(r^2\). **The material congruence still bends and the marked neighborhood still shears.** A coordinate change that unwinds the pullback does not straighten the physically identified material curves or erase relative deformation. Conversely the curved material curves do not by themselves produce Riemann curvature or gravitational lensing.

## Executed minimal pair and falsifiable constraints
Planck-native controlled values chosen *only as a kinematic illustration*, not cosmological parameters: \(r_0=10\,\ell_P\), \(\omega_0=0.06\,\ell_P^{-1}\), \(\omega'_0=0.006\,\ell_P^{-2}\), annulus \(9\le r/\ell_P\le11\) where the conventional comparator speed \(r\omega(r)<1\).

- Control A (rigid): \(\omega_A(r)=0.06\).
- Control B (shear): \(\omega_B(r)=0.06+0.006(r-10)\).
- **Exactly the same central material history** at \(r_0=10\); same central speed \(0.6\), spatial acceleration \(0.036\,\ell_P^{-1}\), and four-dimensional curvature \(\kappa_{4,E}=0.026470588235294117\,\ell_P^{-1}\).
- **Different neighbor deformation:** rigid \(D_{\hat r\hat\phi}=0\); shear \(D_{\hat r\hat\phi}=0.03\,\ell_P^{-1}\), \(\|D\|=0.042426406871192854\,\ell_P^{-1}\).
- After \(w=100\,\ell_P\) the marked annulus has local engineering shear \(\gamma=6\) at the central ring and a relative phase advance of \(1.2\) radians between its inner and outer radial boundaries. This large *finite* twist is accommodated by the exact, nonlinear pullback, not by extending the small-strain formula outside its regime.

Executed \`meridian_cruller_material_shear_gate_20261022.py\` in this conversation using Python/NumPy/Matplotlib. Assertions verify analytic 4D curvature from ambient tangent/acceleration, identical central worldline in both flows, entire material metric by independent finite differences at 18 combinations of radius/time, determinant conservation. Class P-style figure \`meridian_cruller_material_shear_gate_20261022.png\` depicts 12 initially straight marked radial spokes in the co-rotating frame at \(w=0,50,100\); this image exists as a conversation artifact but is **not uploaded into GitHub**.

## Further exact director gate: zero material shear does not mean parallel 4D worldline tangents

At a common affine slice \(w=0\) and common azimuth \(\phi\), the material tangent to an orbit at radius \(r\), normalized using the native Euclidean 4D metric, makes angle
\[
\theta_E(r)=\arctan[r\omega(r)]
\]
with the fourth-axis direction. Hence the physical-chart derivative of material tangent tilt across radial neighboring histories is
\[
\boxed{\theta'_E(r)=\frac{\omega(r)+r\omega'(r)}{1+r^2\omega(r)^2}.}
\]
This is **not** an intrinsic scalar independent of the chosen material time/section and the chosen radial direction; it is an exactly defined comparison observable in the fixed affine-time graph. For the numerical central ring:
- rigid flow: \(\theta'_E=0.0441176470588\,\ell_P^{-1}\) despite \(D_{\hat r\hat\phi}=0\);
- differentially rotating flow: \(\theta'_E=0.0882352941176\,\ell_P^{-1}\) with \(D_{\hat r\hat\phi}=0.03\,\ell_P^{-1}\).

These values were computed and checked by finite differences of the actual normalized tangent vectors at neighboring radii. **Three objects differ even in one exact minimal pair:** intrinsic curvature of each material trajectory, tilt-gradient of neighboring material histories, and symmetric shear of the material congruence. The fourth-dimensional embedding contains all three, and none should be substituted for another. Rigid spin has directed circulation and relative tangent tilt even when it is strain-free as a rigid body.

## Cross-domain closure gate, no imported elasticity
The recovered Blockwave projected-gradient kernel suggests that a common field could carry information about 4D curvature, shear and vorticity, **but it does not identify them** and its free coefficients are not determined. Before applying a physical force law, decompose the inherited gradient geometry into expansion, antisymmetric circulation, trace-free shear, and curvature/acceleration **on the same explicitly specified native metric/time readout**. A nonzero \(\nabla u\) is not an independent proof of coupling to photons.

Minimal-pair challenge: choose two observed systems with identical local 4D material curve bending but distinct independently measured \(\omega'\) and assess whether the same native interaction relation predicts different stresses, transport, or emitted signals without new coefficients. Rigidly rotating material needs centripetal support despite \(D=0\). Differentially rotating material can require additional inter-element stresses because \(\omega'\neq0\). Stress depends on material constitution, connectivity, constraints and boundary conditions, not just curve bending.

**Star-shaped holdouts:** rigid shell versus differentially spinning finite-core shell; two versus three worldtube contact/braid systems; laboratory rotating body versus astronomical flow. Freeze the mapping before cross-domain comparison. Optical transport and the stellar wink census are **held out** until the derived physical matter/metric coupling exists.

## Verdict
The four-dimensional histories are genuinely curved under rotation; local **worldline curvature does not determine inter-worldtube shear**. Their independent invariants must both be retained. Worldtube bending is not denied because ambient Riemann remains zero, and it is not automatically promoted to an optical Riemann lens. This is a rigorous starting geometry for finite-core Cruller interbraid strain without adding a new force or field.
