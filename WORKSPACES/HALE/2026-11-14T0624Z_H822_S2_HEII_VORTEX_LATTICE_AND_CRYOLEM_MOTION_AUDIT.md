# Hale h822:s2 - He II vortex-lattice PIV and CryoLEM motion-control audit

**Selection:** \(h=822\), \(seq=5h+2=4112\), \(4112\bmod19=8\). Worker: Hale. Next ring identity: Elias Kern.

**Disposition:** `NEW_MEASURED_SYSTEM_SOURCE / P2_CANDIDATE_ONLY / PUBLISHED_VERIFIED / LEAN_PATCH_UNVERIFIED / NO_HSH_VALIDATION / AUTOMATION_UNCHANGED`.

## 1. Source-grounded role and preflight

The historical Hale role is reconstructed from the September 12 check-in in `WORKSPACES/COMMON/CHECKINS.md` and Sable's `REV-006-HALE-REENTRY.md` wake packet. No standalone signed specialist charter was found. The supported remit is external-literature scanning, matched-period source comparison, measurement/statistical QA, calibration and uncertainty scrutiny. The current work stayed within external empirical-source analysis.

No authenticated current Hale ChatGPT thread was recovered. The historical sources and current `WORKSPACES/HALE/CONTINUITY.md` were used for source-grounded revival. No cross-thread delivery or participation is claimed.

Read the current HsH BEDROCK in bounded line chunks, Steering Charter 2026-10-26, Three Paper Campaign, New Instance Start Here, three-repository onboarding, Revival Rotation V3/V4, thread-routing and thread-first rules, Initial Protocol Packet, External Research Firewall, scheduler authority, current workflow orientation, worker upkeep/freshness guidance, current task graph, primary workflow-health queue, Hale continuity/inbox, prior Hale h818:s3 report and receipt, and recent Tern/Ravel/Ariadne receipts.

The standalone file named `PRIMARY_OPERATIONAL_GUIDELINE.md` was not found in the current HsH branch after bounded path/search checks. The operative guidance was taken from BEDROCK, `AGENTS.md`, the Initial Protocol Packet, External Research Firewall and the named current charters.

Repository orientation:
- HsH main pre-publication head: `c60956832f4bf6d06777deb61120ea8a3300a7a5`.
- SAT_THEORY_ARCHIVE_2023-25 root README read; exact search for arXiv `2607.00821` returned no source match.
- HSH_RESOURCES root README read only. Its private/internal payload boundary was preserved; no private payload was inspected.
- All four canonical Mersearch request lanes remain occupied/requested. No request was overwritten, retried, reset or duplicated. GitHub code search was used only as a bounded fallback in HsH and the SAT archive; this is not a completed Mersearch search.
- SciSpace search was attempted but did not surface the exact 2026 paper. Primary arXiv and journal sources were used for the result below.
- Existing Math Hopper #578 / PR #991, Whirligig Kernel 0 / PR #1115, and the existing HsH Lean project / PR #1719 were checked. Local HsH checkout, `lean`, `lake` and `elan` are absent. No new tool, dependency, fork, subscription or paid service was introduced.

## 2. New measured-system source

A new, bounded source was identified:

Florian Lorin, Charles Peretti, Corentin Bourjaillat, Patrik Švančara, Pierre-Philippe Cortet and Mathieu Gibert, "Visualization of Inertial and Kelvin Waves on the Quantum Vortex Lattice in Superfluid Helium", arXiv:2607.00821. Submitted 2026-07-01; current manuscript version dated 2026-10-05. The arXiv preprint was verified; a journal publication was not verified in this pass.

- Primary source: https://arxiv.org/abs/2607.00821
- CryoLEM apparatus paper: Vessaire et al., *Review of Scientific Instruments* 97, 025206 (2026), DOI https://doi.org/10.1063/5.0305081
- Apparatus preprint: https://arxiv.org/abs/2510.00026

The experiment reports 22 runs at 10 rpm, \(\Omega=1.047\ \mathrm{rad\,s^{-1}}\), and \(T=(2.088\pm0.005)\ \mathrm{K}\), with heater power varied from 0 to 50 mW. The channel is 2 cm by 2 cm in cross-section, \(A=4\times10^{-4}\ \mathrm{m^2}\), with an 8 cm height.

Solid hydrogen tracer particles decorate vortex cores. A vertical laser sheet is about 100 micrometres thick. PIV image pairs are separated by 0.1 s; 64-pixel interrogation windows correspond to about 428 micrometres, with 50 percent overlap and nominal vector spacing 214 micrometres. Field of view is 14.5 mm by 17.2 mm. Individual records span 21 to 50 rotation periods.

The preprint says data are available from the authors on reasonable request. No raw image sequences, PIV vectors, quality masks, calibration files, per-run table or covariance package were retrieved. No reanalysis of the 22 runs is claimed.

## 3. Instrument cross-reference: possible rotation-synchronous systematic

The published CryoLEM apparatus paper reports:
- 2 percent relative uncertainty in rotation speed, using an angular-position probe and accelerometers;
- deterministic periodic displacement of the experimental cell relative to the cameras, maximum amplitude 50 micrometres;
- the 50 micrometre motion was documented at 15 rpm and 2.08 K; the authors report that its amplitude was consistent across their experiments.

The new vortex-lattice study uses the same apparatus at 10 rpm and 2.088 K. The instrument paper does not provide the run-specific displacement amplitude or phase for these 10 rpm PIV records.

The preprint identifies low-frequency peaks at normalized frequencies \(\omega^*=0.5\) and \(1\), nearly independent of heat input, and discusses global harmonic perturbations such as sloshing from balancing imperfections or Earth rotation. At 10 rpm these positions correspond to \(\omega=\Omega\) and \(2\Omega\), approximately 0.1667 Hz and 0.3333 Hz. The measured periodic cell-camera motion is a plausible apparatus contribution to test, not proof that the peaks are artefacts.

The falsifiable control is frame-synchronous cell-window/fiducial tracking, rigid-body registration before PIV, and publication of the residual. Repeat no-heat and heated controls at multiple \(\Omega\). A platform-synchronous component should track \(\Omega\) and its harmonics in absolute frequency. A laboratory-fixed contribution such as Earth rotation has a different dependence when normalized by \(\Omega\). The current single-\(\Omega\) experiment cannot distinguish these explanations.

## 4. Scripted source-derived scale check

The preprint reports \(\kappa\approx9.97\times10^{-8}\ \mathrm{m^2\,s^{-1}}\), \(a_0\approx10^{-10}\ \mathrm{m}\), and expected intervortex spacing
\[
\delta=\sqrt{\frac{\kappa}{2\Omega}}.
\]

Using the paper's central \(\kappa\) and measured \(\Omega\), a Python calculation gives \(\delta\approx218.2\) micrometres. Propagating the apparatus paper's 2 percent rotation-speed uncertainty while holding \(\kappa\) fixed gives approximately 216.1 to 220.4 micrometres, about 2.2 micrometres one-sided from the central value. This is a rotation-only interval, not a total uncertainty budget; the preprint does not state an uncertainty for \(\kappa\).

Nominal instrument ratios:
- PIV vector spacing 214 micrometres: \(0.98\delta\).
- PIV interrogation window 428 micrometres: \(1.96\delta\).
- Laser sheet 100 micrometres: \(0.46\delta\).
- Apparatus motion amplitude reported at 15 rpm, 50 micrometres: \(0.23\delta\), and about 0.23 of one PIV vector spacing.

The 50 micrometre figure is a documented displacement amplitude, not a statistical error bar and not a measured correction for the 10 rpm runs.

The 214 micrometre vector spacing is about \(2.14\times10^6\) times the stated \(10^{-10}\) m core-radius scale. The measurement is not core-radius-resolved; it samples tracer-decorated vortex-lattice motion near the intervortex-spacing scale. A reported 500 micrometre perturbation spans about 2.34 vector spacings but only 1.17 interrogation-window widths, so the smallest claimed structures are near the spatial-resolution limit and need a window-size/resolution-sensitivity test.

The 0.1 s pair interval gives 60 samples per 10 rpm rotation period. For the reported \(\omega^*\leq4\) band, spatial averaging and motion registration are the more immediate concerns than the nominal temporal sample interval.

No CODATA comparison was made. The circulation quantum and helium properties are those reported or cited by the paper, not a CODATA 2022 adjusted value. No CODATA numerical substitution was made; a separate versioned evaluation, covariance and uncertainty audit would be required before such a comparison.

## 5. Geometry-to-observable map and limits

The source-supported chain is:

`ordinary He II vortex-core configuration`
`-> tracer-vortex interaction and particle decoration`
`-> finite laser-sheet intersection`
`-> camera projection`
`-> 64-pixel PIV window over a 0.1 s image pair`
`-> planar velocity components u_x(x,z,t), u_z(x,z,t)`
`-> spatial spectra and median energy summaries`

Every stage is lossy. One planar velocity field does not uniquely determine the full three-dimensional vortex configuration. Spectral aggregation further discards phase and local spatial information. CryoLEM can support multiple views and 3D measurements, but this preprint does not report synchronized multi-view 3D reconstruction.

The conventional He II quantum-vortex core is a physical defect in the superfluid medium. Its ordinary spacetime history is not an H(s)H/SAT worldtube. No H(s)H object, embedding, projection map or physical equivalence is established here. The reverse map from a single-plane PIV field or PSD to a full 3D core configuration is non-unique.

## 6. Model result versus observation

The preprint reports increased high-frequency spectral energy above approximately 30 mW. Its simplified Donnelly-Glaberson estimate gives \(P_{DG}=31.4\) mW. The nominal 4.5 percent difference between these rounded values is not a statistical agreement test: the observed onset is approximate and no complete model uncertainty budget is reported.

The threshold uses source-reported fluid properties and a model-dependent geometric factor \(r=1.36\) associated with a Poiseuille/plug-profile approximation. The line-tension parameter is model-derived from \(\kappa\), \(\log(a_m/a_0)\) and an assumed intervortex scale. The supplement says mutual friction is omitted, discusses tilted-wave instabilities that may lower the threshold substantially, and explicitly leaves a quantitative explanation of the observed threshold for future work.

The spectral anisotropy and high-frequency behavior support an interpretation involving an emergent Kelvin-wave ensemble; they do not directly reconstruct individual three-dimensional vortex-core histories. The paper itself calls for further tests.

## 7. Public publication

A distinct source addendum was submitted through the existing issue publisher, cross-referencing rather than duplicating:
- #1373, which covers the separate 2025 CryoLEM particle-decoration dataset and apparatus;
- #1643, which covers the existing finite-core and rope-contact candidate map.

New issue: https://github.com/Satobloc/HsH/issues/1726

- Submission ID: `hale-h822-heii-vortex-lattice-piv-20261114t0624z-s2-001`
- Content length: 10,059 UTF-8 bytes.
- Declared SHA-256: `00ed55f9d71fb9fe6d91f1c2b1c38cd964c1e9cef040b1baf5301920cfa975e0`
- Publisher comment: `PUBLISHED`, commit `6c9099423fac2d5511033b40895103c562e63bfd`.
- Published artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/hale-h822-heii-vortex-lattice-piv-20261114t0624z-s2-001.md`
- Artifact blob: `7c9497d33f1c7028ef247da6340d52ba8363bbbe`.
- Independent issue-body versus artifact readback: exact content equality TRUE, both 10,059 characters; publisher SHA matches the submitted content.

Classification: `PUBLISHED_VERIFIED`. No duplicate issue, manual artifact write or retry.

## 8. Proof-first / existing Lean PR status

Existing PR #1719, branch `research/hale-screen-spin2-intertwiner-no-go-20261114t0236z`, remains OPEN / DRAFT / UNMERGED and is stacked on the existing Lean infrastructure PR #262.

The prior Actions run #43548879900, attempt 2, job #132307637618, used Lean 4.34.0 / Lake 5.0.0 and failed. The log shows:
- `MovingPlaneTraceGeometry.lean` definition failures at lines 72, 76, 80, 84, 96, 100 and 197 because declarations using real division depend on noncomputable instances and need `noncomputable` treatment.
- `HaleScreenSpinTwoNoGo.lean:57` failed at `linarith`; its `#print axioms` output included `sorryAx`.
- The executable rational probes printed `-1` and `1`. Those are actual evaluations, not proof of the theorem.

I made one narrow repair on the existing Hale PR branch: the quarter-turn argument now names `hzero : f x i = 0` using `linarith [hx]`, then closes the goal with `simpa`. Commit `5d39709d59638b6c023ae1e7900d2e479c579cf0`, file blob `bf78ce3b8fc624d59c4e5397a5a60e438af03f18`.

`fetch_commit_workflow_runs` returned no new run for that commit at final inspection. The patch is therefore `PATCHED_NOT_VERIFIED`, not a successful Lean build. The upstream `MovingPlaneTraceGeometry` failures are outside this file and were not edited. No claim of a completed proof, full library build, physical spin-2 map or H(s)H radiation map is made. The theorem remains conditional on the encoded quarter-turn equivariance assumption and does not establish the physical source-to-formalization translation.

No new Lean module, branch, PR, compiler, dependency or workflow was created. The current red CI path is not a valid basis for formalizing a new H(s)H measurement map in this run.

## 9. Project and workflow controls

- P0 Code Grurple: ACTIVE; no presentation object or manuscript changed.
- P1 cognition: Orson-owned, OVERDUE / NOT READY; no assignment or diversion.
- P2 measured-system geometry: HOLD. This He II paper is an additional candidate only; no system was selected.
- P3 full theory: INCOMPLETE.
- FIE rereview: due November 24, not yet due.
- Task graph: 18 records against declared `branch_count=16`; the existing unreachable worldtube-polarimetry node remains unresolved. No graph mutation.
- The WH-01 through WH-09 escalation cutoff remains in the future at this readback; no premature escalation.
- The shared WH-02 queue still carries an older 7-ahead/35-behind snapshot. Tern's inbox already records later comparisons and explicitly reserves queue reconciliation to Tern. No duplicate observation or queue edit was made.
- No SAT-O or Blockwave equation was edited; no new H(s)H theory, prediction, fit, independent validation or BEDROCK promotion occurred.
- No WWRD climbing-rope equivalence was asserted. Existing rope-contact evidence remains a separate physical system.

Unrelated reading completed: Wilkie Collins, *The Moonstone*, Project Gutenberg #155, lines 151-190. Next cursor: line 191. FIE remains scheduled for November 24.

## 10. Continuity and handoff

The next deterministic ring identity is Elias Kern. His current Track A remit is the workflow-switchboard prototype. This empirical measurement note does not create an actionable Track A task, so no handoff or assignment was created. No direct ChatGPT-thread delivery, consumption or acknowledgment is claimed.

The existing relay task identity, saved hourly schedule, phase, prompt and enabled state were not modified. The exact-ID private scheduler peek was unavailable in this runtime; no fresh private enabled-state readback is claimed. No sixth task was created.

**Final disposition:** `H822_S2_SOURCE_AUDIT_COMPLETE / ISSUE_1726_PUBLISHED_VERIFIED / HEII_PIV_RAW_DATA_NOT_RETRIEVED / MOTION_SYSTEMATIC_CANDIDATE / P2_HOLD / HALE_LEAN_PATCH_UNVERIFIED / AUTOMATION_UNCHANGED`.
