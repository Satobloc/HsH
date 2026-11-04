# Geometry, reduced-memory, and medium-response discriminator

**Date:** 2026-11-04 20:36Z  
**Status:** PROPOSED MODEL-COMPARISON ARCHITECTURE / NO P2 SYSTEM SELECTED / NO PHYSICAL CALCULATION / NO THEORY PROMOTION  
**Authorship:** Current assistant execution under the deterministic Sable ring selection. This is not an authenticated historical Sable instance or a claim of Sable-thread participation.

## Executive result

The existing P2 architecture already has three important pieces:

- issue #1341 distinguishes the historical SAT-O curve, current H(s)H worldtube language, assistant-authored Blockwave current, laboratory spacetime, and standard GR objects, and requires explicit maps to the instrument record;
- issue #1359 distinguishes a source-defined fine-slice transfer from a candidate coarse transfer and asks whether eliminated degrees of freedom survive as a derived memory response;
- issue #1281 preserves the 2024 moving-plane helix toy separately from the later 2026 finite-core/worldtube language.

This addendum supplies a missing model-comparison bridge: **geometry-derived response, coarse-graining-induced memory, and independently measured medium response must be treated as three distinct candidate sources of inertia-like or delayed response.** They must not be folded into one adjustable “worldtube stiffness,” one free memory kernel, or one unmeasured medium/contact term.

This is a test-design proposal, not a claim that any of the three mechanisms has been established.

## 1. Source and comparator boundaries

### Nathan Direct construction claims

The Meridian Free Build raw conversation (blob `7af1561b321f4d9364da5eb111df689efc652827`) contains user-role messages:

- `3c657387-b80b-4982-a61a-8e6d8568b8d1` (2026-10-09): relates inertia to resistance of worldtube history to changes in motion in a classical limit.
- `1178f25c-9f92-4d1c-b43b-06482e6bf1b1` (2026-10-09): distinguishes the coil scale from intrinsic filament thickness and the 4D filament from its 3D intersectional trace.

These are source-level construction commitments. They do not supply a constitutive law, calibrated geometry-to-observable map, measured momentum dataset, covariance, or fitted parameter.

The current H(s)H source ledger also keeps responsive-medium language separate and optional. It does not establish a material contact law. See the source crosswalk in issue #1341.

### Reduced-memory comparator

The HSH_RESOURCES extracted text for Francisco Monroy, *Inertial Response from Variational Openness: A Generalized Mach Principle*, is blob `ea88e111412a9373f516c0ae77a94a509c8ae83c`. The seven-page SSRN preprint explicitly states that it has not been peer reviewed and that no datasets were generated or analysed.

The paper's relevant conditional result is that a causal coordinate-memory response can contribute a low-frequency inertial sector when the required regularity, temporal moments, and scale separation hold. It also distinguishes a residual local contribution from an induced contribution; the stronger zero-residual claim is an additional hypothesis, not a consequence of the weak result.

Crucially, the paper says its active interface is a **variational partition**, not necessarily a material surface. It does not require a material transmission medium or local contact interaction. Thus a memory kernel does not, by itself, force an H(s)H contact surface or responsive medium.

The SSRN record is `https://ssrn.com/abstract=7398357`. The related arXiv:2605.17032 is a separate source. DOI `10.1002/andp.19183600402` belongs to Einstein's 1918 paper cited in the SSRN preprint's references, not to Monroy's preprint.

## 2. Five-model comparison lattice

Use the same raw acquisition, instrument model, nuisance budget, calibration protocol, and held-out blocks for every comparison.

1. **Standard baseline:** the mature Newtonian/GR response appropriate to the measured system.
2. **Source-defined geometry-only H(s)H:** the minimal source-faithful worldtube/timesheet representation with a frozen geometry-to-observable map. This is not fit-ready until the map is defined.
3. **Geometry plus derived memory:** add a causal memory/history representation only if the declared coarse state fails the slice-transfer closure test. The memory kernel must be derived from the eliminated degrees of freedom or a declared retained-state model; it is not a free per-channel/per-frequency curve.
4. **Geometry plus measured medium response:** add a separate medium channel only when the medium state is independently measured and its effect is identifiable while geometry and preparation/history are controlled.
5. **Combined geometry, memory, and medium:** admissible only if the memory and medium contributions are separately identifiable. Do not add an unconstrained cross-term merely because the combined model fits better.

The geometry-only model is a null submodel for the optional medium contribution, not an assertion that the physical medium is absent. The medium remains a separately measured candidate channel.

## 3. Orthogonal contrasts required for identifiability

A single dataset in which geometry, preparation history, and medium state all change together cannot distinguish their contributions. The acquisition design must contain independent contrasts.

| Contrast | Hold fixed | Vary independently | What it can identify |
|---|---|---|---|
| **Geometry** | Preparation/history and measured medium state | Source-defined geometry | Whether the frozen geometry map predicts a response change at fixed medium/history |
| **History** | Present coarse geometry and measured medium state | Prior internal/preparation history | Whether the present coarse state is insufficient and a retained state or derived memory is needed |
| **Medium** | Source-defined geometry and preparation/history | Independently measured medium state | Whether a separate medium-response channel contributes |
| **Interaction** | All declared nuisance and instrument controls | A predeclared combination of the above | A combined contribution, but only after the main effects are independently identified |

If the real acquisition cannot provide these contrasts, report the corresponding mechanisms as **not separately identifiable**. Do not repair confounding by adding unconstrained latent variables.

A design-matrix rank/conditioning check and full-covariance propagation are required on the actual acquisition data. No rank calculation is performed here because no P2 system or dataset has been selected.

## 4. Observable and prediction contract

For a selected real system, the test packet must declare:

- the measured geometry and its reconstruction method;
- the geometry-to-slice and slice-to-instrument maps;
- the measured force, trajectory, or response channel, with units;
- independently measured medium variables, if a medium model is tested;
- preparation history and acquisition-block identifiers;
- instrument response, calibration identifiers, and uncertainty covariance;
- shared parameters across channels and the nuisance-parameter budget;
- a calibration set and separate held-out acquisition blocks/conditions;
- the standard comparator and the exact prediction generated before opening the holdout.

For oscillator-like systems, a complex response or inverse-susceptibility measurement can separate stiffness, damping, and inertial sectors more effectively than a resonance shift alone. That is a candidate observable, not a prediction for an as-yet-unselected H(s)H system.

The falsification threshold must be derived from the actual measurement covariance and declared before holdout access. Randomly withholding adjacent frames or spatial points from one acquisition is not an independent holdout.

## 5. What is forced, optional, or still undefined?

| Feature | Current status | What would make it necessary |
|---|---|---|
| Geometry-derived inertial response | Nathan Direct construction claim; no constitutive law or measured map | A source-defined geometry-to-observable map that makes a distinct held-out prediction |
| Intrinsic filament thickness | Not established by the coil scale | A source-defined support/cross-section construction or an independently resolved finite-core measurement |
| Twist field / twist law | Qualitative proposal; no complete field, connection, pitch law, or magnitude | A defined source map and an independently measured handedness/rotation observable |
| Material contact surface | Not implied by coarse-graining or by a variational partition | A source-defined material boundary plus measured exchange, stress, or contact law |
| Reduced-memory response | Conditional comparator / derived representation | Failure of coarse-state closure, followed by a source-grounded derivation of the retained-state or memory law |
| Responsive medium | Separate, optional H(s)H candidate | Independent medium measurements and a reproducible response change at controlled geometry/history |

The coil scale must not be relabelled as intrinsic thickness. A fitted low-frequency inertial coefficient alone does not force thickness, twist, or contact geometry.

## 6. Falsification logic

- If the geometry-only model fails but the derived-memory model predicts held-out blocks, the tested Markovian coarse representation fails. That result does not, by itself, falsify every possible four-dimensional construction.
- If the medium-augmented model succeeds only when independently measured medium variables are included, a separate medium channel is needed for that system. This does not establish a worldtube/medium equivalence.
- If only the combined model fits and its geometry, memory, and medium contributions cannot be separately identified, the result is underdetermined, not positive evidence for the combined ontology.
- If any model requires per-run, per-channel, or per-frequency retuning outside the declared nuisance budget, it fails the discrimination test.
- If no frozen model predicts the held-out response within the covariance-derived region, reject that proposed reduced representation.

## 7. Formalization status

The existing Kestrel theorem `hallway_factorization_iff_fiber_compatibility` is the relevant conditional formal result: a downstream observable factors through a coarse map only when it is constant on that map's fibers. In PR #873, the `KestrelProjectedIncidence` module built in Actions run #41758925555; this theorem's axiom report is `[Classical.choice]`, while the associated uniqueness theorem reports `[Quot.sound]`.

The overall PR #873 build failed later in `KestrelMovingSlice.lean`: lines 114 and 125 have unsolved goals, and two moving-slice declarations report `sorryAx`. The full build is therefore not green. Tests, lint, nanoda, and the separate automated axiom audit were not run.

No new Lean theorem is added here. The proposed model lattice is an empirical design protocol, not yet a source-defined mathematical proposition. A new formalization would require the actual maps and declared state spaces; no synthetic physical fixture or data-free calculation is authorized.

## 8. Empirical disposition and next cursor

- P2 issue #565 remains **SELECT REAL SYSTEM + SOURCE MATH / HOLD**.
- No physical system is selected.
- No raw time-series dataset, calibration record, units, covariance, or independent holdout was retrieved for this addendum.
- No physical calculation, fit, prediction, or Factory Floor admission was performed.
- No BEDROCK, SAT-O, or Blockwave equation was changed.
- No theory claim is promoted.

Next: select one candidate only after verifying a genuine versioned dataset, provenance, units, uncertainty/covariance, calibration, and access; define the source-faithful geometry and instrument maps; then decide whether the available acquisitions can separate geometry, history, and medium contrasts. If not, report the relevant mechanisms as unidentifiable rather than fitting them independently.

## Source pointers

- P2 docket: https://github.com/Satobloc/HsH/issues/565
- Worldtube ambient-type and observation-map contract: https://github.com/Satobloc/HsH/issues/1341
- Coarse-grained memory and geometry-derived inertia: https://github.com/Satobloc/HsH/issues/1359
- SAT-O / H(s)H / Blockwave source-fidelity crosswalk: https://github.com/Satobloc/HsH/issues/1281
- Measured vortex candidate reconnaissance: https://github.com/Satobloc/HsH/issues/1339
- Existing conditional Lean work: https://github.com/Satobloc/HsH/pull/873
