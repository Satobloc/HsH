# Meridian | Cruller R4: marked material curvature, shear, and oriented four-dimensional osculation

**2026-10-22 • SANDBOXED native-geometry calculation • no derived dynamics, optical law, or observational detection.**

## 0. Source continuity and provenance

- \`BEDROCK.md\` ND-2026-10-20-02: native 4D worldtube rotation and bending must be distinguished from volume expansion and Riemann curvature. The physical global Cruller is **not** declared solved.
- \`WORKSPACES/MERIDIAN/SANDBOX_2026-10-20_CRULLER_FIRST_GLOBAL_TOPOLOGY.md\`: \`R4\{0} ~= S3 × R\` via \`X=r0 exp(s)n\`; \`s=ln(r/r0)\` is a **dimensionless radial label**, not a fifth physical coordinate or automatically physical time. Constant two-plane angular rates preserve round S3 while a differential swirl causes marked material shear.
- \`WORKSPACES/MERIDIAN/SANDBOX_2026-10-21_ROTATION_AS_WORLDTUBE_CURVATURE_CORRECTION.md\`: 3D circular acceleration is curvature of marked 4D material history; ambient Riemann curvature is a different quantity. This note continues that correction.
- \`WORKSPACES/MERIDIAN/SANDBOX_2026-10-21_CRULLER_SECOND_ORDER_VARIATION.md\`: tension+bending comparison under fixed S3 may not induce higher winding. No old stiffness numbers imported.
- Mersearch \`indexes/mersearch_requests/2026-10-21-orson-nlm-big-haul-math-001/\`: GitHub Action run \`39692587169\` **completed successfully** 2026-10-22T01:31:58Z. RUN_MANIFEST and SEARCH_RECEIPT read; scanned 13,897 files and 23,825,506 records, reporting 34,983 hits / 1,627 paths across three repositories. The receipt is **navigation only**, not independently supported physics, and is not claimed to have been exhaustively mined here.

## 1. Native R4 calculation, no extra time coordinate

Identify Euclidean 4-space with C², one physical point represented by \`(z1,z2)\`. A family of marked material histories is

\`X(s;χ,α,β)=r0 exp(s) (cosχ exp[i(α+p(χ)s)], sinχ exp[i(β+q(χ)s)])\`,

with \`0<χ<π/2\`, \`s=ln(r/r0)\`, real p,q. At each fixed material χ, p and q are constant **along that history**, though they may vary across the material labels χ. This construction parametrizes **four** real coordinates total. The S3 decomposition is a coordinate/test representation, **not** an extra physical spherical carrier.

Take Planck units c=G=hbar=1; r0 and r have dimensions length, s and p and q are dimensionless. NO value of r0, p or q is inferred from measured cosmic data. No cosmological time assignment is assumed. Set α=β=0 for derivative calculations without loss for Euclidean invariants.

Define \`cχ=cosχ\`, \`sχ=sinχ\` and
\`A=cχ² p²+sχ² q²\`, \`B=cχ² p⁴+sχ² q⁴\`.

Writing \`r=r0 exp(s)\` and primes as d/ds at fixed χ:
- \`|X'|²=r²(1+A)\`
- \`|X''|²=r²(1+2A+B)\`
- \`X'·X''=r²(1+A)\`.

Consequently the EXACT extrinsic Euclidean Frenet curvature of the marked R4 history is

\`kappa_4E= sqrt(|X'|²|X''|²-(X'·X'')²)/|X'|³ = sqrt(A+B)/[r(1+A)]\`.

This is **not** the ambient Riemann scalar and not yet worldtube bending energy. If p=q=0, marked histories are straight rays and κ=0. For nonzero p or q, κ>0. Unlike the earlier illustrative X=(x,y,0,w) path, this is embedded *directly* in the existing \`R4\{0}\` radial/S3 chart.

## 2. Exact curvature decomposition and equal-speed holdout

\`B-A² = cχ² sχ² (p²-q²)²\` exactly, yielding

\`(r kappa_4E)² = A/(1+A) + cχ² sχ² (p²-q²)²/(1+A)²\`.

Thus at a fixed A (fixed squared angular tangent magnitude **relative to logarithmic radial advance**), unequal absolute angular rates add nonnegative curvature. Equality holds for |p|=|q| for interior χ.

For χ=π/4, A=1/4:
- radial only (0,0): rκ=0 and A=0 (separate control);
- p=q=1/2: rκ=1/sqrt(5)=0.447213595499958;
- p=-q=1/2: same rκ (squared curvature is orientation blind);
- p=0, q=1/sqrt(2): rκ=sqrt(6)/5=0.489897948556636.

The three circulating cases have **exactly the same A=1/4** and differ only by distribution and signs of the angular motion. Direct Gram determinants from four-coordinate derivatives were checked at 30 parameter/point combinations.

At χ=π/4, fixed A, B∈[A²,2A²], hence
\`sqrt(A/(1+A)) <= r kappa_4E <= sqrt(A+2A²)/(1+A)\`.
This is a purely geometrical bound, NOT a finite-core failure bound.

Constant p,q generate one global SO(4) isometry on every S3. Hence these curves have κ>0 while the marked 3D section has no *differential* shear. The intrinsic S3 scalar curvature remains 6/r² (only r changes with radial scale). This is fully consistent with the clarification that individual material histories bend in a flat ambient R4.

## 3. Neighbor-material deformation exactly, without invented elasticity

For p=p(χ), q=q(χ), the induced spatial (fixed-s) **material-coordinate** metric is

\`h_s/r² = dχ² + cχ² (dα+s p_χ dχ)² + sχ²(dβ+s q_χ dχ)²\`,

where \`p_χ=dp/dχ\`, \`q_χ=dq/dχ\`.

Compare against rigid motion and the separate isotropic scale factor r(s). In an initially orthonormal spatial material frame, the dimensionless differential deformation gradient is

\`F=[[1,0,0],[a,1,0],[b,0,1]]\`,
with \`a=s cosχ p_χ\`, \`b=s sinχ q_χ\`, and \`ν=sqrt(a²+b²)\`.

The exact principal stretches are

\`σ+ = sqrt(1+ν²/4)+ν/2\`, \`σ0=1\`, \`σ- = sqrt(1+ν²/4)-ν/2\`.

Their product is precisely one: \`det F=σ+ σ0 σ-=1\`. Hence angular differential swirl produces shear **without additional material volume expansion**. The full volume element on an S3 section changes with r³, not with the angular shear. The fields p,q specify an invertible map within each section; this is *material Lagrangian deformation relative to the labels*, not a change in the intrinsic geometry of the unlabelled round S3.

Numerical regression at χ=π/4, s=1, p_χ=q_χ=1: \`ν=1\`, principal stretches \`{1.61803398875, 1, 0.61803398875}\` (a **golden-ratio numerical identity from the chosen ν=1 control**, not a physical constant). Independent finite-difference embedding derivatives give normalized material metric \`[[2,0.5,0.5],[0.5,0.5,0],[0.5,0,0.5]]\` with max error \`2.72e-10\` at h=1e-5.

If a **separately justified** finite-core material model supplies a principal-stretch limit λmax>1, the earliest threshold along the label is

\`|s|_crit=(λmax-λmax^{-1})/sqrt(cos²χ p_χ²+sin²χ q_χ²)\`.

No critical value is selected here. This is a conditional geometrical reach/stretch gate, not proof of tearing, Hagalaz transitions, baryogenesis, gravity or gravitational lensing.

## 4. Orientation: a genuine signed R4 diagnostic

The unsigned curvature κ cannot distinguish (p,q)=(1/2,1/4) from (1/2,-1/4). A separate, smoothly orientation-sensitive four-dimensional **osculating-volume determinant** is available:

\`D = det(X',X'',X''',X'''')\`
\`  = r⁴ cos²χ sin²χ · p q (p²-q²)² (1+p²)(1+q²)\`.

Normalize using Euclidean arclength ℓ along X:

\`P4 = det(dX/dℓ,d²X/dℓ²,d³X/dℓ³,d⁴X/dℓ⁴) = D / |X'|^{10}\`.

Therefore

\`P4 = [cos²χ sin²χ · p q (p²-q²)² (1+p²)(1+q²)] / [r⁶ (1+A)^5]\`.

Units: length^-6. This is a frame-independent oriented pseudoscalar under proper ambient SO(4) rotations, but it changes sign under reflection/reversal of the ambient four-orientation. Its sign is sign(pq) when p,q≠0 and |p|≠|q|. It vanishes for p=0, q=0, or p=±q because the first four osculating derivatives fail to span all four directions. **Vanishing does not imply zero trajectory curvature or no physical chirality.** No conserved topological charge or interaction force is inferred from P4.

At χ=π/4, r=10ℓP:
- (p,q)=(1/2,1/4): \`r⁶ P4=+0.0007060456616\`;
- (p,q)=(1/2,-1/4): \`r⁶ P4=-0.0007060456616\`;
- p=±q, or p*q=0: \`P4=0\`.
Numerically checked against the direct 4×4 determinant of derivatives 1...4.

This diagnostic is a geometric **candidate for comparing oriented histories**, not proof that the Cruller dynamically selects one sign or that an odd-lag stellar-noise correlation uniquely measures it.

## 5. Optical and physical boundaries, failures and next test

1. Neither curvature nor material shear alone supplies a stress-energy constitutive law, optical absorption, Lorentzian ray metric, lensing rate or \`B≈0.24\` prediction.
2. The global identification/return/Klein gluing, finite core and inner-longitude source geometry are not implemented by this local open radial model. The fixture must pass a global closure and physical-history assignment before adoption.
3. Any physical relative speed must be calculated from a specified time/readout; \`A\` is a typed angular-to-log-radial ratio, not automatically laboratory v²/c². A provisional radial Householder comparator would constrain \`A<1\` for timelike paths with dr>0, but that comparator is not the native model's demonstrated causal law.
4. The natural next test is to apply the same family to a **finite-thickness marked core**, calculate normal reach/contact and strain localization near the Cruller's true inner longitude, then derive or reject an interaction response with no ad hoc coefficient. Parallel held-out controls: p=q, p=-q, p²≠q²; p'=q'=0 versus differentially twisted layers; and frozen χ-specific profiles. Require Star-Map independent anchors and holdouts.
5. The source archive's earlier rigid-SO4/no-shear result and the direct "all spatial acceleration bends histories" correction are now explicitly **compatible**, not competing claims.

## Execution and artifacts

Executed local Python file \`/mnt/data/cruller_logradial_material_gate_20261022.py\`, with 30 direct four-coordinate curvature checks, exact algebraic B-A² check, normalized singular-value tests, independent finite-difference embedding metric, and signed 4D derivative determinant checks. Produced two Class P mathematical controls:
- \`/mnt/data/cruller_logradial_material_gate_20261022.png\`: marked 4D projected curves plus principal-stretch family;
- \`/mnt/data/cruller_4d_osculating_chirality_gate_20261022.png\`: signed normalized osculating-volume field in two rates.

Local container assets are **not** automatically GitHub repository assets. The source/script for reproduction is separately committed to the repo where verified; do not infer the PNG is posted to the public site.

**Classification:** source-continuous sandbox geometric theorem and test fixture, not a physical discovery.
