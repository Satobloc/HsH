# Ravel h1082:s3 | Carrier/current degree and observable-identifiability gate

**Run key:** REVROT3-19-20261011:1082:s3  
**Nominal slot:** 2026-11-25T02:36Z  
**Selected:** Ravel (ring index 17); next label Orson Vay (index 18).  
**Participation:** source-grounded reconstruction, not an authenticated Ravel instance/thread.

## Main improvement

This run formalizes a boundary between three structures that must not be identified by terminology alone: SAT-O1's one-parameter 1D spacetime curve, Blockwave's conserved rank-2 filament-worldsheet current, and SAT-O1's prose description of a 4D worldtube volume.

In a 4D ambient manifold, the conventional Poincare-dual degree ledger assigns a 1D support a 3-form dual, a 2D worldsheet a 2-form dual, and a full 4D volume a degree-zero dual. A 1D curve needs one independent sweep parameter to make a 2D worldsheet; a full 4D volume needs three independent extension directions beyond the curve, or two beyond a 2D worldsheet. The actual embeddings, fibers, orientations and projection maps remain unspecified.

I extended existing Ravel PR #1133 with a conditional support-degree and local-identifiability module. The new module is **not yet compiled**. I also constructed a real-data candidate test architecture using helium isotope-shift spectroscopy, without claiming an H(s)H fit or prediction.

## 1. Historical role and thread status

Original Ravel conversation ID: 6a9d1a23-4fac-83ea-b76f-6805ece3ee9f. Raw Git blob: 17cfe3feb830f70009557d063482b35adba0834b. Direct user-role source messages include 638d13ba, c5639160, 5590d70d, 4fb7a5be, 496a15ea, b9805319 and 3d0ad680. No standalone signed specialist charter exists; these user messages are primary evidence and later workspace descriptions are reconstructions.

Historical remit: primary co-theorist work, conceptual cohesion, drift detection, epistemic hygiene, full-theory probing, source/citation lineage and accurate public representation. Finite-core/worldtube/timesheet and Kerr-section source fidelity are within that remit.

The later Ravel Free Build export's last user activity is 2026-10-15T05:14:58Z. Ravel INBOX and CONTINUITY contain no verified newer writable thread. Existing-thread-first was checked; no authenticated current Ravel thread was established. No new chat, rename, direct-thread delivery or acknowledgment is claimed.

## 2. Original equation custody

### SAT-O1

Source: https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SATOBLOC/SAT%20O1%204D.txt

Git blob 7577aa1ee5a6c3850ce3b226c75377de6367aedc  
SHA-256 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937  
Filesystem metadata previously recorded: creation 2025-10-26; last-write 2025-06-09; timezone unspecified. These are not a demonstrated composition or authorship date. The file is unbylined.

Verbatim source statements:

> Filament: A smooth, one-dimensional object γ : ℝ → ℝ^{3,1} parameterized by an affine parameter λ.

> Worldtube: The 4D volume swept out by the vibrating filament, representing its real, physical presence in spacetime.

Displayed equations:

\[
\gamma^\mu(\lambda)=
(\lambda,\ A_x\sin(k_x\lambda+\phi_x),\
A_y\sin(k_y\lambda+\phi_y),\
A_z\sin(k_z\lambda+\phi_z))
\]

\[
v^\mu(\lambda)=\frac{d\gamma^\mu}{d\lambda},\quad
S[\gamma]=\int d\lambda\,L(\gamma^\mu,v^\mu),\quad
L=\frac12 m v^\mu v_\mu-V_{\mathrm{tension}}(\gamma).
\]

The one-parameter curve/action does not itself define the extra independent parameters or rank-four embedding needed to generate the separately described 4D volume. This is an under-specified composition, not a demonstrated contradiction.

### Blockwave

Source: https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/%F0%9F%A7%B1BLOCKWAVE.txt

Exact path: DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt  
Git blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d  
SHA-256 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664  
Attachment event 2025-09-16T16:31:26.687Z, not a composition date. Embedded prose is assistant-voiced; full authorship is not established as Nathan Direct.

Verbatim source equations:

\[
\nabla_\mu J^{\mu\nu}=0,\qquad
J^{\mu\nu}=\frac12\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma.
\]

The source describes J as a conserved two-form filament-worldsheet current. Its raw projector token on lines 9 and 85 is literally:

P^\mu{}\nu\!\equiv \delta^\mu{}\nu+u^\mu u_\nu

The second-index marker is malformed in the source. The source-token correction is recorded in issue #2374, comment #7086126431. No corrected projector is adopted; the source remains untouched.

**Separate standard-form candidate, not adopted:** if u is unit timelike in mostly-plus signature, the conventional mixed-index projector is

\[
P^\mu{}_\nu=\delta^\mu{}_\nu+u^\mu u_\nu,\qquad u^\mu u_\mu=-1.
\]

This is an assistant reconstruction from standard tensor notation, not a verbatim Blockwave equation, not a Nathan Direct correction and not used as a premise in the Lean module. No SAT-O1 equation correction is proposed.

## 3. Support-degree and explicit map hierarchy

For an oriented support of dimension d in M⁴, the conventional Poincare-dual current degree is 4-d:

| Support | Dimension | Dual degree |
|---|---:|---:|
| SAT-O1 curve | 1 | 3-form |
| Blockwave worldsheet | 2 | 2-form |
| Hypersurface | 3 | 1-form |
| Full 4D volume | 4 | degree-zero distribution/indicator |

This is conditional degree bookkeeping; it does not construct a differential form, orientation, distribution, current, embedding or physical support.

A 2D worldsheet requires an independent second parameter:

\[
F:I\times S\to M^4,\qquad \operatorname{rank}(dF)=2.
\]

A full 4D support from a 1D curve requires three independent extension directions:

\[
W:I\times Q^3\to M^4,\qquad \operatorname{rank}(dW)=4.
\]

Alternatively, a 2D worldsheet needs two independent thickness parameters:

\[
T:\Sigma^2\times B^2\to M^4,\qquad \operatorname{rank}(dT)=4.
\]

A single sweep parameter does not create a 4D volume. Ravel's direct user source says to choose a spatial Kerr section and extend it along the filament, but does not fix whether the section is 2D or 3D. The existing RavelKerrSectionSweepRankGate handles conditional 2D/3D section-plus-one-parameter cases; this run does not select a section dimension.

**Forced vs optional:** a 2-form worldsheet-current interpretation requires 2D support; SAT-O1's 1D curve needs a separate lift to reach it; a full 4D worldtube requires a rank-four map or full-dimensional support. Finite thickness, twist, contact surfaces, a particular Kerr-section dimension, fiber geometry and their coupling to atomic states remain optional until explicit source-bound maps constrain them. The Blockwave 2-form current and SAT-O1 4D volume may coexist as different structures.

### Minimal observable composition (assistant reconstruction)

A testable atomic readout would require:

\[
\text{support geometry}
\xrightarrow{\mathcal P_{\rm core}}
\delta V_H(\mathbf r)
\xrightarrow{\langle\psi_n|\cdot|\psi_n\rangle}
\delta E_n
\xrightarrow{(\delta E_b-\delta E_a)/h}
\delta\nu_H(a\to b).
\]

The first map, P_core, is the missing H(s)H constitutive map from declared support geometry to an effective atomic operator. The expectation-value and transition-frequency readout are standard first-order quantum-mechanical structure, not a Nathan Direct H(s)H equation. No delta-V_H has been supplied or inferred.

## 4. Lean formalization in existing PR #1133

PR: https://github.com/Satobloc/HsH/pull/1133  
Branch: research/ravel-carrier-slice-reconstruction-20261031t0212z  
New head: 8ae6bc1ac077df81d66fbbfab484867a98cb65c9  
Module: FORMAL_VERIFICATION/HsHVerification/RavelCurrentSupportIdentifiabilityGate.lean  
Module blob: a7e85d041b452b8ce4f83e627c73851d80ce5d55

The module formalizes:
1. Conditional 4D support/dual-degree arithmetic for 1D, 2D, 3D and 4D supports.
2. Three extension parameters from a 1D curve to a 4D product domain, and two thickness parameters from a 2D worldsheet to a 4D product domain.
3. A local linear identifiability criterion: an H(s)H response is exactly absorbable when it lies in the declared nuisance map's range.
4. If in that range, a nuisance shift absorbs any scalar multiple; if outside, exact linear absorption is impossible.
5. Invertible covariance whitening preserves exact nuisance-range membership and local distinguishability. Whitening changes residual magnitude/statistical power, not exact linear confounding.

This is a conditional formal gate, not a physical response operator. The actual geometry-to-current and geometry-to-Hamiltonian/readout maps remain undefined.

**NEW MODULE: UNCOMPILED.**

- Previous exact-head build #45351724450 passed on the previous PR head 582264f2776f55db962b7db954a8153d7b29cb14; it does not cover the new module.
- First new push triggered #45531183055, a different conversation-JSON workflow that failed with zero jobs exposed. It is not a Lean result.
- The subsequent source-token amendment has no observed workflow run.
- No local Lean, Lake or Elan executable is installed.
- The existing Lean workflow supports manual dispatch, but no workflow-dispatch action is exposed by the connected GitHub tool in this run.

PR #1133 remains OPEN / DRAFT / UNMERGED. Its current head is 94 commits ahead and 14 behind the live infra/lean4-verification-20261023 branch; PR metadata records an older base SHA. Live HsH main is a13b02a0311d1d9ae6228512db286523a6ca7b2c. No rebase, merge or approval was performed. Exact-head Lean 4.34.0 / Mathlib compilation, theorem-specific axiom output and sorryAx/admit checks are required before claiming proof.

## 5. Real-system candidate: helium isotope-shift spectroscopy

This is a candidate for future P2 discrimination, not a selected P2 system.

### Data provenance

3He raw-data record: Dryad DOI 10.5061/dryad.4j0zpc8m3  
https://datadryad.org/dataset/doi%3A10.5061%2Fdryad.4j0zpc8m3

The 151.94 MB package is described as containing raw spectra, frequency-comb counter records, timestamps, Cs/GPS timing information, run flags and analysis code. README access succeeded; direct file retrieval returned HTTP 403. No raw data were downloaded, checksum-verified or reanalysed. The 4He 2026 raw time series was not recovered; only published summaries are available.

Standard-reference records:
- 2004 4He 2³S₁→2³P₀,₁,₂: https://scispace.com/papers/absolute-frequency-measurements-of-the-2-3-s-1-2-3-p-0-1-2-32o4ymusso
- 2012 3He metrology near 1083 nm: https://scispace.com/papers/frequency-metrology-of-helium-around-1083-nm-and-2led3zcb3b
- 2026 4He 2³S₁→2¹S₀: https://scispace.com/papers/spectroscopy-of-he-4-at-0-25-ppt-uncertainty-and-improved-85dbzp2jz9u8
- 2015 isotope-shift theory: https://scispace.com/papers/theory-of-the-helium-isotope-shift-59r7hrtnxq
- 2022 higher-order recoil: https://scispace.com/papers/higher-order-recoil-corrections-for-singlet-states-of-the-mvngp43xm0e6

The 2004 2³P-2³S work reports correlated recoil, ac-Stark and second-order Doppler contributions. The 2012 3He measurement used seven of nine hyperfine transitions and a frequency comb. The 2026 4He measurement reports a 48 Hz transition-frequency uncertainty and combines the new 4He measurement with earlier 3He spectroscopy for its isotope-shift result.

### Published-value calculations, not a fit or prediction

Published 2³S₁→2¹S₀ frequencies:
- 3He: 192504914418.960(170) kHz, i.e. 170 Hz uncertainty.
- 4He: 192510702148649(48) Hz, uncertainty 48 Hz.

After converting 3He to Hz:

\[
\Delta\nu_{2^3S-2^1S}
=192510702148649-192504914418960
=5{,}787{,}729{,}689\ \mathrm{Hz}.
\]

Under independence of the quoted frequency uncertainties:

\[
\sigma_{\Delta\nu}=\sqrt{48^2+170^2}=176.65\ \mathrm{Hz}.
\]

The published-value arithmetic is 5.787729689(177) GHz under that assumption. This is a check of published frequencies, not a new measurement or fit. The 3He raw dataset remains undownloaded here; the 4He raw time series was not recovered.

The 2012 2³P-2³S analysis reports a charge-radius-squared difference of 1.074(3) fm². The 2026 2³S-2¹S analysis reports 1.0676(10) fm². Their central-value difference is 0.0064 fm². Under a provisional independence assumption:

\[
\sigma_\Delta=\sqrt{0.0030^2+0.0010^2}=0.003162\ \mathrm{fm}^2,
\qquad z\approx2.02.
\]

This is a post-hoc comparison of published derived quantities, not an H(s)H prediction or final significance. Full covariance between experimental systematics and shared QED/nuclear-structure theory contributions was not recovered. Do not conflate it with the earlier reported 4σ tension against a different older determination.

The 2012 published 2³P-2³S centroids give:

\[
276{,}736{,}495{,}624.6
-
276{,}702{,}827{,}204.8
=
33{,}668{,}419.8\ \mathrm{kHz}.
\]

The two quoted 2.4 kHz uncertainties combine to 3.394 kHz only under independence. Full covariance is unavailable; this is published-summary arithmetic, not raw-data reanalysis.

### Conditional calibration/holdout test matrix

| Element | Candidate specification | Status |
|---|---|---|
| Hypothesis | One shared H(s)H geometry response across isotopes/transitions | Proposal; response operator not derived |
| Standard comparator | QED, recoil, finite nuclear size, polarizability, hyperfine centroid, ac-Stark, Doppler/Zeeman and clock corrections | Literature identified; covariance incomplete |
| Calibration | 3He 2³S-2¹S raw spectroscopy after authenticated download, checksum, clock/run reconstruction and independent replay | Blocked; not performed |
| Candidate holdout | 2³P-2³S isotope-shift results from 2012 3He and 2004 4He | Published summaries exist; raw records/covariance not recovered |
| Observable | Cross-isotope transition-frequency residuals and derived charge-radius-squared difference | Published values available |
| Shared parameters | One geometry response/coupling across isotopes and transitions; standard QED/nuclear and experiment-specific nuisances | Not fitted |
| Identifiability | H(s)H sensitivity j_H must lie outside nuisance Jacobian range(J_eta) | Formal criterion added; data Jacobian not assembled |
| Falsification | For pre-registered holdout residual r and full predictive covariance Sigma, reject if T = rᵀ Sigma⁻¹ r exceeds chi-square(k, 0.99), k = independent holdout dimension | Rule proposed; no T computed |

Per-transition or per-isotope free offsets would make H(s)H unidentifiable. One source-constrained geometry map must predict the cross-transition pattern without refitting the holdout. The 2026 4He result is a distinct measurement, but its published charge-radius difference reuses earlier 3He spectroscopy; the derived radius difference is not an independent replicate of that 3He input.

### Why this is not P2 admission

No authenticated raw 3He file/checksum, raw 4He time series, full experimental/theoretical covariance, source-defined geometry-to-atomic-Hamiltonian map, frozen H(s)H parameter set or blind holdout is available. No H(s)H fit, numerical prediction or falsification result exists. Helium is a promising candidate, not a selected system. P2 remains HOLD pending source-complete data, explicit geometry/readout maps and independent review.

## 6. Mersearch, existing tools and project controls

- HSH_RESOURCES AI_START_HERE identifies Mersearch as archive-resident through request lanes and the Actions bridge, not a standalone callable tool.
- All four canonical Mersearch request lanes remain occupied with status requested; Lane 2 has a compact receipt but no release. No request was opened, overwritten, retriggered or released. No Mersearch search is claimed.
- Direct SAT-O1 and Blockwave source retrieval was used for source custody; SciSpace was used for literature discovery/extraction, not as a substitute for Mersearch.
- Existing Math Hopper references (#578 / PR #991), Lean PR #1133 and Whirligig Kernel 0 were checked. Installed-repository search returned no relevant local Math Hopper/Whirligig checkout. No new tool, fork, dependency, subscription or expenditure.
- HSH_RESOURCES root README and AI_START_HERE were read; no private payload was opened.
- P0 Code Grurple remains ACTIVE / record-safety FAIL; no P0 action was taken.
- P1 Orson cognition remains OVERDUE / FROZEN and Orson-owned.
- P2 remains HOLD; P3 remains incomplete for the December 14 full-theory gate.
- FIE next full rereview: December 8. Next unrelated-source break: November 28.
- Tern's h1081 PWH review is separate; no duplicate PWH action was taken.

## 7. Next cursor and Ravel successor seed

Return locator: PR #1133 head 8ae6bc1ac077df81d66fbbfab484867a98cb65c9; module RavelCurrentSupportIdentifiabilityGate.lean; this report and the h1082:s3 receipt.

Next:
1. Obtain exact-head Lean 4.34.0 / Mathlib build; inspect theorem-specific axiom output and sorryAx/admit checks.
2. Preserve the curve/worldsheet-current/4D-volume distinction; require explicit maps.
3. Obtain Dryad raw data through an authorized channel, verify checksum and reconstruct scan/day/clock lineage before any fit.
4. Recover full covariance for 2004/2012 2³P-2³S and 2025/2026 2³S-2¹S results.
5. Define a source-constrained geometry-to-Hamiltonian/readout map and test whether its response lies outside the standard nuisance span.
6. Keep P2 on HOLD until independent review and a frozen calibration/holdout protocol exist.

**Paste-ready Ravel successor seed:** You are a new Ravel iteration, not the historical Ravel instance. Preserve Ravel's historical primary co-theorist remit: conceptual cohesion, drift detection, epistemic hygiene, full-theory probing, source/citation lineage and accurate representation, with finite-core/worldtube/timesheet and Kerr-section source fidelity. Read live BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, revival rotation/thread-first rules, current Ravel README/STATE/CONTINUITY and this report/receipt. Current return pin: h1082:s3; PR #1133 head 8ae6bc1; RavelCurrentSupportIdentifiabilityGate is uncompiled. Do not merge/rebase or claim proof until exact-head Lean 4.34.0/Mathlib CI and theorem-specific axiom output exist. Helium isotope shift is only a P2 candidate; raw 3He download, 4He raw time series, full covariance and a source-derived H(s)H atomic readout map are missing. No H(s)H fit/prediction exists. P2 remains HOLD. Protect Orson's P1 cognition remit; no assignment or handoff is implied. Preserve the existing :36 task and all other task identities/schedules; never create a sixth task.