# RUN099 independent contract reality check

**Worker:** Mercer Calder  
**Date:** 2026-09-23  
**Branch:** `HAGALAZ-SOLVER-UNIFICATION` / independent math-audit lane  
**Input contract:** `WORKSPACES/MERIDIAN/SOLVER_HARNESS/run099_three_spheres.case.json` frozen at commit `d17cd8d2047cf7ad76e853bd7535d1b8d8d2d072`  
**Silo state:** independent pre-implementation check; Meridian implementation/debugging/reasoning not inspected

## Result

**STATUS: BLOCKED ON ONE SEMANTIC/GEOMETRIC DISCREPANCY BEFORE IMPLEMENTATION.**

The frozen fixture gives three equal-radius centers in Euclidean R4:

- `(-1/2, 0, 0, 0)`
- `( 1/2, 0, 0, 0)`
- `(0, sqrt(3)/2, 0, 0)`
- common sphere radius `R = 1`.

These centers form an equilateral triangle of side 1. Its circumcenter is

`c = (0, sqrt(3)/6, 0, 0)`

and its center-plane circumradius satisfies

`r_c^2 = 1/3`, hence `r_c = 1/sqrt(3)`.

For the standard Euclidean common intersection of the three radius-1 hyperspheres, points on the intersection are orthogonally displaced from `c`; Pythagoras gives

`rho^2 = R^2 - r_c^2 = 1 - 1/3 = 2/3`,

so the residual intersection-carrier radius is

`rho = sqrt(2/3) ≈ 0.816496580927726`.

The frozen contract simultaneously expects:

- `G = 2/3`; and
- `carrier radius = 1/sqrt(3)`.

If `G` is the normalized residual `1 - r_c^2/R^2`, the first expectation is consistent with the standard geometry, but the second value equals the **center-triangle circumradius** `r_c`, not the standard residual common-intersection radius `rho = R sqrt(G)`.

## Why Calder is not patching around this

The independent checker must not infer the intended definition from Meridian's implementation or alter standard geometry to reproduce a target. Before code is written, the shared contract needs to say which quantity the field `carrier radius` denotes.

Possible dispositions are deliberately left open:

1. `carrier radius` means the standard common-intersection radius `rho`; then the expected value appears to require correction to `sqrt(2/3)`.
2. `carrier radius` intentionally means the center-triangle circumradius `r_c`; then the contract should rename/type it so the independent checker does not confuse it with the intersection carrier.
3. A third project-specific carrier definition is intended; then that definition must be stated in the shared contract before independent implementation.

## Evidence-lane disposition

- `SCHEMA_TYPED`: **PASS** at structural reading level; shared schema exists.
- `EXACT_CONTROL`: **BLOCKED** by quantity-definition mismatch.
- `NUMERICAL`: **NOT_RUN**; no reason to numerically optimize an analytic control before semantics are fixed.
- `REPRESENTATION`: **NOT_RUN**.
- `INDEPENDENT_IMPL`: **NOT_RUN**; preserving silo rather than reading Meridian implementation for the answer.
- `VISUAL_DIAGNOSTIC`: **NOT_RUN**.
- `BIG_PICTURE`: **PASS** for this bounded check: the discrepancy is in the frozen test oracle/quantity typing, not evidence against the Three-Spheres solver itself.
- `FORGOT_CHECK`: confirm whether `G` is formally defined as `1-r_c^2/R^2`, and distinguish center circumradius, residual carrier radius, and any project-specific carrier quantity in namespaces/output schema.

## Handoff / next cursor

Route this discrepancy to the shared contract owner without exposing either silo's implementation. Once the quantity is explicitly typed/corrected, Calder can implement the independent analytic/numerical adapter and visual diagnostic from the frozen contract alone.
