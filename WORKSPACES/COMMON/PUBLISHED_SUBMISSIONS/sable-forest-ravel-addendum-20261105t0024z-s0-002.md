# Forest Normalization and time-history formalization addendum
Date: 2026-11-05
Status: source-locator correction and existing-proof crosswalk to the timewave archive addendum. No theory promotion.

## 1. Forest Normalization source locator

The raw HsH conversation `LIVE CONVOS/26.10.20•26.10.21•Meridian Minkowski Ring Analysis — raw.json` is available by Git blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`, conversation ID `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`. The active current-node ancestry contains 3,660 nodes and 106 user turns.

Direct user messages on that ancestry:

- `bc09cf32-9952-462a-a02b-2c67a3cf4c91`, 2026-10-20T23:12:49.986Z: adopts two normalizations as standard method and asks that they be recorded in BEDROCK. This message concerns the dimensionally balanced expansion/contraction normalization and the simultaneity-surface / Hubble-radius metric-curvature normalization.
- `c5525f53-b7cc-4444-8102-3bf6fdb1c892`, 2026-10-21T13:55:40.205Z: names the standing native defaults `cw=t`, the balanced `+/- (c+H_0)/2` shorthand, Forest Normalization, and `(++++)`.
- `92856f85-9f67-44d0-b1c4-4e9ff7d6500d`, 2026-10-21T14:00:32.869Z: clarifies the intended expansion/contraction balance around a zero midpoint.

The 4 November direct statement now gives a further conceptual clarification: Forest Normalization is substantially a convention for viewing/orienting by a maximally symmetric axis. This is a representation/normalization convention. Its exact algorithm, invariants, axis-selection rule, and uniqueness conditions remain to be recovered.

BEDROCK already contains:
- `ND-2026-10-20-01`: the two standard Minkowski-related normalizations;
- `ND-2026-10-21-02`: `cw=t`, balanced expansion/contraction, Forest Normalization, and `(++++)` as standing native calculation defaults.

The two normalizations in ND-2026-10-20-01 are distinct from Forest Normalization. Also do not conflate Forest Normalization with the 2026-09-21 draft **The Forest: Physical Information Has a Path**, which defines a graph of physical information ancestry. Same word, different construction.

Correction to the wording in the preceding timewave crosswalk: direct mentions and BEDROCK standing status for Forest Normalization **are recovered**. What remains unrecovered is the complete authoritative mathematical definition and executable normalization procedure.

## 2. Mutual-model chronology

Direct user message `090f5160-1020-486d-9c42-df3d7dff2063`, 2026-10-21T00:17:23.235Z, says the earlier reciprocal descriptions (filament deforms the simultaneity surface, surface deforms the filament, or represent the physics through their intersections) are no longer current since the Klein Fabric model became common.

The 4 November direct position now names mutual worldtube/timesheet curvature as the best working hypothesis and adopts even assignment as the default representation when neither side is preferentially instrumental. Treat this as a new working statement requiring reconciliation, not as a simple restoration of the retired reciprocal-deformation construction. The maps, variables, and constitutive relations must show whether it is genuinely a different model.

## 3. Existing Lean formalization relevant to the timewave

Ravel draft PR #1133, branch `research/ravel-carrier-slice-reconstruction-20261031t0212z`, contains six Lean 4/Mathlib modules. Run #41947575131 succeeded on the PR head `5b278cbc14273716a83e09f5a85ef97033be356a`. The PR remains draft and is stacked on open infrastructure PR #262, targeting `infra/lean4-verification-20261023`, not main.

Relevant verified formal structures:

- `MinimalCarrierReadout`: time-labelled sections and coverage. Complete sections recover the carrier; incomplete readout can be non-injective.
- `historyGraph` / `historySlice_eq_support`: the slice at time t recovers the spatial support S_t; spatial projection is non-injective when a point persists across distinct times.
- `FiberTransportNonuniqueness`: the same base projection can hide different fiber transports, demonstrated by identity and Boolean-flip transports.
- `CarrierSheetDimensionGate`: conditional dimension/codimension checks. A 1D carrier intersecting a 3D timesheet in 4D has a 0D transverse trace; a full 4D core intersecting a 3D timesheet has a 3D trace.
- `TwoFormCurrentProjection`: a projected-current conservation result under a vorticity-orthogonality hypothesis.

The scanned modules contain no `sorry` or `admit` declarations and print theorem axiom reports. These are conditional set-theoretic, dimensional, and algebraic results. The successful build is on the PR head but against an unmerged infrastructure branch; do not describe it as mainline verification.

This gives a precise mathematical handle on the open cross-surface-connectivity question: a visible slice/readout alone does not determine internal fiber transport. A separate transport/coupling structure is required. It does **not** prove a physical medium, timewave propagation at c, metric equivalence, a worldtube constitutive law, or the symmetric-allocation theorem.

## 4. Next formal and source work

1. Recover the authoritative Forest Normalization construction and prove its axis-selection/uniqueness conditions.
2. Formalize equal allocation as a separate group-action theorem; do not add it to Ravel's PR without its owner's review.
3. Define the new mutual-curvature hypothesis and compare it by explicit maps with the retired reciprocal construction and Klein Fabric.
4. Connect the timewave to the existing history-graph and fiber-transport structures, then derive a physical constitutive law and observable predictions from an actual measured system.

No BEDROCK edit, no theory promotion, and no empirical validation follows from this addendum.
