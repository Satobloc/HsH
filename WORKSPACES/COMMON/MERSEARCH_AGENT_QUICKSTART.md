# Mersearch | LLM Research Worker Quickstart

**Status:** Candidate development on branch `mersearch-chronology-20261007`. Stable release remains `mersearch-stable-1.0`. Never call untested development code a stable release.

## First step for every assistant

Run `python tools/search_archive_content.py --capabilities` to discover search operations, query fields, limitations, examples, and companion tools. Or use `--help` / `--examples`. Do not assume an assistant knows what is available.

**Three-archive default:** SAT_THEORY_ARCHIVE_2023-25, HsH, and HSH_RESOURCES. The candidate CLI finds adjacent repository checkouts automatically. Run `--coverage` first. Missing roots must be reported as **PARTIAL CORPUS**. A directory being present does not guarantee every source file was parsed; check all exclusions and oversized-file counts.

There is ONE search language and engine. Ordinary text, historical/version search, conservative mathematical matching and M4 evidence-graph generation share the same search CLI. The M5a glossary candidate extractor produces a separate provenance sidecar until reviewed terminology expansion is integrated.

## Tool directory

| Tool | Purpose |
| --- | --- |
| `tools/search_archive_content.py` | CLI: Boolean, NEAR, filename/path, math, chronology, export |
| `tools/mersearch_chronology.py` | Date/version evidence enrichment for the same search |
| `tools/mersearch_math.py` | Conservative symbolic parser: bounded `equiv:`, `contains:`, `value:` matching, with proof/evidence classes |
| `tools/mersearch_math_genealogy.py` | M4 typed equation recurrence graph: source mirrors, polynomial families, direct dates, non-transitive near-number links |
| `tools/mersearch_glossary_candidates.py` | M5a: extract provenance-linked historical glossary definitions and *proposed* standard-physics crosswalks (not yet automatic search expansion) |
| `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` | Connector-only request (unique ID; inspect before overwriting) |
| `.github/workflows/mersearch-request-bridge.yml` | GitHub execution bridge; stable engine until chronology promotion |
| `CONVERSATION_VIEWER/` | Navigate conversation sources; not yet guaranteed to share complete CLI semantics |
| `WORKSPACES/COMMON/MERSEARCH_RELEASES.md` | Version identity, stable commit, known limits |
| `WORKSPACES/MERCER/test_mercer_searcher_1_0.py` | Legacy semantic regression |
| `WORKSPACES/MERCER/test_mersearch_chronology_20261007.py` | Chronology/multi-archive regression |

## Copy-ready queries

~~~bash
python tools/search_archive_content.py --capabilities
python tools/search_archive_content.py --coverage
python tools/search_archive_content.py --expr '"0.24"' --result-mode files --sort origin
python tools/search_archive_content.py --expr '("refractive index" NEAR/12 "phase shift")'
python tools/search_archive_content.py --expr 'era:early-2025 AND "phase shift"' --sort origin
python tools/search_archive_content.py --expr 'version:sat-mark-v AND "phase shift"'
python tools/search_archive_content.py --expr 'repo:Satobloc/HsH AND math:"B=3/(4*pi)"'
python tools/search_archive_content.py --expr 'equiv:"B=3/(4*pi)"' --sort origin
python tools/search_archive_content.py --expr 'contains:"3/(4*pi)"'
python tools/search_archive_content.py --expr 'value:"B=0.2387;atol=0.003"'
python tools/search_archive_content.py --genealogy-only --out /tmp/mersearch-equation-genealogy
python tools/mersearch_glossary_candidates.py --archives-home /archive --out /tmp/mersearch-glossary-candidates.json
python tools/search_archive_content.py --expr 'name:*2025*.txt OR path:*LAB*' --result-mode files
~~~

When checkouts are not adjacent, pass explicit roots:

~~~bash
python tools/search_archive_content.py /archive/SAT_THEORY_ARCHIVE_2023-25 /archive/HsH /archive/HSH_RESOURCES --expr '"0.24"'
~~~

Boolean operators: `AND`, `OR`, `NOT`, parentheses, implicit AND, quoted phrases, and `NEAR/n`. Source fields: `body:`, `math:`, `name:`, `path:`, `ext:`, `kind:`, `has:`, `author:`, `role:`, `title:`, `conversation:`, `date:`, `status:`. Chronology development fields: `era:`, `version:`, `archive_date:`, `origin:`, `date_mentioned:`, `date_confidence:`, `document_type:`, `retrospective:`, `repo:`.

`--limit N` and `--offset N` support pagination. `--result-mode files` collapses matches by source path. Inspect `SEARCH_RESULTS.json` for total hits BEFORE paging, archives searched, missing roots, exclusions, confidence, and per-hit source links. `--max-bytes 0` removes the size limit but risks heavy memory consumption on large JSONs.

## Provenance is mandatory

- `date:` refers to direct record timestamps when present. Text dates (`date_mentioned:`) do not establish composition.
- `archive_date:` is a folder/file-date clue, not necessarily an original conversation date.
- `origin:` and `era:` are cautious estimates from direct-message timestamps or broad historical version windows.
- `captured_at` on NotebookLM is the extraction/snapshot date, NOT the original discussion date.
- Version mentions in compilations and retrospectives do not automatically date quoted passages. Bare `SAT` alone carries little dating value.
- Historical reports must distinguish earliest attested, earliest estimated, and earliest archived occurrences.
- `math:` performs notation normalization only. In **candidate math M1–M3**, `equiv:` proves only a narrowly defined polynomial equality (same variables, exact equals), `contains:` checks AST subexpressions, and `value:` returns a numerical proximity with recorded tolerance. Do **not** infer identical observables or dimensions.
- **M4 `--genealogy-only`** exports a recurrence/evidence graph, not a documented derivation chain; never infer who copied or derived from whom. The `MATH_GENEALOGY.json` source nodes contain hashes, message locations and date confidence. It is not part of stable 1.0.
- **M5a historical terminology candidates** are source-extracted and not yet activated for automatic search expansion. `SATv TO STANDARD MAP` relations are proposed historic interpretations; `GLOSSARY (LIVE)` does not imply current H(s)H authority. See issue #25.
- Avoid crossing PRIOR_ART/QUARANTINE boundaries. Search output confers no theory authority.

## Connector-only instructions

Read [Mersearch Releases](MERSEARCH_RELEASES.md) before submitting `MERSEARCH_REQUEST.json`. Do not overwrite another worker's pending request; use unique IDs. Inspect each published `RUN_MANIFEST.json` for source commits and **actual** corpus roots. The stable engine/bridge does not implement candidate chronology filters until promotion.

When reporting results, include search query, engine ref, all actually searched repositories, chronological evidence class, exclusions, total and returned hits, and source passages.
