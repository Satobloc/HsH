# Workshop Relay :36 | Nadir Voss | h1130:s3

**Nominal slot:** 2026-11-27T02:36:00Z  
**Run key:** `REVROT3-19-20261011:1130:s3`  
**Selected / next:** Nadir Voss (ring index 10) / Enheduanna (index 11)

**Disposition:** `GWTC5_V2_EVENT_PORTAL_STRAIN_LOCATORS_FOUND / PRIOR_ROUTE_STATUS_CORRECTED / RAW_BYTES_NOT_ACQUIRED / TIMELINE_SEGMENTS_NOT_EXTRACTED / NO_HSH_FORWARD_MAP / P2_HOLD`.

This is source-grounded assistant execution under the deterministic Nadir ring label, not an authenticated historical Nadir instance or conversation.

## 1. Rotation, authority and source preflight

The nominal UTC hour is 1130:

\[
h=1130,\qquad seq=5(1130)+3=5653,\qquad 5653\bmod19=10.
\]

The existing :36 task `6a9f52b69ec08191b0a2ba24a074f781` remains enabled with its original hourly America/New_York schedule and Worldtube phase. No task, ID, cadence, phase or conversation-title change was made.

The live scheduler read showed invocation `c767d025-8a58-832a-8926-d8700449e569`, scheduled 02:36:00Z and started 02:36:49.252Z, `in_progress`, `chat_ref=null`. Its cached `latest_result` belonged to the completed Mira h1129:s3 run `fd491ce9-c6a8-8333-83bb-be6e51c88393`; that result was not attributed to this invocation.

Preflight surfaces read:
- Live `BEDROCK.md`, blob `ed791df242d6f3beddeaeeabd0d1ced3d1341e9d`, 768 lines. The 2026-11-24 Nathan Direct entry makes H(s)H the tentative world-tubification of SAT and explicitly preserves inherited epistemic status. The Kerr-ER-Pauli exclusion construction is foundational to the current H(s)H direction but remains tentative. The real-data-first, no-data-free-physical-fixture and geometry-first gates remain controlling.
- `STEERING_CHARTER_2026-10-26.md`, `THREE_PAPER_CAMPAIGN_2026-10-26.md`, `PHASE_STEERING_2026-10-26.md`, `NEW_INSTANCE_START_HERE.md`, `INSTANCE_ONBOARDING_3REPO.md`, `ONBOARDING_REVIEW_STATE.md`, `REVIVAL_REENTRY_PROTOCOL_V2.md`, scheduler authority and the Primary Operational Guideline.
- HsH main branch, current Common PWH queue, P2 issue #565, Nadir `README.md`, `BOOT.md`, `CURRENT_WORK.md`, and canonical h1111:s3 receipt `2026-11-26T0736Z_s3_nadir_voss.md`.
- Nadir's historical `Quantum Gravity and Experiments` raw conversation, ID `6a3a2037-3698-83ea-924d-2cb8c4ac7701`, blob `d828fef5352045cb4d9486fdbeabd04043c4c119`. It is a historical source, not a signed specialist charter. Nadir has no standalone signed specialist charter; the current Nathan Direct Lane 36 charter governs.
- HsH `main` was present; latest observed commit before this report was `cf609bf725207fed5a8b39024a18929f5ff06583` at 02:39:50Z.

All four Mersearch request lanes remain occupied/requested. No lane was overwritten, retriggered, released or repurposed. No new tooling was built. This run used the already-published GWOSC event portal and API, not a claim of full three-archive Mersearch coverage.

## 2. Material source correction: the GWTC-5.0 v2 event page exposes strain files

The prior Nadir h1111:s3 report, issue [#2593](https://github.com/Satobloc/HsH/issues/2593), correctly recorded that the v2 `strain-files` and `timelines` API endpoints returned zero rows. It then described the exact event-specific v2 strain route as unresolved. That conclusion was too broad.

The GWOSC API documentation defines the event-version `strain-files` endpoint as returning **early-release** strain files. An empty early-release list does not establish that the Event Portal has no strain products.

The actual GWTC-5.0 v2 Event Portal page is:

https://gwosc.org/eventapi/html/GWTC-5.0/GW241011_233834/v2/

Its machine-readable JSON view is:

https://gwosc.org/eventapi/json/GWTC-5.0/GW241011_233834/v2/

The v2 JSON contains an explicit `strain` array with eight download entries:
- H1 and V1;
- 16,384 Hz and 4,096 Hz;
- 4,096 seconds;
- HDF5 and GWF formats;
- common GPS start `1412722688`.

The event version is `GW241011_233834-v2`, catalog `GWTC-5.0`, GPS event time `1412725133.0`, detectors H1 and V1, event DOI `10.7935/bk00-6a89`. The 4,096-second strain window ends at GPS `1412726784`; the event lies 2,445 seconds after the window start. L1 is not in the observing network for this event.

### Exact HDF5 locators recovered from the v2 JSON

| Product | Direct locator | Status |
|---|---|---|
| H1, 16 kHz | `https://gwosc.org/archive/data/O4b_16KHZ_R1/1412431872/H-H1_GWOSC_O4b_16KHZ_R1-1412722688-4096.hdf5` | URL present in v2 JSON |
| V1, 16 kHz | `https://gwosc.org/archive/data/O4b_16KHZ_R1/1412431872/V-V1_GWOSC_O4b_16KHZ_R1-1412722688-4096.hdf5` | URL present in v2 JSON |
| H1, 4 kHz | `https://gwosc.org/archive/data/O4b_4KHZ_R1/1412431872/H-H1_GWOSC_O4b_4KHZ_R1-1412722688-4096.hdf5` | URL present in v2 JSON |
| V1, 4 kHz | `https://gwosc.org/archive/data/O4b_4KHZ_R1/1412431872/V-V1_GWOSC_O4b_4KHZ_R1-1412722688-4096.hdf5` | URL present in v2 JSON |

This changes the locator status to `V2_EVENT_PORTAL_STRAIN_LINKS_FOUND`. It does **not** mean the files were downloaded, their bytes hashed, or their metadata inspected. The browser reader rejected the binary HDF5 response as an unsupported content type; no raw strain bytes were acquired.

The v2 event page's Timeline link opens the O4b run-level segment query. The prior h1111 report records zero rows from the event-version `timelines` API. The exact event segment list, data-quality intervals and injection exclusions have not yet been extracted. The strain-file data-quality and injection masks are documented by GWOSC, but their event-specific contents have not been read.

## 3. PE package and release identity

The v2 event JSON directly links the preferred PE analysis to:

- Zenodo record [20348005](https://zenodo.org/records/20348005), DOI `10.5281/zenodo.20348005`, record version v2, published 2026-05-26.
- File: `IGWN-GWTC5p0-29ebe06b7_25-GW241011_233834-combined_PEDataRelease.hdf5`
- Size: 1.3 GB.
- Zenodo-listed MD5: `f432e03faba579a04697ae463391b180`.

The record description says each event HDF5 contains posterior samples for the event's PE runs and metadata including detector-data configuration, noise PSDs, priors and calibration-uncertainty envelopes. The GWTC-5.0 documentation identifies the PE samples as Stable Release Version 9. These are distinct version labels and must not be conflated:
- event version: v2;
- Zenodo record version: v2;
- GWTC stable release: version 9.

The file URL, size and MD5 are source metadata, not an independently recomputed checksum. The 1.3 GB PE file was not downloaded.

## 4. v1/v2 reconciliation and calibration caution

The older O4 Discovery Papers page is a separate event-version record:
- `GW241011_233834-v1`;
- DOI `10.7935/3drz-8m81`;
- published event analysis dated 2025-10-27.

Its page links to the same H1/V1 O4b R1 strain-file URLs listed by the GWTC-5.0 v2 page. The v1 and v2 event GPS values differ by 0.1 seconds (`1412725132.9` versus `1412725133.0`), consistent with displayed precision; this does not establish byte-level identity or calibration equivalence.

GWTC-5.0 documentation states that calibrated 16 kHz strain is provided and 4 kHz products are downsampled using `scipy.signal.decimate`. The 4 kHz anti-aliasing procedure can introduce errors of a few percent in magnitude and a few milliradians in phase, larger near Nyquist; strain is not calibrated below 10 Hz. The documentation also warns that products from different releases can differ due to calibration, data cleaning and downsampling, and that data-quality segment information was updated.

Therefore:
- use the GWTC-5.0 v2 Event Portal and its v2 PE package as the catalog comparator;
- prefer the 16 kHz strain for a primary high-frequency analysis, with the published calibration and band limits respected;
- do not substitute the v1 PE summaries for v2;
- do not infer calibration equivalence or file-byte identity from a shared URL alone;
- preserve the exact file URL, file metadata/checksum, calibration release, PSD, quality masks and injection masks in any future analysis.

## 5. Test architecture and remaining blockers

| Test element | Required construction | Current status |
|---|---|---|
| Hypothesis | H(s)H geometry forces a definite waveform-phase, multipole or detector-strain residual | No source-defined geometry-to-waveform map |
| Shared parameters | Masses, spins, distance, inclination, coalescence time/phase and detector response | v2 PE summaries available; raw PE file not acquired |
| Calibration | H1/V1 calibrated strain, PSDs, calibration envelopes, data-quality and injection masks | Exact strain URLs found; bytes and event masks not inspected |
| Holdout | Event-level holdout not used to tune H(s)H parameters; no pseudo-independent split of one transient | No frozen H(s)H parameter or holdout |
| Predicted observable | A geometry-derived waveform/multipole coefficient or calibrated strain residual | Undefined until the forward map exists |
| Standard comparator | Same v2 data, calibration, PSD and priors across the three v2 waveform families | Published PE summaries available |
| Falsification | Preregistered held-out residual or predictive-score threshold with waveform and calibration uncertainty | No numeric threshold |

The source locator correction removes one data-access uncertainty. It does not solve the physical problem. The H(s)H geometry-to-waveform/quadrupole map, source-faithful plot, parameter derivation, event-specific quality-mask extraction, independent holdout and falsification threshold remain absent.

No system was selected for P2. No raw strain or PE HDF5 was downloaded, no physical fit or prediction was performed, and no independent measurement was made.

## 6. Formal and project status

No new Lean theorem was introduced. The result is a source/API-scope correction and a provenance locator, not a new mathematical proposition. No Lean compilation is claimed. Existing Nadir PR #1189 remains unrelated to the missing geometry-to-waveform map.

- P1 cognition: overdue, frozen and Orson-owned.
- P2 major, November 30: HOLD. The event is a source-ready candidate only, not a selected system or a completed analysis.
- P3 full theory, December 14: incomplete.
- P0 Code Grurple: presentation safety remains FAIL; no deployment or release.
- Tern retains PWH/deep-review coordination. The existing queue and graph were not modified.
- FIE rereview remains due December 8; the next unrelated-source break remains November 28.

No SAT-O or Blockwave equations were changed. No BEDROCK status was promoted. No new tool, dependency, fork, subscription or expenditure was introduced.

## 7. Publication and next cursor

This report is an additive correction to Nadir h1111:s3 and the existing P2 candidate register. It does not replace or rewrite issue #2593.

**Next bounded operation:** acquire only the four event-page HDF5 strain files if the permitted data route and storage budget allow; record actual byte hashes and HDF metadata; extract the event-specific data-quality/injection masks through the v2 event page's O4b timeline route; inspect the PE HDF5 configuration/PSD/calibration envelopes without treating posterior summaries as raw observations. Then stop unless a source-defined H(s)H forward map and a genuine holdout protocol can be specified.

The next ring label is Enheduanna. No direct-thread delivery, inbox write, assignment, consumption or acknowledgment is claimed. The current invocation remained `in_progress` at the last scheduler read; no current-run result or authenticated thread is inferred.
