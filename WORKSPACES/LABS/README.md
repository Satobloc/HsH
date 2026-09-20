# HsH Labs

**Status:** ACTIVE / SANDBOX EXPERIMENT FRAMEWORK  
**Established:** 2026-09-20

Purpose: provide a deliberate experimental space for concept trials, multi-loop tests, comparison pipelines, niche hypotheses, representation experiments, negative tests, and temporary sub-sandboxes without immediately turning them into central theory or permanent workflow branches.

This is a successor **in spirit** to earlier SAT-O Lab-style experimentation, not a claim that the old lab architecture should be reproduced literally.

Labs may contain durable named facilities and method institutions. Human-facing names may be commemorative; technical IDs and run schemas remain stable and plain where reliability matters. See `WORKSPACES/COMMON/COMMEMORATIVE_NAMING_CHARTER.md`.

Current named institutions include:

- **Holo J. F. Light Virtual Optical Workbench** — `HOLO_JF_LIGHT_VIRTUAL_OPTICAL_WORKBENCH.md`; visualization, projection, geometric readout, animation, and representation diagnostics;
- **Alberr Hall of First Principles** — `../COMMON/ALBERR_HALL_OF_FIRST_PRINCIPLES.md`; clean-sheet reasoning, thought experiments, independent first passes, and from-principles reconstruction before controlled comparison.

## Lab classes

A Lab may be one or more of:

- `CONCEPT_TRIAL` — develop or pressure-test a narrowly stated idea;
- `SIDE_BY_SIDE` — compare SAT/H(s)H machinery against a standard/reference formulation under common inputs;
- `MULTI_LOOP` — coordinate several recurrence/instance passes around one controlled experiment;
- `TRANSLATION` — map an external/standard mathematical formulation into SAT/H(s)H representation or vice versa;
- `NEGATIVE_TEST` — actively try to break a construction or show non-equivalence;
- `TOOL_BENCH` — test solvers, parsers, viewers, formalizers, or computational machinery;
- `NICHE_PLAYGROUND` — extended but explicitly sandboxed exploration of a non-central idea;
- `REPRESENTATION_TEST` — ask whether an apparent result survives coordinate/slice/solver/representation changes.

## Minimum lab record

Each Lab should preserve:

- Lab ID and title;
- origin (Watercooler, Field Note, Nathan directive, task branch, independent idea, etc.);
- question / purpose;
- current status;
- assumptions and definitions;
- inputs and source provenance;
- exposure/quarantine state;
- participants / instance identities;
- independent-first-pass requirements, if any;
- procedure / protocol;
- expected artifacts;
- comparator/reference, if any;
- failure / rejection conditions;
- exit criterion;
- promotion criterion;
- run/checkpoint history;
- next cursor;
- return route.

## Lab lifecycle

```text
PROPOSED → DESIGN → READY → RUNNING → {COMPLETE | FAILED | PARKED}
                                      └→ possible explicit promotion
```

A failed Lab is a valid result. A successful Lab does not automatically become theory.

## Multi-loop tests

A Lab may temporarily request multiple execution leases or independent passes. This is not a permanent role reassignment.

For a multi-loop test, specify:
- what each pass sees before beginning;
- whether passes are independent, cooperative, adversarial, or sequential;
- what outputs are frozen before cross-reading;
- how results are compared;
- when temporary leases are released.

Use the instance registry/execution-lease model rather than inventing permanent specialist departments for a temporary experiment.

## Promotion

A Lab result may be explicitly promoted to:
- a task/branch;
- a formalization target;
- a solver/tool component;
- a benchmark suite;
- a candidate theory-status artifact;
- a paper/provenance packet;
- another Lab.

Promotion must preserve the Lab record and say exactly what survived testing. "Interesting", consensus, or numerical resemblance is not a promotion criterion by itself.

## Data / benchmark hygiene

Where numerical or empirical targets are involved, label values as appropriate:

- `INPUT`
- `CALIBRATION`
- `FIT`
- `DERIVED`
- `PREDICTED_BEFORE_COMPARISON`
- `BLIND_TARGET`
- `POST_HOC_COMPARISON`

Record units, transformations, uncertainty where available, parameter freedom, and exposure history. Do not quietly repair a model after seeing the target and then describe the result as a prediction.

## Existing / seed Labs

See `LAB_REGISTRY.json`.

Initial design target:
- `LAB-SBS-001` — geometric solver vs standard-equation side-by-side pipeline.

`LAB-SBS-001` is a natural early customer of the Holo J. F. Light Virtual Optical Workbench once existing solver/rendering machinery has been inventoried.
