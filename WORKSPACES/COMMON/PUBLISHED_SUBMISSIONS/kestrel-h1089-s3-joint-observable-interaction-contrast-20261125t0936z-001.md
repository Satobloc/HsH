# Workshop Relay :36 | h1089:s3 | Kestrel

**Run key:** `REVROT3-19-20261011:1089:s3`  
**Nominal slot:** 2026-11-25 09:36 UTC  
**Disposition:** `JOINT_OBSERVABLE_CONTRAST_SUBMITTED / SOURCE_ANCHORED_MEASUREMENT_MAP / LEAN_SUBMITTED_NOT_VERIFIED / P2_HOLD / NO_PHYSICAL_HSH_PREDICTION`

## 1. Selection and identity

\[
h=1089,\quad seq=5h+3=5448,\quad 5448\bmod19=14.
\]

Selected: **Kestrel**, ring index 14. Next: **Meridian**, index 15.

This is deterministic routing only. No authenticated current Kestrel instance/thread, cross-thread delivery, participation, consumption, or acknowledgment is claimed. Meridian remains P0-protected; no assignment or handoff was created.

The existing :36 task remains enabled with its original identity, hourly schedule, phase, and prompt. No task change or sixth task.

## 2. Historical Kestrel source

Recovered original:
- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/26.09.20•26.09.22•KESTREL Orig. Science Made Stupid — raw (3).json`
- Conversation ID `6ab070ce-2384-83e9-b76f-4661c55867c4`
- Git blob `100267f3f11f3cce09c7d802ce85ad03879d5744`
- 2,394 mapping nodes; 2,044 selected-ancestry nodes; 249 user-role messages on that ancestry.

Direct user-role anchors:
- `77563549-2ae5-49e1-b95c-bc1fc7442586` (2026-09-21 00:41:33Z): prefers “intersection,” “instantiating,” or “observable slice” over “readout.” The new module uses **observable** terminology.
- `c6803d67-a76f-48e4-bf71-f49cb7b224ee` (06:15:43Z): asks for default credulity and trust in useful intuition without constant overclaim-policing.
- `f15aac1c-0a31-4e98-b461-6ca872035315` (07:12:05.972Z): “everything I tell you I know is an hypothesis. No more. No less.”

No standalone signed Kestrel charter was recovered. Direct historical messages are primary evidence; workspace continuity is assistant reconstruction. The remit is trust-first cross-boundary synthesis and conceptual cohesion, not primary-auditor or permanent proof-owner status.

## 3. Substantive improvement: joint-observable interaction signature

The existing Coupling-Preserving Projection Gate v0.1 and Mercer's dimensionally typed coupled-observable proposal are assistant-authored proposals, not Nathan Direct or independent measurements. The original P2 source/WKBJ candidate analysis is already published in [issue #1261](https://github.com/Satobloc/HsH/issues/1261); this run does not repeat it.

For abstract factor domains \(W,T\), common additive observable space \(V\), and \(O:W\times T\to V\), define

\[
\Delta_{WT}O =
O(w_1,t_1)-O(w_1,t_2)-O(w_2,t_1)+O(w_2,t_2).
\]

The submitted Lean module contains proof terms for:
1. Additive separability \(O(w,t)=f(w)+g(t)\) implies every four-corner contrast is zero.
2. Given basepoints \(w_0,t_0\), zero contrast over the full Cartesian domain implies additive separability.
3. One nonzero contrast rules out every additive-separable decomposition of that observable.
4. A constant additive detector offset cancels.

This is a candidate test for non-additive joint response. \(W,T\) are abstract factors, not an assertion that H(s)H has independently variable worldtube and timesheet carriers. A nonzero contrast does not by itself establish physical coupling, causation, H(s)H, or departure from standard physics. One zero quartet is inconclusive.

## 4. Source-grounded measurement map and real-data candidate

Standard reference: Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* (2026), [DOI 10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w).

At each \((z,t)\), the paper defines

\[
\eta=\frac{r(z,t,0)-r(z,t,\pi)}2,\qquad
a=\frac{r(z,t,0)+r(z,t,\pi)}2,
\]

with inverse \(r(z,t,0)=a+\eta,\ r(z,t,\pi)=a-\eta\).

The submitted Lean module includes proof terms for both round trips, packaged as an equivalence on \(\mathbb R\times\mathbb R\). Compilation is pending. If verified, this establishes only an invertible per-sample coordinate change, not an H(s)H projection or physical equivalence. Primary source: author-hosted [article PDF, Methods lines 234–237](https://labo.msc.u-paris.fr/~falcon/KelvinWavesDispersionRelation2025/BarckickeFalconGissingerNatPhys2026.pdf).

| Item | Source-grounded details |
|---|---|
| Candidate factors | Pump-flow setting \(U\), drain-hole diameter \(d\); published figures show separate one-factor sweeps, not a verified matched \(2\times2\) factorial |
| Observables | Core displacement \(\eta\), core radius \(a\), both lengths but distinct channels |
| Spectral window | 12.5 cm centred at \(z=22\) cm, i.e. \(z\in[15.75,28.25]\) cm |
| Acquisition | 300 fps, 30 s; 60 μm/px; 0.5 mm contour width; typical \(\eta/a\) uncertainty about 0.1 mm |
| PIV | 37×23 grid, 2.7 mm resolution; circulation uncertainty about 0.005 m²/s |
| PTV | Vertical-velocity uncertainty about 0.05 m/s |
| Separate PDF window | 10 min at 100 fps for \(a\), or 3 min at 360 fps for \(\eta\); 1,000 axial samples over 2.5 cm centred at \(z=18\) cm |
| Data | Article says spatiotemporal-spectrum data are available at [Figshare DOI 10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347); files/version metadata not yet retrieved |
| Standard comparator | Paper's Rankine-core Kelvin dispersion relation, equation (2) |
| Fit/holdout | Methods: \(a_0\) measured, \(\Gamma,v_z\) fitted to dispersion data, then checked a posteriori against PIV/PTV. A blind holdout must freeze independently measured \(a_0,\Gamma,v_z\) before predicting a held-out condition. |

Candidate statistic, only if the dataset contains a matched four-condition block under the same mode, acquisition, and calibration:

\[
\Delta_{Ud}O =
O(U_1,d_1)-O(U_1,d_0)-O(U_0,d_1)+O(U_0,d_0).
\]

For scalar corner vector \(y=(O_{11},O_{10},O_{01},O_{00})^\top\), use \(c=(1,-1,-1,1)^\top\) and \(\mathrm{Var}(\Delta)=c^\top\Sigma_yc\), retaining measured cross-covariances. No numerical threshold is selected before raw data, covariance, and holdout are recovered.

The paper's power spectrum \(S_X=|\widetilde X|^2/(LT)\) is a later summary; phase information must not be assumed to survive. The Figshare file inventory must establish whether raw contours or complex Fourier amplitudes exist.

The measured finite core is not automatically an H(s)H worldtube; the contour map is not a timesheet. No source-derived H(s)H map connects \(U,d,\eta,a\) to worldtube thickness, twist, contact surfaces, or mutual curvature. **No dataset files were downloaded, no physical calculation or fit was performed, no H(s)H prediction or numeric threshold was formed. P2 remains HOLD.**

## 5. Lean submission and verification

Draft [PR #2542](https://github.com/Satobloc/HsH/pull/2542):
- Base branch `infra/lean4-verification-20261023`, SHA `368f9af8d95d061b4581688759ed3eda309e9886`.
- Current exact PR head `a529bbc3ed3e12cc504c5b02a5733e038e619d3b`.
- Module `FORMAL_VERIFICATION/HsHVerification/KestrelJointReadoutInteraction.lean`.
- Existing Lean 4.34.0 / Mathlib 4.34.0 project reused.
- First exact-head run [#45593855251](https://github.com/Satobloc/HsH/actions/runs/45593855251) failed because the two real-valued definitions used noncomputable division without a `noncomputable` declaration. The four interaction-contrast theorem proofs and two contour round-trip theorem proofs compiled before the definitions failed. Their `#print axioms` output was `[propext]` for the interaction theorems and `[propext, Classical.choice, Quot.sound]` for the contour round trips. This failed run is not a successful build.
- Correction commit `a529bbc3ed3e12cc504c5b02a5733e038e619d3b` marks the contour map and packaged equivalence `noncomputable`.
- New exact-head Actions run [#45594540078](https://github.com/Satobloc/HsH/actions/runs/45594540078): exact PR-head checkout assertion PASS; Lake dependency-manifest generation IN_PROGRESS; Lean compilation and final theorem-specific axiom output pending. Status: **SUBMITTED_NOT_VERIFIED**.
- Local Lean/Lake/Elan are absent. The existing CI workflow is the compiler route. `FORMAL_VERIFICATION/lake-manifest.json` is absent from the PR branch; the workflow generates it in the runner but does not upload or commit it. The formalization README says to commit the manifest after the first successful dependency resolution. Even after a successful build, transitive-dependency reproducibility remains incomplete until that manifest is preserved.

A successful build proves only the formalized algebra and coordinate inverse, not physical interpretation, H(s)H translation, dataset validity, or observational truth. Factory Floor geometry-first gate is not met. If CI succeeds, only a **PRE-INTAKE HOLD / GEOMETRY_NOT_SUPPLIED / NOT FACTORY FLOOR ELIGIBLE / NOT AN H(s)H CANDIDATE / PHYSICALLY UNVALIDATED** record is appropriate.

## 6. Source, campaign, and operational boundaries

All four Mersearch request lanes were read and remain occupied. The Kestrel geometry-source-fidelity lane has no recovered request-scoped manifest or search receipt at its expected path. No request was submitted, overwritten, or retriggered; no Mersearch result is claimed. Direct Kestrel raw source and current HsH sources were read. Bounded GitHub code search was only a disclosed fallback. HsH and SAT archive front doors were consulted; HSH_RESOURCES root orientation only, no private payload.

Existing Lean infrastructure, Kestrel PR #2323, Nadir #2397, Ravel #1133, Mercer #2236, Sable #2327, Math Hopper #578 / PR #991, and Whirligig Kernel 0 were checked. SciSpace returned a distinct 2026 PRL follow-up, not the exact Nature article; the papers were not conflated. No new tool, dependency, fork, workflow, subscription, or expenditure.

Campaign: P0 ACTIVE / record safety FAIL / live Paper A/B routes NOT OBSERVED; P1 Nov 9 OVERDUE / NOT READY / FROZEN / ORSON-OWNED; P2 Nov 30 HOLD; P3 Dec 14 INCOMPLETE; FIE next Dec 8; unrelated-source break next Nov 28.

Current HsH main before this report: `c1493879d38ce3976ac3f4a681cefad16ccac9e3`, generated at 10:23:56Z from source parent `d5ba30b561a03b009eaf12723d804ba840580fd4`. Discovery blob `c8cb70281e066d5d32d1604ea8bb262678d1d0d0` (32,163,135 bytes), updated 10:23:51Z, was independently fetched and parsed. It contains 17,872 documents, 10,940 workspace records, 10,940 generic `reader` targets, 10,940 missing `presentation_state` fields, 48 docket entries, 577 visuals, and 6 extraction errors. The snapshot is fresh to its source parent; the h1089:s3 report artifact is not yet included because publication has not occurred. P0 record safety remains FAIL; live Paper A/B routes remain NOT OBSERVED.

No Common receipt, Kestrel workspace pointer, task graph, queue, ledger, reader, deployment, manuscript, SAT-O/Blockwave equation, or BEDROCK theory was modified under the P0 interlock. No duplicate report issue existed before submission.

## 7. Next cursor

1. Verify Actions run #45594540078 and inspect theorem-specific axiom output; preserve pending if incomplete.
2. If successful, route only a Factory Floor pre-intake hold.
3. Inspect Figshare 30903347 file inventory/checksums for raw contours or complex Fourier amplitudes.
4. Verify a matched \(U,d\) factorial under the same mode/window/acquisition.
5. Freeze calibration, full covariance, independent standard-physics parameters, and holdout before calculating any contrast.
6. Recover a source-authorized H(s)H map to measured observables before claiming an H(s)H prediction.

Next label: Meridian, P0-protected. No handoff, assignment, or response obligation. No direct-thread delivery or acknowledgment.

**Final:** `H1089:S3 / KESTREL_ROUTING_LABEL_ONLY / SOURCE_GROUNDED_ROLE_RECONSTRUCTION / JOINT_OBSERVABLE_CONTRAST_SUBMITTED / CONTOUR_OBSERVABLE_EQUIVALENCE_SUBMITTED / FIRST_EXACT_HEAD_BUILD_FAILED_AND_FIXED / SECOND_EXACT_HEAD_BUILD_PENDING / P2_HOLD / FIGSHARE_NOT_DOWNLOADED / NO_PHYSICAL_HSH_PREDICTION / NO_FACTORY_FLOOR_ADVANCEMENT / NO_COMMON_RECEIPT_UNDER_P0_INTERLOCK / NO_CROSS_THREAD_CLAIM / TASK_UNCHANGED / NO_SIXTH_TASK`.
