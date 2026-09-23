# RUN099 shared-contract quantity-typing discrepancy — Calder handoff

**Date:** 2026-09-23
**From:** Mercer Calder — independent math-audit lane
**To:** Meridian / shared RUN099 contract owner
**Branch:** `HAGALAZ-SOLVER-UNIFICATION`
**Status:** BLOCKING INDEPENDENT IMPLEMENTATION; SMALL CONTRACT DECISION ONLY
**Silo state:** preserved. Calder has not inspected Meridian implementation/debugging/reasoning to resolve this.

## Exact issue

The frozen shared manifest `WORKSPACES/MERIDIAN/SOLVER_HARNESS/run099_three_spheres.case.json` declares the equilateral radius-1 fixture and expects both:

- `G = 2/3`
- `carrier radius = 1/sqrt(3)`

For the three listed centers, the center-triangle circumradius is

`r_c = 1/sqrt(3)` and `r_c^2 = 1/3`.

For the standard common intersection of three radius-1 hyperspheres in Euclidean R4, the residual orthogonal intersection radius is

`rho^2 = R^2 - r_c^2 = 2/3`, hence `rho = sqrt(2/3)`.

Thus, if `G := 1 - r_c^2/R^2`, then `rho = R sqrt(G) = sqrt(2/3)`.

The current phrase `carrier radius = 1/sqrt(3)` therefore numerically names `r_c`, not `rho`, under the standard geometry.

## Requested shared-contract disposition

Please resolve at the manifest/schema level without revealing Meridian implementation details. Any of these is acceptable if it reflects the intended mathematics:

1. **Standard intersection meaning:** define `carrier_radius := rho`; change expected value to `sqrt(2/3)`.
2. **Center-circumradius meaning:** define the existing `1/sqrt(3)` quantity as `center_circumradius := r_c`; do not call it the residual carrier radius.
3. **Project-specific meaning:** give the project-specific carrier-radius definition explicitly, including its relationship (or non-relationship) to `r_c`, `rho`, `R`, and `G`.

Recommended schema improvement regardless of disposition: carry all distinct quantities explicitly when applicable:

- `SOLVER:THREE_SPHERES:R` — common hypersphere radius;
- `SOLVER:THREE_SPHERES:r_c` — center-simplex/triangle circumradius;
- `SOLVER:THREE_SPHERES:G` — dimensionless carrier margin, with formula stated rather than inferred;
- `SOLVER:THREE_SPHERES:rho` — residual common-intersection radius, if that object is part of the solver contract;
- any project-specific carrier quantity under a separate typed name.

This avoids a same-number/same-word ambiguity becoming a false independent-agreement result later.

## Calder state

- `SCHEMA_TYPED`: PASS structurally, but quantity semantics require amendment.
- `EXACT_CONTROL`: BLOCKED pending this one definition.
- numerical/representation/independent implementation/visual lanes: deliberately NOT_RUN.

Once the shared contract is amended or explicitly dispositioned, Calder can proceed independently from the contract alone.

## Provenance

Detailed independent derivation/check: `WORKSPACES/MERCER/MATH_AUDIT_HARNESS/RUN099_CONTRACT_REALITY_CHECK_2026-09-23.md`.
Frozen fixture read directly from: `WORKSPACES/MERIDIAN/SOLVER_HARNESS/run099_three_spheres.case.json`.

No Nathan action required unless the intended project-specific carrier definition is not recoverable by the contract owner.