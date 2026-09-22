# Run 086 — Typed Three-Spheres carrier implementation

**Date:** 2026-09-21  
**Branch/task:** `LAB-SBS-001`  
**Status:** IMPLEMENTED / regression entrypoint included / runtime execution still to be independently exercised  
**Quarantine:** untouched; no PRIOR_ART/nLab/private ingress.

## Bounded operation

Implemented RUN 085's two-axis `(GEOMETRY, NUMERICS)` contract as non-quarantined control code:

`WORKSPACES/LABS/SIDE_BY_SIDE_SOLVER/three_spheres_carrier.py`

Commit: `56307309568a999c0fe6fa721f2eeabc459eb2c4`

## What the implementation enforces

- Reconstructs the arbitrary non-collinear equal-radius three-center carrier through the 2x2 Gram system.
- Reports `G = 1-(r_c/R)^2` separately from numerical diagnostics.
- Numerical states: `CERTIFIED`, `DEGRADED`, `SINGULAR`, `FAILED`.
- Geometric states are emitted only after certification; loss of certification returns `UNRESOLVED` rather than being reinterpreted as collapse.
- A point with `|G| <= tau_g` is `GEOMETRIC_BOUNDARY_UNRESOLVED`, not automatically a collapse.
- `CARRIER_COLLAPSE` requires certified bracket/event history through `classify_crossing()`.
- `kappa_max` is explicitly an engineering policy guardrail, not a geometric threshold.

## Embedded regressions

The module's `__main__` regression entrypoint covers:

1. equilateral centers at `R=1` -> certified carrier present, `G=2/3`;
2. RUN 085 control A -> the lower isosceles collapse is bracketed while the reconstruction remains certified;
3. RUN 085 control B -> skinny geometry trips the default conditioning guardrail and returns `(UNRESOLVED, DEGRADED)` even though raw `G > 0.7`;
4. collinear centers -> `(UNRESOLVED, SINGULAR)`, never `CARRIER_COLLAPSE`.

The connector used for this pass can write repository source but does not execute repository Python. Therefore this handoff distinguishes **implemented regressions** from **executed regressions**. The next Python-capable worker should run:

`python WORKSPACES/LABS/SIDE_BY_SIDE_SOLVER/three_spheres_carrier.py`

and preserve the runtime result before calling the implementation regression-certified.

## Feed / capability disposition

Nathan Words theorist feed: **NOT RELEVANT** — this operation implements an already-typed numerical geometry contract and does not depend on intended-object semantics or terminology drift.

Capability disposition: **INGESTED / implementation** — converts the Run 085 formal status machine into an inspectable solver component rather than extending the family with another analytic example.

## Blocker/status/next cursor

No theory blocker. One verification dependency remains: execute the embedded regression entrypoint in a Python-capable environment. If it passes, treat the typed carrier channel as a finished component and return `LAB-SBS-001` to the broader Whirligig/UI/Hagalaz comparator rather than adding further circumcircle examples. If it fails, repair the concrete implementation defect before broadening the benchmark.

No Nathan action required.
