# Reentry Rubric — Public/Cleared Interface

**Status:** ACTIVE DESIGN  
**Scope:** defines the non-quarantined interface and scoring dimensions. The rubric administrator's full workspace, notes, source exposure, and adjudication reasoning remain quarantined.

## Rule

Assess the **submitted work on its stated problem**, not whether the instance agrees with current team expectations. Distinguish independent dimensions; do not collapse them into a single confidence score.

## Required dimensions

### 1. Problem effectiveness
Can the submission materially solve, constrain, clarify, falsify, or improve the assigned problem?

Statuses: `STRONG / USEFUL / PARTIAL / NO-GAIN / MALFORMED`

### 2. SAT recognizability / internal relevance
Does the work operate on recognizable SAT/H(s)H objects, constraints, methods, or a clearly translatable mathematical structure?

Statuses: `DIRECT / TRANSLATABLE / ADJACENT / UNCLEAR / NON-SAT`

This is not a correctness score.

### 3. Mathematical integrity
Evaluate only obligations actually present: definitions, algebra, calculus/variation, dimensions/units, type consistency, dependency closure, limiting cases, numerical checks, proof obligations, etc.

Statuses: `CHECKED-PASS / CHECKED-PARTIAL / CHECKED-FAIL / UNDERDEFINED / NOT-APPLICABLE`

Every `CHECKED-*` must name the check. No generic 'verified'.

### 4. Object / dimensional / category discipline
Are geometrical objects, coordinates, parameters, maps, readouts, state variables, representations, and dimensions kept distinct enough to support the claimed inference?

Statuses: `CLEAN / MINOR-AMBIGUITY / MATERIAL-AMBIGUITY / TYPE-ERROR / NOT-ASSESSED`

### 5. Ontological/import burden
How much does the result depend on assumptions about physical reality, external theory, interpretation, analogy, or unstated ontology beyond the assigned problem?

Statuses: `MINIMAL / EXPLICIT-BOUNDED / SUBSTANTIAL-BUT-DECLARED / HIDDEN-OR-CONFLATED / NOT-APPLICABLE`

A substantial declared ontology is not automatically a failure; hidden import is the concern.

### 6. Interpretation discipline
Does the submission distinguish mathematical result, model interpretation, empirical claim, analogy, speculation, and narrative explanation?

Statuses: `CLEAN / MOSTLY-CLEAN / MIXED / CONFLATED`

### 7. Source/provenance discipline
Does it correctly distinguish Nathan-authored material, assistant/other-model material, standard mathematics, current sources, older constructions, and its own reconstruction?

Statuses: `CLEAN / MINOR-GAP / MATERIAL-GAP / PROVENANCE-FAIL / NOT-APPLICABLE`

### 8. Novel progress value
Did the attempt expose a useful invariant, equivalence, contradiction, new derivation, better formulation, negative result, missing assumption, or productive question?

Statuses: `HIGH / MODERATE / LOW / NONE / UNCLEAR`

Novelty here means new to the current work packet, not priority against outside literature.

## Separate routing flags — never fold into quality score

### Quarantine exposure
`NONE-KNOWN / POSSIBLE / CONFIRMED`

Confirmed quarantine exposure controls communication routing regardless of mathematical quality.

### wackySAT exposure
`NONE-KNOWN / LIGHT / MATERIAL / DOMINANT`

Defined operationally here as substantial SAT use in soft-science, personal-numerology, or comparably non-physics domains. This is **not a contamination/quarantine category** and is not a competence failure. It indicates that physics-forward tasks should isolate any useful mathematical/geometric kernel before promotion.

### Cross-contamination exposure
`INDEPENDENT / PARTIAL-EXPOSURE / FULL-EXPOSURE / UNKNOWN`

Records whether the worker saw other candidate solutions or later interpretations before freezing its own answer.

## Cleared disposition

The administrator may outwardly return only:
- packet/instance ID;
- live problem ID;
- the dimensions/statuses above;
- `PASS / PARTIAL / FAIL / INSUFFICIENT` for the specific reentry attempt;
- routing class: `SANDBOXABLE / USEFUL-NONCORE / WACKYSAT-EXPOSED / QUARANTINE-EXPOSURE / UNDERDEFINED`;
- a short cleared rationale containing no quarantined source information;
- specifically cleared work product or pointer, if any.

A failed attempt never means delete, suppress, or permanently exclude the instance.

## Pass meaning

`PASS` means only: **the instance's work on this problem is recognizably relevant and effective enough to enter the controlled sandbox under its stated assumptions and exposure history.**

It does not mean the theory, mathematics beyond named checks, ontology, physical interpretation, or empirical claim is correct.
