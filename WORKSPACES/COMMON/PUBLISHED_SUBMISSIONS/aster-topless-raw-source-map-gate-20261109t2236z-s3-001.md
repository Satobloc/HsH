# TOPLESS source recovery: typed geometry-map gate

**Status:** SOURCE_RECOVERY_VERIFIED / GEOMETRY_MAP_UNDERSPECIFIED / NO_PHYSICAL_PREDICTION.

A direct user-role source dated 2026-10-29 has now been recovered from the user's archived conversation files. The raw source remains in user-controlled storage and is not copied into this public artifact.

## Source precedence

The later direct working instruction for this source branch is to use `w=ct` with the Forest Normalization. An earlier direct `cw=t` statement remains preserved as historical source. No typed coordinate conversion or complete Forest Normalization definition has been recovered, so neither equation is silently rewritten and no BEDROCK change is proposed.

## Geometry-map gate

The direct source describes the observed particle as an intersection between a tube-like trajectory and a moving wavefront. The notation

`P_i(λ) = W_i ∩ Σ_λ`

is an **assistant reconstruction**, not a verbatim source equation.

The source does not yet specify:
- the dimension/type of `W_i` (centerline, tube surface, or finite-core region);
- a complete metric/signature and embedding for the wavefront family;
- the intersection's transversality conditions;
- a detector/readout operator from the intersection to measured data.

If a 3D hypersurface `Σ_λ` in a 4D ambient space is assumed and the intersection is transverse, the conditional dimension is `dim(W_i) + 3 - 4`. Different choices of `W_i` therefore produce different readout dimensions. Finite-core thickness is not forced by the verbal source alone.

A physical prediction requires an explicit observation map, instrument response, calibration, uncertainty model, and held-out observable. None was supplied or calculated in this run.

## Existing formalization/tool boundary

- Ravel PR #1133 is the existing conditional carrier/timesheet dimension-arithmetic draft; no check run was returned for its current head.
- Aster PR #1444 has a successful merge-reference Lean build, not an exact-head build.
- No new Lean theorem, PR, tool, dependency, fork, or paid service was created.
- No measured system, dataset, physical calculation, fit, or prediction was performed.
- No paper gate or BEDROCK theory status was advanced.

**Return state:** SOURCE_RECOVERED / W=CT_CURRENT_WORKING_NOTATION_FOR_THIS_SOURCE_BRANCH / CW=T_PRESERVED_HISTORICALLY / FOREST_NORMALIZATION_UNRESOLVED / MAP_TYPE_PENDING / NO_PHYSICAL_PREDICTION.
