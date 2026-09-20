# Mersearch Releases and Worker Quick Start

**Status:** ACTIVE  
**Canonical architecture:** `WORKSPACES/COMMON/MERSEARCH_RESEARCH_PLATFORM.md`  
**Stable worker release:** **Mersearch / Mercer_Searcher 1.0**  
**Stable ref:** `mersearch-stable-1.0`  
**Pinned commit:** `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`  
**Release basis:** last runtime-green synthetic acceptance state before experimental API/facet/result-mode development began.

## Release policy

Workers should use a **named stable Mersearch ref**, not assume repository `main` is production-safe.

- Stable branches/refs are immutable release baselines unless an explicitly documented emergency correction is required.
- New features develop separately and are promoted only after compile, deterministic acceptance, and appropriate real-corpus smoke tests.
- Each promotion receives version notes here before workers are told to adopt it.
- A newer version does not retroactively change the interpretation of older search results.
- Query/output changes that can alter research retrieval must be called out explicitly.
- `main` may contain development work and must not be treated as the worker release merely because it is newer.

## 1.0 — GREEN BASELINE

### Identity

- Tool self-name: `Mercer_Searcher_1.0`
- Stable branch: `mersearch-stable-1.0`
- Commit: `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`
- Core: `tools/search_archive_content.py`
- Acceptance fixture: `WORKSPACES/MERCER/test_mercer_searcher_1_0.py`
- Topic config example: `WORKSPACES/MERCER/search_topics_derivation_chain.json`

### Validated capabilities

The 1.0 acceptance contract covers:
- Boolean `AND`, `OR`, `NOT`;
- implicit AND;
- parentheses and precedence;
- quoted phrases;
- `NEAR` with configurable default window;
- inline `NEAR/n`;
- reported closest token distance;
- `author:`, `role:`, `title:`, `date:`, conversation/CID and lexical-status fields;
- explicit `body:`;
- `name:`, `path:`, `ext:`, `kind:/type:`, `has:`;
- shell-style filename/path globs including `*` and `?`;
- quoted Unicode fields;
- date range filters;
- deterministic sorting;
- default exclusion of `QUARANTINE` and `PRIOR_ART`;
- conservative `math:` notation normalization;
- JSON, JSONL, CSV and Markdown output;
- optional topic enrichment / co-occurrence graph.

The final synthetic acceptance run for this pinned state was green.

### Important 1.0 limits

1. **Do not call `math:` algebraic equivalence.** It normalizes notation only. It intentionally does not infer that `4*pi*B=3` is equivalent to `B=3/(4*pi)`.
2. **Do not infer supersession/currentness from chronology.** Search dates and lexical status signals are retrieval aids.
3. **Do not infer PDF→TXT ancestry from filenames.** `has:text-source` describes the indexed record, not a proven representation relationship.
4. **Do not assume duplicate exports are canonicalized.** Conversation-family/branch/snapshot relation work is not yet integrated into 1.0 search presentation.
5. **Do not treat `--limit` as a separately reported total-hit count.** Stable total/pagination/facet response work belongs to development after 1.0.
6. **Do not use 1.0 as a public unrestricted backend.** Public corpus allowlisting/API hardening is development work.
7. Search hits do not establish theory correctness, mathematical correctness, physical correctness, provenance authority or endorsement.

## Worker invocation

From a checkout of the stable ref:

```bash
git fetch origin
git switch mersearch-stable-1.0
python tools/search_archive_content.py . --expr 'author:user AND (holonomy NEAR/12 glitch)' --out /tmp/mersearch
```

Filename/inventory-style retrieval:

```bash
python tools/search_archive_content.py . --expr 'name:*26.txt OR name:26*.txt' --sort path --out /tmp/mersearch-files
```

Math-notation retrieval:

```bash
python tools/search_archive_content.py . --expr 'math:"B=3/(4*pi)"' --out /tmp/mersearch-math
```

Derivation-chain archaeology starter:

```bash
python tools/search_archive_content.py . \
  --expr '("star shaped" OR "star-shaped" OR "derivation star") AND (derivation OR map OR constants OR closure)' \
  --author user \
  --topic-config WORKSPACES/MERCER/search_topics_derivation_chain.json \
  --sort date \
  --out /tmp/mersearch-derivation
```

Workers should inspect the result provenance and representative raw hits before publishing a conceptual chronology.

## Outputs

Each run writes:
- `SEARCH_RESULTS.json`
- `SEARCH_RESULTS.jsonl`
- `SEARCH_RESULTS.csv`
- `SEARCH_RESULTS.md`

For reproducible research, preserve:
- query;
- stable Mersearch ref/version;
- searched repository/source commit(s);
- roots and exclusions;
- topic config, if any;
- output manifest;
- any subsequent human provenance review.

## Development line after 1.0

Current development on `main` includes/targets:
- file-vs-record result modes;
- facets;
- total results before truncation;
- stable machine/API response schema;
- backend/API adapter;
- research frontend;
- conversation-family relation annotations;
- mathematical expression extraction and structural/CAS search;
- source-representation graph;
- chronology/history mode;
- public allowlisted profile.

At the time this release note was created, the latest experimental machine-output patch on `main` had a syntax regression and was **not green**. This is exactly why the stable release is pinned separately. Do not adopt development changes until a later release note says they passed.

## Version-note template

For each promoted release record:
- version / stable ref / commit;
- date;
- validated test/run IDs;
- new query semantics;
- output-schema changes;
- corpus/profile changes;
- performance changes;
- fixed bugs;
- known limitations;
- compatibility/migration notes;
- whether old saved queries remain semantically identical.

## Current recommendation

**Research workers may begin using `mersearch-stable-1.0` now for archive discovery and provenance-bearing retrieval, within the limitations above.**

Use results as discovery evidence. For consequential historical, mathematical, currentness or supersession claims, follow through to the underlying sources and relevant provenance review.
