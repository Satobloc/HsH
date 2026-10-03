# Mercer Sandbox — Dimensional Stress-Carriers: 1D Interbraid, 3D Electrogravity, and the Status of the 2D Kernel

**Date:** 2026-10-03
**Status:** SANDBOX / NONCANONICAL
**Role:** Mercer
**Central question:** If SAT is right as a largely standard-physics 4D map, how should H(s)H work?

## Fresh source record

### Old SAT / transition quarry actually read
`SAT_THEORY_ARCHIVE_2023-25/ChatNoteGMPT.txt`, lines 1–700 substantially read.

Useful source material retained:
- working chain: standard Minkowski structure -> radialized 4D representation -> persistent worldlines/worldtubes -> braiding/interactions -> finite resolving hypersurface -> effective standard-physics descriptions;
- `electrogravity` explicitly defined in the baseline as the proposed filament–resolving-sheet response sector;
- `interbraid` explicitly defined as direct filament–filament topological/dynamical interaction;
- historical lattice, fixed numerical constants, Q<=3 locks, and metrological fit machinery are not imported here;
- the file itself repeatedly asks for separation of standard physics, valid scaffold, SAT conjecture, and retired ideas.

### Current H(s)H / September-30 intake actually read
`HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SPEC_COUPLED_FILAMENT_TIMESHEET_STRING_BRIDGE_V01.md.txt`, lines 1–420 substantially read.

Useful current constraints retained:
- resolving timesheet defined as
  [
  F(X,	au)=q-c_Sigma	au-h(mathbf x,	au)=0,
  qquad
  mathbf x=(x^1,x^2,x^3),
  ]
  i.e. a **3D hypersurface**, not generically a 2D membrane;
- finite carrier, carrier geometry, and intersection/readout are kept distinct;
- angle-only coupling on an exactly flat homogeneous sheet gives alignment torque but not a long-range translational force;
- a gravity/Newtonian branch therefore requires an actual sheet-deformation field or another nonuniform mediator;
- finite-core tangency and moving-sheet geometry are live bridges.

### Rejected quarry
`HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/PROPER DIMENSIONALITY.txt`, lines 1–640 sampled substantially, was **not used** in the derivation because it is heavily mixed with NotebookLM-style overclaiming, old lattice machinery, and unrelated conceptual material. It is retained only as provenance that the lane was inspected and rejected.

No HSH_RESOURCES / outside prior art was used before the internal construction.

---

# 1. Minimal dimensional stress-carrier model

Let a deformation field (u) live intrinsically on a (d)-dimensional stress-carrying object. Use the same local tension+bending functional in every dimension:

[
E_d[u]
=
int d^d x
left[
rac{T_d}{2}|
abla u|^2
+
rac{B_d}{2}(
abla^2u)^2
ight]
-
F u(0).
]

Variation gives

[
oxed{
(B_d
abla^4-T_d
abla^2)u
=
Fdelta^{(d)}(mathbf x)
}
]

and define

[
oxed{ell_d=sqrt{B_d/T_d}.}
]

Fourier space is

[
	ilde u(mathbf q)
=
rac{F}
{T_d q^2(1+ell_d^2q^2)}
=
rac{F}{T_d}
left[
rac1{q^2}
-
rac1{q^2+ell_d^{-2}}
ight].
]

The large-distance response is therefore controlled by the Laplacian Green function, while bending only regularizes the source region.

The universal far-field rule is

[
oxed{
|
abla u_d(r)|propto r^{,1-d}.
}
]

Thus the dimension of the object carrying stress fixes the radial exponent before any particle label is assigned.

---

# 2. Exact 1D, 2D, and 3D kernels

Write

[
x=r/ell_d.
]

## 1D carrier

For a line-like stress carrier,

[
oxed{
|partial_s u_1|
=
rac{F}{2T_1}
left(1-e^{-x}ight).
}
]

Far outside the bending core,

[
oxed{
|partial_s u_1|ightarrow rac{F}{2T_1}
}
]

so the transmitted load tends a constant and the corresponding potential is asymptotically linear.

Half-response:

[
oxed{x_{1/2}^{(1)}=ln2=0.69314718ldots}
]

This is **confinement-like** only as a mathematical scaling statement. It is not yet an identification with the strong force.

## 2D effective carrier

For a genuinely two-dimensional stress surface,

[
oxed{
|partial_r u_2|
=
rac{F}{2pi T_2 r}
left[
1-xK_1(x)
ight].
}
]

Far field:

[
oxed{
|partial_r u_2|simrac{F}{2pi T_2}rac1r.
}
]

Half-response of the dimensionless regularization factor:

[
oxed{x_{1/2}^{(2)}=1.25715139068ldots}
]

This reproduces the previous Mercer 2D result, but the current H(s)H source now forces a correction:

> A 2D (1/r) kernel is **not** the generic law of the H(s)H resolving timesheet, because the current timesheet is intrinsically 3D. The 2D law requires an independently derived dimensional reduction, localized mode, shell/disk sector, or codimension-two channel.

## 3D resolving hypersurface

For the current H(s)H timesheet dimensionality,

[
oxed{
|partial_r u_3|
=
rac{F}{4pi T_3 r^2}
left[
1-(1+x)e^{-x}
ight].
}
]

Far field:

[
oxed{
|partial_r u_3|
sim
rac{F}{4pi T_3 r^2}.
}
]

Near the source,

[
1-(1+x)e^{-x}
=
rac{x^2}{2}+O(x^3),
]

so

[
oxed{
|partial_r u_3|
ightarrow
rac{F}{8pi T_3ell_3^2}
}
]

rather than diverging.

Half-response:

[
oxed{x_{1/2}^{(3)}=1.67834699002ldots}
]

No historical SAT constants or observed astrophysical numbers were used in these dimensionless values.

---

# 3. Immediate H(s)H translation

The source taxonomy suggests two primitive interaction locations:

[
oxed{
	ext{Electrogravity: worldtube}leftrightarrow	ext{resolving hypersurface}
}
]

and

[
oxed{
	ext{Interbraid: worldtube}leftrightarrow	ext{worldtube}.
}
]

The dimensional calculation suggests a sharper mechanical distinction.

### Electrogravity candidate

If the actual load propagates through the **3D resolving hypersurface**, then the simplest tension-dominated response automatically has

[
oxed{a_{m EG}propto r^{-2}}
]

after the separate sandbox assumption that projected acceleration is proportional to the relevant medium slope/stress response.

That is precisely the scaling required of a Newtonian weak-field branch, without inserting an inverse-square law by hand.

Bending adds a finite-core regularization,

[
oxed{
a_{m EG}(r)
=
A_3
rac{1-(1+r/ell_3)e^{-r/ell_3}}
{r^2}
}
]

for some constitutive amplitude (A_3).

### Interbraid candidate

If relative braid stress is transmitted primarily along an effectively **1D connector/carrier coordinate**, the corresponding asymptotic load tends a constant:

[
oxed{
F_{m IB}ightarrow A_1.
}
]

Equivalently the stored energy grows approximately linearly with separation along that connector:

[
oxed{
V_{m IB}sim A_1 L.
}
]

That is mathematically confinement-like, though identifying it with the strong interaction remains a separate test.

---

# 4. A useful correction to the previous 2D flat-curve branch

The previous checkpoint
`2026-10-03_TENSION_BENDING_TIMESHEET_FLAT_CURVE_KERNEL.md`
is mathematically valid for a **2D** tension+bending surface.

But current H(s)H defines the resolving timesheet as 3D. Therefore its earlier interpretation as the generic timesheet response was too broad.

The corrected status is:

[
oxed{
	ext{2D kernel = candidate reduced/effective mode, not generic timesheet law.}
}
]

If both a 3D bulk/hypersurface mode and an independently justified 2D reduced mode coexist,

[
oxed{
a(r)
=
rac{A_3}{r^2}
+
rac{A_2}{r}
}
]

outside both bending cores.

Circular balance gives

[
oxed{
v^2(r)
=
rac{A_3}{r}+A_2.
}
]

The crossover is

[
oxed{
r_	imes=rac{A_3}{A_2}.
}
]

Thus a Newtonian-like inner regime and flat outer regime arise automatically **if and only if** H(s)H independently produces a genuine 2D response channel.

Do not insert that channel merely to obtain the desired curve.

---

# 5. Electrogravity may itself have divergence and circulation sectors

A 3D medium can support two geometrically distinct responses without changing ontology.

For a point-like radial source, conservation over spheres gives

[
4pi r^2J_r=Q
quadRightarrowquad
oxed{J_rpropto r^{-2}.}
]

For circulation around a line-like vortex defect, Stokes/circulation geometry gives

[
2pi r,v_	heta=Gamma
quadRightarrowquad
oxed{v_	hetapropto r^{-1}.}
]

This is a potentially useful translation of the existing Electrogravity idea:

- **metric/surface-deformation channel:** divergence-like 3D response;
- **Kelvin/vortex channel:** codimension-two circulation around filamentary defects.

The (1/r) circulation law is a carrier-field scaling, not yet a Coulomb-force derivation. A separate interaction calculation is required before calling it electromagnetism.

---

# 6. Tight solver discriminator

Implement the same tension+bending operator on three fixtures:

1. line / 1D carrier;
2. plane / 2D effective surface;
3. 3D hypersurface.

Apply the same normalized local load and independently vary (B_d,T_d).

After rescaling

[
x=r/ell_d,
qquad
ell_d=sqrt{B_d/T_d},
]

the dimensionless regularization factors must collapse to

[
oxed{R_1(x)=1-e^{-x}},
]

[
oxed{R_2(x)=1-xK_1(x)},
]

[
oxed{R_3(x)=1-(1+x)e^{-x}}.
]

The far-field logarithmic slopes must be

[
oxed{
0, -1, -2
}
]

for 1D, 2D, 3D stress transmission respectively.

This is the clean discriminator: the exponent is not a tunable constitutive fit once the carrier dimension has been fixed.

---

# 7. Failure conditions

This branch fails or must be revised if:

1. current H(s)H geometry does not permit a local tension+bending continuum limit;
2. the resolving timesheet is not intrinsically 3D in the relevant gravity regime;
3. finite-core simulations do not recover the (r^{-2}) asymptote for 3D tension transport;
4. Interbraid stress does not admit an effectively 1D transmission coordinate;
5. long-range response is dominated by nonlocal/topological terms that overwhelm the dimensional Green function;
6. a proposed 2D outer mode cannot be derived independently of the desire to obtain a flat curve.

---

# Mercer checkpoint

The most important result this run is not a new force law but a dimensional accounting rule:

[
oxed{
	ext{stress-carrier dimension}
quadLongrightarrowquad
|
abla G_d|propto r^{1-d}.
}
]

Applied cautiously to the current SAT>H(s)H taxonomy:

[
oxed{
1D 	ext{interbraid-like transmission}ightarrow	ext{constant asymptotic load},
}
]

[
oxed{
3D 	ext{timesheet deformation}ightarrow r^{-2} 	ext{response},
}
]

while

[
oxed{
2D 	ext{response}ightarrow r^{-1}
}
]

is demoted from “generic timesheet” to “possible effective reduced mode requiring derivation.”

That correction makes the framework cleaner, not weaker.

— Mercer
