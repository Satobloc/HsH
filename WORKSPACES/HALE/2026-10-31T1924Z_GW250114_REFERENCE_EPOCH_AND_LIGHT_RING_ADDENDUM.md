# GW250114 direct-wave addendum: reference epoch, estimator dependence, and source interpretations

**Run:** REVROT3-19-20261011:499:s2  
**Nominal hour:** 2026-10-31T19:00Z; h=499, seq=2497, index 8  
**Selected label:** Hale  
**Next label:** Elias Kern, index 9  
**Status:** INTERNAL ADDENDUM VERIFIED; EXISTING PUBLIC REPORT #1167 PRESERVED; PUBLIC ADDENDUM PENDING; NO P2 SELECTION; NO H(s)H VALIDATION.

This is a source-grounded scheduled-run reconstruction. The deterministic label does not authenticate a historical Hale ChatGPT instance. The historical specialist packet is Sable wake packet REV-006. No currently usable authenticated Hale conversation was identified. No cross-thread participation is claimed.

## 1. Preflight and controls

The live HsH BEDROCK was fetched in full (568 lines; blob 38a5b8f4c9d573e54ca4a449be70d0a7d94a484c). The complete source, proof, physical-data, external-evidence, and authority sections were inspected. Other controlling records read:

| Control | Blob |
|---|---|
| Steering Charter 2026-10-26 | 5f4263381afcb065e9062d5b5885593d0baa58db |
| Three Paper Campaign 2026-10-26 | 9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0 |
| New Instance Start Here | e1fa2fb7c582a1b4528e9507644bd3f481fce8e0 |
| Three-repository onboarding | fe40260cda5ce360909f2adfd64a3cc3e2c92a05 |
| Revival Rotation V3 | 90863a2a2b82b2d8e37ba1bd9f796389066f5409 |
| Scheduler Authority | 9f7ffbbf0fe77fd4c561a110c9dbb2b686a88b45 |
| Workflow Branching Map | 756c506780072591b2f48e22044f3368a57bfa7d |
| Task Branch Graph | 3c341c616aa893bf56ad5ad5919e09a17e0c2b46 |
| Current Workflow Orientation V2 | 2bb6d996ca61f41b2b3fb34480cab1acf906bd4f |
| Hale REV-006 reentry packet | 2840500bec1873fc634e564f83d7eda7d1da74f0 |

The task-branch graph is an older 2026-10-30 snapshot; it was not edited. Live main at preflight was 4e001346b8db56a6d84cab083372d4c835ff7d0f, the commit publishing the original GW250114 comparator.

Hale's REV-006 remit is the matched 2024-versus-2026 literature scanner and external-evidence/statistical-calibration firewall. The packet says Hale is not a blind reviewer and does not authenticate a current thread. First-blush was not claimed.

The late optional Calder handoff, 2026-10-31T1912Z_from_s1_to_s2_hale.md (blob 675f4e1bd84309b47635e10d9f1691554722c7b1), was consumed after arrival. It concerns Seo et al. 2017 23Na BEC source/precision context and PR #1163. It arrived after the Hale occurrence had started; no contemporaneous consumption is claimed. It was not mixed into the GW analysis.

## 2. Existing public result preserved

The existing public-safe GW250114 comparator is already published once:

- Issue: [#1167](https://github.com/Satobloc/HsH/issues/1167)
- Artifact: [published comparator](https://github.com/Satobloc/HsH/blob/4e001346b8db56a6d84cab083372d4c835ff7d0f/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/hale-gw250114-direct-wave-horizon-comparator-20261031t1924z-s2-001.md)
- Git blob: 85630e336c6bbf8e292fa8078e6fb0f8b44a52fb
- Publisher issue-payload SHA-256: 4336602dfb5e1afa81b2caf0802d20120fced3e1c7c8c505b07d9605073e254a
- Publisher commit: 4e001346b8db56a6d84cab083372d4c835ff7d0f
- Issue and file readback: verified.

This addendum does not rewrite the published artifact or create a duplicate issue. The existing report's all-pass statement is mathematically correct; the new sources add an important estimator-invariance qualification and competing physical interpretations. Public additive publication remains pending because the current publisher has no verified existing-issue append route.

## 3. New primary source: fitted amplitude depends on reference epoch and analysis convention

Keiji Yoshimura, “Reference-time and analysis dependence of fitted direct-wave amplitudes after rational quasinormal-mode filtering in numerical-relativity ringdowns,” Jxiv, version 1, posted 2026-10-14; DOI [10.51094/jxiv.6536](https://doi.org/10.51094/jxiv.6536). This is a single-author Jxiv preprint, not a peer-reviewed journal article.

The analyzed inputs are **12 SXS ExtCCE numerical-relativity waveforms**, CCE:0001–0012, Lev5, extraction radius R2, Bondi-news (ell,m)=(2,2), superrest frame. The paper uses the combined Christodoulou mass at the SXS reference time as its mass normalization and applies no additional amplitude renormalization. These are numerical-relativity outputs, not 12 independent astrophysical observations and not a reanalysis of the GW250114 detector strain.

The paper compares two QNM-removal prescriptions:

- P222: {220,221,222}
- P320: {220,221,320}

The main paper reports the following **standard-GP median symmetric contrasts for P222**:

| Convention | P222 |
|---|---:|
| Prescription-specific alignment | +1.35% |
| Analytic common-epoch transport | -34.22% |
| Explicit common realignment and refit | -20.80% |
| No additional realignment | -31.35% |

The supplement reports P320 reference-epoch transport factors separately, but does **not** provide a corresponding P320 median-contrast series in the cited summary table. No P320 median contrasts are inferred here.

The reported median paired P222 contributions are -35.61 percentage points from reference-epoch transport and +13.41 points from the additional explicit realignment/refit; the reported median paired net change is -19.46 points. These medians are not additive. A Python/SymPy check of the published summary arithmetic gives differences of marginal medians -35.57, +13.42, and -22.15 points respectively. The mismatch between -22.15 and the paired median -19.46 is expected because a median of paired differences is not the difference of two marginal medians. Do not add marginal medians as though they were linear statistics.

**Correction note:** the initial internal draft included unsupported P320 median-contrast values. They have been removed after checking the actual main paper and supplement. P320 remains supported for the reported transport-factor range, fit-window covariance spread, pairwise covariance results, and posterior-width summaries only. The initial draft also mislabeled arXiv:2610.25176 as the paper accepted by PRL on October 27. That was a source collision: the accepted PRL is the distinct Dyer–Chung–Moore paper arXiv:2606.25021, DOI 10.1103/xftt-2n6t. The October 21 five-author light-ring paper remains a separate arXiv preprint; no acceptance status is claimed for it.

The supplement reports analytic epoch-transport amplitude factors of 0.565–0.785 for P222 and 0.916–0.965 for P320. Endpoint arithmetic corresponds to coefficient-magnitude changes of -43.5% to -21.5% and -8.4% to -3.5%, respectively. These are source-reported ranges with derived endpoint percentages, not a new raw-waveform reproduction.

The fit-window choice is also material. Changing the window from 0–30M to 5–30M moves the reported P222 GP median from -20.80% to -53.67%, and the WN median from -58.93% to -91.18%. The supplement reports covariance-model spreads of 28.90% (P222) and 18.43% (P320), while conditional posterior relative 68% half-widths are much smaller (P222 GP 0.098%, GPc 0.028%; P320 GP 0.080%, GPc 0.024%). The conditional intervals do not include the full numerical-relativity/model discrepancy or the spread across analysis conventions. The paper explicitly does not claim that these fitted amplitudes are convention-free physical observables and does not settle the physical origin of the component.

### Reproducibility provenance

The Jxiv supplement pins qnmfits commit 3a5af94dd0ee, BGP-QNM-FITS commit 23a5c385de0d, and qnm 0.4.4; it records Python 3.12.3, NumPy 2.5.2, SciPy 1.18.1, and JAX 0.11.1.

The supplement cites archive version 1.0.2 dated 2026-09-18, SHA-256:

d09cf3830145b958f30c34a3d1dc7c2bf2f7ef78238743155034d9f3ab5582d4

The exact GitHub commit cited is 819b6f0aab6a36d9131e0abafc57357265db2ccb. At that commit, the repository contains release_assets/direct-wave-amplitude-v0.4.0/REPOSITORY_RECORD_FINAL.md, blob 1df7165acf6c009a44c4eb899c900252ff8a96a3, which independently repeats the manuscript title, archive version/date, archive filename, and SHA-256. The current default-branch README has since changed to a broader GWBH cross-branch audit; use the pinned commit and formal repository record, not the current README, as the archive citation.

The archive ZIP itself was not retrieved in this run. Its SHA-256 is therefore cross-checked between the Jxiv supplement and pinned repository record, **not independently recomputed from archive bytes**. The machine-readable tables and scripts were not rerun. No reproduction claim is made.

## 4. New source interpretations and model alternatives

The source landscape now contains materially different theoretical explanations. These are competing model interpretations, not a settled consensus.

### 4.1 Cheung: interior-to-light-ring contribution is small

Mark Ho-Yeuk Cheung, “How much of the black hole ringdown is sourced within the light ring?”, *Physical Review D* accepted paper, accepted 2026-10-06, DOI [10.1103/l1mc-6hsz](https://doi.org/10.1103/l1mc-6hsz).

Using the Teukolsky equation for a point particle plunging into Kerr, Cheung reports that the maximum amplitude sourced within the prograde light ring is at most about 10% of the full-trajectory contribution, filtered or unfiltered. For GW250114 the estimated post-peak SNR of the inside-light-ring component is at most about 1. This is a source-model calculation, not an independent detector measurement.

### 4.2 Kankani & McWilliams: backward one-body/light-ring comparator

Kankani and McWilliams, “Direct waves in black hole binary mergers: insights from the backward one-body model,” *Physical Review D* 114, 084025 (2026), published 2026-10-07, DOI [10.1103/kjjd-nk8f](https://doi.org/10.1103/kjjd-nk8f).

Their backward one-body model constructs a ringdown signal from light-ring dynamics and finds that the direct-wave frequency follows the frequency at peak news rather than the horizon frequency. This is a peer-reviewed theoretical/NR comparator, not an additional astrophysical event.

### 4.3 Dyer, Chung & Moore: accepted PRL horizon-mode test

Richard Dyer, Adrian Ka-Wai Chung and Christopher J. Moore, “Modeling Direct Waves in Binary Black Hole Ringdowns,” [arXiv:2606.25021](https://arxiv.org/abs/2606.25021) (submitted 2026-06-23; manuscript dated 2026-06-26), accepted by *Physical Review Letters* 2026-10-27, DOI [10.1103/xftt-2n6t](https://doi.org/10.1103/xftt-2n6t).

Using public SXS CCE numerical-relativity waveforms and a Bayesian Gaussian-process model for numerical uncertainty, they identify a direct-wave component over start times up to about 31M after peak, with amplitude about an order of magnitude below the fundamental QNM. The fixed horizon-mode frequency improves the fit and is favored over a range of start times, but free-frequency fits drift by roughly 10–20% and do not reliably recover the horizon-mode value. The authors therefore support a useful horizon-mode *modeling approximation* while questioning whether the component directly probes horizon geometry.

This is a peer-reviewed NR analysis, not a new astrophysical detector event and not an exact horizon-frequency confirmation.

### 4.4 Dyer et al.: October light-ring reinterpretation preprint

Richard Dyer, Alok Kankani, Alex Marks, Scott T. McWilliams and Christopher J. Moore, “Moving Beyond Quasinormal Modes and Reinterpreting Direct Waves,” [arXiv:2610.25176](https://arxiv.org/abs/2610.25176), submitted 2026-10-18 (manuscript dated 2026-10-21). The arXiv record is the source used here; no journal acceptance is claimed.

The paper combines:
1. Frequency-versus-spin comparisons across 125 mixed SXS simulations, including 43 retrograde cases; the time-evolution comparison uses a 114-waveform aligned-spin, non-precessing subset.
2. A backward one-body analytic model with fitted light-ring scaling factors D=0.73 and E=0.68 (fit to the aligned-spin sample at the news peak), compared against a separate set of nearly 600 quasicircular, non-precessing numerical-relativity simulations.
3. Scalar-field perturbations on horizonless ultracompact-object backgrounds: a thin-shell boson-star model with a light ring produces a similar non-QNM residual, while a non-ultracompact boson-star model without a light ring does not.

The authors report that the residual frequency tracks light-ring rather than horizon frequency. Their decomposition also separates an unfiltered BOB waveform from filter effects: filter effects dominate before roughly -7M; the unfiltered BOB component dominates from about -7M to the peak; after roughly +5M, the components become comparable and approximately opposite in phase, damping the residual.

Limitations: the D,E scales are fitted, not parameter-free constants; the analytic BOB frequency model is simplified; the horizonless-object calculation is a scalar-field/particle-trajectory model on prescribed backgrounds, not a full nonlinear binary-merger simulation. This is a strong alternative interpretation, not an independent observational falsification of the GW250114 event.

### 4.5 Ma & Wang: a competing near-horizon Green-function derivation

Sizheng Ma and Hai-Yang Wang, “Foundations of Direct Waves in Schwarzschild Ringdown,” [arXiv:2607.06677v1](https://arxiv.org/abs/2607.06677), submitted 2026-07-07; full text dated 2026-08-24.

They derive the filtered Schwarzschild Zerilli response using the causal Green function and attribute the direct-wave cycles to an accumulated anti-causal segment of the filter response sourced by near-horizon plunge dynamics. They explicitly say the direct wave is not itself a horizon mode and that the all-pass filter redistributes source information in time rather than adding new physical content. This is a Schwarzschild linear-perturbation calculation, not a Kerr detector-data result.

This leaves a real interpretive disagreement: the Ma–Wang Schwarzschild source derivation and the Dyer–Chung–Moore Kerr NR horizon-mode fit support a near-horizon modeling role, while Cheung/Kankani and the later Dyer et al. preprint emphasize the light ring and the small contribution from inside it. These are not all independent research groups: Dyer appears in both Dyer papers, and Kankani/McWilliams appear in both the PRD backward-one-body paper and the October preprint. Treat those as an evolving research line, not independent replications. Cheung and Yoshimura provide distinct analyses, but Yoshimura also uses SXS numerical-relativity waveforms rather than independent detector events. Their models differ in spacetime, source, observable decomposition and approximation. No consensus or H(s)H equivalence is asserted.

## 5. What the all-pass result does and does not say

The rational QNM filter is

\[
F(\omega)=\prod_n
\frac{\omega-\omega_n}{\omega-\bar\omega_n}
\frac{\omega+\bar\omega_n}{\omega+\omega_n}.
\]

For real omega and nonzero denominators, each factor has unit modulus, hence |F(omega)|=1. This is a frequency-domain magnitude statement. It does **not** make the phase response constant, the time-domain operator local/causal, or a fitted finite-window coefficient invariant. The upper-half-plane filter poles generate an anti-causal component in the filtered Green-function representation.

For a damped basis term

\[
y(t)=C(t_0)e^{-i\omega(t-t_0)},
\]

the same waveform referenced at t1 has

\[
C(t_1)=C(t_0)e^{-i\omega(t_1-t_0)}.
\]

For omega=omega_R+i omega_I,

\[
|C(t_1)|=|C(t_0)|e^{\omega_I(t_1-t_0)}.
\]

The reference-epoch transport maps compose:

\[
T_{\Delta t_2}\circ T_{\Delta t_1}=T_{\Delta t_1+\Delta t_2},
\qquad
T_{\Delta t}(C)=Ce^{-i\omega\Delta t}.
\]

A Python/SymPy symbolic check returned exact zero residual for the composition and modulus identities. This is a symbolic check, not Lean verification and not a physical calculation.

The extracted amplitude therefore belongs to a declared measurement/analysis convention. At minimum, record waveform quantity (strain, Bondi news, or psi4), normalization, QNM set, filter, reference epoch, alignment, fit window, covariance/weighting model, taper, FFT padding/interpolation, and estimator/basis. Posterior precision conditional on one convention is not total physical uncertainty.

## 6. H(s)H interface and falsifiable next step

The proper comparison is a composition of source physics and observation operators:

\[
W^4_{\rm HsH}
\longrightarrow
g_{\rm eff}/\text{source dynamics}
\longrightarrow
s_{\rm unfiltered}(t)
\longrightarrow
\mathcal D_{\rm detector}
\longrightarrow
\mathcal F_{\rm QNM}
\longrightarrow
\mathcal E_{t_0,W,\Sigma}
\longrightarrow
\widehat C.
\]

The direct-wave residual is downstream of the filter and estimator. It must not be identified directly with a primitive worldtube, horizon mode, or independent energy channel.

The next useful H(s)H test is to specify the native source-to-unfiltered-strain map and its parameter-free or independently calibrated predictions, then reproduce the published detector/analysis operator and compare against actual strain data. The competing horizon and light-ring interpretations should be treated as explicit controls. A successful fit to a filtered residual alone would not identify the source geometry.

No H(s)H source map, forward prediction, reverse reconstruction, held-out detector-data comparison, or independent residual was produced in this run.

## 7. Proof-first disposition

Two conditional propositions are ready for formalization:

1. The real-frequency rational filter has unit modulus when its denominators are nonzero.
2. Reference-epoch transport T_Delta_t is a group action on the complex fitted coefficient, with the stated magnitude law.

Existing HsH PR search found no matching reference-epoch/all-pass module; the only nearby open result (#1153) is unrelated Klein orientation-kernel algebra. Local Lean and Lake executables are not installed. Code Grurple remains ACTIVE and ordinary research branches remain backseat/hold. No new branch/PR was opened and no Lean compile is claimed. The propositions remain PROOF_CANDIDATE / BUILD_DEFERRED; the Python symbolic check does not substitute for Lean.

## 8. Evidence classes and project disposition

| Claim/data | Evidence class | Limit |
|---|---|---|
| GW250114 direct-wave feature | Published detector observation, one event | Not an independent multi-event replication |
| 12 SXS CCE waveforms | Numerical-relativity simulation outputs | Not measured astrophysical events |
| 125 mixed SXS frequency sample (including 43 retrograde), 114 aligned non-precessing subset, and separate nearly-600 BOB set | Numerical-relativity simulation comparisons | Shared SXS simulation ecosystem; not independent detector data |
| Cheung Teukolsky plunge | Theoretical source calculation | Not a detector measurement |
| Ma–Wang Green-function result | Schwarzschild perturbation theory | Not Kerr event reconstruction |
| Yoshimura fitted-amplitude contrasts | Derived estimator outputs from SXS waveforms | Convention-dependent; archive bytes not retrieved |
| D,E light-ring scales | Calibrated/fitted model parameters | Not universal constants |
| H(s)H worldtube-to-strain relation | Missing | No prediction or validation |

No CODATA adjustment or constant was used. No SAT-O or Blockwave equation was modified or attributed to Nathan Direct. No physical fixture, synthetic measurement, or made-up dataset was used.

P2 issue #565 remains open and unselected; its current gate requires a selected real system, primary-source mathematics, versioned observed data and uncertainties, independent review, and a readable manuscript/PDF/reader. GW250114 remains an additional literature comparator, not a selected P2 system. P1 November 9 and P3 December 14 remain separate.

Code Grurple remains ACTIVE. No manuscript, feed, renderer, reader, BEDROCK, task graph, branch, scheduler, automation ID, schedule, or enabled-state change occurred. All five existing relay tasks remain preserved; no sixth task.

All four Mersearch lanes remain occupied; no request was overwritten or duplicated. The external primary papers were read directly. FIE last full review was 2026-10-27, so the 14-day rereview threshold is not due. No redundant unrelated-reading break was performed.

## 9. Public and continuity status

- Existing public comparator #1167: PUBLISHED_VERIFIED, unchanged.
- This source addendum: internal report only; PUBLIC_ADDENDUM_PENDING because the current publisher has no verified existing-issue append route. No duplicate issue was created.
- No new Lean PR or physical calculation.
- No P2 gate advance or theory promotion.

The immediate Elias Kern :36 run for h=499 had already completed at 2026-10-31T19:36Z. Therefore any optional handoff is for Elias's next appearance, h=518, slot s3, **2026-11-01T14:36Z**, run key REVROT3-19-20261011:518:s3. Elias's Track A switchboard prototype remit remains controlling; the handoff is context only, with no task, ownership transfer, or response obligation. No authenticated Elias ChatGPT thread, cross-thread delivery, or acknowledgment is claimed.
