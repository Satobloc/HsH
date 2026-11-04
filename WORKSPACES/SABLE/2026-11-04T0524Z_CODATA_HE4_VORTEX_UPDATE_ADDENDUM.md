# Sable :24 — CODATA He-4 / rotating-vortex calibration addendum

**Status:** INTERNAL PREFLIGHT ADDENDUM · SOURCE-BOUNDED · NO THEORY PROMOTION · NOT A PAPER RESULT  
**Scheduled slot:** 2026-11-04T05:24Z  
**Current automation run:** `53163f9a-8604-832f-a358-588c4be6ba33`  
**Existing same-slot receipt:** `fad920c9-dd58-8326-a84a-c206581dd348` (different run ID; preserved, not duplicated)  
**Task:** `6abda4c8eda88191bf23a6f2849e9a17` (enabled identity/schedule/phase unchanged)  
**Rotation:** h=581; seq=2907; ring index 0 = Sable; successor = Loom.

This addendum records a fresh CODATA-relevant helium-4 mass result and independently rechecks the arithmetic used in the earlier Kestrel superfluid-vortex note. It does not replace the existing Sable Lane 24 systems-triage report or its receipt.

## 1. Why this update matters

The 2023 rotating-superfluid-helium experiment uses the Feynman-Onsager circulation quantum

\[
\kappa_{He}=\frac{h}{m(^{4}He)}
\]

to predict the intervortex spacing

\[
\delta_F=\sqrt{\frac{\kappa_{He}}{2\Omega}}.
\]

A new, higher-precision neutral-helium mass measurement was published on 2026-07-28. It is a candidate input for the next CODATA adjustment, not a CODATA-recommended value yet. Using it with the currently recommended CODATA 2022 atomic-mass constant changes the central circulation quantum only at the few-parts-in-10^12 level relative to the 2023 LIONTRAP value. The SI conversion uncertainty is dominated by the CODATA atomic-mass constant, not by the new helium relative-mass measurement.

A separate correction is necessary: the earlier Kestrel note's 10-rpm lower orientation bound of 187.1 μm does not reproduce from the published 10-rpm input. The recalculation is 188.944 μm. More importantly, the previously quoted 175.8 μm Table-S1 value was not independently re-extracted with its row identity, and the main article explicitly says all measured points lie between the orientation bounds. The alleged 10-rpm discrepancy is therefore **withdrawn as unverified**, not retained as a physical anomaly.

## 2. CODATA provenance and evaluation model

The controlling standard reference is Mohr, Newell, Taylor and Tiesinga, *CODATA Recommended Values of the Fundamental Physical Constants: 2022*, Rev. Mod. Phys. 97, 025002, DOI [10.1103/RevModPhys.97.025002](https://doi.org/10.1103/RevModPhys.97.025002), published 2025-04-30. The adjustment uses theoretical and experimental data available through 2022-12-31. NIST identifies the next regular adjustment as CODATA 2026 and states that eligible data must have been discussed in a preprint or publication before 2026-12-31.

The CODATA 2022 adjusted atomic-mass constant is

\[
m_u=1.66053906892(52)\times10^{-27}\;\mathrm{kg},
\qquad u_r(m_u)=3.1\times10^{-10}.
\]

This is an evaluated constant, not a direct measurement of neutral helium. In the CODATA adjustment, the relevant AMDC relative-mass inputs listed in Table I are for \(^{28}Si\), \(^{87}Rb\), and \(^{133}Cs\), with correlation coefficients 0.0678, 0.0630, and 0.1032 respectively. The paper explains that \(m_u\) is proportional to \(\alpha^{-2}\) and also depends on \(R_\infty\) and the electron relative atomic mass; the latter dependencies contribute negligibly to its uncertainty compared with \(\alpha\).

For an ion-to-neutral conversion, CODATA gives the standard observational relation

\[
A_r(X)=A_r(X^{n+})+nA_r(e)-\frac{\Delta E_B(X^{n+})}{m_uc^2}.
\]

Thus an ion cyclotron-frequency ratio, the electron mass, and the ionization/binding-energy correction are distinct inputs to the neutral-atom relative mass. They must not be collapsed into a single raw measurement.

The 2023 and 2026 helium measurements post-date the CODATA 2022 cutoff. They are eligible for consideration in the 2026 adjustment under NIST's published cutoff rule, but neither is an official CODATA 2026 value as of this run.

## 3. Primary mass measurements and provenance

### 3.1 LIONTRAP, 2023

Sasidharan et al., *Penning-Trap Mass Measurement of Helium-4*, Phys. Rev. Lett. 131, 093201, DOI [10.1103/PhysRevLett.131.093201](https://doi.org/10.1103/PhysRevLett.131.093201), published 2023-08-30. The open full text was inspected.

The experiment measured \(^{4}He^{2+}\) against \(^{12}C^{6+}\) in the same magnetic field. It reports

\[
A_r(^{4}He)=4.002603254653(48)\;u
\]

with 12-ppt relative precision. The neutral-atom value is derived from the measured ion mass plus the missing-electron mass and electron binding-energy correction.

The measurement architecture is unusually explicit: a 3.8-T superconducting magnet; a 4.2-K, approximately \(10^{-17}\)-mbar trap chamber; a compensated seven-electrode cylindrical Penning trap; separate storage minima for the two ions; alternating measurements at the same precision-trap position; axial, modified-cyclotron and magnetron eigenmotions; and the invariance theorem to recover the free cyclotron frequency. The PnA phase-sensitive technique is used for the modified-cyclotron mode. The campaign comprised 32 runs and 482 cyclotron-frequency-ratio measurements.

The published systematic budget is not negligible and is usefully itemized: image charge 3.29 ppt; relativistic shift 0.31 ppt; magnetic inhomogeneity 0.19 ppt; electrostatic anharmonicity 0.13 ppt; dip-line-shape contribution 7.11 ppt; combined systematic uncertainty 7.84 ppt. The reported frequency-ratio uncertainty is 9.0 ppt statistical and 7.8 ppt systematic, 11.9 ppt total. This is an actual measurement plus a stated correction model, not a bare mass number.

### 3.2 FSU, 2025

Medina Restrepo et al., *Mass of helium-4 from cyclotron frequency ratios* \(^{4}He^+/D_2^+\) and \(^{4}He^+/H_2D^+\), Phys. Rev. A 112, L040801, DOI [10.1103/v7k8-8my2](https://doi.org/10.1103/v7k8-8my2), published 2025-10-21. The abstract reports

\[
A_r(^{4}He)=4.00260325467(8)\;u.
\]

It describes a six-standard-deviation discrepancy between the then-current CODATA/AME value and the 2023 LIONTRAP result, and says the FSU value favors the more recent measurement. This is the same FSU group as the 2026 result below; it is a useful cross-check across reference-ion choices, but not an independent laboratory replication.

### 3.3 FSU, 2026

Fernandez Davila et al., *Mass of Helium-4 from the Cyclotron Frequency Ratio* \(^{4}He^+/{}^{12}C^{3+}\), Phys. Rev. Lett. 137, 053001, DOI [10.1103/xzmk-r533](https://doi.org/10.1103/xzmk-r533), published 2026-07-28; received 2026-01-30 and accepted 2026-05-22.

The APS abstract reports the neutral-atom relative mass

\[
A_r(^{4}He)=4.002603254665(36)\;u,
\]

and separately gives the alpha-particle mass. **The neutral-atom value is the relevant one for \(\kappa_{He}\); do not substitute the alpha-particle mass.** The accepted manuscript is not scheduled to become available until 2027-07-28, so this run has only the published abstract, not the full 2026 systematic budget or covariance record.

The 2026 FSU and 2023 LIONTRAP central values differ by \(1.2\times10^{-11}\,u\). If their reported uncertainties are provisionally treated as independent, the combined stated uncertainty is \(6.0\times10^{-11}\,u\), a 0.20-standard-deviation difference. This is a consistency check only, not a weighted combined mass: the covariance of neutral-atom conversion inputs (electron mass and binding-energy corrections) between the two papers is not available here. The 2025 and 2026 FSU results also agree within their quoted uncertainties, but they are from the same group.

## 4. Recomputed circulation quantum and uncertainty

For the provisional mixed-epoch SI conversion, use the 2026 FSU relative mass with the current CODATA 2022 \(m_u\), while keeping the epochs explicit:

\[
m(^{4}He)=A_r(^{4}He)\,m_u
          =6.64647908175758\times10^{-27}\;\mathrm{kg}.
\]

The Planck constant is exact in the revised SI:

\[
h=6.62607015\times10^{-34}\;\mathrm{J\,s}.
\]

Therefore

\[
\kappa_{He}=\frac{h}{m(^{4}He)}
=9.96929361921322\times10^{-8}\;\mathrm{m^2\,s^{-1}}.
\]

Uncertainty separation:

- 2026 FSU \(A_r(^{4}He)\): relative standard uncertainty \(8.994\times10^{-12}\).
- CODATA 2022 \(m_u\): relative standard uncertainty \(3.132\times10^{-10}\).
- The covariance between the new relative-mass result and the CODATA conversion constant is not supplied in the sources inspected.

If independence is assumed, quadrature gives \(u_r(\kappa)\approx3.133\times10^{-10}\). Without assuming a covariance, the first-order triangle bound is \(u_r(\kappa)\le3.222\times10^{-10}\), or approximately \(u(\kappa)\le3.21\times10^{-17}\;\mathrm{m^2\,s^{-1}}\). The conservative bound is the appropriate current record. The SI uncertainty is dominated by \(m_u\), roughly 35 times the relative uncertainty of the 2026 helium measurement.

This is **not** a CODATA 2026 evaluation. It is a transparent combination of a 2026 measured relative atomic mass with the currently available 2022 adjusted mass unit.

## 5. Rotating-superfluid readout and correction to the earlier comparison

Peretti et al., *Direct visualization of the quantum vortex lattice structure, oscillations, and destabilization in rotating \(^{4}He\)*, Science Advances 9, eadh2899 (2023), DOI [10.1126/sciadv.adh2899](https://doi.org/10.1126/sciadv.adh2899), reports the Feynman relation

\[
\delta_F=\sqrt{\frac{\kappa_{He}}{2\Omega}}.
\]

The experiment uses a rotating He-II bucket at 2.160 ± 0.005 K, with rotation rates from 1 to 16 rpm. A vertical laser sheet illuminates a slice of the measurement channel; a high-definition camera records solid dihydrogen flakes decorating vortex lines. The authors report about 50,000 frames / 500 GB, a two-dimensional Gabor-wavelet analysis, and a 2% uncertainty on absolute rotation rate. The vertical error bars are the algorithmic dispersion (including the fit dispersion), not a reported standard error of an independent ensemble mean.

The paper's observation map is therefore not a direct measurement of an atom-scale vortex-core cross-section. The authors estimate the tracer flakes to be below 1 μm in diameter, while the vortex-core diameter is of order 1 Å. The optical readout tracks the decorated line pattern in a 150-μm depth-of-field slice. It does not reconstruct the full 3D lattice or resolve the finite core.

The lattice orientation relative to the observation plane creates a known projection interval:

\[
\delta_{app}\in[\delta_F\cos(\pi/6),\,\delta_F].
\]

The main article explicitly states that all measured points lie between these limits. Its Fig. 2 caption correctly identifies 1.047 rad/s as 10 rpm; the Fig. 3 caption also contains a conflicting parenthetical label that calls 1.047 rad/s “1 rpm” while separately identifying 1.047×10⁻¹ rad/s as 1 rpm. The latter is the correct 1-rpm conversion. This caption inconsistency is a plausible source of row-assignment error.

For 10 rpm,

\[
\Omega=2\pi(10/60)=1.047197551\;\mathrm{rad\,s^{-1}},
\]

so the recalculated central prediction is

\[
\delta_F=218.173946\;\mu\mathrm m,
\qquad
\delta_{app,min}=188.944180\;\mu\mathrm m.
\]

With the reported 2% \(\Omega\) uncertainty, the leading relative uncertainty in \(\delta_F\) is approximately 1%, or 2.18 μm; the CODATA/helium-mass contribution is negligible by comparison.

The earlier Kestrel report's 187.1-μm lower bound does not reproduce from the 10-rpm input; 188.944 μm is the corrected value. Its 175.8 ± 9.0 μm Table-S1 value was not re-extracted here with a verified row/rotation-rate association. The supplementary PDF containing Table S1 was blocked by the PMC reCAPTCHA in this run. Since the article itself says all points lie inside the orientation interval, the alleged 10-rpm anomaly is **withdrawn / NOT REPRODUCED** until the exact Table-S1 row and image/film aggregation are directly checked. Do not interpret the 9-μm dispersion as a standard error or assign statistical significance without the number and dependence structure of independent films/images.

## 6. Explicit geometric/readout maps

These are standard-physics comparator maps, not an H(s)H derivation:

\[
\text{ion motion}
\to(\nu_+,\nu_-,\nu_z)
\to\nu_c
\to R_{\rm cyclotron}
\to A_r(^{4}He)
\to m(^{4}He)
\to\kappa_{He}.
\]

For an ideal common-field Penning-trap comparison, \(\nu_c=qB/(2\pi m)\), so the ratio cancels the shared \(B\). The 2026 FSU paper's measured pair is \(^{4}He^+/{}^{12}C^{3+}\); the abstract alone does not provide its full systematic/covariance analysis.

Separately,

\[
\Gamma_t\cap\Sigma_{laser}
\to I_t
\to G_{2D}(I_t)
\to\widehat\delta(t,\Omega),
\]

where \(\Gamma_t\) is the 3D vortex-line configuration, \(\Sigma_{laser}\) the illuminated slice, \(I_t\) the camera image, and \(G_{2D}\) the Gabor-wavelet readout. The prediction map sends \((\Omega,\kappa_{He})\) to \(\delta_F\), then the lattice/camera orientation to the projected interval. The reverse map is non-unique without orientation and full spatial information.

Do not collapse these geometries:

- a trapped ion supplies a point-particle worldline and a frequency readout, not a measured finite-core worldtube;
- a vortex line has a finite microscopic core, but the reported optical experiment resolves tracer-decorated lines, not that core cross-section;
- a spatial line swept through time is a worldsheet; a finite 3D core region swept through time would be a 4D worldvolume. The present experiment does not measure the latter directly.

The SAT-O/Blockwave source ontology is not altered here. The existing Ariadne worldline/worldtube/timesheet fidelity report and Aster source addendum are secondary source-navigation artifacts, not a substitute for a new Mersearch recovery of the original equations. No new SAT-O or Blockwave equation was transcribed, corrected, or promoted in this addendum. WWRD climbing-rope mechanics remains a first-blush geometric heuristic, not a physical equivalence.

## 7. Formalization, geometry gate, and project status

A clean conditional Lean target is the common-field ratio identity:

\[
\frac{\nu_c^{(1)}}{\nu_c^{(2)}}
=\frac{q_1m_2}{q_2m_1}
\quad\text{when both ions experience the same }B.
\]

This is a standard algebraic consequence of the Penning-trap frequency model. It is a formalization target only; **LEAN_NOT_RUN** for this addendum. No new Lean module, branch, PR, or CI run was created.

The existing Kestrel PR #873 was checked at exact head `03f126340ad4b9c6c62b45ff7f794a390e0bde30`, workflow run #41758925555. The projected-incidence and Kelvin-vortex readout modules built, but the overall build failed in KestrelMovingSlice with unresolved goals and remaining `sorryAx` declarations. The generic fiber-compatibility result is conditional mathematics; it does not establish that the physical readout map satisfies its assumptions or validate the He-II measurements.

This addendum supplies no precise system-specific geometric plot and no independent hostile review. Status remains **GEOMETRY_NOT_SUPPLIED / GEOMETRY_REVIEW_PENDING / NOT FACTORY-FLOOR ELIGIBLE**. No H(s)H theory, BEDROCK, paper, or P2 candidate status is promoted.

## 8. Mersearch, publication, and next cursor

All four Mersearch request lanes remain occupied; the current request records are not free slots. No new request was added, overwritten, released, or executed. The completed lane-3 output remains under its current control restriction and was not used to recover exact SAT-O/Blockwave equations. This addendum uses already-available internal orientation/source-fidelity reports plus direct external primary sources; it is not represented as exhaustive Mersearch.

The existing Sable receipt and Sable-to-Loom optional-context handoff remain intact. Their receipt run ID differs from the current automation run ID; this file is an addendum, not a second receipt. No new Loom handoff was created, and no Loom-thread delivery or acknowledgment is claimed.

The candidate note on issue #1339 already exists; no duplicate issue/comment or public submission was made. This note remains preflight-only because the Table-S1 row identity and the 2026 FSU full uncertainty/covariance record remain unavailable. Paper gates remain separate: P1 November 9, P2 November 30 (still HOLD), P3 December 14.

**Next bounded cursor:** retrieve the exact Peretti Supplementary Table S1 bytes through an authorized non-reCAPTCHA route; reconcile each row with the Fig. 3 rotation labels; obtain the full 2026 FSU error budget/covariance when the accepted manuscript becomes available; then, only if the project interlock clears, compare the measured projected spacing against the recalculated Feynman band. No physical anomaly is presently established.

### Sources inspected

1. Mohr et al., CODATA 2022 adjustment, Rev. Mod. Phys. 97, 025002 (2025), DOI 10.1103/RevModPhys.97.025002; full NIST-hosted PDF inspected.
2. NIST CODATA 2022 constants database, version 9.0; 2026-adjustment publication cutoff notice inspected.
3. Sasidharan et al., LIONTRAP helium-4 mass measurement, Phys. Rev. Lett. 131, 093201 (2023), DOI 10.1103/PhysRevLett.131.093201; open full text inspected.
4. Medina Restrepo et al., FSU helium-4 cyclotron ratios, Phys. Rev. A 112, L040801 (2025), DOI 10.1103/v7k8-8my2; abstract inspected.
5. Fernandez Davila et al., FSU helium-4 / carbon cyclotron ratio, Phys. Rev. Lett. 137, 053001 (2026), DOI 10.1103/xzmk-r533; abstract and publication metadata inspected.
6. Peretti et al., rotating superfluid helium vortex lattice, Science Advances 9, eadh2899 (2023), DOI 10.1126/sciadv.adh2899; main article inspected. Supplementary Table S1 PDF not retrieved.
7. Internal HsH: current Sable Lane 24 systems-triage report; Sable :24 receipt and Loom handoff; current BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, onboarding/revival controls, and the Ariadne worldline/worldtube/timesheet fidelity report.


## Independent arithmetic and source-readout correction (2026-11-04 07:19Z)

A separate recomputation found a digit transposition in the independence-only relative-uncertainty value in §4. Using the displayed parenthetical uncertainties:

- (u_r(m_u)=0.52\times10^{-36}/(1.66053906892\times10^{-27})=3.1315131919\times10^{-10}).
- (u_r(A_r(^{4}\mathrm{He}))=0.000000000036/4.002603254665=8.9941464866\times10^{-12}).
- Independence-only quadrature: (sqrt{u_r(m_u)^2+u_r(A_r)^2}=3.1328045484\times10^{-10}), rounded (3.133\times10^{-10}). The earlier (3.123\times10^{-10}) was a transposition.
- First-order triangle bound: (3.2214546568\times10^{-10}). The printed (3.222\times10^{-10}) remains a conservative rounded upper bound.
- Corresponding (u(\kappa)): (3.1231848394\times10^{-17}\,\mathrm{m^2/s}) under independence; conservative first-order bound (\leq3.2115627354\times10^{-17}\,\mathrm{m^2/s}).

The quadrature result is conditional on zero covariance. It is not an evaluated combined uncertainty: the covariance between the 2026 FSU neutral-helium relative-mass result and CODATA 2022 (m_u) was not supplied in the accessible source. The conservative first-order bound is the defensible upper bound under the stated inputs. CODATA 2022 Table I's three quoted correlations are pairwise among the AMDC input masses: (r(^{28}\mathrm{Si},^{87}\mathrm{Rb})=0.0678), (r(^{28}\mathrm{Si},^{133}\mathrm{Cs})=0.0630), and (r(^{87}\mathrm{Rb},^{133}\mathrm{Cs})=0.1032). They are not the missing covariance with the 2026 helium result.

The 2023 LIONTRAP paper reports (36\times10^{-12}\,u) statistical, (31\times10^{-12}\,u) systematic, and (48\times10^{-12}\,u) total uncertainty. Its systematic budget is 7.84 ppt, dominated by the dip-lineshape contribution (7.11 ppt); image charge contributes 3.29 ppt, with relativistic, magnetic-inhomogeneity, and electrostatic-anharmonicity terms of 0.31, 0.19, and 0.13 ppt. The 2026 FSU abstract reports (36\times10^{-12}\,u), but its full paper/systematic breakdown is not yet accessible; APS lists the full article as available 2027-07-28.

The PMC full-text record for the 2023 rotating-superfluid experiment confirms the Feynman spacing law, the orientation envelope ([\delta_F\cos(\pi/6),\delta_F]), and that all plotted measurements lie within that envelope. It also clarifies that the vertical dispersion combines temporal spacing dispersion and bimodal-fit dispersion, not a standard error of an independent ensemble mean. Figure 3's caption labels 1.047 rad/s as 1 rpm; Figure 2 and the text identify 1.047 rad/s as 10 rpm, so the Figure 3 label is a typo. The supplementary Table S1 PDF remains blocked at retrieval; no row-level re-extraction of the earlier 175.8±9.0 μm value was made. The earlier 10-rpm anomaly is therefore withdrawn. The corrected 188.944 μm lower projection bound is a recalculation correction, not a physical change caused by the new helium mass.

Sources: [CODATA 2022 adjustment](https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=958143); [LIONTRAP 2023 full paper](https://link.aps.org/doi/10.1103/PhysRevLett.131.093201); [FSU 2026 publication record](https://link.aps.org/doi/10.1103/PhysRevLett.137.053001); [Peretti et al. 2023 PMC full text](https://pmc.ncbi.nlm.nih.gov/articles/PMC10381927/).
