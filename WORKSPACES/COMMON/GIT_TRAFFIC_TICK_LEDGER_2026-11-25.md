# GIT_TRAFFIC — GTT-01 Tick Ledger

> **Small but significant bites. Don't choke, don't nibble.**

**Created:** 2026-11-25  
**Status:** IN PROGRESS / GTT-01 active; GTT-01.A and GTT-01.B complete within the bounded source scope; GTT-01.C active.
**Parent:** [GIT_TRAFFIC thread key](GIT_TRAFFIC_THREAD_KEY.md)  
**Evidence catalogue:** [Historical Traffic observations](GIT_TRAFFIC_HISTORICAL_OBSERVATIONS_2026-11-25.md)  
**Event ledger:** [Canonical append-only clone ledger](CLONE_LEDGER.jsonl)  
**Method glyphs:** [External Dimensional Workshop Code Ledger](https://github.com/Satobloc/HSH_RESOURCES/blob/main/info/EXTERNAL_DIMENSIONAL_WORKSHOP_CODE_LEDGER.md)

## Purpose

Finish the historical GitHub Traffic source inventory needed to support an evidence-bounded estimate of HsH's internally attributable and externally unexplained clone traffic. Keep observations, internal events, Actions materialization, API access, and unknown provisioning separate.

This is the **GIT_TRAFFIC lane's** own Tock plan. It does not take over or revise Tern's project-wide WH-01 / issue #1703 coordination, and it does not duplicate or replace the canonical clone-event ledger.

## Guardrails

1. Every GitHub Traffic CSV is a **single-repository** export. Never describe or calculate one as multi-repository.
2. A TXT composite may concatenate separately labeled dashboard captures. Preserve each labeled repository section as its own observation.
3. Distinguish the repository that stores a file from the repository whose Traffic it measures.
4. Match CSVs to TXT/image captures only from explicit repository identity, date window, and exact daily-total reconciliation. Keep ambiguous assignments unresolved.
5. Rolling 14-day windows overlap and are not additive. Reconcile by dropping the old day(s) and adding the new day(s), not by summing snapshots.
6. Daily unique-cloner counts do not sum to the 14-day deduplicated unique-cloner total. Never substitute their sum.
7. Do not infer zero traffic from a missing capture, interpolate unobserved periods, or treat a repository upload timestamp as a dashboard capture timestamp.
8. Prioritize HsH. Do not create an unsolicited three-repository combined total or distribution.
9. Do not infer Traffic clone attribution from an Actions run, checkout, API read, repository write, or workspace presence. GTT-02 will use evidence in the canonical event ledger.
10. Unknown remains UNKNOWN. An unresolved source or coverage gap is a result to record, not a reason to force an assignment.

## Tick assignments

The glyphs below retain their existing meanings from the shared code ledger. The lettered Tick IDs distinguish separate operations that reuse the same glyph. Ticker position is the first unfinished Tick; completed glyphs are retired only after the result is durable and verified.

| Order | Tick ID | Ticker glyph | Operation | Required result | Exit condition |
|---:|---|:---:|---|---|---|
| 1 | **GTT-01.A** | ⌕ᵃ | **Inventory remaining source assets.** Sweep the relevant `EXPOSURE_STATS` and `HISTORICAL` holdings for later/earlier CSVs, TXT composites, screenshots and supporting indices. Capture path, storage repo, blob SHA, commit provenance, filename family and duplicate relationships. | Candidate source manifest; HsH-relevant items prioritized. | Every discovered candidate has a recorded disposition: read, queued, duplicate, irrelevant to this lane, or blocked. |
| 2 | **GTT-01.B** | ⌕↦ | **Assign measured-repository identity.** For each individual CSV, determine which one repository it measures. For TXT/image sources, segment explicitly labeled repository observations. Do not infer from storage location or filename alone. | Source-to-measured-repository map, with confidence and unresolved cases. | Every in-scope source is explicitly mapped or explicitly left unresolved with the missing evidence named. |
| 3 | **GTT-01.C** | ⌕∑ | **Reconcile observation windows and clone counts.** Parse daily clone rows, verify dates and 14-day sums, match source sections, detect duplicate blobs and reconcile overlapping windows without adding them. Keep each repository's observations separate. | Per-observation arithmetic and date-window reconciliation. | Every reported clone total is directly sourced or exactly reconciled to its own single-repository daily series; discrepancies remain visible. |
| 4 | **GTT-01.D** | ⌕∅ | **Recover window-level unique-cloner evidence and capture timing.** Search for direct dashboard TXT/image evidence matching HsH's latest 119,670-clone window (2026-11-10–2026-11-23), especially its deduplicated 14-day unique-cloner count. Search other HsH snapshots for missing unique-cloner totals or capture timestamps where worthwhile. | Directly sourced unique-cloner totals/capture times, or a precise gap record. | Each value is directly evidenced; daily unique counts are not substituted. Unrecoverable fields are explicitly marked unknown. |
| 5 | **GTT-01.E** | ▣ | **Record the verified tranche.** Append source-matched observations and provenance to the historical-observation catalogue; update the source inventory/disposition and retain exact blob/commit identities. Do not put dashboard observations or planning notes into the clone-event JSONL. | Updated historical-observation catalogue with evidence states and unresolved gaps. | All results from A–D are durably represented without overwriting earlier observations or collapsing repository-specific records. |
| 6 | **GTT-01.F** | ✓ | **Independent verification and readback.** Re-fetch the changed catalogue and tick ledger; independently recalculate CSV sums, check observation windows, repository mappings, duplicate identities, and all source pointers. Inspect the final ticker position. | Verified commit/blob receipts and a concise QC result. | Readback matches the intended content; arithmetic and source identities pass or exceptions are explicitly retained. |
| 7 | **GTT-01.G** | ⇢ | **Tock gate / deliberate transition.** Decide whether the accessible historical inventory is adequate to begin internal attribution. Carry unresolved gaps forward explicitly; do not demand impossible completeness. | Close GTT-01 and open GTT-02, or retain GTT-01 with a specific remaining cursor. | Transition is justified by the evidence state and next work is clearly named. |

## Planned path and live ticker

Operation order is left to right:

**Inventory → identity mapping → arithmetic/window reconciliation → unique-cloner/capture recovery → record → verify → transition gate**

The first four operations all use the shared `⌕` Investigate phase, but each carries an intent modifier. These are not four repetitions of undifferentiated searching:

- `⌕ᵃ` — source acquisition/inventory: **What source assets exist, and where are they?**
- `⌕↦` — mapping/attribution: **Which repository, metric and window does each artifact actually measure?**
- `⌕∑` — quantitative/structured reconciliation: **Do the daily series, dashboard totals, windows and duplicate identities agree?**
- `⌕∅` — evidence-gap recovery: **Which required values or capture details are missing, and can direct evidence recover them?**

The modifiers use the shared general meanings in `HSH_RESOURCES/info/EXTERNAL_DIMENSIONAL_WORKSHOP_CODE_LEDGER.md`, with the GIT_TRAFFIC interpretations recorded there separately from PHYS and BIO.

**Ticker rule:** `@` marks the next unfinished operation and is not itself an operation. After each Tick is completed, recorded and checked, move `@` to the next glyph and retire the completed glyph. Do not advance merely because a chat turn or tool call occurred. `⇢` is a deliberate decision point, not routine punctuation.

## Lane identity and shared vocabulary

The external workshop code ledger is a **shared vocabulary**, not a shared subject-matter queue. GIT_TRAFFIC owns this Tock, its Tick IDs, ticker, historical-observation catalogue and traffic findings. PHYS and BIO retain their own Tocks, cursors and evidence. Shared glyph definitions may have three separately recorded interpretations; a PHYS or BIO interpretation does not transfer its evidence or task state into GIT_TRAFFIC.

A lane may refine a common symbol locally, but it must record that interpretation in the relevant lane ledger and must not silently alter the general definition. GIT_TRAFFIC's modifiers for this Tock are:
- `ᵃ`: inventory Traffic source assets and their acquisition/provenance identities.
- `↦`: assign each artifact to its measured repository, metric and observation window.
- `∑`: reconcile compatible daily totals, rolling windows and duplicate source identities.
- `∅`: pursue missing unique-cloner and capture-time evidence; absence is not zero.

The canonical `CLONE_LEDGER.jsonl` is a different shared artifact: it records evidence about actual clone-related events. It is not this lane's planning or observation catalogue.

## Direction after the current source-inventory Tick

The planned path is a dependency chain, not four equivalent searches. The current operation first establishes the candidate source universe. Once that is recorded, the next operation maps each artifact to what it measures; arithmetic is not trusted until that mapping is grounded. Reconciliation then establishes which observations can be compared across rolling windows. The gap pass targets the remaining information needed for attribution, especially the window-level unique-cloner count and exact capture time for HsH's 2026-11-10–2026-11-23 / 119,670-clone observation.

After GTT-01:
1. **GTT-02 / internal attribution:** determine what actual internal systems did, using the canonical event ledger plus supporting run/job/log/provisioning evidence. Keep explicit clone, Actions checkout, API/connector reads, archive access and unknown provisioning distinct. Tern remains WH-01 coordinator.
2. **GTT-03 / external residual:** align GTT-01's Traffic windows with the best-supported internal event window; calculate known-internal low/central/high contribution and the unexplained residual range. State assumptions, coverage and unknowns. Keep clone events, clone totals and unique cloners as separate measures.
3. **Decision/use:** only after those bounds exist decide whether the traffic is substantially internal, mixed, or predominantly unexplained/external. Do not label the residual as external people or unique individuals without evidence that supports that interpretation.

## Handoff to later Tocks

- **GTT-02:** use the canonical `CLONE_LEDGER.jsonl` and supporting telemetry to classify actual internal clone-generating activity. Separate explicit git clone, Actions checkout/materialization, API/connector access, archive download, cached workspace and unknown provisioning. Do not duplicate WH-01 work or take over Tern's coordinator role.
- **GTT-03:** compare matched-window GitHub Traffic observations with the evidenced internal-event range; calculate internal contribution and external/unexplained residual bounds. Keep clone count distinct from unique cloners.
- **WH-01 dependency:** Tern retains project-wide census coordination under HsH issue #1703. The known missing run-ID snapshot/job-fan-out blocker remains separate. It does not prevent GTT-01 historical-source work.

## Initial state

No operation in this ticker has been completed yet. Earlier GTT-01 work remains valid: the thread is already oriented and the initial observation tranche is catalogued. This ticker covers the **next bounded execution sequence**, not a claim that all prior GTT-01 work is undone.



## Shared canonical event-ledger concurrency note — 2026-11-25

The canonical `CLONE_LEDGER.jsonl` is shared and append-only across work lanes. Its blob changed during this GIT_TRAFFIC turn; this was **not** a GIT_TRAFFIC write.

- Latest observed path commit: `f7ddeadc38b4c2b3258ac745bf65ea2c7931a761`, 2026-11-25T06:22:47Z, message `Append PHY-01 Bite 06 and ledger integrity provenance`. GitHub's commit diff reports three appended rows, zero deletions. The rows are attributed in their own fields to the PHYS research thread and record API-only access/write operations; each has `traffic_clone_expected=NO`, `clone_created=false`, `checkout_materialization=NONE`, `classification=CONFIRMED NOT A FULL CLONE`, and `traffic_attribution=UNKNOWN`. They are PHYS provenance records, not new GIT_TRAFFIC observations or evidence of external cloning.
- The preceding `cc63b703fb82105d19f3d23070a68389fbe1cbf8` commit appended three stable-ID supplements for legacy rows 309–311. Those supplements explicitly link to the earlier events and are not separate access events.
- The latest file blob reported in the commit diff is `6ec85e2d767587c6387d7312529d9c87c5c2690f`. A subsequent Contents read returned an empty body despite that blob identity, so the commit diff/history—not an empty-body inference—is the available evidence for this checkpoint.

**Lane rule:** shared ledger mutation does not move this lane's ticker. GIT_TRAFFIC must inspect each row's event identity, repository, operation, mechanism, evidence, and Traffic-attribution field before including it in GTT-02. Do not import PHYS/BIO findings as GIT traffic evidence. No GIT_TRAFFIC event was appended in this planning/inventory work.

## GTT-01.A live source-inventory checkpoint — 2026-11-25

**State:** GTT-01.A COMPLETE. GTT-01.B COMPLETE. GTT-01.C ACTIVE at the live cursor.

### Enumerated source collections

| Storage repository / path | Listing result | Traffic-relevant inventory notes |
|---|---:|---|
| `Satobloc/HSH_RESOURCES/EXPOSURE_STATS/` | 176 entries returned | Root contains the working source index, multiple individual clone/unique-cloner CSV families, explicit TXT traffic captures, screenshot/OCR indices, and nested statistical collections. |
| `EXPOSURE_STATS/_SAT  Satobloc GitHubStats/` | 120 entries returned | Includes multiple numbered single-repository clone and unique-cloner CSVs; `HSH_gitclones.txt`; `HSH_repo_stats.txt`; `HSH_REPO stats 7nov26.txt`; `HSH_TRAFFIC_23SEP26.txt`; SAT traffic records; and screenshot/analysis context. |
| `EXPOSURE_STATS/HISTORICAL/` | 57 entries returned | Includes `HSH_REPO stats 7nov26.txt`, clone and unique-cloner CSVs, `ghub.txt`, and duplicate-path copies of known material. |
| `EXPOSURE_STATS/EXP_ANALYSIS/` | 21 entries returned | Includes `CONCAT_FULL_GIT_STATS.txt`, a concatenated TXT source, blob `af70059ee57f5677d68fbc95a92a330dd5b8bcdd`. It is a TXT composite, not a CSV export. |
| `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/` | 1,000 entries returned | Response is at the 1,000-entry ceiling and may be truncated. It exposes candidate clone/unique-cloner CSVs, `gt.txt`, `gtss.txt`, and repeated copies of Resources material. Full inventory remains unresolved. |
| `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT  Satobloc GitHubStats/` | 6 entries returned | Contains one-repository clone, unique-cloner, views and unique-visitor CSVs; individual file identities overlap with other stored copies. |
| `Satobloc/SAT_THEORY_ARCHIVE_2023-25/PRE_HSH_ROUNDUP/` | 8 entries returned | Includes `github rep.txt`, blob `f83a1ed760251dd1bcebfd2bdc64f0b6e4d94d2c`, a historical candidate requiring source inspection. |

### Newly surfaced candidate captures

- **`EXPOSURE_STATS/_SAT  Satobloc GitHubStats/HSH_gitclones.txt`**, blob `bcd3484ea688012a87e4697f832145382e1dbc71`: the capture page explicitly identifies `Insights: Satobloc/HsH` and reports 7,090 clones and 1,136 unique cloners in the last 14 days. The surrounding page also shows a September 9–16, 2026 activity interval for a separate Insights view; that interval is not yet established as the clone chart's precise observation window. Keep this as a direct-capture candidate pending timing and CSV linkage.
- **`EXPOSURE_STATS/_SAT  Satobloc GitHubStats/9.8.26 -- GITSTATS.txt`**, blob `45daaab1ce989072b895d3cc8824d96da89bbb89`: contains separately rendered Traffic sections identifying `Satobloc/SAT_THEORY_ARCHIVE_2023-25` (698 clones / 149 unique cloners) and `Satobloc/HsH` (287 clones / 146 unique cloners). Exact dashboard windows/capture time and corresponding single-repository CSV matches remain to be established. Do not combine the two sections.
- Cross-repository copies of `HSH_TRAFFIC_23SEP26.txt`, `SAT_TRAFFIC_23SEP26.txt`, `JOINT STATS.txt`, and `CONCAT_FULL_GIT_STATS.txt` appear under more than one path. The same blob SHA means duplicate file content, not additional observations.
- The existing 119,670 HsH observation remains the identified single-repository CSV `Clones in last 14 days (5).csv`, blob `7761926459f437a06f2f6bc7eb10fa85e9914560`, covering 2026-11-10–2026-11-23. Its paired `Unique cloners in last 14 days (5).csv`, blob `8bebccc6ff6c1e5f6704161ff57d7eb54f41f66c`, is a daily series; it does **not** supply the window-deduplicated unique-cloner total.

### Inventory limits and next cursor

The working `GITHUB_STATS_INDEX.md` (blob `bd530cb15ef3e314d1126e768f90dcf3fe666100`) explicitly labels its coverage as an initial discovery pass, not exhaustive. Its candidate list points to additional HsH dump folders and SAT-era captures. The 1,000-entry HsH directory response is also ceiling-limited. Explicit requests using `page=11`, `page=12`, and `page=13` returned the same 1,000-item set rather than subsequent pages; the current connector route therefore has not provided a usable continuation cursor for that directory. Do not treat repeated responses as additional coverage. Accordingly, GTT-01.A is not closed.

**GTT-01.A closure:** the HSH_RESOURCES EXPOSURE_STATS root, GitHubStats subfolder, EXP_ANALYSIS, top-level HISTORICAL and relevant direct-search/image-index hits have been inventoried. Targeted fallback searches returned 55 clone-query and 48 unique-cloner-query matches; relevant candidates were triaged into the source ledger. The HsH 30SEP dump remains capped at 1,000 returned entries and is not an exhaustive secondary-repository listing. This is a bounded inventory, not a claim of complete three-repository visibility. Mysearch remains unvalidated, Mersearch's four lanes remain occupied, and the fallback searches were not a bespoke archive-search run.

**Not yet done in this checkpoint:** no newly surfaced candidate has been added to the historical-observation catalogue as a verified observation; no measured-repository CSV assignment has been inferred from storage location; no arithmetic or internal/external attribution has been performed.



## Lane-specific archive-search protocol and availability — 2026-11-25

This section records GIT_TRAFFIC's own use of archive search. It does not revise the shared code ledger, the general HsH worker protocol, or any worker policy.

1. **Preferred route: Mysearch.** Use it as the first-choice route for ordinary GIT_TRAFFIC archive searches once it is operational and validated.
2. **Fallback / math route: Mersearch.** Use for mathematical/structured query requirements or when Mysearch cannot be used. Before any request, inspect all four request files and report the real lane state. A queue position must be grounded in a documented queue/acceptance record; a requested lane file is not proof of queue acceptance.
3. **Last resort: generic GitHub code search.** Use only when the bespoke route cannot actually be operated. Label the result as fallback discovery and disclose the blocker and search scope.

### Availability check completed this turn

- **Mysearch:** live `MYSEARCH_STATUS.md` says `SCAFFOLD ONLY / NOT VALIDATED / NOT YET A PRODUCTION SEARCH SERVICE`. The workflow exists but requires `workflow_dispatch`; no workflow-dispatch action is exposed in this session. Its implementation plan also records known queue/acknowledgement and clone-ledger instrumentation gaps. No Mysearch request or run was created or claimed.
- **Mersearch:** all four request files were read. Lane 1 (`calder-angle-geometry-source-fidelity-20261102-1337`), lane 2 (`phy01-internal-first-worldtube-hinton-highercats-20261125-01`), lane 3 (`calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`), and lane 4 (`kestrel-finite-core-geometry-source-fidelity-20261102-2200`) each already hold a request with `status: requested`. Lane 2 is separately recorded as in progress. No lane is available for this GIT_TRAFFIC request. There is no GIT_TRAFFIC queue position because no request was submitted and the lane files do not expose a shared FIFO queue position. No lane was modified.
- **Fallback actually used:** GitHub code search, narrowly, to locate and inspect the Mysearch/Mersearch operating records. Those hits are not counted as Traffic-source inventory and are not represented as a bespoke search execution.

### Scope constraint

The primary research corpus for GTT-01 remains `Satobloc/HSH_RESOURCES/EXPOSURE_STATS/` and related HSH_RESOURCES historical holdings. Search HsH/SAT only for a concrete cross-reference, workflow interface, internal-event evidence, or provenance dependency. The broad three-repository default in the general Mersearch worker guide is not a mandate to turn this thread into an H(s)H theory search. This conversation is not a worker-policy channel.

### Return to active operation

The active cursor remains `@⌕ᵃ`. Resume source inventory in HSH_RESOURCES using Mysearch if/when its validation status changes. Until then, do not mislabel generic GitHub search as Mysearch. Mersearch remains a possible fallback/math route, but all four observed lanes are occupied; recheck before any future request and report the actual queue state.


## GTT-01.A additional source inventory — fallback discovery pass

**Search provenance:** Mysearch was not run (live status remains scaffold-only/unvalidated); Mersearch was not run (all four request lanes occupied, no GIT_TRAFFIC queue position). The following discoveries came from a narrowly scoped **generic GitHub code-search fallback** in `Satobloc/HSH_RESOURCES`, followed by direct reads of the original repository files. Do not label this pass Mysearch or Mersearch.

### Newly inspected composite TXT captures

- `EXPOSURE_STATS/GHUBclones.txt`, blob `50f6b79da4dc9cb59bee861d9f588dbd1dfb954b`: composite of separately labeled repository Traffic pages. HsH section reports **6,856 clones / 1,200 unique cloners**; SAT archive section reports **1,048 / 245** and is repeated a second time with the same values; HSH_RESOURCES section reports **622 / 198**. The repeated SAT section is not a second observation. Exact chart windows and capture timestamp are not visible in this text. Preserve all three repository sections separately; HsH remains the primary target.
- `EXPOSURE_STATS/_SAT  Satobloc GitHubStats/HSH_gitclones.txt`, blob `bcd3484ea688012a87e4697f832145382e1dbc71`: explicit `Insights: Satobloc/HsH`; reports **7,090 clones / 1,136 unique cloners**. The Traffic page is repeated twice with the same values. A preceding Pulse panel shows September 9–16, 2026, but that is a separate Pulse interval and is not established as the Traffic chart's window. Capture time and Traffic window remain unresolved.
- `EXPOSURE_STATS/_SAT  Satobloc GitHubStats/9.8.26 -- GITSTATS.txt`, blob `45daaab1ce989072b895d3cc8824d96da89bbb89`: separate SAT archive and HsH Traffic sections. Both show daily chart dates 2026-08-25–2026-09-07. SAT reports **698 clones / 149 unique cloners**; HsH reports **287 / 146**. HsH daily clone values 13, 66, 3, 205 reconcile to 287. The filename suggests a September 8 capture, but exact capture time is not independently established. Daily unique-cloner values are not additive and are not substituted for the dashboard's window total.

### CSV family inventoried in the HSH_RESOURCES GitHubStats folder

All are individual single-repository exports; **measured-repository assignment is deferred to GTT-01.B**. Daily clone sums below are mechanical arithmetic only, not repository attribution.

| File | Blob SHA | Daily dates | Daily clone sum |
|---|---|---|---:|
| `Clones in last 14 days.csv` | `83214dba32b677b94e43d8cb7e5eafdb8bcb204c` | 2026-10-24–11-06 | 67,310 |
| `Clones in last 14 days (1).csv` | `db39166e7cf11933bd096df25bb397d82f964197` | 2026-10-23–11-05 | 7,178 |
| `Clones in last 14 days (2).csv` | `081694b70a65a38aa258cbdaf163f7247619d40d` | 2026-09-09–09-22 | 5 |
| `Clones in last 14 days (3).csv` | `70f87c880f0ecbcdbaf182767a06ac7608ed2da4` | 2026-09-09–09-22 | 4 |
| `Clones in last 14 days (4).csv` | `2dfe5875a505ecc13c9ef38f3ea3e1c09044f7f6` | 2026-09-10–09-23 | 1,749 |
| `Clones in last 14 days (5).csv` | `7761926459f437a06f2f6bc7eb10fa85e9914560` | 2026-11-10–11-23 | 119,670 |
| `Clones in last 14 days (6).csv` | `ca8719e3a5158d5418ef7f2b5079c61b8a69b4af` | 2026-10-21–11-03 | 54,368 |
| `GITHUB ACTIVITY - Clones in last 14 days.csv` | `9fe3f8bd42de3adcf9acbba2dae3c194af43ea2d` | 2026-05-14–05-27 | 5 |

The May clone CSV has an identical-SHA alias, `SAT GIT — Clones in last 14 days.csv`; one blob is one file-content identity, not two independent series. The 67,310, 54,368 and 119,670 series reproduce already catalogued HsH daily totals, but their CSV measured-repository mapping still belongs to the next attribution tick and must be supported by direct capture/window matching.

### Paired unique-cloner CSV inventory

Seven single-repository daily series were found: unsuffixed (2026-10-24–11-06, SHA `87ead929f3386bf1f398cbb647d2b377eb299db3`); (1) (2026-10-23–11-05, `cbb3105b1ea8e1783ff5acf005f8ce2789f4f62b`); (2) (2026-09-09–09-22, `b10188082cd52a66ae2326904082f0a087f20e4a`); (3) (2026-09-09–09-22, `0f232adcfd8551519d34a5bb464f4bc9ac00291b`); (4) (2026-09-10–09-23, `9e4a97c41b4785fa5ba58feb8d87e3e3c79fd964`); (5) (2026-11-10–11-23, `8bebccc6ff6c1e5f6704161ff57d7eb54f41f66c`); and (6) (2026-10-21–11-03, `03b334678efa75516c59b41d677fa47be69a0c85`). The separate `GITHUB ACTIVITY - Unique cloners in last 14 days.csv` and `SAT GIT — Unique cloners in last 14 days.csv` are aliases of the same blob `b6e74398f7f1ff08e665ae860fb4225d6dd04cf0`. These are daily values, not the deduplicated 14-day unique-cloner totals. Do not sum them as window-level unique cloners.

### Inventory disposition / next bite

This pass adds three directly inspected TXT source families, seven numbered/unnumbered clone CSVs plus a May alias family, and their paired unique-cloner series. The original source files are now read, but their full source universe is still not bounded: the working index is explicitly non-exhaustive, and other folders/alternate captures remain. No new candidate has yet been promoted into the historical-observation catalogue. Continue `⌕ᵃ` until the remaining candidate inventory and duplicate dispositions are bounded; then `⌕↦` can map measured repository and observation identity. Do not advance the ticker merely because this checkpoint was written.


## GTT-01.A continued inventory and cross-file fingerprints — 2026-11-25

**Search provenance:** Mysearch remains scaffold-only/unvalidated; Mersearch request lanes remain occupied and no GIT_TRAFFIC queue position exists. This pass used generic GitHub code-search fallback for targeted discovery in HSH_RESOURCES and bounded HsH archive references, followed by direct reads. It is not a Mysearch or Mersearch execution. HSH_RESOURCES remains the primary corpus; HsH files were consulted only where they duplicate or identify concrete Traffic sources.

### Confirmed three-repository mapping: 2026-09-21–2026-10-04

The composite HSH_RESOURCES/EXPOSURE_STATS/GHUBclones.txt (blob 50f6b79da4dc9cb59bee861d9f588dbd1dfb954b) has separately labelled Insights sections for HsH, SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES. Each maps to an individual single-repository CSV by exact 14-day dates, clone sum and chart min/max:

| Measured repository | Direct capture | Matched clone CSV (blob) | Daily sum / range | Paired unique-cloner CSV (blob) | Dashboard unique total |
|---|---:|---|---:|---|---:|
| Satobloc/HsH | 6,856 / 1,200 | EXPOSURE_STATS/Clones in last 14 days - Copy.csv (f46e3aa12684724090f757913f51300083ca808a) | 6,856; 46–989 | Unique cloners in last 14 days - Copy.csv (2bda72e428b1ee3efdb41a45cb465651176a091c) | 1,200 |
| SAT archive | 1,048 / 245 | EXPOSURE_STATS/Clones in last 14 days (1) - Copy.csv (93c574659301499894532e91bb6913afc16d8ba3) | 1,048; 12–572 | Unique cloners in last 14 days (1) - Copy.csv (55407711cad08f2e7daf5bfc6a3d9701422a8daf) | 245 |
| HSH_RESOURCES | 622 / 198 | EXPOSURE_STATS/Clones in last 14 days (2).csv (d426b8a5cc02d24c7d78183540ab0698b569543a) | 622; 3–245 | Unique cloners in last 14 days (2).csv (7e69140fc0243714aaebd7be29a06e74b15d2da5) | 198 |

All six CSVs contain 14 rows dated 2026-09-21 through 2026-10-04. The three daily unique-cloner series have ranges that match the dashboard chart ranges, but their mechanical sums (HsH 1,981; SAT 283; Resources 234) are not the deduplicated 14-day unique-cloner totals. Do not substitute those sums. The SAT section is repeated inside GHUBclones.txt with identical values; that is duplication, not a second observation.

Adjacent root CSV candidates include 7,178 clones for 09/22–10/05 (blob a6991dbb352f955e7c68a262622d8537b2e09d32) and 624 clones for the same dates (blob fb9404f2f2b12af960c6ff9803b843996377c9ee). Each retains 13 overlapping daily values with its corresponding 09/21–10/04 series and drops the first date/adds 10/05, but no separate labelled dashboard capture has yet been matched. Treat these as rolling-series leads, not new verified observations. The 10/04–10/17 root clone series sums to 992 (blob f2871a99766100f79e808e8ad8ec529b1043b26b) and remains repository-unassigned.

### SAT direct capture mapped to a daily CSV: 2026-09-10–09-23

The SAT Insights capture in HSH_RESOURCES/EXPOSURE_STATS/_SAT  Satobloc GitHubStats/23swp42.txt (blob 80c0c0ac188f17cd3fd8dff8bc5ad12d7808d2ee) reports 1,749 clones / 451 unique cloners; graph ranges are 12–572 and 3–170. The clone series exactly matches Clones in last 14 days (4).csv (blob 2dfe5875a505ecc13c9ef38f3ea3e1c09044f7f6) for 2026-09-10–09-23: sum 1,749, min 12, max 572. The paired Unique cloners in last 14 days (4).csv (blob 9e4a97c41b4785fa5ba8d6a3dbf7b3e3c79fd964) has the same dates and 3–170 range; its daily sum is 552, not the dashboard unique total 451. The same clone and unique CSV blob identities occur in the HsH 30SEP dump, confirming copies rather than independent observations. The HsH dump and MOSTLY_EARLY_NLM copies of gtss.txt are also identical (blob 6c131113d2be466f72fb00a339af1374d31dc95d) and show the SAT 1,749/451 capture.

### Additional direct Traffic candidates, not yet promoted to the historical catalogue

- HSH_RESOURCES/EXPOSURE_STATS/_SAT  Satobloc GitHubStats/JOINT STATS.txt (blob f10f4e071f5a3c165dd94c6ffa1d69f2793edb6b): HsH 12,506 / 1,799, graph ranges 79–1,748 and 53–497; SAT 1,239 / 338, graph ranges 12–263 and 3–75. HsH Pulse panel is 2026-09-16–23. The same blob exists in HsH DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/JOINT STATS.txt and SAT_CONVOS_21/JOINT STATS.txt.
- HSH_RESOURCES/EXPOSURE_STATS/HSH_TRAFFIC_23SEP26.txt (blob c4862774a019929f7a70950004d5f9845f1b5c61): HsH 11,912 / 1,735, graph ranges 79–1,748 and 53–497. Its Pulse panel is 2026-09-15–22. The same blob exists in the HsH 30SEP dump. The earlier catalogue's matched HsH daily CSV establishes the Traffic window as 2026-09-08–2026-09-21; the Pulse panel is a separate date interval and is not used as the Traffic window.
- These two HsH captures have different totals but identical graph ranges and Pulse intervals one day apart. The exact Traffic chart date labels are absent. Retain as separate potentially overlapping rolling candidates; do not add them or infer exact Traffic windows from Pulse dates.
- The SAT section of JOINT STATS reports the same 1,239 / 338 and ranges as SAT_TRAFFIC_23SEP26.txt (blob 95458b642ec0b79b01f735784918c24ba267fea5). Their Pulse panels differ by one day; the shared metrics may be a repeated/captured-identical observation family, but the exact Traffic chart dates are unobserved.
- HSH_RESOURCES HSH_repo_stats.txt (blob 37b2325e376c941c3cc8e23aed78580c4bc39467) explicitly identifies HsH and reports 736 / 309; Pulse Sep 4–11 is not a proven Traffic window.
- HSH_RESOURCES HSH_commits.txt (blob cdb3d6958173ffde82f41a9aa8726171676f87d2) explicitly identifies HsH and reports 957 / 367; Pulse Sep 5–12 is not a proven Traffic window.
- HSH_RESOURCES 30k.txt (blob ec28307d88fe0cb9b51f6ee0dc95225df4fa820c) explicitly identifies HsH and reports 30,115 / 3,356; chart ranges 416–6,074 and 139–817. The same metric appears twice inside this file. A separate Pulse panel elsewhere shows Oct 24–31, but it is not proven to be the Traffic chart interval.
- HSH_RESOURCES hsh_data_nov1_2026.txt (blob 01966370e92172f436f6ab1912e0ae2776255701) explicitly identifies HsH and reports 35,651 / 3,640; graph ranges 416–6,534 and 139–817. The filename is not an exact capture timestamp.
- HSH_RESOURCES HSH_54k.txt (blob f5a30e8cc765e1636cc1d0191136323a84df7277) explicitly identifies HsH and reports 54,368 / 5,200; graph ranges 842–7,599 and 242–1,129. Its paired daily CSV is already catalogued.
- HsH DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_19/SAT_ACTIV.txt and SAT_CONVOS_20/SAT_ACTIV.txt share blob 4e1b266ac216936ad2eb3079d47eb53ef04ac702 and report SAT 1,671 / 389. They are duplicate SAT copies, not HsH observations.
- HsH DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/factory_fresh.txt (blob 197f81cf274584d7eeb33a3dbf00618e02aa4340) identifies FACTORY_FLOOR and reports 13 / 11. Keep separate from HsH.
- HsH DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/gt.txt (blob 4b8e37b108ac2ccf6dea7ebe4a2957fab7e06189) is a profile/stars page, not Traffic. GITHUB_ASSISTANT_CONVO.txt is discussion context, not direct telemetry.

### HsH 30SEP dump CSV family: same basename does not mean same file

HsH DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP holds its own numbered CSVs. These are separate single-repository exports; measured-repository identity is not inferred from their storage folder:

| HsH dump file | Blob SHA | Dates | Daily sum | Range |
|---|---|---|---:|---:|
| Clones in last 14 days.csv | 8afd2ef20e451d8a8e6c48ab6c260539af88bd90 | 09/16–09/29 | 13 | 0–11 |
| Clones in last 14 days (1).csv | 9b514a44d754790c975423dea4b1c6bb2e4ed1a0 | 09/16–09/29 | 7,702 | 46–1,411 |
| Clones in last 14 days (2).csv | a13cfe39a32b0187a8ad35e01de19ac1ff04bf23 | 09/16–09/29 | 1,149 | 12–572 |
| Clones in last 14 days (4).csv | 2dfe5875a505ecc13c9ef38f3ea3e1c09044f7f6 | 09/10–09/23 | 1,749 | 12–572 |
| Clones in last 14 days (5).csv | ac2a69f665c0d62086440d578b69103892d436bd | 09/10–09/23 | 13,217 | 221–1,748 |
| Unique cloners in last 14 days.csv | f170bcaf758f7cb54490ca323d90bc773f7527a6 | 09/16–09/29 | 11 | 0–9 |
| Unique cloners in last 14 days (1).csv | c865f928a71cef71184d81cb8a69e241c22aac45 | 09/16–09/29 | 2,197 | 16–355 |
| Unique cloners in last 14 days (2).csv | 2e01442e40ed45634f312e46679605c3db21194d | 09/16–09/29 | 323 | 1–170 |
| Unique cloners in last 14 days (4).csv | 9e4a97c41b4785fa5ba8d6a3dbf7b3e3c79fd964 | 09/10–09/23 | 552 | 3–170 |
| Unique cloners in last 14 days (5).csv | 497ed1b5de5518d5ee5195c8c45fd0f18f073892 | 09/10–09/23 | 3,453 | 105–497 |

The (4) CSV pair is byte-identical to the HSH_RESOURCES series and has the direct SAT 1,749/451 match. The other series remain repository-unassigned. The (5) daily data do not exactly match the HsH JOINT STATS or HSH_TRAFFIC graph minima, despite matching maxima; do not force a mapping.

### May–June composite series and OCR leads

The EXPOSURE_STATS/EXP_ANALYSIS/CONCAT_FULL_GIT_STATS.txt composite (blob af70059ee57f5677d68fbc95a92a330dd5b8bcdd), and its byte-identical alias GITHUB ACTIVITY - MAY GITHUB ACTIVITY.txt / SAT GIT — MAY GITHUB ACTIVITY.txt (blob 6c6bb69f26f4252d19245d7d9488d7dbf2f4bac4), contain multiple distinct CSV-like series. One clone block spans May 19–June 1 and sums 1,012; a separate May 26–June 8 block sums 2,088. The latter daily unique-cloner values sum mechanically to 877. None of these blocks labels the measured repository. Preserve as separate unattributed series; the derivative CROSS_MASTER_CHRONOLOGY is not independent telemetry.

- 42.JPG (source-image SHA / OCR key 783142a1ae7bd8436e82f113a9ec92406dc099c63296c8cafbb88df167b4efc8) OCR reports 42,111 clones; repo identity and window-level uniques are not visible.
- 3400.JPG (source-image SHA / OCR key 534baaedef8701f82fe88634a81e4330e3e35734abb669a9c226151db1e01783) OCR reports 3,999 unique cloners; repo identity and clone total are not visible.
- Total views in last 14 days.png OCR shows 1,022 views dated Aug 30–Sep 12; no repo identity is visible. It matches the HsH HSH ACTIVITY.txt view total, but this is not enough to prove image identity.
- Original images remain primary; OCR is a finding aid. No identity is assigned to these image-only candidates.
- HISTORICAL/ghub.txt is an opaque alphanumeric string, HISTORICAL/hsh_resources_7nov26.txt is a Pulse/dependency snapshot, and HSH_INTERNAL_ACT.txt is workflow run data; none is a Traffic observation.

**GTT-01.A remains IN PROGRESS.** This tranche expands relevant HSH_RESOURCES and HsH duplicate/cross-reference coverage, but source inventory is not closed. No new candidate was promoted into the historical-observation catalogue, and no canonical clone-event row was written. Next: bound remaining HSH_RESOURCES image/index leads and record explicit inventory closure/limits before moving to ⌕↦.


## GTT-01.A close / GTT-01.B start — 2026-11-25

### Bounded inventory disposition

GTT-01.A is closed for the current HSH_RESOURCES-first scope. Direct directory inventories and targeted content searches covered EXPOSURE_STATS (176 entries), the dedicated _SAT  Satobloc GitHubStats folder (120), EXP_ANALYSIS (21), top-level HISTORICAL (57), the relevant EXPOSURE_STATS subfolders, image-text index and discovered cross-repository copies. The targeted generic GitHub fallback produced 55 clone-query hits and 48 unique-cloner-query hits in HSH_RESOURCES; the relevant results were classified as direct capture, single-repository CSV, composite/duplicate, OCR/image lead, derivative/context only, excluded PRIOR_ART, or non-Traffic. The source universe is bounded by the current indexes/search routes, not claimed exhaustive.

The main secondary limitation is the HsH 30SEP26_DUMP 1,000-entry directory cap; targeted Traffic paths were read, but the folder listing itself remains incomplete. Mysearch is not production-validated and no dispatch action is exposed; all four Mersearch request lanes remain occupied. This tick used only disclosed generic GitHub search fallback plus direct source reads. None of these limitations is converted into a zero or an absence claim.

### GTT-01.B live objective — measured-repository identity and window

The confirmed cross-file fingerprints to carry into B are:
- HsH 6,856 / 1,200, 2026-09-21–10-04, matched to its 6,856 daily clone CSV and companion unique-cloner daily series.
- SAT archive 1,048 / 245 and HSH_RESOURCES 622 / 198, each separately matched to its own 2026-09-21–10-04 single-repository clone CSV. Keep these separate from HsH.
- HsH 11,912 / 1,735, 2026-09-08–09-21, as already established by the matched unsuffixed HsH CSV series in the historical-observation catalogue. Its Pulse panel dates must not replace the Traffic window.
- SAT archive 1,239 / 338, 2026-09-09–09-22, as already established by the matched (1) CSV series in the historical-observation catalogue.
- SAT archive 1,749 / 451, 2026-09-10–09-23, matched to the (4) daily clone/unique CSV pair; daily unique sum is not the dashboard total.
- Existing HsH series at 35,651, 54,368, 58,677, 67,310 and 119,670 retain their separately catalogued windows and source evidence.

B must now assign or leave unresolved the remaining direct captures and single-repository CSVs, including HsH 12,506 / 1,799 (direct source but exact Traffic window unknown), 7,090 / 1,136, 736 / 309, 957 / 367, 2,705 / 665, 30,115 / 3,356, and the HsH dump CSV series not yet matched to direct captures. For each, distinguish the Pulse date, Traffic chart window, upload timestamp and capture timestamp. Image-only 42,111-clone and 3,999-unique candidates remain unassigned. Do not map from storage repository, filename suffix, or a nearby Pulse interval alone.

**GTT-01.B exit condition:** every in-scope artifact is assigned to one measured repository/metric/window with evidence, or left explicitly unresolved with the missing discriminator named. After B, GTT-01.C will reconcile the compatible daily series and rolling-window bridges.



## GTT-01.B measured-repository / metric / window mapping register — 2026-11-25

### Mapped with direct repository identity and supported observation window

| Measured repository | Metric: clones / window uniques | Window | Evidence chain |
|---|---:|---|---|
| Satobloc/HsH | 287 / 146 | 2026-08-25–09-07 | HsH-labeled section in HSH_RESOURCES 9.8.26 -- GITSTATS.txt; embedded daily clone rows sum exactly to 287. Capture timestamp remains approximate/unverified. |
| SAT_THEORY_ARCHIVE_2023-25 | 698 / 149 | 2026-08-25–09-07 | SAT-labeled section in same composite; embedded daily clone rows sum exactly to 698. |
| Satobloc/HsH | 11,912 / 1,735 | 2026-09-08–09-21 | HsH_TRAFFIC_23SEP26.txt and the matched HsH daily clone/unique CSVs as recorded in the historical-observation catalogue. Pulse 09/15–22 is not the Traffic window. |
| SAT_THEORY_ARCHIVE_2023-25 | 1,239 / 338 | 2026-09-09–09-22 | SAT_TRAFFIC_23SEP26.txt and matched (1) daily clone/unique CSVs as recorded in the historical-observation catalogue. |
| SAT_THEORY_ARCHIVE_2023-25 | 1,749 / 451 | 2026-09-10–09-23 | 23swp42.txt / gtss.txt; clone CSV (4) sums to 1,749 and paired daily-unique CSV (4) matches the 3–170 chart range. Daily unique sum 552 is not the dashboard total 451. |
| Satobloc/HsH | 6,856 / 1,200 | 2026-09-21–10-04 | GHUBclones.txt explicit HsH section; the single-repository HsH root clone CSV sums to 6,856 and matches its chart range; paired daily unique CSV is consistent in dates/range. |
| SAT_THEORY_ARCHIVE_2023-25 | 1,048 / 245 | 2026-09-21–10-04 | Same composite, separate SAT section; its own single-repository clone CSV sums to 1,048. |
| Satobloc/HSH_RESOURCES | 622 / 198 | 2026-09-21–10-04 | Same composite, separate Resources section; its own single-repository clone CSV sums to 622. Treat as visibility-conditioned because Resources may still have been private; do not read as public discovery. |
| Satobloc/HsH | 35,651 / 3,640 | 2026-10-18–10-31 | hsh_data_nov1_2026.txt and exact 14-row clone series sum as catalogued. Filename is not the exact capture timestamp. |
| Satobloc/HsH | 54,368 / 5,200 | 2026-10-21–11-03 | HSH_54k.txt and exact 14-row clone CSV sum. |
| Satobloc/HsH | 58,677 / 5,897 | 2026-10-22–11-04 | 58k.JPG OCR plus reconstructed daily series from overlapping CSVs, as catalogued. |
| Satobloc/HsH | 67,310 / 6,668 | 2026-10-24–11-06 | HSH_REPO stats 7nov26.txt and exact 14-row CSV sum. |
| Satobloc/HsH | 119,670 / window uniques UNKNOWN | 2026-11-10–11-23 | User-identified single-repository clone CSV; exact daily sum 119,670. Paired daily unique series is not a deduplicated window total. |

### Direct repository/metric identity established; Traffic window remains unresolved

- HsH JOINT STATS.txt: 12,506 clones / 1,799 unique cloners. Direct repository label; Pulse 09/16–23 is context, not Traffic-window evidence.
- HsH HSH_gitclones.txt: 7,090 / 1,136. Direct repository label; Pulse 09/09–16 is context, not Traffic-window evidence.
- HsH HSH_repo_stats.txt: 736 / 309; Pulse 09/04–11 not the Traffic window.
- HsH HSH_commits.txt: 957 / 367; Pulse 09/05–12 not the Traffic window.
- HsH HSH ACTIVITY.txt: 2,705 / 665; the file separately reports 1,022 views / 3 unique visitors.
- HsH 30k.txt: 30,115 / 3,356; chart section repeated in one file. A separate Pulse panel's Oct24–31 interval is not used as the Traffic window.
- HsH hsh48.JPG: 48,880 / 4,686, EXIF creation time 2026-11-03T13:01:24.465Z; chart window not legible in OCR.
- SAT MAIN_ARCHIVE_COMMITS.txt: 1,194 / 259; SATOBLOC ACTIVITY.txt: 1,368 / 321; satobloc_repo_7nov26.txt: 430 / 88; SAT_ACTIV.txt: 1,671 / 389; and FACTORY_FLOOR factory_fresh.txt: 13 / 11. These retain their explicit measured-repository labels but their Traffic windows are not established here. FACTORY_FLOOR is outside the three main repositories.

### Unresolved measured-repository/window assignments

| Artifact/series | What is known | Missing discriminator |
|---|---|---|
| HSH_RESOURCES root clone CSV 7,178, 09/22–10/05 | 14 daily rows and overlap with the 6,856 HsH series | No directly labelled 7,178 dashboard capture; do not assign measured repository from overlap alone. |
| HSH_RESOURCES root clone CSV 624, 09/22–10/05 | 14 daily rows and overlap with the Resources 622 series | No directly labelled 624 dashboard capture. |
| HSH_RESOURCES root clone series 992, 10/04–10/17 | 14 daily rows | No direct repository-labelled capture. |
| HsH 30SEP dump CSVs: clone sums 13, 7,702, 1,149, 13,217 | Individual single-repository series with recorded dates/ranges; HsH storage path does not identify measured repo | No direct labelled capture match for the 13, 7,702, 1,149 or 13,217 totals. Same-basename Resources file (5) is a different blob/version. |
| HsH 30SEP dump paired daily unique CSVs | Daily series only | No window-level deduplicated unique total; do not sum daily values. |
| HSH_RESOURCES controls clone series 5 and 4 | The 4-clone series maps to Satoskills; 5-clone series remains separate | The 5-clone series lacks a direct repository label. |
| 42.JPG OCR: 42,111 clones | Clone metric visible | Measured repository and window unique count absent. |
| 3400.JPG OCR: 3,999 unique cloners | Unique-cloner metric visible | Measured repository and clone total absent. |
| Total views image: 1,022 views, 08/30–09/12 | View count and dates visible | Repository label absent; equality with HSH ACTIVITY view total is insufficient for assignment. |
| May–June composite daily series | Separate clone and daily-unique blocks; arithmetic visible | Measured repository/source window linkage not explicit. |

### Mapping cautions

- A file's storage repository, folder and basename never substitute for its measured-repository identity.
- A Pulse date interval is a separate metric context; never use it as the Traffic window without direct chart dates or a matched daily CSV.
- The HsH dump and HSH_RESOURCES reuse numbered CSV basenames across different file versions. For example, Resources' current (5) clone CSV is the 119,670 Nov 10–23 HsH series; HsH dump's older (5) clone CSV is a distinct 13,217 Sep 10–23 series. Preserve both blob/commit identities; do not treat filename/suffix as identity.
- The earlier GITHUB_ASSISTANT_CONVO narrative is a historical assistant interpretation, not a source for assigning humans, bots or internal tools to cloners.

**GTT-01.B disposition:** COMPLETE for the bounded candidate set. Sources are mapped where direct evidence supports repository and window; all others are explicitly unresolved with the missing discriminator recorded. **GTT-01.C is now active:** quantitatively reconcile the mapped daily series and rolling-window bridges without adding overlapping 14-day snapshots or daily unique-cloner values.


### B supplemental mapping: low-volume control and SAT captures

Two more non-HsH source identities are mapped and remain separate from the HsH target:
- HAUL 3/githacto.txt explicitly identifies Satobloc/SAT_THEORY_ARCHIVE_2023-25 and reports 370 clones / 48 unique cloners. HAUL 3/Clones in last 14 days.csv (blob 42feceb575e4923bf651c568a3b03ff8c8ed83d8) covers 2026-08-23–09-05 and sums exactly to 370; this is a confirmed SAT mapping. A paired daily unique-cloner export was not located in this pass, so 48 remains the directly reported window-level value.
- HSH_RESOURCES/EXPOSURE_STATS/_SAT  Satobloc GitHubStats/CONTROLS.txt explicitly identifies Satobloc/satoskills and reports 4 clones / 4 unique cloners. Its CONTROLS/Clones in last 14 days (3).csv (blob 70f87c880f0ecbcdbaf182767a06ac7608ed2da4) covers 2026-09-09–09-22 and sums to 4, with graph range 0–1; paired unique daily series (blob 0f232adcfd8551519d34a5bb464f4bc9ac00291b) is consistent in dates/range. Satoskills is a separate control repository, not HsH.
- The other CONTROLS series totals 5 clones / 5 mechanically summed daily unique values but has no direct repository-labelled source match. It remains unresolved.


## GTT-01.C first quantitative reconciliation results — 2026-11-25

All arithmetic below was recomputed from original single-repository CSV rows in HSH_RESOURCES. A bridge is valid only where the underlying daily sequence and measured repository are supported.

### Verified one-day rolling bridges

| Repository / series | Earlier 14-day window | Later 14-day window | Drop expired day | Add new day | Reconciled later total |
|---|---:|---:|---:|---:|---:|
| HsH | 6,856 (09/21–10/04) | 7,178 (09/22–10/05) | 09/21: 615 | 10/05: 937 | 6,856 − 615 + 937 = **7,178** |
| HSH_RESOURCES | 622 (09/21–10/04) | 624 (09/22–10/05) | 09/21: 3 | 10/05: 5 | 622 − 3 + 5 = **624** |

Both pairs retain the same 13 overlapping daily rows and have exact daily arithmetic. The Resources result is a separate repository series and remains visibility-conditioned; it is not an HsH public-discovery comparator.

### Verified HsH rolling-window reconstruction: 54,368 → 58,677 → 67,310

Source CSV A, HSH_RESOURCES/_SAT  Satobloc GitHubStats/Clones in last 14 days (6).csv:
- blob ca8719e3a5158d5418ef7f2b5079c61b8a69b4af
- window 2026-10-21–2026-11-03, 14 rows, sum **54,368**.

Source CSV B, HSH_RESOURCES/_SAT  Satobloc GitHubStats/Clones in last 14 days.csv:
- blob 83214dba32b677b94e43d8cb7e5eafdb8bcb204c
- window 2026-10-24–2026-11-06, 14 rows, sum **67,310**.

The intermediate **58,677 / 2026-10-22–2026-11-04** sequence is reconstructed, not a standalone CSV:
- Drop 10/21 = 1,006 from the 54,368 series.
- Add 11/04 = 5,315, directly available as the next row after 11/03 in the 67,310 series.
- 54,368 − 1,006 + 5,315 = **58,677**.
- The resulting 14 daily values cover 10/22–11/04 and match the direct screenshot total in 58k.JPG (OCR reads 58,677 clones / 5,897 unique cloners). The clone total and reconstructed window arithmetic agree.

Then bridge the reconstructed 58,677 window to 67,310:
- Drop 10/22 = 842 and 10/23 = 881.
- Add 11/05 = 4,069 and 11/06 = 6,287.
- 58,677 − 842 − 881 + 4,069 + 6,287 = **67,310**.

Equivalent direct bridge from 54,368 to 67,310:
- Remove 10/21–10/23 = 1,006 + 842 + 881 = 2,729.
- Add 11/04–11/06 = 5,315 + 4,069 + 6,287 = 15,671.
- 54,368 − 2,729 + 15,671 = **67,310**.

This is a coherent HsH rolling sequence. The 119,670 CSV is a separate window 11/10–11/23; there are three intervening days (11/07–11/09) and no matching bridge. Do not interpolate or claim a continuous daily trajectory across that gap.

### 35,651 daily-series claim withdrawn

The direct HsH TXT capture hsh_data_nov1_2026.txt (blob 01966370e92172f436f6ab1912e0ae2776255701) reports 35,651 clones / 3,640 unique cloners and graph range 416–6,534, but contains no 14-row daily table. The earlier recorded vector (416,499,1006,842,881,1079,1249,1631,4122,5055,5124,6074,6534,7599) sums by script to **42,111** and peaks at 7,599. It cannot match the 35,651 capture. The vector's sum happens to equal the separate OCR total from 42.JPG, but its source lineage and dates are not established. Therefore:
- retain 35,651/3,640 as direct HsH dashboard metrics;
- exact window and capture time: UNKNOWN;
- no daily clone CSV is currently verified against the 35,651 total;
- retain the 42,111 OCR image and 14-value vector as unlinked leads, not as a source-matched observation;
- do not include 35,651 in the confirmed rolling-window arithmetic chain.

### C status and remaining reconciliation targets

Verified in this bite:
- HsH 6,856 → 7,178 rolling bridge.
- Resources 622 → 624 rolling bridge.
- HsH 54,368 → reconstructed 58,677 → 67,310 rolling bridge.
- HsH 119,670 CSV sum independently verified as 14 daily rows, 11/10–11/23, 119,670; paired daily unique series remains non-additive and window-level unique total unknown.

Still pending in C:
- reconcile the 287, 698, 1,048, 1,239, 1,749 and 11,912 mapped historical CSV series against their direct source files and date windows where not already fully checked at point of use;
- compare duplicate-content families by blob SHA and version history, especially the same numeric filename suffix reused for the 13,217 and 119,670 CSV versions;
- keep the 35,651, 12,506, 7,090 and other unwindowed captures out of exact date-bridge arithmetic until a window/CSV match is found;
- do not add daily unique-cloner values, sum overlapping windows, or create cross-repository totals.


### September historical CSV-version recovery and multi-day rolling bridges

GitHub file history recovered earlier CSV blobs that are no longer the current contents of their paths. The September 23, 2026 source commit is e7b9aad6fd9e350718d0cd1510dbe01ae024a850; the same CSV blobs are still present at commit 841ec2183d7a35c073fca4fbb5dd2dee31f31520 (2026-11-06), before those paths were later overwritten. This is why blob SHA plus commit ref, not filename alone, must identify the data.

| Measured repo / metric | Historic path and blob SHA | Dates | Rows / sum | Dashboard capture match |
|---|---|---|---:|---|
| HsH clones | _SAT  Satobloc GitHubStats/Clones in last 14 days.csv; blob 684b37c1f9ba87012856f461eaf97d244c42e063 | 09/08–09/21 | 14 / **11,912** | HSH_TRAFFIC_23SEP26.txt: 11,912 |
| HsH daily unique cloners | _SAT  Satobloc GitHubStats/Unique cloners in last 14 days.csv; blob b203be2e3f85353e10463df3473d0e857288b897 | 09/08–09/21 | 14 / 3,160 daily-sum | Dashboard: **1,735**; daily sum is not the window unique total; range 53–497 matches |
| SAT clones | _SAT  Satobloc GitHubStats/Clones in last 14 days (1).csv; blob cbaf4092d81b6f4df7eaf5dc1102dae293c04281 | 09/09–09/22 | 14 / **1,239** | SAT_TRAFFIC_23SEP26.txt: 1,239 |
| SAT daily unique cloners | _SAT  Satobloc GitHubStats/Unique cloners in last 14 days (1).csv; blob 745987b0bd22bda7d402b55798daa9baebcece98 | 09/09–09/22 | 14 / 402 daily-sum | Dashboard: **338**; daily sum is not the window unique total; range 3–75 matches |

The historic HsH clone series min/max are 79/1,748, matching the direct HsH capture's graph range. The SAT clone series min/max are 12/263, matching its direct capture. Both paired unique daily CSVs match their dashboard's unique-cloner graph range, but not the deduplicated window total by sum.

Three exact multi-day bridges now reconcile successive same-repository windows:

1. **HsH 11,912 (09/08–09/21) → 6,856 (09/21–10/04)**. The windows share 09/21 = 615. Remove the old-only 09/08–09/20 rows (sum 11,297), add the new-only 09/22–10/04 rows (sum 6,241): 11,912 − 11,297 + 6,241 = **6,856**. The shared row is counted once in both windows and is not part of the delta.
2. **SAT 1,239 (09/09–09/22) → 1,048 (09/21–10/04)**. The windows share 09/21=12 and 09/22=89 (sum 101). Remove the old-only 09/09–09/20 rows (sum 1,138), add the new-only 09/23–10/04 rows (sum 947): 1,239 − 1,138 + 947 = **1,048**.
3. **SAT 1,749 (09/10–09/23) → 1,048 (09/21–10/04)**. The windows share 09/21–09/23 values 12, 89 and 572 (sum 673). Remove the old-only 09/10–09/20 rows (sum 1,076), add the new-only 09/24–10/04 rows (sum 375): 1,749 − 1,076 + 375 = **1,048**.

All three calculations used the exact daily rows of their measured-repository series. They are different rolling windows, not additive capture totals. HsH and SAT values remain separate.

### Direct daily series inside the 9.8.26 composite

The HSH_RESOURCES source 9.8.26 -- GITSTATS.txt, blob 45daaab1ce989072b895d3cc8824d96da89bbb89, embeds two independently labelled 14-row daily clone sequences for 2026-08-25–09-07:
- SAT: 0,0,9,2,2,2,0,9,1,0,226,119,48,280; sum **698**, min 0, max 280. Direct SAT dashboard total 698 / 149 unique cloners.
- HsH: 0,0,0,0,0,0,0,0,0,0,13,66,3,205; sum **287**, min 0, max 205. Direct HsH dashboard total 287 / 146 unique cloners.
The file separately includes total-view daily series (SAT sum 1,589; HsH sum 268); these are not clone counts. The unique-cloner daily chart series are also separate and must not be added to recreate the dashboard window totals.

### C updated status

The September historical versions now confirm both 11,912 and 1,239 clone totals and establish exact multi-day bridges into the October 8 three-repository composite. The 1,749 SAT source also bridges exactly to the same SAT 1,048 October window. The C pass has exposed and corrected the 35,651 misattribution; it is direct but unwindowed.

Remaining C work: verify duplicate/overwrite lineage for older same-path CSV versions, and close arithmetic/disposition for the remaining 287/698 (now verified) and unassigned series. Exact source and window claims stay limited to direct captures and matched date rows; no attribution to internal/external actors is made in C.

@⌕∑⌕∅▣✓⇢
