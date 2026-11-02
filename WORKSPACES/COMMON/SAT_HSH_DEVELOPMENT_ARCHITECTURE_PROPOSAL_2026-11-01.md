# SAT / H(s)H Development Architecture | repository roles and promotion model
**Date:** 2026-11-01  
**Status:** MANAGEMENT PROPOSAL / SOURCE-GROUNDED ARCHITECTURE / NOT THEORY AUTHORITY  
**Owner decision:** Nathan review required before this becomes an operative cross-repository control.

## Purpose

Define how the existing SAT/H(s)H repositories and workspaces relate, without flattening historical provenance, active research, mathematical verification, theory adoption, and physical validation into one notion of "official."

This document proposes a federated development architecture. It does not amend BEDROCK, change an equation's status, approve a theory claim, alter a worker remit, or promote any artifact.

## Executive model

The repositories form a connected research system with distinct jobs:

1. **Historical archive** — what was said, drawn, derived, tested, changed, or abandoned.
2. **Imported corpus and resources** — recovered copies, supporting material, external references and research inputs.
3. **Active HsH research programme** — where current reconstruction, construction, sandboxes, playgrounds and cross-sector investigations happen.
4. **Factory Floor** — a formal-verification intake, review, artifact and presentation pipeline, not the proof checker itself and not theory authority.
5. **Official H(s)H construction** — the human-authorized, versioned theory state controlled by BEDROCK and its linked construction/equation records.
6. **External scientific assessment** — independent physical verification, experimental work, specialist criticism and peer review.

These are not a simple one-way maturity ladder. Provenance can send a result back to research; failed proofs return to workshop; empirical contradiction can reopen a settled mathematical construction's physical interpretation. A mathematical result can be verified while never becoming an H(s)H construction element.

## Repository map

### A. `Satobloc/SAT_THEORY_ARCHIVE_2023-25` — Historical source authority

Role:
- original SAT documents, raw conversations, notebook material, equations, sketches, visuals, calculations, derivations, corrections and failed branches;
- historical chronology and provenance;
- primary evidence for what an earlier SAT construction actually said.

Rules:
- preserve original content and immutable identities;
- do not infer present theory authority from age, frequency, polish, or historical prominence;
- distinguish Nathan Direct from assistant/NLM-generated text and exported role labels;
- do not silently rewrite historical artifacts to match current H(s)H;
- treat the archive as an active quarry for source recovery, not a discarded attic.

### B. `Satobloc/HSH_RESOURCES` — Supporting resource corpus

Role:
- mathematical and scientific references, external literature, supporting source data, tools, and resources used by the research programme.

Rules:
- a reference can constrain or compare H(s)H without becoming endogenous H(s)H authority;
- preserve license, visibility, provenance and privacy boundaries at file level;
- repository-level public visibility is not blanket permission to republish sensitive or restricted content;
- distinguish external established results from H(s)H interpretation.

### C. `Satobloc/HsH` — Main research and theory workspace

Role:
- imported historical SAT material;
- BEDROCK and current theory-state controls;
- active research workspaces and work logs;
- sandbox studies and dedicated playgrounds;
- source recovery, calculations, simulations, solvers, figures, paper drafts and cross-sector construction;
- current construction line including finite-core worldtube work.

Internal distinctions that must remain visible:
- `DEVELOPMENT_FULL_CONVOS` / imported corpus: preserved source material, not automatically current;
- `WORKSPACES`: active research lanes and worker outputs, with provenance and status;
- `SANDBOX` / sandbox packets: bounded investigations whose conclusions remain conditional until reviewed;
- `PLAYGROUNDS`: explicitly permissive exploratory spaces for conjectures, alternative constructions, speculative mathematics and numerical experimentation, subject to the current BEDROCK permissions;
- `BEDROCK.md`: controlling premise/authority surface;
- `STATE_OF_THE_THEORY.md`: subordinate current-state map, not independent theory authority;
- issue/PR/CI/formal-verification material: proposal, review and execution records, not automatic theory adoption.

Important: "the entire research programme" is a reasonable operational description of HsH's role, but not every object inside HsH has the same status. The active research programme is distributed across workspaces and instruments, while authority remains stratified.

### D. `Satobloc/FACTORY_FLOOR` — Verification intake, workshop and circulation pipeline

Current repository state at inspection:
- default branch `main`;
- root contains `README.md` and `FLOORROOM_TODO.md`;
- README calls itself a formal-verification intake desk, not a completed scientific showroom;
- current six EQ entries are intake records with bounded theorem scopes and CI receipts;
- Factory Floor directs the workflow:
  `NEEDS + FIXES -> GLASS+HSH -> WORKSHOP -> LIVE -> ARTIFACTS -> WEBSITE -> NATHAN`.

Role:
- receive equation packets with exact source identity;
- check that the formal statement, hypotheses, proof code, toolchain and CI run are identified;
- route exact theorem/source review through WORKSHOP;
- maintain item state and dependencies;
- distinguish CI success, proof-scope review, mathematical clearance, artifact readiness and public presentation;
- route human decisions to Nathan.

Factory Floor is **not**:
- the Lean theorem prover itself;
- an independent source of mathematical truth;
- a theory premise authority;
- an automatic H(s)H candidacy machine;
- an experimental validation system.

Formal proof execution may occur in HsH's Lean project/CI or another explicitly identified Lean environment; Factory Floor records and orchestrates the evidence.

### E. Official H(s)H construction — controlled theory state inside HsH

The official construction is not a separate repository merely because an equation has been proved. Its authority is controlled by:
- BEDROCK and newer verified Nathan Direct;
- explicit theory definitions, versions and dependencies;
- source-to-construction mapping;
- reviewed mathematical results;
- cross-sector explanatory/constraining power;
- Nathan's explicit construction/adoption decision.

`STATE_OF_THE_THEORY.md` describes the SAT -> H(s)H ancestry and current finite-core/worldtube construction phase, while explicitly remaining subordinate to BEDROCK. Current Kerr and Kelvin lines are live hypotheses/construction work, not proven physics.

No new "official theory" repository should be created by default. First strengthen the current HsH authority and equation/dependency records. If a separate construction repository is later judged necessary, it should be a versioned output of the existing authority surfaces, not a competing authority.

## Item identity and status contract

Every substantial equation, claim, construction, algorithm or dataset should have a durable identity independent of its folder or publication stage.

Minimum fields:

- `item_id`: stable identifier, e.g. `EQ-UI-0001`;
- `title`;
- `object_type`: equation / theorem / construction / claim / dataset / code / figure / paper;
- `origin_type`: Nathan Direct / historical author / assistant / external source / mixed / unresolved;
- `source_refs`: repository, path, commit SHA, blob SHA, exact conversation/message locator where available;
- `source_status`: primary / copy / duplicate / generated synthesis / external / unresolved;
- `theory_status`: historical / imported / active / sandbox / playground / quarantined / superseded / official-construction;
- `workflow_status`: located / source-recovered / typed / in-research / awaiting-review / formalized / CI-passed / workshop-cleared / awaiting-Nathan / incorporated / rejected / blocked;
- `math_status`: not-run / partial / symbolic-checked / numerically checked / Lean-checked / workshop-cleared / failed / unresolved;
- `physical_status`: not-applicable / no-prediction / data-needed / blocked / comparison-ready / tested / supported / contradicted / inconclusive;
- `visibility`: private / internal / public-candidate / public;
- `dependencies`, `related_items`, `supersedes`, `superseded_by`;
- `artifact_refs`: code, Lean module, logs, generated data, figure, manuscript;
- `decision_record`: reviewer, date, exact decision and authority;
- `updated_at`.

Do not compress independent dimensions into a single green/yellow/red status. Example: `theory_status=sandbox`, `math_status=Lean-checked`, `physical_status=no-prediction` is coherent and often desirable.

## Promotion and return gates

### Gate 0 — Source identity and provenance
Required:
- locate earliest available primary source and exact surrounding context;
- distinguish Nathan Direct from assistant-generated formulations;
- identify copies, duplicates, later corrections and supersessions;
- retain original notation and exact source identities.

Failure routes to `SOURCE_RECOVERY_BLOCKED` or `PROVENANCE_UNRESOLVED`, not invented reconstruction.

### Gate 1 — Research / sandbox
Allowed:
- competing hypotheses, conjectures, alternative formulations;
- source-grounded algebraic reconstruction;
- geometric and numerical exploration where permitted;
- counterexamples, negative results, failed branches;
- candidate cross-sector maps.

Every sandbox must state its assumptions, status, source base, what was actually executed, what remains unresolved, and what would discriminate alternatives.

Current BEDROCK ND-2026-10-25-01 applies: real measured systems and genuine observations are the default for calculations. Any calculation using no real-world data requires Nathan's explicit prior permission, including pure geometry and numerical fixtures. The playground designation does not waive this rule.

### Gate 2 — Formalization and Factory Floor intake
Required:
- exact theorem statement, variables, types, hypotheses and domain;
- source-to-formalization map;
- Lean code and pinned toolchain;
- CI workflow/run/job identifiers and successful result;
- proof source inspection for `sorry`, `admit`, custom axioms and theorem dependencies;
- explicit scope statement: what the proof proves and does not prove.

A passing CI job confirms only that the submitted Lean project compiled under the recorded environment, subject to the workflow's actual steps. It does not alone establish proof-body adequacy, source fidelity, physical meaning, or correctness of assumptions.

### Gate 3 — Workshop mathematical clearance
Independent review of:
- source fidelity;
- algebra and derivation;
- dimensional consistency;
- signs, limits, regularity and boundary conditions;
- geometry and topology;
- hypotheses and hidden assumptions;
- proof completeness and reproducibility;
- exact scope and missing lemmas.

Outcome: `MATHEMATICALLY CLEARED; ELIGIBLE FOR CANDIDACY CONSIDERATION ONLY`, or a precise failure/unresolved classification.

### Gate 4 — H(s)H construction candidacy and incorporation
A mathematically cleared theorem is not automatically an H(s)H candidate. It must have an explicitly audited connection to the operative construction and explanatory or constraining power across multiple sectors of the same coupled system. Sector names, shared constraints, propagation of revisions and failure-rigid consequences must be shown.

Only after this additional test and Nathan's explicit decision can an item be incorporated into the official H(s)H construction. Record version, definition, dependencies, decision and descendants.

### Gate 5 — Physical verification
Separate from all previous gates:
- real-system identity and source provenance;
- measured input values, units and uncertainties;
- independently derived predictions, separated from fits and calibration;
- uncertainty propagation;
- competing explanations and accepted-physics comparisons;
- held-out tests and fail-rigid inter-sector propagation;
- external reproducibility and expert scrutiny.

Neither mathematical clearance nor construction incorporation is physical verification.

### Return loops
- source discrepancy -> Gate 0;
- algebra/proof counterexample -> Gate 1;
- CI failure -> formalization workshop;
- empirical contradiction -> reopen construction assumptions and dependent sectors;
- revised source -> supersession record and re-run every dependent proof/calculation;
- no silent overwrites.

## Recommended operating map

| Layer | Canonical home | Primary output | Authority |
|---|---|---|---|
| Historical SAT | SAT_THEORY_ARCHIVE_2023-25 | immutable source and chronology | provenance |
| Reference corpus | HSH_RESOURCES | sourced scientific/mathematical inputs | external source authority |
| Active H(s)H research | HsH workspaces | source-grounded reconstructions, sandbox results and construction proposals | research, noncanonical by default |
| Exploratory playgrounds | HsH/PLAYGROUNDS and designated sandbox folders | hypotheses, tests, alternatives and counterexamples | explicitly exploratory |
| Formal proof project | HsH Lean project/CI, as currently routed | executable Lean proofs and logs | formal execution evidence |
| Factory Floor | FACTORY_FLOOR | intake, workshop review, state tracking, artifact/presentation workflow | process and circulation |
| Official construction | HsH BEDROCK + versioned construction/equation records | adopted theory definitions and dependencies | Nathan-authorized theory status |
| Physical assessment | sourced test and external review records | observations, predictions, uncertainties and replication | empirical evidence |

## Immediate implementation priorities

1. **Do not create another master registry in isolation.** Reconcile and extend Factory Floor FF-001/FF-002 because its own TODO already defines the needed task graph and state contract.
2. Add distinct fields for theory, workflow, math, physical and presentation status; don't use a single `status`.
3. Add the `PLAYGROUND` class explicitly, distinct from ordinary sandbox workspaces and from mathematically cleared intake.
4. Give every equation a stable identity and source-to-Lean-to-H(s)H dependency chain.
5. Link Factory Floor entries to HsH issue/PR/CI references and exact source blobs.
6. Require workshop review before declaring mathematical clearance; CI success alone is not enough.
7. Require explicit Nathan decision and multi-sector connection before official construction incorporation.
8. Make the HsH BEDROCK/STATE relationship the single theory-authority front door; do not create a competing canonical home.
9. Preserve the current Mersearch/shared-slot ownership and all repository/workspace boundaries.
10. Add a compact reader-facing map only after the backend contract is stable.

## Live source identities inspected for this proposal

- `Satobloc/HsH/BEDROCK.md` — blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`.
- `Satobloc/HsH/STATE_OF_THE_THEORY.md` — blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- `Satobloc/HsH/WORKSPACES/COMMON/PHASE_STEERING_2026-10-26.md` — blob `177576d6efb25024255b0f94c6a68dea38fdeff7`.
- `Satobloc/FACTORY_FLOOR/README.md` — blob `147089007171479e8930eab1d63254947bacdab4`.
- `Satobloc/FACTORY_FLOOR/FLOORROOM_TODO.md` — blob `fc4a7513f7178d0f29f8da1633c18ee74e7c4804`.
- `Satobloc/HsH/PUBLIC_SITE/READER_ROUTING_REGISTRY.md` — blob `277a94c553e2e17b61bb046a04781b4e44f2229f`.

**Not inspected in this pass:** every sandbox/playground file, all Lean modules and full histories, every HSH_RESOURCES file/visibility boundary, all open branches/PRs, and the complete HsH construction records. The map is therefore a bounded architecture proposal, not a comprehensive inventory or claim that every item is already routed correctly.

**Authorship:** assistant-authored proposal. Not Nathan Direct, not BEDROCK, and not an operative change until reviewed and explicitly accepted by Nathan.
