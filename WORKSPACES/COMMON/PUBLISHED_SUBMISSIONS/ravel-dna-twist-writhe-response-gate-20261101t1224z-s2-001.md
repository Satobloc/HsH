# DNA twist/writhe as a measured finite-core filament comparator

**Status:** source-reported experimental values recalculated; no raw-data reanalysis; no H(s)H prediction; no theory promotion.

## Question

Can a real, torsionally constrained finite-core filament provide a useful empirical comparator for the distinction between material twist, centerline coiling (writhe), and a measured response? The answer is yes, with strict limits: the experiment constrains a 3D framed-polymer response, not an H(s)H 4D worldtube or the WWRD climbing-rope heuristic.

## Experimental systems and measurement provenance

### 1. High-tension DNA torque measurement

Bryant et al., *Structural transitions and elasticity from torque measurements on DNA*, Science 301 (2003), DOI: https://doi.org/10.1126/science.1086634.

The experiment used torsionally constrained 14.8-kbp DNA, with measurements at 15 and 45 pN tension. Torque was measured by tracking rotation of a bead and calibrating rotational drag; an equipartition analysis provided a second estimate. The paper reports torsional moduli of **410 ± 30 pN·nm²** from torque-versus-twist calibration and **440 ± 40 pN·nm²** from equipartition. Ambient temperature was **23 ± 1 °C**. The reported ± levels are retained as published; the accessible text does not specify a confidence convention.

For conversion to torsional persistence length, use the exact SI Boltzmann constant, \(k_B=1.380649\times10^{-23}\,\mathrm{J/K}\), as listed by NIST CODATA 2022: https://physics.nist.gov/cuu/Constants/ . At \(T=296.15\pm1\,\mathrm K\), \(k_BT=4.088792\pm0.013806\,\mathrm{pN\,nm}\). Propagating the reported torque and temperature uncertainties independently gives:

| Method | Torque modulus | Derived persistence length |
|---|---:|---:|
| Drag-calibrated torque | 410 ± 30 pN·nm² | 100.3 ± 7.3 nm |
| Equipartition check | 440 ± 40 pN·nm² | 107.6 ± 9.8 nm |

These are two estimates from the same experimental programme, not two independent laboratories. They are not combined.

### 2. Low-force and plectonemic DNA response

Gao et al., *Torsional Stiffness of Extended and Plectonemic DNA*, Physical Review Letters 127, 028101 (2021), DOI: https://doi.org/10.1103/PhysRevLett.127.028101 .

The study used 12.7-kbp DNA tethers and an angular optical trap to measure torque, angle, force, and position. Two DNA templates with different sequences gave consistent results. A constant-extension protocol was used at low force, with force offsets corrected using the no-torsion force-extension relation.

Published central values:

- Bending persistence \(A=43\,\mathrm{nm}\) (reported as measured under the experimental conditions; a numerical uncertainty is not given in the accessible main text).
- Intrinsic twist persistence \(C=109.3\,\mathrm{nm}\) (high-force Moroz–Nelson fit; the article text rounds this to 109 nm).
- Low-force effective twist persistence \(C_{\rm eff}=22\,\mathrm{nm}\) at approximately 0.02 pN.
- Plectonemic twist persistence \(P=24\pm0.3\,\mathrm{nm}\), from a linear torque-versus-turns fit over +24 to +190 turns.
- The plectonemic measurement used 500 nm extension for a contour length of about 4300 nm, i.e. 11.63% of contour length (approximately, but not exactly, 1/9).

The paper's Figure 2 error bars are standard errors of the fitted slope; the accessible main text does not tabulate a numerical uncertainty for \(C_{\rm eff}\). The quoted ±0.3 nm for \(P\) is retained without assigning an unstated confidence level. The supplementary material, which contains further error analysis, was not accessible in this retrieval. The 2021 paper's experimental temperature was not found in the accessible main text, so no conversion of its persistence lengths back to absolute torque units is attempted.

## Calculated response ratios

Using the 2021 paper's displayed \(C=109.3\,\mathrm{nm}\):

| Quantity | Calculation | Result |
|---|---:|---:|
| Extended low-force twist-retention proxy | \(C_{\rm eff}/C=22/109.3\) | 0.2013 (20.13%) |
| Plectonemic twist-retention proxy | \(P/C=24/109.3\) | 0.2196 (21.96%) |
| Plectonemic ratio, propagating \(P\) uncertainty only | \(0.3/109.3\) | ±0.0027 |

The authors interpret these ratios as measures of the fraction of supercoiling partitioned into twist rather than writhe. They are model-dependent response proxies, not direct separate images or measurements of \(Tw\) and \(Wr\).

The high-tension 2003 persistence-length conversions (about 100–108 nm) are several times the 2021 low-force \(C_{\rm eff}=22\,\mathrm{nm}\). This is a cross-study, cross-force comparison, not a matched-condition statistical test. It is qualitatively consistent with the 2003 paper's discussion that tension suppresses writhe fluctuations and with the 2021 observation that effective torsional stiffness changes with force.

## Conditional test of a simple quadratic partition model

Consider the sandbox-level constitutive hypothesis

\[
E=\frac{K_W}{2}Wr^2+\frac{C_T}{2}Tw^2,\qquad Lk=Tw+Wr.
\]

For fixed \(Lk\), minimization gives

\[
\frac{Tw}{Lk}=\frac{K_W}{K_W+C_T},\qquad
\frac{Wr}{Lk}=\frac{C_T}{K_W+C_T}.
\]

If, only as a **naive parameter-identification test**, one sets \(K_W=A=43\,\mathrm{nm}\) and \(C_T=C=109.3\,\mathrm{nm}\), the model predicts a twist share of **28.23%**. The reported DNA response proxies are **20.13%** and **21.96%**, lower by 8.10 and 6.27 percentage points respectively.

Inverting the same toy model, the effective \(K_W\) values required to reproduce those central ratios are about **27.5 nm** (extended low-force) and **30.8 nm** (plectonemic). These are conditional model coefficients, not measured bending lengths.

This does **not** statistically falsify the toy model. The identification \(K_W=A_{\rm bend}\) is unestablished: DNA bending persistence controls local curvature energy, whereas the toy coefficient multiplies the nonlocal writhe functional. The model also omits force, thermal fluctuations, state changes, self-contact, and boundary/closure terms. Full uncertainties and covariance for \(A\), \(C\), and \(C_{\rm eff}\) are unavailable in the accessible main text. The result rejects only the unqualified parameter substitution as an established mapping.

## Geometry and epistemic limits

For a framed curve, material twist is a rotation of the material frame along contour arclength; writhe is a nonlocal functional of the centerline. Temporal angular velocity is a time derivative of the frame and is not the same quantity as spatial twist density. The Călugăreanu–White–Fuller relation \(Lk=Tw+Wr\) is a closed-ribbon identity; a torsionally constrained open DNA tether requires a specified closure or relative-linking convention. See Dennis & Hannay, *Geometry of Calugareanu's theorem*, https://doi.org/10.1073/pnas.0409315102 .

The DNA experiment measures torque, extension, force, and imposed turns. It does not directly reconstruct a time-resolved 4D worldtube, an H(s)H timesheet, or a climbing-rope mechanism. Its value is narrower and useful: it demonstrates that a finite-core filament's twist/writhe response depends on force and configuration, and that local bending persistence is not automatically the coefficient governing global writhe.

An additional open benchmark data resource exists: Vanderlinden et al., *A benchmark data set for the mechanical properties of double-stranded DNA and RNA under torsional constraint*, Data in Brief (2020), dataset DOI https://doi.org/10.17632/3228jznyct.1 (CC BY 4.0). Its raw DNA/RNA torque-versus-turns files were identified but not downloaded or analyzed here.

## Result

A real, measured filament system provides a useful **mechanical response comparator**, not a physical equivalence. The data require explicit separation of material twist, centerline writhe, local bending stiffness, effective writhe cost, force, state, and measurement operator. Any H(s)H comparison must first provide explicit maps from its worldtube/timesheet variables to a framed-curve geometry and then to calibrated observables. No such H(s)H map or prediction is established by this comparison.
