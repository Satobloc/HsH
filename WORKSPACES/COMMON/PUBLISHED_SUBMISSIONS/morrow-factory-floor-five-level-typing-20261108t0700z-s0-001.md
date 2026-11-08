# Factory Floor hierarchy: source-fidelity correction and typed map contract

**Disposition:** ADDITIVE SOURCE-FIDELITY CORRECTION. No new physical geometry, calculation, model, prediction, theory promotion, or Factory Floor admission.

## 1. Source and historical translation

Nathan Direct's 2026-11-03 geometry-first instruction names five distinct objects:

1. **Primary:** observation.
2. **Secondary:** a physical working orrery or hands-on demonstration.
3. **Tertiary:** precision dynamic geometry as a software model.
4. **Quaternary:** a precise static geometric diagram.
5. **Pentary:** mathematics.

The same source says the theoretical object is **geometry**, while mathematics describes the model and is neither the physical object nor the theoretical object.

Source record:
- [Nathan Direct geometry-first note](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/NATHAN_DIRECT_2026-11-03_GEOMETRY_FIRST_FACTORY_FLOOR_GATE.md)
- [Factory Floor geometry-first gate](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/FACTORY_FLOOR_GEOMETRY_FIRST_GATE_2026-11-03.md)
- [Historical Elias Kern Factory Floor report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ELIAS_KERN/2026-11-03T1600Z_FACTORY_FLOOR_GEOMETRY_GATE_M87.md)

The historical assistant report glosses the primary observation as **"Actual empirical object and evidence"** and the secondary orrery as a **"Tangible physical instantiation of the system."** Those phrases are useful shorthand only if carefully qualified. Taken literally, they collapse distinct object types.

## 2. Source-fidelity correction

The direct source identifies **observation** as the primary object. The physical system being observed is its referent, not the observation itself. Likewise, a working orrery or hands-on demonstration is a physical representation, not automatically the observed system.

The distinction is:

- **Physical referent:** the system or phenomenon under study.
- **Observation:** what is observed or measured about that referent.
- **Orrery/demo:** a physical demonstrator of the intended geometry.
- **Dynamic software model:** an executable representation of evolving geometry.
- **Static diagram:** a rendered geometric representation.
- **Mathematics:** a formal description of the geometry/model.
- **Theoretical object:** the geometry itself.

The common Nathan Direct note's phrase "observed physical system or phenomenon" should therefore be read as **observation of the system**, not identity between the observation and the system. A safer source-faithful gloss is: **Primary: observation of the physical system or phenomenon; keep the observation distinct from its referent.**

The assistant's other four labels are broadly aligned, but "physical instantiation of the system" should be narrowed to "physical working orrery or hands-on demonstration." The demonstrator is not thereby the system under observation.

## 3. Stable glossary

| Symbol / term | Type | Meaning |
|---|---|---|
| `S` | referent | Physical system or phenomenon under study. Analytic placeholder, not an extra level in the five-object list. |
| `O` | observation | Primary observation of `S`. |
| `G` | theoretical object | Geometry being described. |
| `P` | physical demonstrator | Secondary working orrery or hands-on demonstration. |
| `D` | dynamic representation | Tertiary precision dynamic geometry software model. |
| `Q` | static representation | Quaternary precise static geometric diagram. |
| `M` | formal representation | Pentary mathematics describing the geometry/model. |
| `mu` | measurement map | `S -> O`, with calibration, provenance, units, resolution, and uncertainty. |
| `I` | inference relation | `O -> G`; generally an inverse problem and potentially set-valued or probabilistic. |
| `R` | realization map | `G -> P`, a physical demonstrator. |
| `Dyn` | simulation map | `G -> D`, a dynamic software representation. |
| `V` | visualization map | `G -> Q`, a static rendering or projection. |
| `F` | formalization map | `G -> M`, a mathematical encoding. |

The symbols are an analyst's typing scaffold, not Nathan Direct equations and not a claim that the maps have already been constructed.

## 4. Mapping diagram

The five-object sequence is an epistemic and representational hierarchy, not a chain of nested shapes or a supplied sequence of projections.

```text
S: physical referent
       |
       | mu: measurement / observation
       v
O: primary observation
       |
       | I: inference / identification (may be non-unique)
       v
G: theoretical geometry
   |          |          |          |
   | R        | Dyn      | V        | F
   v          v          v          v
P: orrery   D: dynamic  Q: static  M: mathematics
   /demo       model      diagram    formalization
```

This is a proposed typed map scaffold, not a source-defined commutative diagram. The direct source supplies the object distinctions and their order, but it does not define these maps or assert that they compose into a lossless pipeline.

Each map needs its own contract:

- `mu`: measurement model, calibration, units, provenance, resolution, selection effects, and uncertainty.
- `I`: model class, identifiability, assumptions, and uncertainty. Do not assume a unique inverse.
- `R`: which geometric relations, dimensions, orientations, boundaries, and constraints the demonstrator preserves.
- `Dyn`: state variables, evolution law, constraints, numerical error, and observables.
- `V`: coordinate chart, projection, metric, scale, orientation, topology, incidence, boundary, and what information is omitted.
- `F`: domains, codomains, variable types, assumptions, quantifiers, definitions, and the soundness conditions of the translation.

The composition of these maps is not automatically faithful. A diagram can omit a dimension; a software model can encode a different boundary condition; a mathematical formalization can be internally valid while misrepresenting the intended geometry.

## 5. Shape nesting is a separate problem

A physical shape hierarchy or nesting claim needs explicit embeddings or projections. For projections `p(k->j)` and `p(j->i)`, require a composition condition such as:

`p(k->i) = p(j->i) o p(k->j)`

or state the exact isomorphism/natural transformation that replaces equality. Also identify the observables and geometric invariants preserved by each map.

For a projection `p : X -> Y` and a readout `g : X -> Z`, a downstream readout `h : range(p) -> Z` satisfying `g = h o p` exists exactly when `g` is constant on every fiber of `p`. This is the relevant generic factorization condition. It is not evidence that any particular HsH or Factory Floor map exists.

The five Factory Floor levels must not be used as a substitute for the missing embeddings, projections, or composition maps of a physical shape hierarchy. The 2024 rope hierarchy is a separate geometric source family and already has its own source-fidelity record:
[2024 rope hierarchy source-fidelity addendum](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ENHEDUANNA/2026-11-01T1544Z_2024_ROPE_HIERARCHY_SOURCE_FIDELITY_ADDENDUM.md).

## 6. Formalization status and limits

The generic factorization criterion is already formalized in the open Kestrel PR:
[HsH PR #873](https://github.com/Satobloc/HsH/pull/873).

In `HsHVerification/KestrelProjectedIncidence.lean`, theorem `hallway_factorization_iff_fiber_compatibility` states the range-restricted factorization condition. The recorded Lean 4/Mathlib run #41758925555, job #126341666752, built that module. Its axiom report lists `Classical.choice` for the factorization theorem, `Quot.sound` for uniqueness, and no axioms for the scale-route agreement theorem.

Limit: the same merge-ref PR run did **not** complete the whole PR. The root build failed later in `KestrelMovingSlice.lean` at lines 114 and 125, where two moving-slice theorem reports retain unresolved goals / `sorryAx`. PR #873 remains open, draft, and unmerged. This is not a clean full-project build, not a current-main proof, and not an instantiation of the Factory Floor maps.

No new Lean module or run was created because the five-level source does not define the maps to formalize. The existing theorem proves only its formalized generic statement. It does not prove the soundness of a translation or the truth of physical premises.

## 7. Factory Floor disposition

The M87* map-gap diagram in the historical report is a diagnostic of missing maps and evidence. It is **not** a precise geometric plot of the actual system and is not an admission artifact. The Factory Floor gate remains blocked until an actual system plot and its source, coordinates, metric/structure, topology, dimensions, orientation, incidence, boundary, projection, and fidelity review are present.

No measured system, dataset, provenance package, units, uncertainties, fit, prediction, physical calculation, or CODATA comparison was used in this addendum. No theory was promoted and no paper gate advanced.

## 8. Next deeper cursor

For one chosen physical system, recover the actual observation and its provenance; define the referent, geometry, and each representation separately; specify the maps and preserved invariants; check composition and fiber compatibility; then formalize the resulting conditional statements and run Lean on the exact source revision. Until those objects and maps exist, retain the hierarchy as a source-faithful taxonomy, not a mathematical equivalence.
