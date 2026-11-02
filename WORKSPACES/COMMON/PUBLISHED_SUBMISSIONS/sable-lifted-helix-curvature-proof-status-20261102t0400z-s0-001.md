# Conditional Euclidean lifted-helix curvature: proof-status delta

This is a narrow delta to the existing source-fidelity work in issues #1108, #1117, #1120, #1128, #1165, #1183, and #1185. It does not restate their source genealogy.

## New formalization candidate

Draft PR #1245 adds a Lean module for the assistant-authored Euclidean lift
X(w) = (x(w), w).
It states the Gram-determinant curvature identity for tangent X' = (v, 1) and acceleration X'' = (a, 0), and the circular-helix specialization

κ² = R²ω⁴ / (1 + R²ω²)².

An exact SymPy symbolic calculation confirms this identity for the specified Euclidean curve. For R ≥ 0, its curvature is Rω² / (1 + R²ω²).

This is a conditional mathematical result about a one-dimensional curve in Euclidean R⁴. It is not a Nathan Direct equation and does not establish the curvature of the finite-core 4D worldtube W⁴.

## Source and object boundary

- The 2026-10-09 raw source (conversation blob 7af1561b321f4d9364da5eb111df689efc652827) gives the literal relation w=ct as a time-length coordinate and describes inertia/worldtube bending as equivalent descriptions.
- The same source's direct correction describes the time structure as an interacting 3D slice/bulk and rejects “readout” when it implies passive noninteraction.
- Direct message 1178f25c-9f92-4d1c-b43b-06482e6bf1b1 distinguishes coil diameter/radius from filament thickness and a 3D intersectional trace from the 4D filament. Its approximately 0.7 fm radius is a source claim in that conversation, not an independently recovered measurement.
- The 2026-10-21 raw source (conversation blob 56a84cb85d5c386efa4ea11d322d11e95e2c7703) gives the distinct literal notation cw=t and native signature (++++).
  No source-backed dictionary equating cw=t with the earlier w=ct was recovered.
- The 2026-10-29 clarification note distinguishes a 4D worldtube, a 3D time slice, their 3D section, and optional 2D normal/circle support. Its raw message UUID and role graph remain unrecovered; it is a document-level witness only.

The assistant's lifted curve X(w) is not the finite-core W⁴. A 1D curve intersecting a transverse 3D slice in 4D gives a 0D event; a 4D core intersecting that slice gives a 3D section. The map from the direct 4D filament construction to the finite core, and the curvature object meant by “worldtube bending,” remain unspecified.

## Lean status: SUBMITTED_NOT_VERIFIED

PR #1245 is draft. No Lean 4/Mathlib job ran for it. Two push-triggered conversation-json-content-ci runs (#41387332624 and #41387337129) ended without executing a Lean job. The existing Lean verification workflow is present on the infrastructure branch but absent from the current default branch, so this PR event did not trigger it.

Existing successful Lean runs are adjacent, not substitutes:
- PR #262 / run #41301288857: earlier helix-slice geometry.
- PR #1153 / run #41210929564: abstract Klein orientation group.
- PR #873 / run #41240068390: relevant worldtube-coordinate and dimension modules built, but the overall workflow later failed in another module.

Do not describe PR #1245 as compiled, merge it, or promote its statement until an authorized exact-head Lean 4/Mathlib run completes and its logs are read back. No Factory Floor handoff was made because no successful Lean run exists.

## Next obligations

1. Obtain an authorized exact-head Lean run for PR #1245.
2. Define the map from the direct filament object to finite-core W⁴.
3. Define the 3D slice Σ³_t, the intersection/projection map, and the interaction conditions.
4. Define the invariant curvature of W⁴ and its proposed relation to inertia.
5. Reconcile w=ct and cw=t only from a source-backed symbol and units map.

No physical calculation, measured-data claim, CODATA scoring, or theory promotion is made.