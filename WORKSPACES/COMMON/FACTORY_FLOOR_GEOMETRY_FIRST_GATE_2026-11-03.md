# Factory Floor Geometry-First Admission Gate
**Date:** 2026-11-03  
**Authority:** Nathan Direct, this conversation, 2026-11-03.  
**Status:** MANDATORY ADMISSION CONTROL; applies to H(s)H work, Factory Floor submissions, and papers that make geometric claims.  
**Scope:** Geometry-bearing claims and systems, which in practice includes nearly all H(s)H work and most of its papers.

## Controlling rule

> Nothing enters Factory Floor unless the system under study has a precise geometric plot, the plot has passed hostile fidelity review, and the plot is displayed with the submitted file.

Geometry is not decorative illustration, a pedagogical aid, or a visualization added after the mathematics. **The theoretical object is the geometry.** Mathematics provides precision, constraints, calculation, comparison and fitting; it is not a substitute for identifying and showing the object.

A formula-only submission is not Factory Floor eligible. A caption, verbal description, familiar textbook picture, block diagram, symbol map, or attractive conceptual sketch does not satisfy the gate. The plot must depict the actual object/structure asserted by the work, with enough specification that a reviewer can reconstruct what the geometry means and test whether the mathematics describes that same object.

This gate is additional to, and does not replace, source provenance, original-Nathan-statement recovery, real-data-first requirements, mathematical QA, Lean/code verification, cross-sector candidacy, or independent physical validation. Passing this geometry gate does not establish mathematical correctness, H(s)H candidacy, or physical truth.

## 1. Five representational levels

The following hierarchy is Nathan's stated order and terminology. These are distinct epistemic/representational objects, not interchangeable output formats.

1. **Primary — observation.** The physical system/process as observed in nature or experiment. Record the actual system, observational modality, instrument/measurement chain, calibration, uncertainty, frame, temporal/spatial coverage and selection effects. Observation is the empirical referent, not a diagram or model.
2. **Secondary — physical working model / hands-on demonstration / orrery.** A tangible, inspectable physical analogue or working model. State exactly what is mechanically/geometrically represented, what is scaled, what is omitted, and which correspondences are physical versus merely demonstrative. A physical orrery is not the observed system.
3. **Tertiary — precision dynamic geometric software model.** An executable, parameterized geometric model that evolves or responds. It must expose its state, geometry, constraints, transformations, time evolution, boundary conditions and outputs; it must be reproducible and inspectable. A moving animation without a defined geometric state and update law does not qualify.
4. **Quaternary — precision static geometric diagram.** A fixed, dimensioned and convention-complete plot of the theoretical object/system and its relevant relations. It must show the geometry itself, not merely label equations or list conceptual associations. This is the minimum mandatory visual deliverable attached to every Factory Floor submission.
5. **Pentary — mathematics.** Equations, definitions, proofs, algorithms, fits and numerical descriptions of the object. These are necessary where applicable, but cannot stand in for the quaternary plot or be mistaken for the physical/theoretical object.

The order is not a claim that every project must fabricate a secondary orrery before any work can be discussed. It specifies what each representational level is and prevents a lower-level description from being mistaken for the object itself. For Factory Floor admission, the quaternary plot is mandatory; the tertiary model is required where the claim concerns dynamics, transformation, evolution, response or other behavior that a static view cannot faithfully express. Secondary models and primary observations are required when the claim or paper makes them relevant, and actual empirical claims must be anchored to primary observation.

**SAT as “the K–T Boundary”** is retained here as Nathan's analogy for the proposed conceptual transition. It is not a geological claim, proof, or independent scientific classification.

## 2. What counts as a precise geometric plot

The plot must be selected for the actual mathematical/physical object. It is not enough to draw a generic helix, sphere, tube, field-line picture or spacetime grid because those shapes are familiar.

The plot specification must state, as applicable:

- **Object identity:** exact system/object being plotted; which parts are source-authenticated, standard-physics comparator, current H(s)H construction, or assistant-generated hypothesis.
- **Ambient space:** dimension, coordinate chart, embedding/carrier, topology and whether the geometry is Euclidean, Lorentzian, pseudo-Riemannian, configuration-space, phase-space, Hilbert/projective, fiber-bundle, contact/symplectic, causal, or another explicitly defined structure.
- **Metric and conventions:** metric tensor/signature, units/scales, orientation/handedness, index conventions, parameterization and frame. If no metric is defined, say so and specify the structure that is defined; do not invent one.
- **Primitive geometry:** points, curves, surfaces, volumes, worldlines/worldtubes, cross-sections, fibers, connections, normals, boundaries, interfaces, defects, singularities, supports, fields or other primitives actually used.
- **Incidence and relations:** intersections, containment, attachment, winding, linking, braiding, contact, orthogonality, parallel transport, projection, quotient, gluing, causal relation and any other claimed relation. Mark which are exact and which are schematic.
- **Dynamics, if claimed:** time/evolution parameter, state variables, update/evolution equations, constraints, initial/boundary conditions, invariants, conserved quantities and permitted deformations.
- **Readout/projection:** how the theoretical geometry maps to measured observables, detector coordinates, frames or standard-physics quantities. State what information is lost, averaged, integrated, projected or inferred.
- **Scale and uncertainty:** measured versus derived versus fitted dimensions; uncertainty, resolution, tolerance and unmeasured degrees of freedom.
- **Source correspondence:** for each visually asserted feature, identify the source statement, equation, dataset or explicitly labeled modeling choice that licenses it.

For a multi-scale or coupled system, provide a global plot locating the subsystem in the whole architecture and local plots resolving each critical object/interface. A set of disconnected local sketches is not a global geometric account.

## 3. Mandatory hostile geometric-fidelity review

The review must be independent of the authoring pass and must challenge whether the figure depicts the claimed object. It is not a beauty/layout review.

At minimum the reviewer must test:

1. **Object fidelity:** Does the plot show the object the source/theory actually defines, rather than an assistant's preferred substitute?
2. **Dimensional fidelity:** Are ambient dimension, intrinsic dimension, embedding, topology and degrees of freedom correct?
3. **Metric/frame fidelity:** Are signature, metric, coordinate chart, frame, orientation and transformation laws consistent with the equations and sources?
4. **Incidence/topology fidelity:** Are intersections, boundaries, linking, winding, closure, connectivity and singularities represented correctly?
5. **Projection/readout fidelity:** Does the displayed section/projection actually implement the claimed observation map? Are hidden assumptions and information loss explicit?
6. **Dynamic fidelity:** Where motion or deformation is claimed, does the tertiary model evolve the same geometric object under the stated law and constraints?
7. **Scale fidelity:** Are dimensions and relative scales sourced or derived? Are illustrative distortions clearly labeled?
8. **Equation↔geometry closure:** Does every central equation have a clear geometric referent, and does every geometrically asserted feature have a source-backed mathematical or observational definition?
9. **Alternative-interpretation challenge:** Could the same drawing represent a materially different geometry? If so, what annotations, measurements or invariants disambiguate it?
10. **Failure visibility:** Are unresolved parts, contradictions, omitted components and non-unique reconstructions shown rather than hidden?

The review record must name reviewer, independence, exact artifact version/hash, questions challenged, defects found, corrections made, residual uncertainties and verdict. A self-review or an LLM paraphrase of the author's intent is not hostile review. Where no independent reviewer is available, status remains **GEOMETRY_REVIEW_PENDING**.

## 4. Display and attachment rule

- The quaternary plot must be visible in the same submission package as the paper/artifact it governs. A link to an unrendered file elsewhere is not enough.
- Include the plot inline in the Markdown/PDF or as an explicitly embedded, version-pinned image/SVG with an immediately adjacent caption, legend, coordinate/convention key and source pointer.
- The exact plot file and its SHA-256 (or immutable Git blob) must be recorded beside the artifact. A changed plot invalidates the old review until the changed version is re-reviewed.
- Where tertiary dynamics are material, include the executable model/repository path, pinned version, run instructions, parameter manifest, and at least one rendered state/trajectory sequence beside the static plot.
- If a physical secondary model exists and is material, include photographs/video, construction notes, scale mapping and limitations.
- Papers must display the relevant geometric object at the point where it is introduced and again where a later result depends on a materially changed or projected geometry. A generic overview image does not satisfy an object-specific figure requirement.

## 5. Factory Floor gate states

Use these exact states:

- **GEOMETRY_NOT_SUPPLIED** — no precise plot attached.
- **GEOMETRY_UNDERSPECIFIED** — plot exists but object, metric/frame, topology, dimensions, incidence, scale or readout is insufficiently specified.
- **GEOMETRY_SOURCE_FIDELITY_UNVERIFIED** — plot is not traced to original source statements/authoritative theory/data.
- **GEOMETRY_REVIEW_PENDING** — independent hostile review not completed.
- **GEOMETRY_REJECTED** — hostile review finds material mismatch or unresolved contradiction that invalidates the claimed depiction.
- **GEOMETRY_REVISION_REQUIRED** — defects are repairable; resubmit exact revised plot and review.
- **GEOMETRY_CLEARED** — exact plotted object passed hostile geometric-fidelity review within stated scope and limitations.
- **FACTORY_FLOOR_ELIGIBLE** — geometry is cleared and all other existing Factory Floor admission gates are independently satisfied.

No state implies another. In particular, **GEOMETRY_CLEARED is not mathematical clearance; mathematical clearance is not H(s)H candidacy; candidacy is not physical validation.** Retain the existing BEDROCK distinction between mathematical clearance, eligibility for candidacy consideration, actual cross-sector H(s)H candidate status, and physical verification.

## 6. Required companion package

Every Factory Floor packet must carry:

| Component | Minimum evidence |
|---|---|
| Primary source statement | Exact source, author/speaker, date, locator, hash and context |
| Physical/observational referent | Named real system and source data when an empirical claim is made |
| Quaternary plot | Embedded precision static geometric diagram, conventions and version/hash |
| Geometric specification | Coordinates, metric/structure, topology, dimensions, orientation, incidence, boundary and projection as applicable |
| Tertiary model | Required when dynamics/response/evolution are material; executable and versioned |
| Secondary model | Physical orrery/demonstration when one is material or claimed |
| Pentary mathematics | Typed equations/objects, derivations, assumptions, units, tests and code |
| Hostile review | Independent geometric-fidelity report tied to exact plot version/hash |
| Discrepancy ledger | Geometry↔source, geometry↔equation, geometry↔observation mismatches and unresolved alternatives |
| Gate receipt | Separate statuses for geometry, math, candidacy and physical validation |

## 7. Retroactive handling of existing work

This directive takes effect immediately. It does not silently invalidate prior mathematical results or change their historical provenance. It changes what may be admitted to Factory Floor and what may be represented as a complete paper.

- Existing equation-only, code-only, proof-only or text-only submissions are **not Factory Floor eligible** until their object geometry is plotted and independently reviewed.
- Existing papers that make geometric claims but do not display the corresponding precise geometry require figure remediation before being called submission-ready under this rule.
- Existing diagrams must be audited for fidelity; their mere presence is not a pass.
- A conventional theory-network diagram, taxonomy or dependency graph is a map of relations between descriptions. It is not automatically a geometric plot of the physical system those theories describe.
- Do not invent a physical geometry to fill a diagram gap. If the source does not define the object sufficiently, record the missing definition and block the gate.

## 8. Immediate application to the Standard Physics Master Map

The Standard Physics Master Map is a conventional theory architecture and source-navigation project. Its nodes and typed edges are not themselves the physical geometries of Maxwell fields, spacetime, quantum states, QCD or cosmological systems.

Therefore the recently published **Standard Physics Backbone Expansion I** is retained as a Stage-A text/edge navigation skeleton only. It is **not** a Factory Floor artifact and must not be treated as geometrically complete. Before any part is routed to Factory Floor or used as a geometry-complete paper, it needs object-specific geometric plots for the relevant systems and hostile review of each plot. The global map must show where those geometric objects sit and how their maps/relations compose without pretending a conceptual graph is their physical geometry.

## 9. Provenance and interpretation

The five-level hierarchy and non-negotiable admission requirement in this document are recorded from Nathan's direct message of 2026-11-03. The detailed checklist, state names and package schema are the operational implementation of that instruction. They do not purport to be additional verbatim Nathan statements.

No geometry is certified by the act of writing this protocol. No new physical mechanism, metric, topology, scale or H(s)H proposition is introduced.
