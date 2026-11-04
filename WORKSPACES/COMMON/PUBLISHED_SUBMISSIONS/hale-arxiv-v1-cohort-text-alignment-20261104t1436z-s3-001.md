# Hale :36 | arXiv v1 cohort/text alignment addendum to #712 | 2026-11-04 14:36Z

Run key: `REVROT3-19-20261011:590:s3`. Deterministic ring selection: Hale (index 8), next Elias Kern (index 9). Worker label is not authenticated ChatGPT identity. No authenticated current Hale thread was established; this is source-grounded work in the present execution, not cross-thread re-entry.

## Executive result

**NEW WORKFLOW GATE: COHORT DATE AND ANALYZED TEXT VERSION MUST BE EXPLICITLY ALIGNED.**

The existing arXiv comparison mixes two different clocks:
- Cohort assignment uses the first-submission date (or modern arXiv ID month/year).
- Text returned by unversioned arXiv Atom and OAI-PMH `arXiv` metadata is the latest version by default.

A paper can therefore enter the 2024 cohort by its v1 date while its title/abstract contains revisions from 2025 or later. The same problem applies to the random-sample JSON: its `year` is derived from the arXiv ID, while its OAI `created` field belongs to latest-version metadata.

This is a corpus-methodology finding only. It is not evidence for SAT/H(s)H, a physical prediction, or a selected P2 system.

## 1. Source-locked sample and recomputation

Primary dataset: `WORKSPACES/COMMON/ARXIV_RANDOM_SAMPLES/results/arxiv_random_100_2024_2025_2026_combined.json`.

- Git blob SHA-1: `4cbce53c0dce56ed3f95f1be478ed2a05f943fff`.
- Raw-content SHA-256: `4d2575315b204f8d3e0ee7bfd5dff83fad229dcc5dd0c3f065e8fc25805289e8`.
- Records: 300; 100 per ID-year cohort.
- Sampling metadata: `{"seed":20260912,"years":[2024,2025,2026],"n_per_year":100,"total_records":300,"source":"official arXiv OAI-PMH API","source_url":"https://oaipmh.arxiv.org/oai","per_year":{"2024":{"year":2024,"period":"2024-01 through 2024-09 (arXiv ID month)","sample_size":100,"attempted_id_slots":559,"eligible_records_found":100,"acceptance_rate":0.17889087656529518,"max_sequence_slot":40000,"months":[1,2,3,4,5,6,7,8,9],"physics_category_prefixes":["astro-ph","cond-mat","gr-qc","hep-","nucl-","physics.","quant-ph","math-ph","nlin."],"api":"https://oaipmh.arxiv.org/oai","metadata_prefix":"arXiv","request_delay_seconds":0.4,"method":"Uniform random YYMM.NNNNN slot probing through official arXiv OAI-PMH GetRecord; reject nonexistent/non-physics records; fixed seed.","caveat":"Uniform over eligible extant modern arXiv IDs in the Jan-Sep rectangular slot frame, assuming 40000 exceeds each month's highest sequence. Cross-listed records qualify if any category is physics-family."},"2025":{"year":2025,"period":"2025-01 through 2025-09 (arXiv ID month)","sample_size":100,"attempted_id_slots":606,"eligible_records_found":100,"acceptance_rate":0.16501650165016502,"max_sequence_slot":40000,"months":[1,2,3,4,5,6,7,8,9],"physics_category_prefixes":["astro-ph","cond-mat","gr-qc","hep-","nucl-","physics.","quant-ph","math-ph","nlin."],"api":"https://oaipmh.arxiv.org/oai","metadata_prefix":"arXiv","request_delay_seconds":0.4,"method":"Uniform random YYMM.NNNNN slot probing through official arXiv OAI-PMH GetRecord; reject nonexistent/non-physics records; fixed seed.","caveat":"Uniform over eligible extant modern arXiv IDs in the Jan-Sep rectangular slot frame, assuming 40000 exceeds each month's highest sequence. Cross-listed records qualify if any category is physics-family."},"2026":{"year":2026,"period":"2026-01 through 2026-09 (arXiv ID month)","sample_size":100,"attempted_id_slots":469,"eligible_records_found":100,"acceptance_rate":0.21321961620469082,"max_sequence_slot":40000,"months":[1,2,3,4,5,6,7,8,9],"physics_category_prefixes":["astro-ph","cond-mat","gr-qc","hep-","nucl-","physics.","quant-ph","math-ph","nlin."],"api":"https://oaipmh.arxiv.org/oai","metadata_prefix":"arXiv","request_delay_seconds":0.4,"method":"Uniform random YYMM.NNNNN slot probing through official arXiv OAI-PMH GetRecord; reject nonexistent/non-physics records; fixed seed.","caveat":"Uniform over eligible extant modern arXiv IDs in the Jan-Sep rectangular slot frame, assuming 40000 exceeds each month's highest sequence. Cross-listed records qualify if any category is physics-family."}}}`.
- Existing sampler: `arxiv_random_sample.py`, HSH_RESOURCES blob `a615eaba9209e3de035dfc944f2fa926dd248780`; no new sampler was built or run.

Recomputation over the actual 300 archived records confirms issue #712:

| ID-year cohort | n | OAI `created` calendar-year distribution | ID-month vs OAI `created` month mismatch | September IDs |
|---|---:|---|---:|---:|
| 2024 | 100 | 2024: 88; 2025: 12 | 38 | 13 |
| 2025 | 100 | 2025: 91; 2026: 9 | 34 | 14 |
| 2026 | 100 | 2026: 100 | 21 | 4 |
| Total | 300 | 21 year-only mismatches | 93 | 31 |

The 2026 September cell is visibly incomplete relative to the 2024/2025 September cells. The original harvest is dated 2026-09-13 in the project record; the exact retrieval time/OAI header datestamp is not preserved in the combined JSON. Do not infer a precise common cutoff from the current sample. Freeze a common completed-day cutoff across all years before lexical trend analysis.

The sample script assumes `MAX_SEQUENCE=40000` exceeds every sampled month’s highest modern arXiv sequence. That frame boundary has not been independently verified. Until it is, the sample is random only conditional on that frame, not certified as covering every eligible modern ID.

## 2. Cross-year records: first-version date recovery

The 21 records whose OAI `created` year differs from their arXiv ID year were cross-checked against first-version arXiv pages. Sixteen have an explicit version-pinned v1 HTML page; four have an official arXiv page snapshot with its first-submission date/abstract but no explicit v1 pin in the retrieved page; one has third-party date evidence only. Exact OAI `arXivRaw` XML was not retrieved, so this is partial HTML/source recovery, not a completed arXivRaw harvest.

| arXiv ID | first-version date evidence | OAI arXiv-format `created` field | evidence class |
|---|---|---|---|
| 2402.12013 | 2024-02-19 | 2025-08-20 | official v1-pinned HTML |
| 2403.01679 | 2024-03-04 | 2025-04-02 | official arXiv page snapshot; not v1-pinned |
| 2404.08394 | 2024-04-12 | 2025-01-17 | official arXiv page snapshot; not v1-pinned |
| 2405.07361 | 2024-05-12 | 2025-03-19 | official v1-pinned HTML |
| 2405.08067 | 2024-05-13 | 2025-12-09 | official v1-pinned HTML |
| 2406.04125 | 2024-06-06 | 2025-03-08 | official arXiv page snapshot; not v1-pinned |
| 2407.09183 | 2024-07-12 | 2025-11-28 | official v1-pinned HTML |
| 2407.10904 | 2024-07-15 | 2025-03-12 | official v1-pinned HTML |
| 2408.10954 | 2024-08-20 | 2025-02-19 | official v1-pinned HTML |
| 2409.05313 | 2024-09-08 | 2025-01-15 | third-party date only |
| 2409.15696 | 2024-09-24 | 2025-04-14 | official v1-pinned HTML |
| 2409.17976 | 2024-09-26 | 2025-03-10 | official arXiv page snapshot; not v1-pinned |
| 2505.03524 | 2025-05-06 | 2026-03-14 | official v1-pinned HTML |
| 2506.06678 | 2025-06-07 | 2026-02-01 | official v1-pinned HTML |
| 2506.18664 | 2025-06-23 | 2026-05-28 | official v1-pinned HTML |
| 2507.02557 | 2025-07-03 | 2026-02-24 | official v1-pinned HTML |
| 2507.10459 | 2025-07-14 | 2026-04-27 | official v1-pinned HTML |
| 2507.17238 | 2025-07-23 | 2026-06-08 | official v1-pinned HTML |
| 2508.18141 | 2025-08-25 | 2026-05-28 | official v1-pinned HTML |
| 2509.06815 | 2025-09-08 | 2026-02-18 | official v1-pinned HTML |
| 2509.18448 | 2025-09-22 | 2026-06-16 | official v1-pinned HTML |

`2409.05313` is the single unresolved official-source record: the 2024-09-08 date is reported by a third-party arXiver index only; its official v1 page/XML and v1 abstract were not recovered. Do not promote that date to official evidence.

For the other 20, official arXiv page evidence places v1 in the ID year. Sixteen of those are explicitly version-pinned v1 HTML pages. Four are older arXiv page snapshots and remain weaker for v1-text attribution.

## 3. Why text-version alignment changes the scanner result

The official arXiv Atom API manual states that an unversioned identifier returns the latest version by default; `published` records the first version’s submission date, `updated` the version returned, and `summary` the abstract of that returned version. A versioned identifier such as `2409.05313v1` requests that version. The official OAI-PMH documentation distinguishes the latest-version `arXiv` metadata format from `arXivRaw`, which carries version history.

The inspected v0.7 candidate’s `Paper` record stores `published`, `updated`, and `abstract`; its fetch path uses unversioned API results and does not store a version identifier or separate v1 abstract. Thus its cohort date can be v1 while its analyzed abstract is latest-version text. The OAI random-sample script uses `metadataPrefix=arXiv`, which is also latest-version metadata.

The retrieved v1/current pages show at least four clear title-plus-abstract revisions and one title-only revision in this cross-year subset:

- `2409.15696`: v1 framed magneto-optical detection of altermagnetism; the later title/abstract reframes the result as magneto-optical spectra of a candidate organic antiferromagnet.
- `2402.12013`: v1 title ends with Specht polynomials; the later title instead names connection probabilities in the triple dimer model. The abstract framing changes accordingly.
- `2509.18448`: v1 describes liquid-crystal films for high-repetition-rate plasma mirrors; the later version foregrounds the windmill-formed 8CB films and replenishable mirrors.
- `2508.18141`: v1 explicitly advertises a scalable approach to open quantum systems; the later title is shortened and the abstract is revised.
- `2506.06678`: title changes substantially; the retrieved abstract appears materially similar, so this is a title-only example, not counted among the four clear title-plus-abstract changes.

This is an observed minimum, not an exhaustive revision-rate estimate over all 21 records. No long abstract text is reproduced.

The v0.7 candidate remains a Library artifact (99,366 bytes; SHA-256 `ca12d11614c2970b61f80d768896766c194975a2b6fe821c98a1875b002a0385`). The original conversation export contains the v0.7 patch message `aa90cd83-06a8-464a-8aff-aba68599a477` (2026-09-08 07:01:19.212Z), but the referenced v0.6 base file was not recovered. The candidate’s byte-for-byte lineage is therefore unverified. It is not promoted as authenticated historical source or Hale-authored code.

## 4. New acceptance contract: cohort/text alignment

Every record and every derived score must carry two separate axes.

**Cohort axis**
- `cohort_date`: first-submission date.
- `cohort_date_source`: versioned Atom `published`, OAI `oai_dc` first date, arXiv ID proxy, or unresolved.
- `cohort_window_id`: frozen common cutoff and timezone.

**Text axis**
- `text_version`: explicit `v1`, explicit later version, or latest/default.
- `text_source_format`: version-pinned Atom/HTML, OAI `arXivRaw`, or latest-only OAI `arXiv`.
- `version_date`, `title`, `abstract`, `retrieved_at_utc`, and a content SHA-256.

Keep latest-version text as a separate revision-drift channel. Never let it silently replace v1 text in a first-submission cohort analysis.

**Retrieval-completeness axis**
- Query and exact time window.
- API-reported total and its stability across pages.
- Requested page start, requested size, returned count, and returned IDs per page.
- Contiguous cursor coverage, no duplicate IDs, no premature/extra empty page.
- Aggregate unique-ID count and ordered ID-set digest.
- OAI header datestamp or equivalent snapshot marker, where available.
- Verified monthly maximum sequence or an explicit unverified-frame warning.

Derived score key: `(arxiv_id, cohort_window_id, text_version, scanner_version, vocabulary_version)`.

Acceptance states:
- `MATCHED_V1`: cohort date and text both trace to v1; retrieval completeness and cutoff are verified.
- `LATEST_ONLY`: valid for revision-drift analysis only.
- `VERSION_HISTORY_UNRESOLVED`: excluded from cohort lexical comparison.
- `CUTOFF_UNFROZEN`: excluded from matched-period comparison.
- `RETRIEVAL_INCOMPLETE`: excluded until pagination/frame evidence is complete.

Only `MATCHED_V1` records enter a first-submission lexical trend comparison.

## 5. Test matrix

| Hypothesis | Shared parameters | Calibration | Holdout | Predicted observable | Comparator | Falsification condition |
|---|---|---|---|---|---|---|
| Apparent 2024→2026 lexical shift is a first-submission corpus shift, not revision drift or retrieval bias | Same cohort cutoff, category union, ID frame, deduplication, tokenizer, vocabulary, weights, and v1 text policy | Existing random 100/year sample plus targeted scanner; manually adjudicate a calibration subset | Reserve a separate month or category stratum before tuning; do not use the incomplete 2026 September cell | Paper-level v1 feature prevalence and score distribution; separate within-paper v1→latest revision delta | Random physics sample versus targeted high-recall scanner; this is a corpus-method comparator, not a physical-theory comparator | No trend claim if the effect disappears after v1-only text, common cutoff, category adjustment, manual adjudication, or is below a predeclared practical-effect threshold |
| Scanner retrieval is complete for the declared cohort | Same API query, page size, sort order, and date window | Verify page cursor and totals on a calibration query | Repeat on a held-out cohort/window with frozen query | Stable ordered ID set and count equal to API total | Independent repeat harvest / source-level record checks | Any missing cursor interval, unstable total, duplicate, unexplained empty page, or unverified frame boundary blocks the comparison |

The practical-effect threshold and power calculation are not set here. They must be predeclared after the final cohort window and sample frame are fixed. The 100-per-year random sample is a calibration/control set, not adequate evidence for rare-feature prevalence without a power analysis.

## 6. Existing formalization and tool status

- Existing issue #712 already contains the year-cohort provenance work and the pending cross-year v1 cursor.
- Issue #712 reports PR #711’s exact-head CI success for its year-mapping formalization. No new Lean theorem or CI run was performed here. That formalization does not validate API metadata semantics, the versioned abstract text, or any physical premise.
- Existing `hale_v07_completeness_probe_v2.py` was executed: 9 software fixture cases and 4 assertions passed. These are synthetic software tests, not a live API crawl or an empirical corpus-completeness certificate.
- The candidate v0.7 bigram defect from the prior Hale receipt remains unmodified: stopwords are removed before bigrams are formed, allowing non-adjacent words to be joined. The exact v0.7 base lineage is still unresolved.
- All four Mersearch request lanes remain occupied/unreleased; no new request was created or overwritten. No Mersearch run is claimed. Bounded GitHub/archive search and official arXiv page/API documentation were used as fallback.
- Existing repositories, scanner v0.4/v0.7 candidate, completeness probe, Math Hopper/Lean work, Whirligig and connected SciSpace availability were checked before proposing any new tool. No new tool, dependency, fork, paid service, branch, or PR was created.

## 7. Project boundaries and next cursor

- Current HsH main head at preflight: `453dfa943671c86f7a658933bff914de1e964822`; its latest change was confined to visual-archaeology derived files.
- Task graph remains P2 ACTIVE with no selected real system; Code Grurple remains the active presentation interlock.
- This report does not select a physical system, calculate a physical observable, fit parameters, make a held-out prediction, or admit anything to Factory Floor.
- No BEDROCK theory promotion, SAT-O/Blockwave equation change, or paper-gate change.
- FIE last reviewed 2026-10-27; next review due 2026-11-10. Last unrelated archive reading recorded 2026-11-01; no new unrelated reading claimed in this run.

Next: retrieve official v1/ArXivRaw evidence for `2409.05313`; recover the exact original v0.6 base or keep v0.7 lineage unverified; freeze the common completed-day cutoff; verify the 40,000-sequence frame; correct the bigram adjacency logic in an authorized branch; then run the full matched-period comparison on v1 text with a frozen calibration/holdout split. Keep issue #712 as the single research docket; this is a distinct publication addendum, not a new research task.

No scheduler/task ID/phase change, no sixth task, no signet or chat rename, and no cross-thread delivery or acknowledgment is claimed.
