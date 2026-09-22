# NON-NEGOTIABLE SYMBOL MANAGEMENT

**Status:** PROJECT-WIDE CONTROL RULE  
**Scope:** SAT / H(s)H / Hagalaz / solver work / imported mathematics / historical reconstruction / public-facing equations  
**Effective:** 2026-09-21  
**Authority:** Nathan-direct project control

## Why this exists

This project deliberately brings mathematics from many fields, eras, solvers, papers, and prior SAT/H(s)H formulations into one working environment and asks whether the pieces can be made mutually coherent.

That makes symbol collision a structural hazard, not a cosmetic nuisance.

The project has already suffered real ambiguity from reused symbols, semantic drift, radius/diameter confusion, angle-complement confusion, and standard-physics symbols being casually reassigned. From this point forward, symbol management is a **hard research-control requirement**.

> **One active symbol, one active meaning, per declared namespace.**

A symbol may have different meanings in different historical or source namespaces, but the collision must be explicit and machine-searchable. No worker may silently transfer a meaning across namespaces.

---

## 1. Registration gate: no untracked shared symbols

Before a newly introduced symbol enters shared equations, a durable report, a solver interface, a canonical figure, a public artifact, or a cross-worker handoff, the worker must determine whether that symbol already exists in the project or in the external convention being invoked.

Minimum collision check:

1. inspect `WORKSPACES/COMMON/terminology/SYMBOL_REGISTRY.md`;
2. use Mercer_Searcher / Mersearch for project/archive occurrences when the symbol may be inherited, including Unicode, LaTeX, ASCII, and common transcription variants;
3. inspect the relevant source notation when importing mathematics from an external field;
4. if the collision cannot be resolved immediately, **qualify the symbol or mark it LOCAL/PROVISIONAL rather than guessing**.

The Mersearch math-search upgrade should treat this policy and registry as controlling requirements. Symbol search must normalize aliases such as `ℓ_f`, `\ell_f`, `l_f`, `lf`, subscript variants, Unicode Greek, LaTeX Greek, and OCR/transcription variants where feasible.

---

## 2. Namespace is mandatory metadata

Every shared symbol must belong to a namespace. Recommended classes:

- **STD** — standard mathematics / established physics convention;
- **SAT** — historical SAT usage;
- **HSH** — active H(s)H usage;
- **HAG** — Hagalaz / solver-unification objects when a separate solver-facing namespace is useful;
- **SRC:<source>** — source-faithful imported notation;
- **LOCAL:<artifact-or-solver>** — disposable local notation that must not silently escape its artifact.

The namespace does **not** have to be printed as an ugly prefix in every displayed equation. It must, however, be recoverable from the artifact's symbol table or registry entry.

If an equation combines namespaces, the mapping between them must be stated.

---

## 3. Standard symbols are reserved by default

Widely standardized symbols must retain their standard meaning unless a local source is being quoted or the alternate use is explicitly qualified.

Examples include, but are not limited to:

- `α` — fine-structure constant in physics contexts;
- `c` — speed of light;
- `G` — Newtonian gravitational constant;
- `ℏ` — reduced Planck constant;
- `π` — pi;
- standard tensor/index symbols when a source convention is explicitly adopted.

Do **not** create project-internal bare Greek-letter notation merely because the letter is convenient.

Current example: the tangent-step angle for the n-circle construction is `Δ_n = 2π/n`, **not** `α_n`, because `α` is already semantically occupied by the fine-structure constant in the shared physics namespace.

---

## 4. Historical notation is preserved, not rewritten

Legacy equations and quoted source material retain their original notation for provenance.

Do not silently modernize a historical symbol inside a source transcription.

Instead record:

- original symbol;
- original meaning as recoverable from the source;
- date / source / author or turn provenance;
- later reinterpretations;
- current mapping, if one has actually been established;
- unresolved collisions.

Historical preservation does **not** grant the legacy symbol permission to keep changing meaning in current work.

---

## 5. Semantic drift requires a new or qualified symbol

A symbol whose referent changes has changed variables, even if the numerical value is similar.

Use a new symbol, subscript, superscript, or explicit namespace when moving between concepts such as:

- filament core radius;
- filament outer-shell radius;
- helix radius;
- coil radius;
- central aperture radius;
- triswale clearance / amplitude;
- diameter rather than radius;
- projected rather than intrinsic length;
- local rather than global twist;
- historical rather than current scale.

### Canonical caution: `ℓ_f`

Historical SAT usage around `ℓ_f ≈ 0.7937 fm` has carried multiple descriptions in the archive and has been associated with a resolved helical/coil scale rather than securely established as the microscopic filament-core radius. It must **not** be reused as the present H(s)H filament radius unless an explicit derivation and provenance bridge establishes that identity.

This is exactly the sort of semantic collision this policy is designed to prevent.

---

## 6. Geometry-role declaration is mandatory

A length symbol is incomplete unless the geometric object it measures is named.

For every geometric scale, record at minimum:

- radius / diameter / circumference / arc length / axial length / clearance / separation;
- object measured;
- ambient and/or transverse dimension when material;
- intrinsic versus projected measurement;
- whether the object is a centerline, boundary, shell, surface, medial locus, or inscribed object.

Current triswale example:

- `r_f` may denote the radius of each **bounding filament circle/cross-section** in the local triswale construction;
- it must not simultaneously denote the radius or clearance of the inscribed twisted triswale surface;
- any central triswale measure gets its own symbol and definition.

---

## 7. Angle conventions must be fully specified

Every nontrivial angle definition must state:

1. the two geometric objects being compared;
2. the reference axis / normal / plane;
3. orientation and sign convention if signed;
4. whether the stored value is the angle or its complement/inverse convention;
5. radians or degrees in numerical presentation;
6. valid range and branch where relevant.

`θ_4` is not sufficiently defined by writing “helix angle.” If a construction measures it from the common normal rather than from the coplane, that fact is part of the definition.

Angles that are complements of one another should normally receive distinct symbols unless the complement convention is globally fixed and documented.

---

## 8. Sign and chirality conventions are mandatory

Any signed twist, handedness, triswale amplitude, winding, orientation, or holonomy variable must define what positive and negative mean.

A sign convention may be arbitrary; an unstated sign convention is not acceptable.

Mirror-related states must not be called `+` and `−` interchangeably across artifacts without a mapping.

---

## 9. Dimensions, units, and type are mandatory

Registry/symbol-table entries must state:

- mathematical type: scalar, vector, tensor, map, integer winding, set, operator, etc.;
- dimensions;
- units or `dimensionless`;
- for angles, numerical convention (`rad`, `deg`) even though angles are mathematically dimensionless.

Dimensional mismatch is a symbol-management failure before it is an algebra failure.

---

## 10. Provenance and epistemic status travel with the symbol

Every durable symbol entry must distinguish at least:

- standard mathematical definition / identity;
- established empirical constant or measured quantity;
- historical SAT assertion;
- current H(s)H hypothesis;
- derived result;
- conditional derivation;
- fitted quantity / residual;
- provisional working definition;
- unresolved genealogy;
- quarantined / do-not-use status.

A familiar symbol does not upgrade the status of the quantity attached to it.

---

## 11. Aliases are searchable, not interchangeable

Each registry entry may list aliases so humans and Mersearch can find the genealogy, but aliases do not automatically assert semantic equivalence.

Example:

`ℓ_f`, `\ell_f`, and `l_f` may be transcription aliases of the same historical glyph in one source family.

That does **not** imply every archive occurrence of `l_f` means the same physical/geometric quantity.

Alias normalization aids retrieval; semantic equivalence requires provenance.

---

## 12. Every shared equation needs a symbol table or registry link

A durable mathematical artifact must either:

- define every nonstandard symbol on first use; or
- include a compact symbol table; or
- link to registry entries that fully define them.

For equations imported from another field, preserve the source notation where useful, then provide an explicit translation table into the project namespace.

“Everyone knows what this letter usually means” is not a project control.

---

## 13. Local scratch notation must stay local

Fast exploratory math is allowed and encouraged. It does not need bureaucracy before the thought can be tested.

But scratch symbols that have not passed the collision gate must be marked or understood as `LOCAL:<artifact>` and **must not propagate into shared/canonical work by copy-paste without registration**.

A local variable can be ugly and temporary. A shared variable cannot be ambiguous.

---

## 14. Collision = stop-and-resolve condition

If a symbol is discovered to have two active meanings in the same namespace or artifact:

1. stop propagating the ambiguous notation;
2. identify both meanings and their provenance;
3. preserve historical originals;
4. rename or qualify the current variables;
5. update the registry and affected symbol tables;
6. record the mapping in the handoff if other workers may already have consumed it.

Do not “pick whichever meaning seems obvious from context” in a cross-worker derivation.

---

## 15. Numeric equality is not semantic identity

The project explicitly searches for deep equivalences across mathematics. Therefore this rule matters especially here:

> **Same value does not mean same object. Same symbol does not mean same object. Same functional form does not mean same mechanism.**

When two independently named quantities coincide numerically or algebraically, record the relationship as a candidate identity / exact identity / conditional identity as appropriate. Do not collapse their symbols until the structure-preserving mapping has actually been established.

This protects the project from both false unification and accidental loss of a real unification signal.

---

## 16. Canonical registry fields

The shared registry should support at least:

- `canonical_symbol`
- `namespace`
- `display_name`
- `aliases`
- `meaning`
- `mathematical_type`
- `geometry_role`
- `dimensions`
- `units`
- `angle_convention`
- `sign_or_chirality_convention`
- `domain_or_solver`
- `equations_or_relations`
- `provenance`
- `epistemic_status`
- `first_known_use`
- `current_source`
- `known_collisions`
- `historical_meanings`
- `maps_to`
- `does_not_imply`
- `notes`

Machine-readable mirrors may be added later. The Markdown registry is the human-readable control surface until superseded explicitly.

---

## 17. Publication / merge gate

Before a mathematical artifact is treated as canonical, merged into a solver interface, used in a precision figure, or published as explanatory project material, perform a symbol pass:

- no undeclared nonstandard symbols;
- no unresolved same-namespace collisions;
- no radius/diameter ambiguity;
- no silent angle-complement changes;
- units/dimensions present;
- standard physical constants not shadowed;
- historical mappings explicit;
- imported source notation translated;
- local scratch symbols either registered or removed.

If this check fails, the artifact is not symbol-clean and must not be treated as canonical.

---

## Operating principle

The project can absolutely “dump all the math together and make it work.”

But the dump must retain enough semantic bookkeeping to tell whether two expressions are:

- actually the same object;
- different coordinates on the same object;
- historical variants;
- unrelated quantities sharing a glyph;
- or a genuine newly discovered correspondence.

**Symbol management is therefore part of the mathematics, not clerical cleanup after the mathematics.**
