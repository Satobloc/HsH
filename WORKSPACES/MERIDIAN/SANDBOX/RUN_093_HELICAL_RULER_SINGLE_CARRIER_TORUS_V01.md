# RUN 093 — Helical ruler / single-carrier torus branch v0.1

**Date:** 2026-09-21  
**Branch/task:** HAGALAZ-SOLVER-UNIFICATION / Meridian active edge  
**Status:** SANDBOX / PROVISIONAL / SPECULATIVE where marked  
**Nathan Direct:** current conversation INGESTED  
**Quarantine:** none consulted

## 0. Executive result

Two current Nathan observations fit together cleanly enough to deserve one bounded formalization:

1. a helix is naturally specified by a transverse size, an axial pitch/advance, and a winding/rung count;
2. a more global possibility is that apparently distinct particle-like objects could be local readouts of one continuous closed/recurrent carrier, e.g. a winding on a toroidal or twisted-toroidal geometry, with local coil deformation/jamming changing the readout.

The first point has an exact ordinary-helix ruler. The second is a **model hypothesis**, not an established physical claim.

The immediate mathematical payoff is a separation among:

- **global carrier topology** — winding/closure class;
- **metric geometry** — actual length/geodesic behavior;
- **local framed state** — scale, pitch, SO(4) orientation, deformation/jamming;
- **readout class** — whatever lower-dimensional/particle label the solver assigns.

Hagalaz can then act on the local framed state while preserving or changing the global carrier class according to explicit rules.

---

## 1. Ordinary helix as a ruler

For a circular helix

```text
h(θ) = (R cos θ, R sin θ, (p/2π) θ)
```

with `0 <= θ <= 2πN`, define:

- `R` = transverse radius;
- `p` = axial advance per full winding;
- `N` = winding/rung count.

Then

```text
axis advance:            A_N = N p
curve length:            L_N = N sqrt((2πR)^2 + p^2)
axis advance per rung:   A_N/N = p
path length per rung:    L_N/N = sqrt((2πR)^2 + p^2)
closure density:         N/A_N = 1/p
```

The natural dimensionless shape parameter is

```text
χ = p/(2πR)
```

or its reciprocal `2πR/p`.

Under strict similarity scaling

```text
R -> μR
p -> μp
```

we get

```text
χ invariant
p -> μp
L_per_rung -> μ L_per_rung
closure density -> closure density / μ.
```

This is a promising ruler architecture: a dimensionless calibration can remain fixed while the physical/model length per rung scales between orders.

---

## 2. "Closure" terminology

An ordinary open helix does not return to the same spatial point after one winding. It returns in **phase modulo 2π** while advancing by `p` along its axis.

Therefore, absent a stronger project definition, one rung should mathematically be called a:

- winding closure, or
- phase closure.

If H(s)H uses `holonomic closure` for this event, retain that project term but do not silently equate it with differential-geometric holonomy of a genuinely closed transported loop.

Actual holonomy belongs to a closed-path transport calculation.

---

## 3. The large-N ruler without literal infinity

For the uniform helix,

```text
lim_{N->∞} A_N/N = p
lim_{A->∞} N/A = 1/p.
```

That limit is trivial; infinity is not needed operationally.

The limit becomes useful for nonuniform, nested, noisy, quasiperiodic, or jammed structures. Let `A_N` be cumulative carrier/axis advance after `N` identified winding closures. Define

```text
p_bar(N) = A_N/N
ν_cl(N)  = N/A_N.
```

If stable limits exist,

```text
p_∞ = lim p_bar(N)
ν_∞ = lim ν_cl(N) = 1/p_∞.
```

The executable solver should use a finite convergence rule, e.g.

```text
|p_bar(N+k)-p_bar(N)| / |p_bar(N)| < ε
```

for `1 <= k <= W`, with declared tolerance `ε` and window `W`.

The first stabilizing count `N_*` gives a finite computed ruler estimate

```text
p_* = p_bar(N_*).
```

This implements Nathan's "probably not infinite properly" intuition: infinity is the mathematical idealization; stabilization is the measurable object.

---

## 4. Variable-radius / nested version

For closure `j`, let the effective transverse radius be `R_j` and carrier advance be `p_j`.

Define cumulative quantities

```text
A_N = Σ_j p_j
C_N = Σ_j 2πR_j
χ_N = A_N / C_N.
```

If exact self-similarity holds rung by rung,

```text
p_j = χ 2πR_j,
```

then

```text
χ_N = χ
```

for every `N`.

If the structure is nonuniform, `χ_N` becomes a radius-weighted cumulative estimator. The existence or nonexistence of

```text
χ_∞ = lim χ_N
```

is then itself informative.

Candidate interpretation:

- `χ` or `χ_∞` = dimensionless tape calibration;
- `p_*` = local/asymptotic physical/model length per rung;
- `N` = closure count;
- `A_N` = accumulated carrier distance.

This is a concrete candidate for the "measuring tape" architecture.

---

## 5. Relation to Hagalaz

RUN 092 sharpened the local Hagalaz generator toward eight channels:

```text
(v, α,
 ω_xy, ω_xz, ω_xw,
 ω_yz, ω_yw, ω_zw)
```

where:

- `v` = local carrier/tangent advance rate;
- `α = d log r / dλ` = local scale rate;
- the six `ω_ab` are sphere-locked SO(4) rotation-generator channels.

The helix ruler suggests using **closure phase** as a natural integration coordinate. Over one phase closure, integrate the Hagalaz generator to obtain the finite rung transform.

Then the scalar ruler data are not extra arbitrary coordinates; they are integrated outputs:

```text
ΔA_n = ∫ closure_n v(λ) r(λ) dλ       [after chosen normalization/gauge]
ΔL_n = curve arclength over closure n
R_n  = transverse scale over closure n
χ_n  = ΔA_n / (2πR_n)
```

Thus a bare/default Hagalaz can potentially mean a declared reference **per-closure transport profile**, not the number `1`.

---

## 6. Single-carrier hypothesis — SPECULATIVE

Nathan's current speculation:

> something like a geodesic on a twisted torus; something like a one-electron-universe picture; quarks could be electron-like coils in different deformation/jamming states.

This is recorded here as a **single-carrier readout hypothesis**, not a physical conclusion.

Let

```text
Γ : S^1 or R -> M
```

be one global carrier curve in an ambient/toroidal/nested geometry `M`.

A local observer/solver does not necessarily see all of `Γ`. It sees a windowed framed state

```text
S_i = Readout( Γ | W_i ).
```

Different apparent particle classes could then correspond, in the model, to different local states of the same carrier:

```text
same global Γ
+ different local winding / curvature / torsion / confinement / jam state
-> different local readout class.
```

This is structurally analogous to "one carrier, many appearances"; no identification with the historical one-electron proposal is implied beyond the analogy.

---

## 7. Toroidal winding model before claiming geodesics

Use an embedded ring torus with major radius `R0` and tube radius `r`:

```text
X(u,v) = ((R0 + r cos v) cos u,
          (R0 + r cos v) sin u,
           r sin v).
```

A constant-slope winding

```text
u(t)=m t
v(t)=n t
```

with coprime integers `(m,n)` closes after `t=2π` and defines a `(m,n)` toroidal winding / torus-knot type curve when non-self-intersecting.

Guardrail:

**This curve is not automatically a geodesic of the torus's induced metric.**

Therefore keep separate fields:

```text
winding class:      (m,n)
metric-geodesic:    true / false / unresolved
local deformation:  D(s)
local frame:        F(s)
Hagalaz path:       ᚼ(s)  [project notation family; semantics provisional]
```

A later geodesic solver can ask which winding classes admit or approach stationary-length paths under the chosen twisted-torus metric.

---

## 8. Why toroidal closure may matter for the ruler

On a closed or recurrent toroidal carrier, the rung count becomes topological/phase information rather than merely an arbitrary finite sample length.

For a closed `(m,n)` winding one can define:

```text
N_major = |m|
N_minor = |n|
```

plus total path length `L_(m,n)`.

Candidate ruler quantities include

```text
L_(m,n)/|m|
L_(m,n)/|n|
|m|/L_(m,n)
|n|/L_(m,n)
```

and, for nested/Hagalaz order changes, ratios of these quantities between successive framed states.

These are not universal constants by themselves; they depend on torus geometry and metric. Their value is that they let topology, scale, and metric length enter separately.

---

## 9. Jamming/deformation as a particle-readout channel — SPECULATIVE

Represent local coil deformation by a field/tensor `D(s)` acting on the transverse framed neighborhood of `Γ`.

A "jam" is provisionally a region where geometric freedom is reduced by contact/confinement/packing constraints, e.g. one or more of:

```text
minimum separation approaches a contact threshold;
transverse radius becomes anisotropic;
local pitch changes sharply;
frame rotation channels become constrained/coupled;
curvature/torsion rise;
neighboring winding segments exchange force/constraint information.
```

Then apparent particle classes could be investigated as **equivalence classes of local jammed framed states** rather than separate primitive carriers.

A scientifically useful implementation would require a solver to show that distinct stable/local minima actually exist; labels such as electron/quark must not be assigned merely by resemblance.

---

## 10. Immediate solver bridge

This branch gives Hagalaz four increasingly global comparison levels:

```text
L0  local generator       eight Hagalaz channels
L1  one-rung transform    integrated closure step
L2  many-rung ruler       p_*, χ_*, closure density
L3  global carrier class  winding/closure topology + holonomy
```

UI can read out the local/finite framed relations.
Three-Spheres can benchmark repeated adjacent-order transforms.
Whirligig/Donut can supply closed/recurrent toroidal carrier geometry.
The Hagalaz layer can then compare whether these solvers preserve the same `L0 -> L1 -> L2 -> L3` information.

This is a strong candidate unification target.

---

## 11. Tests that would make this branch earn its keep

1. **Uniform-helix sanity test**
   - recover `p`, `χ`, and per-rung arclength exactly from sampled geometry.

2. **Nonuniform stabilization test**
   - perturb `R_j,p_j`; verify whether `p_bar(N)` and `χ_N` converge and report finite `N_*`.

3. **Hagalaz similarity test**
   - apply a repeated order transform with scale `μ`; check `χ` invariance and ruler covariance.

4. **Toroidal winding test**
   - generate multiple `(m,n)` closed windings; distinguish topological closure from metric geodesic status.

5. **Jamming test**
   - introduce a contact/confinement functional and determine whether multiple stable local deformation classes appear without hand-labeling them.

6. **Closed-path Hagalaz test**
   - integrate the six-channel frame transport around a truly closed carrier and compute actual holonomy separately from winding closure.

---

## 12. Current claims ledger

**CLAIMED VERIFIED (elementary geometry):**
- ordinary-helix formulas for axis advance, curve length, per-rung quantities, and `χ=p/(2πR)`;
- `χ` is invariant under strict uniform similarity scaling;
- a coprime `(m,n)` constant-slope toroidal winding closes after one `2π` parameter cycle.

**CLAIMED / PROVISIONAL MODEL ARCHITECTURE:**
- asymptotic closure density as a useful Hagalaz ruler;
- `χ` as a candidate inter-order tape calibration;
- L0/L1/L2/L3 hierarchy above.

**SPECULATIVE / UNVERIFIED PHYSICS-MAPPING IDEA:**
- one global carrier producing multiple particle-like local readouts;
- electron-like coils and quark-like jammed/deformed states as manifestations of one carrier;
- any connection to actual particle identity or measured particle properties.

---

## Next cursor

Implement a numerical `HELICAL_RULER` diagnostic that:

- detects phase closures from sampled framed curves;
- estimates `R_j`, `p_j`, `χ_N`, `p_bar(N)`, and finite stabilization count `N_*`;
- works first on a uniform helix, then nonuniform helices;
- accepts a closed `(m,n)` toroidal winding as a distinct topology test;
- reports winding closure and true frame holonomy separately.

After that, connect the ruler record to the Hagalaz packet and compare identical geometry through UI, Three-Spheres, and Whirligig/Donut adapters.
