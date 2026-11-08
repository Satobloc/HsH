# Closed-loop versus open-column vortex geometry: finite-core readout and mean-flow scale audit

**Relay:** \`REVROT3-19-20261011:678:s2\`; nominal hour \(h=678\), \(seq=5h+2=3392\), ring index 10 = Nadir Voss, successor index 11 = Enheduanna.  
**Preparation class:** current-assistant, source-grounded reconstruction under a deterministic ring label. No authenticated historical Nadir instance/thread is claimed. No standalone Nathan-authored Nadir specialist charter was recovered.  
**Disposition:** MEASURED-SYSTEM COMPARATOR / FIT-CONDITIONED KINEMATIC DERIVATION / OBSERVATION-MAP LIMITS IDENTIFIED / NO H(s)H PHYSICAL MAP / NO INFORMATION-CONSERVATION LAW / NO THEORY PROMOTION.

## 1. Why this is a distinct addition

This note narrows the existing cross-study gate rather than repeating it:

- HsH issue [#1467](https://github.com/Satobloc/HsH/issues/1467): Scheeler et al. (2017) measurement and notation fidelity.
- HsH issue [#1470](https://github.com/Satobloc/HsH/issues/1470): cross-study transferability gate for the 2017 and 2026 vortex readouts.
- HsH issue [#1472](https://github.com/Satobloc/HsH/issues/1472): observer-history accessibility and joint-record identifiability.
- HsH issue [#1477](https://github.com/Satobloc/HsH/issues/1477): BEC/worldtube/helicity object-type and boundary-fidelity audit.

The new discriminator is the **closed-loop versus boundary-attached column geometry**, together with a measured-parameter calculation separating a mean-flow particle path from a Kelvin-wave deformation.

## 2. Four different geometrical objects must not be called simply “the helix”

### A. Scheeler et al. (2017): closed vortex loops

The experiment generated two closed vortex configurations in water:

1. A helical vortex loop leapfrogging with a planar vortex ring.
2. An isolated helical vortex loop.

In the stretching configuration, the helical loop was initially generated inside a larger concentric planar ring. In the compression configuration, a smaller concentric planar ring was generated inside the helical loop. The planar ring is writhe-free in the reported evolution.

The thickened neighborhood of a closed centerline is torus-like, but the paper's “twisted rope” is a bundle-of-vortex-lines visualization, **not a material rope experiment**. It distinguishes:

- **Writhe:** coiling of the vortex-tube centerline.
- **Twist:** local winding of vortex lines around that centerline.
- **Linking:** winding of one tube's field lines around another tube.

These are distinct contributions. The helical centerline is not itself the internal twist.

The paper gives
\[
H=\int \mathbf u\cdot\boldsymbol\omega\,dV
 =\sum_{i\ne j}\Gamma_i\Gamma_j Lk_{ij}
 +\sum_i\Gamma_i^2(Tw_i+Wr_i).
\]
Its experimentally accessible centerline-flow reduction is conditional: the tubes must be sufficiently thin and winding must vary minimally across each cross-section. The paper explicitly says linking and writhe can be inferred from centerlines, while twist and total helicity otherwise require flow information inside the tubes. Its Stokes argument refers to a surface spanning the **closed vortex loop**.

Primary source: Scheeler et al., *Science* 357, 487–491 (2017), DOI [10.1126/science.aam6897](https://doi.org/10.1126/science.aam6897).

### B. Barckicke, Falcon & Gissinger (2026): a finite free-surface vortex column

This is not a second torus. It is a stable, approximately rectilinear air-core vortex extending from a flat free surface to a drain hole, with a typical height of 40 cm. The air-core radius is approximately 1 mm near the drain and 2 mm halfway up, widening near the free surface. The spectral measurement window is 12.5 cm in \(z\), centered near \(z=22\) cm.

The experiment distinguishes at least two Kelvin-wave deformations:

- \(m=1\): helical bending/displacement of the vortex axis, with approximately constant core radius.
- \(m=2\): a fluted or flattening mode, with core-radius modulation and a double-helix appearance, without displacement of the axis.

Neither is identical to the 2017 loop's internal twist or centerline writhe. The \(m=1\) wave is a propagating deformation of the column; the \(m=2\) mode deforms the core cross-section.

Primary source: Barckicke, Falcon & Gissinger, *Nature Physics* (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w).

### C. A third helix: the mean-flow path of a fluid element

The 2026 paper's local Rankine-core model has solid-body azimuthal rotation inside the core and uniform downward axial flow. A fluid element following that local mean flow at \(r\approx a_0\) traces a **monotonic helix**. This is not the Kelvin-wave phase line and not the vortex-core centerline.

For the mean-flow model,
\[
\Omega_0=\frac{\Gamma}{2\pi a_0^2},\qquad
p=\frac{2\pi v_z}{\Omega_0}
 =\frac{4\pi^2a_0^2v_z}{\Gamma},
\]
where \(p\) is the axial pitch per material revolution.

Published Fig. 3 fit values, reported as consistent with independent measurements:
- \(a_0=1.9\ \mathrm{mm}\), from contour detection;
- \(\Gamma=0.022\ \mathrm{m^2\,s^{-1}}\), fit value checked against PIV;
- \(v_z=0.57\ \mathrm{m\,s^{-1}}\), fit value checked against PTV.

The paper reports \(\delta\Gamma\simeq5\times10^{-3}\ \mathrm{m^2\,s^{-1}}\) from PIV measurement uncertainty/axial variability and \(\delta v_z\simeq0.05\ \mathrm{m\,s^{-1}}\) from PTV. There is a radius-uncertainty wording difference: Methods gives a typical contour uncertainty of about 0.1 mm, while Extended Data Fig. 4 describes the mean-radius uncertainty as negligible. No joint covariance matrix is supplied.

Using the central published fit values:
- \(\Omega_0=969.9\ \mathrm{s^{-1}}\);
- rotation period \(2\pi/\Omega_0=6.48\ \mathrm{ms}\);
- mean-flow pitch \(p=3.69\ \mathrm{mm}\);
- transit time across the 12.5 cm spectral window, \(L/v_z=0.219\ \mathrm{s}\);
- nominal revolutions during that transit, \(L/p=33.9\).

A conservative rectangular sensitivity envelope using \(\delta\Gamma=0.005\ \mathrm{m^2\,s^{-1}}\), \(\delta v_z=0.05\ \mathrm{m\,s^{-1}}\), and \(\delta a_0=0.1\ \mathrm{mm}\) gives:
- \(\Omega_0\in[676,1326]\ \mathrm{s^{-1}}\);
- \(p\in[2.46,5.76]\ \mathrm{mm}\);
- \(L/p\in[21.7,50.7]\);
- \(L/v_z\in[0.202,0.240]\ \mathrm{s}\).

These are **sensitivity bounds, not confidence intervals**. If the Extended Data statement of negligible mean-radius uncertainty is used instead, the pitch envelope narrows to 2.74–5.20 mm and the turn count to 24.0–45.5. No covariance was assumed or invented.

This is a model-conditioned kinematic scale derived from published fit values consistent with measurements. It is **not** an independent prediction, not a measured particle trajectory, and not the Kelvin-wave pitch. The actual raw Figshare files were not retrieved, so no raw-data reanalysis is claimed.

Reproducible calculation used:
    import math
    a0, Gamma, vz, L = 1.9e-3, 0.022, 0.57, 0.125
    Omega0 = Gamma / (2 * math.pi * a0**2)
    pitch = 2 * math.pi * vz / Omega0
    t_adv = L / vz
    turns = L / pitch

## 3. The 2026 observation map: which step actually loses information?

The paper defines two scalar channels from the opposing contour radii:
\[
\eta(z,t)=\frac{r_0-r_\pi}{2},\qquad
a(z,t)=\frac{r_0+r_\pi}{2}.
\]
The inverse is exact:
\[
r_0=a+\eta,\qquad r_\pi=a-\eta.
\]

Thus the transformation from the **two sampled radii** \((r_0,r_\pi)\) to \((\eta,a)\) is bijective. It loses no information about those two samples.

The potentially lossy step is upstream:
\[
\text{full 3D core/interface}
\longrightarrow
\text{two antipodal contour samples}
\longrightarrow
(\eta,a)
\longrightarrow
(S_\eta,S_a).
\]
Two angular samples do not encode an arbitrary cross-sectional shape. Under the paper's single-harmonic radial ansatz, the antipodal pair aliases \(m\) with \(m+2\). A deterministic downstream classifier cannot restore a mode distinction already collapsed by those samples.

This conditional algebra is already formalized in Nadir's [PR #1189](https://github.com/Satobloc/HsH/pull/1189), file \`NadirVortexTwoChannelReadout.lean\`. Exact-head GitHub Actions run #42114292197 succeeded on head \`cef7e8ab994973c4a91fd87aa0afa315c5d23b07\` using Lean 4.34.0. The module proves the two-radius transform/inverse, its injectivity, and the \(m\leftrightarrow m+2\) alias under the declared ansatz. It explicitly does **not** formalize camera projection, contour detection, PIV/PTV calibration, the complete 3D core, the Rankine constitutive model, or Kelvin-wave dynamics. The PR remains open, draft, and unmerged.

There is also a source-description discrepancy: the Results text says “two orthogonal cameras,” while Methods describes one optical camera normal to the vortex axis, using two lenses for complementary views. Until the acquisition record resolves this, do not assume that a second orthogonal camera supplies an independent angular view.

The 2017 instrument chain is different: 3D laser-scanning tomography and dye tracers inside the core provide centerline-flow tracks; PIV separately supplies circulation. Under the stated thin-core condition this is sufficient for total helicity, but it is not a measurement of molecular microstates.

## 4. Closed-loop versus boundary-attached helicity

The 2017 centerline decomposition is presented for closed vortex loops and uses a spanning surface. The 2026 experiment measures a finite, boundary-attached column between the free surface and drain. The full vorticity field may have additional closure structure, but the paper does not specify a closed-loop centerline representation for this column or report a global helicity budget and boundary helicity flux.

Therefore the 2017 closed-loop \(Tw+Wr+Lk\) decomposition must **not** be transferred directly to the 2026 column. A global comparison would need a source-defined closure/reference construction or an explicitly measured boundary-flux budget. Open-curve frameworks exist, but they are not interchangeable:

- Berger (1985), relative-helicity linkage for magnetic field lines rooted at planes, DOI [10.1080/03091928508245446](https://doi.org/10.1080/03091928508245446): magnetic-field result, not a fluid-vortex law.
- van der Heijden, Peletier & Planqué (2003), link/writhe for open mechanical rods with end-rotation treatment: rod mechanics, not fluid mechanics.
- Shen, Yao, Hussain & Yang (2023), differential twist and internal vortex-surface structure for closed vortex tubes, DOI [10.1017/jfm.2023.620](https://doi.org/10.1017/jfm.2023.620): fluid-vortex DNS/theory, not a measurement of molecular microhelicity.
- MacTaggart & Valli (2023), relative magnetic helicity in multiply connected domains, DOI [10.1088/1751-8121/acfd6c](https://doi.org/10.1088/1751-8121/acfd6c): MHD boundary theory, not a direct fluid-vortex transfer rule.

These references show why endpoint framing, closure, reference fields, and boundary conditions matter. They do not establish that a fluid vortex, a mechanical rope, and an H(s)H worldtube share the same constitutive mechanics.

## 5. H(s)H implication: typed maps, not a generic “projection”

A possible experimental map chain is:
\[
W_{4D}
\longrightarrow
\text{declared slice/intersection}
\longrightarrow
\text{3D core/interface}
\longrightarrow
\text{camera and contour readout}
\longrightarrow
(r_0,r_\pi)
\longrightarrow
(\eta,a)
\longrightarrow
\text{spectra}.
\]
Only the final two-radius transform is presently specified and formally proved for the 2026 study. The upstream camera map is only partially described, and no source-authorized map from an H(s)H worldtube/timesheet to this Newtonian fluid system has been identified.

This is a concrete reason to distinguish:
- physical evolution and constitutive mechanism;
- worldtube geometry;
- slice/intersection;
- sensor projection and contour extraction;
- reduced readout;
- downstream analysis.

The experiment does not establish an H(s)H worldtube-helicity invariant, a universal information-conservation law, a radiative/conductive information channel, or medium/timesheet equivalence. It supplies a real comparator and an explicit example of a non-injective observation step.

## 6. Formal, empirical, and tooling status

- Existing Kestrel PR #873 contains the conditional fiber-factorization and joint-readout results. Exact-head run #42153410233 succeeded on head \`1971e3d58a28f7c6de5cf024039dbcedb133121c\`; the generic theorem does not instantiate the physical maps.
- No new Lean theorem or module was added. The new physical camera/worldtube maps are not yet defined. No data-free geometric fixture was executed. The current runtime has no local Lean/Lake binary.
- The 2026 Figshare data DOI is [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347). The raw file inventory, dataset version, acquisition manifest, checksums, covariance package, and raw arrays were not retrieved. No raw-data replay, new fit, or independent prediction is claimed.
- The four shared Mersearch lanes were checked and remain occupied/requested; no lane was overwritten and no new request was submitted. Mersearch was not callable in this runtime. Bounded GitHub search across HsH and the SAT archive was used as fallback. HSH_RESOURCES was consulted as internal reference infrastructure only; no private locator is included here.
- Existing Math Hopper, Whirligig, Lean PRs, and SciSpace were checked before considering new tooling. Math Hopper is an archive/provenance extraction tool; Whirligig is a 3D R/Q sandbox, not a validated 4D worldtube/helicity model. SciSpace was used for bounded literature discovery on open helicity and open-rod formulations. No new tool, dependency, fork, or paid service was created.
- No CODATA constant is used in this calculation; no CODATA comparison is applicable.
- No SAT-O or Blockwave equation was altered; no BEDROCK promotion, branch, PR, paper-gate advancement, or physical theory claim was made.

## 7. Falsifiers and next cursor

1. Retrieve the Figshare files and acquisition manifest; record version, checksums, units, calibration, uncertainties, and covariance.
2. Resolve the one-camera/two-lens versus “two orthogonal cameras” discrepancy from source acquisition records.
3. Determine whether boundary data support a gauge-/closure-specified global helicity budget for the 2026 column. If not, restrict cross-study comparison to local core geometry and Kelvin-mode observables.
4. Define the H(s)H worldtube, timesheet/intersection, responsive-medium state, and sensor/readout maps with explicit domains, codomains, and composition conditions before testing forward geometry-to-equations or reverse equations-to-geometry.
5. Use independent measured observables to falsify the common map; do not tune shared parameters separately to each study.

**Final status:** \`CLOSED_LOOP_2017_VS_BOUNDARY_COLUMN_2026_DISTINGUISHED / MEAN_FLOW_HELIX_SCALE_DERIVED_FROM_FIT / TWO_SAMPLE_READOUT_BIJECTIVE_BUT_UPSTREAM_MAP_LOSSY / RAW_DATA_NOT_RETRIEVED / HSH_WORLDTUBE_MAP_UNINSTANTIATED / NO_NEW_LEAN / NO_PHYSICAL_PREDICTION / NO_CODATA_COMPARISON / NO_BEDROCK_PROMOTION\`.
