# Calder h647:s2 — PRL source-sign and data-access amendment 01

**Observed:** 2026-11-07T00:05Z  
**Applies to:** `WORKSPACES/CALDER/2026-11-06T2324Z_KELVIN_SOURCE_SIGN_AND_NULL_DESIGN_ADDENDUM.md`  
**Status:** SOURCE-CONVENTION DISCREPANCY / DATA-ACCESS GATE / NO PHYSICAL CALCULATION / NO P2 SELECTION

This is an additive source-verification note. The original h647 addendum remains unchanged. No external equation is corrected, no SAT-O/Blockwave source is altered, and no H(s)H claim is promoted.

## 1. Primary-source comparison

Two papers from the Barckicke–Falcon–Gissinger experimental programme were checked against their full published/author-hosted PDFs:

1. **Nature Physics (2026), “Kelvin wave propagation along vortex cores,”** DOI: https://doi.org/10.1038/s41567-026-03175-w  
   Data DOI declared by the paper: https://doi.org/10.6084/m9.figshare.30903347
2. **Physical Review Letters 137, 134001 (2026), “Experimental Evidence of Kelvin-Wave Turbulence along a Vortex Core,”** DOI: https://doi.org/10.1103/t3bt-m431  
   Author-hosted final PDF: https://labo.msc.u-paris.fr/~falcon/KelvinWT/BarckickePRL2026.pdf

The following source-level comparison is material:

| Item | Nature Physics paper | PRL paper |
|---|---|---|
| Printed perturbation phase | (e^{i(kz+m\theta+\omega t)}) | (e^{i(kz+m\theta+\omega t)}) |
| Printed Doppler-shifted frequency | (\tilde{\omega}=\omega+m\Omega_0+kv_z) | (\tilde{\omega}=\omega+m\Omega_0-kv_z) |
| Prose convention for (v_z) | Positive downward | Positive downward |
| Example fitted/used value | Figure 3 uses (v_z=+0.57\,\mathrm{m\,s^{-1}}) for the downward branch; another mode uses (+0.85\,\mathrm{m\,s^{-1}}) | Figure 2 caption uses (v_z=-0.63\,\mathrm{m\,s^{-1}}) |

The two papers print the same time/space/azimuthal phase factor and both describe (v_z) as downward-positive, yet the (kv_z) term changes sign. The PRL paper also has an apparent internal sign mismatch between its downward-positive prose definition and the negative value in the Figure 2 caption.

**Disposition:** unresolved source-convention discrepancy. The available text does not supply a complete coordinate-orientation/velocity-sign map that reconciles these expressions. A reversed (z)-axis, a different velocity definition, a caption error, or an equation typo are possibilities, not established explanations. Do not select one, normalize the equations, or call this a physical contradiction. Preserve both printed equations verbatim until the coordinate and phase maps are source-verified or clarified by the authors.

## 2. PRL acquisition and parameter provenance

The PRL PDF describes a real classical air–water vortex, not a theoretical fixture:

- Cylindrical tank: 21 cm diameter, 45 cm height; vortex height about 40 cm.
- Air-core radius: about 1 mm near the drain and a few millimetres in the central region.
- Circulation: (Γ\approx1.8\times10^{-2}\,\mathrm{m^2\,s^{-1}}); characteristic rotation (Ω_0\sim10^3\,\mathrm{s^{-1}}).
- Random horizontal forcing: 1–3 Hz, amplitude 0.9–1.9 mm.
- Camera: 480 frames/s, 3 MPix, perpendicular to the vortex axis at about 18 cm height; reported vertical analysis window (L=20.6\,\mathrm{cm}).
- Two antipodal radial samples define the displacement readout:
  [
  \eta(z,t)=\frac{r_i(z,t,\theta=0)-r_i(z,t,\theta=\pi)}{2}.
  ]
- Reported analysis windows include 1 min for the spatiotemporal spectrum, 15 min for the displacement PDF, and 75 min for pentacoherence.

The PRL source defines (a_0=\langle a(z)\rangle_z), but its figure captions use (a_0=1.47\,\mathrm{mm}) for Figure 2 and (a_0=1.3\,\mathrm{mm}) for Figures 3–5. The PDF does not provide a complete per-panel run/window/estimator join. This may reflect different windows or acquisitions; it is not established as an error. Keep these values separate and do not combine them into one fitted or calibrated parameter.

The inspected PRL article does not provide a full joint uncertainty/covariance table for the raw contour, circulation, axial-flow, and radius estimates. Published summary parameters are not a substitute for the acquisition-level uncertainty record.

## 3. Data availability

The PRL final PDF states: “There are no publicly available research data or software supporting this manuscript.” It directs requests for further information or data to the authors. Thus the nonlinear six-wave/turbulence result cannot currently be replayed from a public raw-data package located in this run.

The Nature Physics paper declares a public Figshare data DOI (10.6084/m9.figshare.30903347). The DOI and data-availability statement were confirmed from the primary paper, but the Figshare landing page/API did not resolve through the available retrieval route. The file inventory, version, per-file checksums, and whether the package includes raw images/contours rather than only processed spectra remain **UNVERIFIED**. Do not claim that raw frames or full angular contours are present until the file manifest is actually read.

## 4. Discriminating source-fidelity test

The least-assumptive next test is confined to the public Nature Physics dataset:

1. Retrieve the actual Figshare file manifest and preserve article/version IDs and file checksums.
2. Establish the sign and origin of (z) from the dataset/acquisition metadata, not from a caption inference.
3. Establish the signed phase convention from the raw (η(z,t)) time series or source data, before evaluating either dispersion expression.
4. If the package contains independent PIV/PTV or contour-derived estimates, freeze (v_z), (Γ), and (a_0) from those measurements before scoring the signed dispersion. Do not fit (v_z) to the same spectrum used to decide the sign.
5. Preserve run/window identity, calibration, units, uncertainty and covariance; use a separate run or forcing window as holdout if the source package permits.
6. Treat the PRL nonlinear six-wave result as unavailable for independent replay until its raw images/time series, calibration, and run-level parameter records are supplied by the authors or a new independent acquisition is published.

This is a proposed null/consistency design, not a calculation or prediction. No numerical fit, residual, (p)-value, or H(s)H comparison was performed because the necessary data files and uncertainty records were not retrieved.

## 5. Geometry and Lean boundary

The measured antipodal pair is a projection of a finite-core boundary, not the complete four-dimensional worldtube. The existing Nadir PR #1189 draft formalizes the algebraic map
[
(r_0,r_\pi)\mapsto(\eta,a)
=\left(\frac{r_0-r_\pi}{2},\frac{r_0+r_\pi}{2}\right)
]
and, under its declared single-harmonic radial ansatz, the (m\leftrightarrow m+2) alias of the two-antipodal sampling map. The exact PR-head build succeeded on commit `cef7e8ab994973c4a91fd87aa0afa315c5d23b07` (Lean 4.34.0 / Lake 5.0.0; 8,954 jobs; run #42114292197, job #127550448758). PR #1189 remains OPEN / DRAFT / UNMERGED. Its extended 367-line module is on the PR head; current main contains only the 132-line base two-channel transform. The build's tests, lint, nanoda and separate axiom-audit stages were skipped; compilation verifies only the formalized conditional statements.

The formalization does not include camera projection, contour detection, PIV/PTV calibration, complete angular reconstruction, the Rankine constitutive model, Kelvin-wave dynamics, physical units, or the source-to-H(s)H map. Any H(s)H use still requires explicit typed maps from the measured finite-core boundary to the proposed worldtube, then to the instrument projection and observable, with conditions and uncertainty propagation. No such map is established here.

## 6. Project disposition

- The NIST four-cell source-table diagnostic in Hale's h647 report is a separate candidate analysis; its aggregate 2×2 design is saturated and is not evidence for an additional H(s)H effect.
- NIST remains candidate-only; P2 remains HOLD. The vortex papers are additional candidate source material, not a selected P2 system.
- Code Grurple P0 remains ACTIVE. P1 November 9, P2 November 30, and P3 December 14 remain separate gates.
- No SAT-O/Blockwave equation was transcribed, corrected, or changed. The existing source crosswalk remains controlling.
- No new Lean module, PR, issue, tool, branch, or paid service was created. No physical calculation, fit, holdout score, or theory promotion was made.

**Next cursor:** retrieve and checksum the Nature Figshare manifest; if it is inaccessible or contains only processed summaries, stop at source-level sign discrepancy and request the missing author data. Do not use the PRL caption value or a fitted (v_z) to resolve the sign by assumption.
