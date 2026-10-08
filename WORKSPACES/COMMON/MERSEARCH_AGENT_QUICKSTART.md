# Mersearch | LLM Research Worker Quickstart

**Status:** Candidate development on branch `mersearch-chronology-20261007`. Stable release remains `mersearch-stable-1.0`. Never call untested development code a stable release.

## First step for every assistant

Run `python tools/search_archive_content.py --capabilities` to discover search operations, query fields, limitations, examples, and companion tools. Or use `--help` / `--examples`. Do not assume an assistant knows what is available.

**Three-archive default:** SAT_THEORY_ARCHIVE_2023-25, HsH, and HSH_RESOURCES. The candidate CLI finds adjacent repository checkouts automatically. Run `--coverage` first. Missing roots must be reported as **PARTIAL CORPUS**. A directory being present does not guarantee every source file was parsed; check all exclusions and oversized-file counts.

There is ONE search language and engine. Ordinary text, historical/version search, file inventories, and conservative math-notation matching share the same search CLI.

## Tool directory

| Tool | Purpose |
| --- | --- |
| `tools/search_archive_content.py` | CLI: Boolean, NEAR, filename/path, math, chronology, export |
| `tools/mersearch_chronology.py` | Date/version evidence enrichment for the same search |
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
- `math:` performs notation normalization, not mathematical equivalence or a CAS proof. Search different forms of an equation explicitly.
- Avoid crossing PRIOR_ART/QUARANTINE boundaries. Search output confers no theory authority.

## Connector-only instructions

Read [Mersearch Releases](MERSEARCH_RELEASES.md) before submitting `MERSEARCH_REQUEST.json`. Do not overwrite another worker's pending request; use unique IDs. Inspect each published `RUN_MANIFEST.json` for source commits and **actual** corpus roots. The stable engine/bridge does not implement candidate chronology filters until promotion.

When reporting results, include search query, engine ref, all actually searched repositories, chronological evidence class, exclusions, total and returned hits, and source passages.
