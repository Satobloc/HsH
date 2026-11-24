# H974:s2 Amendment 02 — Contact/rotation source readiness and retry reconciliation

**Recorded:** 2026-11-20, after the 15:11Z main-branch readback.  
**Scope:** Additive correction and new source-readiness evidence for the existing H974:s2 report and canonical receipt. This is not a second report, second canonical receipt, new ring activation, P2 selection, publisher retry, or handoff assignment.

## 1. Run-key and scheduler reconciliation

- Nominal UTC hour: h=974; seq=5×974+2=4872; ring index 8 = Hale; next index 9 = Elias Kern.
- Existing :24 task ID: 6abda4c8eda88191bf23a6f2849e9a17.
- Task remains enabled with the exact saved schedule: DTSTART;TZID=America/New_York:20261001T142400; RRULE:FREQ=HOURLY. Prompt and phase were not changed.
- Canonical H974:s2 receipt recorded the same run ID, d23e28a2-bfec-832e-8678-2a3dec92c34e, with an earlier observed start of 14:28:12Z.
- A later exact-ID scheduler peek at 14:55:18Z reported that same run ID with started_at 14:55:17.708846Z, status IN_PROGRESS, completion null and chat_ref null. The duplicate-run guard says retries reuse the run ID. Preserve both observations; this is consistent with a retry or refreshed execution state, not evidence of a second ring activation or authenticated worker identity.
- The task's latest_result still belongs to h973:s2 Ariadne, completed at 13:43Z. It is stale and is not the result of H974:s2. No H974 terminal scheduler completion is claimed in this amendment.
- The :36 Elias Kern run completed at 14:53:06.665698Z after starting at 14:31:20.595331Z. The existing Elias context packet was committed after that start, so its existing POSTSTART_OPTIONAL_CONTEXT_ONLY classification remains correct. No new handoff was created; no direct-thread delivery, consumption or acknowledgment is claimed.

## 2. Current branch and P0 interlock

Final observed HsH main at this amendment: 8a6f766b4d97f3ac088ef05fa880443b46cb5937, commit time 2026-11-20T15:11:19Z. Since the earlier H974:s2 pre-write snapshot, later commits include the generated discovery refresh and other workers' reports/receipts. The eight protected Code Grurple objects remain exact:

| Protected object | Current blob |
|---|---|
| Paper A accepted R1, WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex | 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa |
| Paper B reviewed R1, WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md | 0a1dca42cafd9a02faceff4ec0851659a317b2bb |
| Papers feed, PUBLIC_SITE/PAPERS_FEED.json | e3552fdac0f187b066b59a9742563094efffe011 |
| Presentation gate, PUBLIC_SITE/PRESENTATION_GATE.md | 5f91020d0a71034ad6bed2de0a82ead1f1e48d98 |
| Reader routing registry, PUBLIC_SITE/READER_ROUTING_REGISTRY.md | 277a94c553e2e17b61bb046a04781b4e44f2229f |
| Presentation contract, PUBLIC_SITE/PRESENTATION_CONTRACT.md | b871249564a45278383e41eebd8aaa5d8c64aa3c |
| Generated PDF-series index, PUBLIC_SITE/generated/papers.json | 7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7 |
| Viewer/Whirligig Pages workflow, .github/workflows/deploy-conversation-viewer-pages.yml | 6f3e843b6a327db76b21e8b0b61a26c210b600ac |

The current generated discovery index is blob 0cf8d4795bd61d82113404ebfde6d04785969333. The repository file reader returned zero content; the current index remains identified but unparsed. Older snapshot counts must not be presented as current counts.

P0 issue #1747 remains open/active; its latest observed status comment is #7040988934. No standdown or route acceptance was found. Paper A and Paper B remain PRESENTATION_PENDING / LIVE_ROUTE_NOT_OBSERVED.

PR #2009 remains OPEN / DRAFT / UNMERGED: head ee582b8de93f88f49445c211892529c40b47fded, merge base d47be7cfacfa182aedaad17a9e0841eb80fdfddb, 3 commits ahead and 2,093 behind current main. GitHub currently reports mergeable=false. The three touched paths remain byte-identical between main and merge base: PUBLIC_SITE/AUTOMATIC_DISCOVERY.md (36b2669c328466f0f579e188fbec5796d6ca44dc), tests/test_site_discovery.py (4d646dba614f50b912391c13cd516616700d2ac3), and tools/site_discovery.py (97ff9c6d00544251c05bd6bb6053907805438f3e). Exact-head Actions runs: zero. Formal reviews: zero. This remains a same-path preflight, not integration proof or rebase authorization.

The Lane 24 capsule remains Cycle 08/08 COMPLETE / BACKSEAT / HOLD. P2 issue #565 remains open with no selected measured system. P0 is still active; no P2 selection is authorized.

## 3. Mersearch and existing formalization/tool inventory

Mersearch Worker Start Here specifies four independent connector lanes and the request-scoped output root indexes/mersearch_requests/<request_id>/. All four current request files remain status=requested:

| Lane | Request ID | Request-file blob |
|---|---|---|
| 1 | calder-angle-geometry-source-fidelity-20261102-1337 | 1774cfefe2dd0be5c1c5f4696cdc456d75ac4f6b |
| 2 | archive-harvest-20261025-optics-01 | b7e0d432491962fcb5b8fd9cd5a6d08b7bf1bbe4 |
| 3 | calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001 | bc585da224e66c11da4e71e1e8a17812142aa2bf |
| 4 | kestrel-finite-core-geometry-source-fidelity-20261102-2200 | 9249b3f3969a425c8e94554b8039a3b868200433 |

All twelve expected request-scoped RUN_MANIFEST.json, SEARCH_RECEIPT.json and SEARCH_RECEIPT.md paths returned 404 at the correct output root. No lane is idle. No request was overwritten or retriggered; no new Mersearch run is claimed. No local pinned three-root checkout was available.

As a limited code-search fallback only, GitHub code search returned no .lean path hits for friction, hysteresis, contact, rope or worldtube across HsH, SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES. This is not a Mersearch result and does not prove that no formalization exists. The prior H974 report already checked Math Hopper #578, Lean PR #991, Whirligig Kernel 0 and SciSpace availability; no new tool, dependency, fork, subscription or cost was introduced.

## 4. New external source-readiness findings

### 4.1 Strongest contact candidate: Fantetti et al. round-robin dataset

Dataset: Fantetti, Botto, Schwingshackl and Zucca, Dataset of contact parameters and hysteresis loops from a round robin test for nonlinear dynamic analysis, Mendeley Data v1, DOI 10.17632/gy587m7gx7.1, published 2024-02-09. The dataset page specifies CC BY 4.0. The accompanying Data in Brief article is DOI 10.1016/j.dib.2024.110374; the related Tribology International study is DOI 10.1016/j.triboint.2023.109158.

This is a real measured dry-contact system: 80 304-stainless-steel specimen pairs tested on two high-frequency fretting rigs at Imperial College London and Politecnico di Torino. The dataset description provides raw .dat and .tdms signals, processed .mat data, figures/videos, MATLAB post-processing scripts and test summaries.

The measurement chain is unusually useful for a future contact-response study:
- Laser Doppler vibrometers measure relative displacement close to the interface, with reported accuracy up to 0.05 micrometres.
- Dynamic load cells measure tangential friction force.
- Normal loading is pneumatic at Imperial and dead-weight at Politecnico.
- Hysteresis loops are formed from measured friction force versus relative displacement; contact stiffness is extracted from the stick-region slope, friction coefficient from either a standard friction-limit method or an energy method, and dissipated energy from loop area.
- Imperial acquisition is 60 kHz at 100 Hz excitation; Politecnico acquisition is 100 kHz at 175 Hz excitation.
- The two rigs have different contact approaches and geometries: rigid alignment/one-patch contact versus self-alignment/two-leg contact. Surface roughness also differs (about 0.5 versus 5 micrometres). Only ten test conditions overlap, so they are not interchangeable duplicate measurements.
- Each test ran 2.5 hours; the article reports more than 1.5 million loops per test. The first five seconds were continuously recorded, after which batches of ten loops were sampled at five-minute intervals. The dataset is therefore not a continuous record of every cycle.
- The two rigs cover different ranges of normal load, displacement amplitude and nominal area. The paper identifies four contact regimes/conditions, including stick, microslip, gross slip and separation, and documents chattering and post-processing outliers.
- Repeatability tests found contact-stiffness experimental uncertainty around 25% for Imperial and 60% for Politecnico. Within-test steady-state relative standard deviations were generally below 10% at Imperial except chattering cases, and below 8% at Politecnico for lower stiffness but up to 40% for high stiffness above 300 N/micrometre because displacements were very small.
- The authors' post-processing sensitivity study reports less than 0.9% relative standard deviation for stiffness extraction and less than 0.5% for friction-coefficient extraction. Those are extraction-method sensitivities, not total experimental uncertainty; experimental repeatability is substantially larger.
- The paper recommends running additional nonlinear-dynamics simulations with tangential stiffness adjusted by plus/minus 70% to account for experimental uncertainty. That is a robustness envelope, not a measured probability distribution.
- The authors explicitly note that the displacement readouts are near the contact edge and provide only one- or two-dimensional information, not the full interior contact field. Contact stiffness also depends on the spatial distribution of the worn area, not merely its total area.

This is the strongest source-readiness candidate found in this pass for actual finite-contact/frictional response because the data are openly licensed and include raw signals and processing code. It is not selected for P2. It is not a worldtube dataset and does not establish an H(s)H equivalence. After P0 standdown, a bounded study could begin with one matched test condition, preserve rig-specific boundary conditions and measurement operators, and first retrieve exact file manifests, per-test logs, load-cell calibration and the repeatability/covariance details. No files were downloaded and no calculations were performed.

### 4.2 Rotation candidate: Ratz et al. propeller transient dataset

Ratz et al., Thrust and phase-locked PIV data of a two-bladed propeller accelerating and decelerating in hover at low Reynolds numbers, Zenodo DOI 10.5281/zenodo.23083730; associated preprint arXiv:2611.07862v1.

The README confirms processed ensemble statistics only: instantaneous PIV fields and raw images are not included. It contains a 10 kHz thrust time series averaged over 500 repetitions, plus separate 2D-2C PIV datasets in blade-frame span sections and a lab-frame meridian slipstream plane. The surface-normal coordinates used in the paper are not included. The instantaneous tip-vortex detections are planar detections, not a continuous three-dimensional vortex history. The Zenodo record's license field is blank; public visibility is not a confirmed reuse license.

This remains a useful rotation-response source candidate, but its coordinate systems and missing surface-normal data do not supply a validated three-dimensional composition map. No download or analysis occurred.

### 4.3 False-brinelling contact candidate

Zenodo record 21933698 describes angle and friction-torque measurements and lists a 3.0 GB archive plus an 11.6 MB RDF provenance export. The Zenodo record DOI suffix is 21933698, while a secondary institutional portal lists 21933697. The record's license field is blank. This is a provenance/rights hold, not a ready-to-use dataset. No archive was downloaded.

### 4.4 Rope-like constraints: bounded empirical comparators only

Emri, Nikonov, Zupancic and Florjancic, Time-dependent behavior of ropes under impact loading: a dynamic analysis, Sports Technology 1 (2008), 208–219, DOI 10.1002/jst.62, describes a non-standard falling-weight experiment and an experimental–analytical–numerical treatment of time-dependent viscoelasto-plastic rope response, impact force, jolt, deformation, stored/retrieved/dissipated energy and cycle-dependent stiffness. The authors report strongly nonlinear propagation of input-data error. No openly downloadable raw dataset was located in this bounded search.

Thomas et al., Controllable, High Force Amplification Using Elastic Cable Capstans, ASME IDETC/CIE 2012, paper DETC2012-71295, reports experimental tests of steel cable and uncoated diamond-braided nylon cord on an aluminum capstan. The paper reports force-sensor standard deviations of 0.043346 N (load sensor) and 0.0050451 N (signal sensor), and wrap-angle uncertainty of plus/minus 0.5 degrees. It also documents binding and unpredictable release in the nylon-cord capstan. This is a cable/cord-capstan experiment, not a climbing-rope dataset; no raw dataset was located. The ideal capstan equation is explicitly acknowledged by the authors to omit nonlinear friction, cord extensibility, bending rigidity and other effects.

These sources support treating rope mechanics as a useful first-blush heuristic for questions about tension, contact, bending and history-dependent response. They do not support rope universality, climbing-rope equivalence or direct transfer to H(s)H.

### 4.5 CODATA source discipline

NIST's current published reference remains the CODATA 2022 recommended-values set, Web Version 9.0. The 2022 adjustment is an evaluated least-squares synthesis of experimental and theoretical input data, with a covariance structure; it is not a new direct measurement of every constant. NIST identifies the 2026 adjustment as the next cycle, with eligible input data through 2026-12-31. No CODATA numerical comparison was made in this run. Before any future comparison, the exact CODATA version, input-data provenance, correlations/covariance, adjustment model and stated uncertainty must be bound to the selected measured system.

## 5. Geometry and Lean triage

The contact dataset offers a useful measurement boundary: the physical interface has a spatial extent and a time history, but the available measurements are near-edge displacement readouts plus force signals and derived hysteresis loops. They do not observe the full interior contact field. A future worldtube description would need explicit maps from the specimen geometry and contact region to the measured force/displacement channels, including each rig's alignment, contact geometry, sampling and post-processing. The two rigs cannot be collapsed into one representation merely because they share a material batch.

The source's friction-coefficient and stiffness formulas are operational definitions/estimators. No nontrivial source-faithful theorem was identified that would justify a new Lean module in this source-readiness pass. A proof of algebraic consequences of those definitions would not validate the measurements, the extraction method or an H(s)H interpretation. No Lean module or build was performed.

## 6. Disposition

- P0 Code Grurple remains ACTIVE; Paper A/B presentation remains pending and unobserved.
- Lane 24 remains BACKSEAT / HOLD; Cycle 08/08 remains complete.
- No P2 measured system was selected.
- No physical calculation, numerical fit, prediction, independent measurement or CODATA comparison was performed.
- No raw dataset was downloaded.
- No new Lean module or tooling was created.
- No SAT-O/Blockwave original or corrected equation was modified; no theory or BEDROCK promotion occurred.
- Publisher issue #2198 remains SHA-REJECTED / NOT PUBLISHED. This amendment does not retry, edit or duplicate that submission.
- No new handoff was created. The existing Elias packet remains POSTSTART_OPTIONAL_CONTEXT_ONLY; no direct-thread delivery, consumption or acknowledgment is claimed.

**Next safe cursor after P0 standdown:** evaluate the Mendeley contact dataset's raw archive and exact test mapping, obtain the load-cell calibration and repeatability records, then define a pre-registered single-condition comparison across the two rigs. Preserve the different boundary conditions and acquisition operators. Only after that should any forward geometry-to-equation or reverse equation-to-geometry comparison be attempted. The Ratz dataset remains a secondary rotation candidate with a license and coordinate-map hold. No H(s)H equivalence is presumed.
