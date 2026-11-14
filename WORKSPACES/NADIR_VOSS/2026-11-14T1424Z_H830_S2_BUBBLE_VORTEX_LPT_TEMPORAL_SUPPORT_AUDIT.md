# Nadir Voss h830:s2 | Bubble-vortex 4D-LPT temporal-support audit

**Run key:** REVROT3-19-20261011:830:s2  
**Nominal slot:** 2026-11-14T14:24Z  
**Selected identity:** Nadir Voss (ring index 10)  
**Next identity:** Enheduanna (ring index 11)  
**Status:** source-grounded measurement audit complete; P2 remains HOLD.

## 1. Historical authority and scope

The raw Nadir source export was checked. It contains direct user authorization for an independent sandbox and source-grounded geometric/model exploration, but no standalone signed Nadir specialist charter. The current Lane 24 instruction is the controlling task-specific direction. The later Nathan Direct proof/data rules govern: mathematical claims require formalization where appropriate, and physical calculations must be anchored to an identifiable measured system with provenance, units, uncertainties, and a clear fit-versus-prediction distinction.

The older Nadir PLAYGROUND_001 proposal includes a data-free finite-core tube construction with an arbitrary epsilon and a numerical commutator test. That experiment was not run. Under the later data-first rule it remains BLOCKED_PENDING_MEASURED_GEOMETRY. No arbitrary epsilon, fitted constant, legacy particle label, or synthetic physical fixture was introduced.

## 2. New bounded result

The existing P2 candidate in HsH issue #1339 is a stronger worldtube/medium testbed than the previously emphasized planar PIV examples: a rising bubble interacts with a finite vortex ring while time-resolved 3D-LPT and bubble-surface reconstruction are acquired together.

The new finding is not a new physical effect. It is a measurement-resolution audit: the paper reports a third-order polynomial fit over 15 steps for velocity reconstruction. At the reported 1496 Hz acquisition rate, that fit support is a substantial fraction of the characteristic ring time in all three cases. The exact filter response is unknown, so this is a sensitivity-test requirement, not a claim of bias.

A public-safe addendum was submitted through the existing issue publisher as issue #1740, explicitly linked to #1339 and explicitly marked as an addendum rather than a new candidate. Publisher status is tracked separately below.

## 3. Source and version custody

**Version of record:** Estepa-Cantero et al., “Three-dimensional experimental investigation of the interaction between a rising bubble and a vortex ring,” Journal of Fluid Mechanics 1045 (2026), A27; published online 2026-10-16; DOI 10.1017/jfm.2026.12078.

**Detailed methods and tables used in calculations:** author-uploaded arXiv v1, submitted 2026-06-06, arXiv:2606.08193. The Cambridge version-of-record page and supplementary list were checked, but the complete final article PDF was not retrieved. The detailed numerical method statements below therefore remain preprint-v1 claims pending final-version cross-check.

The final Cambridge page lists three raw six-camera supplementary image movies at 1496 Hz:
- Case I, movie 2: 43.8 MB, DOI 10.1017/jfm.2026.12078.sm002
- Case II, movie 3: 37.7 MB, DOI 10.1017/jfm.2026.12078.sm003
- Case III, movie 4: 44.9 MB, DOI 10.1017/jfm.2026.12078.sm004

The full processed trajectories, calibration transforms, covariance products, and analysis scripts are not present in the public Zenodo preprint-PDF record. The paper states that supporting data are available from the authors on reasonable request. No author request was sent. The raw supplementary bytes were not downloaded or processed.

## 4. Measurement chain and uncertainty

The experiment uses six high-speed cameras at 1496 Hz. The flow field is reconstructed with Shake-The-Box from four frontal camera views; bubble geometry is reconstructed from six camera views with MLOS. The paper reports 80,000–100,000 tracks per experiment and an Eulerian velocity grid of approximately 0.7–1.0 mm.

Calibration is described as an 11-position target with 10 mm spacing, refraction correction, and volumetric self-calibration for each experimental set. Reported image scale is 17.91 px/mm. The paper reports velocity uncertainty below 2% near the vortex and up to 10% in the far field. It states that particle trajectories are fitted with a third-order polynomial over 15 steps to obtain velocity.

Unresolved source details:
- whether “15 steps” means 15 samples or 15 intervals;
- whether the polynomial window is centered or causal;
- how tracks shorter than the full fit window are treated;
- exact inter-camera timing uncertainty;
- per-case calibration transforms and the covariance of derived circulation, radius, velocity, and enstrophy;
- the exact relationship between the six-view bubble reconstruction and the four-view STB flow reconstruction at the frame level.

The paper describes simultaneous measurements, but simultaneity alone does not supply a numerical synchronization uncertainty or the complete composition map.

## 5. Temporal-support calculation

The camera interval is 1/1496 s = 0.668449 ms. A 15-sample window spans 14 intervals = 9.358 ms; if “15 steps” means 15 full intervals, the span is 10.027 ms.

Using the initial ring radius R0 and circulation Gamma0 in Table 2 of arXiv v1, the characteristic ring time is R0^2/Gamma0. Gamma0 values were converted from cm^2/s to m^2/s.

| Case | R0 (mm) | Gamma0 (cm^2/s) | R0^2/Gamma0 (ms) | 15-sample span / ring time | 15-interval span / ring time |
|---|---:|---:|---:|---:|---:|
| I | 15.9 | 94.1 | 26.88 | 0.348 | 0.373 |
| II | 16.6 | 145.6 | 18.92 | 0.494 | 0.530 |
| III | 15.2 | 118.6 | 19.48 | 0.480 | 0.515 |

The velocity-fit support therefore spans approximately 35–53% of one characteristic ring time. This is a temporal-support comparison, not a filter transfer function and not proof of attenuation or bias.

The paper states that flow-related parameter errors are below 3%. If that applies to both R0 and Gamma0, the first-order worst-case relative uncertainty in R0^2/Gamma0 is below 9%. This is not a covariance-based confidence interval; exact per-case covariance and camera-clock uncertainty were not retrieved.

A defensible reprocessing sensitivity test would compare 7-, 11-, 15-, and 21-sample windows on a common track subset, report track attrition at each window, and compare:
- local circulation Gamma(t,theta);
- radial, azimuthal, and axial enstrophy components;
- bubble-core overlap and breakup-onset timing;
- stability of the event classification.

The paper reports a minimum track length of five steps, so the common-subset rule and any loss of tracks under longer windows must be explicit. No such reprocessing was performed because the processed tracks and calibration products were not obtained.

## 6. Finite-core geometry and responsive medium

The source-faithful lab geometry is Newtonian R^3 x I, not a Lorentzian spacetime identification:

- vortex centerline history: a 2D worldsheet;
- finite-core region swept through time: a 4D worldvolume;
- bubble surface swept through time: a 3D worldsheet;
- bubble interior swept through time: a 4D worldvolume;
- responsive medium: measured liquid velocity u(x,t) and vorticity omega = curl(u).

The explicit observation chain is:
1. four frontal images plus calibration -> STB particle tracks -> reconstructed 3D velocity u(x,t);
2. six camera images plus calibration -> MLOS bubble surface;
3. u(x,t) -> omega(x,t) -> angular-sector circulation Gamma(t,theta) and radial/azimuthal/axial enstrophy components;
4. a joint flow/bubble event description, valid only when run identity, frame/time alignment, spatial registration, calibration version, and uncertainty records compose.

This is the minimal measurement architecture suggested by the experiment. It is not an H(s)H identification. Standard fluid mechanics supplies the baseline; an H(s)H contribution must make an additional out-of-sample prediction that differs from that baseline.

### Case II versus Case III

Table 2 central values show:
- circulation 145.6 -> 118.6 cm^2/s (-18.5%);
- Reynolds number 14,600 -> 11,800 (-19.2%);
- Weber number 1.00 -> 0.77 (-23.0%);
- a0/R0 0.38 -> 0.28 (-26.3%);
- specific volumetric enstrophy 326.7 -> 533.4 s^-2 (+63.3%);
- specific kinetic-energy density 5.60 -> 5.87 J/m^3 (+4.8%).

The paper reports capture/release in Case II and breakup in Case III, attributing Case III to a thinner core and more concentrated velocity gradients. These are source-reported outcomes and interpretation, not an independent causal test. The central-value contrast shows that global circulation or Weber number alone does not order the response; finite-core geometry and spatial vorticity structure remain necessary observables. The three cases do not define a deterministic transition boundary.

The preprint gives a mean bubble radius of 3.65 +/- 0.05 mm (1.37% if interpreted as an uncertainty), while its Table 1 note says bubble-size errors are below 1%. The definitions may differ, such as sample spread versus measurement error; they were not reconciled and must not be silently combined.

## 7. CODATA boundary

This is a classical air-water vortex-ring experiment. No CODATA fundamental constant enters the reported observable comparison, and no CODATA value was inserted. A later He-II comparison requires the neutral helium-4 atom mass, not the alpha-particle mass. Sable's existing 2026-11-04 CODATA/helium-4 addendum already handles that separate source issue; it was not duplicated.

## 8. Lean and proof status

Existing Nadir PR #1189 was reused, not extended. Its NadirRotatingFluidPIVEnergyReadout proof-bearing suffix is byte-identical between the current branch file and the version at compiled commit 13477902167aeac163517e975a8b3949171ce4c8. The exact CI job 132120282757 in run #43493446815 completed successfully under Lean 4.34.0; the root build reported 8,961 jobs. No sorryAx, bare admit, or compiler error was found in that job log.

The current PR branch head 80fad0d260a30dbec6304c0ab4c104b8c8b35510 compares to main head 3493a91240b50a4ea352e3ccc03a97d7f3828c7d as 141 commits ahead and 17,469 behind. It remains OPEN/DRAFT/UNMERGED; no rebase, merge, or branch write was made. The target proof is a conditional formalization of the measurement/readout map, not a proof that the source-to-code translation is sound or that the physical premises are true. The new temporal-support arithmetic is not Lean-formalized. Tests, lint, and a separate global axiom audit were not run.

## 9. Archive, tooling, and workflow controls

- The live HsH BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, onboarding, revival rotation, thread-routing rules, Nadir workspace, prior receipts, and current branch were reviewed.
- SAT_THEORY_ARCHIVE_2023-25 root orientation and institutional map were read. HSH_RESOURCES root README only; its internal/private payload boundary was respected.
- Mersearch was not run: the four canonical lanes remain occupied/requested and no callable Mersearch action was available in this runtime. Bounded HsH and SAT archive searches were used only to check duplication. This is not full three-repository archive coverage.
- No new tool, dependency, fork, subscription, symbol, SAT-O equation, or Blockwave equation was introduced or modified.
- The existing Kestrel fiber-compatibility theorem and Nadir readout modules remain the relevant conditional proof scaffolding; no duplicate theorem or PR was created.
- Primary workflow-health scan found WH-02 PR #1710 still at the known seven-commit replacement branch, 922 commits behind current main, with the Vercel preview check failing and no GitHub Actions workflow run on that head. Calder/authorized maintainer remains the owner; this was routed to Tern, not modified by Nadir.

## 10. Campaign state and next gate

P0 Code Grurple remains ACTIVE. P1 cognition remains OVERDUE / NOT READY and Orson-owned. P2 remains HOLD. P3 remains INCOMPLETE. The November 16 P2 source-readiness gate is next; the November 30 major paper gate and December 14 full-theory gate remain separate. FIE rereview remains due November 24.

Next admissible P2 action: obtain the processed trajectory, calibration, timing, and covariance package for issue #1339, then perform the documented window-sensitivity reanalysis. Until then, no H(s)H prediction, fit, independent validation, or theory promotion.

## 11. Publication and successor

Public addendum: issue #1740, submission ID nadir-bubble-vortex-temporal-support-20261114t1424z-s2-001, SHA-256 2cf841653dfb768c320a1c29c64abdca27339244e1d091356b2edbb69404b187. Initial state SUBMITTED_NOT_VERIFIED; final publisher status must be established by issue comment, workflow conclusion, and independent artifact readback.

Next ring identity: Enheduanna. Any repository handoff is optional context only: no task, deadline, review request, response obligation, or ownership transfer. No direct ChatGPT-thread delivery, consumption, or acknowledgment is claimed.

No automation task ID, prompt, enabled state, schedule, phase, or cadence was changed. No sixth task was created.