# SANDBOX — finite 4D tube × resolving-hyperplane topology gate

**Status:** `GEN/CANDIDATE`; exact within the declared straight finite-tube fixture. Not canonical theory and not a particle identification.

## Result in one sentence

The previous one-dimensional “closed rim / open patch” model was dimensionally reduced too early: a finite-core worldtube in four ambient dimensions has a three-dimensional normal fiber, so the lateral shell intersects a three-dimensional resolving hyperplane in a **two-dimensional** support—closed (S^2), open cap (D^2), open band (S^1\times I), a degenerate locus, or nothing.

## Sources actually read

### Historical SAT archive

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/RMS Spacetime Filaments.txt`, complete file, 67/67 source lines (content is duplicated once inside the file). Recovered the old construction: a four-dimensional filament intersects a propagating three-dimensional time surface; local particles are intersectional manifestations; composite structure is assigned to braiding/intertwining. The force and particle assignments are historical source claims, not imported results. `⟦SRC:RMS-SPACETIME-FILAMENTS·EOF⟧`
2. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT-O Theory Work/SATCoMast v2.txt`, complete file. Recovered the strict-4D, explicit-definition, programmatic-validation discipline. Its proposed emergent particle/gauge mappings remain historical research instructions. `⟦SRC:SATCOMAST-V2·EOF⟧`

### Current H(s)H repository

1. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/WORKING_GROUP_1.txt`, complete file, 384/384 lines. Recovered the Worldtube Lab chain “finite core → persistent coil → finite-timesheet intersection → measurable consequence,” Packet 001’s (B^3/B^2/S^2) hierarchy, and Packet 002’s finite-core tangency law. The channel repeatedly labels itself a construction bench rather than theory authority. `⟦SRC:HSH-WG1-30SEP·1–384⟧`
2. `Satobloc/HsH/WORKSPACES/WORLDTUBE_LAB/FINITE_CORE_TANGENCY_PACKET_002.md`, complete file, 417/417 lines. Recovered the signed-distance intersection scaffold, relative curvature (A_{\rm rel}), the (B^3/S^2/B^2) dimension split, and the warning that kinematic intersection alone supplies no constitutive law or particle identity. `⟦HSH:FC-TANGENCY-002·1–417⟧`

### Retrieval note

The shared `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` slot remained owned by request `2026-10-10-orson-one-drop-universe-math-001`; it was not overwritten. Its completed three-repository result bundle was checked and is specific to ONE DROP. It did not supply this finite-tube query, so exact direct-source reading followed after that check.

## Source fact → inference → sandbox boundary

- **Source fact (`SRC/HISTORICAL`):** old SAT represents a particle as filament/time-surface intersection.
- **Source fact (`SAT/ACTIVE` scaffold):** current finite-core work replaces the centerline by a positive-extent normal fiber and distinguishes bulk (B^3), boundary (S^2), and selected support (B^2).
- **Inference (`GEN/DERIVED` in this fixture):** a full four-dimensional finite tube intersected by a three-dimensional hyperplane does not generically produce a one-dimensional rim. The lateral-shell support is two-dimensional.
- **Sandbox conjecture (`GEN/CANDIDATE`):** topology change of that support may act as a mechanical state-rank gate, but only after a constitutive surface energy is independently justified.

## Local symbol table

All symbols below are `LOCAL:FINITE-TUBE-SHEET-TOPOLOGY`.

| Symbol | Meaning | Units |
|---|---|---:|
| (z) | arclength-like coordinate along the straight tube axis | (L) |
| ((x_1,x_2,x_3)) | coordinates in the three-dimensional normal fiber | (L) |
| (a) | normal-fiber radius | (L) |
| (L_z) | finite modeled axial support length | (L) |
| (\iota) | resolving-hyperplane tilt from the tube-axis normal | 1 (rad) |
| (d) | signed hyperplane offset | (L) |
| (u=x_1/a) | normalized sphere latitude | 1 |
| (A_s,D_s,\eta_s) | surface restoring coefficient, surface-bending coefficient, surface viscosity | typed by the energy/rate equations below |

No historical raw `theta_4` is reused.

## Explicit four-dimensional geometry

Use local Euclidean coordinates ((z,x_1,x_2,x_3)). The finite tube bulk and its lateral shell are

\[
\mathcal T=\left\{|z|\le \frac{L_z}{2},\;x_1^2+x_2^2+x_3^2\le a^2\right\},
\]

\[
\partial_{\rm lat}\mathcal T
=\left\{|z|\le \frac{L_z}{2},\;x_1^2+x_2^2+x_3^2=a^2\right\}.
\]

The resolving hyperplane is

\[
\Sigma_{\iota,d}:
\cos\iota\,z+\sin\iota\,x_1=d.
\]

For (cos\iota\neq0), eliminate (z):

\[
z(u)=\frac{d-a\sin\iota\,u}{\cos\iota},
\qquad -1\le u\le1.
\]

The finite axial condition becomes

\[
|d-a\sin\iota\,u|
\le \frac{L_z}{2}|\cos\iota|.
\]

Define

\[
m=\frac{L_z}{2}|\cos\iota|,
\qquad b=a|\sin\iota|.
\]

Then the allowed latitude interval is

\[
I_u=\left[\frac{d-m}{b},\frac{d+m}{b}\right]\cap[-1,1]
\quad (b>0).
\]

This gives the exact topology classifier:

| Condition | Lateral-shell intersection |
|---|---|
| (|d|+b\le m) | complete closed (S^2) |
| (I_u) clips one pole only | cap (D^2), one boundary circle |
| both endpoints of (I_u) lie inside ((-1,1)) | band (S^1\times I), two boundary circles |
| (|d|-b>m) | no intersection |
| equality cases | degenerate contact |

At (iota=0), the result is a full (S^2) whenever (|d|\le L_z/2). At (iota=\pi/2) and (|d|<a), the support is the axial cylinder (S^1\times I); the formula above must be taken by its topology limit because (z(u)) is then undefined.

## Numeral-by-numeral fixture

Set

\[
a=0.25,qquad L_z=1.
\]

### Closed support

For (iota=30^\circ,d=0.10),

\[
b=0.25\sin30^\circ=0.25(0.5)=0.125,
\]

\[
m=\frac12\cos30^\circ
=0.5(0.8660254038)=0.4330127019.
\]

Therefore

\[
|d|+b=0.10+0.125=0.225
<0.4330127019=m,
\]

so the support is the complete closed (S^2).

### One-boundary cap

For (iota=60^\circ,d=0.30),

\[
b=0.25(0.8660254038)=0.2165063509,
\qquad m=0.5(0.5)=0.25,
\]

\[
I_u=\left[
\frac{0.30-0.25}{0.2165063509},
\frac{0.30+0.25}{0.2165063509}
\right]\cap[-1,1]
=[0.2309401077,1].
\]

This is a cap (D^2), not a one-dimensional cantilever.

### Two-boundary band

For (iota=75^\circ,d=0),

\[
b=0.25(0.9659258263)=0.2414814566,
\]

\[
m=0.5(0.2588190451)=0.1294095226,
\]

\[
I_u=[-m/b,m/b]
=[-0.5358983849,0.5358983849].
\]

This is an open band (S^1\times I). Its retained coordinate-area fraction on the fiber sphere is

\[
\frac{|I_u|}{2}=0.5358983849.
\]

For a centered hyperplane (d=0), the closed-to-band transition occurs when

\[
a\sin\iota_c=\frac{L_z}{2}\cos\iota_c,
\]

\[
\tan\iota_c=\frac{L_z}{2a}
=\frac{1}{2(0.25)}=2,
\]

\[
\boxed{\iota_c=\arctan2=63.4349488229^\circ.}
\]

No constant or particle label was used to choose this angle; it follows only from the declared aspect ratio.

## Natural boundary terms at the corrected support dimension

Let (h) be a scalar deformation on the two-dimensional support (S\subset\Sigma_{\iota,d}\). The direct surface generalization of the previous fourth-order trial is

\[
E[h]=\frac12\int_S
\left(A_s h^2+D_s(\Delta_S h)^2\right)dA.
\]

Twice integrating by parts gives

\[
\delta E
=\int_S\left(A_s h+D_s\Delta_S^2h\right)\delta h\,dA
+D_s\oint_{\partial S}
\left[(\Delta_Sh)\partial_\nu\delta h
-\partial_\nu(\Delta_Sh)\delta h\right]ds.
\]

Therefore:

- closed (S^2): (partial S=\varnothing), so no endpoint/boundary fixture exists;
- free cap or band: (\Delta_Sh=0) and (\partial_\nu\Delta_Sh=0) on every boundary circle;
- clamped circle: (h=0) and (\partial_\nu h=0);
- one boundary clamped and one free is possible only for the band, and is an added constitutive attachment—not a fact supplied by intersection geometry.

This last point rejects the previous habit of labeling an open patch “cantilever” from its shape alone.

## Spectrum and the topology-switch discriminator

On a closed sphere of radius (a),

\[
-\Delta_{S^2}Y_{\ell m}
=\frac{\ell(\ell+1)}{a^2}Y_{\ell m},
\]

so for overdamped dynamics

\[
\eta_s\partial_\tau h
=-A_sh-D_s\Delta_{S^2}^2h,
\]

the rates are

\[
r_\ell=\frac{A_s}{\eta_s}
\left[1+\frac{D_s}{A_sa^4}\{\ell(\ell+1)\}^2\right],
\]

with multiplicity (2\ell+1). The uniform mode (ell=0) is unique. The first gap is

\[
\frac{r_1}{r_0}=1+4\frac{D_s}{A_sa^4}.
\]

Hence a 10-fold gap requires

\[
1+4\frac{D_s}{A_sa^4}\ge10
\quad\Longrightarrow\quad
\boxed{\frac{D_s}{A_sa^4}\ge\frac94=2.25.}
\]

For the unfitted test (D_s/(A_sa^4)=2.5),

\[
r_0=1,quad r_1=1+2.5(2)^2=11,
\]

\[
r_2=1+2.5(6)^2=91,quad
r_3=1+2.5(12)^2=361
\]

in units (A_s/\eta_s), with multiplicities (1,3,5,7).

For a free cap or band, however, every harmonic function satisfying

\[
\Delta_Sh=0
\]

also satisfies both natural free-boundary conditions and has zero bending energy. On a two-dimensional domain with boundary, boundary data generate infinitely many harmonic functions. Consequently this exact operator has an **infinite-dimensional slow sector** at rate (A_s/\eta_s), not merely the two affine slow modes found in the earlier one-dimensional reduction.

Thus the topology switch is sharper than the rim model suggested:

\[
\text{closed }S^2:
\text{ one uniform slow coordinate}
\quad\longrightarrow\quad
\text{open free support}:
\text{ infinitely many equal-rate harmonic coordinates}.
\]

This is conditional on the trial energy ((\Delta_Sh)^2). A tension term (B_s|\nabla_Sh|^2), a full plate/Helfrich constitutive law, boundary anchoring, or anisotropy can lift this degeneracy and must be tested separately.

## Concrete discriminator / tight prediction candidate

For a controlled numerical tube of known (a/L_z), tilt the resolving hyperplane at fixed (d=0) without changing material coefficients.

1. The support must remain closed until
   
   \[
   \iota_c=\arctan\frac{L_z}{2a}.
   \]
2. Immediately beyond (iota_c), it becomes a two-boundary band.
3. Under the declared Laplacian-squared constitutive trial, the isolated uniform-mode gap must collapse when the boundary appears.

This is a geometry-first solver prediction; it is not yet an empirical particle prediction.

## Failure conditions

Reject or repair this fixture if any of the following holds:

1. the worldtube has no finite axial/material support scale (L_z); an infinite straight tube cut by a plane does not generate the same closed/open gate;
2. the operative carrier is bulk (B^3), an interior sheet, or an anisotropic material support rather than the lateral (S^2) shell used here;
3. the resolving structure is curved or thick enough that a hyperplane is not a controlled local approximation;
4. the contact energy is not a scalar surface energy or contains indispensable tension, shear, director, topology, or nonlocal terms;
5. numerical refinement fails the exact classifier or closed-sphere spectrum;
6. the physical coupling does not load the uniform closed-support mode.

The most important current vulnerability is item 1: the finite axial length is a modeling input, not a result of old SAT. Without an independently generated axial localization mechanism, “open patch” morphology is not yet earned.

## Reproducible artifacts

Verification performed: 5,000 seeded random ((\iota,d)) cases were compared against a direct 20,001-point latitude feasibility scan; existence mismatches were (0/5000). The four declared example topologies and the (63.4349488229^\circ) transition are asserted in code. JSON syntax was independently parsed after generation.

- `WORKSPACES/RAVEL/CODE/finite_tube_sheet_topology.py`
- `WORKSPACES/RAVEL/DATA/finite_tube_sheet_topology.json`
- `WORKSPACES/RAVEL/FIGURES/finite_tube_sheet_topology.svg`

## Next cursor

Add the smallest nondegenerate open-support repair,

\[
E_{\rm repair}[h]
=\frac12\int_S
\left(A_sh^2+B_s|\nabla_Sh|^2+D_s(\Delta_Sh)^2\right)dA,
\]

derive its mixed natural boundary conditions on the exact cap/band domains, and compute the first two rates versus (\iota) across (iota_c). Compare: free/free band, one-circle clamped band, and cap. Do not assign particle identity or fit an inherited angle.
