# Ariadne h1106:s2 | DLR multicopter VRS source-lineage and observation-map screen

**Date:** 2026-11-26  
**Run key:** REVROT3-19-20261011:1106:s2  
**Selection:** h=1106; seq=5h+2=5532; 5532 mod 19=3 -> **Ariadne** (index 3). **Next ring label:** Alberr (index 4).  
**Disposition:** NEW_EXTERNAL_SOURCE_SCREENED / DLR_2025_2026_ONE_EXPERIMENTAL_LINEAGE / GARTEUR_CROSS_FACILITY_NOT_FULLY_INDEPENDENT / P2_HOLD / NO_SYSTEM_SELECTED / RAW_DATA_NOT_ACQUIRED / NO_PHYSICAL_CALCULATION / NO_CODATA_COMPARISON / NO_THEORY_PROMOTION.

Ring selection is routing metadata, not authentication of a historical worker or ChatGPT thread. The November 9 “Hi Ariadne” conversation remains an unidentifiable candidate: no exact conversation ID or URL and no subsequent user activity were recovered. The full historical Ariadne export was read from the Library (10 user-role messages; 6,226,127 bytes; SHA-256 2996046ea29672f69fbf48670c0b27049701039741229c158d4e89f5453b22a). Its direct user messages authorize broad archive inspection/reproduction bounded by onboarding and active workflows, and explicitly leave scheduled-task control with the Comptroller. No separately signed specialist charter was found. This is a source-grounded revival, not authenticated historical-instance participation; no cross-thread delivery or new-chat creation is claimed.

## 1. New source: DLR multicopter vortex-ring-state campaign

**Longobardo et al.**, “Experimental investigation of vortex ring state for multicopters,” Aerospace Science and Technology 180 (2027), 114126. DOI [10.1016/j.ast.2026.114126](https://doi.org/10.1016/j.ast.2026.114126). Available online 28 October 2026. [DLR repository record](https://elib.dlr.de/228704/) and [published PDF](https://elib.dlr.de/228704/1/ELIB-Eintrag-2026-HeintzA-228704-PaperPublished.pdf).

The study is an actual measured rotor/air-flow system, not an H(s)H filament or a rope experiment. It tests single-rotor, dual side-by-side, dual tandem and quadrotor configurations in descent. The reported rotor has two fixed-pitch blades, radius 0.196 m, and a nominal 4800 rpm (80 Hz) operating rate. The descent-angle range is 40–90 degrees and normalized descent rates are -0.4 to -1.7. The quadrotor uses a 90-degree neighboring-rotor phase offset and rotor spacing about 1.05 diameters.

### Measurement chain and reported observations

- Thrust and power are measured alongside planar stereoscopic PIV (S-PIV).
- S-PIV uses two cameras at approximately 100 degrees, a 5 mm laser sheet, 2 micrometre DEHS tracers, and 15 Hz acquisition. The paper reports 700 image pairs per measurement condition and stereo-calibration error below 0.1 pixel.
- Rotor speed/phase is monitored within 1 degree of the expected position. Load data are sampled at 30 kHz; tunnel speed, pressure, temperature and density are logged.
- The authors report maximum mean-thrust reductions of roughly 25–30%, with quadrotor thrust fluctuations about twice the single-rotor case. They interpret the quadrotor S-PIV field as one recirculation region wrapping around the device, forming a unified vortex ring.
- The extended PIV region is assembled from two platform orientations using a device-symmetry assumption. The paper also reports front/rear rotor load asymmetry. That symmetry-based stitching is therefore a specific observation-map condition to test against raw fields and load traces, not evidence that the published result is wrong.

### Model dependence and access limits

Appendix A compares two reference-velocity normalizations: one using measured thrust and one using hover thrust. The authors report a shift of about 0.17 in the location of minimum thrust between the normalizations, and differences up to 50% in high non-dimensional-velocity regions. This is model/normalization dependence, not a measurement error; any future comparison must freeze the normalization before fitting or holdout evaluation.

The data-availability statement says the data will be made available on request. The DLR repository record exposes the paper PDF, not raw S-PIV images, processed vector fields, load time series or calibration files. The paper reports calibration and phase tolerances but does not provide a complete load/flow uncertainty covariance or a cross-channel synchronization specification. No author request was sent and no raw bytes were acquired.

The S-PIV result is three velocity components on a planar, finite-thickness sheet, not a volumetric 3D flow measurement. The time stack of that plane is not automatically the H(s)H timesheet. The “unified vortex ring” is the authors' interpretation of the measured planar fields and their stitching procedure, not a direct 4D worldtube observation.

## 2. Source lineage: do not double-count the DLR campaign

The 2026 journal paper cites the same authors' 2025 European Rotorcraft Forum paper, “Experimental Investigation Of Vortex Ring State For Multicopters,” [ERF2025-142](https://dspace-erf.nlr.nl/items/fb74536c-9f6b-46c9-97a0-641fe6d71a01). The 2025 conference abstract reports only isolated-rotor and quadrotor configurations; the 2026 journal article expands the reported campaign to include dual side-by-side and tandem configurations. Same author team, same GARTEUR AG28 VRS campaign and overlapping configuration family: treat these as one experimental lineage, not two independent replications. The extent of raw-data reuse is not established from the available records.

The already-published Hale h936 source screen covers the separate Politecnico di Milano side-by-side propeller study, [Bucherelli et al., DOI 10.1063/5.0311688](https://doi.org/10.1063/5.0311688): [existing HsH report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/hale-h936-s2-v07-archive-polimi-vrs-20261119t0024z-001.md). That is a different facility and author team, but it also belongs to GARTEUR AG28. It is cross-facility evidence within a shared consortium, not a wholly independent research programme. Its raw data are likewise available on request. No duplicate Polimi report was created.

**Independence vector:** DLR 2025 conference and DLR 2026 journal = same source lineage; Polimi = different facility/team and measurement chain, shared GARTEUR AG28; Barckicke Nature/PRL Kelvin-wave work = separate research group and physical platform, with the PRL follow-up still same-group and raw data on request. None currently supplies an acquired, independent raw-data holdout for H(s)H.

## 3. Geometry-to-observation contract

The current BEDROCK treats H(s)H as a proposed, status-preserving worldtubification of SAT; the current Kerr-ER-Pauli twisted-vacuum particle picture remains tentative. Do not identify a classical rotor vortex with an H(s)H worldtube.

The FIE source's original 1D worldline/filament intersecting a 3D time surface in 4D has a point-like intersection under transversality. The later support-type alternatives are not interchangeable: a 2D worldsheet with a 3D hypersurface gives a 1D intersection; a 3D support with a 3D hypersurface gives 2D; a full 4D core region with a 3D hypersurface gives a 3D slice. The support type must be declared before a “particle intersection” or finite-core readout is assigned.

Existing conditional mathematics was cross-read, not newly authored:

- [Kestrel PR #873](https://github.com/Satobloc/HsH/pull/873), exact head 94b6d96c91806a95505260a3c52220f4af294185, successful exact-head Actions run [#44090154878](https://github.com/Satobloc/HsH/actions/runs/44090154878), job 134062868110, 8,956 build targets. KestrelIntersectionDimensionGate gives the conditional dimension counts; KestrelProjectedIncidence formalizes that projected overlap can be spurious and that readout factorization requires fiber-constancy. The theorem-specific axiom output includes standard propext, Classical.choice and Quot.sound; no sorryAx was found in the inspected log. Global axiom audit, tests, lint, leanchecker and nanoda were not run. PR remains open/draft/unmerged.
- [Ravel PR #1133](https://github.com/Satobloc/HsH/pull/1133), exact head 95f508ed2625b169f36803479b9c1484b3e93374, successful exact-head Actions run [#45711289709](https://github.com/Satobloc/HsH/actions/runs/45711289709), job 139546074968, 8,959 build targets. RavelDirectedSliceChainComposition proves slice-pullback/composition results under explicit commuting and retraction witnesses. PR remains open/draft/unmerged. These two PRs are separate; no integrated cross-PR theorem is claimed.

For this DLR system the minimal observation chain is:

rotor geometry + operating condition -> responsive air-flow field -> planar S-PIV projection -> processed velocity field

and separately:

responsive air-flow field -> load/torque/power sensors -> calibrated load series.

The S-PIV projection, symmetry-based stitched region, load calibration, timebase alignment and normalization must be explicit maps. A future H(s)H comparison would additionally require a source-defined map from the chosen worldtube/timesheet support to the responsive-medium state. That map is currently absent. The existing Lean results supply conditional map and projection machinery; they do not establish the physical map or validate the vortex interpretation.

## 4. CODATA and physical-calculation gate

NIST still lists CODATA 2022 Version 9.0 as the latest available recommended set; its input data cutoff is 31 December 2022, and the 2026 adjustment is not yet published. CODATA values are evaluated through a least-squares adjustment of heterogeneous measurement/theory inputs, not a single measurement or an unweighted list; the adjustment's covariance/correlation structure must be retained. The DLR rotor-flow observables use measured air density, velocities, thrust, rotor geometry and operating conditions; no CODATA fundamental constant enters the reported comparison. Therefore no CODATA numerical comparison is appropriate here. If a future H(s)H prediction introduces fundamental constants, use the NIST adjustment version and its correlations/covariance before numerical comparison.

No physical calculation, fit, H(s)H prediction or uncertainty propagation was performed: raw data, full measurement covariance, load uncertainty and synchronized channel lineage are missing. The reported values remain paper-reported measurements/calibrations, not an independent reanalysis. No rope universality or WWRD equivalence is inferred.

## 5. Project disposition and controls

- The DLR source is a new candidate screen only. It is a rotational vortex-ring/recirculation system, not a direct finite-core filament measurement, not material contact, and not an inspiral. It may constrain a responsive-medium/observation map if raw data and uncertainty are supplied.
- P2 remains HOLD; no measured system is selected and no paper gate is advanced. The P2 register remains [issue #565](https://github.com/Satobloc/HsH/issues/565). No graph, queue or worker checkpoint was changed.
- Lane 24 remains Cycle 08/08 complete / HOLD / no Cycle 09. P0 Code Grurple remains active: discovery source currentness PASS, presentation safety FAIL, deployment NOT VERIFIED. See [issue #1747](https://github.com/Satobloc/HsH/issues/1747).
- P1 cognition remains overdue and Orson-owned; P3 full theory remains incomplete for 14 December. FIE's last full rereview was 24 November, next due 8 December; the unrelated-source break is due 28 November. Neither was repeated early.
- Mersearch's four canonical lanes remain occupied; no new request or overwrite was made. The DLR sources were found through public-source discovery, not represented as Mersearch results. HsH, SAT archive and HSH_RESOURCES front-door documentation were checked; no private HSH_RESOURCES payload was opened.
- Existing tooling checked: Kestrel/Ravel Lean PRs, Math Hopper issue #578 and draft PR #991, Whirligig Kernel 0 (sandbox only), and connected SciSpace. No new tool, dependency, fork, subscription or paid service was created. No local Lean installation was present; existing GitHub Actions builds were inspected.
- SAT-O/Blockwave source equations were not modified. No BEDROCK theory promotion, signet, chat rename, task mutation or sixth task.

## 6. Revival and return

Latest authenticated Ariadne thread was not recovered. The November 9 “Hi Ariadne” candidate has no exact ID/URL and no later user activity. The current scheduled run is not an authenticated Ariadne instance. This is a source-grounded revival only.

Next ring label is Alberr. No handoff, inbox write or assignment was created; no actionable work was routed into another worker's charter. The existing :24 Geometry automation remains enabled with its original task identity, hourly schedule, phase and prompt.

**Return pin:** H1106:S2 / ARIADNE / DLR-VRS-2025-2026-SAME-LINEAGE / GARTEUR-CROSS-FACILITY-NOT-FULLY-INDEPENDENT / P2-HOLD / RAW-NOT-ACQUIRED / NO-CODATA-COMPARISON / NO-PHYSICAL-RESULT / KESTREL-RUN-44090154878 / RAVEL-RUN-45711289709 / P0-FAIL / NO-HANDOFF / TASK-UNCHANGED.
