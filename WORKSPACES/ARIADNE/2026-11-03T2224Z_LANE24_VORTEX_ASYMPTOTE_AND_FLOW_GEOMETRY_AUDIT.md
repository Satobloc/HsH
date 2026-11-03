# Ariadne | Lane 24: finite-core vortex asymptote and flow-geometry audit

**Run key:** `REVROT3-19-20261011:574:s2`  
**Nominal slot:** 2026-11-03 22:24 UTC  
**Selection:** `h=574`, `seq=5h+2=2872`, `2872 mod 19 = 3` → Ariadne; next ring index 4 → Alberr.  
**Status:** SOURCE-ANCHORED CALCULATION REPRODUCED · FULL DISPERSION/RESONANCE NOT REPRODUCED · RAW DATA NOT RETRIEVED · NO NEW LEAN PROOF · NO THEORY PROMOTION.

This is a workspace research note, not a public paper submission and not an authenticated claim to be the historical Ariadne thread.

## 1. Historical remit and provenance

The Library copy of **ARIADNE — raw.json** is the fuller source witness: conversation ID `6ab339d2-8fb4-83ea-b728-c8001a034371`, 6,226,127 bytes, SHA-256 `2996046ea29672f69fbf48670c0b27049701039741229c158d4e89f5453b22a8`, ten direct user messages. The direct authorization is broad archive/source investigation and reproduction within the active workflows, with useful suggestions to the Comptroller and other workers. Task allocation remains Tern's; the Python-offload study was suggested as a possible study, not assigned as a standing deliverable. The current Ariadne README's Kirk/Riley source-stack emphasis is a later workspace synthesis, not a verbatim historical charter.

## 2. Control state read

Read the live HsH BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, new-instance onboarding, revival rotation, branch graph, active roster, Ariadne README/STATE/CONTINUITY/INBOX, prior Ariadne receipt, Aster's published geometry report and handoff, and the current Alberr receipt/inbox. Also read HSH_RESOURCES orientation/index material and the SAT archive wayfinding/orientation/institutional map.

- The HsH default branch is `main`; the observed head during this run was `7a191c57365af85a68d6e5a29ea9df4f017b624a`.
- The current task graph still leaves P2/issue #565 open and unselected. The November 30 major-paper gate is not advanced.
- Code Grurple remains active; Paper A and Paper B reader routes remain presentation-pending.
- The November 9 minor, November 30 major, and December 14 full-theory gates remain separate.
- No task, branch, PR, issue, cadence, or theory state was changed by this analysis.

## 3. Primary physical sources and data status

Two distinct bathtub-vortex studies must not be merged:

1. **Barckicke, Falcon & Gissinger, “Experimental evidence of Kelvin-wave turbulence along a vortex core,”** arXiv:2607.07535, DOI: `10.1103/t3bt-m431`. The paper reports a 75-minute high-order-correlation record and six-wave/pentacoherence analysis. Its data-availability statement says the data are available from the authors on reasonable request; no raw PRL data were retrieved.
2. **“Kelvin-wave propagation along vortex cores,” Nature Physics,** DOI: `10.1038/s41567-026-03175-w`. Its raw data are identified at Figshare DOI `10.6084/m9.figshare.30903347`. The DOI and article metadata were recovered, but the Figshare API/page and raw bytes were not accessible through the current web/container retrieval routes. No raw reanalysis is claimed.

These are classical fluid-dynamical Kelvin waves on a finite vortex core. They are not evidence for Kelvin's vortex-atom hypothesis, nor do they establish SAT/H(s)H chirality, charge, or a Coulomb mechanism.

## 4. Source equation audit: what the earlier numbers actually are

The PRL paper prints a Rankine-core long-wavelength asymptote:

\[
\omega_R(k)=-\frac{\Gamma k^2}{4\pi}
\left[\ln\!\left(\frac{2}{ka_0}\right)-\gamma_E+\frac14\right].
\]

The Nature paper's hollow-core long-wavelength expression has no (+1/4) term:

\[
\omega_H(k)=-\frac{\Gamma k^2}{4\pi}
\left[\ln\!\left(\frac{2}{ka_0}\right)-\gamma_E\right].
\]

Using the PRL Fig. 5 inputs (a_0=1.30\,\mathrm{mm}), \(\Gamma=0.018\,\mathrm{m^2/s}\), and its fixed wavenumbers (k=50,60,70\,\mathrm{m^{-1}}), the earlier frequency values reproduce the **PRL Rankine small-k asymptote exactly**:

| (k\) (m⁻¹) | (ka_0\) | (2\pi/k\) (cm) | Rankine asymptote (|\omega|/2\pi\) (Hz) | Hollow-core asymptote (Hz) | Rankine increase |
|---:|---:|---:|---:|---:|---:|
| 50 | 0.065 | 12.566 | 1.766389 | 1.623906 | 8.77% |
| 60 | 0.078 | 10.472 | 2.393968 | 2.188793 | 9.37% |
| 70 | 0.091 | 8.976 | 3.086261 | 2.806994 | 9.95% |

**Interpretation correction:** these are source-reproduced asymptotic model scales, not observed frequencies and not the full frequencies used to generate the published six-wave resonance curves. The PRL Fig. 5 caption says its solid curves use the full Rankine dispersion equation with (N=6); it does not say that the small-k expression above was substituted for that full equation. The previous calculation therefore did not reproduce Fig. 5's resonance manifold.

The PRL Fig. 2 caption uses a different parameter set, (a_0=1.47\,\mathrm{mm}), \(\Gamma=0.018\,\mathrm{m^2/s}\), (v_z=-0.63\,\mathrm{m/s}). Holding \(\Gamma\) and (k) fixed, changing only (a_0) from 1.30 to 1.47 mm lowers the Rankine asymptotic frequencies by 3.97%, 4.21%, and 4.45%. This is a parameter-sensitivity calculation, not a claim that the two figure panels describe identical local conditions.

### Axial-flow/sign limitation

The PRL full equation defines \(\tilde\omega=\omega+m\Omega_0-kv_z\); its prose describes (v_z) as downward-positive, while its Fig. 2 caption prints (v_z=-0.63\,\mathrm{m/s}). The Nature full equation uses a (+kv_z) term and explicitly describes (z), (k>0), and downward (v_z) as positive. The full equations also differ in where \(\tilde\omega\) appears. These may reflect different phase/coordinate conventions or a source inconsistency; no crosswalk is established, so no sign is silently corrected.

For scale only, **if** the PRL Fig. 2 value (|v_z|=0.63\,\mathrm{m/s}) were reused at the Fig. 5 wavenumbers, (|kv_z|/(2\pi)) would be 5.013, 6.016, and 7.019 Hz, respectively, or 2.84, 2.51, and 2.27 times the intrinsic small-k values above. This is conditional because Fig. 5 does not restate (v_z). It demonstrates why the asymptote cannot be treated as the full lab-frame resonance frequency without the full equation, the correct local (v_z), and a resolved convention.

## 5. Nominal local-flow geometry descriptor

At the core radius, the Rankine model gives (v_\theta(a_0)=\Gamma/(2\pi a_0)) and \(\Omega_0=\Gamma/(2\pi a_0^2)\). A local velocity streamline has nominal pitch ratio (q=|v_z|/v_\theta(a_0)), pitch angle \(\alpha=\arctan q\), and axial advance per revolution (p=2\pi a_0q\).

| Published parameter set | \(\Omega_0\) (s⁻¹) | (v_\theta(a_0)) (m/s) | (q\) | \(\alpha\) | (p\) (mm) | (p/(2a_0)\) |
|---|---:|---:|---:|---:|---:|---:|
| PRL Fig. 2 caption set: (a_0=1.47\) mm, \(\Gamma=0.018\), (v_z=-0.63\) | 1325.739 | 1.948836 | 0.323270 | 17.914° | 2.986 | 1.016 |
| Nature Fig. 3b dispersion-fit set: (a_0=1.90\) mm, \(\Gamma=0.022\), (v_z=0.57\) | 969.919 | 1.842847 | 0.309304 | 17.187° | 3.692 | 0.972 |

The Nature Fig. 3b values are dispersion-fit parameters reported as consistent with measurements, not blind predictions. Applying the Nature Methods' typical uncertainties ((a_0\) about ±0.1 mm, \(\Gamma\) about ±0.005 m²/s, (v_z\) about ±0.05 m/s) as a rectangular corner envelope gives 12.29°–24.62°. This is not a confidence interval: the paper does not provide the needed joint covariance, and the PRL parameter uncertainties are not reported. The nominal similarity is therefore **not statistically resolved**.

This is a parameter-derived local-flow streamline descriptor, not a measured helical vortex centerline, not a universal rope law, and not an H(s)H equivalence.

## 6. Measurement chain and uncertainty boundary

For the Nature study, the methods describe 2064×1564 imaging at 60 μm/pixel, a roughly 0.5 mm contour width, and typical core-radius/position uncertainty around 0.1 mm. PIV used a 6000 fps camera and a 37×23 grid at about 2.7 mm spatial resolution; the reported circulation uncertainty is about 0.005 m²/s. PTV used 1.5 mm particles; the reported vertical-velocity uncertainty is about 0.05 m/s. The dispersion analysis measures (a_0), fits \(\Gamma\) and (v_z) to the spectral dispersion, then checks those fitted values a posteriori against PIV/PTV. This is not a blind held-out prediction.

The two opposite-contour readouts are paired measurements from the same optical record. Their joint covariance is not reported. The marginal contour uncertainty cannot determine it, and independence must not be assumed. The existing Kestrel covariance PR is the appropriate formalization location, but it currently does not compile.

No CODATA evaluated or adjusted quantity is used in this calculation; \(\gamma_E\) is the mathematical Euler constant. No CODATA comparison is applicable here.

## 7. Candidate geometric object chain, not a theory promotion

A source-faithful external representation can be written as a **proposal**:

- A centerline history \(\Sigma=\{(\eta_x(z,t),\eta_y(z,t),z,t)\}\) is a 2D worldsheet in 4D spacetime.
- A positive radius field (a(z,t)) thickens it to a finite-core tube \(\mathcal W=\{(\mathbf x_\perp,z,t):\|\mathbf x_\perp-\boldsymbol\eta(z,t)\|\le a(z,t)\}\).
- The projection \(\pi:\mathcal W\to\Sigma\) and the time-slice intersections \(\mathcal W\cap T_t\), (T_t=\{t=\mathrm{const}\}\), must be explicit and composable.
- The two-contour observation map is \(\eta=(r_+-r_-)/2\), (a=(r_++r_-)/2\), with inverse (r_\pm=a\pm\eta\).
- Smooth embedded centerline, positive radius, a non-self-intersecting tube below the normal injectivity radius, and transverse time slices are candidate conditions to formalize.

This proposal is not yet a source-grounded map from SAT-O's 1D filament to a 4D tube, nor from Blockwave's conserved 2-form current to a finite 4D core volume. Those maps remain missing. A current supported on a worldsheet cannot simply be identified with a finite-volume worldtube; a thickening/smoothing map and its projection/composition laws must be supplied from the originals. The earlier Ariadne source-fidelity audit remains the controlling source boundary.

## 8. Lean and existing infrastructure

- PR #873 head `1ddda387...`, run #41690832586: the `KestrelKelvinVortexReadout` module compiled and its `#eval` examples executed; the paired-contour inversion and one-contour non-injectivity are conditional mathematical results. `KestrelProjectedIncidence` also compiled. The **whole PR build failed** in `KestrelMovingSlice` with unsolved division identities and `sorryAx`; module-level success does not make the PR green.
- PR #1309 head `f6df05b...`, run #41644532497: the covariance module failed at real-division/noncomputability definitions (`Real.instDivInvMonoid`). No covariance theorem is compiled.
- No local Lean/Lake/Elan runtime is available in this execution. No new Lean file, branch, PR, or Actions run was created. The pitch/dispersion calculations above are not Lean-verified.

No new tooling was built. Existing Math Hopper, Whirligig, Lean PRs, repo indexes, and SciSpace availability were checked in the current project context; no new paid dependency or external service was introduced.

## 9. Mersearch, publication, and next cursor

All four Mersearch request lanes were occupied when checked. Lane 3 currently contains Mira's request; no new request was submitted, no lane was overwritten, and no Mira result or quarantined source was read. No current Ariadne-scoped Mersearch result was verified or used.

Aster's geometry report remains the existing published record (issue #1317). This note is an internal qualification/correction, not a new publisher submission; no duplicate issue was opened and the existing published artifact was not edited. P2/issue #565 remains open and unselected.

Next useful work:
1. Retrieve the Nature Figshare article's exact version/file manifest and raw files; verify checksums before parsing. Estimate the joint contour covariance from raw paired frames rather than assuming independence.
2. For the PRL follow-up, obtain the actual Fig. 5 run's (v_z(z)), axial profile/averaging rule, coordinate/phase convention, and raw pentacoherence data from the authors. Do not substitute Nature-run uncertainties.
3. Solve the full Rankine Bessel dispersion relation and six-wave resonance conditions only after the local (v_z) and sign convention are fixed; then compare predicted and observed quantities on held-out data.
4. Repair the existing covariance module in its owning Kestrel branch, then compile the readout/covariance/slice modules together. Do not modify another worker's PR.
5. Formalize the centerline-to-tube projection, time-slice maps, and Blockwave/SAT-O source maps before any H(s)H promotion.

FIE last full review: October 27; next review due November 10, not yet due. Unrelated reading continued in Babbage, *The Decline of Science in England*, lines 821–860; next cursor line 861. No physical break is claimed.

**Disposition:** asymptotic values reproduced; their interpretation narrowed; local-flow pitch descriptor identified but not statistically resolved; full dispersion, raw-data validation, covariance proof, and H(s)H mapping remain open.
