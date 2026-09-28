# Geometry / Solver Methodology

Status: current exploratory method, ready for precision/calibration pass.

## Rule

> **Compute the undistorted object first. Distort only the observation map, and record the map.**

## Step-by-step

1. **Start from the analogue, not a polished picture.** Extract only the geometric commitments actually present: backbone, local normal plane, radius, phase, winding, order, view.
2. **Reduce to a backbone.** Resample by arclength. Do not bake glow, width, perspective, or foreshortening into model geometry.
3. **Attach a parallel-transport frame.** Compute tangent `T(s)` and transported normals `N1(s), N2(s)`. Avoid Frenet flips around low curvature / inflection points.
4. **Trace a rotating arm in the local normal plane.**

   `X(s) = C(s) + R(s) [N1(s) cos(theta(s)) + N2(s) sin(theta(s))]`

5. **Localize phase when required.** Use plateau -> smooth rotation interval -> plateau for finite loop packets.
6. **Recurse.** Use the first generated helix as the next spine. Repeat the same operator for superhelices / nested winding.
7. **Measure actual pathlength.** Numerically integrate parent and child arclengths; never infer the ratio from visual pitch alone.
8. **Apply the same-path-speed constraint.** If both tracers move at identical path speed `c`, then the longer child path advances less far in the parent coordinate. Simultaneous advance fraction is `L_parent / L_child`.
9. **Solve rather than choose winding density.** Hold the intended parent geometry and radius fixed; numerically invert for turn count required by a target arclength ratio.
10. **Keep rendering separate.** Glow, black core, line width, perspective, lensing, magnification, and camera are display operations.
11. **Record every display distortion.** Axial, radial, time, and phase display changes must be explicit and reversible.
12. **Do the precision pass last.** Translate into one precise SAT/4DHH coordinate convention, normalize to independent measured quantities, blind-calculate, then compare against alternative SAT and outside formalisms.

## Current exact ratio sweep

With the current backbone and macro radius fixed at 0.20 model units:

- 20:1 path ratio -> about 391.53 turns -> same-c advance 5%
- 50:1 -> about 982.00 turns -> 2%
- 100:1 -> about 1979.00 turns -> 1%
- 200:1 -> about 4086.58 turns -> 0.5%

At ordinary display scale, the 50:1-200:1 cases collapse visually toward a luminous tube. That is a rendering/resolution fact, not permission to alter the physical/model ratio.

## Magnifier rule

Use a higher-resolution render of the same model coordinates. The lens should expose a native-resolution crop registered to the exact same model point. Optical zoom changes no model coordinate. Structural expansion is a separate, explicitly labeled transform.

## Display ledger template

```text
MODEL / PHYSICAL
  length scale      = ...
  time scale        = ...
  transverse radius = ...
  phase rate        = ...
  path speed        = c

DISPLAY
  axial expansion   = 1.000x
  radial expansion  = 1.000x
  time expansion    = 1.000x
  phase decimation  = none
```

## Doctrine

**NO METAPHORS: ONLY ANALOGUES.**

An analogue earns its place only by preserving relevant structure: topology, ordering, symmetry, metric relation, constraint, transition, dependency, or scale relation.

Prefer the smallest representation that preserves the needed distinction.
