# Meridian Run 089 — Tangency coefficient consistency audit

**Date:** 2026-09-24  
**Status:** SANDBOX / corrective formalization note  
**Scope:** local finite-core tangency geometry only; no particle identification, physical validation, or solver-equivalence claim.

## Direct source recovered

The direct Working Group handoff for `FINITE-CORE TANGENCY PACKET 002` states:

- quadratic contact: `z + α s + (A_rel/2)s² = 0`;
- bulk `B³` thin-sheet 3-volume scales as `ε^(5/2)|A_rel|^(-1/2)` with coefficient `8π√2/5`;
- boundary `S²` and generic tilted `B²` two-area scale as `ε^(3/2)|A_rel|^(-1/2)`;
- tilted `B²` retains `sqrt(β)`, `β=|P_E n|`, with exact `β=0` exceptional;
- implementation must sweep without fitting.

Source: `SAT_THEORY_ARCHIVE_2023-25/WORKING_GROUP_1.txt`, finite-core tangency handoff posted by Nathan.

## Consistency result

The universal quadratic-tangency integral is

[
I_p(ε,k)=\int_{-\sqrt{2ε/k}}^{\sqrt{2ε/k}}
(ε-k s^2/2)^p ds
=
\sqrt{2/k},B(1/2,p+1),ε^{p+1/2}.
]

For `p=2`,

[
I_2 = \frac{16\sqrt2}{15}\,ε^{5/2}k^{-1/2}.
]

Therefore a packet coefficient

[
\frac{8π\sqrt2}{5}
]

requires the fixed-`s` leading transverse measure coefficient to be

[
C_{B^3}=\frac{3π}{2},
]

because `C_(B3) I_2 = (8π√2/5) ε^(5/2)k^(-1/2)`.

That is **not** the same local normalization as the ordinary radius-`ρ` Euclidean 3-ball cap formula

[
V_{cap}(δ)=πδ^2(ρ-δ/3)
=πρ,δ^2+O(δ^3),
]

which would instead yield leading coefficient

[
\frac{16πρ\sqrt2}{15}.
]

The two coefficients coincide only under the special normalization `ρ=3/2` (in the same length units), or under an equivalent redefinition/rescaling of `ε`, the transverse measure, or the reported normalized observable.

## Correction boundary

A previous Meridian sandbox derivation (“Tangency 004”) correctly recovered the **exponents**
`B³ -> 5/2` and `S² -> 3/2` for ordinary Euclidean cap geometry, but its B³ coefficient must **not** be presented as a derivation of Packet-002's stated `8π√2/5` coefficient without first recovering the packet's precise normalization/measure definition.

This is now an explicit open normalization discrepancy, not a physics discrepancy.

## Discriminator

Any implementation claiming to instantiate Packet 002 should separately report:

1. the dimensional definition of `ε`;
2. the radius/scale convention for the `B³` normal core;
3. whether the reported quantity is raw cap volume or a normalized measure;
4. the fixed-`s` leading coefficient `C_(B3)`;
5. the resulting integrated coefficient.

The exponent `5/2` alone is insufficient to identify the packet normalization.

## Held boundary

Do not force `C_(B3)=3π/2` into the code merely to recover the held target. Recover the frozen packet or direct construction that defines the normalization first. Likewise, do not derive the tilted-`B²` `sqrt(β)` law backward from its target.

## Next cursor

Recover the exact `FINITE_CORE_TANGENCY_PACKET_002.md` blob/path or the construction immediately upstream of the Working Group handoff. Determine whether `8π√2/5` comes from:
- a normalized core radius/measure;
- a different penetration variable `ε`;
- a different B³ slice geometry;
- or an arithmetic/notation error in the handoff.

Until then, preserve the universal exponent and curvature scaling, but mark the B³ numerical coefficient as **normalization-unresolved**.
