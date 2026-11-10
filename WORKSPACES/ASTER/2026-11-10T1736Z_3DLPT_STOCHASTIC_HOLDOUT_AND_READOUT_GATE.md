# Aster h737:s3 — 3D-LPT stochastic holdout and readout gate

**Status: SUBSTANTIVE WORK COMPLETE · PUBLIC SUBMISSION PUBLISHED AND HASH-VERIFIED · P2 CANDIDATE ONLY · NO H(s)H PREDICTION OR PHYSICAL VALIDATION · LATE OPTIONAL HANDOFF TO ARIADNE.**

## 0. Run identity, authority and provenance

- Deterministic run key: `REVROT3-19-20261011:737:s3`.
- Scheduler event: `last_run.scheduled_for=2026-11-10T17:36:00Z`.
- Scheduler run ID: `49d2c5d9-dcfc-832e-bdc5-1af4b7a4327f`.
- Invocation start: `2026-11-10T18:02:26.403695Z`; last observed status IN_PROGRESS; `chat_ref=null`.
- h = 737; seq = 5×737+3 = 3688; 3688 mod 19 = 2.
- Ring index 2: Aster. Successor index 3: Ariadne.

The worker label is deterministic selection, not authentication of a ChatGPT instance or thread. The historical Aster source was recovered from raw conversation blob `1bf6e65c4ac1650297acb67d7e39f700454a03c8`. Direct user messages `d15369d1-1412-4f4a-9460-702d2de573ea` and `01505af7-37cd-491f-a951-1822934e36ff` assign Aster a Review-MIND/source-fidelity role, including checking whether prose matches Nathan's established positions and a Paper A review lane. The current Code Grurple roster freezes that formal Paper A review lane; this run did not reopen it. The present :36 architecture/prediction remit is separate. No authenticated current Aster thread was found, and no cross-thread participation or delivery is claimed.

## 1. Governing state and prior-work non-duplication

The live HsH BEDROCK, Nathan Direct operational overview, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, Revival Rotation V3, duplicate-run-key guard, and thread-first rule were read against the main-branch snapshot. Main was `b9781cfb69796daf6b680c1ee2e46c3158e09f75` at initial inspection; the publisher subsequently committed the public artifact as `124115d6e5c3e5dd3186774202f64620732adfb5`.

Aster's prior h718 work was read: TOPLESS raw-source recovery/map gate, its map-composition amendment, and the late optional handoff to Ariadne. That work addresses source-defined maps and composition. This h737 contribution is distinct: it applies a stochastic, run-level holdout and 3D-readout gate to a real published experimental candidate. Aster PRs #1220 and #1444 remain open/draft/unmerged; neither was edited.

The current P2 docket is issue #565, still HOLD with no selected system. The Code Grurple/P0 interlock remains active. No P2 system was selected and no manuscript gate advanced.

## 2. Primary source and data inventory

Primary source: Cecilia Estepa-Cantero, Manuel Lorite-Díez, Javier Ruiz-Rus, Sébastien Cazin, Rocío Bolaños-Jiménez, Patricia Ern and Carlos Martínez-Bazán, “Three-dimensional experimental investigation of the interaction between a rising bubble and a vortex ring,” *Journal of Fluid Mechanics* 1045 (25 October 2026), A27; published online 16 October 2026; DOI `10.1017/jfm.2026.12078`; preprint arXiv:2606.08193.

The experiment is a rising bubble interacting with a descending vortex ring in counterflow. The authors combine four-frontal-camera 4D-LPT/Shake-The-Box reconstruction of liquid tracks and velocity fields with six-camera MLOS bubble tomography.

Publisher supplementary material:
- sm001: volumetric bubble reconstruction, 165.9 KB.
- sm002: Case I raw images from six cameras, 1496 Hz, 43.8 MB.
- sm003: Case II raw images from six cameras, 1496 Hz, 37.7 MB.
- sm004: Case III raw images from six cameras, 1496 Hz, 44.9 MB.

The paper states that supporting data are available upon reasonable request. The inspected public source therefore exposes useful raw image movies, but not a verified public deposit of full 4D-LPT trajectories, per-experiment calibration coefficients/target images, complete acquisition/run IDs, or a joint covariance package. No raw movie, track file, calibration file or data package was downloaded or analyzed in this run.

Published method details include 11 calibration-target positions separated by 10 mm, per-experiment volumetric self-calibration, image scale 17.91 px/mm, roughly 80,000–100,000 tracks per experiment and a typical Eulerian grid of 0.7–1 mm. Reported cumulative velocity uncertainty ranges from below 2% near the high-displacement vortex core to a conservative 10% in the far field. Reported errors in flow-related parameters and bubble size are below 3% and 1%, respectively. These are published uncertainty statements, not a recovered covariance matrix.

## 3. Measured case comparison and calculation ledger

Published Table 1:

| Case | Outcome | R₀/Rb | a₀/R₀ | a₀/Rb | Re | We | Bo | Ga | Fr |
|---|---|---:|---:|---:|---:|---:|---:|---:|---:|
| I | Weak interaction | 4.3 | 0.37 | 1.59 | 8,900 | 0.41 | 1.57 | 618.5 | 1.35 |
| II | Capture, drag, release | 4.5 | 0.38 | 1.71 | 14,600 | 1.00 | 1.81 | 690.5 | 1.25 |
| III | Bubble breakup | 4.2 | 0.28 | 1.18 | 11,800 | 0.77 | 1.75 | 671.5 | 1.28 |

A scripted descriptive comparison used `100×(CaseIII−CaseII)/CaseII`:
- Re: −19.2%.
- We: −23.0%.
- a₀/R₀: −26.3%.
- a₀/Rb: −31.0%.
- R₀/Rb: −6.7%.

These are arithmetic differences between published dimensionless case summaries, not a physical fit, causal estimate, independent measurement, or prediction. Multiple parameters change together. The paper's interpretation emphasizes the thinner Case III core and more concentrated local strain, while also noting that initial relative position can contribute. This case contrast cannot isolate a unique core-thickness effect.

The paper explicitly places these representative cases in a transition region where breakup is not deterministic: experiments with approximately the same We and the same size ratios can still produce different outcomes. The three cases were selected as reproducible/illustrative behaviours after numerous preliminary experiments; they are not a published replicated factorial or a valid train/holdout split.

The transition-map simulations cited by the paper used Re≈15,000 and a₀/R₀=0.1, with at least ten different initial bubble positions per simulation point. The present experimental cases have a₀/R₀=0.28–0.38. That simulation map is useful context, not a matched forward-model comparator for these measured cases.

## 4. New architecture improvement: stochasticity-aware 3D readout gate

The measurement hierarchy is explicit:

`X_run → {I_j(x,y,t)}_{j=1..6}`

- Four frontal camera streams → 4D-LPT/Shake-The-Box → particle tracks → reconstructed 3D liquid velocity and vorticity fields.
- Six camera streams → MLOS tomography → bubble surface/volume.
- Reconstructed fields → vortex identification and core geometry, circulation, kinetic energy and enstrophy.
- Three-dimensional volume → 80 azimuthal divisions containing both cores → 160 half-planes and planar/azimuthal reductions.

The paper warns that a fixed 2D-PIV plane can miss out-of-plane motion, loss of axial symmetry and localized bubble effects. The 2D reduction is therefore not automatically sufficient for the 3D target.

The generic fibrewise factorization theorem is reused rather than duplicated: for projection (P:X_{3D}\to X_{2D}) and target (O:X_{3D}\to Y), a deterministic coarse target ̃O with (O=\tilde O\circ P) exists iff O is constant on every fibre of P. This supplies a precise gate: a 3D observable may be replaced by a 2D summary only after its fibre-constancy is established. The paper's discussion supplies a concrete reason to test this condition; it does not prove that every chosen observable fails it.

The theorem is present in Nadir PR #1189, head `536cfb8f30ae8bae8c3f9d729eb964216b7f4e4f`. Exact-head Actions run #42814711511/job #129824736706 used Lean 4.34.0 and succeeded; the captured log contains no `sorryAx` or bare `admit`. The theorem-specific axiom output includes `Classical.choice`. Separate tests/lint steps were skipped. This is a formal proof of the abstract factorization statement only, not a proof that the experimental maps satisfy its premises or that the physical system is H(s)H.

The new practical rule is **run-level stochastic holdout plus measurement-operator sufficiency**:
1. Use complete independent acquisition runs as calibration/holdout units, never adjacent frames or cells from one movie.
2. In the transition region, predict distributions over capture/release/breakup and continuous field observables, not a deterministic label from one selected case.
3. Retain the 3D readout until fibre-constancy shows a chosen 2D statistic is sufficient for the target.
4. Freeze shared parameters, instrument reconstruction, nuisance parameters and the standard comparator before opening holdout data.
5. Test any extra H(s)H parameter for identifiability: its readout-sensitivity direction must not be absorbed by the span of shared/nuisance/calibration sensitivities. No Jacobian was computed because the H(s)H forward map and raw run data are absent.

## 5. Conditional comparison matrix

| Hypothesis | Shared parameters | Calibration / holdout | Predicted observable | Standard comparator | Falsification gate |
|---|---|---|---|---|---|
| H0 conventional fluid baseline | Fluid properties; Re, We, Bo, Ga, Fr; R₀, a₀, Rb; circulation; initial position/velocity | Same camera calibration and reconstruction operator; independent complete runs held out | 3D velocity/vorticity, core geometry, bubble surface/trajectory, breakup probability | Frozen conventional fluid-mechanics forward model with identical initial/boundary conditions and instrument operator | Not executable until solver/closures and raw run-level data are frozen |
| H1 minimal H(s)H | Same measured inputs; no extra free fit parameters | Same run-level split and full 3D readout | Same 3D fields and bubble observables | H0 | Not evaluable until worldtube/timesheet/medium-to-fluid and fluid-to-instrument maps are explicit |
| H2 H(s)H + local twist | Same as H1; source-derived twist law and units | Same holdout; sensitivity against shared/nuisance columns | Predeclared local azimuthal 3D residual or outcome-distribution change | H0 and H1 | Optional, not forced; no local τ field or constitutive law is supplied |
| H3 H(s)H + contact law | Same as H1; independently defined contact surface/law | Same holdout; no channel-specific retuning | Bubble-interface deformation, capture/release and breakup distribution | H0 and H1 | Optional, not forced; measured bubble interface alone does not establish an H(s)H contact surface |

**Structure classification:** H(s)H's global finite-core thickness ε remains a working model commitment, but it is not identified with the standard-fluid vortex-core radius a₀ without an explicit map. Azimuthal vorticity/circulation is not automatically τ. The measured bubble interface is not automatically an H(s)H contact surface. Water is the experimental liquid, not automatically the provisional H(s)H responsive medium. Laboratory time stamps are not a measured timesheet. No twist or separate contact law is forced by this experiment.

## 6. Falsification and data request

For continuous held-out observables, preregister a covariance-aware residual (Q=r^T\Sigma^{-1}r) and compare it with the chosen χ² quantile for the effective independent observable dimension. For categorical breakup/capture outcomes, preregister a calibrated probability model and score it on independent runs. The significance level, degrees of freedom, joint covariance and replicate count must be frozen after the full data and a power analysis are recovered. The paper's marginal uncertainty statements do not justify a numeric threshold by themselves.

Before any H(s)H calculation or blind test, obtain and hash:
1. Full 4D-LPT track files.
2. Per-experiment calibration coefficients and target images.
3. Raw camera metadata and acquisition/run IDs.
4. Complete per-run parameter records, including initial relative bubble/vortex position.
5. Joint covariance or sufficient reconstruction outputs to estimate it.
6. Independent replicate counts in the transition region.

Then freeze the conventional forward model and instrument operator, the source-grounded H(s)H maps and forced/optional parameter list, and the run-level holdout/falsification protocol before fitting.

## 7. Source, model and epistemic boundaries

- **Historical source:** the Estepa-Cantero et al. paper and its publisher-listed supplementary movies.
- **Existing internal source audit:** Sable's 2026-11-08 dataset/Lean status delta.
- **Standard reference:** conventional fluid-mechanics interpretation and the Foronda-Trillo transition-map context; not a matched solver for these cases.
- **Assistant reconstruction:** the run-level holdout/readout gate and the descriptive percentage differences above.
- **Proposal:** any H(s)H mapping from ε, τ, worldtube/timesheet or contact geometry to the measured fluid variables.
- **Independent measurement:** none obtained in this run; no raw movies or tracks were downloaded.

No H(s)H prediction, fit, model validation, physical simulation, SAT-O/Blockwave equation edit or BEDROCK promotion occurred.

## 8. Publication, repository and campaign status

Public-safe candidate-only summary was submitted through the existing HSH-PUBLISH-V1 issue publisher:
- Intake issue #1564.
- Submission ID: `aster-estepa-3dlpt-stochastic-holdout-20261110t1736z-s3-001`.
- Publisher artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aster-estepa-3dlpt-stochastic-holdout-20261110t1736z-s3-001.md`.
- Publisher commit: `124115d6e5c3e5dd3186774202f64620732adfb5`.
- Artifact blob: `962a3c25ca6c6e0cd6bc2dd6ad00329558679252`.
- SHA-256: `d3bb9cd4eba4b908e7aaf5f5d19a8218dcf972026ea89a151b64fc7dd4d60650`.
- Exact issue-envelope content comparison and independent fetched-artifact SHA-256 both PASS; publisher comment says PUBLISHED / readback verified.

Campaign remains: P0 Code Grurple ACTIVE; P1 November 9 cognition OVERDUE / NOT READY (Orson-owned); P2 November 30 geometry HOLD; P3 December 14 full theory INCOMPLETE. No paper gate advanced.

The task graph snapshot still reports 16 declared branches and 18 records; no graph edit was made. Tern retains scheduler/graph reconciliation. Four Mersearch request lanes remain occupied; no request was overwritten or created. Math Hopper issue #578, existing Lean PRs, Whirligig Kernel 0 and the connected SciSpace option were checked/reused; no new tool, fork, dependency, subscription or cost was introduced. Fork enumeration remains unavailable through the inspected connector surface.

FIE rereview was completed 2026-11-10 00:17Z; next review 2026-11-24. No repeat review was performed. Unrelated reading advanced in Charles Babbage, *Reflections on the Decline of Science in England*: lines 1701–1740 read; next cursor 1741.

## 9. Scheduler and handoff

The existing :36 automation remains enabled and unchanged:
- Task ID `6a9f52b69ec08191b0a2ba24a074f781`.
- Original hourly America/New_York :36 VEVENT, prompt and phase preserved.
- No task/ID/cadence changes and no sixth task.

The scheduler's `last_run.scheduled_for=17:36Z` gives h737. Using `started_at=18:02Z` instead would incorrectly give h738 and select a different ring member. The stored VEVENT's 14:36 America/New_York DTSTART resolves to 19:36Z, while the scheduler record/next_run_time resolved to 17:36Z. This pre-existing two-hour discrepancy is not repaired here; Tern retains authority. The latest cached result at run start was the completed h736 Mercer result, which is expected stale cache while h737 Aster is in progress, not a new duplicate-run-key event.

The :48 successor run (Ariadne label) was observed FAILED: run ID `42528615-b27c-832b-8240-31250c2deac3`, scheduled 17:48Z, started 18:10:24Z, failed 18:14:11Z, no chat reference. A late optional repository handoff is therefore appropriate; it creates no task, response obligation or ownership transfer.

## 10. Return pin

`H737:S3 / ASTER-LABEL / NO-AUTHENTICATED-ASTER-THREAD / HISTORICAL-REVIEW-MIND-CHARTER-PRESERVED / PAPER-A-REVIEW-FROZEN / ESTEPA-CANTERO-4D-LPT-CANDIDATE-ONLY / STOCHASTIC-RUN-LEVEL-HOLDOUT-GATE-ADDED / 3D-READOUT-FACTOR-GATE-REUSED / Nadir-PR1189-EXACT-HEAD-LEAN-BUILD-PASS / DESCRIPTIVE-CASE-II-III-DELTAS-ONLY / NO-RAW-DATA / NO-HsH-PREDICTION / NO-FIT / NO-P2-SELECTION / PUBLISHED-ISSUE-1564-READBACK-PASS / P0-ACTIVE / P1-NOT-READY / P2-HOLD / P3-INCOMPLETE / FIE-NEXT-2026-11-24 / BABBAGE-NEXT-1741 / ARIADNE-LATE-OPTIONAL-HANDOFF / AUTOMATION-UNCHANGED.`
