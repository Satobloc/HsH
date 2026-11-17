# Mercer h907:s3 — Phase-sensitive two-contour readout

**Run key:** `REVROT3-19-20261011:907:s3`  
**Selection:** \(h=907\), \(seq=5h+3=4538\), \(4538\bmod19=16\). Selected ring label: **Mercer** (index 16); next: **Ravel** (index 17). Ring selection is not authentication of a historical instance or ChatGPT thread.

**Disposition:** A new frequency-resolved observable was specified from an existing measured-system readout; a draft Lean extension and exact-head CI improvement were prepared. **LEAN_NOT_VERIFIED. No physical calculation, fit, H(s)H prediction, or independent measurement.**

## 1. Scope and authority

This is a one-run Lane Charter 36 architecture/prediction overlay. It does not reassign Mercer's standing role. Mercer's current Code Grurple assignment remains Paper A/B presentation QA only; no manuscript content, protected source, live route, or deployment control was touched.

Historical Mercer authority was recovered from the conversation export *Quantum Gravity and Experiments*, direct-user message `bb8ecf64-8863-4ee7-a078-ca8cc4104974`, timestamp 2026-10-01T20:56:07.264Z. It describes quantitative physics, dimensional analysis, constitutive physics, coarse-graining, forces, and quantitative consequences. This is a historical direct-user instruction, not a separately signed specialist charter and not proof of a current Mercer thread.

## 2. Source chain and provenance boundary

### Measured system

Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* 22 (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w). The paper defines opposed contour samples \(r_0=r(z,t,\theta=0)\) and \(r_\pi=r(z,t,\theta=\pi)\), then derives centerline displacement and core radius. It reports distinct azimuthal mode behavior: the \(m=1\) mode displaces the vortex axis without radius variation, while \(m=2\) deforms the core without the same axis displacement. Its data deposit is [Figshare DOI 10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347).

The Figshare DOI is public, but the dataset file inventory and raw bytes were **not** retrieved here. It is therefore not established that the deposit contains synchronized raw \(r_0,r_\pi\) time series rather than only derived spectra or selected observables. No sample-level analysis is claimed.

### Related follow-up, not independent replication

Barckicke, Falcon & Gissinger, “Experimental Evidence of Kelvin-Wave Turbulence along a Vortex Core,” *Physical Review Letters* (published 2026-09-21), DOI [10.1103/t3bt-m431](https://doi.org/10.1103/t3bt-m431); preprint [arXiv:2607.07535](https://arxiv.org/abs/2607.07535). The follow-up analyzes high-order statistics of the displacement channel \(\eta\), including a six-wave pentacoherence averaged over a 75-minute acquisition. Its data-availability statement directs readers to the authors on reasonable request; no request was sent. It does not provide a public independent holdout for the two-channel \((\eta,a)\) readout. The two papers are from the same research group and related experimental program, not independent-laboratory replication.

### Historical H(s)H source distinction

The SAT archive extract `SRENA SAT2.txt`, blob `fe01fc85b1874c1573843724f035ee292fd48961`, lines 923–925, labels Nathan's source passage as: two worldlines approach, curve away, and never touch. The immediately following assistant passage, lines 928–947, adds a Kelvin/vortex, pressure/suction, and chirality-to-charge mechanism. Those additions are **assistant reconstruction/proposal**, not part of the direct source statement. The archived speaker label is visible; the original raw message UUID was not independently recovered in this run.

The direct passage is a kinematic target, not a constitutive force law. It does not, by itself, require finite-core thickening, an independent twist field, a vortex-pressure mechanism, or a contact surface.

## 3. New observable: complex cross-spectrum of displacement and core radius

The source-defined two-channel readout is

\[
\begin{pmatrix}\eta\\a\end{pmatrix}
=
A\begin{pmatrix}r_0\\r_\pi\end{pmatrix},
\qquad
A=\frac12\begin{pmatrix}1&-1\\1&1\end{pmatrix},
\]

with \(\eta=(r_0-r_\pi)/2\) and \(a=(r_0+r_\pi)/2\).

For the complex frequency-resolved spectral-density matrix of the raw contour channels,

\[
S_r(k,\omega)=
\begin{pmatrix}
S_{00}&S_{0\pi}\\
S_{\pi0}&S_{\pi\pi}
\end{pmatrix},
\]

the derived matrix is

\[
S_y(k,\omega)=A\,S_r(k,\omega)\,A^\dagger.
\]

Its off-diagonal displacement/radius cross-spectrum is

\[
\boxed{
S_{\eta a}
=\frac14\left(S_{00}+S_{0\pi}-S_{\pi0}-S_{\pi\pi}\right).
}
\]

This retains directed, complex cross-spectral information. Under a Hermitian raw spectral matrix and equal raw auto-spectra, \(S_{\pi0}=S_{0\pi}^{*}\) and \(S_{00}=S_{\pi\pi}\), so

\[
S_{\eta a}=\frac14(S_{0\pi}-S_{0\pi}^{*})
=\frac{i}{2}\operatorname{Im}S_{0\pi}.
\]

Thus equal marginal spectra do **not** force the derived cross-spectrum to vanish: a quadrature/phase-lag component can remain. The existing real zero-lag covariance result, \(\operatorname{Cov}(\eta,a)=(v_0-v_\pi)/4\) under its stated symmetric-covariance assumptions, does not contain this full frequency-resolved phase information.

This is the substantive architecture improvement: retain the complete \(2\times2\) complex spectral matrix rather than only separate power spectra or zero-lag covariance. A nonzero \(S_{\eta a}\) is not, by itself, H(s)H evidence; standard fluid dynamics, forcing, contour extraction, and instrument asymmetry can also generate cross-channel structure.

## 4. Geometry hierarchy: what is and is not forced

| Feature | Source-supported status in this experiment | H(s)H implication |
|---|---|---|
| Finite physical vortex-core radius \(a\) | Measured/model parameter in the standard finite-core description | A 3D finite core is present. Its time history can be represented as a worldtube, but this does not establish an additional fourth-direction thickness. |
| Centerline bending/helical Kelvin mode | Observed through the \(m=1\) displacement channel | A curved/helical centerline is source-supported; it is not automatically an independent internal worldtube twist field. |
| Core deformation/radius mode | The \(m=2\) channel deforms the core | A radius/deformation channel is distinct from centerline displacement. The experiment does not by itself determine a 4D twist variable. |
| Core boundary | Physical air–water interface in the measured vortex | This ordinary material boundary is present; an additional inter-worldtube contact surface is not required or measured. |
| 4D worldtube-to-camera map | Not supplied by the paper | Requires an explicit cross-sectional frame/profile, time slicing, projection, and instrument/readout composition. |

A finite-core worldtube construction is an optional representation of the measured 3D core's history until a source-authorized embedding and readout map are supplied. A distinct twist degree of freedom and inter-worldtube contact surface are not forced by these measurements. The historical two-worldline “without touching” statement concerns centerline nonintersection; it is not a finite-core non-overlap theorem.

The required composition, if a worldtube model is later proposed, is:

1. \(W\cap\Sigma_t\to C_t\): choose a spacelike foliation and the induced spatial metric.
2. \(C_t\to r(z,t,\theta)\): specify the cross-sectional profile, frame, camera projection, and calibrated contour extractor.
3. \(r\to(r_0,r_\pi)\): specify the angular registration and the two antipodal samples.
4. \((r_0,r_\pi)\to(\eta,a)\): apply the source-defined linear map \(A\).
5. \((\eta,a)\to S_y(k,\omega)\): specify sampling, windowing, stationarity/block assumptions, and the spectral estimator.

The two-point readout is a coarse-graining of the full contour. It discards other angular modes and cannot, by itself, reconstruct a full cross-section or an independent twist field. If finite-core noncontact is claimed, it must be checked on each chosen spacelike slice: for core supports bounded by radii \(a_1(t),a_2(t)\) around centers \(x_1(t),x_2(t)\), a sufficient condition is
\[
d_{h_t}(x_1(t),x_2(t))>a_1(t)+a_2(t).
\]
With certified deterministic measurement-error bounds, the conservative condition becomes
\[
\hat d-\delta x_1-\delta x_2>\hat a_1+\delta a_1+\hat a_2+\delta a_2.
\]
These are proposed admission conditions, not evaluated measurements or a new Lean theorem. Standard deviations cannot simply be substituted for deterministic bounds without a declared joint uncertainty model.

## 5. Test matrix and failure conditions

| Item | Standard comparator \(H_0\) | Candidate \(H_1\): H(s)H |
|---|---|---|
| Model | Source's Rankine/Kelvin finite-core description with measured \(a_0\), circulation \(\Gamma\), axial flow \(v_z\), and instrument response | Must supply a source-authorized worldtube/constitutive map and predict the same readout; currently not instantiated |
| Shared parameters | \(a_0,\Gamma,v_z\), forcing condition, camera calibration, contour extraction, background-flow/PIV/PTV calibration | Same shared parameters; any added geometric parameter must be independently identifiable |
| Calibration | One declared forcing condition/acquisition block plus independent background-flow calibration | Same calibration data and frozen shared parameters |
| Holdout | Separate acquisition block or forcing level; preferably an orthogonal view/instrument | Same untouched holdout; no frame-level leakage from calibration |
| Observable | Full complex \(S_y(k,\omega)\), including \(S_{\eta a}\), phase, and coherence | A preregistered distinct residual in the same matrix, not merely a relabeling of \(H_0\) |
| Falsification | Standard model's covariance-aware predictive region | Reject this \(H_1\) if its frozen-parameter holdout prediction falls outside the preregistered predictive region, or if its added parameter is non-identifiable/no predictive gain |

No numerical threshold is justified without the raw time series, joint contour covariance, instrument calibration, effective sample size, and a declared holdout. A block-based uncertainty estimate and phase-preserving surrogate/null analysis are needed for the cross-spectrum; adjacent frames or spatial bins are not independent holdouts.

The missing composition chain is:

\[
\text{worldtube/core state}
\longrightarrow
r(z,t,\theta)
\longrightarrow
(r_0,r_\pi)
\longrightarrow
(\eta,a)
\longrightarrow
S_y(k,\omega).
\]

Only the last two readout transformations are specified here. The first worldtube-to-observed-contour map remains absent.

## 6. Formalization status

Draft [PR #1918](https://github.com/Satobloc/HsH/pull/1918), stacked on [PR #1309](https://github.com/Satobloc/HsH/pull/1309), adds `MercerVortexCrossSpectralReadout.lean` with the complex matrix transformation and the conditional pure-imaginary cross-spectrum statement. It also adds `noncomputable section` to the real covariance module after the earlier PR #1309 build failed at `Real.instDivInvMonoid`-dependent definitions.

**LEAN_NOT_VERIFIED.** No Actions run was created for PR #1918: the current default `main` does not contain `.github/workflows/lean-verification.yml`; that workflow exists only on the stacked infrastructure branch. The earlier PR #1309 run #41644532497 failed at the real-division definitions. PR #1918 adds the source correction and an exact-PR-head checkout assertion, but neither the new theorem nor that assertion has been executed. No local Lean/Lake/Elan executable is installed. The generated Lake dependency manifest is not committed. The draft PR is not merged or reviewed.

A private SymPy matrix multiplication check agreed with the displayed algebraic formula. This is an algebra sanity check, **not** Lean verification, physical validation, or a proof of the source-to-model translation.

## 7. Figure and hostile fidelity review

[Source-defined two-contour readout schematic](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERCER/FIGURE_H907_S3_TWO_CONTOUR_SPECTRAL_READOUT.svg).

The figure shows only the two-point cross-sectional readout and its linear/spectral transformation. It does not show measured data, the full contour, a 3D reconstructed core, a 4D worldtube, twist, or contact surfaces. Its coordinate orientation follows the paper's \(\theta=0,\pi\) definitions. It is a measurement-map schematic, not a physical reconstruction.

## 8. Controls and disposition

- P0 Code Grurple remains ACTIVE; Mercer's current P0 assignment remains Paper A/B presentation QA only. No manuscript or route work was done.
- P1 Orson cognition remains OVERDUE / NOT READY and Orson-owned.
- P2 measured geometry remains HOLD; no system admission or physical result.
- P3 full theory remains INCOMPLETE.
- FIE was last reviewed November 10; next review November 24.
- November 9 minor-paper gate remains overdue; November 30 major and December 14 full-theory gates remain separate. No gate advanced.
- All four Mersearch request lanes remain occupied/requested; no callable Mersearch action was available. No request was overwritten, released, retriggered, or retried. Direct GitHub search was bounded fallback, not Mersearch.
- HSH_RESOURCES was limited to its root README; no private payload/index was accessed. SAT archive and HsH source repositories were used within their documented boundaries.
- PWH remains unchanged: WH-05 is highest overall but blocked pending Tern's controlled lane release; WH-02 is highest unblocked and Calder-owned; WH-01 remains Tern-owned. No takeover or task-graph mutation.
- Unrelated reading completed in `fun break - lx.txt`, lines 1761–1800; next cursor 1801.
- No SAT-O or Blockwave equation was changed. No BEDROCK theory promotion, new tool, subscription, expenditure, or automation mutation.

**Bottom line:** the new cross-spectrum is a candidate measurement channel that can retain phase information lost by marginal spectra and zero-lag covariance. It improves the observable/test architecture, but it is not yet a numerical H(s)H prediction. The missing worldtube-to-contour map and the absent raw-data/covariance package remain decisive blockers.
