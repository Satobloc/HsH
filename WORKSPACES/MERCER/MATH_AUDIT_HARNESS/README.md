# SAT/H(s)H Independent Math Audit Harness

**Status:** ACTIVE DESIGN / FIRST IMPLEMENTATION
**Date:** 2026-09-22
**Owner lane:** Mercer, independent-check side
**Partner lane:** Meridian, invention/formalism side
**Priority:** Nathan-direct; runs alongside Code Grurple without displacing paper-critical events

## Mission

Build a standard/niche/accepted-mathematics checking pipeline that can accept typed SAT/H(s)H mathematical contracts and attack them through multiple independent evidence lanes with minimal supervision.

This is not a second invention engine. It is an adversarial/reference engine.

## Silo contract

Shared between Meridian and Mercer:
- typed case/claim manifest;
- namespaces and symbol identities;
- units/dimensions;
- assumptions/domain/regularity;
- declared input/calibration/fit/blind-target classes;
- expected invariants and failure conditions;
- frozen output schema.

Siloed until both outputs freeze:
- implementation code choices;
- intermediate reasoning/debugging;
- interpretation of surprising results;
- tuning history.

After freeze, compare outputs and classify agreement/discrepancy. Cross-read implementation only as needed to diagnose the frozen discrepancy.

## Existing machinery to reuse

- `formalization/` executable equation registry: source records, curated typed equations, Python checks, optional SymPy identities, Lean obligations.
- `WORKSPACES/LABS/SIDE_BY_SIDE_SOLVER/`: independent standard/reference vs SAT/H(s)H adapters.
- `WORKSPACES/MERIDIAN/SOLVER_HARNESS/`: Meridian-side contract/output pattern; do not copy hidden implementation reasoning into Mercer adapters.
- historical `PYTHON Math Locking (SAT.O)/`: genealogy/test ideas, not automatically current code.
- `WORKSPACES/COMMON/terminology/TOOLBOX_NAMESPACE_LEDGER.md`: imported-object identity/adoption ledger.
- `synthesis/FORMALISM_SELECTION.md`: current source-grounded formalism recommendation map.

## Non-negotiable namespace gate

Follow:
- `WORKSPACES/COMMON/TOOLBOX_INGESTION_NAMESPACE_PRIORITY.md`
- `WORKSPACES/COMMON/NONNEGOTIABLE_SYMBOL_MANAGEMENT.md`
- `WORKSPACES/COMMON/terminology/SYMBOL_REGISTRY.md`
- `WORKSPACES/COMMON/terminology/TOOLBOX_NAMESPACE_LEDGER.md`

A symbol string is not an identity. Every shared variable belongs to a namespace/object record even if a local equation omits the prefix typographically.

Initial namespace families:
`STD:`, `EXT:<FIELD>:`, `SAT-HIST:`, `HSH:`, `HAG:`, `SOLVER:<NAME>:`, `LOCAL:<TASK>:`.

A collision is a typed event, not an invitation to silently rename one side.

## Evidence lanes

Each claim/case emits separate statuses:

1. **SOURCE_TYPED** — exact source/claim identity recovered.
2. **SCHEMA_TYPED** — objects, variables, assumptions, domains and namespaces validate.
3. **DIMENSIONAL** — units/dimensions pass or failure is explained.
4. **EXACT_CONTROL** — known analytic/control cases reproduced.
5. **SYMBOLIC** — bounded CAS identity/derivation check with assumptions logged.
6. **FORMAL_PROOF** — proof assistant accepted an explicitly curated statement; existence of generated proof text is NOT acceptance.
7. **NUMERICAL** — numerical solver converges under declared tolerances.
8. **STRESS_LIMITS** — parameter sweeps, limiting cases, singular strata and counterexamples.
9. **REPRESENTATION** — coordinate/frame/projection/gauge sensitivity tested.
10. **INDEPENDENT_IMPL** — separately implemented lane agrees/disagrees on frozen contract.
11. **VISUAL_DIAGNOSTIC** — exact computational geometry rendered with projection/channel declaration.
12. **NATHAN_INTENT_CHECK** — Nathan confirms/rejects that the diagnostic depicts the intended object/behavior. This is representation/intent evidence, not mathematical proof.
13. **BIG_PICTURE** — explicit statement of what was established and what was not.
14. **FORGOT_CHECK** — unresolved assumptions/tests/questions enumerated after apparent success.

Allowed lane states:
`NOT_RUN | PASS | FAIL | INCONCLUSIVE | NOT_APPLICABLE | BLOCKED`.

## APPROVED reference tables

`APPROVED` is a project governance state, never an automatic synonym for `PASS`.

A reference row may become `APPROVED` only when:
- its required evidence lanes are declared in advance;
- every required lane is PASS or explicitly NOT_APPLICABLE with rationale;
- source + namespace identities are frozen;
- no unresolved FAIL is hidden;
- assumptions/tolerances/backend versions are recorded;
- the approving authority/review event is named.

Machine runs may emit `APPROVAL_CANDIDATE`; they may not self-promote to `APPROVED`.

## Formalism inventory / recommendation problem

Search all three project repositories for:
- named toolbox/toolkit containers;
- formalism-selection and notation documents;
- equations and equation roundups;
- historical Math Locking / proof / Lean / Z3 machinery;
- current solver/harness/lab code;
- external-source manifests.

For each formalism create:
- canonical external identity;
- project provenance;
- namespace;
- typed mathematical objects;
- applicability assumptions;
- candidate SAT/H(s)H job;
- reference backend/library;
- executable checks available;
- failure/degeneracy conditions;
- adoption state;
- recommendation: `PRIMARY | SECONDARY_CHECK | NICHE | DEFER | REJECT | HISTORICAL_ONLY`.

Do not choose the most sophisticated formalism. Choose the least-assumptive standard formalism that actually types the current job, then use orthogonal methods as checks.

## First architecture

```text
typed claim/case manifest
        |
        +--> namespace + dimension gate
        |
        +--> exact/symbolic lane ----> SymPy / exact arithmetic / Sage when needed
        |
        +--> formal lane ------------> Lean/mathlib; Z3 only for suitable decidable obligations
        |
        +--> numerical lane ---------> NumPy/SciPy; JAX for AD/sweeps; FEniCSx for typed PDE jobs
        |
        +--> geometry lane ----------> independent standard adapter + exact diagnostic render
        |
        +--> topology/algebra lane --> Sage/GAP/NetworkX/etc only when object type warrants
        |
        +--> comparison/stress lane -> limits, perturbations, blind controls, representation changes
        |
        v
evidence ledger + discrepancy packet + approval candidate table
```

Long jobs and short jobs must be independently schedulable. A multi-hour sweep must not prevent cheap schema/dimension/control checks from completing and reporting first.

## First implementation tranche

1. Add a safe Mersearch query wrapper with literal / phrase / prefix modes and aliases, rather than requiring callers to write SQLite FTS syntax.
2. Build the three-repository formalism inventory into a machine-readable manifest.
3. Define `math_audit_case.v1` and `math_audit_result.v1` schemas.
4. Implement namespace/dimension/control checks before expensive backends.
5. Reuse one current Three-Spheres/Class-P fixture as the first end-to-end geometry audit.
6. Produce exact JSON + Markdown + PNG/SVG diagnostic where geometry permits.
7. Ask Nathan for visual-intent confirmation only after the machine checks say the render is trustworthy enough to inspect.

## Search naming

**Mersearch** = umbrella platform/current user-facing name.
**Mercer_Searcher** = historical/internal stable core implementation identity.

## Immediate formalism families already recovered

Historical/current project surfaces include at least:
- SO(4) / 4D rotations;
- S3 / hyperspherical geometry;
- Clifford-torus embeddings;
- higher-dimensional Frenet/moving frames;
- framed curves / Cosserat-style variational mechanics;
- geometric constraint solving;
- knot/link invariants and ambient isotopy;
- modular/fusion structures;
- symplectic geometry;
- BV push-forward;
- AKSZ sigma models;
- Yamabe/Hessian/Hardy analytic machinery;
- spectral graph theory / graph curvature;
- cobordism/TQFT;
- discrete-gradient methods;
- ensemble/co-metric and medium-response constructions;
- Gross-Pitaevskii/Bose branches;
- holonomy/parallel transport;
- graph Laplacian/discretization;
- SAT/H(s)H native UI, Whirligig/Donut, Spheres, ᚼ and historical Math-Locking formalisms.

This is an inventory seed, not an adoption list.

## Next cursor

Implement the safe Mersearch partial-name/prefix wrapper and regression tests, then generate the first machine-readable formalism inventory from all three repos. In parallel, keep Grurple paper events preemptive.
