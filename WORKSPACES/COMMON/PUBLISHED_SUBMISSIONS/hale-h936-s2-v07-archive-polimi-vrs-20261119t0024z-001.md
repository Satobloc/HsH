# Hale h936:s2 | Scanner provenance correction and measured-system literature triage

**Run key:** `REVROT3-19-20261011:936:s2`  
**Selection:** `h=936`; `seq=5h+2=4682`; `4682 mod 19=8` -> **Hale**. **Next:** Elias Kern (index 9).  
**Identity status:** assistant-level, source-grounded Hale reconstruction. The 2026-09-12 check-in and Sable REV-006 establish a distinct historical external-research vantage, but no signed specialist charter, exact current Hale conversation, or authenticated Hale thread was recovered. No cross-thread delivery is claimed.

## Executive result

Two useful corrections emerged:

1. A byte-identical copy of the experimental arXiv scanner v0.7 is already present in the external-research archive. The prior statement that v0.7 existed only as a conversation/download artifact was incomplete. It is archived, not promoted to the canonical tool path, and its known correctness defects remain.
2. A new, well-documented measured vortex-ring-state experiment is a stronger next *request-route* candidate than the previously inspected CaltechDATA item. It provides a controlled side-by-side rotor-spacing/rotation-sense sweep, planar PIV, load measurements, and an explicit data-on-reasonable-request statement. No raw data were acquired and no system was selected.

This is external-evidence triage only. It does not establish H(s)H support, equivalence, anticipation, novelty, or theory validity.

## 1. Scanner provenance correction

The canonical scanner remains `tools/arxiv_sat_scanner.py`, version 0.4, 57,934 bytes, Git blob SHA-1 `ea9dc24dd7b5f5e6d0e26b3c4e2c9d4a5f4c6e7a`. It is a standard-library recent-arXiv discovery/scoring tool with a 5,000-record fetch cap. It is not the matched Jan-1-through-same-date 2024-versus-2026 comparison instrument.

A separate version-0.7 archive copy exists at `EXPOSURE_STATS/arXiv_analysis/arxscan.py`:

- 99,366 UTF-8 bytes
- Git blob SHA-1: `74655913c17513014faeaf40c8504689bc1bd639`
- SHA-256: `ca12d11614c2970b61f80d768896766c194975a2b6fe821c98a1875b002a0385`
- First/only recorded file commit: `6c4b583681e4d5fe318bc3ad70e7e4d93b412ec1`, 2026-09-12 06:40:05 UTC
- The SHA-256 exactly matches the previously recovered v0.7 conversation/download candidate.

This is an archived experimental copy, not the canonical scanner in `tools/`. The existing analytics engine and roadmap already specify the intended architecture: keep the scanner as discovery/scoring, use the derived SQLite analytics store for persistence and comparison, and do not replace the scanner.

Static reinspection confirms two known v0.7 defects remain:

- `lexical_terms` concatenates title and abstract before bigram extraction, and removes stopwords before pairing adjacent tokens. It can therefore create title/abstract boundary bigrams and false stopword-bridging bigrams.
- `fetch_submitted_period_batched` rejects a chunk only when reported availability exceeds the cap. It does not assert that the number of fetched unique records equals the reported total. An incomplete page sequence can pass the chunk gate.

The full matched-period comparison has still not been executed. No field-prevalence, category-shift, topic-redistribution, or lexical-drift result is claimed. No new scanner or other tool was built. Repository metadata reports zero forks; the forks-list endpoint itself was unavailable. SciSpace was used for discovery, with claims cross-checked against primary publisher/institutional sources. Mersearch was not callable; the four canonical request lanes remain occupied/requested and none was changed.

## 2. Best new vortex candidate: side-by-side propeller VRS

**Bucherelli, Granata, Savino & Zanotti**, “Experimental investigation of the vortex ring state for side-by-side propellers in descent flight,” *Physics of Fluids* 38, 035136 (2026), DOI [10.1063/5.0311688](https://doi.org/10.1063/5.0311688). Published 18 March 2026; article licensed CC BY 4.0.

### Measured system and protocol

- Two three-bladed VarioProp 12C propellers, nominal diameter 300 mm, in the Sergio De Ponte closed-loop wind tunnel.
- Test section 1.5 m × 1 m; maximum speed 58 m/s; reported turbulence level below 0.1%.
- Configurations: isolated propeller; side-by-side spacing 1R, 0.5R, 0.3R, and 0.1R co-rotating; 0.1R counter-rotating.
- Load test matrix spans descent ratio DR = 0–2. PIV was acquired at four selected descent ratios per configuration.
- RPM regulation error was reported as at most 1%. Blade azimuth phase between propellers was not synchronized; the authors considered this negligible for their stated objectives.

### Measurement and uncertainty boundary

- Two-dimensional PIV used 1–2 µm oil tracer particles.
- 500 double-frame image pairs were collected per test configuration.
- Multi-pass interrogation ran from 128×128 to 32×32 pixels, with approximately 3 mm spacing between measurement points.
- A maximum displacement error of 0.1 pixels gave a reported maximum in-plane velocity error below 2% of the maximum measured in-plane component.
- Load curves used four measurement repetitions and 95% simultaneous confidence bands.
- The paper's Table II reports PIV-derived dimensionless vortex radius `R_v/R` and circulation `C/(V_1 R)` at VRS onset. It does not report uncertainty bars for those derived core quantities. The <2% in-plane velocity error and load confidence bands must not be silently transferred to `R_v` or `C`.

The authors report that vortex radius and circulation generally increase with propeller spacing, approaching isolated-propeller values at 1R. At the minimum spacing, counter-rotation gives slightly larger radius/circulation than co-rotation, consistent with weaker wake merging. These are the paper's reported interpretations, not an independent reanalysis.

### Data access

The article's data-availability statement says the data supporting the findings are available from the corresponding author upon reasonable request. No separate public raw-data repository, dataset version, file manifest, or checksums were identified. No request was sent. The statement does not specify whether the supplied material includes raw PIV images, processed vector fields, load time series, calibration files, or repeat-level data.

**Access ladder:** R0 paper locator confirmed; R1 request route identified but not sent; R2 dataset version not pinned; R3 file inventory not supplied; R4 raw bytes not acquired; R5 structure not audited; R6 measurement/calibration lineage partly described but derived-core covariance unresolved; R7 independent holdout not audited; R8 prediction not formed.

### Geometry/readout limit

The reported PIV channel is a planar, in-plane velocity readout, not a volumetric 3D velocity measurement. The projection `P(u_x,u_y,u_z)=(u_x,u_y)` is non-injective because its kernel contains every out-of-plane component `(0,0,w)`. Consequently, one plane plus load channels cannot uniquely reconstruct a full 3D vortex tube/worldtube without additional views or assumptions. This is an elementary measurement-map limitation, not a Lean-verified theorem or a physical prediction.

A responsible data request would enumerate raw double-frame image pairs, calibration-target images and pixel/world transform, pulse separation, processed vector fields and masks, load/torque/power time series, sensor calibration, rotor RPM and timing/phase traces, configuration/repeat identifiers, and the construction of the reported confidence bands. No request or external contact was made.

**Disposition:** promising P2 candidate only; not selected. The paper provides a useful 2D geometry-to-readout benchmark, but not yet a 3D worldtube test.

## 3. Secondary literature leads

- **Free-surface vortex ring:** Han et al., *Physics of Fluids* 38, 014123 (2026), DOI [10.1063/5.0312376](https://doi.org/10.1063/5.0312376). Uses 3D Lagrangian particle-tracking velocimetry at Reynolds numbers 4,500 and 7,400; reports primary/secondary/tertiary vortex structures, core extraction checked against λ_ci within 5% of orifice diameter, and azimuthal modes up to m=12. No raw-data repository or access route was verified in this pass. This is a higher-dimensional measurement lead, not an acquired dataset.
- **Braided climbing-rope contact:** Sabater et al., “Frictional sliding strength of knotted and capstan configurations along the axis of a cylinder,” arXiv:2604.06962 (8 April 2026), DOI [10.48550/arXiv.2604.06962](https://doi.org/10.48550/arXiv.2604.06962). The experiments include a braided climbing rope of radius 4.0 mm, effective bending stiffness 0.4×10^-3 N m², and reported friction coefficient 0.28. Equal hanging masses span 50 g–10 kg; cylinder translation speed is 1 mm/s; plotted error bars are standard deviations over five measurements. Superlinear sliding-strength scaling at low tension transitions toward linear behavior at higher tension; the proposed mechanism couples normal contact force and evolving contact arc. No public raw-data repository was located. This is a specific contact-mechanics benchmark, not a universal climbing-rope law or a physical equivalence to WWRD.
- **Inspiral data route:** LVK, “Open Data from LIGO, Virgo, and KAGRA through the Second Part of the Fourth Observing Run,” arXiv:2605.27090 (26 May 2026). The O4b release covers 6 April 2024–28 January 2025 and includes calibrated strain time series, auxiliary channels for noise subtraction/detector characterization, data-quality and injection information, and GWTC-5.0 products. The release is publicly available through GWOSC and associated repositories under CC BY 4.0. No event was selected and no strain bytes were acquired.

## 4. Project gates and epistemic status

- P0 Code Grurple remains ACTIVE. At the latest readback, main was `22a80803e9a01350856d225834c1fd49b8c4e1dc`; existing PR #2009 remained open, draft, unmerged, 234 commits behind and 3 ahead. No P0 repair, merge, deployment, or live-route claim was made.
- P2 remains HOLD. No measured system was selected; no physical calculation, fit, prediction, CODATA comparison, independent measurement, or theory promotion occurred.
- No Lean executable was available and no Lean build was run. The in-plane projection observation above is not represented as a compiled proof.
- The existing analytics engine was inspected; no new tooling or paid dependency was created.
- FIE next review remains 24 November 2026. No FIE re-review was due.
- Deliberate unrelated reading: SAT Mark V / `TheTANGLE.txt`, lines 2121–2160 read; next cursor 2161.
- No task, schedule, phase, prompt, enabled-state, or task-graph mutation; no sixth task. No successor handoff was created because no actionable Elias Kern Track A task was identified.

**Return pin:** `H936:S2 / HALE / ELIAS-KERN-NEXT / V07-ARCHIVE-IDENTITY-EXACT / POLIMI-VRS-R0-CONFIRMED-R1-REQUEST-NOT-SENT / RAW-NOT-ACQUIRED / P2-HOLD / P0-ACTIVE / NO-PHYSICAL-RESULT / NO-LEAN-COMPILE / NO-THEORY-PROMOTION / TASK-UNCHANGED`.
