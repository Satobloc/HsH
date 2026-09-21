# Meridian handoff — RUN 091 Hagalaz / superhelix interlingua

**Date:** 2026-09-21  
**Branch/task:** Meridian / Hagalaz interlingua / semantic architecture  
**Status:** durable sandbox boundary reached  
**Nathan Words:** current Nathan-direct input INGESTED; older rotoexpando material SOURCE ONLY  
**Quarantine:** none consulted

## Result

The current best candidate common state is a framed order `S=(c,r,F)` in `R^4`, with `F in SO(4)` sphere-locked.

General relative framed-sphere similarity has 11 continuous DOF: 4 translation + 1 scale + 6 SO(4) rotation.

Nathan's eight-address compact Hagalaz form has a natural exact specialization when center displacement is locked to the local rung/polar/tangent direction `w`: 1 rung + 1 scale + 6 rotation = 8 DOF.

With `w` as pole/tangent, split the six sphere-grid rotation channels as:

- bending: `xw,yw,zw`;
- normal/equatorial twist: `xy,xz,yz`.

Candidate readable layout:

```text
          ω_xw     ω_yw     ω_zw
        log μ       ᚼ        ξ
          ω_xy     ω_xz     ω_yz
```

This is PROVISIONAL notation architecture, not yet canonical.

## Exact repeated-step law

For finite rung-locked step `U=(μ,ξ,Q)`, `d=ξ e_w`:

```text
c_{n+1}=c_n+r_n F_n d
r_{n+1}=μ r_n
F_{n+1}=F_n Q
```

After `N` identical steps:

```text
r_{n+N}=μ^N r_n
F_{n+N}=F_n Q^N
c_{n+N}=c_n+r_n F_n Σ_{k=0}^{N-1} μ^k Q^k d
```

This makes Three Spheres a direct composition benchmark for repeated Hagalaz.

## UI relation

Nathan's UI remains the shared-center readout `ΔC=0`, with scale and sphere-grid rotation retained. A general Hagalaz step may have nonzero displacement; UI is obtained by recentering the endpoint sphere states for comparison rather than equating Hagalaz itself to `ΔC=0`.

## Helix -> superhelix operation

Use a recursive helical lift around a transported normal frame:

```text
L[C](s)=C(s)+ρ[cos φ(s)N1(s)+sin φ(s)N2(s)]
```

Straight carrier -> helix; helical carrier -> superhelix; repeat for higher order. Rotation-minimizing/Bishop-type transport is the current minimal-gauge default candidate.

## Defaults retained as candidates

- start duplicate spheres coincident and frame-aligned;
- `w` = pole/tangent;
- no gratuitous normal-frame twist;
- no within-order radial dilation by default;
- preserve chirality unless explicit reversal;
- strict scaled similarity implies phase-rate ratio `ν=1/μ` under arclength parameterization;
- do not choose numerical `μ_*` yet;
- compact 8-slot profile is rung-locked; unlock to 11-DOF general state when arbitrary translation matters.

## Artifacts

- `WORKSPACES/MERIDIAN/SANDBOX/RUN_091_HAGALAZ_SUPERHELIX_INTERLINGUA_V01.md`
  - commit `ae1aa923580ab4a4fe044c66690c72368eff0b36`
- `WORKSPACES/MERIDIAN/SANDBOX/hagalaz_step_reference_v01.py`
  - commit `f88b2f7c3054ae8f4bfb9aa710e26466e71900e7`
- current-chat Class-P figures:
  - `CLASS_P_HAGALAZ_8SLOT_v03`
  - `CLASS_P_SO4_SIX_ROTATIONS_v01`

## Guardrails

- no generic script-H as Hagalaz notation;
- no Golden Ratio/Cantor claim without an actual selecting constraint;
- six plane slots are local sphere-frame generator channels, not six invariant finite angles;
- finite `Q` or the ordered path should remain canonical because SO(4) generators generally do not commute;
- meanings of rune variants `ᚽ ᚼ ᚺ ᚻ` remain reserved.

## Next cursor

Implement the recursive helical lift with a 4D rotation-minimizing frame and compare three scale profiles (`μ=1`, `μ=1/2`/inverse `2`, variable μ). Emit S1/S2/S3, all six local rotation channels, UI readouts, and closure/tangency/self-contact diagnostics. The purpose is to see whether any nontrivial default scale or angle is selected by internal geometry rather than convention.