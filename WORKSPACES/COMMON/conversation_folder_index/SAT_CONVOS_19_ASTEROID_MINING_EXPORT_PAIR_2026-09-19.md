# SAT_CONVOS_19 — Asteroid Mining NotebookLM export-pair audit

**Assessed:** 2026-09-19  
**Status:** bounded provenance / duplicate-relationship audit  
**Authority:** archive-routing only; no theory authority

## Objects compared

1. `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_19/Asteroid Mining_ From Bagging to Acoustic Ore Assessment__NotebookLM_export.json`
   - blob SHA `0601ba10d37abc9dd9e06134f6321ae459736f9e`
   - size 12,056 bytes
   - captured `2026-09-19T00:51:05.296Z`
   - notebook id `14b9db5c-44a6-40ed-b131-b4aa4733765c`
   - `reached_top=false`; `scans=12`

2. `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_19/Asteroid Mining_ From Bagging to Acoustic Ore Assessment__NotebookLM_export (1).json`
   - blob SHA `07353050aa8d67ee4cecabba2dbb4055e8628d1b`
   - size 16,158 bytes
   - captured `2026-09-19T01:04:34.969Z`
   - same notebook id `14b9db5c-44a6-40ed-b131-b4aa4733765c`
   - `reached_top=true`; `scans=801`

## Relationship finding

The two files are **not byte-identical**, but the inspected conversation payload is the same two-message exchange with the same message keys:

- message 1 key `9fdf589d`: Nathan prompt `Give me a full detailed breakdown of the source please`
- message 2 key `5eee1d41`: NotebookLM-generated detailed breakdown of `ASTEROID MINING LLC.txt`

The later `(1)` export additionally exposes a populated `sources` surface identifying `ASTEROID MINING LLC.txt` plus NotebookLM UI/source-guide rows, and a populated `studio` surface. The earlier export has empty `sources`, `studio`, and `capture_log` arrays. The later capture also reports `reached_top=true` after 801 scans versus `reached_top=false` after 12 scans in the earlier capture.

**Disposition:** classify these as an **alternate-capture / metadata-enriched superset relationship**, not as two independent conversations and not as a safe reason to delete the earlier file. The later file is the stronger current source for NotebookLM capture completeness and source-title recovery; the earlier file remains provenance-bearing evidence of the first capture state.

## Authorship boundary

As in other inspected NotebookLM exports, both Nathan's prompt and NotebookLM answer are serialized as `role=user`. The role field therefore does not authenticate Nathan authorship here.

The bounded Nathan-direct content recoverable from this pair is the prompt:

`Give me a full detailed breakdown of the source please`

The long second message is NotebookLM-generated response prose summarizing the underlying `ASTEROID MINING LLC.txt`; it must not be promoted as Nathan-authored wording.

## Content / routing value

The NotebookLM answer indicates that the underlying source spans asteroid-mining macroeconomics/geopolitics, bag-and-spin containment/processing, disaggregation methods, acoustic target qualification (`SONODART` / “Ting Test”), intellectual-property/legal strategy, speculative physics, and staged business/R&D models. These are NotebookLM characterizations until checked against the underlying source.

The later export gives an explicit underlying-source title: `ASTEROID MINING LLC.txt`. That makes this pair useful for source recovery and crosswalking even though it is not primarily SAT/H(s)H theory material.

A bounded exact-title code search on 2026-09-19 across the accessible `Satobloc/HsH` and `Satobloc/SAT_THEORY_ARCHIVE_2023-25` repositories returned no match for `ASTEROID MINING LLC.txt`. This is **not** evidence that the source is absent from all project holdings: the search did not cover every permitted repository/resource surface, title normalization may differ, and GitHub code search is not a complete archive-content guarantee. Treat it as an unresolved source-crosswalk candidate, not a confirmed missing document.

- **Ingest status:** `PAIR-RELATIONSHIP-CHECKED`, `TARGETED-READ`, `UNDERLYING-SOURCE-IDENTIFIED`, `CROSSWALK-SEARCH-PARTIAL`, `UNDERLYING-SOURCE-UNRESOLVED`.
- **Tentative value:** MEDIUM-HIGH for archive/source recovery, Nathan side-project/intellectual-history context, and NotebookLM extractor-integrity QA; LOW direct SAT/H(s)H theory value on current evidence. These are provisional task-specific judgments.
- **Tentative priority:** P2 generally; P1 if source-recovery, invention chronology, side-project indexing, or NotebookLM extractor QA is active.

## Next cursor

Broaden the source crosswalk beyond exact-title code search: check permitted RESOURCES/other accessible project holdings and title/content variants for `ASTEROID MINING LLC.txt`, then record provenance/authorship and compare the underlying source against the NLM characterization if located. Preserve both exports regardless of crosswalk outcome.
