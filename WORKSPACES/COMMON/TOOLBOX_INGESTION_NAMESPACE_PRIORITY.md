# Toolbox Ingestion / Namespacification Priority

**Status:** ACTIVE / NATHAN-DIRECT PRIORITY  
**Effective:** 2026-09-21 21:10 EDT  
**Scope:** SAT/H(s)H mathematical-tool ingestion, namespace control, source recovery, solver integration, and use decisions  
**Relationship to active edge:** parallel supporting priority for the Hagalaz / geometric-solver-unification active edge; this does **not** suspend that work. It should increasingly feed it with cleanly identified mathematical objects.

## Nathan-direct instruction

Prioritize ingestion and namespacification of these historical toolbox surfaces, then make active decisions about use as soon as the ingestion system is operational. Imported mathematics must carry proper citations to the underlying sources, and citation should become normal project practice rather than a cleanup step.

Primary source surfaces:

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H TOOLKIT.txt`
   - current blob SHA observed 2026-09-21: `384b40a595d41daa4c573218022a0b802ad3deee`
2. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H HEAVY TOOLBOX.txt`
   - current blob SHA observed 2026-09-21: `aa021ed7839bc6417035e3bd09fcdc4ed1bd1bb3`
   - **current content is empty**; treat as a provenance/source-recovery target, not as ingested mathematics.
3. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/`
   - multi-file historical package, including `HsHtoolkit_manifest.csv`, `SAT26 MATH ROUNDUP.txt`, `SAT26 VETTING TEMPLATE.txt`, large build/transition/spheres corpora, and related recommendation/roundup material.

The SAT26 manifest records a large collection of source PDFs, including arXiv-numbered papers and named mathematical/technical sources. The manifest is a **source-discovery map**. It is not by itself a substitute for locating and citing the underlying source.

---

## 1. Governing distinction: ingestion is not adoption

Every imported object receives an explicit decision state:

`UNREVIEWED → CANDIDATE → {ADOPT | ADAPT | DEFER | REJECT | HISTORICAL-ONLY}`

Meanings:

- **UNREVIEWED** — encountered but not yet checked.
- **CANDIDATE** — source and mathematical identity sufficiently clear to evaluate.
- **ADOPT** — use the standard object substantially as defined in its source, with explicit project role.
- **ADAPT** — use a declared modification/translation; the source object and project adaptation remain separately named.
- **DEFER** — potentially useful but not currently needed or not yet sufficiently understood/sourced.
- **REJECT** — evaluated and not suitable for the stated job; preserve rationale.
- **HISTORICAL-ONLY** — relevant to SAT/H(s)H genealogy but not active mathematics.

No object becomes active merely because it appears in a toolbox, roundup, prior conversation, or polished synthesis.

---

## 2. Required ingestion record

Before an imported mathematical object becomes shared active machinery, record at minimum:

- `object_id`
- **source namespace**: e.g. `EXT:DIFFGEO`, `EXT:TOPOLOGY`, `EXT:SYMPLECTIC`, `EXT:NUMERICAL`, etc.
- canonical external name
- source notation exactly as used by the source when recoverable
- project aliases / historical SAT aliases
- object type: group / manifold / invariant / operator / functional / equation / algorithm / theorem / numerical method / etc.
- assumptions / domain / regularity requirements
- dimensions / units where applicable
- sign, orientation, angle, chirality, normalization, and index conventions where applicable
- symbol-collision result against `terminology/SYMBOL_REGISTRY.md`
- exact historical toolbox provenance: repo + path + blob/commit when known
- **underlying source citation**: author/title/year plus DOI/arXiv/stable source ID and specific section/equation/theorem/page when material
- source-verification status
- proposed SAT/H(s)H job
- exact project object(s) it would act on
- solver/module interface if any
- translation/adaptation required
- decision state
- decision rationale
- confidence / mathematical-verification state
- exposure/quarantine note when relevant
- next test or discriminator

If the underlying source has not yet been recovered, mark `SOURCE-UNRESOLVED`; do not manufacture a bibliography from memory.

---

## 3. Namespaces are semantic firebreaks

The project deliberately combines mathematics from many domains. Therefore a symbol, name, or equation may be identical in appearance while referring to different objects.

Use at least these namespace families unless a better specific namespace is justified:

- `STD:` — established standard-physics conventions
- `EXT:<FIELD>:` — mathematics or methods imported from an external field/source
- `SAT-HIST:` — historical SAT usage
- `HSH:` — current H(s)H usage
- `HAG:` — Hagalaz solver/unification machinery
- `SOLVER:<NAME>:` — solver-local quantities
- `LOCAL:<TASK>:` — deliberately local scratch/formalization notation

Namespace is part of identity even when omitted typographically in a local equation.

This policy is subordinate to and operationalizes `NONNEGOTIABLE_SYMBOL_MANAGEMENT.md`. All imported symbols must also enter or cross-check `terminology/SYMBOL_REGISTRY.md` when they become shared.

---

## 4. Two citations, two different claims

Imported mathematics usually needs **two different provenance links**:

1. **Project provenance citation** — why this object is under consideration here: toolbox / archive / conversation / Nathan directive.
2. **Underlying-source citation** — what the mathematical object actually is and what results about it are supported by the literature/source.

Do not use the historical toolbox as a substitute for the underlying mathematical citation.

Conversely, do not use the external mathematical paper as evidence that SAT/H(s)H's proposed interpretation or application is correct. That mapping is a separate project claim and needs its own derivation/test status.

See `CITATION_AS_DEFAULT_POLICY.md`.

---

## 5. Preserve the useful SAT26 vetting discipline

The historical `SAT26 VETTING TEMPLATE.txt` already contains durable warnings that should survive ingestion:

- polished/confident language is not evidence;
- identify the mathematical and geometric object each expression describes;
- do not canonize scaffolds because they are convenient;
- distinguish worldline/worldtube and the multiple historical meanings of `θ₄`;
- do not treat fitted anchors as zero-parameter derivations;
- do not call a result derived when the derivation is absent;
- preserve useful pieces even when the containing document is not current canon.

The new pipeline adds source identity, namespaces, collision control, explicit adoption states, and citation requirements to that older vetting logic.

---

## 6. First-tranche routing from `H(s)H TOOLKIT.txt`

The following is an **ingestion queue**, not an endorsement list.

### Direct Hagalaz / geometry interface candidates

- `EXT:LIE:SO4` — SO(4), 4D rotation structure
- `EXT:DIFFGEO:FRENET_R4` — higher-dimensional Frenet-frame / curvature invariants
- `EXT:CONSTRAINT:GEOMETRIC_SOLVERS` — geometric constraint-solver methods
- `EXT:GEOMETRY:S3` — 3-sphere / hyperspherical geometry
- `EXT:GEOMETRY:CLIFFORD_TORUS` — Clifford-torus constructions/embeddings
- `EXT:VARIATIONAL:FRAMED_CURVES` — variational mechanics of framed curves/rods

**Initial decision state:** `CANDIDATE` once a specific authoritative source is attached; otherwise `UNREVIEWED / SOURCE-UNRESOLVED`.

### Projection / reduction candidates

- `EXT:SYMPLECTIC:BASE`
- `EXT:BV:PUSHFORWARD`
- `EXT:AKSZ:1D_SIGMA`

**Initial decision state:** `DEFER/CANDIDATE` pending exact definition, source recovery, and a demonstrated need in current solver translation. The historical toolbox's claimed SAT/H(s)H role is not enough to adopt them.

### Topology / knot / discrete candidates

- ambient isotopy and link invariants
- Links–Gould polynomial machinery
- `Z_3` / modular or fusion structures
- spectral graph theory
- Ollivier–Ricci graph curvature
- cobordism/TQFT machinery

**Initial decision state:** generally `DEFER` until the active geometry actually requires the relevant invariant/structure. Historical uses such as lattice enforcement, particle labels, or `Z_SAT` do not transfer automatically into current H(s)H.

### PDE / regularization / numerical candidates

- Yamabe-type/deformed scalar-curvature machinery
- `σ_k` Hessian estimates
- fractional Hardy inequalities
- discrete-gradient-correction methods

**Initial decision state:** `DEFER` until a current equation/test exposes the exact analytical or numerical requirement they solve.

### Statistical/emergent candidates

- ensemble co-metric constructions
- medium-response kernels

**Initial decision state:** `DEFER/CANDIDATE`; compare explicitly against the current metric-induction and medium/worldtube formulations before use.

This first routing is intentionally conservative. A formalism earns active use by solving a current typed problem cleanly, not by sounding advanced.

---

## 7. Active-decision rule

Do not build a dead catalog.

Once an object reaches `CANDIDATE`, the next bounded operation should normally be one of:

- attach to a current solver interface and test;
- compare against an existing native construction;
- prove/verify a translation;
- identify an irreducible mismatch;
- defer with a concrete trigger for revival;
- reject with rationale.

For Hagalaz-facing objects, the preferred question is:

> What exact geometric quantity, transformation, admissibility condition, invariant, or solver operation does this object let us define or compare that we could not define cleanly before?

If there is no answer, it is not yet active machinery.

---

## 8. Immediate implementation targets

1. Maintain the actual object ledger in `WORKSPACES/COMMON/terminology/TOOLBOX_NAMESPACE_LEDGER.md`.
2. Resolve the manifest's abbreviated/arXiv/named sources to authoritative bibliographic records.
3. Feed discovered symbols/aliases into `SYMBOL_REGISTRY.md` before shared use.
4. Surface high-value Hagalaz-facing candidates to the active solver branch with exact source + namespace + decision state.
5. Keep missing `H(s)H HEAVY TOOLBOX.txt` content as a source-recovery item; do not silently replace it with another document.
6. Use `CITATION_AS_DEFAULT_POLICY.md` for conversations, reports, equations, handoffs, and durable artifacts.

## Next cursor

Complete a first source-verified tranche for `SO(4)`, higher-dimensional Frenet frames, and geometric constraint solving; then ask whether each materially improves the current Hagalaz transformation/solver interface. In parallel, resolve the identity/origin of the empty `H(s)H HEAVY TOOLBOX.txt` path.