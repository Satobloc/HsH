# Calder s3 — Kerr radial branch gate for the positive-lapse throat question

Status: GEN/DERIVED sandbox control. Source-grounded reconstruction; not authenticated historical Calder participation, BEDROCK, an H(s)H Kerr/ER identification, or established physics.

## Controls and continuity

Rotation: `h=225`, `seq=1128`, `seq mod 19=7`: Calder; next Hale.

Live `BEDROCK.md` was fetched completely at blob `a04d72b19bcc902aff9fbe6a0d1389052c078521` (46,072 fetched characters); `STATE_OF_THE_THEORY.md` was fetched completely at blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9` (11,012 characters). BR-000..007, OC-001/002 and ND-2026-10-18-01/03/05/06/07 control. The occupied `MERSEARCH_REQUEST.json` (blob `255cfceaf82fb82eb4b39dfc620a8c6fb715ed94`) belongs to Ravel and was not overwritten; ordinary search fallback was therefore recorded and used.

Aster's preceding publication is verified: issue #170, commit `c45c6b376947b79c788ba68f125234b8d4978e26`, published SHA-256 `3fa1c521c661a95067d022af8c081938b7cb6b4e4658d1ac6ccc86468f963b23`.

Calder's inbox was read completely at blob `fe184dbb48e18e3432d8e273abe62a0d991ba92e`; its latest entries concern statistical identifiability, not this geometry. The worker-method fit here is an independent representation/slice audit.

## Source recovery

The operative historical HsH source is `WORKSPACES/WORLDTUBE_LAB/KERR_SHELL_GEOMETRY_PASS_2026-09-16.md`, dated 2026-09-16, blob `f4c34c0adc5809c064cbca17499baa2b575dbd05`. Verbatim original equations retained:

```text
a=J/(mc), J=hbar/2
x=sqrt(r^2+a^2) sin(theta) cos(phi)
y=sqrt(r^2+a^2) sin(theta) sin(phi)
z=r cos(theta)
A=sqrt(r^2+a^2), C=|r|
E=r^2+a^2 cos^2(theta) equiv Sigma
k_theta=AC/E^(3/2)
k_phi=C/(A sqrt(E))
A_K(r)=k_theta/k_phi=A^2/r^2=1+a^2/r^2
```

The source explicitly says coordinate-shell geometry supplies no material tension law. `WORKSPACES/RAVEL/KERR_PARTICLE_REGIME_COLLISION_2026-09-16.md`, blob `8bc65c97e88afd9c7e6add7386574c0eea3492b9`, additionally shows that the ordinary electron-like Kerr/Kerr-Newman control is over-extreme and has no horizon or ergosurface. `WORKSPACES/MERCER/2026-10-09_KERR_ER_SLAB_INHERITANCE_AND_ARCHIVE_PASS.md`, blob `5897b90a2eb4b673bb32dc5fc5e6b4ef22b58836`, classifies the Kerr/ER core as tentative and demands an explicit finite-core construction.

## Random substantial reading

An executed `random.Random(225)` draw from a declared seven-file archive pool selected root `00 PROPER DIMENSIONALITY .txt`. It was fetched completely: 74,109 characters; archive blob `e4836ca1f57e9da5996cf1eaad10ee436e49545a`. Honest takeaway: the source contains Nathan-directed program choices interleaved with assistant extrapolations and typographically damaged formulae. Its current relevance is protected by ND-2026-10-18-01, but claims such as mandatory 24-cell carriers or automatic GR/QM resolution cannot be imported without passage-specific audit. Nothing from it is used to manufacture the Kerr result below.

## Radial coefficient gate

Use standard Kerr only as a comparison geometry, in geometrized length units:

\[
\Sigma=r^2+a_K^2\cos^2\theta,\qquad
\Delta=r^2-2Mr+a_K^2,\qquad
g_{rr}=\frac{\Sigma}{\Delta}.
\]

For `|a_K|<M`, let `b=sqrt(M^2-a_K^2)` and

\[
r_\pm=M\pm b,\qquad \Delta=(r-r_+)(r-r_-).
\]

Hence `Delta` is positive outside `r_+`, negative between roots, and positive inside `r_-`. At either root, `g_rr` diverges while `g^{rr}=Delta/Sigma` vanishes. This is not the finite positive diagonal lapse `N(0)>0` required by Aster's SO(4)-symmetric throat metric. A horizon-penetrating coordinate system may regularize the coordinate singularity by introducing time-radial cross structure, but that is a different slicing and does not derive the SO(4) throat lapse.

At the equator, `Sigma=r^2`. For nonextremal `0<=a_K<M`, the proper radial distance from `r_+` to `r_++L` is exactly

\[
\ell_{\rm nonext}(L)=
\sqrt{(b+L)^2-b^2}+M\operatorname{arcosh}\!\left(\frac{b+L}{b}\right).
\]

The omitted distance from `r_+` to `r_++delta` is

\[
\ell_{\rm omit}(\delta)
=\frac{2r_+}{\sqrt{r_+-r_-}}\sqrt{\delta}+O(\delta^{3/2}),
\]

so the nonextremal horizon lies at finite proper radial distance on this slice even though `g_rr` diverges.

For extremal `a_K=M`, `Delta=(r-M)^2` and

\[
\ell_{\rm ext}(\delta,L)
=(L-\delta)+M\log(L/\delta),
\]

which diverges logarithmically as `delta -> 0+`. For `|a_K|>M`, completing the square gives

\[
\Delta=(r-M)^2+(a_K^2-M^2)>0,
\]

so there are no real Kerr horizons. These three branches are mathematically distinct and cannot be silently merged into one finite-core throat.

Dimensions: `[M]=[a_K]=[r]=L`, `[Sigma]=[Delta]=L^2`, `[g_rr]=[g^rr]=1`, `[ell]=L`.

## Executed fixture

Parameters: `M=1 m`, `a_K=0.8 m`, `theta=pi/2`, so `r_+=1.6 m`, `r_-=0.4 m`.

```text
delta_r[m]      Delta[m^2]       g_rr[1]        g^rr[1]
   1.0e-01  1.30000000e-01  2.22307692e+01  4.49826990e-02
   1.0e-02  1.21000000e-02  2.14223140e+02  4.66802978e-03
   1.0e-03  1.20100000e-03  2.13422231e+03  4.68554749e-04
   1.0e-04  1.20010000e-04  2.13342222e+04  4.68730469e-05
Delta signs (r<r-, r-<r<r+, r>r+) = [1.0, -1.0, 1.0]
nonextremal ell(r+ -> r+ + 0.1 m) = 0.930173227583 m
cutoff[m]   omitted_nonext[m]   omitted/sqrt(cutoff)
  1.0e-02    2.9232155679e-01         2.92321556794
  1.0e-04    2.9212072594e-02         2.92120725938
  1.0e-06    2.9211871763e-03         2.92118717626
  1.0e-08    2.9211869807e-04          2.9211869807
predicted sqrt-law coefficient = 2.92118697336 sqrt(m)
cutoff[m]   extremal_distance[m]   distance/ln(L/cutoff)
  1.0e-02          2.39258509299             1.03908650337
  1.0e-04          7.00765527898             1.01446200625
  1.0e-06           11.612924465             1.00868580278
  1.0e-08           16.218095641             1.00620420626
superextremal a=1.2 m: min Delta=0.44 m^2; real horizons=0
assertions: roots/signs/asymptotics/superextremal = PASS
```

Python SHA-256: `01e2eaeeaed5159719989124e298ca38b16a7da92a048c7e2b834d95225b0f71`. Plot SHA-256: `bfa9db9c69f29933d77ac7f9e88884b8d4909f9c83e28c716c34e67557245877`. Lean source SHA-256: `d8e7536c6e177e197ff0fdd82d2d058d900c916722838ad979f0678728141d5f`; Lean was unavailable, so the formal file is uncompiled.

## Verdict and discriminator

Basic algebra, dimensions, signs, limits and numerics pass. The correction is not to a historical equation but to a possible inference: **standard Kerr radial structure does not supply the independent finite positive SO(4) lapse.** Nonextremal, extremal and superextremal branches behave differently; the electron-like sourced control is superextremal. A proposed H(s)H finite core must independently specify a nondegenerate metric/worldvolume and show how its lapse/cross terms arise. Kerr resemblance alone is not an ER proof.

No CODATA verification is entered: this gate produces no independent dimensionful prediction and uses no untuned empirical holdout. BEDROCK remains unchanged.

Hale handoff: test a finite-core regularization `Delta -> Delta+lambda^2` (or a sourced alternative) for signature, curvature and the `lambda->0` limit; do not identify `lambda` with `a_K`, `epsilon`, or `R_coil` without an independent relation.
