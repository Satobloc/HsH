# RUN 091 — Hagalaz / superhelix / UI framed-sphere interlingua v0.1

**Branch/task:** Meridian / Hagalaz interlingua / semantic architecture  
**Status:** SANDBOX / PROVISIONAL / theory-bearing formalization  
**Date:** 2026-09-21  
**Operation:** large bounded semantic pass following RUN 090 notation grammar  
**Quarantine:** none consulted  
**Nathan Words disposition:** current Nathan-direct clarification **INGESTED**; older `rotoexpando_geometry_definition.tex` **SOURCE ONLY / scaffold**, not authority over current semantics

## 0. Executive result

A useful common structure now appears between Hagalaz, the Universal Indicatrix (UI), framed spheres, recursive helices/superhelices, Three Spheres, and the six coordinate-plane rotations of 4D.

The strongest result is dimensional rather than cosmetic:

- a **general relative framed-sphere similarity in 4D** has 11 continuous degrees of freedom: 4 translation + 1 isotropic scale + 6 rotation;
- Nathan's unexpectedly **eight-position** compact Hagalaz display has a natural exact interpretation if the center displacement is constrained to a distinguished local **rung/polar/tangent direction**: 1 rung displacement + 1 scale + 6 sphere-locked 4D rotation channels = 8.

This produces a mathematically coherent **rung-locked Hagalaz core**, while preserving a larger 11-DOF general Hagalaz when arbitrary center displacement is allowed.

The six rotational channels are not six independent invariant principal angles. They are the six coefficients of a local `so(4)` generator in the sphere-locked `x,y,z,w` frame. The sphere-locked grid is what makes those coordinate-plane channels meaningful rather than arbitrary global-axis labels.

With `w` chosen as the sphere's local polar / helical-axis / tangent direction, the six channels split naturally:

- **pole/tangent bending:** `xw`, `yw`, `zw`;
- **equatorial/normal-space twist:** `xy`, `xz`, `yz`.

That split suggests a maximally readable eight-address form:

```text
          ω_xw     ω_yw     ω_zw
        log μ       ᚼ        ξ
          ω_xy     ω_xz     ω_yz
```

where `μ` is an inter-order scale ratio and `ξ` is a normalized rung displacement. This assignment is a **candidate formalization**, not yet promoted notation law.

## 1. Source anchor and current correction boundary

The September 11 `rotoexpando_geometry_definition.tex` already contains a useful scaffold:

- nested helical orders;
- framed spheres `S_i=(c_i,r_i,F_i)` with `F_i in SO(d)`;
- relative scale, frame rotation, and center offset;
- UI as centered/normalized framed-sphere comparison;
- Hagalaz shorthand for relative sphere data;
- closure, similarity return, and 4D rotation discussion.

That scaffold is useful but does **not** settle the present operator. Current Nathan-direct discussion supersedes several presentational choices: actual Hagalaz notation is the rune family `ᚽ ᚼ ᚺ ᚻ`; generic script-H is not Hagalaz by default; unit/reference Hagalaz need not be the algebraic identity; and current semantics are being defined now rather than excavated as already-fixed archive truth.

## 2. Primitive framed-order state

Represent one helical order by the local framed-sphere state

```text
S_n = (c_n, r_n, F_n)
```

with:

- `c_n in R^4`: order/sphere center;
- `r_n > 0`: order radius / sphere scale;
- `F_n in SO(4)`: sphere-locked orthonormal frame.

Choose the fourth local basis vector `e_w` as the distinguished polar/tangent direction. The other three axes span the local normal/equatorial 3-space. A particular circular helix uses a 2-plane inside that normal 3-space; the remaining normal axis is still retained by the framed sphere and becomes available when the structure bends into higher-order geometry.

A bare geometric sphere would lose orientation because of rotational symmetry. The sphere-locked grid is therefore not decoration: it is the information carrier that makes an inter-order rotation observable.

## 3. Why six rotation slots are mathematically natural

For a moving sphere-locked frame,

```text
Ω = F^T dF/dλ
```

is skew-symmetric, hence `Ω in so(4)`. A 4x4 skew matrix has six independent coefficients:

```text
      x        y        z        w
x     0      -ω_xy    -ω_xz    -ω_xw
y   +ω_xy      0      -ω_yz    -ω_yw
z   +ω_xz    +ω_yz      0      -ω_zw
w   +ω_xw    +ω_yw    +ω_zw      0
```

Thus the natural sphere-locked coordinate-plane basis is exactly

```text
xy, xz, xw, yz, yw, zw.
```

With `w` designated as pole/tangent:

```text
bending channels = {xw, yw, zw}
twist channels   = {xy, xz, yz}
```

This is more informative than merely saying "SO(4) has six generators." It connects the six channels to the helix/sphere picture:

- rotations involving `w` tip/bend the local polar axis into the normal space;
- rotations not involving `w` rotate the normal/equatorial grid around that pole.

A rotation-minimizing/Bishop-type transport is therefore a useful candidate **default gauge**: suppress gratuitous normal-normal twist and let only geometry-required bending appear, while any deliberate helical winding/twist is added explicitly.

## 4. General Hagalaz versus eight-slot rung-locked Hagalaz

For two arbitrary framed spheres in 4D, the relative continuous data are:

```text
Δc in R^4       4 DOF
μ > 0           1 DOF
Q in SO(4)      6 DOF
---------------------
                 11 DOF
```

This is the full relative similarity state.

The eight-slot form becomes exact if the recursive hierarchy supplies a preferred local rung direction and center displacement is constrained to it:

```text
d_local = ξ e_w.
```

Then translation contributes only one scalar `ξ`:

```text
1 rung + 1 scale + 6 rotation = 8 DOF.
```

This is a major candidate interpretation of why the compact notation naturally wants eight positions.

Important boundary: if future work allows arbitrary cross-rung center drift, the 8-slot core is insufficient. General Hagalaz must then retain the full four-vector `Δc` or add a separate translation decoration/object. Do not hide those extra degrees of freedom inside one scalar.

## 5. Exact discrete adjacent-order step

Let the finite rung-locked Hagalaz step be

```text
U = (μ, ξ, Q)
```

with local displacement

```text
d = ξ e_w.
```

Apply the same step to a framed sphere by

```text
c_{n+1} = c_n + r_n F_n d
r_{n+1} = μ r_n
F_{n+1} = F_n Q.
```

This equation is the cleanest current candidate for "duplicate the sphere exactly, then let the operation evolve the duplicate into the next-order sphere."

At the initial comparison point one may set

```text
c_2 = c_1,
r_2 = r_1,
F_2 = F_1
```

before the operation is applied. The post-operation difference between the two sphere states is then exactly what the Hagalaz record encodes.

## 6. Repeating the same operation: S1 -> S2 -> S3 -> ...

If the **same dimensionless Hagalaz step** is applied at every order, then after `N` steps:

```text
r_{n+N} = μ^N r_n
F_{n+N} = F_n Q^N
```

and the center relation is

```text
c_{n+N}
 = c_n
 + r_n F_n Σ_{k=0}^{N-1} μ^k Q^k d.
```

For three spheres specifically:

```text
S1 -> S2:
    Δc_12 = r_1 F_1 d
    scale = μ
    frame = Q

S2 -> S3:
    Δc_23 = r_2 F_2 d
            = r_1 μ F_1 Q d
    scale = μ
    frame = Q

S1 -> S3:
    Δc_13 = r_1 F_1 (d + μ Q d)
    scale = μ^2
    frame = Q^2.
```

This gives an immediate, testable relation among UI, Two-Sphere Hagalaz, and Three Spheres: a three-sphere configuration generated by repeated unit Hagalaz is not arbitrary. Its third sphere must satisfy the composition law above.

That is a strong candidate benchmark for the Three-Spheres solver.

## 7. Continuous/path form — where integration naturally enters

The finite step can be generated by a local Hagalaz path. Let `λ` be a dimensionless phase/path parameter and define:

```text
dc/dλ = r v F e_w
(dr/dλ)/r = α
dF/dλ = F Ω(λ),      Ω(λ) in so(4).
```

The local generator therefore has eight scalar channels in the rung-locked case:

```text
(v, α,
 ω_xy, ω_xz, ω_xw,
 ω_yz, ω_yw, ω_zw).
```

The finite readout is

```text
Q = P exp ∫ Ω(λ) dλ
μ = exp ∫ α(λ) dλ
Δc = ∫ r(λ) v(λ) F(λ)e_w dλ.
```

This makes the "default path integrator that defines unit Hagalaz" precise without yet fixing its numerical profile.

It also explains why finite Hagalaz should canonically store `Q` (or the path), rather than six naive Euler angles: the six plane generators do not generally commute. Their local coefficients are clean; a finite rotation depends on path/order unless a special commuting case is chosen.

## 8. Exact helix -> superhelix lift

A clean recursive geometric operation is a helical lift around a transported carrier frame.

Given a carrier curve `C(s)` with unit tangent `T(s)` and transported normal-frame vectors `N1,N2,N3`, define

```text
L[C](s)
 = C(s)
 + ρ [cos φ(s) N1(s) + sin φ(s) N2(s)].
```

For canonical constant-rate winding,

```text
φ(s) = k s + φ0.
```

Then:

- if `C` is a straight line, `L[C]` is an ordinary helix;
- if `C` is itself a helix, `L[C]` is a superhelix;
- if `C` is already an order-N superhelix, reapplying the same lift produces the next order.

The missing ingredient is the **transport rule** for `N1,N2,N3`. The most conservative default candidate is rotation-minimizing transport, because it introduces no extra twist beyond what carrier bending requires. Explicit twist/winding is then encoded by the normal-normal Hagalaz channels rather than sneaking in through a frame convention.

This gives a precise meaning to "same operation at every order": use the same dimensionless lift profile in each order's own sphere-locked frame.

## 9. UI is a readout of Hagalaz, not a competing object

Nathan's current UI definition is the shared-center comparison:

```text
ΔC = 0
```

with relative scale and sphere-locked grid orientation free except as controlled by the operation.

The general Hagalaz step may accumulate a nonzero center displacement. UI can still compare it by applying a **readout normalization**:

1. retain each sphere's scale and frame;
2. recenter the spheres onto a common origin;
3. optionally normalize scale if the chosen UI mode calls for it;
4. display the relative grids.

Thus:

```text
Hagalaz path/step
      -> finite sphere relation (Δc, μ, Q)
      -> UI readout: recenter Δc -> 0, retain μ and Q.
```

This avoids the earlier mistake of equating Hagalaz itself with the UI condition `Δc=0` while preserving Nathan's definition that the UI is the no-center-offset framed-sphere comparison.

## 10. Defaults that currently make the most mathematical sense

These are **candidate defaults**, chosen for minimal assumptions and symmetry. They are not yet Nathan-approved constants.

### D0 — initial duplicate state

Before applying the order-jump operation:

```text
same center
same frame
same phase origin
same radius unless a reference scale ratio is deliberately built into the profile.
```

This gives an unambiguous zero point.

### D1 — local polar axis

Use `w` as the sphere's polar/helical-axis/tangent direction. This makes the six rotation channels geometrically typed rather than merely named.

### D2 — minimal frame transport

Use rotation-minimizing transport as the default gauge. Default normal-normal twist is zero unless explicit helical winding or another modeled twist activates it.

### D3 — no within-order radial dilation

A canonical helix can grow by screw propagation while keeping its tube radius fixed. Therefore default

```text
α = 0
```

within an order. Inter-order `μ` remains allowed and is not the same thing as dynamic expansion.

### D4 — chirality preservation

Keep handedness fixed under the default repeated operation. A chirality reversal should be explicit.

### D5 — strict geometric similarity across orders

If consecutive orders are intended to be scaled copies with the same pitch angle, then radius and pitch length scale together. With arclength parameterization this implies phase/wavenumber rate scales inversely with linear size:

```text
k_{n+1}/k_n = 1/μ.
```

So the older `μ` and `ν` need not remain independent in the strict-similarity reference profile. They should remain independent in the general operator.

### D6 — rung-lock for compact Hagalaz

Use `d = ξ e_w` in the compact 8-slot profile. Unlock to a full 4-vector only when the geometry requires it.

### D7 — do NOT yet choose μ numerically

`μ=1` is the neutral scale identity and is useful for controls, but it is not automatically the most informative recursive "unit Hagalaz." A 1:2 or other ratio may prove more natural in actual solver practice. The reference `μ_*` should be chosen only after closure/tangency/packing/empirical-use constraints are compared.

## 11. What does NOT fall out automatically

No Golden Ratio, Cantor set, or special numerical constant has yet been derived from the bare recursion.

The repeated transform does produce a geometric-series structure:

```text
Σ μ^k Q^k d.
```

From that:

- `0 < μ < 1` gives a convergent hierarchy when `I-μQ` is invertible;
- `μ = 1` gives scale-preserving recurrence/closure possibilities;
- `μ > 1` gives an expanding hierarchy;
- finite-order `Q` can create rotational recurrence;
- irrational principal rotation-angle ratios can create quasiperiodic nonclosure.

But a Cantor-like set requires branching/deletion structure, not merely a single recursive chain. A Golden-Ratio value would need an additional equation — for example tangency, optimal packing, closure, self-contact, equal-energy, or another symmetry constraint — whose solution actually produces it.

Do not reverse-engineer a famous constant into the operator.

## 12. Closure and holonomy from the repeated step

If `Q^q = I`, then after `q` steps the frame returns. Euclidean closure additionally requires

```text
μ^q = 1
```

and

```text
Σ_{k=0}^{q-1} μ^k Q^k d = 0.
```

For positive real scale this ordinarily forces `μ=1` for exact Euclidean size return.

If `Q^q=I` but `μ^q != 1`, orientation can recur while scale changes: a natural **similarity closure**.

A true holonomy statement should be reserved for a genuinely closed transported loop. The Hagalaz machinery can supply the transport operator; whether a given recurrence is holonomy, monodromy, or similarity return depends on the path actually closing.

## 13. 4D rotation structure worth exploiting later

The six sphere-grid planes also admit two mathematically useful organizations:

### pole split

```text
{xw,yw,zw}  bending
{xy,xz,yz}  normal-space twist
```

This is directly tied to the helix/sphere interpretation and is the preferred current display organization.

### complementary-plane pairs

```text
(xy, zw)
(xz, yw)
(xw, yz)
```

These are the three pairs of mutually orthogonal coordinate planes. Generic finite `SO(4)` rotations can be understood through double rotations in suitable orthogonal planes. Equal-magnitude double rotations give especially symmetric/isoclinic cases.

This may become important for chirality, closure, and the eventual meanings of the rune-family variants `ᚽ ᚼ ᚺ ᚻ`, but **no assignment is made here**.

## 14. Maximally readable versus maximally compact notation

Candidate readable form:

```text
          ω_xw     ω_yw     ω_zw
        log μ       ᚼ        ξ
          ω_xy     ω_xz     ω_yz
```

A maximally compact form may linearize those eight addresses around the rune in a fixed parser order, analogous in spirit to the old H-universe typography. The exact order and glyph alphabet should be chosen only after the semantic slots survive solver tests.

The machine record remains canonical; Unicode typography is a reversible rendering.

## 15. Solver crosswalk

This formalization gives the intended common language:

### Superhelix / recursive lift

Provides the carrier path and transported frame. Emits the local/finite Hagalaz state.

### Hagalaz

Stores/operates on the inter-order framed relation and composes it across hierarchy levels.

### UI / TX

Recentered framed-sphere readout of Hagalaz, with `ΔC=0` by definition and scale/orientation retained according to mode.

### Three Spheres

Tests composition across two adjacent Hagalaz steps. Under a repeated unit step, `S3` is constrained by the `Q^2`, `μ^2`, and geometric-series center relation.

### Whirligig / Donut

Expected to be a phase/toroidal compression or projection of the same recursive relation. Its exact adapter remains to be proved rather than assumed.

## 16. Precision-visual rule applied

Two Class-P artifacts were generated from this formalization:

- `CLASS_P_HAGALAZ_8SLOT_v03` — candidate eight-address local-generator layout;
- `CLASS_P_SO4_SIX_ROTATIONS_v01` — the six coordinate-plane rotations as the six edges of `K4` on axes `{x,y,z,w}`.

These are precision/script-drawn artifacts. They may serve as underpainting for Class-H/Class-I output, but generated illustration alone has no authority.

## 17. Durable status

### Strongest current candidate

Treat Hagalaz first as a **framed-order transform / transport object**. The 8-slot compact form is naturally the tangent/rung-locked specialization of the full 11-DOF 4D framed-sphere relation.

### Not yet settled

- numerical reference scale `μ_*`;
- numerical rung step `ξ_*`;
- canonical local rotation profile `Ω_*(λ)`;
- exact mapping from eight readable addresses into Nathan's compact Unicode placement order;
- meanings of `ᚽ ᚼ ᚺ ᚻ`;
- whether arbitrary translation belongs inside general Hagalaz or is composed as a separate rung/placement operator;
- exact Whirligig adapter;
- whether heloid/spheroid deformation adds further state beyond framed similarity.

## 18. Next cursor

Implement the helical-lift recursion with a rotation-minimizing 4D frame and run three controlled profiles:

1. neutral scale `μ=1`;
2. hierarchy scale `μ=1/2` (and inverse convention `2`);
3. a variable `μ` sweep.

For each, generate `S1,S2,S3`, the six local rotation channels, UI readouts, and closure/conditioning diagnostics. Then ask whether any nontrivial scale or angular value is selected by tangency, closure, self-contact, or another internal constraint rather than by convention.