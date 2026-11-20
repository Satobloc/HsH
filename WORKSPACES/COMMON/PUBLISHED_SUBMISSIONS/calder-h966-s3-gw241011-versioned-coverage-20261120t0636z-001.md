# H966:s3 | Version-scoped GWOSC product coverage and negative-evidence gate

**Status:** SOURCE_SNAPSHOT_VERIFIED / LEAN_EXACT_HEAD_PASS / NOT_ANALYSIS_READY / P2_HOLD

**Provenance:** Calder ring label, assistant reconstruction in the scheduled run. No authenticated historical Calder instance or current Calder conversation is asserted. The historical role source is Calder's September 12 self-report in WORKSPACES/COMMON/CHECKINS.md, not a signed Nathan-authored specialist charter. Its relevant remit is empirical angle-clustering, null design, independent-unit discipline, and source/provenance separation.

## 1. Substantive improvement

The earlier H962:s4 report recorded the GW241011 O4-v1 legacy strain locators and the empty API-v2 strain-file/timeline responses. This run resolves the semantic scope of those responses and turns the finding into a reusable source-readiness gate.

The key distinction is:

- Zero rows is a result for one exact endpoint and its declared scope.
- It is not automatically evidence that no products exist for the event.
- Not exposed by this endpoint is not absent from every release.
- A locator is not acquired bytes, and acquired bytes are not analysis-ready data.

The proposed ScopedNegativeEvidence rule permits an absence claim only when the exact event/catalog version, product scope, authoritative inventory, successful response, and complete pagination are all bound. A complete empty response for a narrower endpoint remains endpoint-scoped.

## 2. Primary-source snapshot: GW241011

Primary sources inspected on 2026-11-20:

- [O4 Discovery Papers v1 event page](https://gwosc.org/eventapi/html/O4_Discovery_Papers/GW241011_233834/v1/)
- [O4 Discovery Papers v1 event JSON](https://gwosc.org/eventapi/json/O4_Discovery_Papers/GW241011_233834/v1/)
- [GWOSC API v2 event-version v1](https://gwosc.org/api/v2/event-versions/GW241011_233834-v1?format=api)
- [GWOSC API v2 event-version v2](https://gwosc.org/api/v2/event-versions/GW241011_233834-v2?format=api)
- [API v2 v1 strain-file endpoint](https://gwosc.org/api/v2/event-versions/GW241011_233834-v1/strain-files?format=api)
- [API v2 v1 timelines endpoint](https://gwosc.org/api/v2/event-versions/GW241011_233834-v1/timelines?format=api)
- [API v2 v2 strain-file endpoint](https://gwosc.org/api/v2/event-versions/GW241011_233834-v2/strain-files?format=api)
- [API v2 v2 timelines endpoint](https://gwosc.org/api/v2/event-versions/GW241011_233834-v2/timelines?format=api)
- [O4 Discovery Paper data-release documentation](https://gwosc.org/o4_eventdata_docs/)
- [GW241011/GW241110 paper data-and-code record, Zenodo 17343574](https://zenodo.org/records/17343574)

### Release and detector identity

| Field | O4 Discovery Papers v1 | GWTC-5.0 v2 |
|---|---|---|
| Event | GW241011_233834 | GW241011_233834 |
| Catalog/event version | O4_Discovery_Papers v1 | GWTC-5.0 v2 |
| Run | O4b | O4b |
| GPS event time | 1412725132.9 s | 1412725133.0 s |
| Detectors | H1, V1 | H1, V1 |
| GraceDB ID | S241011k | S241011k |

The event-version timestamps differ by 0.1 seconds. This is a versioned metadata difference, not an uncertainty interval or measured physical delay.

The O4-v1 legacy event JSON lists eight analysis-ready strain-file locators: H1/V1 times 4096/16384 Hz times GWF/HDF5, each 4096 seconds, with GPS start 1412722688. The event occurs 2444.9 seconds into the 4096-second files. The v1 event page's generic frame-channel list mentions L1 but explicitly says L1 was not observing; the event-version detector set and strain-file inventory are H1/V1. Do not infer detector participation from a generic channel list alone.

### Endpoint-scoped negative evidence

The API v2 strain-files endpoint is explicitly described as returning strain-file early releases for a specific event version. For both O4-v1 and GWTC-5.0-v2, its response reports results_count=0, num_pages=0, next=null, and an empty results array. The corresponding timeline endpoints also return zero rows with no next page.

These are complete empty responses for the named endpoint scopes. They establish that those API v2 early-release and timeline collections expose no rows for these event versions. They do not establish that the event has no strain products anywhere: the O4-v1 legacy event page and JSON list eight actual strain-file locators.

The O4 release documentation warns that the release may contain preliminary data-quality segments and calibration, with updated versions included in catalog releases when available. Its GW241011-specific section says the 4096-second H1/V1 strain is aligned with full O4b run data releases and provides 16 kHz and 4 kHz HDF/GWF products. Event version, strain-file locator, calibration version, PSD, data-quality segments, and covariance therefore remain separate provenance dimensions.

### Zenodo references are not interchangeable

The O4-v1 event JSON contains two different Zenodo references:
- Its data_url points to record 17343574, the 4.1 GB paper data/code archive.
- Its “Data products in Zenodo” DOI link is 10.5281/zenodo.17343573.

Record 17343574 describes posterior samples, parameter-estimation results, population/simulation data, and notebooks; some notebooks require additional data not included by default. The distinct 17343573 DOI was not independently resolved in this run. These identifiers are not silently conflated. No 4.1 GB archive or raw strain file was downloaded.

## 3. New readiness contract

The proposed analysis-readiness conjunction is:

event version bound AND product version bound AND locator bound AND bytes acquired AND SHA-256 verified AND calibration version bound AND PSD bound AND data-quality segments bound AND covariance bound.

Current O4-v1 status:

| Requirement | Status |
|---|---|
| Event/catalog version | Bound |
| Product release version | Bound to O4 Discovery Papers v1 |
| Strain-file locators | Found |
| Raw file bytes | Not acquired |
| SHA-256 of acquired bytes | Not verified |
| Calibration version | Not bound |
| PSD version | Not bound |
| Data-quality segment version | Not bound |
| Joint covariance | Not bound |
| Analysis readiness | NOT READY |

This is a workflow gate, not a physical model or an adopted BEDROCK rule. It prevents a source locator or empty endpoint response from being promoted into a fit-ready dataset.

## 4. Lean formalization

A source-bound finite metadata module was added to the existing Calder Lean project, reusing its pinned Lean 4.34.0 / Lake 5.0.0 / Mathlib v4.34.0 environment. Local lean, lake, and elan are not installed, so the existing GitHub Actions runner was the build path. No new dependency, standalone toolchain, fork, subscription, or tool was created.

- [Draft PR #2167](https://github.com/Satobloc/HsH/pull/2167), stacked on Calder PR #1515; not merged and not a main-branch change.
- Pre-write HsH main head: 4573b5415ce9c1b5002d8b010357a27e88abc72f. The proof lives on research/calder-versioned-product-coverage-20261120t0636z, based on research/calder-kelvin-bandlimited-sampling-20261109t0436z, the #1515 branch. No main merge occurred.
- Module: FORMAL_VERIFICATION/HsHVerification/CalderVersionedProductCoverage.lean.
- Current exact head: 816db587e6682263f7b11fbac70d418513f02839.
- Earlier exact-head run #44690456109 failed because decide could not synthesize a Decidable instance for an existential proposition. The source was corrected to use a finite Boolean List.any witness.
- Corrected exact-head run #44691120985 PASSED: job #136136885402, full Lake build 8,959 jobs; the new module built at 8,931/8,959.
- Actual #eval output: 8, 0, 0, 0, 0, 24449, 1, false. These encode eight v1 locators, zero rows on the four API-v2 list endpoints, a 2444.9-second file offset, a 0.1-second event-version timestamp difference, and analysis readiness false.
- All five theorem-specific #print axioms outputs report that each theorem depends on no axioms.
- The module contains no sorry or admit. Tests and lint were disabled; no global axiom audit was run.

Lean verifies only these encoded finite statements. It does not authenticate GWOSC responses, establish completeness beyond the named endpoint scope, validate raw strain bytes or calibration, or establish physical/H(s)H truth.

The PR's automatic Vercel preview deployment was blocked by the daily free deployment limit. No upgrade or manual deployment retry was attempted. This does not establish or negate the GitHub Actions Lean result.

The Calder formalization README calls for a source-linked Factory Floor handoff after a Lean pass. The current Factory Floor README/TODO also imposes a geometry-first admission gate requiring a precise geometric plot and independent hostile review. This metadata theorem supplies neither; no Factory Floor issue or direct write was attempted. An HsH-side packet was created as LEAN_VERIFIED / FACTORY_INTAKE_PENDING / GEOMETRY_NOT_SUPPLIED / NOT_FACTORY_FLOOR_ELIGIBLE; it is not a Factory Floor submission: [pending packet](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/CALDER/FACTORY_HANDOFF_PENDING_H966_S3_VERSIONED_PRODUCT_COVERAGE.json).

## 5. Prediction and falsification boundary

This is a source/product-readiness audit, not a selected P2 physical system.

| Test element | Current status |
|---|---|
| Standard comparator | GR/BBH waveform analysis is the relevant standard family; no new comparison run |
| H(s)H forward map | Undefined for this event |
| Shared parameters and calibration | Not frozen |
| Calibration/holdout split | Not established |
| Predicted observable | None instantiated |
| Independent holdout | None identified |
| Numerical falsification threshold | Not instantiable |

No raw strain, PSD, calibration, or data-quality segments were acquired. No waveform fit, physical calculation, H(s)H prediction, independent measurement, or falsification threshold is claimed. GW241011 is used only as a public source/API metadata test case, not selected as P2. P2 remains HOLD.

## 6. Project and continuity boundaries

- P0 Code Grurple remains ACTIVE.
- P1 cognition remains OVERDUE / NOT READY / Orson-owned.
- P2 measured geometry remains HOLD.
- P3 full theory remains INCOMPLETE.
- November 9 minor-paper gate remains missed; November 30 major-paper and December 14 full-theory gates remain separate; no gate advanced.
- FIE last review November 10; next due November 24. No premature rereview.
- The h966:s2 Aldus optional P0/WH-02 packet was read from Calder INBOX. It was created after this :36 run had started; it is repository-only optional context, not direct-thread delivery.
- The PWH task graph remains 18 records against 16 declared branches (5 completed, 12 active, 1 blocked); no graph mutation. WH-02 remains Calder/authorized-maintainer-owned; no rebase or PR #1710 mutation.
- Mersearch was not callable; the four existing request lanes remain occupied/requested and untouched. No new request, overwrite, or retry.
- HSH_RESOURCES was inspected only at its root documentation and repository-metadata boundary; no private payload was opened and no permission was changed.
- Existing Math Hopper #578, Whirligig Kernel 0, Calder PR #1515, and related source-lineage/CountStage PRs #1823/#1828 were checked. SciSpace is available but unnecessary. No new tooling, dependency, fork, subscription, or expense.
- The unrelated-reading break was completed in the preceding h965 run; next cursor remains SAT archive line 2121. No duplicate break.

## 7. Scheduler and authorship

Nominal selection is h966:s3, sequence 4833, ring index 7: Calder; next ring label Hale. Selection is a deterministic lease label, not authentication of a historical instance or thread.

The existing :36 automation remains enabled under its original task ID 6a9f52b69ec08191b0a2ba24a074f781, exact hourly DTSTART 20261001T143600 in America/New_York, with prompt and phase unchanged. Its current provider run 821af9ab-4b44-832c-b046-017ca117e578 started at 06:39:50.747Z, remained IN_PROGRESS with chat_ref=null at last check, and its cached result belonged to the previous h965:s3 run, stale for this occurrence.

The existing :48 task remains enabled under ID 6aa6c3bc02b48191b0a2ba24a074f781, exact hourly DTSTART 20261001T144800 in America/New_York. Hale's h966:s4 run dca9b552-e6fc-8329-8280-7dffb0b67d02 started at 06:52:04.260825Z and was IN_PROGRESS with chat_ref=null when checked. The repository-only [Hale packet](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-20T0701Z_from_s3_calder_to_s4_hale_POSTSTART_OPTIONAL_GWOSC_VERSIONED_PRODUCT_COVERAGE.md) was created at 07:01Z, after start, and indexed in Hale INBOX and Common HANDOFFS. It is POSTSTART_OPTIONAL_CONTEXT_ONLY; no direct-thread delivery, consumption, acknowledgment, assignment, review request, response obligation, or ownership transfer is claimed.

The global automation inventory contains exactly five Workshop Relay tasks: :00, :24, :36, and :48 enabled; :12 disabled. No sixth Workshop Relay task exists.

No task ID, schedule, cadence, prompt, phase, or enabled-state change; no sixth task, signet, or conversation rename. No SAT-O or Blockwave equation changed, no BEDROCK theory promoted, and no Orson work reassigned.

**Return pin:** H966:S3 / CALDER-LABEL-ASSISTANT-RECONSTRUCTION / GW241011-VERSIONED-PRODUCT-COVERAGE / SCOPED-NEGATIVE-EVIDENCE-GATE / PR2167-LEAN-EXACT-HEAD-PASS / FACTORY-HANDOFF-PENDING-GEOMETRY-GATE / P2-HOLD / NO-PHYSICAL-FIT / TASKS-UNCHANGED / NO-SIXTH-TASK
