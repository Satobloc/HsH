# Kestrel h1131:s2 — GWTC-5.0 v2 source-release and support-freeze crosswalk

**Date:** 2026-11-27 03:24Z  
**Run key:** `REVROT3-19-20261011:1131:s2`  
**Routing:** Kestrel (ring index 14); next Meridian (index 15). Deterministic selection is not authentication of a historical Kestrel instance or thread.  
**Disposition:** CROSS-BOUNDARY SYNTHESIS / GWTC-5.0 SOURCE LOCATORS RECOVERED IN PRIOR PUBLISHED REPORT AND RELEASE METADATA RECHECKED / EXISTING EXACT-HEAD LEAN BUILD REVERIFIED / RAW DATA NOT ACQUIRED / NO PHYSICAL ANALYSIS / P2 HOLD.

## 1. Role, authority, and continuity

The historical Kestrel conversation is `Science Made Stupid`, conversation ID `6ab070ce-2384-83e9-b76f-4661c55867c4`, raw Git blob `100267f3f11f3cce09c7d802ce85ad03879d5744`. Direct user-role messages `c6803d67-a76f-48e4-bf71-f49cb7b224ee`, `3c07680d-5205-48a3-93d5-ce33a8cf86a6`, `fc9b147e-b138-44ac-a48b-b81593e3c3e9`, and `f15aac1c-0a31-4e98-b461-6ca872035315` establish a trust-first, forward-reasoning, cross-boundary synthesis role. Kestrel is not the primary auditor, provenance adjudicator, mathematical verifier, or evidence-acquisition owner. No separately signed specialist charter was recovered.

The current assistant is not authenticated as the historical Kestrel instance. Existing-thread-first retrieval did not establish a later active Kestrel continuation; this scheduled run has `chat_ref=null`. No direct-thread delivery, consumption, or acknowledgment is claimed.

Read before work: live BEDROCK; Steering Charter 2026-10-26; Three Paper Campaign; Phase Steering; three-repository onboarding; Reference Desk; HQ Tool Chest; Revival Rotation V3/V4 and thread-routing controls; Kestrel README, BOOT, CURRENT_WORK, CONTINUITY, THREAD_HANDOFF, OPERATING_ASSUMPTIONS, OPEN_QUESTIONS and INBOX; historical raw-source role messages; Kestrel h1123:s4 receipt; h1127:s3 report and publication amendment; current P2 and P0 records.

Pre-publication repository main heads at source readback:
- HsH: `003b37ce0c6649b5ddc98ad70af1a4d0a0993888`
- SAT archive: `2b6f18d515e5bbdd3b1276cb62c6f4c10f76b19e`
- HSH_RESOURCES: `ac9a05a1fd71da7f8a73594d819a1d73a01b06e`

BEDROCK is blob `ed791df242d6f3beddeaeeabd0d1ced3d1341e9d`. HSH_RESOURCES README, human index, and HQ Tool Chest were read for routing; no private research payload was opened. Kestrel BOOT/CURRENT_WORK still point to h1101. The latest verified canonical Kestrel receipt remains h1123:s4 (`2026-11-26T1948Z_s4_kestrel.md`, blob `dfd7bbef57565ab1c6b05350d4baf3f7bd188b01`). The h1127:s3 report and Amendment 01 are published, but no h1127 canonical receipt was found. The INBOX tail contains the older Morrow h1123 optional context; no h1131 predecessor packet was found. No new canonical receipt, worker-local checkpoint, or inbox was written under the active P0 interlock; this publisher artifact is the durable result.

All four Mersearch request lanes remain occupied. Lane 2's Ariadne request has a completed three-repository manifest and compact receipt but remains `OUTPUT_COMPLETE / RELEASE_NOT_VERIFIED / STILL_OCCUPIED`; lanes 1, 3, and 4 retain existing requests without verified result manifests. No lane was overwritten, released, or retriggered. No new Mersearch request was submitted. No SAT-O or Blockwave equation was reproduced or altered.

## 2. New P2 candidate: GW241011_233834-v2

Nadir's h1130:s3 source-locator correction is published at [issue #2652](https://github.com/Satobloc/HsH/issues/2652), with its source-custody pointer in [P2 issue #565](https://github.com/Satobloc/HsH/issues/565). I reused that event-specific locator work rather than repeat it. The event JSON endpoint did not render through the web reader in this run; the exact event-specific URLs below are taken from Nadir's published report, while the public release documentation and Zenodo record were independently reopened.

- Catalog/event: `GWTC-5.0 / GW241011_233834-v2`
- Event DOI: `10.7935/bk00-6a89`
- Event GPS time: `1412725133.0`
- Detectors: H1 and V1 only; L1 is not in the observing network for this event.
- Strain-window GPS start: `1412722688`
- Window duration: `4096 s`
- Window end: `1412726784`

Nadir's report records eight event-page strain download entries (HDF5 and GWF for H1/V1 at 16 kHz and 4 kHz). The four HDF5 locators are:

| Product | Exact event-page URL |
|---|---|
| H1, 16 kHz | `https://gwosc.org/archive/data/O4b_16KHZ_R1/1412431872/H-H1_GWOSC_O4b_16KHZ_R1-1412722688-4096.hdf5` |
| V1, 16 kHz | `https://gwosc.org/archive/data/O4b_16KHZ_R1/1412431872/V-V1_GWOSC_O4b_16KHZ_R1-1412722688-4096.hdf5` |
| H1, 4 kHz | `https://gwosc.org/archive/data/O4b_4KHZ_R1/1412431872/H-H1_GWOSC_O4b_4KHZ_R1-1412722688-4096.hdf5` |
| V1, 4 kHz | `https://gwosc.org/archive/data/O4b_4KHZ_R1/1412431872/V-V1_GWOSC_O4b_4KHZ_R1-1412722688-4096.hdf5` |

The [GWTC-5.0 data-release documentation](https://gwosc.org/GWTC-5.0/) says the event strain products contain calibrated strain over 4096 seconds at 16384 Hz, with a 4096 Hz downsampled product made using `scipy.signal.decimate`. The downsampling procedure can introduce errors of a few percent in magnitude and a few milliradians in phase, larger near Nyquist. The strain is not calibrated below 10 Hz. H1/V1 data-quality and injection-mask channels are documented, and event-specific segments are available through the event page's “Timeline: Query for Segments” route. Those event-specific masks and segments have not yet been extracted.

### Three independent version axes

The event locator and parameter-estimation package must not be represented by one ambiguous “version” field:

1. Event Portal record: `GW241011_233834-v2`.
2. Zenodo record: DOI `10.5281/zenodo.20348005`, record version `v2`.
3. Parameter-estimation samples: GWTC-5.0 **Stable Release Version 9**.

The [Zenodo record](https://zenodo.org/records/20348005) lists the event file `IGWN-GWTC5p0-29ebe06b7_25-GW241011_233834-combined_PEDataRelease.hdf5`, size 1.3 GB, MD5 `f432e03faba579a04697ae463391b180`. This is source-listed metadata, not a checksum independently recomputed here. The PE record describes posterior samples and metadata including detector-data configuration, noise PSDs, priors, and calibration-uncertainty envelopes. The record's catalog-wide release notes describe minor calibration-reweighting updates affecting approximately 85% of SEOBNRv5PHM results and other corrections affecting approximately 10% of events; that is not an event-specific assertion that this event was changed.

No H1/V1 strain bytes, GWF files, or PE HDF5 bytes were downloaded. The event-specific segment list, data-quality intervals, injection exclusions, PSD content, and calibration envelopes have not been inspected. The source locator is therefore **source-ready, not analysis-ready**.

The three waveform-family parameter-estimation summaries in Nadir's report are model-conditioned posterior outputs from the same event data, not three independent measurements or independent replications. Their spread is useful as a standard-model sensitivity baseline, but cannot substitute for raw calibrated strain or an independent holdout.

## 3. Existing support-freeze gate: exact-head result rechecked

Draft [PR #2640 — Freeze support identity before holdout access](https://github.com/Satobloc/HsH/pull/2640) remains OPEN / DRAFT / UNMERGED on branch `research/kestrel-support-freeze-gate-h1127s3`, head `e8c2cd384b9c716ea3a2b46ff47381229d38d82f`, based on `research/lane36-partial-map-domain-gate-h1122s3` at `79b3aea1cbd11daf91baceebb152326985f7c110`. It adds `SupportFreezeGate.lean` and imports it into the formal library. No code was changed in this run.

The existing exact-head Actions run [#45912421462](https://github.com/Satobloc/HsH/actions/runs/45912421462) was re-read:
- Exact PR-head assertion: expected and actual checkout both `e8c2cd384b9c716ea3a2b46ff47381229d38d82f`.
- Lean 4.34.0; Lake 5.0.0.
- Mathlib revision `5ed2965256430c3649e86755f9576b54eca72435`.
- Build completed successfully: 8,949 jobs.
- `#eval` outputs: `true`, `false`, `false`, `false`.
- `witness_implies_gate_true`, `changed_support_digest_blocks_gate`, and `changed_support_generation_blocks_gate` each report `[propext]`.
- `support_frozen_after_first_access_blocks_gate` reports `[propext, Quot.sound]`.

The run skipped tests, lint, global axiom audit, leanchecker, and nanoda. This is an exact-head library build and execution of the module's smoke evaluations, not a full proof/assumption audit of the repository. The four theorem-specific axiom reports are not a global axiom audit.

### Remaining formal obligations

The module defines `SupportSpec`, `HoldoutSpec`, `ComparisonRecord`, `ConfirmatoryWitness`, and `confirmatoryGate`. It proves that a valid witness implies gate acceptance and that three selected failures (changed digest, changed generation, late freeze) block acceptance. It does not yet prove the converse `confirmatoryGate = true → Nonempty (ConfirmatoryWitness ...)`, nor test negative cases for every remaining predicate (support ID, source-context ID, holdout ID, readout, calibration, shared parameters, and evaluation time). A useful formal closure would be a compiled gate/witness equivalence theorem plus field-by-field negative cases.

The module itself explicitly leaves these matters outside its formalization:
- global generation-token non-reuse;
- whether the supplied digest actually serializes the support predicate;
- truth/authenticity of timestamps and first-access records;
- whether access was actually prevented before freeze;
- holdout membership/coverage and treatment of undefined model readouts;
- correctness of the physical source context or any H(s)H map.

The current result is a software-state workflow gate. Lean compilation does not establish that the translation matches the intended scientific protocol or that the physical premises are true.

## 4. Cross-boundary synthesis: the missing typed composition

The GWTC-5.0 source exposes why `sourceContextId` cannot remain an unexplained string at the protocol boundary. A usable confirmatory chain needs distinct, composable identities:

1. **DataReleaseManifest:** catalog/event identity; Event Portal version and DOI; event-JSON digest; detector set; exact strain-product URLs and byte hashes; sample rate; GPS start/duration; calibration release/channels; PSD identity; data-quality and injection-mask digests; PE DOI/record version; Stable Release Version; waveform family and prior/configuration identity.
2. **GeometryMapManifest:** source-faithful H(s)H worldtube/timesheet/medium state and version; declared domain; map to source waveform; detector response and calibrated-strain readout; units and assumptions. The standard GR waveform must pass through the same detector/readout chain. These are explicit maps to be supplied, not presumed equivalences.
3. **SupportSpec:** immutable DataReleaseManifest ID plus GeometryMapManifest ID, domain and canonical support-predicate serialization/digest, non-reused generation, and a freeze event/sequence/time.
4. **HoldoutSpec:** exact event-time segment partition, data-quality/injection exclusions, and an append-only first-access event identity/sequence.
5. **ComparisonRecord:** exact source manifest, support generation/digest, holdout, detector readout, calibration, PSD, masks, shared nuisance-parameter set and scoring rule used by both model arms. Model-specific parameters remain separately typed.

The existing PR #2640 can compare opaque source-context, support, holdout, readout, calibration, and shared-parameter identifiers. It does not construct or authenticate the DataReleaseManifest, bind the digest to canonical support-predicate bytes, or establish an event log. The proposed chain is an interface requirement, not a claim that the current Lean module already implements it.

For an inspiral, the missing physical composition is:

`H(s)H geometry → source waveform → H1/V1 detector response → calibrated strain`

The standard GR comparator must use the same detector response, calibrated strain products, PSDs, masks, and declared shared nuisance parameters. The observed strain is detector readout, not a worldtube itself. No source-derived H(s)H geometry-to-waveform/quadrupole map has been supplied for this event. Consequently there is no H(s)H forward prediction, no reverse reconstruction, and no observable comparison to perform.

A changed event page, strain file, calibration release, PSD, mask, PE package, map, or support predicate must create a new immutable source/support identity. If the holdout has already been accessed, a changed support is exploratory; a new confirmatory claim requires a fresh independent holdout.

## 5. P2 disposition and next scientific gate

`GW241011_233834-v2` is an additional P2 inspiral candidate with useful public source locators. It is not selected. The Barckicke finite-core and prior inspiral candidates remain separate entries; no ranking or equivalence is asserted.

Before any physical calculation or numerical comparison:
- acquire and checksum the exact H1/V1 products and event PE file through an authorized route;
- extract the event-specific segment, data-quality and injection masks;
- inspect PSD, calibration uncertainty and waveform/prior configuration;
- recover original SAT-O/Blockwave source equations through the existing Mersearch-first route, preserving verbatim equations, source SHA and first-extant date separately from corrected equations;
- define the source-faithful H(s)H geometry-to-waveform/readout map and its inverse/identifiability conditions;
- freeze the support and a genuinely independent holdout before inspecting that holdout.

No CODATA comparison was made because no numerical physical comparison was performed. No data were downloaded, no fit, prediction, uncertainty propagation, falsification threshold, or independent measurement was produced. **P2 remains HOLD for November 30.**

## 6. Current operational controls

### P0 discovery and navigation

The latest automatic discovery refresh [#45930760345](https://github.com/Satobloc/HsH/actions/runs/45930760345) completed SUCCESS:
- Workflow event head `5c7f4849e2e12442050427a66a0577f97ffbcd22`.
- Scanner HsH source field `c21c325890b0a433f02e0039b497c3086b2d1092`; SAT source `2b6f18d515e5bbdd3b1276cb62c6f4c10f76b19e`.
- Generated commit `003b37ce0c6649b5ddc98ad70af1a4d0a0993888`, whose direct parent is the scanner source commit `c21c325...`; that source commit's parent is the workflow event head `5c7f...`.
- Summary: 18,122 documents, 48 docket entries, 417 square visuals, six extraction errors.

A direct GitHub API check clarifies an earlier source-field ambiguity: for the tested commit-ish inputs, `GET /git/trees/main?recursive=1` and `GET /git/trees/<commit-sha>` returned the commit SHA in the response `sha` field; when passed the actual root-tree SHA, the endpoint returned the tree SHA. In this run, the scanner's `c21c...` source identity matches the generated commit's parent, so this refresh is source-cut aligned. This corrects the earlier assumption that the field was necessarily a tree-object SHA.

The workflow still checks out moving `main` and the scanner independently queries moving `main`, without an explicit equality assertion between checked-out `HEAD` and the queried source identity. This run is aligned; the race remains possible in future runs. The source-pin issue is not globally closed.

Latest navigation maintenance [#45930760365](https://github.com/Satobloc/HsH/actions/runs/45930760365) failed at strict date-tag verification:
- dated and correct: 1,040;
- needing rename: 0;
- unresolved collisions: 0;
- undatable conversations: 2;
- skipped non-conversation/bad JSON: 881;
- 75 root renames occurred only in the runner workspace and were not persisted.

Viewer, chronology, structural indexing, autotagging, tests, commit, and deployment were skipped. The two current undatable identities were not exposed. Conversation JSON content CI [#45930759171](https://github.com/Satobloc/HsH/actions/runs/45930759171) failed with zero jobs.

P0 presentation safety remains FAIL. No new full record-level presentation-state parse was performed; Paper A/B live-route acceptance remains NOT_OBSERVED, deployment NOT_VERIFIED, and release/standdown NOT_AUTHORIZED. No P0 code, route, deployment, or release action was taken.

### Paper and review gates

- P1 November 9 cognition: overdue, frozen, Orson-owned.
- P2 November 30 measured-system paper: HOLD.
- P3 December 14 full-theory paper: incomplete.
- FIE next rereview: December 8.
- Unrelated-source break: next due November 28.

No PWH count was claimed. Tern retains PWH coordination and P0 release/standdown authority; Calder retains WH-02 implementation ownership. No worker ownership, task graph, queue, scheduler, task ID, cadence, phase, signet, or conversation name was changed. No sixth task was created.

**Next cursor:** preserve the event/source release as a candidate only; obtain the actual data products and masks before analysis; require the source-defined H(s)H waveform/readout map and a frozen holdout before any comparison. Keep PR #2640 draft pending independent formal review. The next deterministic ring label is Meridian; this report is optional repository context only, not direct delivery, assignment, or acknowledgment.
