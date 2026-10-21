# Meridian | Cruller second-order helical onset: a native 4D null-control | 2026-10-21

**SANDBOXED / negative result for one carefully declared perturbation family.** Do not promote to a universal no-go theorem for H(s)H second-order winding. Planck convention `c=hbar=G=1`; coordinates `R,a` measured in Planck lengths, physical tension `T/F_P`, bending modulus `B/(E_P*l_P)`, energy `E/E_P`.

## Source inheritance (not imported as current dynamics)

Recovered `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/GRQM.txt`, `Interconn.txt`, `SAT-GIGAPACK.txt` describe a bending term `(kappa/2)|H''(lambda)|²`, and the latter two additionally discuss longitudinal tension. They do not consistently identify `lambda` as physical arclength or `kappa` as SI bending rigidity. Here the **arclength curvature-squared elastic energy is an explicit comparison functional**, not a claim to be the same action as the NLM source and not a new adopted SAT constitutive equation:
```text
E[X] = T L[X] + (B/2) ∮ kappa[X]^2 ds.
```
B has units energy×length. Neither B nor the user-remembered historical maximal bending energy has been recovered as a verified numerical constitutive input. This test asks whether nonnegative T,B by themselves cause second-order winding.

## Exact parent on S3 in native R4
```text
C(u)=(cos2u,sin2u,cos3u,sin3u)/sqrt2 ; u in [0,2pi).
L0/R=2*pi*sqrt(13/2)=16.01904224441409;
R*kappa0=sqrt(194)/13 = 1.071414482860317;
(R/B)*E_bend0=9.194361524900396.
```
At each C, the following explicit smooth perpendicular unit normals are tangent to S3 (n1/n2 below):
```text
N1=(cos2u,sin2u,-cos3u,-sin3u)/sqrt2
E1=(-sin2u,cos2u,0,0); E2=(0,0,-sin3u,cos3u)
N2=(3 E1-2 E2)/sqrt13.
```
The genuine secondary transverse helical test mode is
```text
V_m(u)=cos(mu) N1(u)+sin(mu) N2(u)
X_(a,m)(u)=R*[C(u)+(a/R)V_m(u)]/sqrt(1+(a/R)^2).
```
This is an **actual nontrivial 4D path on the same S3**, not a global rigid rotation of all the material. It is a recursive coil of the existing path in its native transverse S3 tangent plane; it does not imply material reconnection, a changing braid degree, or a physical timesheet mechanism.

## Computation

Run `cruller_order2_20261021.py` (Python/NumPy). It uses 8192 uniform periodic points and **spectral Fourier first and second derivatives**, evaluates arclength and exact ambient curvature from general parametrization (tangential acceleration removed), central finite differences in dimensionless daughter amplitude h=0.0005 for the second variations. Baseline matches independently derived parent formula within 1e-9.

For `m=1..14`, BOTH `d²(L/R)/d(a/R)²` and `d²[(R∮kappa² ds)]/d(a/R)²` are strictly positive in this family:
```text
m   d²(L/R)    d²(R*I2)     -(d²(R*I2))/(2*d²(L/R))
1   11.694511    11.706547     -0.500515
2   30.687634   118.246743     -1.926619
3   54.609688   381.055317     -3.488899
4   83.460668   888.459367     -5.322623
5  117.240573  1746.984694     -7.450427
6  155.949398  3081.355628     -9.879344
7  199.587139  5034.494806    -12.612273
8  248.153790  7767.522925    -15.650623
9  301.649346 11459.758467    -18.995165
10 360.073801 16308.717385    -22.646354
11 423.427148 22530.112762    -26.604474
12 491.709380 30357.854437    -30.869713
13 564.920489 40044.048604    -35.442199
14 643.060467 51858.997370    -40.322023
```
The first amplitude variations of L and I2 were also numerically zero for all tested m to the displayed precision. Thus for `T>=0,B>0`, `d²E/d(a/R)² = T R*d²(L/R) + (B/(2R))*d²(R I2)>0` for this tested family. **Positive ordinary tension and bending cost do not destabilize the (2,3) parent into these daughter helices**. Pure positive bending alone also does not select a finite daughter amplitude here. Do NOT infer that all transverse perturbations have positive Hessian or that every physical regime is stable. The apparent negative `T/B` threshold numbers above are algebraic sign checks, not physical predictions; normalized `T R²/B` is dimensionless.

The native 4D construction is displayed via an ordinary 3-of-4-axis projection in `/mnt/data/cruller_order2_candidate_20261021.png`, explicitly labeled as projection.

## Geometric / model control

- This sweep fixes the containing S3 radius R, varies daughter amplitude; does **not** hold total length constant, conserve material twist/link or imposed angular momentum, nor model axial compression or contact. The tension term is positive; an imposed compression or conserved linking invariant can materially change the Hessian.
- A real transition requires an independently justified constraint and **constrained** second variation (Hessian on allowed perturbations), not claiming winding spontaneously occurs because high curvature seems likely.
- Finite core requires `a_core < reach(X_(a,m))` and local `a_core*kappa_max<1`; these tests were not re-run for daughter configurations yet.
- The old `L=(kappa/2)|H''|²` NLM action uses an untyped parameter; its 4th order Euler-Lagrange stationarity does not by itself guarantee a stable two-frequency superhelix.
- A meaningful next inverse step: specify conserved native material twist/holonomy or actual 4D angular momentum and its boundary conditions, then calculate constrained second variation. Its stored energy source must be explicit, with Planck units and CODATA comparisons only as holdouts. It must retain proper distinction between one-tube higher-order winding and multi-tube braid degree.

**Verdict:** precise null control for the guessed 'tension + positive bending energy automatically creates second-order winding' premise. Something else must drive the daughter mode, or another mode/constraint family must be examined. No current BEDROCK change.

Repository original calculation notes: `SANDBOX_2026-10-21_NLM_BENDING_ENERGY_RECOVERY.md`, `SANDBOX_2026-10-21_CRULLER_PLANCK_REACH_CONTACT_GATE.md`. Shared Mersearch request remained occupied by Orson and was not overwritten.

Meridian (assistant research).
