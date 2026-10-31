# BEC finite-core vortex: responsive-medium and readout comparator

**Run:** Meridian :24, 2026-10-31T0924Z  
**Run key:** REVROT3-19-20261011:489:s2  
**Status:** SANDBOX / SOURCE-GROUNDED EMPIRICAL COMPARATOR / NOT H(s)H VALIDATION / NOT P2 SYSTEM SELECTION / NO THEORY PROMOTION

This note records a real finite-core medium-vortex experiment relevant to the already-existing Kelvin-vortex/responsive-medium hypothesis. It does not identify the BEC vortex with an SAT worldtube, does not establish a BEC-like physical vacuum, and does not test the worldtube-to-medium coupling.

## 1. Internal-first provenance

### Nathan Direct source witnesses

1. **2026-07-11 03:12:12 EDT**, raw user message **898814a5-79c6-4e26-b0f8-5f7501ef1957**, conversation **DEVELOPMENT_FULL_CONVOS/LONG_CONVOS/26.07.11•26.07.17•Reasoning with SAT-HSH Skill — raw.json**. Verified user-role passage in **WORKSPACES/COMMON/verified_batches/2026-09-13-Reasoning-with-SAT-HSH-Skill-01.md**, blob **0ce3284c4f3c21d9b761953f7c5d2fff24eb0f1a**. Nathan described the worldline/tube as remaining core and proposed Kelvin vortices stirred by it in a BEC-ground-state-vacuum picture. This is a historical proposal, not an established physical mechanism.

2. **2026-09-06 16:55:31.340 EDT**, raw user message **59a38049-e410-455d-afe9-87fcbc6f5264**, conversation **6a9d1a23-4fac-83ea-b76f-6805ece3ee9f**, title **🎼 Ravel [H(s)H] Syncmathcek**. Verified user-role passage in **WORKSPACES/COMMON/verified_batches/2026-09-13-RAVEL-SPRING-WORLDTUBE-03.md**, blob **cc630c4c8d1c64c194f87162065d47228d787c8c**. Nathan explicitly kept a medium Kelvin-vortex or timesheet-bound soliton alternative in the exploratory joint charge/gravity picture. The passage uses tentative language and leaves the mechanism unresolved.

The current BEDROCK rule (blob **38a5b8f4c9d573e54ca4a449be70d0a7d94a484c**) treats the existing Kelvin-vortex or justified equivalent response as an active, falsifiable constraint. Current AGENTS.md (blob **ae4ac6831f0878845875acb8daab278d2a937836**) requires strict physical-object separation: an ordinary-fluid vortex core in a responsive medium is distinct from the SAT Kerr-associated worldtube. No equation or object identity is transferred by vocabulary alone.

### Mersearch boundary

The four shared Mersearch request lanes were all occupied (status: requested); no lane was overwritten or retriggered. No Mersearch executable/tool was available in this runtime, and no local repository checkout existed. A bounded direct search was performed only in the HsH repository, followed by direct reading of the identified verified batches. SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES were not comprehensively searched in this run. This is not an exhaustive internal-source recovery or prior-art clearance.

No SAT-O or Blockwave equation was altered, reconstructed, or newly attributed in this note.

## 2. Primary measured system A: filled and bare vortex cores in a dilute-gas BEC

**Primary source:** B. P. Anderson, P. C. Haljan, C. E. Wieman and E. A. Cornell, “Vortex precession in Bose-Einstein condensates: observations with filled and empty cores,” arXiv:cond-mat/0005368; Physical Review Letters 85, 2857 (2000).

The experiment used approximately \(10^6\) \(^{87}\mathrm{Rb}\) atoms in a spherical trap with 7.8 Hz oscillator frequency. Two internal states were used: one supported a singly quantized vortex, while the other filled its core. A rotating off-resonant laser imprinted the phase winding; resonant light pressure then removed some or all of the filling component.

Reported conditions and observations:

- The bare-core healing length was reported as \(\xi=0.65\,\mu\mathrm m\), below the in-trap imaging resolution. This \(\xi\) is calculated from peak density and scattering length, not a direct radius measurement.
- Filled cores contained roughly 10–50% of the atoms and had fitted HWHM radii \(r=7\xi\) to \(13\xi\). The trapped-condensate radius was typically \(R_t\approx22\,\mu\mathrm m\).
- Successive nondestructive phase-contrast images (up to ten per vortex) were fitted with a Thomas–Fermi background and Gaussian core profile. The fitted core angle versus hold time gave a filled-core example of \(1.3(1)\,\mathrm{Hz}\); the filled-core data cluster around \(1.4\,\mathrm{Hz}\).
- Bare-core precession was measured by comparing an in-trap image with a later image after core filling was removed and the cloud ballistically expanded. The reported bare-core frequency was \(1.8(1)\,\mathrm{Hz}\).
- The paper states that the precession-frequency range changes by only about a factor of two as the core is reduced by as much as a factor of thirteen.
- The paper calculates the local fluid-rotation rate at the core radius from quantized azimuthal velocity divided by circumference: about \(260\,\mathrm{Hz}\) for a bare core and \(1.7\,\mathrm{Hz}\) for the largest filled cores. This is a derived local rate, not an independent rotation measurement.
- The paper attributes the slower filled-core precession to the negative buoyancy of the filling component counteracting the outward vortex-flow buoyancy through the Magnus response. Thermal drag is a separate effect.

**Readout failure is physically important:** bare cores were not visible in expanded images after hold times above about 1.1 s, despite no observed radial drift toward the condensate surface. A separate assay of the \(m=\pm2\) surface-mode splitting verified that the vortex remained present after its core ceased to be visible. Thus image non-detection was not equivalent to vortex disappearance.

### Executed arithmetic

Inputs below are the paper's rounded reported summaries; no raw image series or covariance matrix was available.

\[
\frac{260}{1.7}=152.941176\ldots
\]

The local-rate ratio is therefore about 153, consistent with the paper's rounded factor 150.

For a singly quantized vortex, the standard relation is \(v_\theta=\hbar/(mr)\), so the local angular rate is \(\nu_r=v_\theta/(2\pi r)=\hbar/(2\pi m r^2)\). Therefore the reported maximum radius factor 13 would imply a local-rate factor \(13^2=169\) under that same relation. Conversely, the rounded rate ratio implies a radius ratio

\[
\sqrt{152.941176}=12.3669.
\]

This is compatible with the reported “up to 13” range. It is **not an independent validation**: the local-rate values were calculated from the same quantized-circulation relation and core radii. The approximately 9.5% difference between \(169\) and \(152.94\) is not a statistical residual; the source values are rounded and the extrema need not be the same fitted pair.

The paper's “factor of two” precession change against a roughly 153-fold local-rate change is a descriptive contrast, not a fitted constitutive law. The typical central values \(1.8/1.4\approx1.286\) are also only descriptive because the 1.4 Hz cluster has no quoted aggregate uncertainty. The example \(1.3(1)\) Hz and bare \(1.8(1)\) Hz come from different measurement procedures; no covariance is supplied, so no combined significance is claimed.

For orientation only, \(13\xi=13(0.65\,\mu\mathrm m)=8.45\,\mu\mathrm m\) nominally. The paper does not give an uncertainty for the quoted \(\xi\) in the passage used here, so this is not an uncertainty-qualified physical boundary.

## 3. Primary measured system B: equilibrium vortex-core imaging and lattice properties

**Primary source:** E. Coddington et al., “Experimental studies of equilibrium vortex properties in a Bose-condensed gas,” arXiv:cond-mat/0405240; Physical Review A 70, 063607 (2004).

This is a related JILA/NIST-era study, not an independent-laboratory replication of system A. It examines vortex-lattice spacing and core sizes over atom number and rotation conditions, using in-trap measurements, expansion, Thomas–Fermi background fits, two-dimensional Gaussian core fits, and Gross–Pitaevskii (GPE) simulations.

Important distinctions:

- The experimental \(r_v\) is an RMS radius of a two-dimensional Gaussian fit. The 2000 study's \(r\) is a Gaussian HWHM radius. For the same ideal Gaussian, RMS/FWHM \(=0.60\) and HWHM/FWHM \(=0.50\), so RMS/HWHM \(=1.20\). This is a definition conversion only; the different experiments and profiles must not be merged as if they were one dataset.
- The value \(r_v=1.94\xi\) is a three-dimensional GPE simulation result, **not a measured universal core radius**.
- Measured core radii were systematically larger than that theoretical result; the authors discuss a discrepancy reaching roughly 25% at smaller radii/high density, but do not resolve it as new physics.
- Axial expansion was identified as a major imaging systematic, capable of producing up to about 10% error in core radius. Other imaging and selection effects remain.
- Only about 30% of visible vortices met all final quality cuts in a representative regime; the accepted fraction varied strongly with vortex number and position.
- The paper reports vortex-lattice spacing changing by less than 2% across a region where atom density varied by about 35%; this is a separate measured feature and not a core-radius result.

The experimental core radius is therefore an image-derived estimator, not automatically the support radius of a physical core. The GPE result and measured estimator must remain separate.

## 4. CODATA and input provenance before comparison

The dimensionless comparisons above use ratios within the same \(^{87}\mathrm{Rb}\) isotope. In the quantized-vortex local-rate ratio, the common factor \(\hbar/m_{^{87}\mathrm{Rb}}\) cancels. **No CODATA adjusted value or CODATA covariance was used in the arithmetic above.**

As of this run, the current NIST recommended set is CODATA 2022 (published in 2025, based on data through 2022-12-31); the next adjustment is scheduled for 2026. The 2000 and 2004 BEC papers predate that adjustment. If absolute rates or healing lengths are reconstructed later:

- \(h\) is exact in the SI.
- The \(^{87}\mathrm{Rb}\) atomic mass should be sourced from the Atomic Mass Evaluation (AME), not casually treated as a CODATA-only measurement.
- The scattering length \(a\) must be tied to its specific atomic-interaction measurement/evaluation and uncertainty.
- Peak density and its extraction from the trap images must be recovered.
- The joint covariance of density, scattering length, expansion calibration, and fitted core radius is not available in the papers inspected here.

No absolute recalibration was attempted. No covariance was invented.

## 5. Typed geometry and the missing H(s)H map

For the laboratory BEC, let \(M_{\rm BEC}=\mathbb R_t\times\mathbb R^3\) with its nonrelativistic laboratory time coordinate. Distinguish:

- \(\Gamma_v^2\subset M_{\rm BEC}\): the history of the one-dimensional vortex centerline.
- \(V_{\rm core}^4\subset M_{\rm BEC}\): the spacetime history of the finite three-dimensional core region.
- \(\Sigma_t^3=\{t\}\times\mathbb R^3\): a laboratory equal-time slice.
- \(L_t^1=\Gamma_v^2\cap\Sigma_t^3\): the instantaneous vortex centerline.
- \(C_t^3=V_{\rm core}^4\cap\Sigma_t^3\): the instantaneous finite core volume.
- \(P_{\rm phase}\): the imaging/projection operator from condensate density/phase to a two-dimensional phase-contrast image (or, for the bare-core procedure, an expanded-cloud image).
- \(F_{\rm fit}\): the Thomas–Fermi/Gaussian fitting operation that returns image-derived estimators such as HWHM radius, centroid displacement, and angle.
- \(\omega_{\rm prec}=d\hat\theta/dt\): the fitted precession readout.

The composition \(F_{\rm fit}\circ P_{\rm phase}\) is not injective over all physical vortex states: the experiment itself shows a vortex can remain present while the core is no longer visible in the chosen image channel.

The SAT Kerr-associated worldtube \(W_{\rm SAT}^4\) is a **different object** from both \(\Gamma_v^2\) and \(V_{\rm core}^4\). The required coupling from \(W_{\rm SAT}^4\) to a responsive-medium vortex state is still missing. The BEC experiment does not test that coupling: its vortex was prepared by laser-imprinted phase winding, not by a separate SAT worldtube. The laboratory equal-time slice is also not identified with the H(s)H propagating timesheet.

This is therefore a real empirical comparator for the **medium-vortex response and observation subchain**, not evidence for the full H(s)H construction, not a Kelvin-wave dispersion measurement, and not a physical equivalence between BEC and H(s)H vacuum.

## 6. Lean / formalization status

Existing Kestrel **KestrelReadoutComposition.lean** was checked on PR #846 at branch head **5340af49f3a3cace8e5a749dd3ac1d62ecafbe97**, Actions run #40902356693, job #123548605229. Lean 4.34.0 built 8,949 jobs. The complete retrieved job log contained zero **sorryAx** occurrences and theorem-specific outputs for:

- inclusion survives a forward map;
- reverse inclusion requires injectivity;
- upstream non-injectivity survives readout;
- composed injectivity requires both maps.

These are generic conditional set-map results, not a formalization of the BEC imaging apparatus or the H(s)H coupling. No BEC-specific Lean module was created: the actual image operator, raw data, and covariance are not sufficiently specified to formalize a faithful physical proposition. The existing Kestrel PR was not modified.

## 7. Disposition and next evidence gate

- **Measured:** reported BEC core/precession summaries and image-based vortex observations.
- **Derived:** local rotation rates from quantized circulation and fitted core radii; ratios above.
- **Model:** GPE/Thomas–Fermi descriptions and buoyancy/Magnus interpretation.
- **Not measured here:** an H(s)H worldtube-to-medium coupling, an H(s)H prediction, a universal core law, or a CODATA-derived numerical result.
- **Missing:** raw images/time series, machine-readable point data, full covariance, density/scattering-length provenance needed for absolute reconstruction.
- **Not done:** new Lean module, new branch/PR, manuscript edit, paper-gate advancement, BEDROCK promotion, or theory promotion.

The next valid step, if this comparator is selected after the current presentation interlock, is to recover the original image/fit data and uncertainty/covariance, reconstruct the measurement operator, and test the same frozen medium-response relation against a genuinely different measured vortex system (for example the already-docketed He-II tracer-ring study) without retuning. Only after that could a separate, explicitly derived \(W_{\rm SAT}^4\to V_{\rm medium}\) coupling be tested.

The WWRD climbing-rope mechanics was not used. No rope universality is claimed.
