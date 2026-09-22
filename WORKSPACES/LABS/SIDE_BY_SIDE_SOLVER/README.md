# LAB-SBS-001 — Geometric Solver vs Standard Equation

**Status:** ACTIVE / IMPLEMENTATION  
**Class:** SIDE_BY_SIDE / TOOL_BENCH / REPRESENTATION_TEST  
**Established:** 2026-09-20  
**Branch:** `LAB-SBS-001`

## Question

Can we build a reproducible harness in which one well-defined case is represented both by a standard/reference equation and by an SAT/H(s)H geometric solver, using matched inputs and explicit transformations, so outputs can be compared without hiding parameter freedom, target leakage, unit changes, or representational assumptions?

This Lab is comparison machinery first. Numerical agreement is not derivation, equivalence, or validation.

## Current material state — 2026-09-21

The Three-Spheres carrier component has moved beyond design. `three_spheres_carrier.py` now implements the Run-085 typed carrier/numerical status contract for equal-radius, non-collinear centers.

The implementation deliberately separates:

- **geometric carrier state**: carrier present, no real carrier, geometric boundary unresolved, or unresolved;
- **numerical reconstruction state**: certified, degraded, singular, or failed;
- **collapse certification**: emitted only from certified crossing/bracket history, not from a single near-zero point.

This prevents numerical degradation or center-rank singularity from masquerading as physical/geometric carrier collapse. The regression block covers the standard equilateral case, a regular-solve collapse crossing, an engineering-policy degradation while an exact carrier remains, and the collinear singular stratum.

The exact Hagalaz operator/source remains unrecovered and candidate status is unchanged. The first Hagalaz ↔ Three-Spheres benchmark remains **complementary-channel**, not an asserted homologous observable comparison.

## Desired pipeline

```text
shared case manifest
        │
        ├──> reference/standard adapter ──> normalized reference output
        │
        └──> SAT/H(s)H solver adapter ───> normalized geometric output
                                               │
                                               v
                                      comparison / diagnostics
                                               │
                                               v
                                      reproducible run packet
```

## Shared case manifest

A case should declare at least: case ID/description; mathematical object/domain; standard/reference formulation; SAT/H(s)H representation; initial/boundary conditions; coordinate/frame conventions; units/dimensions; parameters and ownership; transforms into common comparison space; value classifications (`INPUT`, `CALIBRATION`, `FIT`, `DERIVED`, `PREDICTED_BEFORE_COMPARISON`, `BLIND_TARGET`, `POST_HOC_COMPARISON`); source/provenance and exposure state; expected invariants or qualitative checks; and failure conditions.

## Adapter and comparison rules

Each side must remain independently inspectable. A reference adapter must not know how the SAT/H(s)H side was tuned, and the SAT/H(s)H adapter must not quietly absorb target outputs unless the run is explicitly classified as fit/calibration. The comparator operates on normalized declared outputs; it does not repair either model.

Depending on the case, diagnostics may include dimensional consistency, residuals, invariant agreement/disagreement, qualitative/topological correspondence, limit behavior, parameter sensitivity, representation sensitivity, null/failure cases, and an explicit account of what was independent versus shared by construction.

## Reproducibility packet

Where feasible record Python/dependency versions, script or commit identity, input-manifest hash, deterministic seed, output hashes, timestamp, solver identity, normalization/transformation code, and target-exposure/fitting classification.

## Hard boundaries

- `PRIOR_ART` remains quarantined.
- Numerical agreement alone is not derivation, equivalence, or validation.
- Historical target constants are not silently allowed as repair parameters.
- A representation match must state the transformation establishing comparability.
- Failure to match is a valid Lab result.
- Carrier viability and numerical reconstruction certification remain separate typed channels.
- Do not promote a pointwise `|G|≈0` result to `CARRIER_COLLAPSE` without certified event/bracket history.

## Current next cursor

Treat the Run-085 Three-Spheres typed carrier channel as an implemented component unless regression or integration exposes a concrete defect. Return to the broader Whirligig/UI/Hagalaz comparator: inventory the live non-quarantined interfaces, preserve the complementary-channel classification, and recover a genuinely homologous Hagalaz geometric-admissibility observable before claiming direct observable equivalence. The exact Hagalaz source/operator remains a provenance dependency rather than a license to reconstruct it from memory.

## Source / continuity pointers

- `WORKSPACES/LABS/SIDE_BY_SIDE_SOLVER/three_spheres_carrier.py`
- `WORKSPACES/MERIDIAN/SANDBOX/RUN_085_TYPED_CARRIER_NUMERIC_STATUS_MACHINE.md`
- `WORKSPACES/COMMON/MERIDIAN_HANDOFFS/RUN_085_TYPED_CARRIER_NUMERIC_STATUS_MACHINE.md`
- `WORKSPACES/COMMON/TASK_BRANCH_GRAPH.json`
