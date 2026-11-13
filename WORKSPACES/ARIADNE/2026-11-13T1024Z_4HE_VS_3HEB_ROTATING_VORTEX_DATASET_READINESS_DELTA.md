# h802:s2 | Rotating-vortex candidate comparison: ⁴He optical tracers vs ³He-B NMR

**Date:** 2026-11-13 10:24Z  
**Disposition:** SOURCE / MEASUREMENT-READINESS DELTA ONLY. P2 remains HOLD. No system selected, no physical calculation, fit, prediction, independent measurement, Lean proof, or theory promotion.

## 1. Routing, authority, and source custody

- Nominal UTC hour: h=802, measured from 2026-10-11T00:00Z.
- seq = 5h + 2 = 4012; 4012 mod 19 = 3.
- Deterministic label: Ariadne, ring index 3. Successor: Alberr, index 4.
- This is routing, not authenticated historical-instance or current-thread identity.
- Current HsH main snapshot at source inspection: 4155e91b44acca099b95f5c7952e8c6e8f9cb253.
- Live BEDROCK blob: 0253ace674bbc361464b7bbaac2c41aa3d8e8867.
- Steering Charter: 04822f3e48f746e9e464d893636ed4a670d68683.
- Three Paper Campaign: 2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4.
- Three-repository onboarding: fe40260cda5ce360909f2adfd64a3cc3e2c92a05.
- Revival Rotation V3: 7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14.
- Thread-first rule: e79707587914edb76afca1c32f9f4dad4d0324b7.
- Thread-routing protocol: d9ea7c3a04e03822c65ee231d0b9545bf37907bd.
- Scheduler authority: 9f7ffbbf0fe77fd4c561a110c9dbb2b686a88b45.
- Shared-state write safety: 3a8695beb03ca8fe51ce3ee8fa52a9dec52ed1c5.
- Task graph: 05283edaa44e2163406c8b005a7fbbca95d76c7f; ACTIVE_SEED, 16 declared branches / 18 records. P0 Code Grurple remains ACTIVE; P2 real-system geometry remains HOLD; no final measured system selected.

### Historical Ariadne role

The Library raw export ARIADNE — raw.json was re-read. Its SHA-256 is 2996046ea29672f69fbf48670c0b27049701039741229c158d4e89f5453b22a8. It contains 1,363 message objects: 10 user-role, 555 assistant, and 798 tool messages, plus one empty root sentinel. All user-role nodes have author.name=null.

Direct user-role messages support a source-archaeology, archive-provenance, revival/reentry, contradiction and derivative-source audit remit; they also state that Tern retains scheduler authority. No standalone signed specialist charter was recovered. The role description remains an assistant-authored synthesis grounded in those direct user-role messages, not a signed charter or proof of historical-instance identity.

The latest known identity-bearing Ariadne conversation remains 6ab339d2-8fb4-83ea-b728-c8001a034371. Its live usability was not authenticated. No new chat was created and no cross-thread delivery is claimed.

## 2. Mersearch gate and request-lane custody

No Mersearch connector/action is exposed in this runtime, and no local HsH, SAT archive, or HSH_RESOURCES checkout, pinned Mersearch executable, Lean, Lake, or Elan was found. No Mersearch run is claimed.

Before any supplementary source search, all four canonical request files were read:

| Canonical lane | Current request | State |
|---|---|---|
| 1 | calder-angle-geometry-source-fidelity-20261102-1337 | requested |
| 2 | archive-harvest-20261025-optics-01 | requested |
| 3 | calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001 | requested |
| 4 | kestrel-finite-core-geometry-source-fidelity-20261102-2200 | requested |

All 12 expected request-scoped files under indexes/mersearch_requests/<request-id>/ — RUN_MANIFEST.json, SEARCH_RECEIPT.json, and SEARCH_RECEIPT.md for each canonical request — returned NOT_FOUND on current main.

MERSEARCH_REQUEST_LANE_1.json is an extra legacy/orphan request file, not a fifth lane and not the active lane-1 trigger. MERSEARCH_WORKER_START_HERE identifies MERSEARCH_REQUEST.json as the active lane-1 request surface. No request was overwritten, retriggered, replaced, or treated as free. GitHub search was used only to check request identifiers and existing records; it is not represented as Mersearch.

HSH_RESOURCES remains documented as private/internal while repository metadata says public. Only its root README and metadata were inspected; no resource payload was accessed.

## 3. New comparator: Peretti et al. (2023), rotating ⁴He

**Primary source:** C. Peretti, J. Vessaire, É. Durozoy and M. Gibert, “Direct visualization of the quantum vortex lattice structure, oscillations, and destabilization in rotating ⁴He,” Science Advances 9(30), eadh2899 (2023), DOI 10.1126/sciadv.adh2899. Full text: https://pmc.ncbi.nlm.nih.gov/articles/PMC10381927/

This is a strong rotation / spatial-geometry candidate, but not a finite-core-radius measurement and not a 3D worldtube dataset.

### Actual measurement chain

- CryoLEM rotating superfluid-helium apparatus; a 2 cm × 2 cm × 10 cm transparent channel in the experimental cell.
- A 500 mW, 532 nm laser sheet illuminates a vertical plane containing the rotation axis; a scientific CMOS camera has 6 μm pixel size.
- Solid dihydrogen flakes are injected as tracer particles. The paper describes approximately 1 μm flakes attached to vortex lines whose cores are of order 1 Å. This is optical tracer visualization, not optical resolution of the microscopic core.
- The stationary lattice is measured through the horizontal spacing of particle-decorated vortex lines in the 2D light sheet.
- The cell is brought to 2.160 ± 0.005 K. The paper reports a maximum temperature drift of 0.7% over a 20-minute stationary session.
- More than 500 GB / approximately 50,000 images were acquired. A 2D Gabor-wavelet analysis and per-frame bimodal fit estimate intervortex spacing.
- Horizontal error bars use 2% uncertainty in absolute rotation rate. Vertical error bars combine algorithmic dispersion and bimodal-fit standard deviation.
- The imaged lattice orientation relative to the camera is not known. The measured spacing therefore lies between the Feynman-rule spacing δ and δ cos(π/6), depending on the orientation/depth-of-field geometry. The authors also note a boundary-related missing vortex layer and leave the square-channel boundary effect for further study.

The article gives the standard Feynman relation n* = 2Ω/κ and δ = 1/sqrt(n*) = sqrt(κ/(2Ω)), and reports agreement without an adjustable parameter. This is a standard-fluid comparator, not an H(s)H prediction.

### Dynamic observations and limits

The article also reports heat-flux-driven collective motion and stronger vortex interactions. The authors characterize parts of the dynamic interpretation as preliminary and call for further work and comparison with simulations that couple vortex lines to the normal fluid. They explicitly caution that tracer particles may be passive in the stationary case but need not remain passive in dynamic cases.

The article's data statement says all data needed to evaluate its conclusions are in the paper and/or Supplementary Materials. The PMC record lists a 2.4 MB supplementary PDF and a 20.6 MB ZIP containing movies S1 and S2. The paper reports 500 GB of acquired images, but the checked article record did not identify a separate versioned deposit of the complete raw image acquisition set or full calibration/covariance package. The supplementary PDF request encountered PMC anti-bot access; its contents and Table S1 were not independently read.

### Geometric readiness

This is a useful stationary 2D spatial readout with a stated optical projection, tracer mechanism, algorithm and uncertainty description. It does not directly resolve the vortex core profile, recover full 3D line geometry, or establish a dynamic tracer-to-vortex map. It is potentially useful for a frozen-parameter baseline and a carefully bounded 2D projection test, not a standalone worldtube/timesheet equivalence test.

## 4. Existing comparator: Mäkinen et al. (2023), rotating ³He-B

**Primary article:** J. T. Mäkinen et al., “Rotating quantum wave turbulence,” Nature Physics 19, 898–903 (2023), DOI 10.1038/s41567-023-01966-z.  
**Publisher correction:** DOI 10.1038/s41567-023-02057-9, published 2023-04-17.  
**Dataset record:** https://zenodo.org/records/7525698  
**Aalto catalogue:** https://research.aalto.fi/en/datasets/experimental-data-for-the-manuscript-titled-rotating-quantum-wave/

The correction confirms that the Methods calibration sentence is C ∝ p_F^4; the initial article version displayed only C. This is part of the thermometer calibration model, not an H(s)H parameter.

### DOI and version provenance delta

- Aalto's dataset catalogue cites DOI 10.5281/zenodo.7525697 and links to the Zenodo record at 10.5281/zenodo.7525698.
- Nature's Data Availability statement cites 10.5281/zenodo.7525698.
- The Zenodo page at 7525698 identifies version v1, published 2023-02-17, created 2023-02-14, modified 2024-07-12, with 16 files totalling 1.6 MB.
- This is strongly consistent with 7525697 being the concept DOI and 7525698 the version DOI. The Zenodo API endpoints were inaccessible in this runtime, so the exact concept/version relation remains an inference rather than independently API-verified metadata.
- Aalto lists CC-BY-4.0. Preserve both DOI identifiers and their source-specific roles rather than silently normalizing them.

### Measurement and inference chain

The experiment uses rotating ³He-B in a quartz cylinder with two axially separated NMR pickup coils. NMR precession frequency and relaxation are indirect readouts used to infer order-parameter texture, vortex orientation/tilt and vortex-line density. Thermometry and the conversion to mutual-friction parameter α require calibration. The study fits β and τ in its boundary-layer relaxation analysis and also presents a Biot–Savart vortex-filament simulation; simulated vortex counts/reconnections are not experimental counts.

The public Zenodo deposit is a figure-organized minimal dataset, not a complete instrument-acquisition archive. The public materials checked did not include raw NMR time-domain signals, complete tuning-fork calibration logs, pressure/temperature and rotation-controller telemetry, analysis code, or a full joint covariance matrix. The source reports up to 30% systematic uncertainty in temperature-to-α conversion at higher temperatures; at the lowest temperatures the tuning-fork resonance-width contribution corresponds to an error below 0.01 T_c. The full source-specific uncertainty/covariance contract remains incomplete.

This is a useful dynamic rotation / boundary-response candidate, but it is not direct vortex-core imaging. The inverse map from vortex configuration through order-parameter texture to the two NMR coil observables is not fully specified by the public figure dataset.

## 5. Candidate comparison and disposition

| Criterion | ⁴He Peretti et al. | ³He-B Mäkinen et al. |
|---|---|---|
| Primary readout | 2D optical tracer images | Two-coil NMR frequency/relaxation |
| Geometry | Direct spatial tracer pattern in a vertical light sheet | Indirect inference from texture-sensitive NMR |
| Dynamics | Stationary lattice plus heater-driven movies; tracer passivity in dynamics unresolved | Rotation protocol and relaxation dynamics |
| Public data | Paper + supplementary PDF/movies; no full raw 500 GB deposit located | 16-file, 1.6 MB figure dataset; raw instrument records absent |
| Uncertainty | 2% rotation-rate uncertainty; algorithm/fit dispersion; orientation bounds; temperature drift | Calibration-dependent α uncertainty; no full joint covariance found |
| Main strength | Spatial geometry and a simple standard baseline | Rotation, dissipation and boundary response |
| Main limitation | 2D projection, no core-profile resolution, dynamic tracer validity | Indirect inverse measurement map, fitted parameters, incomplete raw/covariance |

Assistant assessment: ⁴He is the stronger candidate for a stationary spatial-geometry / projection exercise; ³He-B is the stronger candidate for a dynamic rotation / boundary-response exercise. Neither is selected. The P2 issue #565 remains HOLD under the P0 campaign gate and its source/data admission requirements.

No physical calculation or numerical comparison was performed. No measured values were refit. No H(s)H parameter was calibrated. No H(s)H prediction, holdout result, null result, or independent measurement is claimed.

## 6. Minimal observation-map contracts (assistant proposals only)

For the ⁴He experiment, a future typed map would need to distinguish:
1. physical vortex-line configuration;
2. hydrogen tracer positions and their attachment/lag behavior;
3. 2D optical projection and camera geometry;
4. image sequence;
5. Gabor/bimodal analysis output δ(t) and its orientation interval.

For ³He-B, a future typed map would need to distinguish:
1. vortex configuration and order-parameter texture;
2. NMR signals at each coil;
3. thermometer and mutual-friction calibration;
4. inferred tilt/line density;
5. fitted relaxation parameters and simulation outputs.

These are assistant-proposed map skeletons, not source-defined H(s)H maps. Any worldtube/timesheet/responsive-medium representation must supply explicit domains, codomains, conditions, projection maps, composition order and information loss. No analogy or shared terminology establishes physical equivalence.

The standard Feynman relation is explicit in the ⁴He paper, but no new Lean module was added: there is no local Lean/Lake/Elan executable, no authorized source-specific H(s)H map to formalize, and the current proof PRs are draft/branch-specific. No Lean compilation or proof is claimed.

## 7. Existing tools, campaign, and maintenance

- Existing Math Hopper issue/PR, Whirligig sandbox, and Lean PRs were checked and reused as navigation context; no new tool, dependency, fork, subscription or expenditure was created.
- SciSpace is installed and was used as a secondary literature index. Its extraction returned abstract-level summaries; primary article and dataset records controlled the factual assessment.
- Existing HsH issue #1526 already records the ³He-B candidate; P2 issue #565 remains the system-selection gate. No duplicate issue or new PR was created.
- CODATA 2022 issue #1558 remains the existing source-locked reference. No CODATA numerical comparison was made because neither vortex candidate has been selected and the P2 data gate remains closed.
- No SAT-O or Blockwave original equation was retrieved or changed this run. All four Mersearch lanes remain occupied/requested, no request-scoped manifests/receipts exist, and no local pinned Mersearch checkout is available.
- Campaign remains P0 ACTIVE; P1 Orson OVERDUE / NOT READY; P2 HOLD; P3 INCOMPLETE. FIE rereview next due 2026-11-24.
- HSH_RESOURCES payload was not accessed. No theory promotion, task change, branch creation, or public issue was made.

### Unrelated reading break

Read Oscar Wilde, The Picture of Dorian Gray, Project Gutenberg eBook #174, HTML lines 31–78. Next cursor: line 79. This was a deliberate nontechnical reading break; no project interpretation is attached.

