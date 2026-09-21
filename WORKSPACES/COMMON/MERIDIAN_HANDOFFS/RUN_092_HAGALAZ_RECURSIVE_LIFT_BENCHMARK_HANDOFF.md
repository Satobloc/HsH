# Meridian handoff — RUN 092 Hagalaz recursive lift benchmark

**Date:** 2026-09-21  
**Branch/task:** HAGALAZ-SOLVER-UNIFICATION / recursive lift  
**Status:** durable sandbox boundary reached / active edge remains live  
**Nathan Words:** `NWTF-UI-UNIVERSAL-INDICATRIX-SOURCE-CONTROL-2026-09-21.md` **INGESTED**  
**Quarantine:** none consulted

## Material result

RUN 092 implements the first 4D recursive normal-sphere lift under a rotation-minimizing frame and materially corrects the RUN 091 endpoint interpretation.

A curve in `R^4` has a 3D normal space, so a constant-radius lift naturally uses an offset direction on `S^2`. In the μ=1 control:

- first lift: only `xw,yw,zw` relative-frame channels are active;
- next recursive lift: `xy,xz,yz` also become nonzero without arbitrary frame twist;
- third recursive lift: all six remain active.

Thus the full six-channel SO(4) relation emerges from recursive 4D nesting.

## Correction to RUN 091

Do **not** read the compact eighth channel as a static finite endpoint displacement `Δc = ξ e_w` for helix→superhelix.

The explicit lift has carrier-to-lift offset in the normal/equatorial space. The tangent-locked scalar belongs naturally to the **local flow**:

`dc/dλ = r v F e_w`.

Candidate eight-address Hagalaz is therefore better typed as the local generator:

`(v, α, ω_xy, ω_xz, ω_xw, ω_yz, ω_yw, ω_zw)`

with finite translation, scale and frame relation derived by ordered integration/composition.

## UI source-control correction

The Nathan Words packet establishes UI as a two-frame/hypersphere generator architecture with rotation, scaling and trajectory relation. `Δc=0` is a useful shared-center slice/readout, not the whole definition.

Disposition: **INGESTED** into comparator typing.

## Scale selector result

A coarse `0.40 <= μ <= 2.20` nonlocal-clearance sweep produced no distinguished selection of `μ=1/2`, `1`, `2`, or another obvious reference scale from clearance alone.

This is a useful negative result: unit/reference Hagalaz needs a stronger selector such as closed-path recurrence/holonomy, tangency/contact, symmetry, packing, variational optimality, or repeated solver practice.

## Artifacts

- `WORKSPACES/MERIDIAN/SANDBOX/RUN_092_HAGALAZ_RECURSIVE_LIFT_BENCHMARK_V01.md`
- `WORKSPACES/MERIDIAN/SANDBOX/hagalaz_recursive_lift_benchmark_v01.py`
- `PUBLIC_SITE/assets/diagrams/hagalaz-recursive-channel-activation-v01.svg`
- public-site packet: `PUBLIC_SITE/live_influx/packets/2026-09-21__MERIDIAN__hagalaz-recursive-lift-run092.json`

## Guardrails

- benchmark phase values are controls, not unit-Hagalaz defaults;
- no famous constant inferred;
- open-path frame return is not holonomy;
- local six-plane generator coefficients are not six invariant finite angles;
- no physical claim;
- rune-family meanings remain reserved.

## Next cursor

Build the first **closed-path Hagalaz benchmark** on a genuinely closed 4D carrier. Integrate the local eight-channel generator around the loop, classify identity return vs nontrivial holonomy vs similarity closure/nonclosure, then expose the same result through UI and Three-Spheres readouts.
