# Repository Architecture

Status: active scaffold. This document governs archive organization, not theory content.

## Layers

| Layer | Intended role | Authority |
|---|---|---|
| `DEVELOPMENT_FULL_CONVOS/` | Immutable or minimally altered conversation/source record | Primary developmental evidence; not automatically current |
| `synthesis/` | Clean, source-linked H(s)H construction | Current statements must carry provenance and maturity |
| `ledgers/` | Equation, dependency, terminology, chronology, and claim-status records | Derived catalog layer |
| `audits/` | Dimensional, algebraic, numerical, source, and benchmark checks | Evaluation layer |
| `formalization/` | Curated machine-readable equations, assumptions, units, dependencies, and Lean obligations | Formalization input; never raw-source authority |
| `generated/equations/` | Deterministic check logs and reports | Generated evaluation output |
| `generated/lean/` | Lean theorem modules emitted from curated records | Formal obligations; accepted only after an actual Lean run |
| `indexes/` | Generated structural inventories and scan state | Navigation only |
| `tools/` | Reproducible archive and validation utilities | Archive machinery |
| `WORKSPACES/` | Agent/user working rooms and cross-agent coordination | Working layer; never source or synthesis authority by itself |
| `staging/` | Incomplete or fragile assembled work | Noncanonical working area |

External evidence lives in the private `Satobloc/HSH_RESOURCES` repository.
Raw papers and datasets remain separate from conversation sources and from this
public synthesis. Any imported result must cite an exact resource record and keep
standard-source support distinct from H(s)H interpretation.

## Public cross-link boundary

There are two public project-record repositories and one private reference repository, and they must not be treated symmetrically.

- `Satobloc/HsH` and `Satobloc/SAT_THEORY_ARCHIVE_2023-25` **should cross-link bidirectionally** when a current construction, historical source, conversation, derivation, timeline entry, or provenance record has a useful counterpart in the other public repository.
- `Satobloc/HSH_RESOURCES` is a **private reference warehouse**, not a public navigation target. Public HsH/archive documents must not depend on links into HSH_RESOURCES as their evidence surface.
- When material found through HSH_RESOURCES is used publicly, carry the information across the boundary in a public-usable form: normally a **Chicago-style citation to the original external source**, an accurately attributed **quotation/extract with page or location information**, or a clearly identified **summary/paraphrase with source citation/provenance**. Raw/private project data should be represented by an appropriate public-safe extract or summary with enough provenance to understand what was analyzed.
- Internal citation ledgers and private research work may retain the exact HSH_RESOURCES path/content hash needed to recover the source, but that private locator is not a substitute for the public citation.

In short: **cross-link HsH ↔ historical archive; cite or extract from HSH_RESOURCES.**

Only directories that are needed should be created. Empty architecture should
not be manufactured merely to resemble a finished project.

## Workspaces and coordination

`WORKSPACES/` is the working layer for focused agents, experiments, reconstruction passes, and temporary research programs. It exists so substantial work can develop without prematurely becoming synthesis or polluting source directories.

- Each sustained workspace should state its scope, current state, source inputs, and handoff destination.
- Workspaces may disagree, branch, or contain unfinished reasoning. Their contents do not acquire theory authority merely by being in the repository.
- Cross-agent information sharing belongs in `WORKSPACES/COMMON/`. Use it for short handoffs, active coordination, blockers, shared questions, and pointers to work in progress.
- Durable results must be promoted out of the common area to the proper destination: source/provenance records, ledgers, audits, synthesis, formalization, indexes, or timeline documents.
- Do not duplicate large source material into workspaces. Link to public project sources; for private HSH_RESOURCES material, use a bibliographic identifier/citation handoff and a public-safe summary rather than making the public workspace depend on a private link.
- The historical archive's `.[⚙️_AI_FILES]/SHARED_RESOURCES/` remains the archive-side shared-resource area; `HsH/WORKSPACES/COMMON/` is the current-build coordination area.

See `WORKSPACES/README.md` and `WORKSPACES/COMMON/README.md` for the lightweight operating convention.

## Theory-object hierarchy

The current reconstruction keeps these levels distinct:

1. empirical Minkowski elements;
2. modeled higher-dimensional history;
3. finite-core filament/worldtube as the modeled geometric object;
4. H(s)H as a parametrization or representation of that history;
5. a resolving/readout map;
6. locally observed structures;
7. analytical and solver tools such as the Universal Indicatrix, Donut,
   Whirligig, Scrollsaw, plots, and simulations.

## Status vocabulary

Every substantive synthesis entry should record provenance and maturity separately.

- Provenance: `OBS`, `STD`, `SAT`, `SRC`, `GEN`.
- Maturity: `FROZEN`, `DERIVED`, `ACTIVE`, `CANDIDATE`, `HISTORICAL`,
  `QUARANTINED`, `REJECTED`, `OPEN`.

Polished prose, filename labels, repetition, and numerical resemblance do not
raise an item's status.

## Source handling

- Preserve the original conversational record.
- Prefer additive catalogs and corrected synthesis over destructive source edits.
- Record full, partial, sampled, index-only, and inaccessible coverage explicitly.
- Preserve contradictions and superseded forms with chronology.
- Do not silently merge distinct meanings of symbols such as archive `theta4` or `Q`.
- Treat generated indexes as maps, never as evidence for a theory claim.
- Keep equation provenance/maturity separate from Python and Lean check status.
- Never infer Lean acceptance from file existence, successful generation, or a
  content hash; record `PASS`, `FAIL`, or `NOT_RUN` from the executable itself.

## Repository evolution

Architecture changes should be incremental and documented. Prefer stable paths,
small commits, deterministic tools, dry runs for consequential operations, and
machine-readable state. Broad moves, source deletion, and history rewriting require
an explicit decision from Nathan.

The structural indexer excludes its own generated outputs from the indexed tree,
preventing a refresh from presenting itself as a new source tranche.
