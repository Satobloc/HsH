# Enheduanna h659:s3 — deterministic post-processing and Kelvin evidence independence

**Nominal occurrence:** 2026-11-07 11:36:00Z  
**Run key:** `REVROT3-19-20261011:659:s3`  
**Status:** SOURCE-GROUNDED OBSERVABILITY DISTINCTION ADDED · EXISTING LEAN PR EXTENDED · EXACT-HEAD CI PENDING AT FIRST READBACK · NO PHYSICAL CALCULATION · NO P2 SELECTION · NO THEORY PROMOTION

## 1. Rotation, identity, and authority

Using the nominal scheduled UTC hour:

- h = 659
- seq = 5(659) + 3 = 3298
- 3298 mod 19 = 11
- Selected ring label: **Enheduanna**, index 11
- Next ring label: **Tern Rook**, index 12
- Existing :36 automation: `6a9f52b69ec08191b0a2ba24a074f781`

The deterministic label is not an authenticated ChatGPT instance or historical Enheduanna appearance.

No standalone Nathan-authored Enheduanna specialist charter was recovered. The original direct user instruction located in conversation `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`, message `11399ca2-5bd6-4203-9e19-e8e044fbc736`, 2026-09-23 02:04:49Z, describes Enheduanna as a similar revival case and says to “always consider all archives.” This is broad archive-revival direction, not a specialist charter or authenticated worker/thread assignment.

The optional Nadir h655:s3 packet retained for this h659:s3 appearance was read at the start. It supplied the existing Rankine-vs-H(s)H distinguishability matrix and the unresolved Figshare/camera-map cursor. It created no task, review, response or ownership obligation.

## 2. Main architecture improvement: separate measurement independence from statistic order

A new distinction is now explicit:

1. **Experiment independence:** whether two papers represent independent experimental campaigns/laboratories or a same-group follow-on.
2. **Acquisition-channel independence:** whether an observation comes from a new sensor/modality/coordinate-resolved measurement.
3. **Statistic independence:** whether a derived statistic contains information not present in a coarser summary of the same acquired data.

These are different axes. A higher-order statistic is not automatically a new measurement channel or an independent geometric observation.

### Nature Physics 2026: multi-product acquisition

Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* 22, 409–414 (2026), DOI 10.1038/s41567-026-03175-w, published 2026-02-10.

The paper's Methods distinguishes a Basler side-view contour stream, a Phantom top-view PIV velocity-field stream, and a separate PTV vertical-velocity path. The Results refers to “two orthogonal cameras” for the m=1 handedness observation, but the retrieved Methods does not explicitly identify the two streams used by that handedness classifier or specify their synchronization, registration, raw-frame pairing, and estimator. The Basler/Phantom pairing remains plausible, not source-confirmed. The two Basler lenses are not two independent camera bodies; the Phantom PIV field is not itself a second radial contour pair.

The paper declares Figshare DOI 10.6084/m9.figshare.30903347. The item version, file manifest, raw bytes, checksums, acquisition metadata and joint covariance remain unretrieved. The dataset is not proven absent.

### PRL 2026: one acquired displacement field, multiple derived statistics

Barckicke, Gissinger & Falcon, “Experimental Evidence of Kelvin-Wave Turbulence along a Vortex Core,” *Physical Review Letters* 137, 134001 (2026), DOI 10.1103/t3bt-m431, published 2026-09-21; arXiv:2607.07535.

The author-hosted final PDF was read. It describes one optical camera (480 fps, 3 Mpix), perpendicular to the vortex axis at about 18 cm height, tracking the horizontal displacement field

`eta(z,t) = [r_i(z,t,0) - r_i(z,t,pi)]/2`

over a vertical window `L = 20.6 cm` (PDF p.2, journal pp. 134001-2). It reports 1-minute spectral acquisitions, 15-minute probability-density acquisitions, and a 75-minute high-order-correlation average (PDF p.3).

The pentacoherence `P(k1,...,k5)` is defined from products of Fourier amplitudes `eta_k` of that same displacement field, averaged over `T = 75 min` (PDF p.4). It may reveal phase correlations not retained by the second-order power spectrum. It is nevertheless downstream of the same acquired `eta(z,t)` record; it is not a second camera, a radial-profile measurement, or an independent cross-sectional director measurement.

The paper's data-availability statement says there are no publicly available research data or software supporting the manuscript and directs requests to the authors (PDF p.5). No author request was sent. The 75-minute averaging interval is not an independent sample count; raw time series, effective independent sample count and joint covariance were not recovered.

The two papers are distinct publications from the same author group and experimental programme. Do not count the PRL follow-on as an independent-laboratory replication.

## 3. Formal result: deterministic post-processing preserves acquisition aliases

Let the source state space be `X`, acquisition map `M : X → Y`, and any deterministic downstream statistic `T : Y → Z`.

If `M(x₁) = M(x₂)`, then

`(T ∘ M)(x₁) = (T ∘ M)(x₂)`.

Consequently:

- every alias/fiber of the acquisition map survives deterministic post-processing;
- if `T ∘ M` is injective, then `M` was already injective;
- if `M` is non-injective, no deterministic statistic of its output can restore injectivity on the original source-state space.

This is a generic function/fiber theorem, not a Shannon mutual-information calculation and not a physical model. It does **not** say that pentacoherence adds nothing relative to a power spectrum. It can distinguish acquired `eta` records whose second-order spectra agree but whose higher-order phase correlations differ. It says only that pentacoherence cannot distinguish two underlying physical states that already produce the same full acquired `eta(z,t)` record.

### Actual Lean change

Extended existing draft PR #1401 in place; no new branch or PR was created.

- Branch: `research/enheduanna-kelvin-finite-parity-v2-20261105t2158z`
- Prior file blob: `60843f9a57b0378dff293c47ff8cdbd8ea24351f`
- New commit: `f601252879ffdf8951be11793bbfb52cb40b4447`
- New file blob: `b5707767ececba4730909b328c3683d16a2e6d89`
- Added theorems:
  - `deterministicPostprocess_preserves_acquisition_alias`
  - `deterministicPostprocess_injective_implies_acquisition_injective`
  - `deterministicPostprocess_cannot_restore_injectivity`

The existing exact-head build of the prior PR #1401 head passed in run #42124345675, but that does not verify this new commit. Exact-head run #42369787715 was triggered for commit `f601252...`; at the first readback its source-checkout identity and Lake dependency-manifest steps had passed, while the Lean 4.34.0 / Lake 5.0.0 root compilation step was still **IN_PROGRESS**. No success or theorem-specific axiom report is claimed until that exact run completes and its full job log is inspected. The PR remains OPEN / DRAFT / UNMERGED.

Lean checks only these formalized function/fiber propositions. It does not validate the physical acquisition map, source-to-geometry translation, camera calibration, the Rankine model's physical premises, or any H(s)H extension.

## 4. Conditional geometry and prediction consequences

For this measured classical air-core water vortex:

| Feature | Forced by the source/system | Not forced by the present readout |
|---|---|---|
| Finite core | A finite air-core radius and air-water interface; the standard Rankine comparator already includes a finite core. | An additional H(s)H thickness variable or internal radial structure beyond the standard measured radius. |
| Twist / connection | Helical m=1 bending and m=2 flattening modes, treated by standard Kelvin-wave theory. | An internal director, connection or holonomy. It needs a calibrated cross-sectional orientation/phase-transport observable. |
| Contact surface | The air-water interface and standard velocity/pressure continuity at the perturbed surface. | An extra H(s)H contact layer or boundary law beyond the standard model. |
| Timesheet | Time-resolved `eta(z,t)` and its derived spectra/correlations. | An independent physical timesheet field. A statistic of `eta` is not a new acquired channel. |

The PRL six-wave result is evidence about nonlinear correlations in the measured Kelvin-wave displacement field and is interpreted through standard weak-turbulence theory. It does not by itself identify added worldtube thickness, internal twist, contact structure, or independent timesheet dynamics.

A distinguishing H(s)H extension must predict a non-reparameterizable residual in an independently acquired observable, beyond shared standard parameters and the acquisition map's nullspace. Candidate evidence would require, as appropriate, a resolved radial profile, calibrated cross-sectional director/phase transport, independent boundary-stress/curvature measurement, or a synchronized additional field whose cross-channel signal is not reducible to `eta`.

For any later physical test, freeze shared parameters from independent measurements, reserve a whole acquisition/forcing run as holdout, propagate measurement/parameter/model covariance, and preregister the residual statistic and threshold. No numerical threshold is supplied here because raw data and joint covariance are unavailable.

## 5. Source, Mersearch and tooling boundaries

- Direct Mersearch was not exposed in this runtime; all four shared request lanes remained occupied/requested. No request was overwritten, retriggered or replaced. Bounded GitHub searches across HsH, SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES were navigation fallback, not a Mersearch run. No matching local PRL raw-data package was located in the SAT archive or HSH_RESOURCES search results.
- Existing Math Hopper issue #578 and draft PR #991 remain extraction/provenance infrastructure; the three-repository pilot is not verified as a full corpus result.
- Existing Lean PRs #1189, #1401 and #1402 were reused. #1402's prior exact-head build remains a conditional four-view operator proof, not camera-map validation.
- Whirligig Kernel 0 remains SANDBOX ONLY and is not an equivalent physical model.
- SciSpace is available but was not needed for the primary-source audit. No new tooling, dependency, subscription, paid API, fork or branch was created. The GitHub connector did not expose repository fork counts; bounded parent-fork search returned no exact matches, so a zero-fork census is **not** claimed.
- No SAT-O or Blockwave equation was used, transcribed, corrected or modified. Existing source-sign discrepancies remain under the separate Calder source audit; neither paper's printed convention is silently normalized.

## 6. Campaign, safety and return cursor

- Code Grurple P0 remains ACTIVE; this source/verification work does not reopen Paper A/B manuscript work.
- P1 Nov 9 remains Orson-owned; P2 Nov 30 remains HOLD pending an actual selected measured system and evidence package; P3 Dec 14 remains a separate full-theory manuscript gate.
- No physical calculation, fit, simulation, numerical prediction, covariance propagation, independent measurement, P2 system selection, Factory Floor admission, BEDROCK change or theory promotion occurred.
- FIE last full review remains 2026-10-27; the fourteen-day rereview is due 2026-11-10, not yet due.
- Unrelated reading break completed: Charles Babbage, *Reflections on the Decline of Science in England*, HSH_RESOURCES blob `fa52e41ab73566a13109a0a7aeaed3e895b41163`, lines 1241–1280. The passage discusses scientific-society fees, institutional management, publicity, printed accounts and general meetings. Next cursor: line 1281. Historical reading only; no theory inference.
- Current :24 predecessor h659:s2 was still recorded IN_PROGRESS with `chat_ref=null` at the initial check; its latest result belongs to older h658:s2. Do not infer predecessor nonresponse or attribute the cached result to h659:s2.
- Next nominal worker: Tern Rook, h659:s4. Optional repository-only handoff; no authenticated Tern thread, cross-thread delivery, consumption or acknowledgment is claimed.

**Disposition:** `SOURCE_GROUNDED_OBSERVABILITY_DELTA / LEAN_EXACT_HEAD_PENDING / DATASET_ACCESS_BLOCKED / NO_PHYSICAL_CALCULATION / NO_P2_SELECTION / NO_THEORY_PROMOTION`.
