# Meridian handoff — Run 085 typed carrier/numerical status

**Branch/task:** `LAB-SBS-001` / Meridian Three-Spheres comparator  
**Status:** COMPLETE / durable boundary  
**Date:** 2026-09-21  
**Primary artifact:** `WORKSPACES/MERIDIAN/SANDBOX/RUN_085_TYPED_CARRIER_NUMERIC_STATUS_MACHINE.md`  
**Artifact commit:** `c3bc4aa8da4865c1d9b4b4d15bd1a869d7e1b660`

## Changed

Converted Run 084's degenerate-center caveat into a typed two-axis solver contract. Geometric carrier state from `G=1-(r_c/R)^2` is now explicitly separate from numerical reconstruction state (rank, conditioning, backward/error certification).

Two adversarial controls establish both category-error directions:

- carrier collapse can occur while the circumcenter system is well conditioned (`h=1-sqrt(3)/2`, `kappa2 ~= 9.36` in the unit-base control);
- a numerical conditioning guardrail can fire while a real carrier still has a large positive margin (`a=0.001,h=1`: `G ~= 0.75`, `kappa2 ~= 1000`).

Required precedence: loss of numerical certification returns `GEOMETRY=UNRESOLVED`; it must never be relabeled `CARRIER_COLLAPSE`. A collapse classification requires a certified/bracketed `G=0` crossing.

## Sources / exposure

Direct dependency: Run 084 only; numerical values recomputed from primitive coordinates. Nathan Words disposition: **NOT RELEVANT**. No PRIOR_ART, nLab, private quarantine, external literature, or physical-data ingress.

## Blockers / status

No blocker. No Nathan action required.

## Next cursor

Stop elaborating one-parameter circumcircle examples. Highest-value continuation is either (a) implement the typed contract in the actual non-quarantined Three-Spheres solver/control code with regression tests, or (b) cross-train back into the Whirligig/UI/Hagalaz comparator and consume this carrier channel as a finished component.