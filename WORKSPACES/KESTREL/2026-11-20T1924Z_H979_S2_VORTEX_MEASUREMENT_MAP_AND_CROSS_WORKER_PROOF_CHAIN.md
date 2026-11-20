# Kestrel h979:s2 | Vortex-core measurement maps and cross-worker proof chain

**Date:** 2026-11-20  
**Nominal slot:** 2026-11-20T19:24:00Z  
**Run key:** REVROT3-19-20261011:979:s2  
**Classification:** assistant reconstruction; trust-first cross-boundary synthesis. This is a source-to-measurement-map analysis, not a new physical result, not a P2 system selection, not a Nathan Direct statement, and not a BEDROCK amendment. All map labels introduced below (including G, F, C, P, C₃ and P_C) are LOCAL:KESTREL_H979 bookkeeping, not registered H(s)H symbols.

## 1. Rotation and specialist boundary

- \(h=979\), \(seq=5(979)+2=4897\), \(4897\bmod19=14\).
- Selected deterministic ring label: **Kestrel**, index 14.
- Next label: **Meridian**, index 15.

Kestrel's historical remit is reconstructed from the original “Science Made Stupid” conversation and current workspace. Direct user-role messages establish a trust-first cross-boundary synthesis companion role: preserve distinctions among source, model, first-blush interpretation, and independently checked result; do not turn synthesis into a search-and-destroy audit. No standalone signed specialist charter or authenticated current Kestrel thread was established. This is assistant-level reconstruction, not participation by the historical Kestrel instance.

The :48 Meridian run had already started at the last scheduler read, and Meridian's current protected roster remit is Paper A accepted-R1 presentation support. This geometry synthesis creates no actionable P0 task for Meridian. No handoff packet, inbox mutation, assignment, or response obligation was created. No direct-thread delivery or acknowledgment is claimed.

## 2. New cross-boundary synthesis

The most useful candidate family is now clearer when separated into three experimentally different questions:

1. **Finite-core geometry and Kelvin-wave readout:** Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* 22, 409–414 (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w). Published 2026-02-10. The article identifies its supporting dataset at Figshare DOI [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347).
2. **Two-fluid dissipation and ring evolution:** Tang et al., “Imaging quantized vortex rings in superfluid helium to evaluate quantum dissipation,” *Nature Communications* 14, 2941 (2023), DOI [10.1038/s41467-023-38787-w](https://doi.org/10.1038/s41467-023-38787-w). Source data are provided with the paper as XLSX file 41467_2023_38787_MOESM11_ESM.xlsx.
3. **Reconnection and local scaling:** Bewley, Paoletti, Sreenivasan & Lathrop, “Characterization of reconnecting vortices in superfluid helium,” *PNAS* 105 (2008), DOI [10.1073/pnas.0806002105](https://doi.org/10.1073/pnas.0806002105). This is a tracer-inferred reconnection study, not direct imaging of the angstrom-scale vortex cores.

These are complementary readout families, not one pooled dataset and not evidence that a classical or quantum fluid vortex is physically identical to an H(s)H filament.

### 2.1 Barckicke et al. 2026: direct macroscopic core readout

The experiment uses a controlled air-water vortex with a stable, macroscopic core. Opposing optical contours are extracted as functions of axial position and time:

\[
r_+(z,t)=r(z,t,\theta=0),\qquad
r_-(z,t)=r(z,t,\theta=\pi).
\]

The source-defined two-channel readout is

\[
\eta(z,t)=\frac{r_+(z,t)-r_-(z,t)}{2},
\qquad
a(z,t)=\frac{r_+(z,t)+r_-(z,t)}{2},
\]

where \(\eta\) is core-axis displacement and \(a\) is core radius. The paper uses these channels to separate the \(m=1\) bending mode from radius-changing modes and forms spatiotemporal spectra from the measured signals.

The source's measurement conditions include:

- optical camera resolution \(2064\times1564\) pixels;
- nominal in-plane resolution \(60\,\mu\mathrm m/\mathrm{pixel}\);
- contour width about \(0.5\,\mathrm{mm}\);
- typical core-radius and position measurement uncertainty about \(0.1\,\mathrm{mm}\);
- typical acquisition at \(300\,\mathrm{fps}\), with \(30\,\mathrm{s}\) recordings;
- an axial measurement length of \(12.5\,\mathrm{cm}\);
- PIV with \(10\,\mu\mathrm m\) hollow-glass tracers, \(St\approx0.1\), \(6000\,\mathrm{fps}\), and a \(37\times23\) velocity grid at \(2.7\,\mathrm{mm}\) spatial resolution;
- reported circulation uncertainty about \(5\times10^{-3}\,\mathrm{m^2\,s^{-1}}\) and vertical-velocity uncertainty about \(0.05\,\mathrm{m\,s^{-1}}\).

The source dataset is publicly identified at Figshare, but its file bytes were not downloaded or assayed in this activation. The paper and dataset DOI are source evidence; they are not a completed independent numerical analysis.

A same-group follow-on, Barckicke, Gissinger & Falcon, “Experimental Evidence of Kelvin-Wave Turbulence along a Vortex Core,” *Physical Review Letters* 137, 134001 (published 2026-09-21), reports Kelvin-wave spectra consistent with a weak-turbulence cascade and six-wave resonant interactions. Its accessible APS abstract confirms the published claim. A separate public data package for that PRL study was not recovered here; do not assume it is the same Figshare package as the Nature Physics paper.

### 2.2 Tang et al. 2023: two-fluid response, not direct core metrology

The helium-II experiment uses solidified deuterium tracer particles with mean radius about \(1.1\,\mu\mathrm m\), a \(0.8\,\mathrm{mm}\) laser sheet, and a \(200\,\mathrm{Hz}\) camera. The best model-comparison data are reported at \(1.65\,\mathrm K\). The paper reconstructs vortex-ring profiles from projected tracer positions and compares ring-radius evolution with competing mutual-friction/two-fluid models.

The readout therefore tracks tracer-decorated core motion; it does not directly resolve the microscopic core profile. The paper's source-data workbook is explicitly identified as 41467_2023_38787_MOESM11_ESM.xlsx; code is available from the corresponding author on request. The workbook bytes and sample-level covariance were not recovered or recalculated in this activation.

Mira PR #929 already contains MiraTangRadiusProjection and MiraUncertaintyProvenanceGate, including a source-conditional projection treatment. This report does not duplicate those modules or claim that the workbook has been independently analyzed.

### 2.3 Bewley et al. 2008: reconnection inferred through tracer motion

The PNAS study records 52 candidate reconnection events, averaging about 13 particle-pair observations per event over roughly 1.5 decades in time. The measured separation is fitted to \(l'(t)=a(t-t_0)^\beta\); the reported exponent distribution has mean about \(0.45\) and standard deviation about \(0.07\).

The imaging uses approximately \(16\,\mu\mathrm m/\mathrm{pixel}\), 20 or 40 frames per second, and a \(100\)–\(500\,\mu\mathrm m\) light sheet. The authors explicitly state that vortex lines are not directly observed: micrometer solid-hydrogen particles are used to infer their locations, and some particles may not remain trapped. Projection, finite field-of-view thickness, tracer drag/inertia, curvature, particle loading, and mutual friction are identified limitations.

This is a useful reconnection-scaling comparator, not an independently recovered raw-data package and not an H(s)H prediction.

## 3. Explicit map obligations

The Barckicke source gives a well-defined final two-scalar map:

\[
M_{\rm contour}:(r_+,r_-)\mapsto(\eta,a).
\]

Its inverse is

\[
M_{\rm contour}^{-1}:(\eta,a)\mapsto(a+\eta,a-\eta).
\]

That algebraic map is bijective on the two contour samples. It does **not** prove that the optical/camera map from the complete three-dimensional vortex geometry to those two measured contours is injective.

The required composition is better represented as:

\[
\text{physical core geometry}
\xrightarrow{\,G\,}
\text{illuminated/projected contour data}
\xrightarrow{\,M_{\rm contour}\,}
(\eta,a)
\xrightarrow{\,F\,}
\text{spectral/readout summaries}.
\]

A separate medium-response channel maps the fluid velocity field to PIV/PTV observables. It must not be silently folded into the geometric readout or assumed statistically independent.

For H(s)H, the candidate comparison is:

- finite-core support/worldtube: a proposed geometric object to be mapped, not the measured \(\eta(z,t)\) or \(a(z,t)\) themselves;
- measurement sheet: an instrument-defined illumination/projection surface, **not automatically the H(s)H timesheet**;
- responsive medium: the actual fluid and its measured response, **not automatically identical to the H(s)H responsive-medium primitive**;
- coarse-graining: the map from resolved contour/time data to modal or spectral summaries must be specified before a nested representation is treated as equivalent.

A valid nesting claim needs explicit maps \(C\), \(P\), \(C_3\), and \(P_C\), with a stated domain and conditions, and a checked composition relation such as

\[
P_C\circ C = C_3\circ P.
\]

No source-defined H(s)H maps satisfying this relation were recovered. No physical equivalence is asserted.

## 4. Existing formalization chain: reuse, do not duplicate

Three existing worker branches already cover adjacent parts of the readout chain:

| Work | Existing artifact | Verified status |
|---|---|---|
| Kestrel two-contour readout | PR [#873](https://github.com/Satobloc/HsH/pull/873), head 94b6d96c91806a95505260a3c52220f4af294185 | Exact-head Actions run [#44090154878](https://github.com/Satobloc/HsH/actions/runs/44090154878), job #134062868110, success; 8,956 build jobs |
| Nadir two-channel readout | PR [#1189](https://github.com/Satobloc/HsH/pull/1189), head da1e7d5dff0cdbc1d81303e3c573b79832087a38 | Imported by the Sable bridge; source module defines the same \((r_+,r_-)\mapsto(\eta,a)\) map and its inverse |
| Sable covariance bridge | PR [#1538](https://github.com/Satobloc/HsH/pull/1538), head ae0e98444b97dcc61de41c15b08a16751f39a9bc | Actions run #42678421460, job #129366005810, success; 8,955 build jobs; source-checkout identity step passed |
| Mira Tang projection/provenance | PR [#929](https://github.com/Satobloc/HsH/pull/929), head 323fbad3a23b6aaede87c350d1ce3e64d23b1fd7 | Existing build #40921357971 succeeded; MiraTangRadiusProjection and MiraUncertaintyProvenanceGate compiled |

The Kestrel module defines coreReadout and recoverSides. Nadir defines observe and reconstruct. Their source-visible formulas are the same up to names and argument labels. However, no cross-module equality theorem or shared canonical import was found. Sable's covariance bridge imports Nadir's module, not Kestrel's.

Sable's bridge proves the symbolic covariance transform \(M\Sigma M^\mathsf T\). Its derived displacement/radius cross-covariance is \((v_+-v_-)/4\), and is zero iff the two raw marginal contour variances are equal. These are symbolic variables, not measured covariance values; no independence assumption is made.

**Cross-worker architecture finding:** the next useful formal bridge is not a third readout definition. It is a common typed map or a small equality theorem connecting Kestrel's readout to Nadir's canonical readout, after which covariance propagation can compose with the same observation map. This is a proposed coordination target, not an assignment or PR modification.

All listed PRs remain open/draft/unmerged. No formal review was present on Kestrel PR #873 or Sable PR #1538 at this readback. Sable PR #1538's job log checked out its exact head ae0e98444b97dcc61de41c15b08a16751f39a9bc and completed the 8,955-job build. The builds establish only their formalized conditional mathematics, not the soundness of source translation, the validity of camera calibration, or any H(s)H physical premise. No new Lean module or build was created in this activation.

## 5. H(s)H implications and limits

The live BEDROCK record treats finite intrinsic thickness as a qualitative source-committed premise; the exact \(\epsilon\), profile, and map remain unresolved. The historical coil scale \(\ell_f\) is separate and must not be substituted for a measured core radius without a source-backed derivation.

The classical vortex experiment is useful because it directly measures a macroscopic core radius and displacement over space and time. It can constrain generic finite-core readout geometry and wave propagation. It does not establish a microscopic H(s)H filament, a relativistic worldtube, a timesheet, or a universal responsive medium. Phase Steering retains the Kelvin-like responsive medium as a candidate only if the geometry forces it; the fluid experiments do not promote it to a third H(s)H primitive.

The helium-II ring and reconnection studies add complementary evidence about two-fluid coupling and reconnection, but their tracer-based readouts do not resolve angstrom-scale core profiles. The climbing-rope analogy was not used as a physical equivalence.

No physical calculation, fit, numerical comparison, CODATA comparison, observable prediction, holdout test, independent measurement, or P2 system selection was performed. The public Figshare data package remains a candidate for later source-pinned acquisition and assay, after P0 clearance and authorized system selection.

## 6. Project and workflow controls

- P0 Code Grurple remains ACTIVE. Paper A and Paper B remain PRESENTATION_PENDING / LIVE_ROUTE_NOT_OBSERVED.
- PR #2009 remains OPEN / DRAFT / UNMERGED, 3 commits ahead and 2,390 behind main (merge base d47be7cfacfa182aedaad17a9e0841eb80fdfddb); exact-head Actions runs: 0; formal reviews: 0. No rebase, merge, deployment, or route probe occurred.
- P1 cognition remains Orson-owned / OVERDUE / NOT READY.
- P2 November 30 remains HOLD; no measured system selected.
- P3 December 14 remains INCOMPLETE.
- Lane 24 Cycle 08/08 remains BACKSEAT / HOLD.
- FIE last review: 2026-11-10; next review due 2026-11-24.
- The latest control-plane record still shows four canonical Mersearch lanes occupied/requested with twelve expected request-scoped outputs absent. WH-02 remains the highest-priority unblocked PWH item: PR #1710 is 7 ahead / 7,807 behind, with zero exact-head Actions runs and zero formal reviews; Calder/authorized maintainer retains code action. WH-05 remains blocked by the four occupied lanes; PR #2050 is 11 ahead / 2,033 behind. No lane was overwritten, retriggered, released, or replaced. No private HSH_RESOURCES research payload was opened.
- The three-repository onboarding, HsH BEDROCK, October 26 Steering Charter, Three Paper Campaign, revival routing rules, Kestrel workspace, current branch, task graph, PWH queue, and recent receipts were read. SAT archive README was read; HSH_RESOURCES README only, respecting its private/internal boundary.
- Unrelated reading break: SAT archive 000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt, lines 1441–1480; next cursor 1481.
- Task graph snapshot: 18 records / 16 declared branches, 5 completed, 12 active, 1 blocked; last graph update 2026-11-20T11:24Z. Main before this run's writes: ddb7e1863b9adeb1c4eb48378de1f34a95113d67. The :24 task 6abda4c8eda88191bf23a6f2849e9a17 retains its exact hourly America/New_York :24 schedule, prompt, phase and enabled state. Current run f655a1b8-a15c-8329-9177-1faf82edc8f1 started 19:29:02Z and is IN_PROGRESS with chat_ref=null; its cached result is stale. The :48 Meridian run dc114b19-946c-8323-a1f5-64e3d6b7947d had already started 19:18:25Z and is IN_PROGRESS with chat_ref=null; no actionable P0 handoff was created.

## 7. Return and next safe step

The strongest current candidate for a future finite-core geometry comparison is the Barckicke et al. 2026 Nature Physics dataset because it combines directly measured core contour geometry, space-time evolution, a public data DOI, and stated instrumental uncertainty. Tang et al. 2023 is the complementary medium-response/dissipation candidate. Neither is selected for P2 while P0 remains active.

When authorized, the smallest next scientific step is to retrieve and hash the Figshare source files, inventory the actual variables and covariance, reproduce the published contour-to-\((\eta,a)\) readout, and only then define a source-faithful geometry-to-observable map. The cross-module readout equality should be coordinated with the existing Kestrel/Nadir/Sable owners rather than duplicated.

No BEDROCK amendment, SAT-O/Blockwave equation change, new tool, dependency, fork, subscription, expenditure, scheduler mutation, signet use, or conversation rename occurred.
