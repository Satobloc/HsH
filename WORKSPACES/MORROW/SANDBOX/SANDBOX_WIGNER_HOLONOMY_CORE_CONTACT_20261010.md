# Morrow + Kestrel | Wigner-holonomy finite-core contact gate (SANDBOXED)

**Date:** 2026-10-10. **Status:** independent local Lorentz derivation plus assumed normal-core profiles; not H(s)H theory authority, no particle constants fitted, no force law derived.

## Provenance and source coverage

- Old SAT: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2023-24 FRAMEWORK DEVELOPMENT/SATv TIME_WAVEFRONT.txt` (entire 95 lines / 3,400 characters; compiled assistant-style historical formulation, **not** verified Nathan raw dialogue). Angle/twist-sensitive contact and drag in lines 11–17 and 76–79. Also `2023-24 FRAMEWORK DEVELOPMENT/SATv FORMAL POSTULATES.txt` (entire 59 lines / 3,800 characters; draft, not adopted).
- Current HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT WEIRD IDEAS — Solenoidbit.txt` (entire 128 lines / 18,337 characters). Nathan's original nested-solenoid thought at line 3 and field-envelope idea at line 30; intervening expansions are assistant prose, not Nathan-authored theory. `WORKSPACES/WORLDTUBE_LAB/FINITE_CORE_TANGENCY_PACKET_002.md` (entire 417 lines / 13,668 characters; its anisotropy/gauge distinction around lines 290–313). `WORKSPACES/MERIDIAN/SANDBOX/WHIRLIGIG_KERNEL_0.md` (targeted carried-frame sections 234–252 and 631–655, not complete read).
- Onboarding: current Common front door, relevant symbol/citation/workflow controls, reference desk, and HSH_RESOURCES War Room declaration/resource routing reviewed. No quarantined/PRIOR_ART material opened. Exact-source retrieval only; no Mersearch corpus-wide novelty claim.
- Source anchors: [old wavefront](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/2023-24%20FRAMEWORK%20DEVELOPMENT/SATv%20TIME_WAVEFRONT.txt#L11-L17); [Solenoidbit](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT%20WEIRD%20IDEAS%20%E2%80%94%20Solenoidbit.txt#L1-L3); [tangency](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/WORLDTUBE_LAB/FINITE_CORE_TANGENCY_PACKET_002.md#L290-L313); [Whirligig](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/SANDBOX/WHIRLIGIG_KERNEL_0.md#L234-L252).

## Geometry, namespace and result

**LOCAL:MK-WIGNER-20261010** only. Use standard Minkowski `η=diag(-1,1,1,1)`, `T=ct`. Symbols `α,β` below are *local boost rapidities*, not shared physics fine-structure α. `Ω` is a local Wigner angle, `d=(d_x,d_y)` signed normal-plane offset. This is **not** an SO(4)/ᚼ lift.

Two orthogonal pure boosts `L=B_y(β)B_x(α)` give terminal tangent `u=L e_T`. Let `P` be the pure boost taking `e_T` to `u`. Then `W=P^{-1}L` fixes `e_T` and is a spatial rotation:

```
Ω = atan2(sinh(α)sinh(β), cosh(α)+cosh(β)).
Ω ≈ αβ/2 for small rapidities.
```

`P W` and `P W^{-1}` yield the **same terminal 4-velocity** with opposite carried-frame holonomy. This is standard Wigner/Thomas geometry, not a novel Lorentz theorem. A physical anisotropic material director is required to make the rotation observable.

For local anisotropic Gaussian core profiles `Σ_A=diag(a²,b²)`, `Σ_B=diag(c²,e²)`, set `S(Ω)=Σ_A+R(Ω)Σ_B R(Ω)^T`. Their exact normalized overlap is

```
I(Ω)= exp[-d^T S(Ω)^(-1) d/2]/[2π sqrt(det S(Ω))].
Q=(c²-e²)sin(Ω)cos(Ω).
ln[I(+Ω)/I(-Ω)] = 2 Q d_x d_y / det S(Ω).
```

This is the **new sandbox discriminator**: non-collinear acceleration history can generate a relational, handed contact contrast **without prescribing an independent twist frequency**. It is an overlap proxy, not a force or chirality quantum number. Weak-boost leading law:

```
ln[I(+Ω)/I(-Ω)] ≈ (c²-e²)d_x d_y αβ / [(a²+c²)(b²+e²)].
```

## Independent numerical and hard-core attack

Dimensionless fixture: `α=.8, β=.6, a=1.3, b=.5, c=1.1, e=.35, d=(.55,.42)`.

| Calculated quantity | Result |
|---|---:|
| Wigner angle | 0.220470449368131 rad = 12.632026256° |
| Gaussian I(+Ω), I(-Ω) | 0.118053050379, 0.107589030281 |
| Gaussian contrast | **1.097259172891** |
| Compact hard-ellipse overlap (+Ω), (-Ω) | 0.601814879802, 0.492537300497 |
| Hard-core contrast | **1.221866606233** |

Gaussian exact integral agrees with independent 96×96 Gauss-Hermite quadrature to ~3e-17 absolute. Hard ellipse 1D exact-chord quadrature agrees with independent 3,840-vertex polygon intersection within 5e-7. Lorentz invariance residual 4.44e-16; terminal-velocity difference 3.14e-16.

**Null controls:** zero boost loop, zero signed offset component, or circular B core eliminate Gaussian contrast. Mirror `(Ω,d_y)→(-Ω,-d_y)` preserves both Gaussian and hard-core overlap exactly. **No fundamental parity violation.**

## Attack and next cursor

- A director-free/circular core cannot observe frame holonomy: it is gauge. The Gaussian is a noncompact smooth surrogate; compact ellipse test preserves only qualitative sign sensitivity, not its amplitude.
- Different acceleration paths generally change full centerline geometry. Same terminal tangent **and terminal contact offset are imposed**; no complete contact-worldsheet interaction integral has yet been calculated.
- Wigner holonomy is continuous and path-dependent, **not** a Hopf/knot topological invariant, not a force, not particle mass, and not a physical reconnection rule.
- Minkowski `SO(1,3)` boost transport is not yet derived from H(s)H's proposed Euclidean `SO(4)`/ᚼ machinery. Historical 0.239 rad is not a target; this fixture's angle is independently generated and freely adjustable.

**Next test:** construct curved ᚼ histories with proper Fermi-Walker/induced-metric normal-frame transport, attach rank-two anisotropic supports, calculate the complete four-dimensional contact worldsheet, recover the weak-boost mixed term and the circular/parity nulls, then introduce a constitutive interaction law. Reject this as an Interbraid mechanism if the response fails under consistent frame transport.

**Reproducibility:** full Python solver, JSON checks, 3 Class-P figures and expanded source ledger were generated in this task's downloadable local checkpoint. They are not part of this repository commit.

*Morrow / Kestrel*
