# Sable h881:s3 — Spacetime index witness and measurement-architecture report

**Run key:** REVROT3-19-20261011:881:s3  
**Nominal slot:** 2026-11-16T17:36:00Z  
**Selection:** h=881; seq=5×881+3=4408; 4408 mod 19 = 0 → Sable; next index 1 → Loom.  
**Identity status:** source-grounded Sable revival. The historical Sable conversation and a composite Sable iteration are known, but no current usable conversation ID or authenticated Sable thread was established. No separate chat was created and no cross-thread delivery is claimed.

## 1. Preflight and authority

Read the current HsH BEDROCK, 2026-10-26 Steering Charter and Phase Steering, Three Paper Campaign, three-repository onboarding, Primary Operational Guideline / methodology overview, universal shape-to-Lean priority, revival rotation v3 and V4 not-found revival, thread-routing rule, scheduler authority, current workflow orientation, branch map, Comptroller model, shared-state write safety, worker autonomy/handoff protocol, symbol management, task graph, PWH queue, current hypothesis status, current branch, Sable BOOT/README/CONTINUITY/INBOX, and recent receipts.

Sable's historical direct-user remit is systems/workflow/capability clearance, archive triage, automation leverage and continuity. No separate signed specialist charter exists; the current Sable BOOT/README are assistant-maintained summaries. The current Lane Charter 36 assignment controls this run. Sable has no dedicated P0 presentation-QA ownership; Tern and Mercer retain Code Grurple P0 authority.

The Sable INBOX was read. The optional h879 Elias Kern formalization-witness composition packet in COMMON/HANDOFFS was consumed as context only. No expected h881:s2 Orson Vay receipt or recipient handoff was found at the expected paths; no predecessor work is inferred. The latest h880 Kestrel :36 report/receipt was checked. The current h881:s3 run key had no prior receipt or artifact.

## 2. Substantive architecture improvement

Created the proposed **SpacetimeIndexWitness**, a data-index provenance layer that complements (does not replace) the existing CountStageWitness, SnapshotBoundMapEdge and Kestrel coarse-grained memory gate [issue #1359](https://github.com/Satobloc/HsH/issues/1359).

The primary article's Methods text describes two different probability-density inputs:
- a(z,t): 10 minutes at 100 fps;
- η(z,t): 3 minutes at 360 fps;
- each sliced into 1,000 z-values over 2.5 cm and concatenated into a single temporal file.

The text does not specify the final array shape, axis order, flattening order, coordinate vectors or inverse map from stored index to physical (t,z). This is an index-provenance ambiguity, not an author-error allegation. The PDF pooling operation and the paper's plotted temporal traces may be separate products.

The new witness requires exact source/file identity, acquisition/run identity, array shape and axis order, coordinate vectors and units, masks/boundaries, an explicit stored-index-to-physical-coordinate map, flattening order plus inverse map, processing lineage, sample semantics, and admissible downstream operations.

**Why it matters:** a one-dimensional flattened sequence does not, by itself, preserve temporal adjacency. A temporal correlation, lagged regression or memory kernel is admissible only when physical time mapping is verified and spatial aggregation is explicit. A pooled PDF can use flattened values only when weighting and dependence semantics are declared. A spatiotemporal Fourier analysis needs the original X(z,t) array and both coordinate vectors. Optical, PIV and PTV are distinct measurement operators and are not presumed synchronized.

This closes a specific data-lineage gap between acquisition counts and the existing geometry/coarse-graining/memory gates. It does not assert that the article authors used an invalid time series.

## 3. Source-grounded arithmetic

The primary source is Barckicke, Falcon & Gissinger (2026), *Nature Physics* 22, “Kelvin wave propagation along vortex cores”:
- [Article DOI](https://doi.org/10.1038/s41567-026-03175-w)
- [Author-hosted PDF](https://labo.msc.u-paris.fr/~falcon/KelvinWavesDispersionRelation2025/BarckickeFalconGissingerNatPhys2026.pdf)
- [Data DOI](https://doi.org/10.6084/m9.figshare.30903347)

Source-reported measurement channels:
- Optical contour: Basler acA2040-120um, 2,064×1,564 px, 60 μm/px, 0.5 mm contour width, typical radius/position uncertainty about 0.1 mm; spectral optical recording 300 fps for 30 s; 12.5 cm z-window.
- PIV: Phantom V1840, 6,000 fps for 0.1 s, 37×23 grid, 2.7 mm spatial resolution, 10 μm tracers with St≈0.1; typical circulation uncertainty about 0.005 m²/s.
- PTV: 1.5 mm expanded-polystyrene tracers at r=a(z); typical vertical-velocity uncertainty about 0.05 m/s.

Executed arithmetic from source-reported duration and frame rate:
- 600 s × 100 s⁻¹ = 60,000 frames for a(z,t).
- 180 s × 360 s⁻¹ = 64,800 frames for η(z,t).
- 30 s × 300 s⁻¹ = 9,000 spectral optical frames.
- If every frame contributes all 1,000 z-values, the first two scalar totals would be 60,000,000 and 64,800,000. This is explicitly conditional storage bookkeeping, not a verified array dimension or independent sample count.
- 1/0.125 m = 8 m⁻¹, consistent with the reported Δ(k/2π)=8 m⁻¹.

No raw data were acquired. These are source-derived acquisition calculations, not a physical model fit or prediction.

## 4. H0/H1 and geometry implications

The standard comparator is the paper's classical Kelvin-wave hollow-core / Rankine-core dispersion model. Its fitted a₀, Γ and vz values are standard-model fit/readout values, not H(s)H predictions.

| Layer | Standard H0 | H(s)H requirement | Current status |
|---|---|---|---|
| Geometry | Measured vortex contour and standard fluid state | Source-authorized carrier, slice and projection maps | H(s)H map undefined |
| Indexing | Calibrated X(z,t) axes | Same index map bound to every readout edge | Raw axis manifest absent |
| Calibration | Shared optical/PIV/PTV calibration and covariance | Same calibration plus declared H(s)H response | Raw covariance absent |
| Prediction | Kelvin dispersion and Sη(ω,k), Sa(ω,k) | Frozen observable differing from H0 after same instrument operator | Not formed |
| Holdout / falsification | Independent run and covariance-derived threshold | Same held-out run and nuisance budget; no post-hoc kernel freedom | Not selected; no numerical threshold |

No worldtube thickness, twist or contact surface is forced by this index-provenance issue. The source-defined H(s)H geometry, projection, coarse-graining and instrument maps remain absent. A freely fitted memory kernel cannot substitute for those maps.

## 5. Proof, data and epistemic limits

Proof-first triage was performed. The relevant mathematical object is the mapping from stored array indices to physical coordinates. Because the raw array shape, axis order and flattening order are not source-defined or acquired, there is no source-faithful specific proposition to formalize yet. No Lean theorem, compile or run is claimed. This is **FORMALIZATION_BLOCKED_BY_SOURCE_INDEX_MAP**, not a Lean failure.

Raw Figshare files, file manifest, checksums, array shapes, coordinate vectors, flattening order, frame IDs and run-level covariance were not acquired. No raw-byte readback, H0/H1 fit, H(s)H prediction, independent measurement, numerical falsification threshold or P2 system selection was performed.

Epistemic classification:
- Article and acquisition details: standard reference / source-reported.
- Frame counts and reciprocal-window check: derived bookkeeping.
- 1,000-z-per-frame totals: conditional inference.
- SpacetimeIndexWitness: assistant-proposed additive architecture.
- H(s)H forward map: not supplied.
- Independent physical validation: none.
- BEDROCK, SAT-O and Blockwave equations: unchanged.

## 6. Existing tooling and repository controls

- Mersearch is not callable in this runtime. All four request lanes remain occupied/requested; no request was overwritten, released or retriggered. GitHub source search was a bounded fallback, not Mersearch execution.
- Math Hopper #578 remains open. PR #991 is open/draft/unmerged; its source-coverage smoke run succeeded, but the full three-repository scan is not verified. It is an existing extraction/provenance route, not a time-axis mapper.
- Lean PR #873 remains open/draft/unmerged (head 7dbcb5f18690232d921db74f25dfdf222ee51b8c, base 61cc8b65ffed70296e0121dbae067892a79c81d4). PR #1189 remains open/draft/unmerged (head 8a6a0c288b0091a19b604ab96f94fec05adcc40e, base 7a3add552cebd8a9fa7f2b758f729b3d72d58bcc).
- Whirligig Kernel 0 remains SANDBOX ONLY; its two-plane projections are restricted to its encoded family, not a general equation-to-curve or physical worldtube encoder.
- SciSpace is available as a connected app but was not needed because the primary article PDF was directly accessible.
- HsH, SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES report zero forks. All three front doors/default branches were checked. HSH_RESOURCES root README only; no private payload opened.
- No local repository checkout or local Lean/Lake/Elan executable was present. No new tool, branch, dependency, fork, subscription, paid service or expenditure was introduced.

## 7. Live project state and continuity

At preflight, HsH main was 11f9c25185cddf537c40dcbec3b9030e979a7ec9; the only commit delta observed at that point was the generated discovery docket refresh. Task graph remained 16 declared branches / 18 records, 17 reachable, with the blocked WORLD-TUBE-POLARIMETRY-READOUT node unreachable through the parent child-list. The known graph discrepancy was left untouched.

P0 Code Grurple remains ACTIVE; Tern retains overall authority and Meridian/Mercer retain Paper A/B responsibilities. P1 Nov 9 remains OVERDUE / NOT READY; P2 Nov 30 remains HOLD; P3 Dec 14 remains INCOMPLETE. The P2 exact-data provenance gate due Nov 16 is not satisfied by this source-level witness because raw data and covariance were not acquired. FIE was last reviewed Nov 10; next review Nov 24, so no duplicate review was due.

Unrelated reading completed as a deliberate break: Wikisource, *The Adventure of the Speckled Band*, 1892 US edition, lines 311–350; next cursor 351. Project Gutenberg eBook 1661's prior cursor 315 was not advanced because the service was unavailable; the Wikisource edition is a separate source/edition.

## 8. Publication, handoff and scheduler

Public-safe artifact source copy:
- [Sable spacetime-index witness](2026-11-16T1736Z_H881_S3_SPACETIME_INDEX_WITNESS.md), Git blob aafd4a423177bc738fa366528aba9be89bdf56d9.
- [Machine-readable witness](2026-11-16T1736Z_H881_S3_SPACETIME_INDEX_WITNESS.json), created in the same run.
- Publisher issue [#1847](https://github.com/Satobloc/HsH/issues/1847), submission ID sable-h881-s3-spacetime-index-witness-20261116t1736z-001, SHA-256 67f7de40da36800deb517dd88b7f2590c056105310e050a372f0db23a10f1e0e. Issue author association is OWNER. At this report's initial write, no publisher comment/artifact readback was yet observed; status SUBMITTED_NOT_VERIFIED pending later check. No duplicate issue or direct write to PUBLISHED_SUBMISSIONS.

Next worker: Loom. Optional handoff is repository-only; no task, review, response obligation or ownership transfer. No direct chat delivery, consumption or acknowledgment is claimed.

Existing :36 automation ID 6a9f52b69ec08191b0a2ba24a074f781 remains enabled with exact original VEVENT DTSTART;TZID=America/New_York:20261001T143600 and RRULE:FREQ=HOURLY. No task/ID/cadence/phase change, no sixth task, no signet and no conversation rename.


## 9. Publisher verification amendment | 2026-11-16

The existing HSH-PUBLISH-V1 issue publisher completed successfully.

- Issue: [#1847](https://github.com/Satobloc/HsH/issues/1847).
- Publisher comment: [#6924707769](https://github.com/Satobloc/HsH/issues/1847#issuecomment-6924707769).
- Status: PUBLISHED.
- Publisher commit: `112245575ffe654229cc8b9d3076246147fc54ff`.
- SHA-256: `67f7de40da36800deb517dd88b7f2590c056105310e050a372f0db23a10f1e0e`.
- Source-copy Git blob and published-artifact Git blob both equal `aafd4a423177bc738fa366528aba9be89bdf56d9`.
- Independently fetched source-copy and PUBLISHED_SUBMISSIONS contents compare byte-for-byte equal.
- No duplicate issue, manual PUBLISHED_SUBMISSIONS write, or retry was used.

Final publication state: PUBLISHED_VERIFIED.


## 10. Successor handoff and final repository readback

- Deterministic next worker: Loom.
- [Optional Loom packet](../COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-16T1736Z_from_s3_sable_to_s4_loom_OPTIONAL_SPACETIME_INDEX_WITNESS.md) created and read back.
- [COMMON/HANDOFFS](../COMMON/HANDOFFS.md) appended and read back in commit `14d8e30a1468d7164310d9e6068af7f0049f6348`.
- Loom's current usable ChatGPT thread was not authenticated. The Loom INBOX was not edited because the current recipient run state could not be verified. This is repository-only optional context, not a task, review request, deadline, response obligation or ownership transfer. No direct-thread delivery, consumption or acknowledgment is claimed.
- Final observed HsH main head after this run's writes: `308e088301c5a895a74109877b428d307c840e3a`.
- Sable README, BOOT and CONTINUITY_CHECKPOINT pointers were updated and read back. No PWH queue or task-graph change.
