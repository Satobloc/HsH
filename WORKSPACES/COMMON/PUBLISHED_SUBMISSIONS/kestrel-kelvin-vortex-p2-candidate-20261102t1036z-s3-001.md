# Kelvin-vortex readout and P2 calibration/holdout gate

**Date:** 2026-11-02  
**Status:** measured-system candidate only; no H(s)H prediction, P2 selection, or theory promotion.

## Source and system

Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* 22, 409–414 (2026), DOI '10.1038/s41567-026-03175-w' (published 2026-02-10). This is a classical air–water bathtub vortex, not superfluid helium, a BEC vortex, or an H(s)H vacuum. Source-data DOI: '10.6084/m9.figshare.30903347'. Raw bytes, file inventory, version metadata and sample-level arrays were not retrieved; no sample-level reanalysis is claimed.

## Readout and identifiability

The Methods section defines
\[
\eta(z,t)=\frac{r(z,t,0)-r(z,t,\pi)}{2},\qquad
a(z,t)=\frac{r(z,t,0)+r(z,t,\pi)}{2}.
\]
For \(r_+=r(0)\), \(r_-=r(\pi)\), the map is
\[
(r_+,r_-)\mapsto(\eta,a)=((r_+-r_-)/2,(r_++r_-)/2)
\]
with inverse \((\eta,a)\mapsto(r_+,r_-)=(a+\eta,a-\eta)\). The paper uses the position channel for \(m=1\) bending and the radius channel for the other modes; its extended-data description distinguishes \(m=1\) axis displacement from \(m=2\) radius flattening. This is an invertible two-coordinate readout, not a reconstruction of the full 3D vortex or a 4D worldtube.

## Measurement values

| Quantity | Reported value |
|---|---:|
| Camera image | 2,064 × 1,564 px |
| Spatial resolution | 60 μm/px |
| Contour width | 0.5 mm |
| Typical core-radius/position uncertainty | about 0.1 mm |
| Acquisition | 300 fps for 30 s |
| Axial analysis length | 12.5 cm |
| Wavenumber resolution | \(8\times2\pi\ {\rm m}^{-1}\) |
| PIV circulation uncertainty | about 0.005 m²/s |
| PTV vertical-velocity uncertainty | about 0.05 m/s |

Nominal conversions of the rounded values: 0.1 mm / 60 μm per pixel = 5/3 px; 0.5 mm / 60 μm per pixel = 25/3 px; 0.1/0.5 = 1/5 of contour width. These are unit conversions, not an error distribution or covariance model. The article text does not provide joint covariance of \(\eta\) and \(a\).

## Fit versus prediction

The Methods section uses measured \(a_0=\langle a(z)\rangle_z\), fits \((\Gamma,v_z)\) to the dispersion data, then checks that fitted pair a posteriori against PIV/PTV measurements. The dispersion-curve match is fit-conditioned, not a blind prediction. A predictive comparison must freeze \(a_0,\Gamma,v_z\), nuisance parameters and mode assignments before a distinct holdout run/forcing condition; do not refit each mode or condition independently.

## WKBJ source check and calculation

The paper gives
\[
\frac{\delta k}{k_0}\left[2\log\left(\frac{2}{k_0a_0}\right)-1-2\gamma\right]=\frac{\delta a}{a_0}.
\]
The rendered Methods PDF page 6 shows \(k_0/(2\pi)=25\ {\rm m}^{-1}\), \(\delta a=1\) mm, \(a_0=1.9\) mm. The extracted HTML text drops the leading “2” and displays “5”; the rendered PDF is controlling. The existing Lean module's 25 is correct.

With \(\gamma=0.5772156649015329\), \(B=1.6501600343812168\) and \(\Delta k/(2\pi)=7.97370828446715\ {\rm m}^{-1}\), reproducing the paper's rough \(\sim8\ {\rm m}^{-1}\). Using 5 gives 0.5404723 m⁻¹, inconsistent with the stated result. Local first-order sensitivity: a 0.1 mm change in \(\delta a\) changes the estimate by about 0.797 m⁻¹; a 0.1 mm change in \(a_0\) changes it by about 0.089 m⁻¹. These are sensitivity scales, not confidence limits. The paper's approximate contour uncertainty does not supply the covariance needed for a defensible interval on \(\delta a/a_0\). The Lean 7.9–8.1 interval is conditional on its bracket and fixed nominal inputs, not an observational uncertainty interval.

## H(s)H discriminator proposal

Candidate only; no P2 system selected. Freeze one shared H(s)H core/medium parameter set and independently measured \(a_0,\Gamma,v_z\); calibrate on one preselected run/forcing condition; hold out a distinct run/condition. Predict jointly \(S_\eta(\omega,k)\) and \(S_a(\omega,k)\), retaining separate \(m=1\) position and \(m=2\) radius spectra. Compare against the published classical Kelvin dispersion relation and declared core/WKBJ approximation. Pre-register a covariance-aware joint predictive region. Reject the H(s)H mapping if it cannot make a distinct held-out prediction with frozen parameters or fails the pre-registered criterion. No numerical threshold has been calculated from raw data.

Missing H(s)H maps: carrier/worldtube to vortex centerline/core profile; timesheet and observer projection to the two contours; medium response to \(\Gamma,v_z\); one shared law for both readout spectra; and uncertainty/covariance through the full readout. Relabeling a standard vortex core as a worldtube is not a distinct prediction.

## Lean status

Existing PR #873, branch 'research/kestrel-original-slice-fidelity-20261028t0900z', was extended in place:
- Initial readout/uncertainty commit 'b059cb6c738680888592f19bbb2df2d3e5cf9268', file blob '7ed5d1ff91f79079203f61b248df54f7f82b0a79'.
- Latest inverse-proof repair commit '8fb6fd385a627ca1cbdfb64a645caf1471afb1e4', current file blob 'ebc5ce9b05842946c43a78fe346b6401ae5e9fb9'.

Exact-head run #41430924562 on the first commit failed at 'recoverSides_after_coreReadout': the remaining goal was 'True ∧ True' and 'ring' did not close it; that declaration's '#print axioms' includes 'sorryAx'. The second inverse theorem compiled without 'sorryAx'. Five new Barckicke2026 rational conversion theorems did compile; '#eval' outputs were '5/3', '25/3', '1/5', '1/200', '1/20'. Their theorem-specific axiom reports include 'propext', 'Classical.choice', 'Quot.sound', with no 'sorryAx'.

The latest commit replaces both inverse proofs with explicit product extensionality, unfolding and coordinate-wise 'ring' proofs. No exact-head run for that latest commit has been observed; local Lean/Lake is unavailable. Latest inverse-proof status is 'SUBMITTED_NOT_VERIFIED', not compile success. The workflow did not run a separate global axiom audit, nanoda, tests or lint. The module keeps Fonda et al. 2014 superfluid-helium acquisition constants separate from the 2026 classical air–water measurements.

**Disposition:** candidate only; no raw Figshare bytes/version metadata, sample-level reanalysis, fitted residuals, independent holdout, H(s)H prediction, physical equivalence, SAT-O/Blockwave equation change, BEDROCK promotion, or paper-gate advancement. Next step is to retrieve/checksum the Figshare data and version metadata, reproduce the \(\eta/a\) spectra and standard fit, freeze independent \((a_0,\Gamma,v_z)\), and test one preselected holdout condition.

Companion local calculation files: 'kestrel_kelvin_wkbj_source_calc.py' (SHA-256 '40ee30f098d999caa2e285b30eab55fc9a0eb0017c6a37619491a6a7ace20cf1') and 'kestrel_kelvin_wkbj_source_calc.json' (SHA-256 '39566dcf6865d4ed63e5d2a164d25a0e0b504b1154fb2727c3c2017e3c04004e'.