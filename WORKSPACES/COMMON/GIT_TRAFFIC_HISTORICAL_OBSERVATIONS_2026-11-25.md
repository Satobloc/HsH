# GIT_TRAFFIC — Historical Traffic Observations (initial verified tranche)

> **Small but significant bites. Don't choke, don't nibble.**

**Status:** GTT-01 active; source-matched observations and per-repository CSV series are catalogued, but the full historical inventory is not complete. This is an additive observation catalogue, not a clone-event ledger.

## Measurement rules

- A GitHub Traffic clone total and unique-cloner total are distinct dashboard metrics.
- A 14-day observation is a rolling window. Overlapping windows are not additive.
- The daily clone series is additive within its own 14-day window and can be checked against the dashboard total.
- Daily unique-cloner counts are not additive to the 14-day unique-cloner total: a cloner may appear on multiple days, while the window total is deduplicated across the window.
- Every GitHub Traffic CSV is a download for one repository only. No CSV in this inventory is a multi-repository statistics export.
- A TXT capture may concatenate separately captured, individually labeled repository reports. Treat that TXT as the composite record; retain each repository section as a distinct observation. A separately downloaded single-repository CSV may be matched to one section by repository identity, dates, and exact daily-total reconciliation, but it does not become a multi-repository CSV.
- Distinguish the repository where a file is stored (often HSH_RESOURCES) from the repository whose GitHub Traffic dashboard the file reports.
- A repository upload/commit timestamp is provenance for when an artifact entered the storage repository, not proof of the dashboard capture timestamp.
- Screenshot OCR is a finding aid. The source image remains the visual primary record; OCR text is separately hashed and retained.

## Observation GTT-OBS-001 — 54,368 clones / 5,200 unique cloners

| Field | Value |
|---|---|
| Repository measured | `Satobloc/HsH` |
| Metric | GitHub Traffic: clones in last 14 days; unique cloners in last 14 days |
| Dashboard totals | **54,368 clones; 5,200 unique cloners** |
| Observation window | **2026-10-21 through 2026-11-03 inclusive** |
| Capture timestamp | Not printed in the dashboard text capture; exact time remains unknown |
| Repository upload timestamp | 2026-11-04 12:54:20Z (commit author date; artifact provenance only) |
| Primary text capture | `EXPOSURE_STATS/_SAT  Satobloc GitHubStats/HSH_54k.txt` |
| Primary text blob SHA | `f5a30e8cc765e1636cc1d0191136323a84df7277` |
| Matching daily clone CSV | `EXPOSURE_STATS/_SAT  Satobloc GitHubStats/Clones in last 14 days (6).csv` |
| Daily CSV blob SHA | `ca8719e3a5158d5418ef7f2b5079c61b8a69b4af` |
| Upload commit | `d441dea33c40e5060f06d25dc1920968729ce734` |
| Verification | CSV contains 14 dates, 2026-10-21–2026-11-03; arithmetic sum = **54,368**, exact match to dashboard total |

### Daily clones

| Date | Clones |
|---|---:|
| 2026-10-21 | 1,006 |
| 2026-10-22 | 842 |
| 2026-10-23 | 881 |
| 2026-10-24 | 1,079 |
| 2026-10-25 | 1,249 |
| 2026-10-26 | 1,631 |
| 2026-10-27 | 4,122 |
| 2026-10-28 | 5,055 |
| 2026-10-29 | 5,124 |
| 2026-10-30 | 6,074 |
| 2026-10-31 | 6,534 |
| 2026-11-01 | 7,599 |
| 2026-11-02 | 7,185 |
| 2026-11-03 | 5,987 |
| **Sum** | **54,368** |

The text capture also reports 300 total views and 1 unique visitor. Those are separate visitor metrics, not clone counts.

## Observation GTT-OBS-002 — 58,677 clones / 5,897 unique cloners

| Field | Value |
|---|---|
| Repository measured | `Satobloc/HsH` |
| Metric | GitHub Traffic: clones in last 14 days; unique cloners in last 14 days |
| Dashboard totals | **58,677 clones; 5,897 unique cloners** |
| Observation window | **2026-10-22 through 2026-11-04 inclusive** |
| Capture timestamp | Not printed in OCR; exact time remains unknown |
| Repository upload timestamp | 2026-11-06 04:49:54Z (commit author date; artifact provenance only) |
| Primary image | `EXPOSURE_STATS/_SAT  Satobloc GitHubStats/58k.JPG` |
| Image Git blob SHA | `d7acd9bfb13044debfe81e900bde71f218b2865d` |
| Image SHA-256 in image-text index | `f4ea6e908c4a6efc6f5548ea6a604dcb9e6e79e1bbf51342cede60883775d2c0` |
| OCR extract | `derived/image_text/f4ea6e908c4a6efc6f5548ea6a604dcb9e6e79e1bbf51342cede60883775d2c0.txt` |
| OCR blob SHA | `fe0cc2ae20babce5152a7de65aca31bdf7c8b763` |
| Daily-series sources | The Oct-21–Nov-03 series above plus `EXPOSURE_STATS/_SAT  Satobloc GitHubStats/Clones in last 14 days.csv` |
| Daily-series blob SHAs | `ca8719e3a5158d5418ef7f2b5079c61b8a69b4af`; `83214dba32b677b94e43d8cb7e5eafdb8bcb204c` |
| Upload commit | `4519c1525dc3d106ba7ebee43c21290ef403dd7d` |
| Verification | OCR explicitly reads 58,677 clones, 5,897 unique cloners, and 1 unique visitor. Fourteen daily clone values for Oct-22–Nov-04 sum to **58,677**. |

### Daily clones

The Oct-22 and Oct-23 values come from the Oct-21–Nov-03 CSV; Oct-24 through Nov-04 come from the later overlapping CSV. The overlapping dates agree exactly between the two files.

| Date | Clones |
|---|---:|
| 2026-10-22 | 842 |
| 2026-10-23 | 881 |
| 2026-10-24 | 1,079 |
| 2026-10-25 | 1,249 |
| 2026-10-26 | 1,631 |
| 2026-10-27 | 4,122 |
| 2026-10-28 | 5,055 |
| 2026-10-29 | 5,124 |
| 2026-10-30 | 6,074 |
| 2026-10-31 | 6,534 |
| 2026-11-01 | 7,599 |
| 2026-11-02 | 7,185 |
| 2026-11-03 | 5,987 |
| 2026-11-04 | 5,315 |
| **Sum** | **58,677** |

The OCR confirms 1 unique visitor. It does not provide a reliable total-views figure in the extracted text.

## Cross-observation reconciliation

Both observations are for `Satobloc/HsH`, and the windows are consecutive one-day-shifted rolling 14-day windows:

- 2026-10-21–2026-11-03: 54,368 clones; 5,200 unique cloners.
- 2026-10-22–2026-11-04: 58,677 clones; 5,897 unique cloners.

Clone-total bridge:

`58,677 - 54,368 = 4,309`

The change is exactly explained by dropping 2026-10-21 (1,006 clones) and adding 2026-11-04 (5,315 clones):

`-1,006 + 5,315 = +4,309`

The 5,200 and 5,897 unique-cloner totals are window-level deduplicated counts. Their difference is 697, but it must not be interpreted as 697 newly arrived people without further identity-level evidence.

## Confidence and remaining limits

- **Repository attribution:** high; both captures explicitly identify `Satobloc/HsH`.
- **Dashboard totals:** high; explicit in the captures.
- **Observation windows:** high for the 54,368 capture, matched to the exact 14-day CSV; high for the 58,677 capture, matched by the explicit dashboard total and exact 14-day daily-series sum.
- **Exact dashboard capture timestamps:** unknown. Repository commit timestamps are retained only as upload/provenance bounds, not relabeled as capture times.
- **58,677 daily-series linkage:** high arithmetic and date alignment, but reconstructed across two overlapping CSV exports rather than a single CSV uploaded with the screenshot.
- **Internal versus external origin:** not determined here. These are observed GitHub Traffic totals; internal clone attribution belongs to GTT-02.
- **Inventory completeness:** not established. These are the two requested reference pairs, not the complete historical traffic catalogue.

## Source identity and duplicate handling

- The Oct-21–Nov-03 clone CSV is blob `ca8719e3a5158d5418ef7f2b5079c61b8a69b4af`.
- The Oct-24–Nov-06 clone CSV is blob `83214dba32b677b94e43d8cb7e5eafdb8bcb204c`; the same blob appears at more than one repository path in the source collection and is one content identity, not multiple observations.
- The 58k image's source-image SHA-256 and Git blob SHA are different hash types and are recorded separately.
- No canonical clone-ledger rows were added or altered. This catalogue records dashboard observations, not inferred internal events.

## Repository chronology and exposure priors

GitHub repository metadata retrieved 2026-11-25:

| Repository | Created (UTC) | Current visibility | Analytical role |
|---|---|---|---|
| `Satobloc/SAT_THEORY_ARCHIVE_2023-25` | 2025-10-26 23:51:07 | Public | Original archive; only one of these three repositories during its first ten-plus months |
| `Satobloc/HsH` | 2026-09-04 15:56:16 | Public | Current research/operations repository; primary traffic target |
| `Satobloc/HSH_RESOURCES` | 2026-09-07 01:14:56 | Public | Supporting/private-reference archive; established three days after HsH |

The README pages distinguish the roles: the original repository is the historical SAT/GLASS archive; HsH is the current research and operations surface; HSH_RESOURCES is supporting reference infrastructure, not public-facing synthesis. Repository creation timestamps are not repository exposure dates. Nathan's clarification is controlling context for interpretation: **HsH was public from its creation; HSH_RESOURCES was initially private and became public only roughly one to two months before 2026-11-25.** The exact Resources visibility-change date is not established by the available GitHub metadata. Current repo metadata reports Resources public now, but its `created_at` field does not reveal when it changed visibility.

**Important exposure-cohort distinction:** before 2026-09-04, HsH did not exist; from its creation it was public. HSH_RESOURCES existed from 2026-09-07 but remained private for much of its early life. Its clone records during the private period cannot be interpreted as public discovery or broad public exposure; they could reflect only permitted accounts, the owner, authorized workers, or other authorized automation. The original SAT archive had the longest public exposure history. Cross-repository comparisons must therefore distinguish repository existence, visibility state, and observation window. Contemporaneous dates alone do not make traffic cohorts comparable.

The October 8 TXT compilation contains separate, individually labeled GitHub Traffic dashboard captures for several repositories. Each section is its own repository-specific observation. The separately downloaded CSVs are also individual-repository exports; their daily values and 14-day sums match the corresponding named TXT sections. They are not a combined CSV or a shared multi-repository download. Resources' visibility state on October 8 is unresolved and may still have been private, so its separate 622-clone observation is visibility-conditioned and not a measure of public discovery.

Nathan also notes that HsH cloning was not tracked as closely in the earlier period. Therefore, the current sequence is a set of observed snapshots, not a complete or uniformly sampled HsH time series. Do not interpolate unobserved periods or treat gaps in the capture catalogue as periods of zero cloning.

## Separate repository observations in composite TXT — 2026-10-08 capture

Composite TXT source: `EXPOSURE_STATS/GHUBclones.txt`, blob `50f6b79da4dc9cb59bee861d9f588dbd1dfb954b`; uploaded 2026-10-08 05:12:41Z in commit `d55a157ca2740f53dca6ffb62155ee22b5b2e582`. This TXT concatenates separate dashboard captures and explicitly names each repository in its own section. The figures below are separate per-repository observations, not a single multi-repository GitHub statistic.

| Repository | Clones (14 days) | Unique cloners (14 days) |
|---|---:|---:|
| `Satobloc/HsH` | **6,856** | **1,200** |
| `Satobloc/SAT_THEORY_ARCHIVE_2023-25` | **1,048** | **245** |
| `Satobloc/HSH_RESOURCES` | **622** | **198** |
| `Satobloc/FACTORY_FLOOR` (control, not one of the three) | 20 | 14 |

Three separate, single-repository daily CSV downloads stored in the Resources repository independently sum to the corresponding named TXT-section totals over 2026-09-21–2026-10-04 inclusive:
- HsH: `Clones in last 14 days - Copy.csv`, blob `f46e3aa12684724090f757913f51300083ca808a`, sum **6,856**.
- SAT archive: `Clones in last 14 days (1) - Copy.csv`, blob `93c574659301499894532e91bb6913afc16d8ba3`, sum **1,048**.
- HSH_RESOURCES: `Clones in last 14 days (2).csv`, blob `d426b8a5cc02d24c7d78183540ab0698b569543a`, sum **622**.

These three counts are retained as separate repository-specific observations extracted from the composite TXT and individually corroborated by their own single-repository CSVs. No combined total or percentage share is needed for this HsH-focused analysis. HsH's count was larger than the SAT archive's and Resources' in this particular set of captures, but Resources was initially private and may still have been private on 2026-10-08; its exact visibility state on that date is unresolved. Do not use its 622 clones as a public-interest comparator. Do not add unique-cloner totals across repositories: the same source may clone more than one repository.

The daily unique-cloner CSVs are companion series, not additive window totals. Their maxima and day-by-day values can be compared, but their sum is not the dashboard's 14-day unique-cloner count.

## Earlier paired repository captures — 2026-09-23-labeled TXT records

The paired source records are:
- `HSH_TRAFFIC_23SEP26.txt`, blob `c4862774a019929f7a70950004d5f9845f1b5c61`: explicitly HsH, **11,912 clones / 1,735 unique cloners**, 1,295 views / 2 unique visitors.
- `SAT_TRAFFIC_23SEP26.txt`, blob `95458b642ec0b79b01f735784918c24ba267fea5`: explicitly SAT archive, **1,239 clones / 338 unique cloners**, 618 views / 1 unique visitor.

The associated file list in `GITHUB_ASSISTANT_CONVO.txt` maps HsH to the unsuffixed clone/unique-cloner CSVs, and the SAT archive to the `(1)` CSVs. The saved historical CSV versions reconcile exactly to 11,912 and 1,239 respectively. The historical HsH daily series was 2026-09-08–2026-09-21; the SAT series was 2026-09-09–2026-09-22. These are the dates in the respective daily exports; preserve the one-day difference rather than forcing a shared window. No equivalent explicitly named Resources capture is established by this pair.

These are historical dashboard captures labeled 23SEP26. The file label is the capture-date evidence; exact hour/minute was not recovered.

## HsH progression through November

| Source / capture label | HsH clone total | Unique cloners | Observation window / timestamp status |
|---|---:|---:|---|
| `hsh_data_nov1_2026.txt` | **35,651** | **3,640** | Daily clone series 2026-10-18–31 sums exactly; filename suggests Nov 1 snapshot, exact dashboard time absent; uploaded Nov 6 04:46:09Z |
| `hsh48.JPG` | **48,880** | **4,686** | Screenshot EXIF create time 2026-11-03 13:01:24.465Z; exact plotted date window not readable in OCR |
| `HSH_54k.txt` | **54,368** | **5,200** | 2026-10-21–Nov 3; exact daily CSV sum; upload Nov 4 12:54:20Z |
| `58k.JPG` | **58,677** | **5,897** | 2026-10-22–Nov 4; reconstructed from two overlapping daily CSVs; image upload Nov 6 04:49:54Z |
| `HSH_REPO stats 7nov26.txt` | **67,310** | **6,668** | 2026-10-24–Nov 6; exact daily CSV sum; upload Nov 7 05:57:15Z |

The 35,651 series is from `EXPOSURE_STATS/_SAT  Satobloc GitHubStats/hsh_data_nov1_2026.txt`, blob `01966370e92172f436f6ab1912e0ae2776255701`. Its 14 daily clone values are 416, 499, 1,006, 842, 881, 1,079, 1,249, 1,631, 4,122, 5,055, 5,124, 6,074, 6,534, and 7,599, summing exactly to 35,651.

The 48,880 screenshot is `EXPOSURE_STATS/_SAT  Satobloc GitHubStats/hsh48.JPG`, Git blob `d1ae7c6565bd8ddd68e6a36fd0a911adef687b01`; image-index SHA-256 `0de57f5e937687e6df7a0963688befcecb91cf844c9c365c1028e71be57861db`. OCR blob: `b80ad54e33a577c00ee392a3c4920b1e7c479259`. OCR reports 48,880 clones, 4,686 unique cloners, 232 views and 11 unique visitors. The EXIF creation timestamp is stronger capture-time evidence than its later upload date.

The 67,310 capture is `HISTORICAL/HSH_REPO stats 7nov26.txt`, blob `92a517ac98cf59dab9d31f861a76f8433eb652c4`. Its exact clone CSV is the same 2026-10-24–Nov 6 series previously identified in Observation GTT-OBS-002's source lineage; blob `83214dba32b677b94e43d8cb7e5eafdb8bcb204c`. The 14 clone values sum exactly to 67,310.

Successive matched HsH rolling windows demonstrate the changing scale:
- 2026-10-21–Nov 3: 54,368.
- 2026-10-22–Nov 4: 58,677.
- 2026-10-24–Nov 6: 67,310.

The last two windows can be reconciled by removing Oct 22 and Oct 23 (842 + 881) and adding Nov 5 and Nov 6 (4,069 + 6,287): net +8,633, exactly the difference between 67,310 and 58,677. The one-day shift between the first two observations was already reconciled above.

## Latest single-repository CSV archived in Resources — HsH: 119,670 clones

| Field | Value |
|---|---|
| Current file | `EXPOSURE_STATS/_SAT  Satobloc GitHubStats/Clones in last 14 days (5).csv` |
| Current Git blob SHA | `7761926459f437a06f2f6bc7eb10fa85e9914560` |
| Commit that installed current content | `7188eac413fbf979933f53bc98ebfcb1f047cafe` |
| Commit timestamp | 2026-11-25 03:01:48Z |
| Daily data window | **2026-11-10–2026-11-23 inclusive** |
| Daily rows | 14 |
| Sum of daily clones | **119,670** |
| Paired unique-cloner CSV | `Unique cloners in last 14 days (5).csv`, blob `8bebccc6ff6c1e5f6704161ff57d7eb54f41f66c` |
| Repository measured | **`Satobloc/HsH` by user's explicit identification**: this CSV is a single-repository GitHub Traffic download, and Nathan identifies this download as the HsH capture |
| Dashboard capture timestamp | Not embedded; Git commit time is file-upload/provenance time, not necessarily capture time |

### Latest daily clone values

| Date | Clones |
|---|---:|
| 2026-11-10 | 4,818 |
| 2026-11-11 | 5,489 |
| 2026-11-12 | 8,230 |
| 2026-11-13 | 7,557 |
| 2026-11-14 | 8,175 |
| 2026-11-15 | 8,011 |
| 2026-11-16 | 7,626 |
| 2026-11-17 | 7,726 |
| 2026-11-18 | 6,711 |
| 2026-11-19 | 7,216 |
| 2026-11-20 | 15,859 |
| 2026-11-21 | 8,655 |
| 2026-11-22 | 12,534 |
| 2026-11-23 | 11,063 |
| **Sum** | **119,670** |

The paired daily unique-cloner series sums to 25,011 if its daily rows are mechanically added, but that is **not** the 14-day unique-cloner count. The largest single-day value is 6,526 on Nov 20; the window-level unique-cloner total remains unknown. Do not infer it from the sum.

### File-version lineage warning

The same numbered path `Clones in last 14 days (5).csv` was reused. The preceding version at commit `841ec2183d7a35c073fca4fbb5dd2dee31f31520` (2026-11-06 10:29:39Z) held an earlier Sep 10–23 series totaling **13,217**, not the current November series. The current blob `776192...` was installed by the Nov 25 commit and contains the Nov 10–23 values totaling **119,670**. The paired `Unique cloners in last 14 days (5).csv` was also overwritten. Therefore path/name/suffix alone is not source identity; retain commit ID and blob SHA for each version.

The Nov 10–23 window and upload date Nov 25 leave a two-day reporting/upload gap. Do not rename the observation window to Nov 12–25 or claim the dashboard data is current through Nov 25. Nathan explicitly identifies this single-repository download as HsH, and the exact CSV total (119,670) corroborates the approximate current figure. The CSV is individually attributed to HsH; its storage inside HSH_RESOURCES does not mean it reports Resources traffic.

## Synthesis and comparison limits

- The Oct 8 composite TXT contains separate repository-labeled captures; the matching CSV files are independent single-repository downloads. They show HsH's count exceeding the other individually observed counts in that capture set, but Resources' private/public status makes it an exposure-asymmetric comparison.
- The explicit 23SEP26-named captures show HsH 11,912 and SAT archive 1,239; an equivalent labeled Resources count is not confirmed by that pair.
- The November HsH captures rise from 35,651 to 67,310 across successive/reconciled observations. The latest single-repository CSV is explicitly identified by Nathan as HsH and totals 119,670.
- Current repository creation dates establish when a repository could not yet receive clones. They do not establish its public/private state; keep existence, visibility, and measured repository distinct.
- Do not sum rolling windows, and do not sum daily unique-cloner counts. Keep clone totals, window unique cloners, daily unique cloner counts, page views and unique visitors as separate quantities.
- Traffic clone source attribution is still an open question. None of these dashboard observations by itself separates Nathan's or tool-generated activity from unrelated external sources.


@⌕▣✓⇢
