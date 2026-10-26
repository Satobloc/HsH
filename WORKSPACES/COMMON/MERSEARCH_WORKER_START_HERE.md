# 🔎 MERSEARCH — START HERE FOR EVERY ARCHIVE RESEARCH WORKER

> **Nathan Direct 2026-10-24:** Prior-art research quarantine is fully lifted, including the two classes that remained hard-quarantined under the 2026-10-09 rule. **Internal-first remains mandatory as provenance discipline, not as an access prohibition.** Search/recover SAT/H(s)H precedent and Nathan-authored intent before treating external parallels as inputs. Workers should also deliberately read conversational and non-obvious material across all three repositories, not only equation-bearing or task-labeled files. Public-index/search exposure rules are separate from research access. See `NATHAN_DIRECT_2026-10-24_PRIOR_ART_UI_ARCHIVE_READING_ANNOUNCEMENT.md`.

**Effective 2026-10-09. Direct user instruction:** SAT/H(s)H LLM workers **should be using Mersearch now** for archive archaeology, source recovery, prior calculations, theory history, provenance, and source-first mathematical work. It is an active shared tool, not a future idea. **Search before claiming a construction is absent, novel, unrecoverable or superseded.**

**Historical Nathan Direct, 2026-10-09 (source-boundary portions superseded by 2026-10-24; internal-first sequence retained):** Read [internal-first SAT, FIE/RMS, and restricted-source rules](NATHAN_DIRECT_2026-10-09_INTERNAL_FIRST_PROVENANCE_AND_SOURCE_BOUNDARY.md). Before consulting outside prior art, find/cite and examine SAT/H(s)H precedent and develop its internal implications first. *No Hopf/spherical carrier is imported.* **Hypothesis H proper and directly Schreiber-authored content stay off-limits** even if mirrored. Other formerly quarantined comparisons need *per-item* clearance. The searcher's automatic `PRIOR_ART`/`QUARANTINE` exclusions remain intentionally unchanged: do **not** bypass with a blanket index or publish them. The nlab Mersearch port is stand-alone and is not an interoperability bridge.


## The 15-second rule

**Default: search ALL THREE permitted repositories together.**

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25` (original SAT / GLASS)
2. `Satobloc/HsH` (H(s)H, full conversations and current work)
3. `Satobloc/HSH_RESOURCES` (private/internal reference resources and toolkit; **not** a public search corpus or theory authority)

Treat `PRIOR_ART` and `QUARANTINE` as excluded. Do not silently limit a historical search to one archive. If one source is unavailable, **state which repository was missing** and report that results are **partial**. Repository names alone do not establish access rights; follow actual permissions and source classification.

### Choose the search interface you actually have

| You can… | Use | Status |
| --- | --- | --- |
| Run Python against checked-out archives | Pinned `mersearch-stable-1.0`, invoked over all three roots | Available now; stable Boolean/NEAR/math notation, not chronology inference |
| Use the HsH GitHub connector but cannot run Python | `.github/workflows/mersearch-request-bridge.yml` via `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` on `main` | **Three-root bridge activated 2026-10-09**; inspect the published manifest before asserting coverage |
| Work on the chronology/multi-archive development branch | `mersearch-chronology-20261007`: run `python tools/search_archive_content.py --capabilities`, `--help`, `--examples`, `--coverage` | Candidate 1.2, tested on synthetic fixtures; **not** the pinned stable release |
| Only have GitHub code search | Query each of the three repositories independently and disclose caps/limitations | Fallback, **not** a verified Mersearch run |

**Do not confuse the human Pages interface with research search.** The public web page is a curated conversation-*title/path* catalog until a separately reviewed public full-text index goes live. It does not expose the whole research corpus.

> **2026-10-26 publication containment and recursion control (live):** All four bridge workflows now publish only `RUN_MANIFEST.json`, `SEARCH_RECEIPT.json`, and `SEARCH_RECEIPT.md`. New raw `SEARCH_RESULTS.json/.md` are withheld in temporary job storage, not durable public artifacts; older runs may still have raw results and remain a separate exposure-remediation problem. This preserves public-safe bounded navigation but **does not satisfy an exhaustive full-hit inventory request**. The bridge also passes stable Mersearch's existing `--exclude mersearch_requests` option, preventing prior generated request outputs from recursively dominating fresh source searches. The manifest records `bridge_exclusions`. Neither change has yet been verified by a post-patch Actions execution. For exhaustive, access-controlled results, use a local pinned checkout or obtain an approved restricted artifact path; do not overwrite occupied lanes or claim full results from a compact receipt.

## GitHub connector route: parallel request lanes

**Updated 2026-10-24:** the former single-slot bridge has been expanded to **four independent request lanes**. All lanes run the same pinned `mersearch-stable-1.0` searcher over the same three permitted roots and publish request-scoped outputs into `indexes/mersearch_requests/<request_id>/`.

Available request files:
- Lane 1 / legacy: `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`
- Lane 2: `WORKSPACES/COMMON/MERSEARCH_REQUEST_LANE_2.json`
- Lane 3: `WORKSPACES/COMMON/MERSEARCH_REQUEST_LANE_3.json`
- Lane 4: `WORKSPACES/COMMON/MERSEARCH_REQUEST_LANE_4.json`

Each lane has its own GitHub Actions workflow and its own concurrency group, so searches on different lanes can run in parallel subject to the repository/account's available GitHub Actions runner concurrency.

**Do not duplicate the Mersearch code itself just to gain throughput.** The bottleneck was the single request file plus single workflow concurrency group, not the search implementation. Keep one pinned implementation and multiply the bridge lanes.

1. Inspect the lane request files and choose an idle lane. **Do not overwrite** a lane whose request is still pending/running or whose output has not been verified. If all lanes are occupied, use a local pinned Mersearch checkout or wait/coordinate rather than overwriting another worker's request. Do not pretend connector code search is a Mersearch result.
2. When a lane is free, write a fresh globally unique `request_id`, a query using the stable 1.0 language, requester and purpose into that lane's request file. A change to the lane file on `main` starts that lane's workflow.
3. Retrieve the indexed result folder `indexes/mersearch_requests/<request_id>/`, including `SEARCH_RESULTS.json`, `SEARCH_RESULTS.md` and `RUN_MANIFEST.json`. The moving aliases `latest.*` are not sufficient provenance and may not be current.
   - **New as of 2026-10-11:** fresh successful bridge runs additionally write bounded `SEARCH_RECEIPT.md` and `SEARCH_RECEIPT.json` in the same request-specific folder. Their SHA-256 digests are recorded in `RUN_MANIFEST.json`. Read the compact receipt first when the full results are too large for connector text readers; the receipt is a *navigation sample* and does not replace the complete search output. Existing runs are not retroactively changed. Detailed `resources/` hit content is deliberately omitted from the public receipt.
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

## Required researcher reading and provenance cycle (October 9)

Each substantive theory-source pass should consult [FIE](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/THE%20FUNDAMENTAL%20INTUITIONS%20%E2%80%94%20EXTENDED.pdf) and relevant [RMS primary sources](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/RMS%20THE%20FRAMEWORK.txt) periodically, plus randomly or systematically sampled **older SAT files**. Search HsH *nested development folders, loose exports, LIVE CONVOS, root files and miscellaneous CONVOS locations*, not only the conventional `SAT_CONVOS_*` folders. Note exactly which documents were *read*, *searched*, *metadata-inventoried* or *unavailable*. Log new source-located equations and share concise cross-worker insights through Common Room. Early terminology and apparently failed constructions must be reconstructed before replacement mechanisms are invented.

For any proposed external crosswalk, maintain this sequence: **SAT source search → exact SAT citations → internal reconstruction/test → nonrestricted prior-art source review → comparator citation only**. The new amendment does not authorize access to the two remaining forbidden classes, indiscriminate private source indexing, or changing public search allowlists.

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
