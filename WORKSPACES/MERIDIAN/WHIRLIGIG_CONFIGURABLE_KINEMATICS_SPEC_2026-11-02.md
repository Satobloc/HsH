# Whirligig configurable kinematics and preset architecture

**Date:** 2026-11-02  
**Status:** implementation specification / sandbox branch  
**Branch:** `whirligig-configurable-kinematics-2026-11-02`  
**Scope:** current browser Whirligig, inner-wall / equal-area Analemma branch. This document does not merge the older outer-wall standalone Python solver into the browser mechanism.

## 1. Purpose

Turn the Whirligig from a single hard-wired configuration into a reproducible kinematic laboratory. A user must be able to change which relationships are constrained, explore alternate Analemma geometries and crossbar arrangements, save configurations, and restore a preferred default.

The apparatus must distinguish:

1. **Geometry:** the torus, sphere, Analemma curve, R/Q source curves, and attachment locations.
2. **Kinematics:** the transformations and phase relationships that move those objects.
3. **Constraints:** which degrees of freedom are fixed, coupled, or free.
4. **Presentation:** camera, overlays, trace history, and display gains.
5. **Evidence:** calculated closure, contact, intersection, and continuity diagnostics.

A display control must never masquerade as a physical or mathematical constraint.

## 2. Canonical reference configuration

The current browser mechanism is the reference preset and must remain recoverable exactly.

### Analemma

The current equal-area spherical figure-eight is:

```
beta(t) = k sin(t) cos(t)^2
phi(t) = 2t
G(t) = (cos(beta) cos(phi), cos(beta) sin(phi), sin(beta))
0 <= t < 2 pi
k = 2.63499709629253
```

Its specified geometry is:
- transverse self-crossing at east equatorial point E=(1,0,0);
- tangential kiss at west equatorial point W=(-1,0,0);
- northern and southern lobes wind around their respective poles;
- full spherical material length L_A = 13.26913503960638 b;
- equal-area condition is the selected balance criterion, not a proven global variational minimum.

### Torus and sphere

- Sphere radius b equals torus tube radius a.
- The selected rolling contact is the **inner radial torus surface**, Donomphulon=(R-b)e_r.
- P_ivot=(R+b)e_r remains the separate outer radial point.
- The selected-point rolling constraint is not global no-slip over the nonisolated equal-radius contact locus.
- The inner torus circumference is exactly two complete Analemma material lengths:
  `2 pi (R-b) = 2 L_A`.
- Thus R/b = 5.22369686421446. At b=a=0.55, R=2.87303327532.

### Phase locks

- Sphere-roll phase and Analemma material phase are one shared phase in the torus-co-rotating material frame.
- There are two complete Analemma/sphere-roll circuits per torus orbit.
- Elbow phase is 2 times the common phase, hence four elbow turns per torus orbit.
- R/Q sweep count is an independent integer control and does not redefine the elbow gear.
- Preserve the distinction between the co-rotating material phase and the inertial angular-velocity component. Do not replace the derived inner-contact rolling law with a forced numerical equality to the material phase rate.

### Existing baseline inputs

The current HTML defaults are the baseline for presentation/input state: R harmonic source, Q harmonic source, R display gain 0.55, Q display gain 0.60, Q sampling phase 0, R/Q sweep count 1, tube/sphere radius 0.55, playback speed 1.5. Any divergence between the current HTML and the canonical analytic contract must be surfaced as a diagnostic, not silently harmonized.

## 3. Configuration model

Use a versioned, serializable object. Separate mechanism identity from its parameter values.

Top-level sections:

- `schemaVersion`
- `mechanismId`
- `presetId`, `presetName`
- `geometry`
- `sources`
- `kinematics`
- `constraints`
- `mechanism`
- `trace`
- `presentation`
- `provenance`

Every numeric field must carry an explicit unit or be dimensionless by declaration. Angles are radians internally. Lengths use one consistent model unit; the reference configuration is dimensionless and scaled by b=0.55.

Unknown schema versions must be rejected with a useful message. Unknown fields should be preserved during import/export where practical, but must not be interpreted as active controls.

## 4. Constraint semantics

Each lock is a relationship between named variables, not a cosmetic disabled slider. A constraint record should contain:

- stable identifier;
- source and dependent variable(s);
- status: locked, released, or unavailable;
- governing relation or solver identifier;
- current residual;
- whether the relation is exact, numerically satisfied, or only a candidate.

When locked, dependent values are derived from the governing relation. They are not independently editable.

When released, the newly free degree of freedom must be exposed as a parameter or state variable. If no evolution law is supplied, the UI must label the mechanism underdetermined rather than inventing motion.

Initial constraint families:

| Family | Reference state | Experimental controls |
|---|---|---|
| Sphere orientation | Analemma SO(3) transport | release individual axes only when an explicit orientation law is selected |
| Sphere-roll / Analemma phase | shared | decouple phases with independently specified rates |
| Elbow / common phase | locked at 2× | release or change multiplier |
| R/Q sweep / torus orbit | integer sweep count | change integer count; noninteger mode requires explicit closure status |
| Crossbar A / B | B absent in reference | independent, coupled, or mirrored coupling |
| Crossbar / sphere frame | current transport | choose reference frame and transport rule |
| Projector / elbow | one elbow is the tracer | alternate attachment only in an explicitly selected mechanism variant |

Do not offer a switch that creates a contradictory constraint set. Show the active degrees of freedom and report rank/compatibility when a numerical constraint system is available.

## 5. Analemma geometry interface

A curve provider must return:
- position G(t);
- first and second derivatives;
- spherical unit tangent and normal;
- signed geodesic curvature;
- monotone material arc-length table and inverse;
- circuit length;
- identified self-intersections and tangencies;
- lobe winding and area diagnostics;
- closure residuals.

Initial mode registry:

1. `equal_area_reference`: enabled, current November 2 curve and parameters.
2. `pole_to_pole_candidate`: reserved experimental mode. It must remain unavailable until its geometric meaning is specified and a curve provider passes the interface above.
3. `custom_curve`: future import route for a user-supplied analytic or sampled spherical curve, with explicit validation.

Do not implement “pole-to-pole” as an undocumented visual stretch. Plausible mathematical interpretations are not interchangeable: a meridional great-circle carrier, a closed curve constrained to reach both poles, and a remapping of the existing figure-eight are different objects. The UI may show the mode as “definition pending” until the user selects or supplies the intended construction.

The equal-area reference curve remains available regardless of experiments. Switching geometry must recompute length, gearing, area, self-contact, and closure diagnostics. If the torus major radius is derived from the two-circuit condition, recompute it; do not retain a stale radius.

## 6. Crossbar and tracing mechanism variants

The mechanism selector should distinguish at least:

- `single_crossbar_reference`: current single R-Q crossbar and perpendicular elbow.
- `dual_crossbar_independent`: two independent crossbars, each with its own elbow and no mechanical attachment between them.
- `dual_crossbar_coupled`: only after a specific coupling law is selected.

For the proposed independent second crossbar, retain the user's stated construction as a testable hypothesis:
- its R/Q contact placement is mirrored relative to the first crossbar;
- its sweep and rotation directions are opposite;
- its elbow is independent;
- its tracing arm is anchored at the inside rim of the torus hole and passes through the torus centreline and outer large circumference, slicing the torus bagelwise.

Do not hard-code the hypothesized sphere wobble amplification, preferred projector orientation, or eventual trace self-reconnection. Measure these from the simulated geometry and report them as results or failures.

A crossbar instance should have its own source-port mapping, sweep phase, hinge axes, elbow phase, attachment definition, and diagnostics. The independent mode must not introduce a hidden constraint between A and B.

## 7. Presets, defaults, and persistence

Required actions:
- load preset;
- save current configuration as a named preset;
- duplicate preset;
- rename preset;
- delete user-created preset;
- set current preset as startup default;
- restore factory reference;
- export configuration JSON;
- import configuration JSON.

Factory reference is immutable. User presets are stored separately. Setting a startup default changes only the selected preset identifier, not the factory reference.

Persistence should use browser local storage with graceful fallback to in-memory operation. Imported files are data, not executable code. Validate all values before applying them.

Every preset records:
- schema version;
- mechanism identity;
- parameter and constraint snapshot;
- creation/update metadata;
- source commit or application version where available;
- diagnostic summary at save time.

A preset is reproducible only if all active parameters and constraint states are included. Do not save only slider values.

## 8. Diagnostics and acceptance tests

The interface must show, at minimum:
- active mechanism identity and preset name;
- free and constrained degrees of freedom;
- Analemma curve length and self-contact diagnostics;
- torus/sphere radius relation and derived major radius;
- selected-contact slip residual;
- SO(3) orientation closure;
- Analemma/sphere-roll phase closure;
- elbow phase closure;
- R/Q source closure and sweep count;
- ray/torus hit count and branch continuity warnings;
- trace seam position and tangent residuals;
- whether each result is analytic, numerically tested, candidate, or unverified.

Acceptance tests:

1. Loading factory reference reproduces the current reference geometry and numeric contract.
2. Export/import round-trips without changing active values or constraint states.
3. Changing a locked parent updates dependent values and never leaves stale dependent state.
4. Releasing a lock adds a visible degree of freedom or reports underdetermination.
5. Incompatible locks are rejected or explicitly reported; no silent priority rules.
6. Changing Analemma family recomputes all dependent geometry and closure values.
7. Dual independent crossbars remain mechanically independent in the equations and in perturbation tests.
8. Reset-to-factory restores the exact reference snapshot.
9. Save-as-default survives reload; factory reference remains unchanged.
10. The older outer-wall Python branch is never used as an implicit fallback for the browser inner-wall branch.

## 9. Implementation sequence

1. Add the versioned configuration object and immutable reference preset.
2. Add validation and dependency recomputation without changing the current rendering.
3. Add preset save/load/import/export.
4. Add the constraint panel and live residuals.
5. Add curve-provider abstraction; retain equal-area reference as default.
6. Add pole-to-pole candidate only after its intended geometry is specified.
7. Add dual-crossbar independent mechanism as a separate variant.
8. Add parameter-sweep and closure tests for the new variant.
9. Run regression comparison against the unmodified reference output.

## 10. Epistemic boundary

A configurable geometry engine is not evidence that two source equations are equivalent, that an arbitrary field equation has a faithful spherical representation, or that the mechanical toy is a physical bearing. Keep source equation, representation adapter, derived geometry, numerical result, and conjecture visibly distinct.

The repository-published browser file is not proof of a live ChatGPT Sites deployment. Any release must be separately verified at the served URL.
