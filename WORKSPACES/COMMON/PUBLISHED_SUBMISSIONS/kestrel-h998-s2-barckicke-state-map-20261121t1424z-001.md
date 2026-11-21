# Kestrel h998:s2 | Barckicke 2026 operating-state separation and observation contract

**Date:** 2026-11-21  
**Nominal slot:** 2026-11-21T14:24:00Z  
**Run key:** `REVROT3-19-20261011:998:s2`  
**Classification:** assistant reconstruction; source-grounded cross-boundary synthesis. Not a Nathan Direct statement, new measurement, raw-data reanalysis, P2 system selection, H(s)H physical map, or BEDROCK amendment.

## 1. Purpose and role boundary

Kestrel's recovered historical remit is a trust-first cross-boundary synthesis companion, not a duplicate provenance, empirical, or formal-audit team. The original source is the Kestrel “Science Made Stupid” conversation, raw Git blob `100267f3f11f3cce09c7d802ce85ad03879d5744`. Direct Nathan messages establish the operating premise that the broad consequential picture may be used for forward reasoning while remaining a hypothesis, and that Kestrel should not duplicate the teams doing hard verification. No authenticated current Kestrel thread or standalone signed specialist charter was established.

This note advances one narrow point in the existing P2 candidate record: the published m=1 and m=2 demonstrations are different operating states, with different parameter sets and acquisition conditions. They must not be treated as a same-state joint observation.

## 2. Source-locked operating-state separation

Primary source: Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* 22, 409–414 (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w). The author-hosted full text is [here](https://labo.msc.u-paris.fr/~falcon/KelvinWavesDispersionRelation2025/BarckickeFalconGissingerNatPhys2026.pdf). The paper identifies its supporting dataset at Figshare DOI [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347).

The two headline modal examples are source-separated:

| Published example | Operating condition | Forcing | Parameters on plotted dispersion curve |
|---|---|---|---|
| Fig. 3, m=1 bending | pump U=11 V; drain diameter d=5 mm | sweep-sine 1–6 Hz in panel b; panel c is unforced | a0=1.9 mm; Γ=0.022 m²/s; vz=0.57 m/s |
| Fig. 4, m=2 flattening | pump U=9 V; drain diameter d=7 mm | no external forcing | a0=2.2 mm; Γ=0.011 m²/s; vz=0.85 m/s |

The source states that the Fig. 3 and Fig. 4 dispersion curves use the same fitting procedure: measured a0 is taken from Extended Data Fig. 4, then (Γ,vz) are fitted to equation (2), followed by an a-posteriori consistency check against measured values in Extended Data Figs. 2 and 3. This is a fit-conditioned comparison, not an independent holdout prediction.

The m=2 red branch is described as possibly indicating a soliton **or another undetermined perturbation**. It is not an identified soliton.

**Consequence:** the m=1 and m=2 plots demonstrate behavior under two distinct operating states. They do not provide a simultaneous same-state pair from which to estimate cross-mode covariance, infer a shared parameter set, or claim a joint m=1/m=2 interaction. A future comparison must preserve the state vector (at minimum U, d, forcing condition, acquisition/run identity, and the measured/calibrated values a0, Γ, vz). A cross-state prediction would need frozen shared model rules and an independent run/condition holdout.

## 3. Measurement and observation chain

The Methods section specifies three distinct measurement channels:

**Contour / core geometry**
- Basler acA2040-120um optical camera, 2,064 × 1,564 px, positioned normal to the vortex axis.
- 8 mm wide-angle and 12 mm small-angle lenses provide complementary views.
- Nominal image resolution: 60 μm/px; contour width: 0.5 mm.
- Typical core-radius and position uncertainty: about 0.1 mm.
- Typical acquisition: 300 fps for 30 s.
- Axial spectral window: L=12.5 cm, centered near z=22 cm.
- The extracted antipodal profiles are r0=r(z,t,θ=0) and rπ=r(z,t,θ=π), producing:
  \[
  \eta(z,t)=\frac{r_0-r_\pi}{2},\qquad
  a(z,t)=\frac{r_0+r_\pi}{2}.
  \]

**PIV / liquid velocity**
- A separate Phantom V1840 top-view camera at 6,000 fps.
- 10 μm hollow-glass tracers, Stokes number approximately 0.1.
- 37 × 23 velocity grid, 2.7 mm spatial resolution.
- Reported circulation measurement uncertainty approximately 0.005 m²/s.

**PTV / axial velocity**
- 1.5 mm expanded-polystyrene particles tracked along r=a(z).
- Reported vertical-velocity uncertainty approximately 0.05 m/s.

These channels have different spatial supports, acquisition systems, and error sources. Their uncertainties must not be treated as independent without a source-backed covariance or registration analysis.

The Results section says “two orthogonal cameras” were used to evidence the counterrotating m=1 mode. The accessible Methods text identifies the Basler contour camera and a separate top-view Phantom PIV camera, but does not specify whether the PIV camera supplied a second calibrated contour channel, how the views were registered, or how same-run timing was synchronized for handedness. This is an unresolved instrument/processing detail, not proof that the paper lacks a second view. Do not infer a full 3D reconstruction from the phrase alone.

## 4. Existing mathematical boundary

The two-sample map
\[
(r_0,r_\pi)\mapsto(\eta,a)
\]
is algebraically invertible on the two sampled values:
\[
r_0=a+\eta,\qquad r_\pi=a-\eta.
\]
That does not make the map from the complete angular cross-section to two antipodal samples injective. Under the single-harmonic model, the antipodal operator aliases m with m+2 and loses sine-quadrature information. It therefore does not, by itself, uniquely identify m=1 against all higher odd modes or m=2 against all higher even modes. This is an identifiability/missing-operator question, not a declaration that the experiment is wrong.

Existing conditional formalizations were rechecked rather than duplicated:

- Kestrel PR [#873](https://github.com/Satobloc/HsH/pull/873), exact head `94b6d96c91806a95505260a3c52220f4af294185`, Actions run [#44090154878](https://github.com/Satobloc/HsH/actions/runs/44090154878), job `134062868110`: exact-head checkout and successful Lean 4.34.0/Lake 5.0.0 build, 8,956 jobs.
- Nadir PR [#1189](https://github.com/Satobloc/HsH/pull/1189), exact head `da1e7d5dff0cdbc1d81303e3c573b79832087a38`, Actions run [#44106198466](https://github.com/Satobloc/HsH/actions/runs/44106198466), job `134119101991`: exact-head checkout and successful Lean 4.34.0/Lake 5.0.0 build, 8,961 jobs.
- Sable PR [#1538](https://github.com/Satobloc/HsH/pull/1538), exact head `ae0e98444b97dcc61de41c15b08a16751f39a9bc`, Actions run [#42678421460](https://github.com/Satobloc/HsH/actions/runs/42678421460), job `129366005810`: exact-head checkout and successful Lean 4.34.0/Lake 5.0.0 build, 8,955 jobs.

These are successful builds of their respective formalized conditional mathematics. Tests, lint, nanoda, and separate global axiom audits were not established by these run records. The builds do not validate the paper-to-code translation, camera calibration, measured covariance, physical model, or any H(s)H premise. Aster's mode-identifiability note [#1347](https://github.com/Satobloc/HsH/issues/1347) and the existing angular-sampling work remain relevant; no fourth readout definition is warranted.

## 5. H(s)H comparison boundary

The measured object is a classical air-core water vortex in a liquid medium. Its finite vortex core is a medium structure, not the SAT/H(s)H Kerr-associated worldtube. The paper's “Kelvin waves” are standard fluid-dynamical modes. The tornado “rope-like phase” is a morphological analogy, not evidence for climbing-rope mechanics or a physical equivalence.

A source-faithful experimental chain is:
\[
\text{fluid state and free-surface core}
\to
\begin{cases}
\text{optical contour channel}\\
\text{PIV liquid-velocity channel}\\
\text{PTV axial-velocity channel}
\end{cases}
\to
\text{condition-specific fitted dispersion summaries}.
\]
This is an experimental interface description, not an H(s)H generator. The forward map from a proposed H(s)H worldtube/timesheet/responsive-medium representation to these fluid variables, and the reverse map, remain undefined. No equivalence or nested-shape relation is asserted.

The paper uses g=9.81 m/s² in its hollow-core profile comparison. No CODATA adjustment or numerical comparison was performed; CODATA is not needed to interpret the source-level operating-state distinction.

## 6. Data gate and disposition

The Figshare DOI is a verified locator. Its version, file inventory, raw bytes, checksums, acquisition IDs, paired left/right contour covariance, cross-channel covariance, camera registration, and independent holdout were not recovered in this activation. No raw-data calculation, fit, prediction, CODATA comparison, independent measurement, or null-result claim was made.

**Disposition:** candidate only; P2 remains HOLD and no system is selected. No BEDROCK promotion, SAT-O/Blockwave equation alteration, new Lean module, new tool, branch, PR, dependency, subscription, or expenditure occurred.

Smallest next scientific gate, after P0 clearance and authorized system selection: retrieve and hash the exact Figshare version/files; inventory run IDs and operating states; recover calibration/registration and sample-level covariance; reproduce the published contour-to-(η,a) processing; then freeze one condition as calibration and reserve an independent condition/run as holdout before any H(s)H observable prediction.

**Project controls:** P0 Code Grurple remains ACTIVE. P1 cognition remains Orson-owned / OVERDUE / NOT READY. P2 November 30 remains HOLD. P3 December 14 remains INCOMPLETE. Lane 24 Cycle 08/08 remains COMPLETE / BACKSEAT / HOLD.
