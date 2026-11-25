# GIT_TRAFFIC — GTT-01 Tick Ledger

> **Small but significant bites. Don't choke, don't nibble.**

**Created:** 2026-11-25  
**Status:** READY / GTT-01 active; execution has not begun under this ticker  
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

**State:** IN PROGRESS. The live cursor remains at `@⌕ᵃ`; this is a partial inventory, not Tick completion.

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

**Next within GTT-01.A:** continue enumerating the remaining HsH dump/source paths and known SAT-era locations; record direct file paths, blob identities, duplicate families and provenance. Keep telemetry captures distinct from analysis/conversation records. Once the accessible candidate source universe is inventoried or each remaining limit is explicitly bounded, advance to `⌕↦` to assign measured-repository identity and source role.

**Not yet done in this checkpoint:** no newly surfaced candidate has been added to the historical-observation catalogue as a verified observation; no measured-repository CSV assignment has been inferred from storage location; no arithmetic or internal/external attribution has been performed.

@⌕ᵃ⌕↦⌕∑⌕∅▣✓⇢
