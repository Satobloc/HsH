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
| 1 | **GTT-01.A** | ⌕ | **Inventory remaining source assets.** Sweep the relevant `EXPOSURE_STATS` and `HISTORICAL` holdings for later/earlier CSVs, TXT composites, screenshots and supporting indices. Capture path, storage repo, blob SHA, commit provenance, filename family and duplicate relationships. | Candidate source manifest; HsH-relevant items prioritized. | Every discovered candidate has a recorded disposition: read, queued, duplicate, irrelevant to this lane, or blocked. |
| 2 | **GTT-01.B** | ⌕ | **Assign measured-repository identity.** For each individual CSV, determine which one repository it measures. For TXT/image sources, segment explicitly labeled repository observations. Do not infer from storage location or filename alone. | Source-to-measured-repository map, with confidence and unresolved cases. | Every in-scope source is explicitly mapped or explicitly left unresolved with the missing evidence named. |
| 3 | **GTT-01.C** | ⌕ | **Reconcile observation windows and clone counts.** Parse daily clone rows, verify dates and 14-day sums, match source sections, detect duplicate blobs and reconcile overlapping windows without adding them. Keep each repository's observations separate. | Per-observation arithmetic and date-window reconciliation. | Every reported clone total is directly sourced or exactly reconciled to its own single-repository daily series; discrepancies remain visible. |
| 4 | **GTT-01.D** | ⌕ | **Recover window-level unique-cloner evidence and capture timing.** Search for direct dashboard TXT/image evidence matching HsH's latest 119,670-clone window (2026-11-10–2026-11-23), especially its deduplicated 14-day unique-cloner count. Search other HsH snapshots for missing unique-cloner totals or capture timestamps where worthwhile. | Directly sourced unique-cloner totals/capture times, or a precise gap record. | Each value is directly evidenced; daily unique counts are not substituted. Unrecoverable fields are explicitly marked unknown. |
| 5 | **GTT-01.E** | ▣ | **Record the verified tranche.** Append source-matched observations and provenance to the historical-observation catalogue; update the source inventory/disposition and retain exact blob/commit identities. Do not put dashboard observations or planning notes into the clone-event JSONL. | Updated historical-observation catalogue with evidence states and unresolved gaps. | All results from A–D are durably represented without overwriting earlier observations or collapsing repository-specific records. |
| 6 | **GTT-01.F** | ✓ | **Independent verification and readback.** Re-fetch the changed catalogue and tick ledger; independently recalculate CSV sums, check observation windows, repository mappings, duplicate identities, and all source pointers. Inspect the final ticker position. | Verified commit/blob receipts and a concise QC result. | Readback matches the intended content; arithmetic and source identities pass or exceptions are explicitly retained. |
| 7 | **GTT-01.G** | ⇢ | **Tock gate / deliberate transition.** Decide whether the accessible historical inventory is adequate to begin internal attribution. Carry unresolved gaps forward explicitly; do not demand impossible completeness. | Close GTT-01 and open GTT-02, or retain GTT-01 with a specific remaining cursor. | Transition is justified by the evidence state and next work is clearly named. |

## Planned path and live ticker

Operation order is left to right:

**Inventory → identity mapping → arithmetic/window reconciliation → unique-cloner/capture recovery → record → verify → transition gate**

The first four operations are separate investigations, so the four repeated `⌕` glyphs are intentional. Their distinct identities are GTT-01.A through GTT-01.D.

**Ticker rule:** `@` marks the next unfinished operation and is not itself an operation. After each Tick is completed, recorded and checked, move `@` to the next glyph and retire the completed glyph. Do not advance merely because a chat turn or tool call occurred. `⇢` is a deliberate decision point, not routine punctuation.

## Handoff to later Tocks

- **GTT-02:** use the canonical `CLONE_LEDGER.jsonl` and supporting telemetry to classify actual internal clone-generating activity. Separate explicit git clone, Actions checkout/materialization, API/connector access, archive download, cached workspace and unknown provisioning. Do not duplicate WH-01 work or take over Tern's coordinator role.
- **GTT-03:** compare matched-window GitHub Traffic observations with the evidenced internal-event range; calculate internal contribution and external/unexplained residual bounds. Keep clone count distinct from unique cloners.
- **WH-01 dependency:** Tern retains project-wide census coordination under HsH issue #1703. The known missing run-ID snapshot/job-fan-out blocker remains separate. It does not prevent GTT-01 historical-source work.

## Initial state

No operation in this ticker has been completed yet. Earlier GTT-01 work remains valid: the thread is already oriented and the initial observation tranche is catalogued. This ticker covers the **next bounded execution sequence**, not a claim that all prior GTT-01 work is undone.

@⌕⌕⌕⌕▣✓⇢
