# Physics Master Map — Namespace Ledger Schema

**Date:** 2026-10-24
**Status:** ACTIVE DESIGN
**Purpose:** machine-readable identity control for the Standard/Historical Physics Master Map and the parallel SAT/H(s)H atlas.

## Core rule

> Register objects before asserting equivalence.

The same printed symbol may represent different objects. The same mathematical object may appear under different notation. The ledger must preserve both facts.

## Tables

### 1. theories
One row per theory/formalism/programme.

Required fields:
- theory_id
- namespace_family
- canonical_name
- aliases
- theory_type
- date_start
- date_end
- key_figures
- domain
- status
- parent_theory_ids
- source_ids
- notes

Examples of namespace families:
- STD
- HIST
- ALT
- EXT:<FIELD>
- SAT-HIST
- HSH
- HAG
- SOLVER:<NAME>
- LOCAL:<TASK>

### 2. equations
One row per distinct equation/action/Hamiltonian/constraint form.

Required fields:
- equation_id
- theory_id
- equation_kind
- canonical_name
- source_form
- normalized_form
- domain
- assumptions
- coordinate_system
- metric_signature
- boundary_conditions
- source_ids
- verification_status
- notes

Do not collapse equations merely because algebraic rearrangement is plausible. Proven algebraic equivalence is an edge.

### 3. objects
One row per distinct mathematical/physical object.

Required fields:
- object_id
- namespace
- canonical_name
- preferred_symbol
- object_type
- semantic_definition
- mathematical_type
- dimensions
- units
- geometry_role
- state_space
- frame
- metric_signature
- sign_orientation_convention
- epistemic_status
- theory_ids
- source_ids
- notes

Object types include:
quantity, constant, coefficient, parameter, operator, functional, tensor, vector, scalar, field, state, wavefunction, manifold, group, connection, metric, current, density, action term, Hamiltonian term, boundary datum, index family, transformation, map, invariant, observable, constraint, kernel, constitutive relation.

### 4. occurrences
One row every time a registered object appears in a registered equation/source context.

Required fields:
- occurrence_id
- object_id
- equation_id
- source_id
- printed_symbol
- source_namespace
- local_definition
- coefficient_role
- index_structure
- units_as_printed
- convention_notes
- confidence

This table is essential. It prevents one object's registry record from erasing source-local usage.

### 5. identity_edges
One row per relationship between two registered objects.

Required fields:
- edge_id
- from_object_id
- to_object_id
- relation_type
- directionality
- assumptions
- transform
- inverse_exists
- information_loss
- domain
- evidence_class
- source_ids
- verification_status
- test_id
- notes

Allowed relation types:
- SAME_GLYPH
- ALIASED_NOTATION
- SAME_DEFINITION
- SAME_OBJECT
- EQUIVALENT_UNDER
- TRANSFORMABLE_TO
- LIMIT_OF
- APPROXIMATES
- PHYSICALLY_IDENTIFIED_BY_SOURCE
- POSSIBLY_SAME
- DISTINCT
- CONFLICTING_IDENTIFICATION

### 6. theory_edges
One row per relationship between theories/formalisms.

Required fields:
- edge_id
- from_theory_id
- to_theory_id
- relation_type
- epistemic_strength
- assumptions
- domain
- source_ids
- verification_status
- notes

Epistemic strengths:
- K KNOWN
- R REPORTED
- S SUSPECTED
- A ASSERTED

### 7. sources
One row per source.

Required fields:
- source_id
- citation
- source_type
- author
- title
- year
- locator
- repository_path_or_external_id
- source_status
- read_depth
- notes

### 8. tests
One row per explicit equivalence/collision/translation test.

Required fields:
- test_id
- target_edge_or_object_ids
- fixture
- method
- expected_result
- observed_result
- pass_fail_open
- code_or_calculation_locator
- reviewer
- date
- notes

## ID strategy

IDs should be opaque enough to remain stable when notation changes, but readable enough for humans.

Suggested patterns:

- theory: `TH-STD-GR-0001`
- equation: `EQ-STD-GR-EINSTEIN-FIELD-0001`
- object: `OBJ-STD-GR-NEWTON-G-0001`
- occurrence: `OCC-EQ-...-00001`
- object relation: `REL-OBJ-000001`
- theory relation: `REL-TH-000001`
- source: `SRC-HEHL1976-0001`
- test: `TEST-EQUIV-000001`

The ID must not encode a scientific conclusion likely to change.

## Views

Generate human-facing views from the flat records:

- collapsible theory tree
- sector map
- equation cards
- symbol collision dashboard
- object genealogy
- same-glyph report
- candidate-equivalence queue
- known-identity graph
- unresolved identity graph
- coefficient/parameter pivot
- theory-by-object matrix
- source coverage matrix
- SAT/H(s)H vs standard cross-map comparison view

The views are disposable. The ledger is authoritative.

## SAT/H(s)H parallel-map rule

SAT/H(s)H gets its own theory IDs, equation IDs, objects, and internal identity edges.

Do not force standard-physics classifications onto SAT/H(s)H.

When SAT/H(s)H says two standardly distinct things should be treated as equivalent, record that as a SAT/H(s)H-side identification plus a cross-map edge with its own evidence status.

When standard physics says two things are equivalent and SAT/H(s)H distinguishes them, preserve both classifications.

Disagreement is data.

## Immediate pilot

Before scaling to all physics, populate a pilot across:
1. Newton/Lagrange/Hamilton mechanics;
2. Maxwell electromagnetism;
3. special relativity/Minkowski;
4. GR/Einstein-Hilbert;
5. Schrödinger/Dirac;
6. Yang-Mills;
7. one historical branch, preferably Einstein-Cartan or Kaluza-Klein;
8. the corresponding SAT/H(s)H concepts in a separate namespace.

Use the pilot to test whether the schema can answer:
- Where is this symbol used?
- Are these two coefficients actually the same object?
- Which theories claim they are the same?
- Under what assumptions are two equations equivalent?
- Which SAT/H(s)H object is being compared to which standard object?
- What changed historically?
- What remains unresolved?
