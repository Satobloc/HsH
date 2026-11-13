# Hale h803:s2 | Finite-wall vortex-ring measurement map and evidence gate

**Date:** 2026-11-13  
**Run key:** `REVROT3-19-20261011:803:s2`  
**Deterministic selection:** Hale (ring index 8); next Elias Kern (index 9).  
**Identity boundary:** selection is a roster calculation, not an authenticated Hale instance or current Hale thread. The current :24 run has `chat_ref=null`.  
**Current task overlay:** the user supplied Lane Charter 24 (H(s)H generative / CODATA) for this run. Hale's historical specialty remains external-literature scanning and statistical calibration; this work does not resume the old scanner or convert its historical role into jurisdiction.

## 1. Authority, role, and source coverage

Read before work: live HsH BEDROCK (667 lines, blob `0253ace674bbc361464b7bbaac2c41aa3d8e8867`); its controlling Primary Operational Guideline, Nathan Direct 2026-11-08 (511 lines, blob `a8e333b1d5b5aa1d9772366945dd88769d24153c`); Steering Charter 2026-10-26; Three Paper Campaign; three-repository onboarding and New Instance Start Here; Revival Rotation V3 and thread-routing protocol; live task graph; current automation roster; current main branch; recent receipts and handoffs; Hale's historical CHECKINS entry and REV-006 reentry packet; Hale CONTINUITY and recent h799:s3 report/receipt.

The authority order is explicit: the November 8 Primary Operational Guideline supersedes BEDROCK where they directly conflict and remains subordinate to FIE. The current method requires real measured systems, source provenance, units, uncertainties, and prediction-versus-fit separation. It also requires Mersearch first and forbids data-free calculations without Nathan's specific prior permission.

Hale's historical source is the 2026-09-12 CHECKINS entry, an assistant self-report rather than Nathan Direct or a signed charter. Its specialty is external literature-landscape scanning, matched 2024-vs-2026 comparison, code/scoring/statistical analysis, controls, calibration, and explicit external-evidence provenance. REV-006 and Hale CONTINUITY preserve that source boundary and say not to resume scanner v0.4/v0.7 without checking later ownership and supersession. The old scanner's intended full matched-period comparison was not yet executed at the 2026-09-12 checkpoint.

The current user-supplied Lane 24 overlay is used for this run without erasing Hale's historical specialty. No authenticated Hale thread was recovered. The prior Lane 48 Review-MIND entry in Hale CONTINUITY is a dated run-specific overlay, not a permanent identity charter.

### Repository and Mersearch boundaries

- HsH main and the SAT archive front doors were read. The SAT archive remains a historical-source repository, not a substitute for original SAT-O/Blockwave source recovery.
- HSH_RESOURCES metadata and root README were inspected only. Its README explicitly defines it as private/internal reference infrastructure and forbids public cross-links. GitHub metadata currently reports the repository as public. No payload, tool source, or private index was opened.
- Mersearch was not callable in this runtime and no local three-repository checkout was available. The four canonical request files remain occupied with status `requested`: lane 1 trigger `MERSEARCH_REQUEST.json`, lanes 2–4 `MERSEARCH_REQUEST_LANE_2.json` through `_4.json`. The extra `MERSEARCH_REQUEST_LANE_1.json` is an orphan/legacy file without a lane/status and is not a fifth lane. No request was overwritten, retriggered, or replaced. GitHub search was used only for duplicate checking/navigation, not represented as Mersearch.
- SciSpace was used as a secondary literature index. No paid access, subscription, new dependency, fork, or new tool was created.
- The old arXiv scanner v0.7 was not resumed. Its private durable source remains behind the HSH_RESOURCES boundary; no network-capable local scanner runtime or current ownership/supersession clearance was established.

## 2. New source-verified measured-system candidate

**McAtee, William N., and Vrishank Raghav (2026), “Secondary vorticity defines finite-edge effects in vortex ring collisions with plane walls,” *Journal of Fluid Mechanics* 1028, A40.** Published online 6 February 2026. [DOI 10.1017/jfm.2026.11137](https://doi.org/10.1017/jfm.2026.11137). Full article is open access under CC BY 4.0.

This is a controlled vortex-ring/finite-wall contact experiment, distinct from the bubble-vortex, free-surface, rotating-fluid, and helium candidates already recorded in [#1339](https://github.com/Satobloc/HsH/issues/1339), [#1665](https://github.com/Satobloc/HsH/issues/1665), and [#1662](https://github.com/Satobloc/HsH/issues/1662). A duplicate check found this DOI/title absent from those existing issue bodies.

### Physical system and apparatus

- 45 × 45 × 45 cm water tank.
- Nozzle inner diameter 25.4 mm; exit chamfer 15°.
- Flat circular plate diameters 1.5–10 nozzle diameters; fixed formation-length ratio L/Dₙ = 2.
- Syringe pump/linear actuator under LabVIEW control, encoder check of actuator motion, and flow-meter measurement of flow rate.
- Flow visualization covers approximately (Re_\Gamma=600\text{–}2800); quantitative PIV covers approximately (Re_\Gamma=1280\text{–}1925).

The authors report three plate-size regimes: large plates with no detectable edge effect, intermediate plates with weak edge-generated vorticity, and small plates where edge roll-up dominates. This is a result within the explored apparatus/range, not a universal wall law.

### Measurement chain

- Planar time-resolved PIV: 20 μm polyamide particles, 1 mm laser sheet, Phantom VEO 640L camera at 2560 × 1600 pixels, 60 Hz image-pair acquisition and effective saved rate 20 Hz (every third pair), image scale about 27 pixels/mm.
- DaVis 10 processing: 64 × 64-pixel first pass at 50% overlap, then three 32 × 32-pixel passes at 75% overlap, outlier rejection, interpolation of empty regions and 3 × 3 smoothing.
- Quantitative PIV is 2D2C in a symmetry plane through one core in the cross-section of a 3D vortex ring. The paper explicitly does not collect a full 3D velocity field.
- Separate two-dye planar LIF visualizations distinguish the primary vortex and wall/boundary-layer structures. They run at 11 fps and are only approximately time-matched to PIV because camera synchronization is limited; they are qualitative morphology evidence, not exact synchronized samples.
- Derived observables include circulation, core trajectory and velocity, core eccentricity, and a boundary-layer separation indicator. Core identification uses a 10% swirl-strength threshold and local maxima of the Γ₁ field. The separation-point procedure is not claimed to locate the precise physical separation point.

### Uncertainty and access

- Five experimental runs per plate-size/Reynolds-number condition.
- Maximum initial-condition variability: 5.6% standard deviation of the mean at the highest-Reynolds-number case.
- Effective plate size: 2.84 ± 0.07 Dₙ for the nominal 3 Dₙ plate; 1.57 ± 0.034 Dₙ for the smallest plate.
- The 10 Dₙ plate's uncertainty is described as indeterminate; it lies outside the field of view and is classified as effectively infinite.
- Reported average PIV velocity uncertainty: about 2% of peak velocity for the smallest-Reynolds-number case.
- Separation-point data are phase-averaged and used to distinguish surface separation from edge separation, not to establish a precise location. The 2% PIV uncertainty is not a complete covariance budget for circulation, trajectory, or separation observables.
- Data statement: “Data will be made available upon reasonable request.” Three supplementary flow-visualization movies are linked through the article DOI. No raw PIV image pairs, processed vector fields, per-run data package, calibration files, or full covariance package were retrieved. No author data request was sent.

### Observation-map contract and identifiability limit

A source-faithful measurement-map reconstruction is

\[
O_{\Pi}(u)=\left.(u_x,u_y)\right|_{\Pi},
\]

where (u(x,y,z,t)) is the 3D fluid-velocity field and \(\Pi\) is the measured symmetry plane. This is an assistant reconstruction of the observation operator, not an equation asserted by the paper or by Nathan.

The single-plane 2D2C record does not identify arbitrary off-plane velocity components. It can support a cross-sectional vorticity/core-history analysis, but it cannot uniquely determine the full 3D vorticity field or a complete 3D worldtube without additional measurements or explicit symmetry/regularity assumptions. This is a measurement-identifiability limitation, not an H(s)H-specific result.

**Formalization status:** the non-injective observation-map property is a proof obligation, not a Lean-verified theorem. No Lean executable, Lake, or Elan is installed in this runtime. The related Nadir PIV formalization remains in draft PR #1189 (head `33a7cb3cd3adaadabb5a7abd94eaf59bb0ef991e`; Actions run #43339252436 failed). Generic Lean CI PR #262 remains open/unmerged (head `55dc39c0250eac7b01222f0c204d4cdcaf117111`; run #43249977317 failed). PR #873 has a successful exact-head build (head `7dbcb5f18690232d921db74f25dfdf222ee51b8c`; run #43202552666) but is unrelated. Math Hopper PR #991's smoke run #40841280647 succeeded, but its full three-repository pilot remains unverified. PR #1657's run #43332191359 failed. No existing PR was modified and no theorem or Lean run is claimed. The current data-free-calculation permission gate also remains binding.

### Other current contact/rotation candidates

- **Xu, Wang & Wang (2026), “On the drag of vortex rings interaction with a porous wall,” JFM 1037, A38, DOI 10.1017/jfm.2026.11701.** Publisher abstract reports time-resolved PIV/LIF, four hole-diameter cases (d_h^*=0.067\text{–}0.20) at porosity 0.75, FTLE, cross-sectional LIF reconstruction of 3D structures, and pressure fields inferred from PIV using a physics-informed neural network before control-volume drag calculation. Pressure is reconstructed, not directly measured. Full article was temporarily unavailable in the checked publisher view; no uncertainty/covariance or raw-data package was verified. Retain as an abstract-level comparator only.
- The 2026 3D free-surface LPT candidate (DOI 10.1063/5.0312376) is already in #1339. It offers richer 3D spatial tracking but the full text/data access is limited.
- The synchronized SVS + volumetric PTV free-surface study (DOI 10.1007/s00348-026-04256-5) is already in #1665; its support data are available on request.
- The present plane-wall paper is comparatively strong in open full-text method and uncertainty reporting for controlled finite-edge contact, but its quantitative observation is 2D2C.

## 3. CODATA, original equations, and theory boundary

Existing CODATA source/evaluation work remains in [#1558](https://github.com/Satobloc/HsH/issues/1558), [#1438](https://github.com/Satobloc/HsH/issues/1438), and [#1405](https://github.com/Satobloc/HsH/issues/1405). No CODATA numerical value was used and no numerical comparison was performed in this run. No original SAT-O or Blockwave equation was retrieved; no verbatim equation, source SHA/date, or corrected-equation pair was created. WWRD rope mechanics was not revisited; existing rope/source correction work remains in #1234 and #1674 and remains first-blush heuristic only.

No physical calculation, raw-data reanalysis, fit, independent prediction, H(s)H validation, P2 selection, paper-gate advancement, or BEDROCK promotion occurred. P2 remains HOLD.

## 4. Paper gates and current project controls

- P0 Code Grurple: ACTIVE.
- P1 LLM cognition: OVERDUE / NOT READY; Orson retains primary ownership and the approximate 4/5 genuine cognition-work target.
- P2 major measured-system geometry: HOLD. The campaign's next P2 provenance/baseline/uncertainty gate is November 16; first draft/hostile review November 23; manuscript/reader gate November 30.
- P3 full theory: INCOMPLETE; separate December 14 gate.
- FIE last recorded review: November 10; next 14-day review due November 24.
- Task graph remains 16 declared branches against 18 records; Tern retains reconciliation authority. No graph edit.

## 5. Scheduler snapshot and authority

At readback:

- Existing :24 task ID `6abda4c8eda88191bf23a6f2849e9a17` remained enabled with exact hourly America/New_York :24 VEVENT. Current run `97c0b78c-2398-8332-8bff-2b38e4ad4770`, scheduled 11:24Z, started 11:27:59.036727Z, IN_PROGRESS, null completion and `chat_ref`. Its cached `latest_result` points to prior Ariadne run `db09694f-4afc-8327-94b1-26bc43ce80f7`, completed 10:43:56.029082Z, not the current run.
- Existing :00 task ID `6aa1fe0de5e48191b886496095b1343f` remained enabled with exact hourly :00 VEVENT. Run `6e00ad84-7ac4-8320-a3a2-b0a6be05821a`, scheduled 10:00Z, started 10:59:51.033120Z, failed 11:24:52.920429Z, null `chat_ref`; its returned text was “There was a problem with your scheduled task.” No root cause is exposed.
- Existing :36 task ID `6a9f52b69ec08191b0a2ba24a074f781` remained enabled with exact hourly :36 VEVENT. The h803:s3 run `33a10c43-f058-8326-98a1-c243b7e74573` was scheduled 11:36Z, started early at 11:31:07.803873Z, and completed at 11:38:39.415257Z. Its scheduler `chat_ref` is now populated, but this does not authenticate a historical Elias thread. At the 11:36 readback its cached `latest_result` still pointed to prior Alberr run `c3c5c9da-f3bc-832f-ae3f-e5af7c9d812d`, completed 10:39:47.846470Z; by the later readback it had advanced to the current h803:s3 run.
- Existing :48 task ID `6aa6c3bc02b48191b8a91a30d2a155e0` remained enabled with exact hourly :48 VEVENT. h802:s4 run `98d5fd3e-cb14-832c-b824-614d5a388f80` completed 11:03:31.078877Z.
- The :12 task remains disabled. No task, ID, schedule, phase, cadence, prompt, enabled state, ownership, or graph was changed; no sixth task was created.

These are scheduler-record observations only. They do not establish simultaneous model execution, duplicate processes, retry/restart, missed dispatch, liveness, authenticated worker identity, or backend cause. Tern retains scheduler authority.

The :00 failure and :24/:36 result-binding/order observations were appended to Tern's inbox for Comptroller review. No scheduler repair was attempted.

## 6. Publication, continuity, and lateral reading

Public-safe source note: [issue #1684](https://github.com/Satobloc/HsH/issues/1684), `PUBLISHED_VERIFIED`.

- Existing issue publisher run: [#43418718740](https://github.com/Satobloc/HsH/actions/runs/43418718740), conclusion success.
- Publisher comment: #6851772397.
- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/hale-h803-finite-wall-vortex-piv-20261113t1124z-s2-001.md`.
- Artifact blob: `0045f8e99f93064151b5ed0972545d92c6bb3f6e`.
- SHA-256: `1e1937f55f0faf4cbb0bc7d359b5cfaa18be584473e868dfcb1eefdcf17c1474`.
- Independent `fetch_file` readback matched the issue-envelope content exactly (8,167 characters); publisher comment reported the same digest.

The next label is Elias Kern. Personal-context search found no authenticated historical Elias thread; the repository inbox is the only verified fallback. The h803:s3 :36 run started early at 11:31:07.803873Z and completed at 11:38:39.415257Z before this handoff, so the handoff/inbox pointer is POST_COMPLETION_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY. Elias's Track A workflow-switchboard remit is preserved; no physics task, response obligation, deadline, review request, or ownership transfer is assigned. No direct thread delivery, consumption, or acknowledgment is claimed.

Unrelated reading completed: Kenneth Grahame, *The Wind in the Willows*, Project Gutenberg #289, HTML lines 27–179. Next cursor: line 180. This is a deliberate lateral reading switch, not a physical break. FIE rereview is not due until November 24.

**Final classification:** `H803_S2_HALE / FINITE_WALL_PIV_SOURCE_VERIFIED / P2_CANDIDATE_ONLY / P2_HOLD / NO_PHYSICAL_CALCULATION / NO_LEAN_RUN / PUBLICATION_VERIFIED / TERN_SCHEDULER_REVIEW_ROUTED / ELIAS_POST_COMPLETION_OPTIONAL / AUTOMATION_UNCHANGED / NO_SIXTH_TASK / NO_THEORY_PROMOTION`.
