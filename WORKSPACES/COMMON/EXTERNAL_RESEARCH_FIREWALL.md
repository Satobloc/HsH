# External Research Firewall

**Status:** hard lane boundary  
**Applies to:** arXiv/recent-paper scans, literature review, prior-art work, citation research, empirical-constraint research, and any worker exposed to outside theories while supporting H(s)H.

## Core rule

External-research lanes do **not** build H(s)H theory.

Their job is to supply controlled external information without allowing outside equations, assumptions, models, interpretations, or research fashions to silently determine SAT/H(s)H structure.

The boundary is:

> import mathematics deliberately; import external physical theories only explicitly and under review.

## What external-research lanes are for

1. **Empirical hard backstops** — identify measurements, null results, bounds, datasets, and reproducible observations that a viable model must account for. Separate the observation from the literature's preferred interpretation whenever possible.
2. **Citation closure** — identify where H(s)H uses a standard result, definition, theorem, measurement, or deliberately imported tool that requires attribution.
3. **Prior-art / duplication control** — determine whether a construction already exists, how closely it matches, and what the chronology is.
4. **Responsible deliberate import** — when outside machinery is genuinely needed, document exactly what is imported, why, its assumptions, its limits, and what remains specifically H(s)H.

## What these lanes must not do

They must not:

- choose H(s)H geometry because a recent paper uses it;
- repair an internal derivation using an outside equation unless the import is explicitly requested and labeled;
- translate literature assumptions into H(s)H premises by default;
- recommend theory changes merely because a model is fashionable, successful in another framework, or mathematically convenient;
- collapse `empirical result` and `standard interpretation` into one datum;
- produce theory-promoted documents directly from a recent-paper scan.

## Output typing

Every external item should be typed as one or more of:

- `OBSERVATION` — directly measured/released empirical result;
- `BOUND` — empirical or mathematical constraint;
- `STANDARD_MATH` — theorem/definition/tool usable if assumptions hold;
- `MODEL_RESULT` — conclusion conditional on an external model;
- `INTERPRETATION` — explanatory reading supplied by external authors/community;
- `PRIOR_ART` — structurally relevant antecedent/comparator;
- `CITATION` — attribution/source support;
- `IMPORT_CANDIDATE` — potentially useful machinery not yet admitted to H(s)H.

`MODEL_RESULT`, `INTERPRETATION`, and `IMPORT_CANDIDATE` do not enter current theory without an explicit handoff and theory review.

## Required provenance for deliberate imports

Any proposed import must state:

- source and version/date;
- exact equation/object/assumption being imported;
- whether it is mathematics, empirical input, model-specific machinery, or interpretation;
- assumptions required;
- what H(s)H lacked without it;
- whether an internal construction can derive the same object independently;
- what changes if the imported assumption is removed;
- Ravel/Nathan promotion decision.

## Quarantine rule for mixed-lane outputs

Any artifact produced by an instance while it was simultaneously tasked with recent-paper/arXiv scanning and forward theorybuilding is **provisionally quarantined** until its check-in identifies:

- the artifact and exact path;
- which external sources were in active context;
- what equations, assumptions, models, ideas, analogies, or interpretations entered the artifact;
- what portions can be independently regenerated from internal H(s)H premises;
- what should be discarded, retained as external comparison, or re-derived cleanly.

Quarantine means `do not promote or use as a premise`; it does not mean delete.

## Clean handoff pattern

External lane -> evidence packet -> Common/Handoff -> internal theory lane.

The evidence packet should contain only:

- empirical backstop/bound or standard-math statement;
- provenance and assumptions;
- relevance question, not a prescribed theory answer.

Ravel/Nathan may then decide whether the internal theory lane should engage it. Janus tracks the dependency/provenance boundary.
