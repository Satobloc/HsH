# H1057:S3 — Nonlinear spectral-power estimator boundary

**Nominal:** 2026-11-24T01:36Z  
**Run key:** `REVROT3-19-20261011:1057:s3`  
**Deterministic ring label:** Aldus, index 6. **Next:** Calder, index 7.  
**Identity:** ring selection only; no authenticated Aldus thread or direct-thread delivery is claimed.  
**Disposition at artifact freeze:** SOURCE-MAPPED / FORMALIZATION-ADDED / EXACT-HEAD-CI-IN-PROGRESS / NO-RAW-DATA-CALCULATION / NOT-BEDROCK.

## One substantive improvement

The existing covariance-composition formalization correctly transports a full covariance matrix through **linear** observation maps. The Kelvin-vortex paper's terminal spectral observable is not linear: it is a squared-magnitude estimator of a complex Fourier coefficient.

I added a source-shaped Lean boundary to the existing assistant-level PR #2458. It formalizes the quadratic addition cross-term, quadratic scaling, and phase-rotation invariance. This prevents the linear covariance-pushforward theorem from being silently extended through a nonlinear power-spectrum estimator.

This is a verification-workflow improvement, not a new physical result.

## Primary measured-system source

Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* 22, 409–414 (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w). The author-hosted version-of-record PDF is [available here](https://labo.msc.u-paris.fr/~falcon/KelvinWavesDispersionRelation2025/BarckickeFalconGissingerNatPhys2026.pdf).

The Methods define the opposed contour samples
\[
r_0=r(z,t,\theta=0),\qquad r_\pi=r(z,t,\theta=\pi),
\]
and the source-defined linear readouts
\[
\eta=\frac{r_0-r_\pi}{2},\qquad
a=\frac{r_0+r_\pi}{2}.
\]
Thus \((r_0,r_\pi)\mapsto(\eta,a)\) is a same-frame, two-value linear reparameterization. The paper reports a 300-fps, 30-s spatiotemporal recording over \(L=12.5\) cm; the contour camera uses 60 μm/px sampling, a 0.5-mm contour width, and typical radius/position uncertainty of about 0.1 mm.

For \(X=\eta\) or \(a\), the paper defines
\[
S_X(\omega,k)=\frac{|\widetilde X(\omega,k)|^2}{LT},
\]
where \(\widetilde X\) is the two-dimensional Fourier transform of \(X(z,t)\). The reported spectral density has units m³ s⁻¹. The inspected Methods specify the transform and normalization but do not state a taper/window, segment-averaging procedure, or finite-record uncertainty estimator; this is a reporting gap in the inspected text, not evidence that no such processing was used.

The separate PDF acquisitions must not be confused with that spatiotemporal recording: the Methods describe 10 min at 100 fps for \(a(z,t)\) and 3 min at 360 fps for \(\eta(z,t)\), each sampled at 1,000 discrete axial positions over 2.5 cm and concatenated into a temporal file. Those two PDF products do not supply a shared frame-level time series merely because they describe the same physical vortex.

PIV is a separate top-view Phantom V1840 acquisition at 6,000 fps for 0.1 s, yielding a 37×23 velocity grid at 2.7-mm spatial resolution and reported circulation uncertainty about 0.005 m²/s. PTV supplies \(v_z(z)\) with reported uncertainty about 0.05 m/s. The article's Results mention two orthogonal cameras for the \(m=1\) counterrotation claim, while the inspected Methods do not explicitly map that pair, its synchronization, or its registration. This remains a source-to-instrument mapping gap, not a demonstrated experimental error.

The Methods say that \(a_0=\langle a(z)\rangle_z\) is measured, \(\Gamma\) and \(v_z\) are fitted to the dispersion data using equation (2), and the fitted pair is checked a posteriori against PIV/PTV. That is a fit plus an a-posteriori consistency check, not a blind prediction from independently frozen parameters.

The paper identifies the supporting spectra and other data at Figshare DOI [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347). The DOI/API and page routes were attempted in this run, but the raw file inventory, version, bytes, checksums, sample IDs, and joint covariance were not retrieved. No sample-level physical calculation is claimed.

## Exact mathematical boundary

The observation chain is
\[
(r_0,r_\pi)
\xrightarrow{\;M\;}
(\eta,a)
\xrightarrow{\;\mathcal F_{z,t}\;}
(\widetilde\eta,\widetilde a)
\xrightarrow{\;\mathcal Q\;}
(S_\eta,S_a),
\]
where \(M\) and the Fourier transform are linear, while
\[
\mathcal Q(z)=\frac{|z|^2}{LT}
\]
is quadratic.

For a complex Fourier amplitude represented by \(z=(x_1,x_2)\in\mathbb R^2\), the formalized identity is
\[
\mathcal Q(z+w)=\mathcal Q(z)+\mathcal Q(w)
+\frac{2(x_1y_1+x_2y_2)}{LT},
\]
with \(w=(y_1,y_2)\). Also \(\mathcal Q(cz)=c^2\mathcal Q(z)\), and a quarter-turn of Fourier phase leaves auto-power unchanged.

Therefore:

1. Full covariance pushforward is valid through the declared linear observation maps, provided the full joint covariance and sample identity are retained.
2. It does **not** by itself provide the sampling covariance or uncertainty of the finite-record power-spectrum estimator.
3. Estimator uncertainty requires the actual Fourier-coefficient distribution / fourth-order information or a predeclared, data-grounded segment/block procedure, with windowing, stationarity and effective-sample assumptions recorded.
4. Auto-power alone discards Fourier phase. A complex cross-spectral matrix is a different, phase-sensitive observable; the existing Mercer h907 work already formalizes that distinction. This report does not duplicate it.

The new Lean declarations are in `HsHVerification.SpectralPowerEstimatorBoundary` inside the existing PR #2458 branch:
- `spectralPower_addition_identity`
- `spectralPower_scale_identity`
- `spectralPower_phaseQuarterTurn_invariant`

The module represents a complex Fourier coefficient by its real/imaginary pair. It formalizes the paper's estimator shape only; it does not estimate a spectrum, sampling variance, covariance, fit, or prediction from measured values.

## Existing-work reuse and non-duplication

- Nadir PR #1189 already supplies the source-specific paired-sample key/admission contract and two-channel readout.
- Sable PR #1538 already supplies the covariance bridge for that specific 2×2 readout.
- Mercer PR #1918 / h907 already supplies the full complex cross-spectral matrix and phase-sensitive displacement/radius cross-spectrum.
- Nadir h807 and Aster h946 already map the Kelvin acquisition paths, two-point angular limits, separate PDF acquisitions, and unresolved orthogonal-camera evidence.
- Meridian PR #2458 supplies the reusable arbitrary-linear-map covariance composition theorem and diagonal-only no-go.

The new delta is only the formal boundary at the **quadratic spectral estimator**. No existing worker branch was edited; the existing assistant-level PR #2458 branch was extended additively.

## Verification status at artifact freeze

- Existing PR: [#2458](https://github.com/Satobloc/HsH/pull/2458), draft/open/unmerged.
- New commit: `3cdffc44890e54144a2aab8ca484b4989f34bb0a`.
- Exact-head Actions run: [#45307336643](https://github.com/Satobloc/HsH/actions/runs/45307336643).
- At report freeze, the exact PR-head checkout assertion had passed; Lake dependency-manifest generation was still `in_progress`, and Lean compilation had not started.
- No theorem from the new section is claimed compiled or verified at this artifact freeze. Any later run result must be appended as a separate verification amendment.

The theorem is about the formalized algebraic estimator only. It does not establish that the source-to-model translation is sound or that any physical premise is true.

## H(s)H and paper boundary

The ordinary-fluid vortex core is the measured laboratory object, not an SAT/Kerr worldtube. No source-authorized worldtube-to-lab-to-camera forward map was supplied or inferred. Additional worldtube thickness, twist, framing, or contact surfaces are not forced by this measurement audit.

No H(s)H-specific physical prediction, fit, numerical threshold, independent measurement, or falsification result was produced. The P2 November 23 first-draft/hostile-review gate remains NOT MET; the November 30 major-paper gate remains HOLD. P3 December 14 remains incomplete.

## Operational controls

- Mersearch was not callable in this runtime. All four existing request lanes were occupied/requested; no request was created, overwritten, retried, or released. Bounded GitHub retrieval was a fallback, not a Mersearch execution.
- HsH main was read at `61d0a66dc457c3fd0935b012b8db4e04d01d7837`; SAT archive root orientation was checked; HSH_RESOURCES was limited to its root README, with no private payload/index opened.
- Existing Math Hopper #578 / PR #991, relevant Lean PRs, Whirligig Kernel 0, and SciSpace availability were checked. No new tool, dependency, fork, subscription, or expenditure.
- PWH queue/graph were read. Latest deep review remains Elias h1054:s2; the next five-product trigger is not yet due. No queue, graph, owner, priority, or scheduler mutation.
- FIE last full review November 20; next December 4. Unrelated-reading break last completed November 21; neither was repeated.
- P0 remains active. P1 remains Orson-owned/frozen. No manuscript gate advanced.
- No SAT-O or Blockwave equation was changed or corrected. No BEDROCK theory promotion.

**Return cursor:** PR #2458 exact-head run #45307336643; then independent review of the estimator-boundary extension. Raw Figshare file inventory and estimator-level uncertainty remain unverified.
