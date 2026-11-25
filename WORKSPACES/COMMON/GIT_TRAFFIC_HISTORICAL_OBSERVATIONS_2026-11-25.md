# GIT_TRAFFIC — Historical Traffic Observations (initial verified tranche)

> **Small but significant bites. Don't choke, don't nibble.**

**Status:** GTT-01 active; two reference observations source-matched. This is an additive observation catalogue, not a clone-event ledger and not a claim that the full historical inventory is complete.

## Measurement rules

- A GitHub Traffic clone total and unique-cloner total are distinct dashboard metrics.
- A 14-day observation is a rolling window. Overlapping windows are not additive.
- The daily clone series is additive within its own 14-day window and can be checked against the dashboard total.
- Daily unique-cloner counts are not additive to the 14-day unique-cloner total: a cloner may appear on multiple days, while the window total is deduplicated across the window.
- A repository upload/commit timestamp is provenance for when an artifact entered this repository, not proof of the dashboard capture timestamp.
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
