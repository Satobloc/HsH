# Meridian sandbox — C3 hidden-order grammar (2026-10-01)

**Status:** SILOED PLAYGROUND. Not canonical H(s)H.

## Fresh source reads
- `SAT_THEORY_ARCHIVE_2023-25/SAT XYZ/SAT-Y 4D.txt` — substantially read the old 4D-mode construction through the deuterium/water discussion and the explicit three-filament coil section. Extracted only the geometric ingredient used here: a composite represented by three equal-radius helical strands with phase offsets 0, 2π/3, 4π/3, plus time-surface intersections. Particle/flavor/color labels and historical numerical assignments were not used as targets.
- `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/002. Discreet Space and Dark Matter.txt` — substantially read the discussion of whether apparently smooth gravitational phenomena might arise from underlying spatial structure/discreteness rather than an added substance. No dark-matter fit or historical parameter was imported into the construction below.

## Independent construction
Represent the transverse section of the old three-coil by complex coordinates
[
z_k(s)=a e^{i(	heta(s)+2pi k/3)},quad k=0,1,2.
]
Define cyclic moments (M_n=sum_k z_k^n). Then
[
M_n=a^n e^{in	heta}sum_{k=0}^2 e^{2pi i nk/3}.
]
The root-of-unity sum vanishes unless (3|n). Therefore
[
M_1=M_2=0,qquad M_3=3a^3e^{i3	heta}.
]
A direct numerical check at two generic phases gave M1 and M2 at floating-point zero while M3 had magnitude 3a^3 and phase 3θ.

Thus a perfectly C3-balanced triple worldtube is invisible to transverse first- and second-order anisotropic moments. Its first phase-bearing internal observable is cubic.

## H(s)H translation
Treat the composite as a finite-core worldtube whose centerline can be geometrically simple while its internal C3 frame carries
[
Q_3(s)=M_3/(3a^3)=e^{i3	heta(s)}.
]
This gives a compact operator target:
[
ᚼ: (C,a,Q_3)mapsto(C',a',Q_3')
]
rather than tracking three redundant strand phases separately. Because θ and θ+2π/3 yield the same unlabeled strand set, (Q_3) is the natural permutation-invariant phase coordinate.

For a nested C3 construction, if an outer operation modulates θ(s), then the observable internal phase responds as 3θ(s). This supplies an exact closure discriminator:
[
Q_3(L)=Q_3(0)iff 3[	heta(L)-	heta(0)]in2pimathbb Z.
]
The unlabeled triple can therefore close after a net strand-frame turn of (2π/3), even though a labeled strand does not return to itself. This is a concrete distinction between **set closure** and **strand closure**.

## New sandbox conjecture
Some H(s)H quantization/closure conditions may be permutation-quotient conditions on finite-core internal frames, not closure of individually labeled filaments. If so, apparent fractional closure of a constituent trajectory can coexist with exact closure of the physical composite.

This is a geometry statement only. No identification with quark color, charge, spin, generations, or a historical SAT constant is asserted.

## Failure conditions
- unequal radii/weights or phase offsets break exact C3 and generally activate M1/M2;
- if strands are physically distinguishable, quotienting by C3 permutation is invalid;
- if H(s)H readout couples directly to individual strands, the cubic moment is not a sufficient state variable;
- if canonical ᚼ fixtures do not preserve or controllably break C3, this grammar is not central.

## Solver test
Build a C3 moment/closure solver. Sweep amplitude mismatch ε, phase disorder δ, and nested ᚼ modulation. Measure |M1|, |M2|, |M3| and compare set-closure versus labeled-strand closure. Near the symmetric point, determine the leading leakage laws for M1 and M2. A useful discriminator is whether symmetry breaking produces linear leakage while Q3 remains phase-coherent.

## Cross-pollination
Only after the construction was formed: the HsH discreteness discussion suggests a possible broader use of this mechanism. A coarse readout can look smooth/simple because low-order moments cancel while structured internal information survives at higher order. That is an analogy and possible mechanism class, not a dark-matter claim.
