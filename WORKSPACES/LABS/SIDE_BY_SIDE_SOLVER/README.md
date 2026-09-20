# LAB-SBS-001 — Geometric Solver vs Standard Equation

**Status:** DESIGN  
**Class:** SIDE_BY_SIDE / TOOL_BENCH / REPRESENTATION_TEST  
**Established:** 2026-09-20

## Question

Can we build a reproducible harness in which one well-defined case is represented both by a standard/reference equation and by an SAT/H(s)H geometric solver, using matched inputs and explicit transformations, so the outputs can be compared without hiding parameter freedom, target leakage, unit changes, or representational assumptions?

This Lab is deliberately about **comparison machinery first**, not proving equivalence.

## Desired pipeline

```text
shared case manifest
        │
        ├──> reference/standard adapter ──> normalized reference output
        │
        └──> SAT/H(s)H solver adapter ───> normalized geometric output
                                               │
                                               v
                                      comparison / diagnostics
                                               │
                                               v
                                      reproducible run packet
```

## Shared case manifest

A case should eventually declare at least:

- case ID / description;
- mathematical object/domain;
- standard/reference formulation;
- SAT/H(s)H representation being tested;
- initial/boundary conditions;
- coordinate/frame conventions;
- units/dimensions;
- parameters and which side owns them;
- transforms needed to put outputs in a common comparison space;
- values classified as `INPUT`, `CALIBRATION`, `FIT`, `DERIVED`, `PREDICTED_BEFORE_COMPARISON`, `BLIND_TARGET`, or `POST_HOC_COMPARISON`;
- source/provenance and exposure state;
- expected invariants or qualitative checks;
- failure conditions.

## Adapter rule

Each side should be independently inspectable.

A reference adapter should not know how the SAT/H(s)H side was tuned, and the SAT/H(s)H adapter should not quietly absorb target outputs unless the run is explicitly classified as fit/calibration.

The comparator should work only on normalized declared outputs; it should not repair either model.

## Comparison outputs

Depending on the case, report:

- dimensional/unit consistency;
- pointwise or aggregate residuals;
- invariant agreement/disagreement;
- qualitative/topological correspondence;
- limit behavior;
- parameter sensitivity;
- representation/coordinate sensitivity;
- null/failure cases;
- what was actually independent vs shared by construction.

No single metric is mandatory across all cases.

## Reproducibility packet

A Python implementation should record where feasible:

- Python version;
- dependency lock/freeze;
- script/adapter versions or commit hashes;
- input manifest hash;
- deterministic seed when stochastic components exist;
- output hashes;
- run timestamp;
- solver/version identity;
- transformation code used for normalization;
- full classification of target exposure and parameter fitting.

## First implementation sequence

1. **Inventory before coding.** Locate current SAT/H(s)H solver implementations, scripts, notebooks, equations, data formats, and any existing comparison machinery. Do not recreate an adapter that already exists.
2. Choose the **smallest viable paired benchmark**: simple enough to understand end-to-end, but genuinely represented on both sides.
3. Freeze a minimal case schema and normalized output schema.
4. Implement the reference adapter.
5. Implement the SAT/H(s)H adapter without target leakage beyond the declared case classification.
6. Implement the comparator/report generator.
7. Run one case and preserve the complete reproducibility packet.
8. Decide whether to extend, revise, falsify, or park the pipeline.

## Candidate source families to inspect before selecting the first case

Do not assume which is best until inspected. Candidate families include the existing geometric solver lineage (Universal Indicatrix / Whirligig / Donut / Spheres / Graticule and related implementations), current formalization scripts, and any standard-equation comparison code already present in HsH or the archive.

## Multi-loop option

Once the harness is defined, a controlled multi-loop test could use separate instances for:

- reference-side implementation;
- SAT/H(s)H-side implementation;
- blind comparator/auditor;
- provenance/exposure audit.

Freeze independent outputs before cross-reading when that adds value. Temporary participation does not redefine the workers' generalist identities.

## Hard boundaries

- `PRIOR_ART` remains quarantined.
- Numerical agreement alone is not derivation, equivalence, or validation.
- Historical target constants are not silently allowed as repair parameters.
- A representation match must say what transformation established comparability.
- Failure to match is a valid Lab result.

## Current next cursor

Inventory the existing solver/tool interfaces and find the smallest benchmark that can legitimately be implemented on both sides. Only then create the Python package/schema.
