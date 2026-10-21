# Meridian | Cruller geometric reach and Planck-unit contact gate | 2026-10-21

**SANDBOX.** Exact geometric result for a specified finite-core (2,3) winding on a round S3 in flat native R4. It is NOT a dynamical result, an adopted physical material thickness, the claimed historical maximum bending energy, particle production, a Kerr result, or a general theorem for all twisted Klein fabrics. BEDROCK ND-2026-10-21-01 requires Planck units first.

## Historical/source status
Mersearch-first BR-007 checked: shared `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` still belonged to Orson's earlier work, `2026-10-20-orson-braid-smoothing-q-rules-001`; do not overwrite it. Current accessible direct source comparison previously identified `SAT_THEORY_ARCHIVE_2023-25/SAT METRICS — Basic.txt` reporting `T=1.2e44 N`, `epsilon=2e-21 m`, `l_f=0.7937 fm`, and `SAT_THEORY_ARCHIVE_2023-25/Dim.txt` reporting a historical candidate `kappa_max~1/(2*l_0)`. Recent `WORKSPACES/WORLDTUBE_LAB/KERR_SHELL_GEOMETRY_PASS_2026-09-16.md` explicitly disallows promoting tension into current accepted mechanics without a constitutive derivation. **The specifically recalled maximum bending ENERGY calculation has NOT been located and reproduced.** The present result is a new rigorous GEOMETRIC reach calculation, not a substitute for that history. Historical numbers below are only dimensionless test inputs.

## Planck convention
`c=hbar=G=1`, keeping dimensions labeled; `l_P=sqrt(hbar G/c^3)=1.61625502393e-35 m`, `E_P=sqrt(hbar c^5/G)=1.9560816361e9 J`, `F_P=c^4/G=1.21025556434e44 N`. For the historical T, `T/F_P=0.99152611676`. The energy per length is in units `E_P/l_P`, NOT `E_P`.

## Native four-dimensional contact geometry: exact curve
Let `R>0` be the S3 radius measured in Planck lengths (`R/l_P` dimensionless). Define the embedded closed (2,3) centerline
```text
X(u)=R/sqrt(2) * (cos(2u),sin(2u),cos(3u),sin(3u)), u in [0,2pi).
```
As a curve in Euclidean R4 it has
```text
|X'|²=13 R²/2.
kappa= sqrt(194)/(13 R) =1.071414482860317/R.
rho_local =1/kappa = (13/sqrt(194))*R =0.9333456062030595 R.
L=2pi sqrt(13/2) R.
```
The ambient-distance chord for parameter separation `D` is
```text
d²(D)/R² =2-cos(2D)-cos(3D).
```
A doubly critical chord has `d/dD d²(D)=2 sin(2D)+3 sin(3D)=0`. Apart from `D=pi`, the cosine roots are `cos(D)=(-1 +/- sqrt(10))/6`. Evaluate half-chord distances:
```text
cos(D)=(-1+sqrt(10))/6: d/(2R)=0.9531758640426059 (local maximum);
cos(D)=(-1-sqrt(10))/6: d/(2R)=0.5682756845828554 (local minimum);
D=pi: d/(2R)=0.7071067811865476.
```
By the thickness/reach formula for a smooth embedded Euclidean curve, the radius of the largest embedded **normal Euclidean disk bundle** around the centerline is bounded by both the minimum local curvature radius and the half minimum doubly critical self-distance:
```text
reach(X)=min(0.93334560620 R,0.56827568458 R)
        =0.56827568458 R.
```
**Nonlocal strand-to-strand approach, not local maximum curvature, is the first obstruction for this fixture**. At equality normal disk neighborhoods touch; use strict `a/R<0.56827568458` for disjoint interior. This is a normal-tube embedding result in ambient R4 and **does not assert** that two physical worldtubes collide merely by having near centerlines; the physical core and simultaneity mapping remain to be specified.

## Source-typed historical comparison
If (only if) the historical `epsilon=2e-21 m` is a tube **radius** and historical coil `R=0.7937 fm` refers to this S3 winding scale, then
```text
a/l_P=1.2374284815144458e14,
R/l_P=4.910734928890078e19,
a/R=2.5198437696862795e-6,
reach/R=0.5682756845828554.
```
The test fixture is far from geometric self-contact. It could attain contact only by reducing its scale to `R/l_P≈2.177514391492545e14` at fixed core radius, growing the physical core, or changing its winding geometry. **Nothing in the differential twisting map as originally stated automatically forces any of these**. If the historical epsilon is a diameter, substitute `a=epsilon/2`.

## Bending energy: what is and isn't established
For a classical curve with **independently derived** bending rigidity `B` (units J*m or E_P*l_P), the *conditional* quadratic-elastic comparator is
```text
E_bend = (B/2) int kappa² ds
       = 9.194361524900396 * B/R
```
for this exact uniform-curvature curve. In Planck-unit ratios,
```text
E_bend/E_P =9.194361524900396*(B/(E_P*l_P))/(R/l_P).
```
**B has NOT been derived**, so this is not a numerical prediction or an extra force law to adopt. The pure geometry has NO absolute maximum bending energy. Even a local curvature cap `kappa<=1/a` only yields `E_bend <=B*L/(2a²)` **if a quadratic bending law and finite total length L are separately justified**.

A separate possible kinematic radius bound from angular momentum and finite energy is `r >= |J| c/E` under the correct orbital-angular-momentum assumptions; intrinsic spin alone cannot automatically be turned into this centerline bound.

## Discriminator / next inverse Cruller step
The strongest immediate answer is a three-way separation:
1. local curvature failure: `a*kappa >=1`;
2. global normal-tube self-contact: `a>=reach`, FIRST for the fixed (2,3) case;
3. mechanical failure or branch: not determined by geometry without physical constitutive, energetic and causal assumptions.

Vary the CRULLER'S ACTUAL twist/anisotropy and core deformation, calculate its global reach and local curvature, then check whether the source-derived historical bending-energy ceiling is reached first. Keep the Forest native physical-path rule and no unsourced particle creation.

## Execution
Local file `cruller_reach_planck_20261021.py` calculated the exact analytic candidates, independent numerical root checks, unit ratios and optional B energy coefficient. First numerical check erroneously assumed every critical chord was a minimum; corrected to a root/stationarity check and reran. All final assertions PASS. This .py file exists in conversation sandbox, not claimed to be committed to GitHub.

Meridian (assistant-authored).
