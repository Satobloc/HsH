# Amendment 01 — updated formalization and CI chronology

**Parent report:** `2026-11-01T1036Z_GW250114_CALIBRATION_AND_FALSIFICATION_GATE.md`  
**Date:** 2026-11-01, after the initial report readback.

The parent report correctly records the source reconciliation and calibration/holdout matrix, but its “next formalization cursor” wording is superseded by the following code update.

## 1. Two-channel echo equation now formalized in the existing PR

On the existing branch `research/hale-gw250114-direct-wave-algebra-20261031t1924z`, PR #1166, the Lean module now contains:

- `firstEchoAmplitude`, encoding the source's first-echo composition with separate outgoing-to-infinity and horizon-directed `Z_H^(+)` channels;
- `firstEchoAmplitude_split`, proving the additive decomposition;
- `firstEchoAmplitude_injective_horizonPlus`, proving injectivity in `Z_H^(+)` conditional on the product of the surface, phase, and transfer coefficients being nonzero.

This is an algebraic formalization of the standard-source equation in Prasad et al., arXiv:2610.12429, Eq. (5). The phase factor is kept symbolic. The theorem does not establish detector-data identifiability, because the physical coefficients may themselves be uncertain or fitted. It does establish that, with those coefficients fixed and nonzero, the echo depends on the separate horizon-directed source channel and cannot be reduced to the outgoing direct-wave term alone.

The source still says `Z_H^(+)` has no simple closed-form direct-wave analogue and is computed numerically. No H(s)H map is instantiated.

## 2. Corrected proof attempt and current CI status

The second corrected build, Actions #41298597013, failed because the denominator side goal was expressed using `starRingEnd` while the supplied hypothesis used `star`. The source ledger and numeric `#eval` ran, but the module build failed; the affected filter theorems were printed with `sorryAx` in that failed run.

The branch was corrected using the explicit `starRingEnd_apply` bridge and side-goal discharge. The two-channel composition and injectivity theorem were added in commit:

`1504959a6a9c82eb0eb9fac3e223fc9bf1d136a5`.

Latest Actions run:

- Run: #41298868634
- Job: #124825450930
- Status at this amendment: IN_PROGRESS
- Last observed step: Generate Lake dependency manifest
- Lean compilation: NOT YET STARTED
- Successful build: NOT VERIFIED
- Exact PR-head standalone build: NOT RUN

No proof success is claimed until the complete job log and theorem-specific axiom output are read. The PR remains open, draft and unmerged.

## 3. Corrected epistemic boundary

The formalization now proves:
- the source frequency decomposition `omega_G = 2 hatOmega - i hatKappa`;
- the conditional rational-filter unit-norm result, only if the filter proof compiles;
- the finite source-ledger distinction between fixed analytic shape and NR/event calibration/fitting;
- exact arithmetic for the published reflectivity limit;
- the standard-source two-channel first-echo algebra and conditional injectivity in `Z_H^(+)`.

It does not prove the physical plunge model, the source-to-inward-flux calibration, the echo posterior, any detector-strain prediction, or an H(s)H physical mapping.

The next physical validation remains a comparable-mass NR calibration/holdout that computes both outgoing direct-wave content and horizon-directed flux, with the calibration set separated from the holdout.
