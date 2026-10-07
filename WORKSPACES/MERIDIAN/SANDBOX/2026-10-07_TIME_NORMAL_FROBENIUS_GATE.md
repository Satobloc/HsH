# SANDBOXED — Meridian: time-normal rotation, integrability, and induced curvature
**Date:** 2026-10-07 EDT. **Status:** independent mathematical toy / NOT a physical claim or canonical H(s)H operator. **Branch:** Meridian geometric-solver unification / ᚼ. **Quarantine:** PRIOR_ART not accessed.

## Intake / exact source coverage
- Original concentrated SAT theory corpus: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt`, blob `1854995be3311f565739f2be64269cbb0385a82f`; fetched lines 1–400, 59,533 characters returned; substantial read of F1–F3 opening constructions. Source states Euclidean R4, `y(λ)=r(λ)R(λ)x0`, `R∈SO(4)`, `Ω=R'R^-1`, worldline/superhelix rotation, time-normal coupling and metric induction. Its particle/constant assertions are **not** imported as validated results. Caution: source writes `SO(4) ≅ SU(2)×SU(2)`; mathematically the direct product is **Spin(4)**, whereas `SO(4) ≅ (SU(2)×SU(2))/{±(1,1)}`.
- New HsH upload: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/7OCT26_A_GRADE_MINEABLES/KEY CONCEPT - IRI.txt`, blob `ba94d51313fb94fb6af69cb76ccfc84141838abe`; read lines 1–180, including Nathan's worldtube-bending / inverse-refractive-index B clarification and numerical/units critiques. No numerical B is used here.
- Sep 30 upload: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT Math Extension.txt`, blob `aadf275de914f941298951d7d34205dd4e90dc33`; read lines 1–200, including suggested mapping of time-normal derivatives to GR foliation/extrinsic geometry and optical correspondence. These are proposals, not imported proofs.
- Current controlling interpretation: `HsH/🔑/🔑.md`, `🔑/O_EFF_IS_THE_REPRESENTATIONAL_DEFAULT.md`, `🔑/H0_TO_C_IS_THE_UNIVERSAL_METRIC_GRADIENT.md`. One manifold/one metric gradient, not dual expansion speeds. Torsion begins as ordinary twist; geometry decides when distinctions are required.
- Reference packet overview read: `WORKSPACES/COMMON/REFERENCE_DESK/README.md`; `HSH_RESOURCES/indexes/ai_source_index/HSH_TOOLKIT.md`, `info/TOOLKIT_DIGESTION.md`, `HQ/TOOL_CHEST.md`, `!_HSH_RESOURCES_INDEX.md`, `info/NATHAN_PREFERENCES/BOOT.md`, `HQ/THE_WAR_ROOM/DECLARATION.txt`; Reference Desk's complete War Room link inventory noted. Relevant mathematical technique here is standard Frobenius hypersurface-orthogonality, derived independently before consulting the external toolkit. No PRIOR_ART ingress.
- Symbol check: `WORKSPACES/COMMON/terminology/SYMBOL_REGISTRY.md`; all symbols below are **LOCAL:MERIDIAN-NORMAL-GATE** scratch, not new shared definitions. Time coordinate `t` below has **length** units; `k` is inverse length. `B` remains dimensionless and genealogy-unresolved.

## Independent construction
Start from the SAT UI's SO(4) rotation of a preferred Euclidean unit time normal `n=R(x)e4`. As a candidate minimal metric map (not a derived field equation), define `g=δ−2n♭⊗n♭`, `n·n=1`. This gives exactly one negative metric eigenvalue, `g²=I` in the fixed Euclidean frame, `det(g)=−1`.

**Question:** Is the magnitude of time-normal turning enough to determine H(s)H geometry? Compare two rotations through the **same** `J14` generator, differing only in which coordinate drives the rotation:

```text
Case L (longitudinal): n_L=(sin(kx),0,0,cos(kx))
Case T (transverse):   n_T=(sin(kz),0,0,cos(kz))
Coordinates (x,y,z,t); Euclidean δ=diag(+,+,+,+).
```

Both have `|∇n|²=k²`. Their induced metrics have identical component form in the x,t block, `g_xx=cos(2kq)`, `g_xt=−sin(2kq)`, `g_tt=−cos(2kq)`, where `q=x` for L and `q=z` for T. Yet the **direction of variation** is physically/geometrically consequential.

For `α=n♭`, Frobenius requires `α∧dα=0` locally if n is to be normal to genuine 3D hypersurfaces.

**Exact symbolic calculation (SymPy, full 4D Christoffels and Ricci):**

| Invariant | L: θ=kx | T: θ=kz |
|---|---|---|
| `|∇n|²` | `k²` | `k²` |
| `α∧dα` | `0` | `−k dx∧dz∧dt` |
| `|α∧dα|` | `0` | `|k|` |
| `Scal[g]` | `4k² cos(2kx)` | `2k²` |
| `det g` | `−1` | `−1` |

The code checked both `n·n=1`, `g²=I`, `det(g)=−1`, all Frobenius components, full Ricci contraction, and exact expressions. It also checked the SO(4) algebra `[J14,J24]=−J12` with `(Jij)_ij=+1,(Jij)_ji=−1`.

**Result:** Same rotation-generator family and same total normal gradient, but one congruence is hypersurface-orthogonal and the other is not. Their induced scalar curvatures differ. Therefore a scalar 'torsion strength' or one B-like angle is not enough to reconstruct the geometry: **directional derivatives and integrability are necessary discriminators**. This is not a reason to proliferate physical primitives; it is a mathematical gate on the minimal normal field.

## H(s)H translation / ᚼ grammar
- Local trial ᚼ: `H[i4;θ(q)] = exp(θ(q) Jij)`, acting on the time normal. **Do not register this as the canonical ᚼ operator.**
- Candidate `ᚼᚼ`: compose rotations in distinct time-normal planes. At second order the noncommutativity `[J14,J24]=−J12` creates a spatial-plane generator without separately postulating spatial twist. This is algebra, **not** a derivation of spin, force or chirality.
- A time-normal that actually defines an instantiated timesheet must satisfy Frobenius; otherwise reinterpret it as a rotating **flow congruence** not everywhere orthogonal to a single family of timesheets, or reject that ansatz. The model itself must decide which notion is intended.
- Local `SO(4)` frame connection `R⁻¹dR` can be pure gauge/flat even when the induced `g` has nonzero Ricci. Do not equate frame rotation with GR curvature.
- Both nonzero-k toy metrics have nonzero Ricci, hence **fail the vacuum Einstein equation**. They are not Schwarzschild/Kerr solutions or gravitational predictions.

## Failure gate / next solver experiment
**Failure:** Any claim that the magnitude `|∇n|` alone determines an effective metric or an intrinsic timesheet fails on this exact pair. If `n` must be a hypersurface normal, case T is excluded for `k≠0`.

**Next test:** Inverse-map **two standard exact GR cases**: a flat accelerated Rindler congruence and a nonflat static Schwarzschild exterior, solving for admissible `n(x)` under `g=δ−2n⊗n` with explicit coordinate freedom, Frobenius condition, and Einstein tensor residual. If the rank-one Householder metric ansatz cannot reproduce both, document precisely which additional geometric degree of freedom is required; do not add one by taste. Track `Scal[g]`, `Ric[g]`, `|n♭∧dn♭|`, and coordinate-invariant tidal quantities.

**Computation artifacts produced in this run:** `/mnt/data/meridian_normal_gate/normal_field_gate.py`, `scalar_curvature_comparison.png`, `frobenius_gate.png`. These local paths are not GitHub artifacts; user-facing downloadable links are supplied in the task thread.

**Provenance boundary:** SAT/HsH file claims above are recovered source statements. The two-field comparison, curvature identities, and suggested inverse-GR gate are this run's independent SANDBOXED construction. No 0.239/0.246/14.1° value was fitted or used.
