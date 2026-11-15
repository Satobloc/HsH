# Directed slice-retraction composition: a type-correct adapter contract

**Status:** architecture proposal; no new Lean theorem, physical prediction, fit, or P2 selection.

## Existing pieces, kept distinct

The repository already has four relevant pieces:

- Ravel's `SliceCompatibleRetraction` carries a directed carrier projection, a zero-section witness, a sheet reparameterization, and a `preservesSlice` condition.
- Ravel's `FiberTransport` describes reversible representation transport with identity, composition, and round-trip laws.
- Nadir PR #1189 supplies generic projection-factorization and witness-carrying composition on image ranges.
- Enheduanna PR #1508 / issue #1509 supplies branch-scoped directed-map composition with explicit intermediate-domain compatibility.

These are not interchangeable. A lossy projection/retraction is not a reversible `FiberTransport`. Generic range composition does not itself supply the geometry-specific intermediate carrier and sheet maps.

## The missing geometry-specific adapter

Let the first stage have `p01 : T0 -> C1` and `rho01 : S0 -> S0`; let the second have `p12 : T1 -> C2` and `rho12 : S1 -> S1`.

The carrier types do not match for direct composition. A source-defined intermediate lift `iota1 : C1 -> T1` is required. If the sheet types differ, an explicit `sigma1 : S0 -> S1` is also required. If the ambient spaces differ, an ambient comparison map is required.

The intermediate maps must preserve the same declared slice. In embedding notation, a required compatibility condition is:

`e_T1(iota1(c)) = e_S1(sigma1(s))` whenever `e_C1(c) = e_S0(s)`,

with the corresponding ambient-map commutation when the ambient types differ.

Only then can the directed composite be stated:

`p02 = p12 o iota1 o p01`

`rho02 = rho12 o sigma1 o rho01`

This composes a slice-compatible map. It does **not** yet prove that the composite is a retraction.

## Composite section is a separate obligation

If the composite is to be called a `SliceCompatibleRetraction`, it needs an explicit `s02 : C2 -> T0` and a proof:

`p02(s02(c)) = c`.

The component laws `p01(s01(c1)) = c1` and `p12(s12(c2)) = c2` do not by themselves provide that map: `s12` lands in `T1`, while `s01` expects `C1`. A compatible intermediate retraction/lift or a directly supplied composite section is still needed.

Likewise, if an independently defined direct map `p02_direct` exists, equality with the composed path is a separate coherence condition on the declared admissible domain. Do not infer it from stagewise `preservesSlice` alone.

## Correct map-class boundary

- Use `FiberTransport` only when the source actually supplies inverse/round-trip laws.
- Use directed branch-map composition for noninvertible maps, retaining the intermediate-domain witness.
- Use Nadir's range-factorization result for induced readout maps only after each stage's fiber condition is established.
- Carry the geometric slice and section witnesses through the adapter; do not erase them when converting to a generic map.
- Reuse the existing `ModelFreeze`, `ComparisonFreeze`, and `ExecutionAttestation`. This proposal creates no new general-purpose freeze object.

## Formal verification status

The generic projection-factorization / witness-composition module in Nadir PR #1189 built on exact head `80fad0d260a30dbec6304c0ab4c104b8c8b35510` in Actions run #43494284359. That PR remains open, draft, and unmerged; its abstract theorem does not instantiate the missing physical maps. The new geometry-specific adapter is **not** Lean-formalized or compiled. PR #1133's latest associated merge-reference run failed in `MovingPlaneTraceGeometry`; it is not an exact-head verification of the proposed adapter.

## Real measured-system test candidate

Han et al. (2026) report synchronized stereoscopic free-surface measurements and 4D particle-tracking velocimetry for a vortex ring colliding with an air-water interface (`Re_Gamma = 2509`; DOI: https://doi.org/10.1007/s00348-026-04256-5). The standard comparator is free-surface fluid mechanics / Navier-Stokes with the stated boundary conditions.

For a future comparison, shared parameters must include fluid properties, initial circulation/core, impact and container geometry, camera calibration, spatial registration, and time synchronization. Calibration must be frozen before prediction. Hold out whole independent collision runs, not randomly selected adjacent frames. The joint observables are the surface geometry and subsurface velocity field, with their cross-channel covariance.

The paper's supporting data are available from the corresponding author on request; raw files and full covariance were not obtained here. The H(s)H map from worldtube/timesheet variables to these fluid and instrument observables is not defined. Therefore no H(s)H prediction is formed. A numerical falsification boundary cannot be set until the raw records, calibration, covariance, and independent-run manifest are available. A reported kinematic boundary residual is a measurement-quality diagnostic, not a general H(s)H rejection threshold.

## What is forced, and what is not

Finite thickness, twist/holonomy, a contact surface, and additional nesting remain optional. A candidate feature becomes **representation-required** only if the reduced projection cannot preserve the source-defined observable. It becomes **empirically required for this model and dataset** only if the augmented map produces a distinguishable held-out prediction beyond the calibrated uncertainty, with shared parameters frozen and the new parameter independently identifiable. Neither result establishes ontological necessity.

A failed or undefined composition is first `MAP_INCOMPLETE` or `PATH_COHERENCE_UNRESOLVED`, not evidence for a new physical primitive.

**Disposition:** `TYPE_ADAPTER_PROPOSED / INTERMEDIATE_LIFT_AND_SHEET_MAP_MISSING / COMPOSITE_SECTION_NOT_DERIVED / NO_NEW_LEAN_PROOF / NO_PHYSICAL_CALCULATION / NO_P2_SELECTION`.
