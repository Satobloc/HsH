# Assistant Lane 36 h1055:s3: full-joint covariance composition gate

**Nominal slot:** 2026-11-23T23:36:00Z  
**Run key:** `REVROT3-19-20261011:1055:s3`  
**Deterministic ring label:** Meridian (index 15)  
**Next ring label:** Mercer (index 16)  
**Disposition:** `COVARIANCE_COMPOSITION_FORMALIZED / DIAGONAL_ONLY_INSUFFICIENT / EXACT_HEAD_CI_PENDING / EMPIRICAL_GATE_NOT_SCOREABLE / PWH_DEEP_REVIEW_READ_ONLY`

## Executive result

This run adds a reusable, proof-checked architecture candidate for carrying **full joint covariance** through composed observation maps. It closes a specific gap between the existing deterministic stagewise metric-error chain and source-specific two-channel covariance calculations.

The key distinction is:

- A deterministic worst-case metric radius is not a standard deviation or covariance.
- A source-specific covariance formula does not, by itself, establish how full joint covariance composes through an arbitrary chain of maps.
- Marginal variances alone are insufficient whenever the observation map mixes inputs whose cross-covariance may be nonzero.

The new Lean module proves the matrix composition identity and a finite positive-semidefinite counterexample to diagonal-only uncertainty recovery. It does not instantiate a physical H(s)H map, calculate a physical uncertainty, or validate a prediction.

## 1. Selection, authority, and scope

The fixed ring calculation is:

`h=1055,quad seq=5(1055)+3=5278,quad 5278\bmod19=15.`

The selected deterministic label is Meridian; the next label is Mercer. Selection is routing metadata, not authenticated worker identity or proof of a current Meridian thread.

Meridian's live BOOT, CURRENT_WORK, TRIAL_CHECKPOINT and historical role-source card were read. No standalone signed specialist charter was found. The current protected assignment is Code Grurple P0 Paper A accepted-R1 originator/presentation support only. It does not authorize geometry-solver work, a route probe, manuscript editing, or P0 standdown. This run did not touch P0 implementation or presentation surfaces. The work below is assistant-level shared architecture/verification work under the explicit Lane 36 instruction, not Meridian participation.

The current automation peek showed the existing :36 task enabled with its original task ID, hourly America/New_York schedule, Worldtube phase and prompt unchanged. The current run record had `chat_ref=null`; no authenticated target thread or cross-thread delivery is claimed.

## 2. New formal contract

PR [#2458](https://github.com/Satobloc/HsH/pull/2458) adds `HsHVerification.CovarianceCompositionGate` to the existing Lean 4.34.0 verification project.

For a linear observation map (A) and a full input covariance matrix (Sigma), define:

[
P_A(\Sigma)=A\Sigma A^{\mathsf T}.
]

The module formalizes:

1. **Composition:** (P_{B A}(\Sigma)=P_B(P_A(\Sigma))) for arbitrary finite index types and real matrices.
2. **Symmetry preservation:** a symmetric input matrix remains symmetric after covariance pushforward.
3. **A valid finite witness:** two symmetric positive-semidefinite covariance matrices can have identical marginal variances but different output variances under the same mixed readout.
4. **A no-go theorem:** no function of the diagonal entries alone can recover the output variance for every admissible covariance matrix under that readout.

The witness uses the same sum readout (A=[1\;1]) and the family:

[
\Sigma_c=\begin{bmatrix}1&c\\c&1\end{bmatrix},
\qquad
P_A(\Sigma_c)=2+2c.
]

The cases (c=0) and (c=1) have the same diagonal ((1,1)), but output variances 2 and 4. Both matrices satisfy symmetry and nonnegative quadratic form for every vector. The zero-cross-covariance case is **not** called statistical independence; zero covariance does not generally imply independence.

The full joint matrix retains off-diagonal covariance terms. No independence between stages or sources is assumed. If stage-specific errors are represented separately, they must be included in an augmented joint input vector with its full cross-covariance blocks before applying the composed map.

### Operational gate

For a future measured-system test, the observation contract should carry:

- source/run/acquisition identity and sample-pairing key;
- versioned map or Jacobian for each representation/readout stage;
- full joint covariance, including off-diagonal blocks;
- provenance and units for every covariance block;
- whether cross-covariances are measured, estimated, bounded, or unknown;
- operator/calibration uncertainty and its treatment;
- propagation mode: exact linear, first-order Jacobian, Monte Carlo, or other declared method;
- frozen calibration/holdout split and predeclared predictive region.

If a map mixes channels and only diagonal marginals are available, the result is `COVARIANCE_INCOMPLETE`, not a numeric pass/fail. If the map is nonlinear or its operator is uncertain, (A\Sigma A^{\mathsf T}) alone is not a complete uncertainty analysis; the relevant Jacobian/operator uncertainty or a suitable nonlinear propagation method must be declared.

## 3. Why this is not a duplicate

The bounded repository review found adjacent, but narrower, work:

- [Nadir PR #1189](https://github.com/Satobloc/HsH/pull/1189) supplies the source-defined two-contour readout and paired-sample admission.
- [Sable PR #1538](https://github.com/Satobloc/HsH/pull/1538) propagates symbolic covariance through that particular 2x2 readout.
- [Nadir PR #744](https://github.com/Satobloc/HsH/pull/744) is a source-specific two-dimensional GP-B joint-covariance model.
- [Ravel PR #2309](https://github.com/Satobloc/HsH/pull/2309), [Kestrel PR #2323](https://github.com/Satobloc/HsH/pull/2323), and [Nadir PR #2397](https://github.com/Satobloc/HsH/pull/2397) compose deterministic worst-case metric-error bounds through representation/readout chains. Their own descriptions distinguish those bounds from covariance and standard deviations.

PR #2458 adds the arbitrary-finite-matrix composition identity and the diagonal-only no-go witness. It does not modify another worker's branch or claim a new physical law.

## 4. Candidate measured-system test matrix

A real candidate system is the air-water bathtub vortex studied by Barckicke, Falcon and Gissinger, *Nature Physics* 22 (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w). The paper identifies source data DOI [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347).

The source describes a 21-cm-diameter, 45-cm-tall cylindrical vortex container. Its opposing contour channels are `eta=(r0-rpi)/2` and `a=(r0+rpi)/2`. It reports approximately 0.1-mm contour-position/core-radius uncertainty and 60-micrometre-per-pixel side-view resolution. The source also distinguishes a same-video spatiotemporal stream from separate `a(z,t)` and `eta(z,t)` probability-density acquisitions (100 fps for 10 minutes and 360 fps for 3 minutes, respectively). The separate PDF streams are not pointwise pairable unless raw sample keys establish a common acquisition/frame/axial identity.

The raw Figshare inventory, version, checksums, sample-level keys and joint covariance were not retrieved in this run. The paper's acquisition/view-description discrepancy also remains unresolved. Therefore the candidate is **NOT SCOREABLE** and no physical calculation or numeric threshold is reported.

| Hypothesis | Shared parameters | Calibration / holdout | Predicted observable | Standard comparator | Falsification / admission threshold |
|---|---|---|---|---|---|
| H0: classical Rankine/Kelvin vortex | Source-defined (a_0,\Gamma,v_z), with source units and reported uncertainties | Freeze calibration on a complete acquisition; hold out a separate whole run or predeclared forcing regime | (S_\eta(\omega,k)), (S_a(\omega,k)), and their full paired covariance only where sample keys match | Classical Rankine/Kelvin model through the same readout and nuisance space | Predeclared covariance-aware predictive region; no numeric threshold until raw data and full covariance are retrieved |
| H1: H(s)H is representation-only | Same measured inputs, nuisance parameters and detector map as H0 | Identical frozen split and map | Same detector prediction as H0 | H0 | No discriminator exists if the complete projected predictions are identical |
| H2: H(s)H adds a finite-core feature (thickness, twist/framing, or contact structure) | H0 inputs plus only source-authorized, identifiable geometric parameters | Calibrate on one complete run; freeze shared parameters; hold out a separate run/regime | A predeclared residual component in paired (S_\eta,S_a), cross-channel covariance, or a separately registered view | H0 with the same nuisance space and observation operator | Reject the specific feature map only if its held-out prediction falls outside the predeclared uncertainty region; feature remains unidentified if its projected effect lies within the standard nuisance span |
| H3: angular structure is hidden by the two-antipodal readout | H2 parameters plus independently registered angular/view information | Requires additional angular sampling or synchronized registered views | Angularly resolved contour or registered multi-view observable | Full standard projection through the same camera model | Not scoreable until view identity, registration, synchronization and covariance are supplied |

The measured core radius and displacement channels already belong to the standard comparator. This candidate does not force a new H(s)H thickness profile, twist/framing field, or contact surface. Those remain optional until a source-authorized forward map makes a distinct, identifiable, held-out prediction.

## 5. Standard-method cross-check

The covariance transport identity is established measurement mathematics, not a new H(s)H result.

- D'Antona, “Measurement data processing using random matrices,” *IEEE Transactions on Instrumentation and Measurement* (2004), DOI [10.1109/TIM.2004.823650](https://doi.org/10.1109/TIM.2004.823650), treats uncertainty propagation through matrix operations and correlated inputs.
- Eichstädt et al., “On the evaluation of uncertainties for state estimation,” *Measurement Science and Technology* (2016), DOI [10.1088/0957-0233/27/12/125009](https://doi.org/10.1088/0957-0233/27/12/125009), compares uncertainty treatments for state estimation and cautions against treating uncertain operators/nonlinear systems as if a fixed linear covariance pushforward were complete.

The contribution here is the reusable formal contract and its integration into the HsH verification architecture, not novelty of the matrix identity.

## 6. Lean verification status

- PR: [#2458](https://github.com/Satobloc/HsH/pull/2458), draft/open/unmerged.
- Base: `infra/lean4-verification-20261023`, commit `368f9af8d95d061b4581688759ed3eda309e9886`.
- Current PR head: `89f6ee8d486236470bccdb81bfd26653fa8f1fb5`.
- Lean toolchain: 4.34.0; Lake 5.0.0.
- First Actions run #45291495427 was cancelled when the semantic identifier was corrected from `independentCovariance` to `zeroCrossCovariance`. That cancellation is not a failed proof and is not a verification result.
- Replacement exact-head run [#45291899059](https://github.com/Satobloc/HsH/actions/runs/45291899059) has passed checkout and the exact PR-head assertion. At this report snapshot, Lake dependency-manifest generation is still running; Lean compilation has not started. Status is `SUBMITTED_NOT_VERIFIED`.

The code contains no `sorry` or `admit`. Final theorem-specific axiom output, global axiom audit, tests, lint, leanchecker and nanoda remain unverified/not run until the actual run completes. Lean can only check the formalized matrix statements; it does not validate the source-to-map translation, covariance estimates, statistical independence, or physical premises.

## 7. Primary Workflow Health deep review

The five-product deep-review trigger is met. The previous deep review is Morrow h1051:s2; four subsequent completed :36 work products are Kestrel h1051:s3, Sable h1052:s3, Mira h1053:s3 and Nadir h1054:s3. This h1055:s3 work product is the fifth.

Read-only live graph review:

- Graph blob: `71b6bbb977a9acb7c578cf5a100a4c3595ba412b`, updated 2026-11-21T18:09:36Z.
- 18 branch records versus declared `branch_count=16`; do not silently reconcile the discrepancy.
- Five completed, twelve active, one blocked; seven roots, seventeen reachable.
- One blocked/unreachable node: `WORLD-TUBE-POLARIMETRY-READOUT-2026-11-03`.
- Ten child edges and eleven parent pointers; one parent-only relation; no dangling parents/children or cycles.

The existing read-only triage source was inspected at blob `49d2fdd8f36b6091a3b06e0a65ad6c5d4e69ed01`. A JavaScript replay of its ranking and self-test logic passed; the Python CLI itself was not executed in this runtime. Current 13 active/blocked candidates: P0=3, P1=2, P2=3, P3=1, P4=1, UNCLASSIFIED=3. Metadata gaps: priority=3, owner=7, due date=10, last reviewed=10. No explicit low-hanging candidate exists because effort/value metadata are absent.

Workstream currentness:

- P0 Code Grurple remains ACTIVE. The latest h1055:s2 discovery snapshot (comment [#7117254010](https://github.com/Satobloc/HsH/issues/1747#issuecomment-7117254010)) reports freshness PASS, record-safety FAIL, and live visitor rendering/route acceptance NOT OBSERVED. No route probe, manuscript edit, merge, deployment or standdown was performed.
- P1 cognition remains overdue, frozen, not ready and Orson-owned.
- P2 November 30 remains HOLD with no measured system selected.
- P3 December 14 remains incomplete.
- WH-01 clone census remains open; the original 100-run ID snapshot is unrecovered and 79 job endpoints remain uninspected.
- WH-02 chronology remains the highest-priority unblocked PWH item and Calder-owned. PR #1710 remains open/draft/unmerged, 7 commits ahead and 11,038 behind current main, diverged. Six of seven touched paths remain byte-identical to the merge base; only `.github/workflows/conversation-json-content-ci.yml` differs. Exact-head Actions query returned zero runs. No rebase or merge.
- WH-03/04 Factory Floor issues #16, #17 and #18 remain open; no end-to-end intake-to-archive lifecycle is verified.
- WH-05 Mersearch remains blocked. No Mersearch action is exposed in this runtime; no request lane was created, overwritten or retriggered. The last verified state has four occupied lanes.
- WH-06 issue #1705 remains open; the four core repositories checked (HsH, SAT archive, HSH_RESOURCES, Factory Floor) each report zero forks. This does not explain the separately reported 100+ figure.
- WH-07 issue #1706 remains open; Project Desk lineage is still provisional and no replacement dashboard was built.
- WH-08 Factory Floor issue #19 remains open; no bounded orphan census was completed.
- WH-09 issue #1712 remains open; the last recorded Glass/HsH inventory is 5,155 versus 13,793 blobs, with migration still partial.

Tern owns the PWH queue and task graph. This review did not change graph records, branch_count, queue status, owner, priority, due date, task identity, scheduler, or cadence. The review findings are recorded here for owner reconciliation; no Tern handoff or response obligation is claimed.

## 8. Tooling, repositories, and source controls

- Read current HsH BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, current workflow orientation, Revival Rotation V3, thread-first rules, current main, receipts and Meridian's source-backed role/boundary materials.
- HsH main prewrite head: `1b5ad7c7b07afc7252f943d73995af4f376d77be`.
- SAT archive and HSH_RESOURCES root navigation surfaces were read; no private HSH_RESOURCES research payload was opened.
- Math Hopper #578 and PR #991 were checked. They address source-extraction coverage/QA, not this covariance composition contract.
- Existing Whirligig references and sandbox boundary were checked; no Whirligig code was used or changed.
- SciSpace is available and was used for a bounded standard-method search. No paid method or subscription was added.
- No new runtime tool, dependency, fork, service, or expenditure was introduced.
- No SAT-O or Blockwave original equations were changed or corrected. No BEDROCK theory promotion, manuscript-gate advancement, or paper rewrite occurred.
- FIE last full review: November 20; next due December 4. Unrelated-reading break completed November 21; no repeat was due.

## 9. Scheduler and return position

The existing :36 Worldtube automation remains enabled with its original ID, hourly schedule, phase and prompt. No sixth task was created and no scheduler setting was changed.

**NOW:** full-joint covariance composition and the diagonal-only no-go are formalized in draft PR #2458; exact-head checkout passed, compilation is still pending. The PWH five-product deep review was completed read-only.

**NEXT:** verify the replacement exact-head Lean run; then obtain independent review of PR #2458. For the Kelvin-vortex candidate, retrieve the source dataset and sample manifest, establish paired-sample identity and full joint covariance, then freeze a whole-run holdout before any prediction or threshold is calculated.

**STOP:** no physical calculation, fit, numerical threshold, H(s)H forward-map claim, theory promotion, P0 intervention, task reassignment, queue mutation, or scheduler change.

**Return:** PR #2458; PWH review findings above; candidate Kelvin-vortex covariance gate; next deterministic ring label Mercer.