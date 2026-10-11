# GRURPLE-A — Braid topology vs moving-section kinematics prior-art audit — 2026-10-11

**Worker:** Aster / prior-art, provenance, Nathan-fidelity  
**Scope:** Nathan's 23 Mar 2024 rule `two intertwined lines -> points on the moving plane orbit one another` versus standard braid/configuration-space mathematics  
**Status:** `AUDIT_TRANCHE_COMPLETE`  
**Paper-A manuscript state:** formal review remains frozen. This is lineage/formalism clarification, not a second formal review.

## 1. Internal source under comparison

Nathan's primary March-2024 source:

- `Mar23.2024 - DIMENSIONAL GRAVITY - iPhone_Screenshot - bellomy.txt`
- https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/Mar23.2024%20-%20DIMENSIONAL%20GRAVITY%20-%20iPhone_Screenshot%20-%20bellomy.txt

Load-bearing direct Nathan rule:

> “If two lines are intertwined like a braided string, the points on the moving plane will appear to orbit one another.”

Nearby, Nathan separately derives the special straight-axis + perfect-helix case, with one section point stationary and the other tracing a circle at fixed radius.

## 2. Standard mathematical object

For two **labeled** points in the plane, use the ordered configuration space

\[
F_2(\mathbb R^2)
=
\{(z_1,z_2)\in \mathbb C^2\mid z_1\neq z_2\}.
\]

Introduce center and relative coordinates

\[
c=\frac{z_1+z_2}{2},
\qquad
w=z_1-z_2.
\]

Then

\[
F_2(\mathbb R^2) \simeq \mathbb C\times(\mathbb C\setminus\{0\}),
\]

so

\[
\pi_1(F_2(\mathbb R^2))\cong \mathbb Z.
\]

The integer is the winding number of the relative coordinate:

\[
n
=
\frac{1}{2\pi}\oint d\arg w.
\]

For two strands this is the pure-braid invariant. The topology records **how many times the relative coordinate winds around the collision point (w=0)**, with orientation.

It does **not** specify:
- a circular trajectory;
- fixed separation;
- constant angular velocity;
- pitch of a 3D helix;
- a force law;
- a dynamical orbit.

Those are geometric/dynamical choices inside a topological class.

For indistinguishable points, quotienting by exchange yields the usual two-strand braid group (B_2\cong\mathbb Z). The elementary Artin generator (\sigma_1) exchanges the two endpoints; the pure full winding of labeled points corresponds to (\sigma_1^2).

## 3. Circular representative

A particularly simple representative of winding (n) is

\[
w(t)=2R\,e^{i2\pi n t/T}.
\]

With fixed center (c),

\[
z_1(t)=c+R\,e^{i2\pi n t/T},
\qquad
z_2(t)=c-R\,e^{i2\pi n t/T}.
\]

Both points then orbit the common midpoint on circles of radius (R), always opposite one another.

This is a perfectly valid braid representative, but it is **not forced by the braid class**. Any deformation

\[
w(t)=\rho(t)e^{i\phi(t)},\qquad \rho(t)>0,
\]

with the same net change

\[
\Delta\phi=2\pi n
\]

lies in the same pure-braid class, even when (\rho(t)) varies wildly and the projected paths are noncircular and nonuniform.

Therefore:

> **braid topology fixes winding/exchange class; a circular mutual orbit requires additional geometric structure.**

## 4. Relation to a moving-section helix

If two extended strands are embedded so that their transverse coordinates at section parameter (s) are

\[
z_1(s)=c+R e^{iks},
\qquad
z_2(s)=c-R e^{iks},
\]

then a plane advancing uniformly through (s) reads out exactly the circular representative above.

Here:
- (R) fixes separation/radius;
- (k) fixes winding per unit section advance;
- the plane speed converts (k) into apparent angular speed.

This is essentially the kinematic content of Nathan's March-2024 intertwined/helical readout.

But the word **braid** alone does not imply this representative. A topologically equivalent pair of strands can be stretched, radially distorted, locally slowed, accelerated or otherwise isotoped without changing braid class.

## 5. Prior-art typing

### Generic braid/worldline topology — old prior art

Artin braid theory long predates SAT. Modern sources characterize braid groups as fundamental groups of configuration spaces of points; the physical interpretation as indistinguishable point motions in two dimensions is standard.

External source checks in this tranche include:
- Pierre Cartier, 1997 review: braid group (B_n) described as fundamental group of configuration space of (n) unordered points in a plane, with physical interpretation as indistinguishable particles moving in two dimensions.
- Bronislaw Wajnryb, 2021: recalls Artin's geometric braid definition.
- Bohnenblust, 1947: explicitly describes Artin's braid theory through projected strands and neighboring-strand interchange.
- standard graph/configuration-space literature confirms the same fundamental-group viewpoint.

These sources establish the **topological** prior art, not Nathan's exact moving-section embedding.

### Circular braid representative — mathematically ordinary, but not the theorem

The circular two-strand representative follows trivially once one writes the relative coordinate with constant magnitude and monotone phase. It would be unsafe to claim novelty for that representative merely because the checked braid references do not spell out the same picture.

Status:
`STANDARD_CONSTRUCTION / NOVELTY_UNRESOLVED_AS_HISTORICAL_WORDING`.

A stronger historical novelty claim would require dedicated primary-source archaeology for explicit double-helical / rotating-section braid drawings, not just general braid-group sources.

### Nathan-specific value in the March source

What is distinctive in the checked internal source is the **operational kinematic grammar**:

1. choose extended line/helix/braid geometry;
2. advance a lower-dimensional section;
3. read the intersections as particle-like points;
4. infer apparent rest, translation, circular motion, approach/separation, etc. from the higher-dimensional geometry;
5. then generalize the worked cases into a proposed grammar for physical motion/interactions.

Hinton and Smith already provide striking prior art for steps 1–4 in broad form. Artin/configuration-space mathematics provides the topology for braided point histories. Nathan's later programme attempts to weld these into a Minkowski-first physics reconstruction.

That synthesis must be compared claim by claim rather than assigned novelty wholesale.

## 6. Important formal distinction for H(s)H work

Do not write:

> “a braid makes the particles orbit.”

Write instead something like:

> “a nonzero two-strand braid fixes a winding/exchange class. A chosen helical representative with controlled radius and section parameterization produces the circular orbital readout.”

This distinction separates:

- **topology:** braid word / winding class;
- **embedding geometry:** strand shape, radius, pitch, curvature/torsion;
- **section kinematics:** how the instantiating plane/time-surface advances;
- **dynamics:** why that embedding occurs or is stable.

Collapsing those four layers would turn a topological classification into an unsupported force law.

## 7. Paper-A consequence

No immediate Paper-A manuscript defect arises because R1 already warns against object-level vocabulary collapse and demands explicit maps/invariants.

However, any future ancestry/prior-art section should separate:
- Hinton/Smith moving-section/filament antecedents;
- Artin/configuration-space braid topology;
- Nathan's concrete moving-section kinematic realization;
- later SAT/H(s)H physical interpretation.

This is a stronger and cleaner ancestry story than saying simply “braids are old.”

## 8. Next cursor

The next high-value question is whether the **two-/three-strand particle assignment** in Nathan's early SAT material has substantive pre-SAT physical antecedents beyond generic braid mathematics.

Candidate comparison surfaces:
- particle-as-braid models;
- Bilson-Thompson-type preon/ribbon constructions;
- 3-braid particle classifications;
- Asselmeyer-Maluga 4-manifold / particle braid work;
- any older worldline-braid particle interpretations.

Keep the question granular:
**Does an external source predate Nathan on the same particle-role assignment, or only on the mathematical braid machinery?**
