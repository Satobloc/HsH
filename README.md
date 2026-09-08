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
5. Use [the executable equation registry](formalization/README.md) for curated
   Python checks and generated Lean obligations.

## Current source relationship

- This repository is the clean destination for the developing H(s)H synthesis.
- The larger [SAT Theory Archive 2023–25](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25)
  remains the historical/developmental archive and mathematical quarry.
- The private `Satobloc/HSH_RESOURCES` repository holds raw papers and datasets;
  its indexes are evidence navigation, not theory authority.
- Root-level H(s)H material in that archive is the current working basis to be
  reconciled with the conversational record here.

## Reading rule

Observe → Catalog → Contextualize → Evaluate.

Indexes describe what is present. They do not decide what is correct, current,
derived, or physically established.

## Current contents

- `DEVELOPMENT_FULL_CONVOS/` — exported conversations and associated source artifacts.
- `tools/` — deterministic, auditable archive utilities.
- `indexes/` — generated structural catalogs and machine-readable scan state.
- `formalization/` — source-linked equation records, schema, and workflow rules.
- `generated/equations/` — deterministic Python check logs and reports.
- `generated/lean/` — generated Lean modules whose compile status is explicit.
- `ARCHITECTURE.md` — repository roles, status vocabulary, and evolution policy.

## Date conversation exports

The [conversation date utility](tools/date_conversation_exports.py) prefixes each
ChatGPT export with its first and last message dates in Eastern time. It accepts
JSON exports and JSON-formatted text exports, follows the active conversation
branch, and leaves unparseable prose files untouched.

Preview the complete developmental-conversation tree:

```bash
python tools/date_conversation_exports.py DEVELOPMENT_FULL_CONVOS
```

Review `conversation-rename-manifest.json`, then apply the collision-checked plan:

```bash
python tools/date_conversation_exports.py DEVELOPMENT_FULL_CONVOS --apply
```

The tool is dry-run by default and replaces its own existing date prefix, so it
can be rerun after an export grows.

To browse every parseable export in one date-sorted view while retaining the
source folders and their provenance, regenerate the master chronology:

```bash
python tools/index_conversation_chronology.py DEVELOPMENT_FULL_CONVOS
```

This writes `indexes/CONVERSATION_CHRONOLOGY.md`, including exact duplicate
groups and a separate list of files that do not contain parseable conversation
timestamps.

The source corpus will continue to grow. Structural indexes should be refreshed
after new uploads and during periodic maintenance.
