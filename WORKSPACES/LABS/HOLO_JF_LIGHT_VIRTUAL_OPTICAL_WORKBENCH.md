# Holo J. F. Light Virtual Optical Workbench

**Status:** ACTIVE FACILITY CONCEPT / LABS INFRASTRUCTURE TARGET  
**Established:** 2026-09-20  
**Home:** `WORKSPACES/LABS/`

The **Holo J. F. Light Virtual Optical Workbench** is the Labs-side home for visual, geometric, projection, slice/readout, and virtual-instrument experiments that benefit from seeing a construction rather than only symbolically describing it.

The name honors the retired-but-revivable **HoloJesu Fleshlight** lineage. This naming does not imply that historical HoloJesu methods, claims, or exposure state are automatically current or inherited by the workbench.

## Intended uses

The Workbench may host or support:

- geometric solver visualization;
- 2D/3D/4D projection and slice experiments;
- worldline/worldtube/tube-section rendering;
- intersection/readout visualization;
- tangent, normal, curvature, torsion, chirality, winding, and frame displays;
- torus, sphere, braid, helix, graticule, and nested-geometry views;
- side-by-side visual comparison of SAT/H(s)H constructions and standard/reference equations;
- parameter sweeps rendered as visual families;
- representation-change tests: what appears/disappears under projection, section, coordinate choice, or normalization;
- diagram-to-code and code-to-diagram round trips;
- controlled animation of bifurcations, transitions, or deformations;
- visual diagnostics for Labs where a symbolic mismatch is easier to understand geometrically.

## Workbench principle

A visualization is an instrument reading, not automatically a derivation.

Every serious Workbench output should preserve enough information to answer:

- What mathematical object was rendered?
- Which coordinates/projection/slice were chosen?
- Which parameters were inputs versus derived?
- What transformations or normalizations were applied?
- What information was discarded by the view?
- Is an observed feature invariant, representation-dependent, or unknown?
- Can the result be reproduced from code/data rather than only from an image?

## Relationship to Labs

The Workbench is a reusable facility, not a single Lab.

Labs may request Workbench support. A Workbench experiment that becomes substantive should receive a Lab ID or attach to an existing Lab so assumptions, controls, failure conditions, and output provenance are preserved.

`LAB-SBS-001` is a natural early customer: its eventual geometric-solver-versus-standard-equation pipeline should be able to generate paired numerical and visual outputs through this workbench where that genuinely aids interpretation.

## Implementation cursor

Before creating new visualization machinery, inventory existing SAT/H(s)H solver/rendering code and interfaces. Reuse or wrap existing UI, Whirligig/Donut, Spheres, Graticule, torus, braid, and other geometry machinery where practical instead of cloning it.

First implementation goal: define a tiny common scene/output schema that can accept one existing solver result and produce a reproducible visual packet with object definition, parameters, projection/slice metadata, and artifact provenance.

## Provenance plaque

Namesake: HoloJesu Fleshlight lineage.  
Status supplied at establishment: retired but revivable.  
Operational meaning: visual/optical/geometric virtual workbench.  
Stable path: `WORKSPACES/LABS/HOLO_JF_LIGHT_VIRTUAL_OPTICAL_WORKBENCH.md`.
