> **USER CORRECTION (2026-10-21):** The older term `GrAnn / Great Annulum` was mistaken. The intended figure was an **Analemma**. This original selected-contact great-circle sketch is obsolete. See [the current Analemma/contact-frame reconstruction](ANALEMMA_CORRECTION_2026-10-21.md). Do not instruct Sites to restore the round track.

> **HISTORICAL IMPLEMENTATION, SUPERSEDED 2026-10-21:** This earlier wall-coupled great-circle version used OUTER-wall selected rolling and independent elbow phase; it is no longer the canonical Whirligig mechanism. The current version uses inner Donomphulon rolling, outer P_ivot, three-axis minimum-return GrAnn, and LCM-locked elbow. See [current technical design](../../../tools/whirligig_rq/GRANN_INNER_WALL_ROTATIONAL_LOCK_2026-10-21.md).

# GrAnn → Torus Wall | Selected-contact mechanical reconstruction

**Status:** SANDBOXED mechanical carrier implemented; FULL HISTORICAL GRANN NOT RECONSTRUCTED  
**Date:** 2026-10-18  
**Browser source:** `PUBLIC_SITE/instruments/whirligig/index.html`  
**Reconstruction commits:** `215f83ff9775021cd321fdcd73d5dbf7cb925f70` (constraint), `8c0aa800e7b6697e5144fdeacf70ac87ec8af36d` (drawing)  
**Reference engine:** `tools/whirligig_rq/whirligig.py`, particularly `frame_and_roll`.

## Nathan Direct source constraints

The original 3D toy is transcribed in [FINDING THE DONUT, pp. 25–27](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/_AUTO_EXTRACTED_TEXT/FINDING%20THE%20DONUT%20(nolat).txt).

The construction specifies: GrAnn self-intersection `GrAnn_Omph` at the R-side point `i_r`; the antipodal `GrAnn_t_ipode` self-tangent; `P_ivot` simultaneously on GrAnn and `TorOuRad`; `Donomphulon` moving along `TorInCirc`; `BigRad` through the Donut center, Donomphulon and P_ivot; sphere rolling with **even multiple of GrAnn circuits per outer-torus circuit**; and Curvy Lisa written by the single constrained perpendicular elbow on the torus. The original text calls this the **3D toy version**.

**Source limitation:** The historical excerpt specifies the two special self-intersection/tangency constraints but does not provide a unique analytic parameterization of a self-intersecting Great Annulum. A great circle is therefore a partial carrier model, not the full named GrAnn. Do not invent that missing topology or claim `GrAnn_Omph=i_r` is satisfied.

## Implemented contact-driven kinematics

Let `R` be the torus major radius; `a=b` the torus tube radius and sphere radius. Let `ψ` denote the torus-centerline orbital angle. The chosen GrAnn contact-phase speed is

```text
gear = (R+a)/b    (historical even winding requires gear=2n, n positive integer)
γ(ψ) = gear · ψ
r_GrAnn_body(ψ) = (sin γ, 0, cos γ)
W(ψ) = (e_r, e_phi, e_z)
B(γ) = (r_GrAnn, t_GrAnn, n_GrAnn)
Q(ψ) = W(ψ) · B(γ)^T
P_ivot(ψ) = (R+a) e_r(ψ)             // constrained outer wall
C(ψ) = P_ivot(ψ) − b Q(ψ)r_GrAnn(ψ) // center DERIVED from wall contact
GrAnn_carrier(λ;ψ) = C(ψ)+b Q(ψ)(sin λ,0,cos λ)
Donomphulon(ψ) = (R−a) e_r(ψ)       // inner torus circumference
GrAnn_antipode = C(ψ) − b Q(ψ)r_GrAnn(ψ)
BigRad: origin ↔ P_ivot, containing Donomphulon.
```

The browser derives C from the outer-wall pivot and GrAnn body contact rather than positioning C independently and merely drawing a ring afterward. This is an explicit selected-contact kinematic constraint, although **for this particular orientation it algebraically reproduces the earlier center path**. It does *not yet* add the full source-described force/kinematic influence of an intersecting GrAnn on the R follower and composite elbow. Do not represent that incomplete part as solved.

At `a=b`, the opposite point of the selected great-circle carrier is at the inner torus circumference. That is a consequence of this degenerate equal-radius contact construction, not a proof of no-slip across the entire contact circle.

Selected-contact rolling condition per unit `ψ`:
```text
dC/dψ + ω × (b e_r) = 0;   ω=(0,0,−R/b).
```
The simultaneous GrAnn/contact conditions depend on `ψ`; the independent R/Q sweep-plane contact selection and single perpendicular elbow remain unchanged from the prior browser instrument.

## Browser diagnostics

The revised UI includes a panel named **GrAnn torus-wall coupling**, plus a 4:1 historical even-winding reference button. The sphere body-frame view shows the magenta great-circle carrier with its gold moving selected contact and blue antipode. The world/toroidal view shows the carrier, gold `P_ivot`, blue `Donomphulon`, and `BigRad`. The panel numerically reports:
- `P_ivot` deviation from outer torus implicit surface and the contact constraint;
- antipode-to-Donomphulon coincidence and inner torus wall residual;
- BigRad collinearity;
- selected-point rolling velocity residual;
- gear ratio and whether **an even integer per individual torus orbit** is satisfied;
- **R-side input anchor distance from the great-circle proxy**, specifically exposing the unimplemented `GrAnn_Omph` coincidence.

The UI permits non-even radius settings for exploration but marks them **NOT EVEN**, rather than silently certifying full historical compliance. The default `R=1.65, a=b=0.55` yields gear `4`, an even integer.

## Executed numerical tests

JS syntax validated; a stub DOM/canvas executed 31 scenarios: default, each of 14 equation profiles on R, each of 14 on Q, a non-even gear negative control, and restoration to 4:1 gearing. All 1,651 samples in each configuration had first-forward elbow-to-torus intersections, zero east/west hemisphere violations, and normalized crossbar/elbow orthogonality errors no more than `4.7×10⁻¹⁶`. Maximum numerical wall-pivot, inner wall, inner antipode, BigRad alignment and selected-contact velocity errors across these tests were each below `10⁻¹⁵`. The non-even test (`R=1.60, a=b=.55`, ratio `43/11`) was correctly marked noncompliant; the even reference button restored 4:1. Canvas rendering callbacks executed.

**Critical unmet original constraint:** In the default configuration the *maximum gap* between the source R-side moving point and this carrier's plane is about **0.302 in the model's distance units** (not zero). This quantifies why the great-circle carrier is not yet the required self-intersecting GrAnn with Omph fixed at `i_r`. The full GrAnn topology and its influence on the equation follower must be recovered or independently derived, then tested, before claiming complete coupled apparatus reconstruction.

No live browser smoke test or ChatGPT Sites deployment was performed. A GitHub file update is not a Sites publication.

## Next derivation target

Recover or specify an explicit curve `G(u;ψ)` on the sphere satisfying simultaneously:

1. Self-intersection at `i_r(ψ)` (two parameters with same 3D point but independent directions);
2. Opposite special tangency at `t_ipode`, with intended parameter/normal convention clarified;
3. `P_ivot∈G` AND `P_ivot∈TorOuRad`;
4. A moving `Donomphulon∈TorInCirc` and the requested BigRad alignment;
5. Rolling orientation plus even GrAnn winding per torus orbit;
6. Coupled influence on actual crossbar/elbow motion, with no extra projector.

A parameterization cannot be declared solved by replacing GrAnn with an unconstrained great circle or a free oscillator. Record failures and incompatible constraints explicitly.
