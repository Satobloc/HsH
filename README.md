# H(s)H — Hyper(super)Helical Worldtube Research Archive

This repository is the evolving, public-facing home for the H(s)H synthesis and
the conversational record from which it is being reconstructed. It is a theory-
building archive, not a finished theory and not a claim about inaccessible
reality-in-itself.

## Start here

1. Read [ARCHITECTURE.md](ARCHITECTURE.md) for the repository layers and status rules.
2. Use [the structural index](indexes/STRUCTURAL_INDEX.md) to see what is present.
3. Treat `DEVELOPMENT_FULL_CONVOS/` as primary developmental source material, not
   as automatically current or canonical theory.
4. Follow each synthesis claim back to its source, chronology, assumptions, and
   dependency status.
5. When an external source is needed, use the point-of-use
   [citation ledger](ledgers/CITATION_LEDGER.md); it links the HsH claim/location
   to the exact source-side record in private `Satobloc/HSH_RESOURCES`.
6. Use [the executable equation registry](formalization/README.md) for curated
   Python checks and generated Lean obligations.

## Current source relationship

- This repository is the clean destination for the developing H(s)H synthesis.
- The larger [SAT Theory Archive 2023–25](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25)
  remains the historical/developmental archive and mathematical quarry.
- The private `Satobloc/HSH_RESOURCES` repository holds raw papers and datasets;
  its `indexes/HUMAN_BIBLIOGRAPHY.md` is the source-side bibliography and citation-
  handoff surface, while `indexes/RESOURCE_INDEX.md` is structural evidence navigation.
- Root-level H(s)H material in the historical archive is a working basis to be
  reconciled with the conversational record here.

### Theorybuilding boundary

H(s)H is reconstructed forward from its own Fundamental Intuitions and internal
SAT → SAT-O → 4DHH → Blockwave/Satobloc → H(s)H development. External literature
is used for proper citation, standard definitions/results, empirical constraints,
prior-art comparison, and deliberately provenance-labeled imports. Related outside
theories do not silently become H(s)H's generative assumptions simply because they
have now been discovered.

When an outside source is actually used, keep two relationships separate:

- **internal provenance:** where the H(s)H statement came from in the SAT/H(s)H record;
- **external citation:** what standard result, empirical source, constraint, comparison,
  or prior art should be credited.

The citation handoff contract and status vocabulary live in
[`ledgers/CITATION_LEDGER.md`](ledgers/CITATION_LEDGER.md).

## Reading rule

Observe → Catalog → Contextualize → Evaluate.

Indexes describe what is present. They do not decide what is correct, current,
derived, or physically established.

## Current contents

- `DEVELOPMENT_FULL_CONVOS/` — exported conversations and associated source artifacts.
- `LIVE CONVOS/` — mutable/current conversation material; preserve its working character.
- `tools/` — deterministic, auditable archive utilities.
- `indexes/` — generated structural catalogs, conversation chronology, date manifests,
  and machine-readable scan state.
- `ledgers/` — derived equation/dependency/citation records and point-of-use cross-links.
- `formalization/` — source-linked equation records, schema, and workflow rules.
- `generated/equations/` — deterministic Python check logs and reports.
- `generated/lean/` — generated Lean modules whose compile status is explicit.
- `ARCHITECTURE.md` — repository roles, status vocabulary, and evolution policy.

## Automatic date and navigation maintenance

`.github/workflows/maintain-navigation.yml` maintains repo navigation after ordinary
pushes and can also be run manually.

The maintenance policy is intentionally asymmetric:

- `DEVELOPMENT_FULL_CONVOS/` is treated as stable developmental evidence. Parseable
  ChatGPT exports are collision-checked and date-prefixed in Eastern time using
  `tools/date_conversation_exports.py`.
- `LIVE CONVOS/` is mutable. Its dates are recorded in an audit manifest and chronology
  **without automatic filename renaming**, avoiding needless link churn while work is live.
- both conversation trees receive generated chronology/index coverage;
- the repository structural index is refreshed;
- generated manifests remain auditable when a collision or parse problem occurs;
- workflow-generated commits carry a loop guard.

Generated date manifests live under `indexes/manifests/`. These are navigation metadata,
not replacements for original conversation timestamps or source provenance.

### Manual date-tool use

The [conversation date utility](tools/date_conversation_exports.py) prefixes each
ChatGPT export with its first and last message dates in Eastern time. It accepts
JSON exports and JSON-formatted text exports, follows the active conversation
branch, and leaves unparseable prose files untouched.

Preview a deliberately chosen tree before manual use:

```bash
python tools/date_conversation_exports.py DEVELOPMENT_FULL_CONVOS
```

The tool is dry-run by default, emits an audit manifest, replaces only its own
existing prefix, and refuses filename collisions.

To browse parseable developmental exports in one date-sorted view while retaining
their source folders and provenance:

```bash
python tools/index_conversation_chronology.py DEVELOPMENT_FULL_CONVOS
```

This writes `indexes/CONVERSATION_CHRONOLOGY.md`, including exact duplicate groups
and a separate list of files without parseable conversation timestamps.

The source corpus will continue to grow. Structural indexes and chronology are
maintenance surfaces, not semantic theory indexes.
