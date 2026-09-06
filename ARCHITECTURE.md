# Repository Architecture

Status: active scaffold. This document governs archive organization, not theory content.

## Layers

| Layer | Intended role | Authority |
|---|---|---|
| `DEVELOPMENT_FULL_CONVOS/` | Immutable or minimally altered conversation/source record | Primary developmental evidence; not automatically current |
| `synthesis/` | Clean, source-linked H(s)H construction | Current statements must carry provenance and maturity |
| `ledgers/` | Equation, dependency, terminology, chronology, and claim-status records | Derived catalog layer |
| `audits/` | Dimensional, algebraic, numerical, source, and benchmark checks | Evaluation layer |
| `indexes/` | Generated structural inventories and scan state | Navigation only |
| `tools/` | Reproducible archive and validation utilities | Archive machinery |
| `staging/` | Incomplete or fragile assembled work | Noncanonical working area |

Only directories that are needed should be created. Empty architecture should
not be manufactured merely to resemble a finished project.

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

## Repository evolution

Architecture changes should be incremental and documented. Prefer stable paths,
small commits, deterministic tools, dry runs for consequential operations, and
machine-readable state. Broad moves, source deletion, and history rewriting require
an explicit decision from Nathan.

The structural indexer excludes its own generated outputs from the indexed tree,
preventing a refresh from presenting itself as a new source tranche.
