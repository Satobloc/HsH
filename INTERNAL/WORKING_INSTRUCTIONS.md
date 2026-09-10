# H(s)H internal working instructions

This page holds contributor/LLM-facing workflow material that should not dominate the public front page.

## Current work

The immediate problem is to turn the comparatively mature **worldline skeleton** into a mathematically controlled **finite-core worldtube model** without laundering later-discovered outside machinery into the theory's premises.

Working order:

**geometry → admissible relations → finite-core object → interaction/deformation → projection/readout → mathematical representation → comparison with known physics**

The project distinguishes representation, derivation, calibration, prediction, and prior-art comparison. A visually suggestive correspondence is not by itself a derivation or empirical result.

## Internal navigation

1. Read [../ARCHITECTURE.md](../ARCHITECTURE.md) for repository layers and status rules.
2. Use [../indexes/STRUCTURAL_INDEX.md](../indexes/STRUCTURAL_INDEX.md) to see what is present.
3. Use [../formalization/README.md](../formalization/README.md) for curated Python checks and generated Lean obligations.
4. Treat `DEVELOPMENT_FULL_CONVOS/` as primary developmental source material, not as automatically current or canonical theory.
5. Use the point-of-use [../ledgers/CITATION_LEDGER.md](../ledgers/CITATION_LEDGER.md) when an outside source is required.
6. For the public visual vocabulary, start in [../SAT_VISUALS/VISUALS_1](../SAT_VISUALS/VISUALS_1/).

## Source relationship and prior-art boundary

- **HsH** is the clean destination for the developing H(s)H synthesis.
- The larger [SAT Theory Archive 2023–25](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25) remains the historical/developmental archive and mathematical quarry.
- `HSH_RESOURCES` is the source-side research library for papers, datasets, prior art, and external comparison.
- H(s)H is reconstructed forward from its own SAT → SAT-O → 4DHH → Blockwave/Satobloc → H(s)H development.
- External literature is used for citation, standard definitions/results, empirical constraints, prior-art comparison, and explicitly provenance-labeled imports. It does not silently become H(s)H's generative basis.

When an outside source is used, keep two relationships separate:

**internal provenance** — where the H(s)H statement came from in the SAT/H(s)H record;

**external citation** — what standard result, empirical source, constraint, comparison, or prior art should be credited.

## Reading rule

**Observe → Catalog → Contextualize → Evaluate.**

Indexes describe what is present. They do not decide what is correct, current, derived, or physically established.

## Repository maintenance

Current working surfaces include:

- `DEVELOPMENT_FULL_CONVOS/` — exported conversations and associated source artifacts.
- `LIVE CONVOS/` — mutable/current conversation material; preserve its working character.
- `SAT_VISUALS/` — curated public-facing and working visual material.
- `tools/` — deterministic, auditable archive utilities.
- `indexes/` — generated structural catalogs, conversation chronology, date manifests, and machine-readable scan state.
- `ledgers/` — derived equation/dependency/citation records and point-of-use cross-links.
- `formalization/` — source-linked equation records, schema, and workflow rules.
- `generated/equations/` — deterministic Python check logs and reports.
- `generated/lean/` — generated Lean modules whose compile status is explicit.

`.github/workflows/maintain-navigation.yml` maintains repo navigation after ordinary pushes and can also be run manually.

The maintenance policy is intentionally asymmetric:

- `DEVELOPMENT_FULL_CONVOS/` is treated as stable developmental evidence. Parseable ChatGPT exports are collision-checked and date-prefixed in Eastern time using `tools/date_conversation_exports.py`.
- `LIVE CONVOS/` is mutable. Its dates are recorded in an audit manifest and chronology **without automatic filename renaming**.
- both conversation trees receive generated chronology/index coverage;
- the repository structural index is refreshed;
- generated manifests remain auditable when a collision or parse problem occurs;
- workflow-generated commits carry a loop guard.

Generated date manifests live under `indexes/manifests/`. These are navigation metadata, not replacements for original conversation timestamps or source provenance.
