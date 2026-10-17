# Whirligig setup audit: what was actually implemented (9 Oct 2026)

**Origin:** Nathan asked: “What's the difference between a Clifford-Torus and the Whirlygig? ... is elastic equivalence classifiable under SU(2)? ... where is your setup of the Whirlygig?”

## Correct separation

The Clifford torus is the embedded geometric **surface** `T² = {(z1,z2)∈ℂ²: |z1|=|z2|=1/√2}` in `S³ ⊂ ℝ⁴`. Its curve `H(s)=(cos 2s,sin 2s,cos 3s,sin 3s)/√2` is a fixed-radius special-case **Universal Indicatrix** orbit `H(s)=r(s) R(s)x0`, with `r=1` and `R(s)=diag(Rot(2s), Rot(3s)) ∈ SO(4)`.

The historical **Whirligig** is an attempted geometric translation/derivation **apparatus**. In [FINDING THE DONUT](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/_AUTO_EXTRACTED_TEXT/FINDING%20THE%20DONUT%20(nolat).txt), especially pp. 24–27, Nathan proposes independently represented curves R,Q, a shared origin / crossbar, point `i_r`, `i_q`, rotating planes, Great Annulum `GrAnn`, `W_obble`, `W_iggle`, rotational vector `V`, toroidal `P_ivot`, and derived `Curvy_Lisa` tracing Q with respect to R. Nathan calls this the **3D toy version**. These mechanism-specific controls have not been encoded and are NOT represented by the new paper’s (2,3) orbit.

## Implemented narrow model (SANDBOXED)

The [paper](WHIRLIGIG_CLIFFORD_TORUS_ELASTIC_BACK_HALLWAY_2026-10-08.md) computes directly with the archived fourth-order bending + shell penalty + fixed-target action. Its exact force is chosen by inverse design, `G=H+(κ/k)H''''`, and its Fourier response matches a periodically forced Euler–Bernoulli beam on a Winkler foundation on the specified shell-respecting sector. Nonzero shell stiffness yields a rank-one tangent coupling and half-turn `Z₂` harmonic selection. This does not compute the full historical crossbar relationship; it does not derive Schwarzschild/Hydrogen or Navier–Stokes.

## Which group classifies which structure?

1. `R(s)` acts in `SO(4)`; the two commuting rotations in orthogonal planes form `U(1)×U(1)⊂SO(4)`.
2. The ambient round `S³` is identifiable pointwise with `SU(2)`, via normalized quaternions / 2×2 unitary matrices of determinant 1. The bending energy is consequently representable as `(κR²/4)∫Tr(U''†U'')ds`.
3. The Clifford `T²⊂S³=SU(2)` is **not a subgroup of SU(2)** (SU(2) has rank one, so its maximal torus is U(1)).
4. The unforced source-covariant Whirligig bending + shell + target action is `SO(4)`-equivariant under simultaneous constant rotations of H and G; the fixed G generally breaks that symmetry; the parity selection in the (2,3) driven example is a residual `Z₂` intertwining shift and plane reflection.
5. Accordingly, the calculation gives an **SU(2)-representable elastic geometry** and a separately **exact restricted fourth-order operator equivalence**. It does not classify generic elasticity by SU(2) irreducible representations.

## Domain and equivalence

A reversible, observable-preserving map between specified equation sectors is a meaningful and physically interpretable *geometric correspondence*. It does not require any extra ontological conclusion. However, matching a restricted fourth-order response is not yet a full dynamical equivalence of all degrees of freedom or all observables. More “back hallway” stages may be composed only after each map’s domain, target, invariants and inverse are explicit.

## Actual runnable setup

Local research artifact: `WHIRLIGIG_EXACT_BACK_HALLWAY_SANDBOXED_2026-10-08.zip` (conversation download). Includes `whirligig_torus_test.py`, `whirligig_sideband_test.py`, `whirligig_independent_check.py`, their JSON outputs, and `whirligig_minimal_setup.py` that plots the exact Clifford torus and (2,3) orbit stereographically. All three numerical tests were rerun 9 Oct and completed without errors. For the actual unimplemented historical translation apparatus see source pp. 24–27.

**Reviewer note:** If comparing published papers, do not credit this narrow calculation as an implementation of the original R–Q Great Annulum apparatus. Judge narrow mathematics on its merits; explicitly propose the minimal 4D operator needed for the true two-target Whirligig.
