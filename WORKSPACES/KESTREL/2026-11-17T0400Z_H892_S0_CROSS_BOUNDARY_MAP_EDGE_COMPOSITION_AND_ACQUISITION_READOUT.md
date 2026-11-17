# Kestrel h892:s0 | Cross-boundary map-edge composition: source, geometry, acquisition, and readout

**Nominal slot:** 2026-11-17T04:00:00Z  
**Run key:** REVROT3-19-20261011:892:s0  
**Selected ring label:** Kestrel (index 14)  
**Next ring label:** Meridian (index 15)  
**Status:** CROSS_BOUNDARY_SYNTHESIS / EXISTING_CONTRACTS_COMPOSED / NO_NEW_SCHEMA / PWH_WH02_READ_ONLY_PREFLIGHT / NO_PHYSICAL_CALCULATION / NO_CODATA / NO_THEORY_PROMOTION

## Scope and role boundary

This is a source-grounded Kestrel revival, not an authenticated continuation of a historical Kestrel ChatGPT thread. The recovered September 21 direct user instructions define Kestrel as a trust-first cross-boundary synthesis companion: reason forward from the consequential case, while other teams perform primary source acquisition, provenance adjudication, mathematical verification, and experimental work. The working premise is that what has already been seen is probably approximately what it looks like for internal forward reasoning; Nathan separately states that his “I know” statements remain hypotheses. This is not a public conclusion or permission to erase uncertainty.

No standalone signed Kestrel specialist charter or current-thread authentication was found. The direct role messages and THREAD_HANDOFF_2026-09-21.md remain the authority. This run therefore integrates existing source-grounded outputs rather than duplicating their primary audits.

## Executive synthesis

The current geometry and measurement work has several individually useful contracts, but they live at different boundaries:

1. Kestrel's SnapshotBoundMapEdge binds a source-derived geometry-map edge to an exact repository snapshot and source locator.
2. Ariadne's geometry-fidelity work shows that a map's domain must include every co-participant that determines the readout, not merely the visually salient curve.
3. Calder's acquisition-parentage work separates acquisition identity and dependency axes from the claim-specific independence policy.
4. Elias's worldtube-witness work requires source, mapping, formal module, build, and review witnesses to refer to the same exact artifacts.
5. Existing fiber-factorization results supply a conditional test for whether a claim or readout survives a lossy projection.

The missing integration is not another independence score or a new provenance engine. It is a composition view in which the source snapshot, complete geometric map, formalization witness, acquisition/dependency profile, and comparison freeze all refer to the same versioned claim and observable.

A source snapshot can be exact while its geometry translation is undefined. A Lean build can succeed while the source-to-model map is wrong. A dataset can be a distinct acquisition while the model-to-instrument map is absent. A separate paper can use the same apparatus and team. These are orthogonal facts and must not collapse into one verified or independent Boolean.

## 1. Four witness layers and their existing owners

### A. Source and representation lineage

Kestrel h880:s3, [issue #1845](https://github.com/Satobloc/HsH/issues/1845), proposes SnapshotBoundMapEdge. Its source-side witness binds:

- repository, ref, commit, tree, path, blob, byte length, and digest;
- a resolving source locator (message UUID or document section/line range);
- source authority (Nathan Direct, bylined/unbylined historical source, external standard, assistant reconstruction);
- exact map artifact and digest, or explicit null;
- domain, codomain, units, frame/metric conventions, composition order, and supplied conditions;
- map status (SOURCE_DEFINED, ASSISTANT_RECONSTRUCTION, PARTIAL, MAP_UNDEFINED);
- a claim-specific preservation certificate where required;
- the consuming comparison freeze.

This remains a proposal, not an implemented ModelFreeze/ComparisonFreeze/SourceRunWitness schema. Repository membership is not authorship, and multiple paths sharing one Git blob are aliases rather than independent witnesses.

### B. Complete geometric map domain

Ariadne h886, [issue #1862](https://github.com/Satobloc/HsH/issues/1862), supplies a useful correction to the map-edge domain.

The March 2024 moving-plane example is not a map from curve shape alone. The direct description has a curve and a moving plane family acting together. The assistant reconstruction is

\[
p(t)=\gamma(s(t)),
\]

where the plane family selects the curve parameter \(s(t)\). Its kinematic derivative is

\[
\ddot p(t)=\gamma''(s(t))\dot s(t)^2+\gamma'(s(t))\ddot s(t).
\]

This is a reconstruction of the described moving-intersection geometry, not a verbatim Nathan Direct equation. It shows why the map domain must include the curve, plane family, selected branch, and time/parameter relation. Shape alone does not determine the readout motion.

The existing [PR #262](https://github.com/Satobloc/HsH/pull/262) contains the relevant conditional helix/slice and moving-plane modules. Exact PR-head Actions run [#43948452979](https://github.com/Satobloc/HsH/actions/runs/43948452979) succeeded. The PR remains open and unmerged; this is not current-main integration or physical validation.

The same domain-completeness issue appears in the later constructions:

- **SAT-O1:** a displayed one-parameter curve does not itself construct the prose-described four-dimensional volume swept by vibration. A source-faithful map would need the vibration/sweep family, transverse support/fibre, parameter-to-time relation, boundary convention, and relevant frame/metric conditions.
- **2026 core/worldtube:** a one-dimensional core, four-dimensional finite-core tube, three-dimensional boundary, timesheet, possible mouth/interface, and candidate two-dimensional worldsheet are distinct typed objects. The normal-bundle thickening, end conditions, timesheet intersection, and worldsheet selection maps are not source-defined.
- **Kelvin-vortex measurement:** an extracted centerline or core-radius field is not automatically an H(s)H worldsheet/worldtube. The H(s)H-object-to-physical-state map remains absent.

### C. Acquisition parentage and claim-scoped dependence

Calder h890:s3's source-based Kelvin-vortex crosswalk adds a different witness layer. Its [acquisition dependency map](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/CALDER/2026-11-17T0236Z_H890_S3_KELVIN_ACQUISITION_DEPENDENCY_MAP.json) separates:

- unique acquisition parentage;
- raw-data, acquisition, apparatus, personnel, calibration, analysis, evaluation, and laboratory dependencies;
- the claim policy specifying which axes must be distinct for that particular claim.

The Nature Physics and PRL papers are separate publications by the same three-person research team with overlapping institutional affiliations and a closely matching apparatus family. They do not establish independent-laboratory replication. The PRL's 1-, 15-, and 75-minute analysis records have no published run IDs or overlap/parentage map; their parentage is UNKNOWN, not proven same and not proven distinct.

Derived channels are not automatically independent sensors or acquisitions:

- The left/right contour samples transform to \(a=(r_0+r_\pi)/2\) and \(\eta=(r_0-r_\pi)/2\); this is an invertible readout transform of the same two radial samples.
- The 1,000 axial positions used for the PDFs are slices derived from a recording, not 1,000 independent replicates.
- The PRL pentacoherence is a higher-order statistic derived from the \(\eta(z,t)\) field, not a separate sensor.

The claim policy differs by question. Independent analysis may reuse raw data; independent-acquisition holdout requires distinct raw data and acquisition, unique parentage, calibration/covariance, and whole-acquisition holdout; independent-laboratory replication additionally requires distinct apparatus, personnel, and laboratory. Unknown remains unknown.

### D. Formalization, build, and review identity

Elias's [worldtube witness composition note](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/elias-h879-s3-worldtube-witness-composition-20261116t1536z-001.md) identifies a separate version-identity gap: the source-to-formal trace, mapping artifact, target module, PR-head/checkout blob, build run, and independent review must refer to the same exact target. A successful build witness cannot be borrowed by a neighboring but different module digest.

This is a proposed composition gate, not an implemented production schema. It does not prove that the source translation is sound or that a physical premise is true.

## 2. Combined map diagram

    SOURCE / TRANSLATION PATH
      exact source snapshot
           |
           | source locator + authority
           v
      direct geometric proposition
           |
           | complete map domain, including co-participants
           | map artifact digest + conditions + preserved claim
           v
      mathematical representation
           |
           | exact formal module blob = PR head = checkout blob
           | completed build witness + theorem-specific axiom report
           | independent review of that exact blob
           v
      formalized model claim
           |
           | source-authorized forward map (currently absent for H(s)H)
           v
      predicted observable
           |
           +---------------- COMPARISON JOIN -------------------+
                                                                |
    MEASUREMENT PATH                                             |
      identifiable physical system                               |
           |                                                    |
           | acquisition parentage + dependency profile         |
           v                                                    |
      raw acquisition / data                                     |
           |                                                    |
           | calibration + instrument/readout map + covariance  |
           v                                                    |
      measured observable ---------------------------------------+
           |
           | same candidate version, observable, units, frame,
           | fit/holdout exposure, and claim-specific dependency policy
           v
      comparison claim

The comparison join must bind both paths to the same candidate version and observable definition. It must not infer a missing forward map from a good fit or infer independence from publication count.

## 3. Stable glossary

| Term | Meaning | Boundary it does not certify |
|---|---|---|
| Source snapshot witness | Exact repository snapshot and artifact membership | Authorship or semantic correctness |
| Source locator | Message UUID or document span inside the snapshot | Actual run-context exposure |
| Map edge | Versioned transformation with domain, codomain, conditions, and claim | Physical truth |
| Co-participant | Any second structure or control parameter required to define the map | A decorative analogy |
| Preservation certificate | Claim-specific condition surviving a map/projection | Every property of the source object |
| Acquisition parentage | Identity/ancestry of raw measurement records | Statistical independence by itself |
| Dependency profile | Separate shared/distinct/partial/unknown axes | A universal scalar independence score |
| Claim policy | Axes required to be distinct for a specified claim | A rule applicable to every claim |
| Formalization witness | Exact source-to-module/build/review artifact chain | Soundness of translation |
| Readout map | Instrument/calibration transformation from physical state to data | H(s)H forward map |
| Comparison freeze | Same candidate version, parameters, calibration, holdout, comparator, and decision rule | A completed empirical test |

## 4. Original propositions versus translated additions

| Source-grounded proposition | Historical/assistant translation | Fidelity status |
|---|---|---|
| A moving plane intersects a curve; its intersection readout changes as the plane moves. | Ambient spiral/shape-only motion in early assistant replies. | Frame and co-participant were lost; later corrected. |
| A perfect helix has fixed cross-sectional radius; pitch and slice speed affect phase rate. | Orbit size made dependent on pitch and plane speed. | Radius confused with phase rate; corrected in the conversation and represented conditionally in PR #262. |
| SAT-O1 displays a one-parameter curve in four-dimensional coordinates and separately describes a volume swept by vibration. | Treating the displayed curve as if it already constructs a finite-core worldtube. | Missing sweep/thickening map. |
| Blockwave attachment supplies a rank-two antisymmetric current and conservation equation. | Identifying its support with a core, tube, or worldsheet. | Support and embedded-content authorship unresolved. |
| 2026 direct geometry distinguishes a one-dimensional core, four-dimensional tube, three-dimensional boundary/timesheet, and possible two-dimensional worldsheet. | A rank-three normal-bundle construction and \(S^2\) boundary fibers. | Plausible assistant reconstruction; topology, compactness, metric, and end conditions are additional assumptions. |
| Kelvin-vortex papers report distinct readouts and analysis durations. | Treating every channel or duration as an independent acquisition. | Not supported; channel derivation and acquisition parentage must be kept separate. |

### Historical equations preserved verbatim

**SAT O1 4D.txt** — unbylined historical artifact, file-index date 2025-06-09; SHA-256:

8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937

\[
\gamma^\mu(\lambda)=
(\lambda,\,
A_x\sin(k_x\lambda+\phi_x),\,
A_y\sin(k_y\lambda+\phi_y),\,
A_z\sin(k_z\lambda+\phi_z))
\]

\[
v^\mu(\lambda)=\frac{d\gamma^\mu}{d\lambda},\qquad
S[\gamma]=\int d\lambda\,\mathcal L(\gamma^\mu,v^\mu),
\]

\[
\mathcal L=\frac12 m v^\mu v_\mu-V_{\mathrm{tension}}(\gamma).
\]

**Blockwave attachment** — user-supplied attachment event 2025-09-16; embedded authorship and original composition date unresolved; SHA-256:

3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664

\[
J^{\mu\nu}=\frac12\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma,
\qquad
\nabla_\mu J^{\mu\nu}=0.
\]

The separate conditional identity \(J=\tfrac12 *F\) under a specified metric/orientation convention remains a later derivation, not a correction to the attachment. No original equation was changed.

## 5. Discrepancy ledger

| ID | Missing or mismatched edge | Consequence |
|---|---|---|
| D1 | Source snapshot is not joined to every source-derived map edge. | A map can silently drift to a different source version. |
| D2 | Geometric map domains omit co-participants or sweep controls. | A curve alone is mistaken for a complete motion/worldtube construction. |
| D3 | SAT-O1 vibration/sweep map is undefined. | The displayed 1D curve does not construct the described 4D finite-core support. |
| D4 | Timesheet, boundary, mouth, and worldsheet selection maps are undefined. | Dimensional nesting remains a proposal, not a composed hierarchy. |
| D5 | Acquisition parentage is absent for several analysis records. | Same, distinct, and independent cannot be inferred. |
| D6 | Derived channels are counted as separate evidence. | Readout transformations and spatial slices are mistaken for independent sensors/replicates. |
| D7 | Formal trace, target module, build, and review may bind different blobs. | A neighboring successful build can be misapplied to an unreviewed target. |
| D8 | Source, formal, empirical, and presentation statuses are collapsed. | A pass in one layer is incorrectly promoted into another. |
| D9 | Lossy projection has no claim-specific preservation condition. | A downstream claim may not survive the projection. |
| D10 | No H(s)H-object-to-vortex-state forward map exists. | The Kelvin-vortex candidate cannot yet test the proposed H(s)H geometry. |

## 6. Formal and empirical status

The existing fiber-factorization result in Kestrel PR #873 and the fiberwise attribution work in PR #1189 provide conditional set-map results: a claim/readout factors through a projection only when it is constant on the relevant projection fibers. They do not instantiate the physical maps above.

A fresh status check of Calder PR #1515 found exact-head Actions run [#44009472529](https://github.com/Satobloc/HsH/actions/runs/44009472529) completed **FAILURE** at commit 77b357fdf80abb4a8332def3fd9ad05dedf8198c. The checkout identity assertion passed, but CalderIndependenceProfile.lean failed at line 102:24 with an unsolved goal and at line 187:14 with unknown constant partial_required_axis_blocks_claim. Tests, lint, nanoda, and the separate global axiom audit were skipped. This supersedes the h890 Calder receipt's “pending at report freeze” status. PR #1515 remains open/draft/unmerged and Calder-owned; no retry or code edit was made here.

No new Lean theorem or build was attempted. The current source-specific map definitions are incomplete, and the relevant geometry/Calder PRs remain separately owned. Lean would check only the formalized statements, not translation fidelity or physical premises.

No raw Kelvin-vortex data were ingested. The Nature Physics Figshare package version, raw inventory, acquisition IDs, checksums, calibration, and covariance remain unverified. The PRL data are not publicly available in the source record; no author request was sent. P2 remains HOLD. No physical calculation, fit, prediction, uncertainty propagation, independent measurement, CODATA scoring, or falsification threshold was produced.

## 7. Primary Workflow Health: WH-02 read-only preflight

The highest-priority unblocked item remains WH-02, owned by Calder/authorized maintainer. PR #1710 is OPEN / DRAFT / UNMERGED, 7 commits ahead and 3,838 behind current main, with GitHub's current mergeable=true indicator; no formal review or exact-head CI was established, and the visible Vercel success is not code-test evidence.

A path-local comparison was performed against the PR merge base. All seven PR-touched paths have identical blob SHAs on the merge base and current main; the PR head differs on all seven. This is a useful rebase preflight, not a conflict-free rebase guarantee. Calder retains the branch action and Tern retains PWH/graph/scheduler authority. No branch, PR, issue, queue, graph, or task mutation was made.

WH-05 remains blocked: all four canonical Mersearch request lanes are occupied. P0 Code Grurple remains ACTIVE; issue #1747 remains open. P1 remains Orson-owned, OVERDUE / NOT READY; P2 HOLD; P3 INCOMPLETE. The task graph remains 16 declared branches and 18 records. FIE was last reviewed 2026-11-10; next review is 2026-11-24. No paper gate advanced.

## 8. Continuity and next cursor

- HsH main before this run's writes: 220a5d6f71a36218d737a1394fea809e529f9d29.
- Kestrel's latest prior report is h884:s2, not the stale h880 pointer still at the top of BOOT. Issue #1854 has publisher comment #6928735293 confirming PUBLISHED and exact artifact readback. The h884 canonical receipt still retained its creation-time SUBMITTED_NOT_VERIFIED line; a numbered receipt amendment records the final status.
- Unrelated reading: SAT archive 000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt, lines 1881–1920 read; next cursor 1921. No physical break is claimed.
- FIE re-review is not due until 2026-11-24.
- The next ring label is Meridian (15). The :12 lease remains disabled; no task or assignment is created. No relevant successor handoff was made. No authenticated Meridian thread, direct delivery, consumption, or acknowledgment is claimed.
- Scheduler snapshot: the current :00 last_run is run b1d03207-7e70-8330-b3e8-e59027cbe68b, scheduled 04:00Z, started 04:04:19Z, IN_PROGRESS, chat_ref=null. latest_result is a different prior run, e65e4f17-b504-8325-9666-42392b29eb73, scheduled 03:00Z; its content is labeled h890:s0/Alberr, while the deterministic 03:00Z slot is h891:s0/Elias Kern. This prior-result/run-key mismatch is already recorded in issue #1812; no history rewrite or scheduler mutation was made.
- No new tool, dependency, subscription, fork, branch, PR, or automation was created. No task ID, prompt, schedule, phase, enabled state, signet, or chat name was changed.

**Next substantive cursor:** compose the existing source-snapshot witness, complete map edge, formalization/build/review witness, and claim-scoped acquisition profile at the existing ComparisonFreeze boundary without creating a parallel schema. Geometry owners must define the source-authorized sweep, timesheet, worldtube, mouth, and readout maps. Calder should repair and rerun PR #1515. P2 remains held until one actual measured system, its raw acquisition, calibration, covariance, and a genuinely unseen holdout are verified.

**Final disposition:** H892_S0 / KESTREL_CROSS_BOUNDARY_SYNTHESIS / MAP_EDGE_COMPOSITION_GAP_IDENTIFIED / EXISTING_CONTRACTS_REUSED / WH02_READ_ONLY_PREFLIGHT / CALDER_PR1515_EXACT_HEAD_FAILURE_VERIFIED / NO_NEW_SCHEMA / NO_NEW_LEAN / NO_PHYSICAL_CALCULATION / NO_CODATA / NO_THEORY_PROMOTION / TASKS_UNCHANGED.