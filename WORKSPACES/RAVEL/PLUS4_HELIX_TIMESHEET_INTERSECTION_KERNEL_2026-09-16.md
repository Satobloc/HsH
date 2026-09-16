# ++++ helix–timesheet intersection kernel — 2026-09-16

**Status:** RAVEL SANDBOX / reconstruction kernel — not promoted theory  
**Scope:** one fixed 4D helix, one resolving timesheet family, `theta_4`, intersection propagation, and arclength sweep only.  
**Convention:** all-plus Euclidean 4D geometry. No Lorentz-signature norm, no total-filament-speed budget, no mass/charge law.

## 1. Native setup

Use coordinates

\[
X=(w,x,y,z)
\]

with all-plus line element

\[
d\ell^2=dw^2+dx^2+dy^2+dz^2.
\]

Take the timesheet family to be

\[
\Sigma_s:\quad w=s,
\]

so the unit time-normal / resolving direction is

\[
u=(1,0,0,0).
\]

For the rest-particle seed geometry, take a fixed helix whose long axis is parallel to `u`, equivalently perpendicular to each timesheet:

\[
H(\phi)=
\bigl(
 h\phi,
 R\cos\phi,
 R\sin\phi,
 0
\bigr).
\]

Here:

- `R` is the helix radius;
- `h = dw/dphi` is the axial advance per radian;
- the ordinary pitch per full turn is

\[
P=2\pi h.
\]

This is a fixed 4D history/geometry. `phi` labels position along that history; it is not yet a clock-time variable.

---

## 2. `theta_4` from the time normal

The helix tangent with respect to phase is

\[
T_\phi=\frac{dH}{d\phi}
=
\bigl(
 h,
 -R\sin\phi,
 R\cos\phi,
 0
\bigr).
\]

Its all-plus norm is

\[
\|T_\phi\|=\sqrt{h^2+R^2}.
\]

Define `theta_4` as the angle from the time normal `u`:

\[
\cos\theta_4
=
\frac{T_\phi\cdot u}{\|T_\phi\|}
=
\frac{h}{\sqrt{h^2+R^2}}
\]

for the chosen positive-`w` orientation. Equivalently,

\[
\sin\theta_4
=
\frac{R}{\sqrt{h^2+R^2}},
\]

and therefore

\[
\boxed{\tan\theta_4=\frac{R}{h}}.
\]

Since `P=2pi h`,

\[
\boxed{\tan\theta_4=\frac{2\pi R}{P}}
\]

or

\[
\boxed{P=2\pi R\cot\theta_4}.
\]

Thus, at fixed radius, `theta_4` is an exact monotonic measure of inverse pitch. It is safer to say **equivalent to inverse pitch through this conversion** than to identify the angle numerically with `1/P`.

A useful winding-density form is

\[
\nu_w\equiv\frac{1}{P}
=
\frac{\tan\theta_4}{2\pi R}.
\]

---

## 3. Null / vacuum-aligned limit

The project-native null/vacuum alignment is

\[
\theta_4=0.
\]

In the present geometry that means

\[
T_\perp=0,
\]

so the local tangent is parallel to the time normal.

Within the helix family this is reached by zero transverse winding density, e.g.

\[
R/h\to0.
\]

That can occur as `R -> 0` at finite `h`, or as `h -> infinity` at fixed finite `R`; what matters locally is

\[
\tan\theta_4=R/h\to0.
\]

No zero norm is involved.

---

## 4. Timesheet intersection

Intersect the fixed helix with

\[
\Sigma_s:w=s.
\]

Since

\[
w=h\phi,
\]

the intersection phase is

\[
\boxed{\phi(s)=\frac{s}{h}}.
\]

The corresponding 3D slice/readout point is

\[
r_\Sigma(s)=
\bigl(
R\cos(s/h),
R\sin(s/h),
0
\bigr).
\]

So an advancing family of timesheets samples successive points of one fixed 4D helix. The helix itself has not been assigned motion.

The phase advance per resolving advance is

\[
\boxed{\frac{d\phi}{dw}=\frac{1}{h}}
\]

and, using `theta_4`,

\[
\boxed{\frac{d\phi}{dw}=\frac{\tan\theta_4}{R}}.
\]

A full observed cycle therefore corresponds to

\[
\Delta w=P=2\pi h.
\]

---

## 5. 3D motion of the intersection/readout

Differentiate the slice point with respect to resolving coordinate `w`:

\[
\frac{dr_\Sigma}{dw}
=
\left(
-\frac{R}{h}\sin\phi,
\frac{R}{h}\cos\phi,
0
\right).
\]

Hence

\[
\boxed{
\left\|\frac{dr_\Sigma}{dw}\right\|
=\frac{R}{h}
=\tan\theta_4
}.
\]

Nathan's project-native typing is that `c` is the **`w` component of propagation of the timesheet–filament intersection**, not the material speed of the filament/history. Therefore, if

\[
\frac{dw_{\rm int}}{dt}=c,
\]

then the 3D readout/intersection rate is

\[
\boxed{
\left\|\frac{dr_\Sigma}{dt}\right\|
=c\tan\theta_4
}.
\]

This quantity is an **intersection/readout velocity**, not a total 4D material velocity of the helix.

For the rest-particle seed its coarse center remains at

\[
(0,0,0),
\]

while the local readout point circulates around radius `R`.

---

## 6. Worldline arclength swept by resolving advance

The intrinsic Euclidean arclength element along the helix is

\[
d\ell
=
\sqrt{h^2+R^2}\,d\phi.
\]

Since

\[
dw=h\,d\phi,
\]

we obtain

\[
\frac{d\ell}{dw}
=
\frac{\sqrt{h^2+R^2}}{h}
=
\sqrt{1+\frac{R^2}{h^2}}.
\]

Therefore

\[
\boxed{\frac{d\ell}{dw}=\sec\theta_4}.
\]

For a resolving advance `Delta w`, the corresponding amount of 4D history intersected is

\[
\boxed{\Delta\ell=\Delta w\,\sec\theta_4}
\]

for constant `R` and `h`.

This is a clean geometric quantity: increasing `theta_4` means a fixed resolving advance crosses more intrinsic worldline arclength.

No physical meaning beyond that is assigned here.

A convenient excess-over-aligned quantity is

\[
\frac{d\ell}{dw}-1
=
\sec\theta_4-1,
\]

but this must remain only a geometric diagnostic until a separate H(s)H law gives it physical meaning.

---

## 7. One-turn ledger

For one complete turn `Delta phi=2pi`:

Axial/resolving advance:

\[
\boxed{\Delta w=P=2\pi h}.
\]

Transverse path length around the circular projection:

\[
\boxed{L_\perp=2\pi R}.
\]

Intrinsic 4D helix arclength:

\[
\boxed{L_{4D}=2\pi\sqrt{h^2+R^2}}
\]

or equivalently

\[
\boxed{L_{4D}=P\sec\theta_4}.
\]

The ratio of transverse projected path to axial resolving advance is

\[
\boxed{\frac{L_\perp}{P}=\tan\theta_4}.
\]

These relations all encode the same geometry and provide several interchangeable observables/parameterizations.

---

## 8. Object typing: what belongs where

### Intrinsic fixed 4D history

- `R`;
- `h` or `P`;
- the curve `H(phi)`;
- intrinsic arclength `ell`;
- local tangent and therefore `theta_4`.

### Timesheet / resolving structure

- the family `Sigma_s: w=s`;
- the normal `u`;
- the increment `dw` used to resolve successive intersections.

### Intersection/readout quantities

- `phi(w)=w/h`;
- the 3D point `r_Sigma(w)`;
- `dphi/dw`;
- `dr_Sigma/dw`;
- after applying the Nathan-direct typing `dw_int/dt=c`, the 3D intersection rate `c tan(theta_4)`;
- the amount of intrinsic history swept per resolving advance, `dell/dw=sec(theta_4)`.

The most important discipline is that quantities in the third list are **not silently reassigned to the first list as motion of the physical history itself**.

---

## 9. Limiting cases

### A. Null / vacuum alignment

\[
\theta_4\to0.
\]

Then

\[
\tan\theta_4\to0,
\qquad
\frac{d\phi}{dw}\to0,
\qquad
\left\|\frac{dr_\Sigma}{dw}\right\|\to0,
\qquad
\frac{d\ell}{dw}\to1.
\]

The resolving advance tracks an essentially straight history aligned with the time normal.

### B. Small persistent departure

For small `theta_4`,

\[
\tan\theta_4\approx\theta_4,
\qquad
\sec\theta_4\approx1+\frac{\theta_4^2}{2}.
\]

So phase/readout circulation appears at first order in `theta_4`, while excess intrinsic arclength per resolving advance appears at second order.

That order difference may be useful later, but no physical identification is made in this pass.

### C. Finite persistent helix

Finite `R/h` gives finite

\[
\theta_4,
\quad
\frac{d\phi}{dw},
\quad
\frac{d\ell}{dw}.
\]

This is the clean seed for a persistent rest-frame coiled history.

### D. Tight-pitch limit

As `h -> 0+` at fixed `R`,

\[
\theta_4\to\frac{\pi}{2},
\qquad
\tan\theta_4\to\infty,
\qquad
\sec\theta_4\to\infty.
\]

A very small resolving advance then intersects a very large amount of intrinsic helical arclength and produces a very large change in phase. This is a geometric singular limit of this parameterization, not automatically a physical allowed state.

---

## 10. What this pass establishes

Within the declared all-plus helix + timesheet model, the following are exact:

\[
\boxed{\tan\theta_4=\frac{R}{h}=\frac{2\pi R}{P}}
\]

\[
\boxed{\frac{d\phi}{dw}=\frac{1}{h}=\frac{\tan\theta_4}{R}}
\]

\[
\boxed{\left\|\frac{dr_\Sigma}{dw}\right\|=\tan\theta_4}
\]

\[
\boxed{\frac{d\ell}{dw}=\sec\theta_4}
\]

and, only after applying the project-native intersection typing,

\[
\boxed{\left\|\frac{dr_\Sigma}{dt}\right\|=c\tan\theta_4}
\]

with `c` understood as the `w` component of **intersection propagation**.

---

## 11. What this pass does not establish

This kernel does not derive or assign:

- mass;
- charge;
- energy;
- force;
- tension;
- a speed limit on the readout point;
- Kerr or Kelvin structure;
- fermion/boson identity;
- traveling-kink dynamics;
- inductive/reconnection dynamics;
- Lorentzian metric signature;
- a physical clock law.

Those are downstream reconstruction questions.

---

## 12. Next cursor

Use this kernel to compare three geometrically explicit departures from the aligned history:

1. **persistent winding** — finite `R`, finite `h`, fixed helical history;
2. **traveling kink/deformation** — a localized phase/shape disturbance propagating along an otherwise specified history;
3. **inductive/reconnection propagation** — identity/state transfer by changing connectivity or local worldtube response rather than by transporting the same geometric kink.

The next pass should ask which observables in the present kernel remain invariant, which become localized functions of position along the history, and which require genuinely new finite-core topology rather than centerline geometry.
