# Mode separation: persistent winding vs traveling kink vs inductive/reconnection propagation — 2026-09-16

**Status:** RAVEL SANDBOX / reconstruction pass — not promoted theory  
**Dependency:** `PLUS4_HELIX_TIMESHEET_INTERSECTION_KERNEL_2026-09-16.md`  
**Question:** Which candidate SAT/H(s)H propagation modes are genuinely distinct geometrically in native `++++`, and what minimum geometric object is required to represent each one without smuggling in a second time variable or material-filament motion?

## 1. Baseline `++++` history

Use the previous kernel with `w` itself as the convenient source coordinate:

\[
H_0(w)=
\bigl(
w,
R\cos kw,
R\sin kw,
0
\bigr),
\qquad
k=\frac1h.
\]

The transverse derivative magnitude is

\[
\left\|\frac{dH_{0,\perp}}{dw}\right\|=Rk=\tan\theta_4.
\]

This is one fixed 4D history. A timesheet `w=s` resolves one point of it at each `s`.

The important structural question is not what name we give the resulting readout, but how many independent coordinates/degrees of freedom are required to represent the purported mode.

---

## 2. Mode I — persistent winding

Persistent winding is representable already by a single smooth 1-parameter embedded history.

A minimal diagnostic is that over an extended interval `I`,

\[
R(w)>0,
\qquad
k(w)\neq0,
\]

with no compactly localized support required. In the uniform case,

\[
R(w)=R_0,
\qquad
k(w)=k_0.
\]

Then

\[
\tan\theta_4=R_0k_0
\]

is persistent rather than localized.

The timesheet repeatedly resolves the same structural class:

\[
\phi(w)=k_0w,
\qquad
r_\Sigma(w)=
(R_0\cos k_0w,R_0\sin k_0w,0).
\]

### Minimum object required

A **1D centerline/history** is sufficient to encode the persistent winding skeleton.

Finite-core structure may still be required for exclusion, deformation, Kerr/Kelvin response, etc., but persistence itself does not force that enlargement.

### Defining feature

The geometry is **distributed/persistent along the history**, not a bounded defect riding on another independent carrier coordinate.

---

## 3. Mode IIa — a localized kink as part of one fixed history

A single 1D history can encode a localized deformation region. Write

\[
H_K(w)=H_0(w)+A f\!\left(\frac{w-w_0}{L}\right)n(w),
\]

where

- `f` is localized (for example rapidly decaying or compactly supported),
- `A` is a deformation amplitude,
- `L` is its extent in `w`,
- `n(w)` is a chosen transverse direction.

Then the local tangent departure from baseline is

\[
\delta T_\perp(w)
=
\frac{A}{L}f'\!\left(\frac{w-w_0}{L}\right)n(w)
+
A f\!\left(\frac{w-w_0}{L}\right)n'(w).
\]

Accordingly `theta_4(w)` and `dell/dw` become localized functions rather than persistent constants.

A timesheet sequence encounters the bounded deformation when its resolving coordinate reaches that region.

### What this does represent

It represents a **localized feature of a fixed 4D history**.

### What it does not yet represent

It does **not** by itself represent “a kink propagating along an independently identifiable persistent filament.” A 1D curve has only one intrinsic parameter. If `w` labels where we are on the full history, there is no second independent coordinate left to say both:

1. where along the carrier the disturbance sits, and
2. how that disturbance propagates relative to the carrier.

Treating the same parameter as both silently reintroduces the forbidden picture of a 3D filament evolving through an external time.

This is the first clean dimensional separator in the mode problem.

---

## 4. Mode IIb — a genuine traveling kink on a carrier requires at least two intrinsic coordinates

To represent an actual disturbance propagating **along** a persistent carrier while preserving the fixed-history ontology, introduce a carrier/worldtube surface with two intrinsic coordinates:

\[
W(\sigma,w),
\]

where

- `sigma` labels position around/along the carrier structure,
- `w` participates in the 4D embedding/resolution structure.

A localized deformation may then be written schematically as

\[
W_K(\sigma,w)
=
W_0(\sigma,w)
+A f(\sigma-v_k w)N(\sigma,w).
\]

The ridge

\[
\sigma-v_k w=\text{constant}
\]

is the geometric locus of the propagating deformation in the completed 4D object.

Nothing material needs to be imagined as “moving through time.” The entire ridge is part of the fixed higher-dimensional history; successive timesheet intersections sample different locations on it.

### Minimum object required

At least a **2-parameter carrier surface / finite-core worldtube boundary description** is required if the phrase “traveling kink on a carrier” is to mean more than a localized bend already baked into a 1D history.

This is a strong reason not to force the SAT traveling-boson language onto a centerline-only H(s)H object.

### Structural distinction from persistent winding

Persistent winding can be encoded as the baseline geometry itself:

\[
\partial_\sigma W_0,\;\partial_w W_0
\]

with a repeated/persistent pattern.

A traveling kink instead introduces a localized ridge in the two-coordinate geometry, with support concentrated near

\[
\sigma\approx v_k w+\sigma_0.
\]

Persistence and propagation are therefore different geometric statements, not merely different values of the same winding parameter.

---

## 5. Mode III — inductive/reconnection propagation

Reconnection is categorically different again.

Even a single smooth 2-parameter worldtube surface is insufficient if the claimed mode requires connectivity transfer between distinct structures.

The minimum configuration is a family of at least two tubes/surfaces,

\[
W_A(\sigma_A,w),
\qquad
W_B(\sigma_B,w),
\]

plus a rule describing when local neighborhoods change adjacency/connectivity.

Before reconnection, local continuation follows

\[
A\to A,
\qquad
B\to B.
\]

After reconnection, continuation may instead follow a cross-pairing schematically like

\[
A_-\to B_+,
\qquad
B_-\to A_+.
\]

The exact topology of H(s)H reconnection is not yet specified here. The important point is structural:

\[
\boxed{
\text{reconnection cannot be represented as a smooth deformation of one isolated centerline}
}
\]

if connectivity genuinely changes.

If the proposed “inductive” mode does **not** require literal topology change but instead means state transfer through local coupling, it still requires at least a multi-object neighborhood and a coupling/relay rule. Either way, it is not reducible to the same object as a solitary persistent helix.

### Minimum object required

A **multi-worldtube configuration**, with either:

- explicit connectivity change, or
- a local state-transfer/inductive map between neighboring tubes.

---

## 6. Minimal geometric hierarchy

The three modes now separate by minimum representational complexity:

### Persistent winding

\[
\boxed{1\text{-parameter history is sufficient as skeleton}}
\]

Distributed geometry along one fixed history.

### Traveling kink on a carrier

\[
\boxed{\ge 2\text{-parameter carrier/worldtube description}}
\]

A localized ridge/deformation with position along the carrier distinct from the resolving/history coordinate.

### Inductive/reconnection propagation

\[
\boxed{\text{multi-worldtube neighborhood + connectivity/coupling rule}}
\]

Identity/state propagation cannot be reduced to the shape of one isolated centerline.

This hierarchy is obtained before assigning any particle identity.

---

## 7. Observable consequences at the timesheet level

The three classes should produce qualitatively different readout patterns even before dynamics are supplied.

### Persistent winding

The timesheet sees a repeated/ongoing structured intersection. In the uniform helix seed,

\[
\theta_4(w)=\theta_0
\]

and

\[
\frac{d\ell}{dw}=\sec\theta_0
\]

remain persistent.

### Localized kink

The timesheet sees a transient departure:

\[
\theta_4(w)=\theta_0+\delta\theta(w),
\]

with `delta theta` localized in the relevant interval. Likewise

\[
\frac{d\ell}{dw}
\]

deviates locally and returns to baseline.

For a genuine traveling ridge on a carrier, the location of that transient also shifts in the carrier coordinate `sigma` across successive slices.

### Inductive/reconnection mode

The most diagnostic quantity is not necessarily a large local `theta_4` excursion. The readout may instead show a change in **which branch/tube carries the continuing state**, or a relay between neighboring structures.

Therefore a weakly deforming inductive mode is geometrically possible in principle: state transfer need not imply the same shape excursion as a traveling kink.

That possibility is not yet a neutrino claim; it is simply allowed by the object hierarchy.

---

## 8. Immediate consequence for the SAT boson reconstruction

The old SAT distinction between persistent coiling and traveling excitation cannot be translated into H(s)H as merely

\[
\text{large winding} \;\text{vs}\; \text{small winding}.
\]

At least three structurally different categories now exist:

1. **persistent baseline geometry**;
2. **localized deformation ridge on a carrier**;
3. **multi-object connectivity/state-transfer event**.

This is precisely the distinction the finite-core/worldtube upgrade makes available and the centerline SAT representation could compress together.

The current co-theorist fork therefore becomes mathematically sharper:

- a photon-like candidate based on a traveling kink would live in category 2;
- a neutrino-like candidate based on inductive/reconnection propagation would live in category 3;
- persistent fermion-like structure would begin in category 1, though finite-core completion may add further requirements.

These identifications remain **candidate mappings only**. The geometry has separated the mode classes; it has not assigned Standard Model identities to them.

---

## 9. Breaker test

The next pass should not ask whether the candidate mapping sounds phenomenologically attractive.

It should ask whether categories 2 and 3 produce a qualitative coupling hierarchy from geometry alone.

The clean breaker is:

> Given the same finite-core carrier environment, does a deformation ridge necessarily perturb/intersect neighboring structures more strongly than a state-transfer/reconnection ridge with smaller material displacement?

If yes, the photon-like kink / neutrino-like inductive distinction gains an internally generated interaction hierarchy.

If no, then assigning photon and neutrino identities to the two modes would require an extra particle-specific rule and should be rejected or revised.

---

## 10. Next cursor

Build the smallest finite-core two-tube geometry that can host both:

1. a localized traveling deformation ridge;
2. an inductive/reconnection/state-transfer ridge;

under the **same** tube radius, separation, and timesheet family.

Then compare only geometric contact/deformation measures:

- minimum inter-tube separation;
- overlap/contact duration in resolving coordinate;
- displaced cross-sectional area/volume proxy;
- local curvature/deformation amplitude;
- whether connectivity changes without large displacement.

Do not yet add charge, mass, cross sections, or particle-specific coupling constants.
