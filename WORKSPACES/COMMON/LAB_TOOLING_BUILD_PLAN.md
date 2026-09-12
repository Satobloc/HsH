# H(s)H Lab Tooling Build Plan

**Status:** planning scaffold  
**Purpose:** recover the productive Lab 1 / Lab 2 spirit—build, calculate, visualize, falsify, compare—using current H(s)H geometry and modern reproducibility controls.

This is an engineering/testing plan, not a theory-status document.

## 1. Design principle

Every important geometric claim should be representable in at least one executable form and, where practical, checked by an independent representation or implementation.

Preferred loop:

`typed definition -> symbolic form -> numerical implementation -> visualization -> invariant/property tests -> independent cross-check -> archived result packet`

## 2. Core geometry library

Build a small typed Python package for:

- points/vectors and framed segments;
- curves and transported frames;
- circular helices / screw motions;
- nested helices / superhelices;
- ribbons and finite-radius tubes;
- framed spheres / UI states;
- torus windings;
- 3D and 4D rotations;
- finite-core sections/intersections;
- configuration-space/braid readouts;
- similarity/closure/return maps.

Keep physical interpretation outside the primitive geometry classes.

## 3. Representation round-trip tests

Where transformations are claimed lossless, test the round trip:

- helix <-> phase/wave representation;
- segment/frame <-> framed sphere;
- helix-history <-> toroidal phase ledger;
- UI state <-> normalized relative-frame data;
- 4D double rotation <-> two-plane phase representation.

A failed round trip is a first-class result: it identifies hidden information or an incorrect equivalence claim.

## 4. Closure / holonomy / recurrence scanner

Given scale, phase, offset, and rotation parameters, compute:

- exact closures;
- similarity closures;
- partial-phase closures;
- near closures with declared tolerance;
- rational approximants / continued fractions;
- closure order;
- relative angles at closure;
- centerpoint offsets;
- sphere-diameter ratios;
- measure ratios by dimension.

Never privilege golden/Fibonacci/legacy SAT numbers in the base sweep.

## 5. Dimensional reduction / higher-algebra explorer

Create an engine that enumerates internal dimensionless relations and asks:

1. which variables can be held fixed;
2. which can be scaled/phase-multiplied/divided into one another;
3. which combinations remain invariant;
4. which transformations compose;
5. whether the resulting relation system admits compact symbolic/integer encoding.

Candidate inputs:

- radius/diameter ratios;
- centerpoint offset ratios;
- pitch/wavelength/wavenumber ratios;
- relative frame angles;
- phase and closure orders;
- chirality signs;
- area/volume/hypervolume ratios;
- contact-distance ratios;
- curvature/torsion ratios.

Output should be a transformation/invariant ledger, not an interpretation.

## 6. Finite-thickness / self-contact solver

For tubes/worldtubes:

- local curvature thickness bound;
- nonlocal closest approach;
- first self-contact;
- tangency classification;
- admissible phase regions;
- recursive forbidden intervals;
- survivor-set diagnostics;
- topology before/at/after collision.

Use adaptive numerical minimization plus analytic checks where available.

## 7. 4D rotation module

Implement independent decomposition/checks for `SO(4)` rotations:

- principal double-rotation angles;
- isoclinic special cases;
- orientation preservation;
- closure conditions in each plane;
- partial/full recurrence;
- projection into 3D readouts.

Cross-check representative cases with Wolfram or a separate symbolic implementation.

## 8. Solver reconstruction harness

For UI, Whirligig/Donut, Spheres, and eventually Graticule:

- reconstruct the operator from source definitions rather than historical output tables;
- declare input state and dimensional type;
- run canonical test cases;
- compare equivalent representations;
- record intervention/free-parameter budget;
- test reversibility/information loss;
- preserve negative mismatches.

## 9. Discriminant / special-locus mapper

Parameter sweep over compact dimensionless state, initially something like:

`(mu, nu, xi, gamma, a/D, chirality, phase offsets)`

Classify regions/loci for:

- loss of helicity;
- chirality reversal;
- exact/near closure;
- center collapse;
- tangency/crossover;
- self-contact;
- braid/configuration collision;
- symmetry enhancement;
- degeneracy;
- bifurcation.

Use continuation methods where brute-force gridding is wasteful.

## 10. Property-based and metamorphic tests

Examples:

- rigid rotation cannot change invariant distances;
- uniform scale changes k-dimensional measure by scale^k;
- coordinate rotation does not create physical chirality in an isotropic state;
- representation round trip returns the same typed state within tolerance;
- reversing orientation twice restores orientation;
- equivalent phase parameterizations yield identical closure classes;
- thin-core limit converges to declared centerline geometry.

Property tests are often more useful than single-value unit tests for this project.

## 11. Symbolic/numeric independence

Important derivations should ideally have two routes:

- Python/SymPy or analytic derivation;
- Wolfram or independent numerical reconstruction.

Do not have the same generated expression serve as both implementation and test oracle.

## 12. Visual diagnostics

Build deterministic figures/animations for:

- nested helices with local frames;
- coincident cockeyed framed spheres/UI;
- closure-point segment layouts;
- torus phase paths;
- 4D projections;
- finite-thickness contact approach;
- sphere intersection/bifurcation experiments;
- parameter-space special loci.

Store generation code and parameter manifests beside important visuals.

## 13. Result packet schema

Every consequential computational result should record:

- result ID;
- code commit/hash;
- equation/spec version;
- input parameters;
- units/dimensions;
- solver tolerances;
- random seed if any;
- output hash/path;
- tests passed/failed;
- independent-check status;
- interpretation status (`math only`, `candidate`, etc.);
- source/provenance pointers.

## 14. CI / code locking

GitHub Actions should eventually run:

- syntax/lint/type checks;
- unit/property tests;
- solver smoke tests;
- equation-ledger schema checks;
- deterministic fixture reproduction;
- conversation/catalog integrity tests;
- broken provenance/path checks;
- quarantine/promotion metadata validation where machine-readable.

Pin environments and dependencies. Use one-writer/shared-file rules for generated canonical artifacts.

## 15. Blind and adversarial checks

Where target-fitting risk exists:

- hide target values from the builder;
- separate generator and evaluator;
- preregister parameter ranges and tolerances;
- retain nulls and failures;
- have external-evidence lane provide comparator data only after internal quantity is frozen.

## 16. Suggested build order

### LAB-A — Geometry Zero
Typed primitives, helix/screw, frames, nested helix, round-trip representations.

### LAB-B — Closure Atlas
Phase/wavelength ratios, center offsets, framed spheres/UI, exact/near closure scanner.

### LAB-C — Finite Core
Tube thickness, contact, sections, readout intersections, topology-change threshold.

### LAB-D — Dimensional Reduction / Algebra
Transformation composition, invariants, alternate fixed-variable slices, symbolic/integer encoding search.

### LAB-E — Solver Recovery
UI -> Spheres -> Whirligig/Donut -> Graticule, each reconstructed from source.

### LAB-F — Prediction Harness
Only after internal quantities are independently frozen: comparator datasets, uncertainty, falsification, external firewall.

## 17. Immediate decisions after roster synthesis

Assign:

- primary geometry-code builder;
- independent math checker;
- visualization/solver-reconstruction owner;
- CI/reproducibility owner;
- archive source-recovery liaison;
- empirical test liaison behind firewall.

Then recover Lab 1 and Lab 2 conversations and mine them for useful methods/tools before duplicating old work.
