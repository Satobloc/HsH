# 🔎 MERSEARCH — START HERE FOR EVERY ARCHIVE RESEARCH WORKER

**Effective 2026-10-09. Direct user instruction:** SAT/H(s)H LLM workers **should be using Mersearch now** for archive archaeology, source recovery, prior calculations, theory history, provenance, and source-first mathematical work. It is an active shared tool, not a future idea. **Search before claiming a construction is absent, novel, unrecoverable or superseded.**

## The 15-second rule

**Default: search ALL THREE permitted repositories together.**

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25` (original SAT / GLASS)
2. `Satobloc/HsH` (H(s)H, full conversations and current work)
3. `Satobloc/HSH_RESOURCES` (supporting public resources)

Treat `PRIOR_ART` and `QUARANTINE` as excluded. Do not silently limit a historical search to one archive. If one source is unavailable, **state which repository was missing** and report that results are **partial**. Repository names alone do not establish access rights; follow actual permissions and source classification.

### Choose the search interface you actually have

| You can… | Use | Status |
| --- | --- | --- |
| Run Python against checked-out archives | Pinned `mersearch-stable-1.0`, invoked over all three roots | Available now; stable Boolean/NEAR/math notation, not chronology inference |
| Use the HsH GitHub connector but cannot run Python | `.github/workflows/mersearch-request-bridge.yml` via `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` on `main` | **Three-root bridge activated 2026-10-09**; inspect the published manifest before asserting coverage |
| Work on the chronology/multi-archive development branch | `mersearch-chronology-20261007`: run `python tools/search_archive_content.py --capabilities`, `--help`, `--examples`, `--coverage` | Candidate 1.2, tested on synthetic fixtures; **not** the pinned stable release |
| Only have GitHub code search | Query each of the three repositories independently and disclose caps/limitations | Fallback, **not** a verified Mersearch run |

**Do not confuse the human Pages interface with research search.** The public web page is a curated conversation-*title/path* catalog until a separately reviewed public full-text index goes live. It does not expose the whole research corpus.

## GitHub connector route: read before writing

1. Read `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`. This is a **shared single-slot bridge**, and another worker may have a pending request. **Do not overwrite** a pending request (currently a Ravel contact/backreaction query as of this note). If occupied, use your own local Mersearch checkout, inspect previously published runs, or coordinate a turn. Do not pretend a connector code search is a Mersearch result.
2. When the slot is free, write a fresh unique `request_id`, a query using the stable 1.0 language, requester and purpose. A change to this file on `main` starts the GitHub Actions workflow.
3. Retrieve the indexed result folder `indexes/mersearch_requests/<request_id>/`, including `SEARCH_RESULTS.json`, `SEARCH_RESULTS.md` and `RUN_MANIFEST.json`. The moving aliases `latest.*` are not sufficient provenance and may not be current.
4. Confirm the **actual** searched repositories, exact source SHAs, stable Mersearch implementation ref, exclusions and completion. Failed or incomplete runs are not results. Remember: scan exclusions and large files may limit completeness even if three repositories were checked out.

## Local pinned Mersearch usage

From a stable checkout with sibling archive directories visible (paths here are examples):

```bash
python tools/search_archive_content.py \
  /data/SAT_THEORY_ARCHIVE_2023-25 /data/HsH /data/HSH_RESOURCES \
  --expr '("refractive index" NEAR/12 "phase shift") OR "0.24"' \
  --sort date --out /tmp/mersearch-optical
```

More queries:

```text
("stringing along theory" OR "toy theory") AND (filament OR string)
("Chronophysical" OR "SAT Mark V") AND "phase shift"
math:"B=3/(4*pi)"
(name:*LAB* OR path:*PHASE*) AND (optical OR kink)
author:user AND (worldtube NEAR/12 holonomy)
```

Stable search supports Boolean `AND`/`OR`/`NOT`, parentheses, quoted phrases, `NEAR/n`, `author:`, `role:`, `body:`, `math:`, `title:`, `date:`, `name:`, `path:`, `status:` and path/name globs. The mathematical mode normalizes notation but does **not** prove algebraic equivalence. Search several alternate mathematical forms; don't pretend automatic CAS exists.

**LLMs must discover available capabilities.** On the development branch, start with `--capabilities`. On stable 1.0, read `WORKSPACES/COMMON/MERSEARCH_RELEASES.md` and `--help`; do not assume later flags exist. Never guess a filter name.

## Historical provenance

- Direct message timestamps from structured exports are hard evidence for those messages. Folder/archive dates and dates **mentioned** in text are not interchangeable.
- Early use of version names (SAT Mark IV.2, Mark V, SAT X/XY/Z/O, Chronophysical, Stringing Along Theory, toy theory) may date a passage only **tentatively**; retrospective use, renamed concepts and compilations can invalidate simple inferences.
- Report **earliest attested**, **earliest estimated**, and **earliest archived** separately. Compare passages from original exports, not merely copied summaries.
- For the `0.24 rad` lineage, prioritize early **laboratory optical phase-shift** calculations and related **refractive-index** discussion before imposing later projection-constant interpretations.
- Include exact source path, line/message locator, original date if known, query, searched repositories, engine/ref, and limitations with every finding.

## Immediate operating rule

If an agent's task involves SAT/H(s)H history, equations, geometry, or the status of a claimed earlier result, **invoke a permitted search route first and inspect original matched context before inventing a replacement**. Do not delay serious calculation once useful sources are found.

### Source of truth / more capabilities

- [Stable 1.0 instructions](MERSEARCH_RELEASES.md)
- [Full search architecture](MERSEARCH_RESEARCH_PLATFORM.md)
- [Chronology 1.2 and LLM discovery on development branch](https://github.com/Satobloc/HsH/blob/mersearch-chronology-20261007/WORKSPACES/COMMON/MERSEARCH_AGENT_QUICKSTART.md)
- [Development review, **not** stable deployment](https://github.com/Satobloc/HsH/pull/10)
- [Human-facing deployment guide](https://github.com/Satobloc/HsH/blob/mersearch-chronology-20261007/CONVERSATION_VIEWER/mersearch/README.md)

**Shortcut:** Search three roots; disclose coverage; verify original records; then do the science.
