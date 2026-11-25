# GIT_TRAFFIC — GTT-02 Internal Activity Attribution

> **Small but significant bites. Don't choke, don't nibble.**

**Created:** 2026-11-25
**Status:** PARKED / GTT-02.A–E complete for the bounded primary-window evidence; GTT-02.F decision: retain GTT-02 and defer GTT-03 numerical residual work pending direct Traffic attribution evidence.
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
- All 350 HsH rows are unresolved for Traffic attribution: 279 explicitly set traffic_attribution=UNKNOWN and 71 omit the field; none has a COUNTED or NOT_COUNTED attribution.

### Primary window, 2026-11-10–2026-11-23

- 311 raw HsH rows by timestamp date; 27 explicit revision/supplement rows; 284 remaining rows, including one legacy record without event_id. All 27 revision_of targets were found in the retrieved ledger.
- Of the 311 raw rows, 249 explicitly set traffic_attribution=UNKNOWN and 62 omit the field; none has a COUNTED or NOT_COUNTED attribution. All 311 remain unresolved for Traffic attribution.
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

**NOW — GTT-02.F / ⇢.** Deliberate gate decision: do not calculate internal share or external residual without direct Traffic-attribution evidence and adequate matched-window internal coverage.

**Lane boundary:** This is evidence analysis, not an HsH worker instruction channel, not project-wide WH-01 coordination, and not a replacement for the canonical event ledger or its taxonomy standard.

@⌕↦⌕∑⌕∅▣✓⇢


## GTT-02.A canonical event identity pass — complete — 2026-11-25

### Source integrity and identity normalization

- Read-only source blob: 6ec85e2d767587c6387d7312529d9c87c5c2690f.
- Contents API read returned 563 JSONL rows; all 563 parsed successfully, with zero JSON parse errors.
- HsH subset: 350 raw rows; 349 contain event_id; one legacy row has no event_id and remains an unresolved identity record.
- HsH subset includes 29 rows explicitly marked as revisions/supplements through revision_of or is_revision.
- In the primary Nov 10–23 window: 311 raw HsH rows; 27 explicit revision/supplement rows; all 27 revision_of targets were found in the complete ledger. The remaining 284 rows include one record without event_id and therefore 283 stable base event IDs.
- No duplicate stable event_id was found among the HsH rows or within the Nov 10–23 window.
- All 311 raw rows in the primary window retain traffic_attribution = UNKNOWN.

**A disposition:** COMPLETE for the accessible source snapshot. Revision links and stable IDs are resolved wherever the ledger provides them. The one legacy row lacking event_id remains explicitly unresolved; no replacement ID was invented. Canonical ledger remains untouched.

## GTT-02.B preliminary mechanism aggregation — active

The 284 non-revision Nov 10–23 rows have been assigned a preliminary disjoint mechanism disposition:

| Preliminary bucket | Rows | What the count means |
|---|---:|---|
| Positive Actions checkout evidence | 147 | Checkout-related event records, not clone counts |
| Non-checkout API/connector evidence | 128 | GitHub API/Contents/connector operations, not full clones absent other evidence |
| Workflow/provisioning uncertainty | 6 | 3 failed runs with no job records, 2 possible full clones with mechanism unknown, 1 repository-present/provisioning-unknown |
| Partial file materialization | 1 | Explicitly not a full clone |
| Other checkout-configuration evidence | 2 | Checkout appears in workflow configuration, but exact run/job/materialization is not established |

For the 147 positive checkout-evidence records:
- 120 have complete and unique (repository, run_id, run_attempt, job_id, step_number) keys.
- 27 are missing one or more required key fields.
- Materialization states across the 147: FULL_HISTORY 22; SHALLOW_1 106; UNKNOWN 19.
- Among the 120 complete-key rows, no duplicate checkout key was found.
- All 147 retain traffic_attribution = UNKNOWN.

For all 284 non-revision records, traffic_attribution remains UNKNOWN. The traffic_clone_expected field has values UNKNOWN 155, NO 110 and false 19 in this window. Those are expectation/recording fields, not observed attribution and must not be interpreted as counts of confirmed non-clones.

### Time-quality limitation

Of the 284 non-revision rows, 141 include recorded_at_utc and 143 do not. Many timestamp_precision values explicitly identify scheduler or automation run-start times as batch anchors, with individual API-request times unavailable. Some Actions rows have precise job-log checkout timestamps, while others only have run creation/start times or publisher timestamps. Preserve each row's own timestamp_precision; do not allocate a batch of API operations to a specific Traffic day simply because the batch-start date falls inside the 14-day window.

### Early window coverage

The canonical HsH ledger has 0 rows in the mapped Sep 8–21 and Sep 21–Oct 4 Traffic windows, 2 rows in Oct 21–Nov 3, 6 in Oct 22–Nov 4, 6 in Oct 24–Nov 6, and 311 raw rows in Nov 10–23. Earlier zero-row windows are ledger coverage gaps, not evidence of zero internal activity.

**B next bite:** refine the 147 checkout-evidence records into fully keyed checkout steps, incomplete checkout candidates and configuration-only evidence; inspect whether the two possible-full-clone runs and six uncertain workflow/provisioning records have recoverable job/log evidence. Keep actual Traffic attribution UNKNOWN unless a direct Traffic source can resolve it.


## GTT-02.B mechanism aggregation and direct-job recovery — 2026-11-25

### Revised disjoint disposition of the 284 non-revision HsH records

Direct run/job/log evidence has moved the two previously configuration-only publisher records into the Actions checkout bucket. The #2290 publisher record, already present in the checkout-evidence set with unknown materialization, has also been resolved to a shallow checkout. Five previously observed checkout steps with unknown depth are now confirmed shallow.

| Normalized mechanism bucket | Records | Meaning |
|---|---:|---|
| Actions checkout evidence | **149** | Checkout steps/materialization established by job logs or linked exact Actions run/job evidence; not Traffic clone counts |
| Non-checkout API/connector access | **128** | Explicit GitHub API/Contents/connector operations, not full clones |
| Workflow/provisioning uncertainty | **6** | Three failed runs with no job records; two possible full clones with mechanism unknown; one cancelled run with repository present but provisioning unknown |
| Partial-file materialization | **1** | Explicitly not a full clone |
| Other checkout-configuration-only evidence | **0** | The two former configuration-only records now have exact issue-triggered run/job evidence |

Total: 149 + 128 + 6 + 1 = 284. These are normalized event/evidence records, not counts of Traffic clones. All 284 still have traffic_attribution=UNKNOWN.

### Checkout evidence and key completeness

The revised 149 Actions checkout records comprise 123 complete unique checkout keys and 26 incomplete checkout-key records. Normalized materialization: 22 FULL_HISTORY, 114 SHALLOW_1, 13 UNKNOWN. No duplicate complete checkout key was found after adding the three recovered publisher joins. All 149 retain traffic_attribution=UNKNOWN.

The 128 API/connector records are non-checkout operations. Keep them distinct even when an API-only worker session later triggers a separate publisher workflow. The 6 workflow/provisioning uncertainties and 1 partial-file materialization are separate buckets.

### Five formerly depth-unknown checkout steps: now SHALLOW_1

All five had a successfully observed checkout step. Exact job logs establish fetch-depth: 1:

| Canonical event ID | GitHub run / job | Checkout result |
|---|---|---|
| CL-ACTIONS-HSH-20261120-44838777695-A1-J136641699030-S2-CHECKOUT | Run 44838777695 / job 136641699030 | Step 2 success; PR merge ref; checkout HEAD 3a3c4f0992f8a7b044a48392a3711e5f2f80e34c; completed 2026-11-20 23:43:37.995Z |
| CL-ACTIONS-HSH-20261120-44839250236-A1-J136643274606-S2-CHECKOUT | Run 44839250236 / job 136643274606 | Step 2 success; PR merge ref; checkout HEAD 6a53bccc7e5225eb89fc9da14ec2b67c6cad5a32; completed 23:47:49.406Z |
| CL-ACTIONS-HSH-20261120-44839744044-A1-J136644881062-S2-CHECKOUT | Run 44839744044 / job 136644881062 | Step 2 success; PR merge ref; checkout HEAD a7de313df6358b69394ff9f800b8095b0a210239; completed 23:51:49.465Z |
| CL-ACTIONS-HSH-20261121-44842095993-A1-J136652736704-S2-CHECKOUT | Run 44842095993 / job 136652736704 | Step 2 success; PR merge ref; checkout HEAD 44e17cb3b72f0fb29c47d423603f212fdd2a0293; completed 2026-11-21 00:12:04.668Z |
| CL-ACTIONS-HSH-20261121-44854943704-A1-J136694824827-S2-CHECKOUT | Run 44854943704 / job 136694824827 | Step 2 success; ref main; checkout HEAD 027c68d2b321d0e5edea42ba270202871203841f; completed 02:17:30.923Z |

For the first four, the run object's head_sha is the PR head and differs from the synthetic PR merge-ref checkout SHA by design. Do not treat that as a failed head match. For the fifth, the run event head (64b8a059e58d896c29e9e88c1f0522766af5cca9) differs from the actual main checkout HEAD (027c68d2b321d0e5edea42ba270202871203841f); preserve the observed branch-ref checkout and the difference rather than substituting one SHA for the other. These five checkouts are not Traffic-attribution evidence.

### Three publisher records joined to exact issue-triggered runs and jobs

Issue creation times and Actions run-list timestamps match; each run began seconds after its issue was created. Each job completed successfully. Job logs show actions/checkout@v4, fetch-depth: 1, ref main, and a post-checkout git log -1 SHA equal to the Actions run head_sha:

| Original event | Issue created (UTC) | Actions run / job | Checkout SHA / time |
|---|---|---|---|
| h995-s3-l36-publisher-checkout-issue2276-run-unrecovered | #2276, 2026-11-21 11:55:51Z | Run 44901415508, attempt 1; job 136837917411; step 2 | 1ad874977a9f7aea67736a12348529ece2041e30; 11:57:01.126Z |
| h999-s3-loom-publisher-2289-checkout-unknown-20261121t160227z-001 | #2289, 2026-11-21 16:02:27Z | Run 44922358771, attempt 1; job 136900940230; step 2 | e802589daed4b2c15d01f4237a64a151f1664587; 16:03:43.381Z |
| h999-s3-loom-publisher-2290-checkout-unknown-20261121t162310z-001 | #2290, 2026-11-21 16:23:10Z | Run 44924297359, attempt 1; job 136906880427; step 2 | 15045ac5fab01b95854c3f7fb51d8abcf6345301; 16:24:21.465Z |

The #2276 and #2289 records move from workflow-configuration-only evidence into the Actions checkout bucket. The #2290 record was already in the checkout-evidence set with materialization UNKNOWN; it is now SHALLOW_1 with a complete run/job/step join. These three add two complete keys and resolve one previously incomplete key, yielding 123 complete / 26 incomplete across 149 checkout records. Their Traffic attribution remains UNKNOWN.

### Similar run IDs kept distinct: confirmed checkout versus cancelled no-job run

Two adjacent Nadir refresh-site-discovery Actions runs are distinct:
- Run 45005102072, created 2026-11-22 08:56:03Z, job 137154814208, completed SUCCESS. This is already a separate canonical ledger event, h1016-s3-nadir-refresh-run45005102072-job137154814208-step2-checkout, with actions_run_id=45005102072, job/attempt/step fields, fetch-depth: 1, ref main, checkout HEAD ed37224cff4d1a05179122444aa725703797233d, equal to the run head.
- Run 45005215976, created 2026-11-22 08:57:38Z, completed CANCELLED; Jobs API returned an empty array. This is the separate event h1016-s3-nadir-refresh-run45005215976-no-job-record and remains REPOSITORY PRESENT — PROVISIONING UNKNOWN. The successful preceding run is not evidence that this second run checked out the repository.

### Remaining six workflow/provisioning uncertainties

1. Nov20 run 44838759097: failed; exact Jobs API response empty; no checkout inferred.
2. Nov20 run 44839245358: failed; exact Jobs API response empty; no checkout inferred.
3. Nov20 run 44839737494: failed; exact Jobs API response empty; no checkout inferred.
4. Nov21 run 44950093353: push-triggered conversation-json-content-ci; failed; exact Jobs API response empty; POSSIBLE FULL CLONE — MECHANISM UNKNOWN.
5. Nov21 run 44950696770: same workflow family; failed; exact Jobs API response empty; POSSIBLE FULL CLONE — MECHANISM UNKNOWN.
6. Nov22 run 45005215976: Refresh automatic website docket; cancelled; exact Jobs API response empty; REPOSITORY PRESENT — PROVISIONING UNKNOWN.

Workflow configuration alone is not used to invent checkout steps for these six. The five depth-unknown observed checkouts above and the three issue-publisher joins are separate positive checkout evidence.

### GTT-02.B disposition and C focus

B's normalized aggregation is complete for the 284-row primary window: 149 checkout-evidence records (123 complete unique keys / 26 incomplete; materialization 22 FULL_HISTORY, 114 SHALLOW_1, 13 UNKNOWN), 128 non-checkout API/connector records, six workflow/provisioning uncertainties and one partial-file materialization. The two former configuration-only records now have exact job evidence, so that separate bucket is zero. All 284 retain traffic_attribution=UNKNOWN; no event count is converted into a Traffic clone count.

**GTT-02.B COMPLETE. GTT-02.C ACTIVE.** Recover the remaining 26 incomplete checkout-key records through exact Actions run/job data where available; preserve field-specific UNKNOWNs where direct joins cannot be made. Recheck the six unresolved workflow/provisioning cases only if new direct evidence appears. Do not alter the canonical JSONL or infer Traffic attribution from workflow configuration, checkout depth or publisher outcomes.

@⌕∑⌕∅▣✓⇢


## GTT-02.C evidence-gap recovery close — 2026-11-25

### All 26 incomplete checkout-key joins recovered

Each of the 26 records that remained incomplete after GTT-02.B now has a direct run/job/attempt/step join in this analytical layer. GitHub Actions run attempts are all 1; all listed checkout steps are step 2. Run IDs below are the numeric GitHub Actions run IDs, not any separate automation-runtime UUID that may remain in the canonical row's run_id field.

| Original event / short label | Actions run ID | Job ID | Attempt | Step |
|---|---:|---:|---:|---:|
| Nov14 publisher | 43606323352 | 132481626732 | 1 | 2 |
| H991 Meridian Lean | 44881533266 | 136777678970 | 1 | 2 |
| H991 Meridian site discovery | 44883226975 | 136782851096 | 1 | 2 |
| H991 Meridian publisher | 44883299310 | 136783076046 | 1 | 2 |
| H991 Maintain navigation | 44883226979 | 136782851233 | 1 | 2 |
| H992 L36 Lean | 44887690834 | 136796465197 | 1 | 2 |
| H992 L36 publisher | 44888288139 | 136798288312 | 1 | 2 |
| H992 S4 L48 publisher | 44889705474 | 136802657696 | 1 | 2 |
| H993 L36 publisher | 44891263321 | 136807357552 | 1 | 2 |
| H993 L36 Lean | 44890994775 | 136806603091 | 1 | 2 |
| Issue #2303 publisher | 44949683295 | 136984628888 | 1 | 2 |
| Public-site discovery output f0f466f | 44949450842 | 136984200089 | 1 | 2 |
| Issue #2304 publisher | 44951337554 | 136989705922 | 1 | 2 |
| Issue #2308 publisher | 44959901107 | 137016182454 | 1 | 2 |
| Issue #2319 / H1010 publisher | 44978722725 | 137074291257 | 1 | 2 |
| H1013 Meridian publisher | 44991839320 | 137114543937 | 1 | 2 |
| H1014 Orson publisher | 44994211871 | 137121631292 | 1 | 2 |
| PR #2330 Lean check | 44999734271 | 137138407169 | 1 | 2 |
| PR #2330 Lean check | 45000183363 | 137139788308 | 1 | 2 |
| Issue #2334 publisher | 45000715311 | 137141434695 | 1 | 2 |
| PR #2330 Lean check | 45001461928 | 137143709880 | 1 | 2 |
| H1018 Loom Lean check | 45013871558 | 137181881590 | 1 | 2 |
| H1018 Loom Lean check | 45014315731 | 137183233143 | 1 | 2 |
| H1018 Loom Lean check | 45014721410 | 137184474966 | 1 | 2 |
| H1025 Mercer publisher | 45049752952 | 137292054380 | 1 | 2 |
| H1029 Sable publisher | 45075509612 | 137371728728 | 1 | 2 |

For every row, the run ID and attempt were confirmed from the run object; the job ID was confirmed in that run's Jobs API result; and step 2 was identified as the completed checkout step in the job record. Where the original event used a runtime UUID in run_id, the numeric Actions run ID is kept as a separate normalized key component; the canonical JSONL is not edited.

### Three publisher joins already completed before the 26-row recovery

These three additional events are also keyed:
- Issue #2276: run 44901415508, attempt 1, job 136837917411, step 2; fetch-depth 1, checkout SHA 1ad874977a9f7aea67736a12348529ece2041e30.
- Issue #2289: run 44922358771, attempt 1, job 136900940230, step 2; fetch-depth 1, checkout SHA e802589daed4b2c15d01f4237a64a151f1664587.
- Issue #2290: run 44924297359, attempt 1, job 136906880427, step 2; fetch-depth 1, checkout SHA 15045ac5fab01b95854c3f7fb51d8abcf6345301.

These three resolve the original configuration-only/unknown publisher records described in the GTT-02.B addendum. Combined with the 26 remaining joins and 120 originally complete checkout keys, all **149 Actions checkout-evidence records now have a complete normalized key**.

### Depth and checkout-head corrections from the recovered source logs

The recovered logs resolve the last missing materialization fields:
- The Nov14 publisher event, previously carrying the legacy classification CONFIRMED NOT A FULL CLONE with no checkout_materialization field, has a successful step-2 actions/checkout@v4 log with fetch-depth 1. Checkout SHA: 149f28963ff7b5da00dad09eadbc8fb5cc67aaef at 2026-11-14 14:44:38.707Z. The old classification string is preserved in the canonical ledger; this analytical layer treats materialization as SHALLOW_1 and does not interpret that legacy label as NONE.
- H991 Maintain navigation (run 44883226979, job 136782851233) completed checkout step 2 with fetch-depth 0 and checkout SHA 8b6e91f96165a4bfce76a25a6940fa0002078391 at 2026-11-21 08:10:10.662Z. A later date-tag audit step failed and subsequent steps were skipped. Its repository checkout nevertheless completed; materialization is FULL_HISTORY.
- H991 site-discovery output f0f466f was generated by run 44949450842, job 136984200089, attempt 1. The job began 21:02:47Z and completed 21:05:39Z. It checked out main with fetch-depth 1; post-checkout SHA 53f887a03df1bf4a6ceadfe3b580085b3c723bc7 at 21:05:20.802Z. The same job then committed f0f466f3453cf2c0c7c2ec6ff803efecddf994f5 at 21:05:31Z and pushed it at 21:05:35Z. The Actions run event head was ad0d98a8d35c93b52fc1d0cffb081ccd8ff33659; the actual checkout was the later main head 53f887a..., so preserve the difference.
- The H1013 Meridian publisher (run 44991839320, job 137114543937) checked out main shallowly at SHA f891089dbac8ec634e7729bdf135505b561568f0. The run event head was a90fc0afcb2a058c5b39013e6c542bd4e213bb9b; the job checked out the then-current main head rather than the triggering event head. Preserve both.
- The H1014 Orson publisher (run 44994211871, job 137121631292) checked out main shallowly at SHA 644b23a9f6775e09b5be26d8e7e901adfa34c83e, matching the run head.
- The H1025 Mercer publisher (run 45049752952, job 137292054380) checked out main shallowly at SHA fc0f2f2ccbbff47cfbb309a3b0070b215114995b at 17:31:10.956Z.
- The H1029 Sable publisher (run 45075509612, job 137371728728) checked out main shallowly at SHA efd13307867e0bd826939e1ba89e3edfe6208c99 at 22:04:35.128Z.

The five earlier unknown-depth workflow checkout steps (four PR-merge-ref checkouts and one main checkout), three issue-publisher run joins, and the site-discovery run are also described in the preceding B/C evidence sections. Their successful checkout evidence now resolves the remaining field-specific UNKNOWNs.

### Recomputed normalized checkout-key and materialization result

The 149 checkout-evidence records were reassembled into normalized keys:

(repository, numeric GitHub Actions run ID, run_attempt, job_id, step_number).

Numeric run IDs were taken from actions_run_id when available, the numeric run_id when that was the Actions ID, or the exact event-ID/run-object join above. The independent key audit returns:
- **149 normalized checkout keys**
- **149 unique keys**
- **0 duplicate keys**
- **0 remaining incomplete keys**

Materialization after incorporating the recovered logs:
- **23 FULL_HISTORY**
- **126 SHALLOW_1**
- **0 UNKNOWN**

This is the complete state of recorded Actions checkout materialization within the 149-record event cohort. It is not 149 full clones, not 149 GitHub Traffic clones, and not a source-identity count. Of the 149, 136 explicitly set traffic_attribution=UNKNOWN and 13 omit the field; none is attributed COUNTED or NOT_COUNTED. All 149 remain unresolved for Traffic attribution.

### Six no-job workflow/provisioning records: exact source configuration checked, execution unresolved

The six previously unresolved records were inspected against the workflow file at each run's exact head commit:
- Three failed Nov20 runs 44838759097, 44839245358, 44839737494 and two failed Nov21 runs 44950093353, 44950696770 all point to .github/workflows/conversation-json-content-ci.yml blob d90ca4f8325751607984d8785631dabfa475a300 at the event heads. The file configures a synthetic-conversations job with actions/checkout@v4, followed by setup-python and tests. The exact run Jobs API returned an empty array for each of the five. Thus checkout was configured in the source workflow, but actual job creation/step execution/materialization is unobserved. Preserve the two Nov21 rows as POSSIBLE FULL CLONE — MECHANISM UNKNOWN and the three Nov20 rows as NO_JOB_RECORD_RETURNED / CHECKOUT_UNKNOWN / TRAFFIC_ATTRIBUTION_UNKNOWN. Do not infer checkout completion from the workflow YAML.
- Cancelled run 45005215976 is the Refresh automatic website docket workflow at exact run head 444867d232a2cb5e888f7ff0c600c7e1c4cb9095. The source workflow blob 3aa83d6dd5e2e16fad79628be1d19dc62d6c3f70 configures actions/checkout@v4 with ref main, but its Jobs API returned an empty array and run conclusion is cancelled. The already verified successful run 45005102072/job137154814208 is a distinct run and is not evidence for this cancelled run. Keep 45005215976 as REPOSITORY PRESENT — PROVISIONING UNKNOWN.

No run among these six yields direct proof of a completed checkout, a full clone, or a Traffic-counted clone. The workflow source establishes configuration only.

### GTT-02.C disposition

**GTT-02.C COMPLETE for the bounded primary-window evidence.** All 26 remaining incomplete checkout-key records have a numeric Actions run/job/attempt/step mapping; the two workflow-configuration-only publisher rows and the earlier #2290 row are also directly joined. The normalized checkout-key set is 149/149 unique, with 0 duplicates. Materialization is fully resolved within that positive checkout cohort: 23 FULL_HISTORY and 126 SHALLOW_1. Six separate no-job workflow/provisioning cases remain UNKNOWN at the field level, with exact workflow configuration and empty Jobs API responses recorded above.

**Traffic attribution remains UNKNOWN for all 284 non-revision HsH records.** The canonical JSONL was not changed. Eight of the fourteen Nov10–23 Traffic days have no HsH ledger entries, so the event ledger is not a complete daily internal-operation census. These counts do not support a subtraction, internal-share percentage, or external residual.

**GTT-02.D ACTIVE:** record this bounded source-backed attribution tranche. GTT-02.E will independently verify the normalized keys, six unresolved cases, time treatment and exact artifact readback before the GTT-02.F decision gate.


## GTT-02.D QC correction: distinguish explicit UNKNOWN from absent field — 2026-11-25

A read-only field-presence audit of the canonical JSONL shows that some legacy records omit traffic_attribution rather than storing the literal value UNKNOWN. No row in the audited HsH populations has a positive COUNTED or NOT_COUNTED attribution:

| HsH population | Rows | Explicit traffic_attribution=UNKNOWN | Field absent | Other values |
|---|---:|---:|---:|---:|
| All HsH rows | 350 | 279 | 71 | 0 |
| Nov10–23 raw rows, including revisions | 311 | 249 | 62 | 0 |
| Nov10–23 non-revision base | 284 | 231 | 53 | 0 |
| 149 Actions checkout-evidence records | 149 | 136 | 13 | 0 |

Therefore “unresolved for Traffic attribution” is the correct aggregate description. It does not mean every record literally contains an explicit UNKNOWN field. The absent fields remain semantically unresolved, not zero and not inferred NOT_COUNTED. The canonical JSONL is unchanged.


## GTT-02.E independent verification result — 2026-11-25

The following checks were recomputed from the canonical JSONL Contents response and independently re-read from the GTT-02 analytical artifact:

1. **Raw population and revisions:** 563 JSONL rows parse with zero errors; 350 HsH rows; 311 timestamp-window rows; 27 revision/supplement rows; 284 non-revision base rows. The 27 revisions are not counted as new events.
2. **Disjoint mechanism partition:** 149 Actions checkout-evidence records + 128 API/connector records + 6 workflow/provisioning uncertainties + 1 partial-file materialization = 284. The 128 remainder was inspected; all are API/connector/Contents/Issues/Actions-access operations, with no checkout evidence and no unexplained residual category.
3. **Normalized checkout keys:** 149 checkout-evidence records (147 positive-evidence rows plus 2 publisher records joined from configuration-only status) resolve to 149 distinct tuples of repository, numeric GitHub Actions run ID, attempt, job ID and step number. The independent key check found **149 complete keys, 149 unique, 0 duplicates**. Where canonical run_id is a runtime UUID, the normalized numeric Actions run ID is kept in the analytical layer; the canonical JSONL was not rewritten.
4. **Materialization:** 23 FULL_HISTORY and 126 SHALLOW_1, 0 remaining UNKNOWN in the 149-record checkout cohort. The 14 absent materialization values and 7 explicit UNKNOWNs have been resolved by direct run/job/step evidence and job logs. The five former unknown-depth steps are shallow; the H991 Maintain navigation checkout is full-history; Nov14 and three publisher jobs are shallow; the Nadir #2290 job is shallow. The #2290 checkout SHA transcription is corrected to 15045ac5fab01b95854c3f7fb51d8abcf6345301.
5. **No-job uncertainty:** exactly six records remain: runs 44838759097, 44839245358, 44839737494, 44950093353, 44950696770 and 45005215976. An independent run/job query confirmed all six Jobs API responses are empty. The first five have an exact source workflow revision configuring actions/checkout@v4; the sixth has an exact source refresh-site-discovery workflow configuring actions/checkout@v4. These are configuration facts only; no checkout completion is inferred. The cancelled run 45005215976 is distinct from successful run 45005102072.
6. **Traffic-attribution field coverage:** in the 284 base rows, 231 explicitly store traffic_attribution=UNKNOWN and 53 omit the field; none stores COUNTED or NOT_COUNTED. In the 149 checkout cohort, 136 explicitly store UNKNOWN and 13 omit the field; none has a positive or negative Traffic attribution. This corrects any earlier shorthand that implied every row contains the literal UNKNOWN value.
7. **Daily event-ledger coverage:** base records occur on only 6 of the 14 Traffic-window dates. The eight uncovered dates are 2026-11-10, 11-11, 11-12, 11-13, 11-16, 11-17, 11-18 and 11-19. Absence of rows on those dates is not evidence of zero internal activity.
8. **Exact source readback:** the canonical JSONL remained at blob 6ec85e2d767587c6387d7312529d9c87c5c2690f during this read-only GTT-02 verification pass. The GTT-02 internal attribution artifact and Thread Key have current readback receipts; the live ticker is advanced only after this QC.

**GTT-02.E COMPLETE for the bounded evidence set.** The mechanism partition, checkout identities, materialization states, six no-job cases, field-presence caveat and daily coverage limitation all independently recheck. The core limitation remains: no HsH event has a resolved Traffic COUNTED/NOT_COUNTED attribution, and the event ledger is not a complete daily census across the 119,670-clone window.

@✓⇢


## GTT-02.F transition decision: retain and park; do not open GTT-03 numerical residuals

**Decision: GTT-02 is complete for the accessible, bounded internal-activity evidence and is now PARKED. GTT-03 residual arithmetic is NOT opened.**

The evidence is sufficient to state what the current ledger establishes:
- 284 non-revision HsH evidence records within the Nov 10–23 timestamp window;
- disjoint disposition: 149 Actions checkout-evidence records, 128 API/connector records, six workflow/provisioning uncertainties and one partial-file materialization;
- the 149 checkout records resolve to 149 unique normalized run/attempt/job/step keys, with 23 full-history and 126 shallow materializations;
- six workflow/provisioning cases remain unobserved at the job/checkout level;
- 231 base rows explicitly carry traffic_attribution=UNKNOWN, 53 omit the field; no base row has COUNTED or NOT_COUNTED;
- only six of the fourteen dates have any base event-ledger rows; eight dates have no entries, which is a coverage gap, not zero internal activity.

The evidence does **not** support a numeric internal fraction or external residual:
1. The event ledger has no observed Traffic COUNTED or NOT_COUNTED attribution. A checkout, including a full-history or shallow checkout, is not automatically a Traffic clone.
2. The event ledger is not a complete daily event census across the 119,670-clone Traffic window; eight dates are unrepresented, many recorded times are batch anchors, and some legacy attribution fields are absent.
3. Six run/job cases remain unknown; workflow configuration alone does not show that checkout executed.
4. The 119,670 figure is a historical single-repository clone total for 2026-11-10–11-23. The exact deduplicated unique-cloner total is unknown, conditionally bounded by 6,526–25,011 from the daily unique series; this does not resolve actor or mechanism identity.
5. The connected GitHub interface in this session does not expose the repository Traffic endpoint. The connector rejected direct /traffic/clones access and no dedicated Traffic-read action is available.

### Authoritative Traffic-data access path and temporal limit

GitHub's official REST documentation says repository Traffic data are available for repositories the authenticated user can write to; the clones endpoint returns a total and per-day or per-week breakdown for the **last 14 days**. A fine-grained personal access token, GitHub App user access token, or installation token requires **Administration: read** repository permission for this endpoint. <Cite ref="turn201813search0"/>

This endpoint is therefore a possible route for a future authorized, contemporaneous capture, but a request on 2026-11-25 cannot be assumed to reconstruct the exact historical 2026-11-10–11-23 window. Any future capture must preserve its UTC day boundaries, retrieval timestamp, response bytes/hash, total clone count, total unique count and daily series. Do not share a token or secret in chat; use a local environment variable or an appropriately authorized integration.

### Actions checkout semantics do not decide Traffic attribution

The official actions/checkout documentation states that the default fetch is a single commit, while fetch-depth: 0 fetches all history. This supports the recorded distinction between the 126 shallow and 23 full-history materializations, but the action documentation does not establish that either class is counted as a GitHub Traffic clone. <Cite ref="turn201813search1"/>

### Reopening condition

Reopen this lane only when one of the following becomes available:
- an authorized, direct GitHub Traffic clones response captured for a window that can be matched to the internal event evidence;
- an archived contemporaneous dashboard response/screenshot with the required window-level clone and unique-cloner totals;
- event-level evidence that explicitly resolves Traffic attribution for particular checkout/provisioning mechanisms, with timestamp and repository identity.

A future last-14-day API response can support a new matched window; it cannot retroactively fill the Nov 10–23 internal ledger gaps by itself. Until the evidence hinge is met, preserve this result as a bounded internal activity census with unresolved Traffic attribution. **No numeric internal share or external residual has been calculated.**

**GTT-02.F disposition: RETAIN / PARK GTT-02. GTT-03 NOT OPENED.** The next cursor is await (...) a source-authorized Traffic observation or independently documented attribution evidence.

@…
