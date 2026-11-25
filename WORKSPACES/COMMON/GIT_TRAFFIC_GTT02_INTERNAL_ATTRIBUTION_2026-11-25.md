# GIT_TRAFFIC — GTT-02 Internal Activity Attribution

> **Small but significant bites. Don't choke, don't nibble.**

**Created:** 2026-11-25
**Status:** ACTIVE / GTT-02.A in progress
**Parent lane:** GIT_TRAFFIC, distinct from the main H(s)H theory work
**Primary Traffic source:** Satobloc/HSH_RESOURCES, especially EXPOSURE_STATS/
**Internal event source:** Satobloc/HsH WORKSPACES/COMMON/CLONE_LEDGER.jsonl (read-only)
**Taxonomy reference:** Satobloc/HsH WORKSPACES/COMMON/CLONE_LEDGER_STANDARD.md
**Previous Tock:** GTT-01 CLOSED; see GIT_TRAFFIC_TICK_LEDGER_2026-11-25.md

## Purpose and scope

Determine what internal systems and recorded workflows did during HsH Traffic observation windows, while keeping actual GitHub Traffic clone attribution separate from repository access and materialization evidence.

Primary comparison window: 2026-11-10 through 2026-11-23, matched to the HsH 119,670-clone single-repository CSV. Earlier HsH windows with mapped Traffic observations are secondary comparisons where ledger records exist.

This Tock uses HSH_RESOURCES for historical Traffic observations and the existing HsH clone-event ledger for internal activity evidence. The canonical ledger is read-only. Do not create a competing event ledger, append speculative rows, revise shared taxonomy, set policy for HsH workers, or take over Tern's WH-01 census.

## Epistemic rules

1. A ledger row is an evidence record, not automatically a separate repository operation or clone.
2. A workflow run is not a checkout. A checkout is not automatically a GitHub Traffic clone.
3. API/connector reads, Contents API writes, Actions checkout steps, partial file materializations and unknown provisioning remain separate mechanisms.
4. Known checkout materialization depth is not known Traffic attribution.
5. A revision/supplement linked by revision_of is not a second event. Preserve original event and amendment provenance.
6. Aggregate identifiable Actions checkout steps by repository, run_id, run_attempt, job_id and step_number. Preserve incomplete rows rather than inventing keys.
7. A scheduler/run-start timestamp or batch anchor is not an exact per-request or checkout-step time. Respect timestamp_precision and recorded_at_utc.
8. traffic_clone_expected is a planning/expectation field, not observed Traffic attribution. Only evidence in traffic_attribution can establish that link.
9. UNKNOWN is not zero. An empty Jobs API response is not proof no checkout or clone occurred unless the record supports that narrower conclusion.
10. Unique cloners are not necessarily unique people. Do not infer human-versus-automation identity from the metric.

## Source snapshot and read route

- Canonical JSONL blob: 6ec85e2d767587c6387d7312529d9c87c5c2690f.
- Taxonomy standard blob read in this lane: 98369c8053a1a7bb42bb0f6ae7a3460115754750.
- Ordinary fetch_file returned an empty body for the JSONL. The GitHub Contents API returned its full UTF-8 contents, which parsed as 563 JSONL rows with zero parse errors. No write was made.
- Filter HsH records by repository = Satobloc/HsH. Do not import SAT or HSH_RESOURCES records into HsH counts.

## Initial HsH ledger inspection

### Overall HsH population

- 350 raw HsH rows; 349 have stable event_id. One legacy row lacks event_id and remains an unresolved identity record.
- 29 rows have explicit revision/supplement links via revision_of or is_revision.
- Every HsH row currently has traffic_attribution = UNKNOWN.

### Primary window, 2026-11-10–2026-11-23

- 311 raw HsH rows by timestamp date; 27 explicit revision/supplement rows; 284 remaining rows, including one legacy record without event_id. All 27 revision_of targets were found in the retrieved ledger.
- All 311 rows, including supplements, have traffic_attribution = UNKNOWN.
- The timestamp date filter is preliminary window alignment. Some records use automation/scheduler run-start values as batch anchors; many do not expose individual API-request times. No per-day clone attribution is inferred.

### Disjoint preliminary disposition of the 284 non-revision rows

| Evidence bucket | Rows | Interpretation |
|---|---:|---|
| Positive Actions checkout evidence | 147 | Checkout-related evidence records, not Traffic clone counts |
| Non-checkout API/connector evidence | 128 | API/Contents/connector access, not full clones unless separate evidence establishes otherwise |
| Workflow/provisioning uncertainty | 6 | Three failed runs with no job records; two possible full clones with mechanism unknown; one repository-present/provisioning-unknown record |
| Partial file materialization | 1 | Explicitly classified as not a full clone |
| Other checkout-configuration evidence | 2 | Workflow configuration suggests checkout, but run/job/materialization details are not established |

Within the 147 positive checkout-evidence records:
- 120 have a complete and unique repository/run_id/run_attempt/job_id/step_number key.
- 27 lack one or more required key fields.
- Recorded materialization states: 22 FULL_HISTORY, 106 SHALLOW_1, 19 UNKNOWN.
- Every checkout-evidence record remains traffic_attribution = UNKNOWN.

These counts describe ledger evidence, not Traffic clones. The 120 keyed checkout steps are an internal operational measure only. The 27 incomplete records remain separate and unkeyed.

### Other HsH Traffic windows

| Traffic window | HsH ledger rows by timestamp date | Limitation |
|---|---:|---|
| 2026-09-08–09-21 | 0 | No rows in this ledger; not evidence of no internal activity |
| 2026-09-21–10-04 | 0 | No rows in this ledger; not evidence of no internal activity |
| 2026-10-21–11-03 | 2 | Checkout/materialization evidence; attribution UNKNOWN |
| 2026-10-22–11-04 | 6 | Checkout/materialization evidence; attribution UNKNOWN |
| 2026-10-24–11-06 | 6 | Checkout/materialization evidence; attribution UNKNOWN |
| 2026-11-10–11-23 | 311 raw / 284 non-revision | Primary comparison window; attribution UNKNOWN |

The ledger's first HsH record is dated 2026-09-07. Absence of rows in an earlier Traffic window means only that no relevant record is currently present in this ledger for that date range; coverage completeness is not established.

## Tick assignments

| Order | Tick ID | Glyph | Operation | Required result | Exit condition |
|---:|---|:---:|---|---|---|
| 1 | GTT-02.A | ⌕↦ | Normalize canonical event identity and provenance. Resolve revision_of links, missing event IDs, repository identity, event timestamps and record-versus-operation distinctions. | Stable event identity map with original row locators and revision lineage. | Every in-scope row maps to a canonical event, amendment or explicit unresolved identity. |
| 2 | GTT-02.B | ⌕∑ | Aggregate internal operation evidence by mechanism and Traffic window. Deduplicate complete Actions checkout keys; separate materialization depth, API/connector access, partial materialization, workflow uncertainty and possible full clones. | Windowed mechanism table with raw rows, normalized identities, checkout-key counts and timestamp-quality limits. | Aggregates have explicit grain and do not treat rows, runs, jobs, checkouts or materializations as Traffic clones. |
| 3 | GTT-02.C | ⌕∅ | Recover missing checkout/job/provisioning evidence where direct run/job logs or workflow records can resolve it. Prioritize two possible-full-clone events and 27 incomplete checkout-key records. | Resolved evidence or a field-specific UNKNOWN disposition. | No speculative checkout inference from absent Jobs API records. |
| 4 | GTT-02.D | ▣ | Record the bounded internal-attribution evidence tranche in this lane's ledger and link exact canonical sources. | Durable GTT-02 record; canonical event ledger unchanged. | Counts, classifications, provenance and unknowns represented. |
| 5 | GTT-02.E | ✓ | Independently verify identity joins, counts, aggregation grain, timestamp treatment and readback. | QC result and commit/blob readback. | Recomputed counts match; no supplement is double-counted. |
| 6 | GTT-02.F | ⇢ | Decide whether internal activity evidence is adequate for matched-window residual estimation in GTT-03. | Open GTT-03 or retain GTT-02 with a specific blocker. | No residual is calculated unless event evidence and Traffic windows can be compared without invented mapping. |

## Current operation

**NOW — GTT-02.A / ⌕↦.** Build the canonical event identity map. Resolve the 27 explicit revision rows in the Nov 10–23 window to original IDs, preserve the one legacy row without event_id, and normalize 120 fully keyed checkout steps plus 27 incomplete checkout-related records. Keep the original ledger read-only.

**Lane boundary:** This is evidence analysis, not an HsH worker instruction channel, not project-wide WH-01 coordination, and not a replacement for the canonical event ledger or its taxonomy standard.

@⌕↦⌕∑⌕∅▣✓⇢