# SAT/H(s)H Terminology Programme

## Immediate pipeline

The first operation is lexical harvesting from the project's own curated explanatory/historical sources, not manual invention of tags.

`timeline/history -> glossary/lexicon -> SAT↔standard maps -> full/core theory -> big paper -> roundup/summary/synthesis -> frequency/provenance table -> common-English/document-noise suppression -> manual curation -> conversation autotagger`

Run:

```bash
python WORKSPACES/COMMON/scripts/harvest_priority_vocabulary.py \
  --hsh-root . \
  --archive-root ../SAT_THEORY_ARCHIVE_2023-25 \
  --manifest WORKSPACES/COMMON/terminology/SOURCE_MANIFEST.json \
  --curation WORKSPACES/COMMON/terminology/VOCABULARY_CURATION.json \
  --output indexes/terminology
```

The harvester emits source inventory, frequency/provenance-ranked candidates, a manual-review table, and JSON. Candidate terms do **not** enter the tagging machinery until explicitly accepted in the curation layer. This keeps high recall in extraction but prevents common-English or incidental language from becoming a tag ontology.

Frequency is not treated as importance. Source-class weight, document frequency, phrase specificity, capitalization/symbol morphology and provenance are retained so rare but historically important named constructions can be manually promoted.

## Output contract

`indexes/terminology/source_inventory.tsv` — every priority source discovered and whether it was actually readable/extracted.

`indexes/terminology/priority_vocabulary_candidates.tsv` — frequency-ranked unigram and 2–5 word candidates with document frequency, weighted score and top source provenance.

`indexes/terminology/manual_review.tsv` — curation queue.

`indexes/terminology/priority_vocabulary_curated.json` — only accepted vocabulary; this is the intended input to conversation tagging.

`indexes/terminology/priority_vocabulary_all.json` — full audit data.

## SAT ↔ standard terminology graph

The translation system should not flatten rough equivalence into identity. It is a graph whose nodes are terms and dated definitions and whose edges carry typed relationships plus evidence.

### Term node

- stable `term_id`
- namespace: `SAT`, `STANDARD`, or where justified `SHARED`
- preferred label
- aliases/spellings
- theory/version era
- current vs historical status
- earliest-currently-surfaced provenance

### Definition node

Definitions are versioned separately from terms because the same label can change meaning.

- stable `definition_id`
- `term_id`
- definition text
- source and exact provenance
- author/source authority
- date/version
- `CURRENT`, `HISTORICAL`, `EXPLORATORY`, etc.

### Relationship edges

At minimum:

- `SYNONYM_OF`
- `NEAR_SYNONYM_OF`
- `STRUCTURALLY_OVERLAPS`
- `MAPS_TO`
- `BROADER_THAN`
- `NARROWER_THAN`
- `HISTORICAL_NAME_FOR`
- `RENAMED_AS`
- `DEFINED_USING`
- `CLARIFIES`
- `CORRECTS`
- `SUPERSEDES`

Every crosswalk edge records provenance and an evidence class such as `NATHAN-EXPLICIT`, `SAT-SOURCE-EXPLICIT`, `STANDARD-SOURCE-EXPLICIT`, or `ANALYST-PROPOSED`. Analyst-proposed mappings remain visibly proposals until accepted.

## Side-by-side evaluation view

The eventual viewer should show one concept as:

| SAT/H(s)H | Relationship / differences | Standard physics/math |
|---|---|---|
| preferred/current term | typed relation(s), qualification and distinctions | standard term |
| current definition | explicit comparison notes | authoritative standard definition |
| historical definitions expandable | provenance/evidence | alternate standard definitions if materially different |
| earliest surfaced occurrence | version/era | source authority |

Terms occurring inside either definition should be links through `DEFINED_USING`. Following one should preserve the two-column context: if a SAT definition invokes another SAT term, its standard counterpart (when any) remains visible; if a standard definition invokes another standard term, the SAT counterpart remains visible. Multiple candidate standard counterparts are allowed.

## Standard-definition source hierarchy

Prefer authoritative or field-standard sources over generic web dictionaries. Exact source selection depends on domain, but the working hierarchy is:

1. standards/nomenclature bodies and primary reference organizations where applicable;
2. authoritative field references/databases;
3. established graduate/advanced reference texts or encyclopedic mathematical references;
4. secondary dictionaries only when stronger sources do not define the term.

Do not copy a definition merely to create symmetry. A missing equivalent is meaningful and should render as `NO ESTABLISHED EQUIVALENT` or `NO MAPPING YET`, not be forced.

## Historical rule

Current definition appears first, but old meanings remain attached to the term and theory era. Conversation archaeology can move an `EARLIEST-CURRENTLY-SURFACED` date backward; it never silently erases the previously recorded historical anchor.
