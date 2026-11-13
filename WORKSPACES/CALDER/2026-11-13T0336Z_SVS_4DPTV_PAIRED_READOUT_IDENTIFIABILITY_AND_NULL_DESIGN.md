# Calder h795:s3 | Paired SVS + 4D-PTV identifiability and null-design gate

**Disposition:** source-verified candidate and conditional test architecture completed; no P2 selection, physical calculation, fit, H(s)H prediction, new Lean theorem, or theory promotion.

## 1. Scope and authority

- Deterministic selection: Calder, ring index 7; next label Hale, index 8.
- Run key: REVROT3-19-20261011:795:s3.
- This is a worker label, not authentication of a historical Calder instance or current ChatGPT thread.
- The best available Calder role evidence remains the 2026-09-12 self-report in WORKSPACES/COMMON/CHECKINS.md, blob 886069e71d4aec7a3f8d199d6d889b930a05c17e, lines 55–106. It supports empirical/statistical angle-clustering, null-design and independent-unit work, but is not a standalone signed Nathan-authored specialist charter. The original empirical-Calder conversation ID remains unrecovered.
- The bounded Mersearch request calder-empirical-charter-original-source-20261101-0248 used Mercer_Searcher_1.0 stable ref mersearch-stable-1.0; it scanned 16,202 files and 20,861,799 records, returning 138 hits across 81 distinct source paths. Its compact receipt explicitly says it is not exhaustive and publishes no excerpts. Its top-ranked sources include the separate ⚗️ CALDER [Construction Story Retelling] identity; lexical ranking is not source authority. The separate Sable REV-005 Calder packet is a different identity family and was not used as this worker's charter.
- No authenticated current Calder thread was established. No cross-thread delivery is claimed.

## 2. Source recovery and epistemic labels

### External primary source

Han, Yukun; Oh, Jinho; Pan, Chong; Yoon, Sang Youl; and Kim, Kyung Chun (2026), “Simultaneous free-surface and 3D flow measurements of a vortex ring in head-on collision with the air-water interface,” Experiments in Fluids 67, article 91, DOI 10.1007/s00348-026-04256-5, published 2026-06-27.

- Publisher record: https://link.springer.com/article/10.1007/s00348-026-04256-5
- Publisher figure/preview copy: https://www.researchgate.net/publication/408164663_Simultaneous_free-surface_and_3D_flow_measurements_of_a_vortex_ring_in_head-on_collision_with_the_air-water_interface

The abstract reports simultaneous stereoscopic free-surface measurement (SVS) and volumetric 4D particle tracking velocimetry (4D-PTV) for a vortex ring impacting an air–water interface at ReΓ=2509. It reports circulation, vortex-core-region kinetic energy, free-surface energy, a kinematic-boundary residual at a three-sigma level of 0.65% of characteristic vortex velocity, a stress-free consistency diagnostic, and a correlation-based time-lag diagnostic.

Here “4D-PTV” means 3D spatial tracking over time, not four spatial dimensions. The publisher preview depicts two distinct reconstruction branches followed by joint calibration and spatiotemporal alignment. Its field-of-view figure shows overlapping but distinct measurement regions. A later figure caption says the surface is shifted upward slightly for visual clarity while timing and in-plane coordinates remain unchanged; that display offset is not a physical registration transform.

Springer states that supporting data are available from the corresponding author upon reasonable request. The listed 10.4 MB supplement is a GIF, not the raw measurement package. The full article is subscription content; the publisher displayed a £29.95 PDF purchase option. No purchase was made and no author request was sent.

### Attribution

- **Historical source:** Calder's 2026-09-12 self-report in CHECKINS, not a signed specialist charter.
- **External primary source:** Han et al. publisher record and its available preview.
- **Assistant reconstruction:** the typed observation maps, candidate projections, null design and test matrix below.
- **Standard comparator:** ordinary 3D Newtonian free-surface fluid mechanics, to be instantiated from the full Methods and measured parameters.
- **Proposal:** H(s)H core-plus-surface and medium-retaining reductions.
- **Independent measurement by this run:** none. The paper reports measurements; this run did not obtain or independently reproduce them.

## 3. Typed observation architecture

The experiment should be represented as two observation maps and an explicit registration/composition stage, not as one undifferentiated “4D” object.

Let S denote the underlying fluid/interface state history and let C=(C_S,C_P,C_J) denote the SVS calibration, PTV calibration, and joint registration/time-synchronization state:

\[
O_S:S\times C_S\rightarrow D_S,\qquad
O_P:S\times C_P\rightarrow D_P,
\]

\[
J:D_S\times D_P\times C_J\rightarrow D_J,
\]

\[
O_{\mathrm{joint}}(s,C)=J\!\left(O_S(s,C_S),O_P(s,C_P),C_J\right).
\]

Here D_S contains the reconstructed free-surface history Σ_F(t), and D_P contains the reconstructed bulk velocity field U_M(x,t) and its derived flow quantities. The joint map must be evaluated only on the common spatial/time support:

\[
\Omega_\cap(t)=\Omega_S(t)\cap\Omega_P(t),\qquad
T_\cap=T_S\cap T_P.
\]

The actual masks, transforms, time offsets and uncertainty propagation are not present in the preview. Therefore Ω_cap, T_cap, and J are typed requirements, not instantiated numerical objects.

### Candidate reduction and the hidden part-whole dependency

A useful candidate medium-retaining state is

\[
\pi_M(s,C)=\big(\Sigma_F(s),U_M(s),C\big).
\]

A proposed core-plus-surface reduction would be

\[
\pi_C(s,C)=\big(\Sigma_F(s),\Phi_C(U_M(s)),C\big),
\]

where Φ_C is the source-defined extraction of vortex-core support/history from the PTV-derived flow field. The preview does not specify Φ_C, its threshold, its uncertainty, or its version. It must not be invented.

If Φ_C is eventually recovered, the candidate projection is

\[
q_C(\Sigma_F,U_M,C)=\big(\Sigma_F,\Phi_C(U_M),C\big),
\qquad \pi_C=q_C\circ\pi_M.
\]

For a deterministic target observable O, factorization through this reduction is possible exactly when O is constant on every fiber of q_C (with calibration retained or proven invariant). If two held-out states match in π_C and calibration but their target outputs differ beyond the full uncertainty budget, the core-plus-surface reduction fails for that observable; the medium-retaining state has not been eliminated.

**Critical leakage control:** W_C=Φ_C(U_M) is derived from the PTV medium field. It is not an independent measurement. Extracting the core from a PTV run and then using the same run's PTV field to claim that the core alone predicts the medium is a part-whole test with information leakage. Freeze Φ_C and all core-extraction choices on training acquisitions, then evaluate on independent held-out acquisitions. Alternatively, obtain a genuinely independent core measurement. The paper preview does not establish that such independent acquisitions exist.

## 4. Independent-unit and null design

The independent unit must be an independently acquired vortex-ring collision realization/run, not a camera frame, particle, particle track segment, voxel, surface point, or derived time sample. Multiple channels and time samples from one collision remain nested observations of the same realization.

The existing Calder PR #1515 theorem unitFold_factorization_iff_unitConsistency formalizes one necessary split condition: a channel-level fold assignment descends to acquisition-unit folds iff it is constant across every fiber of the declared channel-to-acquisition-unit map. This theorem does **not** prove that the declared acquisitions are statistically independent, authenticate run IDs, or estimate covariance.

Required design:

1. Recover acquisition/run IDs and the denominator of attempted, failed, excluded and retained collision runs.
2. Estimate SVS and PTV calibration on independent calibration targets or training runs; freeze all camera, volume, registration and time-sync parameters before holdout.
3. Assign every frame, particle, track segment, voxel and derived summary from one collision to the same fold. No channel from a held-out run may leak into training through core extraction or calibration.
4. Use independent collision runs as holdout units. If only one run exists, there is no independent-run holdout; temporal blocks can support a within-run robustness/forecast test only, not independent replication or cross-run generalization.
5. Propagate the joint covariance, including shared calibration/registration uncertainty and cross-channel covariance between SVS and PTV. Do not treat the two synchronized branches as independent replicates.
6. Treat the three reported diagnostics (kinematic-boundary residual, stress-free consistency, and correlation-based time lag) as diagnostics from the same experiment, not as three independent acquisition units.

The reported 0.65% three-sigma kinematic-boundary residual is a normalized quality diagnostic. It is not the full measurement covariance, a general three-sigma prediction interval, or a model-rejection threshold. It cannot set the holdout threshold for circulation, energy, surface shape, or velocity-field predictions.

## 5. Conditional test matrix

All hypotheses must share the same measured initial conditions, fluid properties, geometry, instrument calibration, time synchronization, nuisance parameters and holdout runs. No model may receive a separate per-channel or per-run calibration after holdout is opened.

| Hypothesis | Shared parameters | Calibration and holdout | Predicted observable | Standard comparator | Falsification threshold |
|---|---|---|---|---|---|
| H0: standard fluid-mechanics baseline | Density, viscosity, surface tension, gravity, container/interface geometry, initial vortex circulation/core definition, impact conditions, camera and registration parameters | Independent calibration; freeze on training acquisitions; hold out complete collision runs | Joint Σ_F(t), U_M(x,t), circulation, core-region kinetic energy, free-surface energy and boundary-condition diagnostics | 3D Newtonian flow with free-surface kinematic/dynamic boundary conditions, instantiated from full Methods | Reject only if held-out joint residuals exceed a pre-registered predictive region built from measured, calibration, registration, cross-channel and model-discrepancy covariance |
| H_C: H(s)H core-plus-surface reduction | Same shared parameters; Φ_C and core threshold frozen on training data | Core extraction uses training runs only; complete independent collision runs are held out | Predict held-out bulk U_M and surface history from (W_C,Σ_F,C) | Same H0 data, calibration and parameter budget | Reject the reduction if matched π_C fibers show held-out output separation beyond the pre-registered uncertainty threshold; equivalently, the target fails to factor through q_C |
| H_M: H(s)H medium-retaining representation | Same shared parameters; no unmeasured run-specific calibration freedom | Same independent calibration and run-level holdout as H0,H_C | Joint surface and bulk fields plus the same derived observables | Same H0, with equal data access and declared complexity penalty | Reject if its held-out joint residual exceeds the same pre-registered predictive region, or if it requires post-hoc calibration/parameter changes; compare predictive loss with H_C on identical holdout units |

A possible common score is

\[
D_H=r_H^\top\Sigma_{\mathrm{joint}}^{-1}r_H,
\]

where Σ_joint must include both branches' measurement errors, shared calibration and registration uncertainty, cross-channel covariance, and model discrepancy. The threshold τ_pre must be fixed before holdout from the empirical null or a justified predictive distribution. Neither Σ_joint nor τ_pre can be numerically specified from the available abstract/preview. No significance level or numeric cutoff is invented here.

A null result means only “not distinguished at this experiment's resolution and support.” It does not establish physical equivalence between the representations.

## 6. Geometry: what is and is not forced

**Directly supported by the experiment:** a 3D water-flow volume, a 2D air–water free-surface interface, a vortex-ring flow structure, two measurement branches, and their time/space registration.

**Not forced by this experiment:**

- A four-dimensional spatial tube. The 4D-PTV label is 3D space plus time.
- Identification of the measured free surface with an H(s)H timesheet.
- A new H(s)H responsive-medium primitive. U_M is an ordinary measured water-velocity field.
- A particular worldtube thickness, core boundary, normal bundle, twist field, or contact-surface ontology.
- A physical equivalence between the standard air–water interface and an H(s)H contact surface.

A swept history of a finite vortex-core support could be a useful derived 3+1 representation if the full source defines Φ_C, its spatial metric/threshold, and uncertainty. It is not yet a measured H(s)H primitive. Twist would require an explicit transported frame/normal-bundle construction and observable; it is not inferred merely from a ring-shaped flow. Any nesting or reduction must use the explicit maps above and prove the relevant fiber condition.

## 7. Formalization and existing infrastructure

No new Lean theorem or build was created. The actual experiment-specific maps Φ_C, J, and their domains are not defined by the accessible source; formalizing them now would invent premises. Local Lean/Lake/Elan are not installed in this runtime.

Existing formal scaffolds were read and reused:

- Calder PR #1515, head 4cfb6803b641ad16cfe0918680f22fa54559e29a: exact-head Actions run #42722996625 completed SUCCESS with Lean 4.34.0/Lake 5.0.0 and a full 8,957-job root build. unitFold_factorization_iff_unitConsistency reports [Classical.choice]; fold_conflict_witness reports [propext, Classical.choice, Quot.sound]; unitFold_unique reports [Quot.sound]. Tests, lint, nanoda and the separate global axiom audit were skipped. PR remains OPEN/DRAFT/UNMERGED.
- Aldus PR #1657, head c186567b6b85c46076b0de2e6a498bb9fd3ae895: existing calibration/factorization module target built in Actions run #43332191359, but the overall root build FAILED in unrelated MovingPlaneTraceGeometry. Its set-map theorems formalize that physical-law and calibration maps must factor through a proposed reduction, or calibration must be retained in an augmented state. The measurable theorem has stronger Mathlib assumptions. Tests, lint, nanoda, leanchecker and global axiom audit were skipped. PR remains OPEN/DRAFT/UNMERGED and targets a verification branch, not main.

These theorems check their formalized map/split statements only. They do not prove that the article's calibration maps exist as modeled, that acquisition units are independent, that covariance is known, or that H(s)H is physically true.

## 8. Data gate and next action

To make this a real test, the P2 specialist must obtain or independently inspect:

- Full article Methods and exact definitions of the SVS/PTV reconstruction and vortex-core extraction.
- Raw synchronized SVS camera images and PTV particle images/tracks.
- Per-camera calibration and volume self-calibration files; joint spatial transform and time-sync offsets.
- Common field-of-view masks, valid spatial/time intervals, frame timestamps and acquisition metadata.
- Collision run IDs, repeat-run/condition structure, attempted-run denominator and exclusion log.
- Fluid properties and environmental conditions with units and uncertainty; initial circulation, core-size definition, impact geometry and boundary conditions.
- Full covariance/uncertainty budget, including cross-channel and shared-calibration terms.
- Software, neural calibration, perspective-matching, Shake-the-Box and VIC# reconstruction versions/parameters.
- A frozen independent-run holdout and pre-registered score/threshold.

The publisher says data are available upon reasonable request; no request was sent. The listed GIF is not a substitute for these records.

The existing P2 docket #565 remains OPEN with no final system selected. Its current primary candidate remains the Kestrel bathtub-vortex source. Han et al. is an additional source-verified candidate only; it does not replace that candidate, select P2, or change P2 specialist routing. Tern retains task-graph/candidate authority. No graph, issue #565, assignment, or ownership change was made.

## 9. Project controls and maintenance

- P0 Code Grurple: ACTIVE; this run did not touch Paper A/B presentation repair or Calder's restricted lane.
- P1 November 9 cognition: OVERDUE / NOT READY, Orson-owned.
- P2 November 30 geometry: HOLD; source/data gate remains open.
- P3 December 14 full theory: INCOMPLETE.
- FIE last full review November 10; next due November 24.
- All four canonical Mersearch lanes remain requested. The bounded historical Calder charter receipt was reused; no request was created, overwritten or retriggered. The extra unbound request file was left untouched.
- HsH, SAT archive and HSH_RESOURCES front doors were read. HSH_RESOURCES payload was not accessed because its README describes a private/internal boundary while repository metadata reports public visibility.
- Existing Math Hopper #578, Lean PRs #1515/#1657, Whirligig Kernel 0 and installed SciSpace route were checked. No new tool, dependency, fork, subscription or expense.
- Unrelated reading advanced in Alice’s Adventures in Wonderland, Project Gutenberg #11, lines 501–540; next cursor 541. This was a source-reading break, not a physical break.
- No SAT-O or Blockwave equation was modified; no new physical calculation, fit, prediction, independent measurement, paper-gate advancement or BEDROCK theory promotion.
- No task, task ID, schedule, prompt, phase, cadence or enablement change; no sixth task, signet or chat rename.
