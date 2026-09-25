# Meridian Run 091 — tangency packet dimensional typing repair

**Date:** 2026-09-25  
**Status:** SANDBOX / corrective formalization  
**Scope:** FINITE-CORE TANGENCY PACKET 002 local measure typing only. No particle identification, physical validation, or solver-equivalence claim.

## Direct source reread

The direct Working Group handoff states:

- contact equation: `z + α s + (A_rel/2)s² = 0`;
- bulk `B³` **thin-sheet 3-volume** scales as `ε^(5/2)|A_rel|^(-1/2)`, coefficient `8π√2/5`;
- boundary `S²` and generic tilted `B²` **two-area** scale as `ε^(3/2)|A_rel|^(-1/2)`;
- tilted `B²` retains `sqrt(β)`, `β=|P_E n|`;
- exact `β=0` is exceptional;
- implementation must sweep without fitting.

Source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/WORKING_GROUP_1.txt`.

To avoid the project-wide bare-alpha collision, this note writes the local linear coefficient as `a_loc` and relative curvature as `K_rel`.

## Dimensional typing

Assume the contact parameter `s` and signed-distance coordinate `z` both have length dimension `L`. Then

`[a_loc]=1`, `[K_rel]=L^-1`, `[ε]=L`.

Therefore

`[ε^(5/2)|K_rel|^(-1/2)] = L^3`

and

`[ε^(3/2)|K_rel|^(-1/2)] = L^2`.

These are exactly the dimensions named by the handoff: a 3-volume for the B³ branch and a two-area for S²/B².

## Codimension bookkeeping lemma

Let the fixed-s measure density for a D-dimensional reported observable have leading local form

`dM_D/ds = C δ(s)^p + o(δ^p)`,

with

`δ(s)=ε-(|K_rel|/2)s²`.

Then

`M_D ~ C sqrt(2) B(1/2,p+1) ε^(p+1/2)|K_rel|^(-1/2)`.

Dimensional consistency requires

`[C]=L^(D-p-1)`.

Consequently:

- a reported **3-volume** with exponent `5/2` has `p=2` and requires dimensionless `C`;
- a reported **two-area** with exponent `3/2` has `p=1` and requires dimensionless `C`.

This is a joint exponent-and-dimension discriminator.

## Correction to Runs 089 / Tangency 004

Tangency 004 used the ordinary radius-ρ Euclidean 3-ball cap volume

`V_cap = π δ²(ρ-δ/3)`

as a fixed-s density and then integrated over `ds`. Since `V_cap` already has dimension `L³`, that construction produces an `L⁴` swept measure. Likewise integrating an S² cap area over `ds` produces `L³`.

Those cap integrals are mathematically valid for the higher-dimensional swept quantities they define, but under the natural dimensional typing above they are **not the Packet-002 observables named in the direct handoff**.

Accordingly, Run 089's suggestion that the B³ coefficient discrepancy might primarily be resolved by choosing `ρ=3/2` is superseded as the leading diagnosis. The more basic issue is measure identification.

Tangency 003's universal quadratic integration formula survives.

## Coefficient consequence

For the packet B³ exponent, `p=2` gives

`I_2=(16√2/15) ε^(5/2)|K_rel|^(-1/2)`.

The handoff coefficient `8π√2/5` therefore implies a **dimensionless** fixed-s leading coefficient

`C_B3=3π/2`.

This is now correctly typed. Its geometric origin remains unresolved and must be recovered from the upstream packet construction rather than imposed as a fit.

For any S²/B² `p=1` branch,

`I_1=(4√2/3) ε^(3/2)|K_rel|^(-1/2)`;

the branch-specific dimensionless coefficient must come from the actual support/readout geometry.

## Publication-facing discriminator

A candidate implementation of Packet 002 should not be accepted merely because it reproduces the requested log-log slope. It must report:

1. dimension of the reported observable;
2. whether the fixed-s object is a density, slice measure, projection, boundary measure, or already-integrated measure;
3. leading transverse power `p`;
4. dimension of its coefficient `C`;
5. integrated ε exponent and `K_rel` exponent;
6. numerical coefficient only after 1–5 agree.

This catches an entire class of "right exponent, wrong geometric object" errors.

## Held boundary / next cursor

The tilted-B² `sqrt(β)` dependence remains held. Do not reconstruct it backward from the target.

Next: recover the upstream frozen packet or its immediate construction and identify the actual fixed-s B³/S²/B² measures. The decisive question is now not "what radius normalization was used?" but "what geometric measure is being integrated along s?"