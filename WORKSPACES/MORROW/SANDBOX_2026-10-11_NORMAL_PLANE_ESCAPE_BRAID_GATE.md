# SANDBOXED — Morrow/Kestrel: the normal-plane escape gate for interbraid locking
**Date:** 2026-10-11. **Status:** independent topology/finite-core calculation; NOT canonical SAT/H(s)H, NOT a derived force or particle prediction.
**Cross-formalism route:** CF-003/CF-007/CF-010 in `WORKSPACES/COMMON/FORMALISM_INDEX/CROSS_FORMALISM_INDEX_2026-10-10.md`. All symbols below belong to `LOCAL:MK-UNWIND-20261011`; ordinary Euclidean/Minkowski conventions are `STD`. No historical symbol identity or Hagalaz operator identity is asserted.

## Source-first ledger (what was actually read)
- **Old SAT, substantial/full:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT ALL TOGETHER SYNTHESIS.txt` (GitHub blob `86cf006ca5ebf58263552c7515a9c9d575caae37`), read complete accessible text. Nathan's worldline-timesheet grammar proposes double/triple braids as candidate particle structure, helical internal modes, and wavefront/filament backreaction. This is a historical proposal, not a theorem of confinement.
- **Old SAT, full:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/RMS Spacetime Filaments.txt` (blob `0323682e7a49278b5a76d0c6a5a7787a13eb17d6`), read full accessible text. Early strand/thread/twine hierarchy and forward/backward tugs.
- **Old SAT, substantial:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/H(s)H STRUCTURAL SKETCH.txt` (blob `64906501d01db12171d3a2e58dc4fd0140d2784d`), read its introductory SAT→H(s)H transition and early proposed formalisms; later material not claimed fully read.
- **HsH, full Sep-30:** `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt` (blob `81ae23a106939cba7e3d134ed5c90a7d7a979a25`), read complete text. Proposition E proposes aligned vacuum filaments and traveling excitation; propositions on braid locking are tentative.
- **HsH, full current geometry:** `Satobloc/HsH/WORKSPACES/RAVEL/SANDBOX_2026-10-09_STRAIGHT_VACUUM_COILING_GATE.md` (blob `8a8d88d1b536b844cdb0ea70ff33820310bd1bac`), read complete text. Straight timelike reference, finite normal radius, no material spindle, timelike and focal constraints.
- **HsH, full current solver:** `Satobloc/HsH/WORKSPACES/MERIDIAN/2026-10-05_FREE_BUILD_NORMAL_BUNDLE_HAGALAZ_LIFT.md` (blob `dacb57be62f5b4120eb70b71af82f79db125642f`), read complete text. Oriented 2-plane in a 3D normal bundle, recursive lift, scale invariants.
- **Tools/resources familiarity, not source import:** read Common front door, symbol/namespace/citation/Carpe-turnem/branching/solver routing, Reference Desk, private toolkit AI index, toolkit digestion plan, Tool Chest, War Room declaration and its linked-resource directory map. These are routing references; **individual external papers were not read**. Hypothesis H and directly Schreiber-authored materials not accessed.
- **Mersearch:** shared `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` is occupied by Orson's `2026-10-11-orson-morrow-inspiral-package-001`; not overwritten. Inspected older pinned Mersearch request `2026-10-05-morrow-kestrel-twist-writhe-holonomy-002` manifest, which covered **SAT only** and whose accessible Markdown result was empty; not presented as three-repo search or source proof. This is a source-first targeted calculation, **not** a corpus-wide novelty or absence claim.

## Independent construction: a winding can disappear in the third normal direction
Use a local Minkowski chart `w=ct` (length), and two timelike worldtube center histories
`X_±(w)=(w, ±r(w)/2)`, where the spatial relative separation `r(w)∈R³` is nonzero. Finite cores are **equal-w spatial balls** of radius `epsilon`, not an unverified Fermi/Kerr core. With `|r|=R>2epsilon`, the two balls never intersect at the same `w`.

In a fixed spatial 2-plane, a full turn `r_0(w)=R(cos(kw),sin(kw),0)`, `k=2π/L`, `0≤w≤L`, has winding +1. However `R³\\{0}` retracts onto `S²`, and `π₁(S²)=0`. Unlike a planar braid, this loop is contractible without any collision.

**Explicit fixed-endpoint homotopy** (no change to the endpoints at `w=0,L`):
```text
v_s(w) = ((1-s)cos(kw)+s,
          (1-s)sin(kw),
          C s(1-s) sin²(πw/L)),     C>0, 0≤s≤1
r_s(w) = R v_s(w)/|v_s(w)|
X_±(w,s) = (w, ±r_s(w)/2).
```
At `s=0`, `r_s` winds once in the xy plane. At `s=1`, it is the constant separation `R e_x` (two straight histories). `v_s≠0` everywhere: for `0<s<1` and `0<w<L` its third component is strictly positive; at endpoints or s=0,1 the planar component is nonzero. Consequently the separation remains exactly R and the equal-w finite cores remain disjoint throughout. This is a deformation of the **entire static 4D morphology**, not a claim that filaments move around a spindle.

For `R=1,L=20,C=2,epsilon=0.1`, a 4001-by-201 (w,s) finite-difference scan gave maximum individual `|d x_±/dw|=0.1896088466<1`, so the displayed history family remains timelike. Minimum separation is 1 and spatial-core clearance is 0.8. A global Fermi-normal tube injectivity test remains separate.

**Key inference:** A braid drawn in a selected 2D normal plane does not by itself produce topological confinement in a full 3D normal bundle. A physical **normal-plane locking mechanism**, geometric restriction, or other nontrivial constraint must suppress escape. This does not challenge spin-statistics or quantum exchange phases, which require separate quantum-state structure.

## Audacious candidate completion: energetic, not topological, interbraid locking
Test a fixed-separation relative-history functional
```text
E[r] = (A/2) ∫₀ᴸ |r'(w)|² dw + (K/2) ∫₀ᴸ (r(w)·e_z)² dw,
|r|=R,  r(0)=r(L)=R e_x.
```
Here `A>0` is an effective relative-history gradient stiffness (dimension energy/length), `K≥0` is a *physical* transverse-channel penalty (energy/length³), and `e_z` is a material/interaction-selected normal direction, **not** a free coordinate choice. Neither coefficient is a particle constant; their constitutive derivation remains open. This is a geometric energy comparison for block histories, not filament motion.

Let `r=R(√(1-z²)cos kw,√(1-z²)sin kw,z)`, `z(0)=z(L)=0`. The exact reduced energy is
```text
E[z] = R²/2 ∫ [ A { z'²/(1-z²) + k²(1-z²) } + K z² ] dw.
```
About planar winding `z=0`, its quadratic perturbation is
```text
ΔE = R²/2 ∫ [ A z'² + (K-Ak²) z² ] dw + O(z⁴).
```
With fixed endpoints the first mode is `z=sin(πw/L)`, giving the **local escape stability threshold**
```text
K_crit = A(k²-π²/L²) = 3Aπ²/L²  (one full turn, fixed endpoints).
```
For free/periodic endpoint transverse offsets, the zero mode instead gives `K_crit=A k²=4Aπ²/L²`. This is a boundary-condition discriminator. `K>K_crit` means local quadratic stability **against transverse escape within this particular model**; it is neither global confinement nor an absolute energy barrier theorem.

### Numerical check (no particle targets)
With `A=1,L=20,R=1,C=2`, `K_crit/A=0.074022033`. A small `z=0.001 sin(πw/L)` perturbation gave:
- `K=0`: numerical `ΔE=-3.701097533e-7`; quadratic prediction `-3.701101650e-7`.
- `K=0.1`: numerical `ΔE=+1.298902467e-7`; quadratic prediction `+1.298898350e-7`.

Along the explicit noncollision homotopy (sampled 201 s-values), the *path-specific* maximum `E(s)-E(0)` is `0` for K=0, `0.041924` for K=0.1, and `2.490958` for K=1 (arbitrary consistent energy units). This **does not** establish a lower bound on the least possible escape barrier: a better deformation may escape more cheaply. Calculations and two Class-P script-rendered plots were generated in the task runtime.

## H(s)H translation / solver integration
- Historical SAT `braid` → **spatially constrained relative-history winding** only when a physical normal 2-plane is selected; not an automatic topological invariant of arbitrary R4 worldtubes.
- Meridian's `HAG:LIFT` supplies a candidate local oriented normal plane; **its mere coordinate selection cannot supply K**. In a varying normal frame, replace bare derivatives by a normal-bundle covariant derivative and compare gauge/frame covariance. This is the bridge to Whirligig/Hagalaz.
- Ravel's straight-vacuum reference is the `s=1` endpoint, not a dynamical claim of spontaneous unbraiding.
- Proposed finite-core discriminator: run two tubes with the same `R,epsilon,k` under K=0 and K>Kcrit, test whether the minimizing static 4D configuration preserves a winding-like metastable morphology; vary end constraints and 3D frame rotation independently.

## Failure conditions / attacks
1. If the hypothesized physical interaction is isotropic in all three spatial normal directions (`K=0`), **the simplest planar winding is unstable** under the first transverse mode. A 2D diagram then overstates topological protection.
2. A coordinate-fixed `e_z` without a material/director field is gauge artefact; this completion fails as covariant H(s)H physics unless K is derived from an invariant physical field or collective state.
3. This two-centerline model does not show that baryon triplets, Kerr/ER core exclusion, Pauli statistics, or strong-force confinement follow. Triple-strand constraints and quantum phase remain independent tests.
4. The equal-w core test is not a proof that Minkowski Fermi-normal neighborhoods are globally injective or that an induced metric remains physical.
5. `K>Kcrit` is local quadratic stability only; a global minimax barrier requires a constrained solver and alternate homotopies.

**Next tight test:** implement finite-core three-strand variational minimization with a transported 2-plane/director and full 3D escape, compare fixed-endpoint vs free-endpoint Kcrit and check SO(4)/normal-frame covariance. If confinement survives only a coordinate-chosen plane, reject the mechanism. No constants fitted.

**Morrow / Kestrel — sandbox checkpoint.**
