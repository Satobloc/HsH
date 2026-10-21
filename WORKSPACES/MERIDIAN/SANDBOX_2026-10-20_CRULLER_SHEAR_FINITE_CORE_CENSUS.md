# Meridian | Cruller first: native S3 material shear, finite-core census and return gate | 2026-10-20

**Status: SANDBOXED assistant derivation, not adopted SAT field dynamics and not proof of cosmobarygenesis.** This continues [Cruller first](SANDBOX_2026-10-20_CRULLER_FIRST_GLOBAL_TOPOLOGY.md), guided by BEDROCK BR-008/ND-2026-10-20-01/02 and Forest physical-path premise. **Do not substitute older Back Hallways physics.** Primary goal: derive what twisting the complete Cruller *actually* implies before interpreting any 3D particle-like slice. No historical archive genealogy required for these independently constructed examples.

## 1. Globally smooth native shear in C2 / S3

Take `S3_R = {(z1,z2): |z1|^2+|z2|^2=R^2}` with Hopf coordinates
```
z1=R*cos(chi)*exp(i*alpha), z2=R*sin(chi)*exp(i*beta).
```
Define the explicitly SMOOTH global map
```
Phi_t(z1,z2)=(
    z1*exp(i*kappa*t*|z2|^2/R^2),
    z2*exp(i*kappa*t*|z1|^2/R^2)
)
```
with arbitrary real imposed test rate `kappa` and dimensionful test time `t`. In angular coordinates this is
```
chi->chi,
alpha->alpha+kappa*t*sin(chi)^2,
beta->beta+kappa*t*cos(chi)^2.
```
The use of `|z1|^2,|z2|^2` makes Phi globally defined even at Hopf-chart angular degeneracies. The inverse is `Phi_-t` because the magnitudes are invariant, and `Phi_t o Phi_u=Phi_(t+u)`. So it is a one-parameter family of genuine global diffeomorphisms, not a pinched model or candidate material reconnection. In the stereographic 3D projection, an apparent crossing is not automatically a native-space intersection.

The round reference spatial metric is `h0=R^2[dchi^2+cos^2(chi)dalpha^2+sin^2(chi)dbeta^2]`. Material (Lagrangian-label) pullback is EXACTLY
```
h_t=R^2 {
 [1+t^2(cos^2(chi)*p'(chi)^2+sin^2(chi)*q'(chi)^2)] dchi^2
 + cos^2(chi)*dalpha^2 + sin^2(chi)*dbeta^2
 + 2t*cos^2(chi)*p'(chi)*dchi*dalpha
 + 2t*sin^2(chi)*q'(chi)*dchi*dbeta
},
p=kappa*sin^2 chi, q=kappa*cos^2 chi.
```
The material volume Jacobian is ONE, and `det(h_t)=det(h0)=R^6*sin^2(chi)*cos^2(chi)` in the regular Hopf-coordinate domain. However the *intrinsic scalar curvature* of h_t is still the CONSTANT `6/R^2`, because `h_t=Phi_t^*h0`; no new gravitational dent exists in the unlabeled round space. This is the exact distinction between **material strain** and **intrinsic geometry**.

In reference orthonormal material basis, deformation gradient is a simple 3D shear `F=[[1,0,0],[A,1,0],[B,0,1]]` with `A=t*cos(chi)*p'(chi)`, `B=t*sin(chi)*q'(chi)`, `K^2=A^2+B^2=(kappa*t)^2*sin(2chi)^2`. Its three principal stretches are
```
lambda_plus=(sqrt(4+K^2)+|K|)/2
lambda_minus=(sqrt(4+K^2)-|K|)/2
lambda_3=1; product=1.
```
At `chi=pi/4`, `kappa*t=1`, the ratio is `(1+sqrt(5))/2` and inverse; golden-ratio appearance is a dimensionless shear-matrix identity, NOT a special SAT constant. With ongoing stationary differential twist, K grows and so does material stretch, unless there is relaxation, untwisting, rearrangement or changing dynamics. There is **no force, stress, dissipation or heat without a separately established material constitutive/transport law**. Do not import arbitrary tension/viscosity to make the donut fry.

## 2. Return gate: a steady nonrigid twist cannot exactly reset material labels

For the more general stationary swirl `Phi_t=(chi,alpha+t*p(chi),beta+t*q(chi))`, suppose the *same labeled material state* returns after finite `T>0`, or returns up to a rigid fixed angular offset `(alpha0,beta0)` independent of chi. Then `Tp(chi)=alpha0 mod 2pi`, `Tq(chi)=beta0 mod 2pi` for every chi in the connected open interior. Since p,q are continuous, their integer winding corrections are constant: `p'(chi)=q'(chi)=0`. **Exact global material recurrence at common period T and perpetual stationary differential shear are incompatible within this ansatz.**

This obstruction is not an impossibility theorem for cyclic cosmology: a materially nonidentical mapping-torus return, time-varying twist that later reverses, strand rearrangement, actual reconnection, a return map with nontrivial material holonomy, or an open/nonperiodic process may avoid the assumptions. Each is a NEW explicit physical/identification choice requiring derivation, rather than a result of ordinary shear.

## 3. Full 4D Lorentzian metric gauge control: an apparent horizon may be pure coordinate effect

On the universal COVER, let `g0=-c^2 dt^2+R^2[dchi^2+cos^2 chi dA^2+sin^2 chi dB^2]` be a STATIC round-S3 Lorentzian cylinder (a comparison metric, not a SAT cosmological solution). If `A=alpha+t*p(chi)`, `B=beta+t*q(chi)`, the FULL 4D metric pullback is
```
g=-c^2 dt^2 +R^2{
 dchi^2+cos^2 chi [dalpha+t*p'(chi)dchi+p(chi)dt]^2
 +sin^2 chi [dbeta+t*q'(chi)dchi+q(chi)dt]^2
}.
```
The coordinates can yield `g_tt=-c^2+R^2(cos^2 chi*p^2+sin^2 chi*q^2)>0` even while the exact INVERSE `g^tt=-1/c^2<0`; the temporal foliation remains regular and the geometry is isometric to the original cylinder. For a constant rigid rotation p=2, q=0, R=c=1, chi=pi/4: `g_tt=+1` but `g^tt=-1`. **It is not a black-hole horizon, Kerr ergosphere or new gravity**, merely an observer/coordinate-dependent norm of a rotating time-coordinate vector. Dropping cross terms/shift while claiming physical curvature would be BR-008 failure.

## 4. A finite-core 4D curve whose 3D section shows EIGHT separate particles

Use the independently specified radial-breathing fixture `s in [0,2pi)`,
```
r(s)=R0*(1+11/50*cos(4s)),
n(s)=(cos 2s,sin 2s,cos 3s,sin 3s)/sqrt(2),
X(s)=r(s)*n(s).
```
The *radial modulation is prescribed separately* and is NOT a consequence of Phi shear. Since gcd(2,3)=1, n(s) is a (2,3) torus-knot embedding of S1 in S3; with r>0, X(s) is a smooth EMBEDDED closed curve in R4. `|X'|^2 = (r')^2 + (13/2)*r^2` for dimensionless s and any length units for r (since `|n'|^2=13/2`). The tubular-neighborhood theorem supplies an epsilon>0 such that an epsilon-radius normal disk B3 at every s makes a single connected smooth finite-core four-dimensional object diffeomorphic to S1 x B3.

The spherical snapshot `|X|=R0` intersects the center curve at exactly EIGHT points in a circuit (`cos(4s)=0`), alternating 4 inward and 4 outward. The points are all distinct. For sufficiently small epsilon, the finite-core tube intersects that same S3 snapshot in EIGHT SEPARATE 3D B3 components, without any four-dimensional tube splitting, reconnection, or baryogenesis. The signed crossing total is ZERO; more generally any regular radial level of a smooth closed real-valued radial coordinate `r(s)` has equal inward/outward crossing counts. This is a kinematic topology theorem on the **cover**, not a proof of physical timelike CTCs or cosmological matter census.

At tangent/turnaround levels the number of visible intersection components may change, but their birth/death in a slice is not actual material creation. A physical baryon current and conversion law remain separate requirements. **The specimen physically mimics a many-blob instantaneous 'universe' but contains only ONE globally connected filament.**

## 5. How to fry next, without repairing failures by stipulation

- Native 4D cruller topology and FOLIATION, with attention to globally valid time orientation and the prior compact-timelike CTC condition.
- Use present Klein Fabric **as a tentative physical construction target**. Test material shear against native 4D metric/constitutive constraints; do not substitute the older filament-versus-timesheet choice.
- Compare exact round + smooth shear **null control** against an independently specified nonuniform radial graph and against a physically admissible finite-core interaction. The former cannot produce new intrinsic gravity dents; the latter must still be derived from SAT, not guessed.
- Demand energy/momentum/baryon current accounting, return-map monodromy, precise finite-core adjacency and a mechanism for genuinely new worldtubes. A visually dense braid or more snapshot blobs does not suffice.
- Treat global 'one turn gives one particle' as a proposition to test, not an inference from the braid, shear, or snapshot census.

## Executed verification and artifact paths

- `/mnt/data/cruller_shear_fry_20261020.py`: SymPy tests of h_t, det invariance, shear principal stretches, full Lorentz metric determinant and inverse, observer-coordinate control, generated Class P graph `/mnt/data/cruller_shear_stretch_20261020.png`.
- `/mnt/data/cruller_intersection_census_20261020.py`: SymPy and NumPy checks of exact 8 intersections, inward/outward split, derivative speed and distinctness; Class P graph `/mnt/data/cruller_finite_core_crossings_20261020.png`.
- All checks returned PASS locally. These files are not necessarily committed to GitHub; the calculations and proof statements are durably recorded HERE.

Meridian / assistant research.
