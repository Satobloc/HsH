# H945:s3 — Kelvin-vortex parameter provenance and holdout eligibility

**Run key:** `REVROT3-19-20261011:945:s3`  
**Nominal slot:** 2026-11-19 09:36 UTC  
**Selected ring label:** Mercer (index 16); next label Ravel (index 17)  
**Participation class:** assistant reconstruction under the deterministic Mercer label; no authenticated historical Mercer instance or current Mercer ChatGPT thread is claimed.  
**Lane:** one-run Lane 36 architecture/prediction overlay. Mercer’s standing P0 Paper A/B presentation-QA assignment is unchanged.

## 1. Substantive improvement

Added a source-specific **parameter-provenance DAG and spatiotemporal holdout-eligibility overlay** to the existing P2 Kelvin-vortex comparison matrix. This is not a new schema, evidence axis, gate, physical mechanism, PR, or theory promotion.

The new distinction is operational:

- A parameter may be a measured input, a fitted output, a post-fit check, a calibration quantity, or a holdout outcome. Its symbol alone does not determine its role.
- A measurement channel derived from another channel is not an independent acquisition.
- A post-fit consistency check is not automatically a blind holdout.
- A spatial slice is not a temporal replicate.
- A valid holdout must have no dependency path into any fitted parameter, calibration choice, model/feature selection, observation-map tuning, or decision-rule selection.

The overlay converts source descriptions into an auditable lineage requirement rather than treating every plotted curve or reported parameter as an independent datum.

## 2. Actual system and source boundary

**Measured system:** the controlled macroscopic air-core water vortex and its Kelvin-wave modes described by Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics*, published online 2026-02-10, DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w).

**Data locator:** [Figshare DOI 10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347), cited by the article as the source-data deposit. The raw deposit, exact version, file inventory, file hashes, and run-level identifiers were not retrieved in this activation. The values below are therefore **version-of-record-reported measurements and acquisition metadata**, not a new raw-data analysis or independent measurement.

The paper describes a 21-cm-diameter, 45-cm-tall tank with a roughly 40-cm air-core vortex. The camera measures the two opposite radial contours:

\[
r_0(z,t)=r(z,t,\theta=0),\qquad r_\pi(z,t)=r(z,t,\theta=\pi),
\]

and derives

\[
\eta(z,t)=\frac{r_0-r_\pi}{2},\qquad
a(z,t)=\frac{r_0+r_\pi}{2}.
\]

The inverse is \(r_0=a+\eta,\ r_\pi=a-\eta\). Thus \(\eta\) and \(a\) are two derived coordinates of the same paired contour observations, not two independent acquisitions. Their spectra, including a cross-spectrum, remain derived from that shared source stream.

## 3. Source-reported parameter roles

The Methods section states that the measured mean core radius \(a_0=\langle a(z)\rangle_z\) is used first; the dispersion data are then fitted with equation (2) using the best pair \((\Gamma,v_z)\); the fitted pair is checked *a posteriori* against measured values from Extended Data Figs. 2 and 3.

| Quantity | Source-defined origin | Role in the published dispersion comparison | Independence status |
|---|---|---|---|
| \(a_0\) | Mean of contour-derived \(a(z)\) over the vertical camera field | Measured input to the dispersion fit | Derived from the same contour channel family; not an independent acquisition from \(\eta\) |
| \(\Gamma_{\rm fit}\) | Best pair fitted to dispersion data | Fit output | Not an independent prediction |
| \(v_{z,\rm fit}\) | Best pair fitted to dispersion data | Fit output | Not an independent prediction |
| \(\Gamma_{\rm PIV}\) | PIV azimuthal-velocity profile, \(\Gamma=2\pi r v_\theta(r)\) | A posteriori measured consistency check | Separate modality; exact acquisition/run join and shared calibration covariance not retrieved |
| \(v_{z,\rm PTV}\) | PTV tracking at \(r=a(z)\) | A posteriori measured consistency check | Separate tracking channel, but the paper says it uses the same imaging technique as contour detection; independence is not established |
| \(\eta,a,S_{\eta\eta},S_{aa},S_{\eta a}\) | Opposite-side contour pair and derived Fourier products | Readout channels/statistics | Derived from shared camera observations; not independent sample sets |

The paper reports the following representative fitted pairs:

| Mode | \(a_0\) measured input | \(\Gamma_{\rm fit}\) | \(v_{z,\rm fit}\) |
|---|---:|---:|---:|
| \(m=1\), Fig. 3 | 1.9 mm | 0.022 m² s⁻¹ | 0.57 m s⁻¹ |
| \(m=2\), Fig. 4 | 2.2 mm | 0.011 m² s⁻¹ | 0.85 m s⁻¹ |

These are source-reported fit/readout values, not values recalculated from the Figshare files. The paper reports PIV circulation uncertainty of about 0.005 m² s⁻¹ and PTV vertical-velocity uncertainty of about 0.05 m s⁻¹. It describes the fitted pair as consistent *a posteriori* with those measured values. That is a source-reported consistency check, not evidence that the PIV/PTV observations were a blinded holdout or an independent-laboratory replication. For scale only, the typical local 0.1 mm contour-measurement uncertainty is 5.26% of the 1.9 mm \(m=1\) nominal radius and 4.55% of the 2.2 mm \(m=2\) nominal radius. These ratios are not uncertainties on the mean \(a_0\).

The mean \(a_0\) from Extended Data Fig. 4 is reported with negligible measurement uncertainty. Separately, the Methods section gives a typical local core-radius/position measurement uncertainty of about 0.1 mm for the spatiotemporal contour measurements. Do not transfer that local value into an uncertainty on the mean \(a_0\).

A further same-number distinction matters: Fig. 5 reports \(\sigma_a=0.1\) mm as the **RMS physical fluctuation** of the core radius and states that measurement uncertainty on \(a(t)\) is negligible. This is not the same quantity as the typical local contour-measurement uncertainty of about 0.1 mm in the Methods.

## 4. Acquisition arithmetic and sampling-unit correction

The source reports:

- Dispersion contour videos: 30 s at 300 fps, giving **9,000 nominal frames**.
- Radius-PDF acquisition: 10 min at 100 fps, giving **60,000 nominal frames**.
- Position-PDF acquisition: 3 min at 360 fps, giving **64,800 nominal frames**.
- PIV acquisition: 0.1 s at 6,000 fps, giving **600 nominal frames**.

These are frame counts from reported duration × frame rate. They are not effective independent sample sizes.

For the PDF analysis, the paper says the \(a(z,t)\) or \(\eta(z,t)\) signal was sliced into **1,000 discrete spatial values of \(z\)** over 2.5 cm and concatenated into a single temporal file. Those 1,000 \(z\)-slices must not be counted as 1,000 independent temporal replicates. The effective number of independent temporal observations cannot be recovered from the paper’s summary alone; it requires the raw file layout, temporal/spatial autocorrelation, acquisition boundaries, and the actual analysis code.

The reported 60 μm px⁻¹ scale and 0.5 mm contour width describe the optical/readout scale. Neither should be substituted for a covariance model or treated as an H(s)H worldtube-thickness measurement.

Reproducible arithmetic used:

```python
frame_counts = {
    "contour_dispersion": 30 * 300,
    "radius_pdf": 10 * 60 * 100,
    "position_pdf": 3 * 60 * 360,
    "PIV": 0.1 * 6000,
}
# {'contour_dispersion': 9000,
#  'radius_pdf': 60000,
#  'position_pdf': 64800,
#  'PIV': 600}
```

## 5. New holdout and parameter-lineage contract

For each comparison freeze, retain a parameter-use ledger with at least:

`parameter_id`, `symbol`, `units`, `source_observation_ids`, `source_file_hashes`, `acquisition_id`, `derivation`, `role`, `fit_use`, `calibration_use`, `selection_use`, `crosscheck_use`, `uncertainty`, `covariance_group`, `holdout_status`.

The dependency graph is:

```text
camera frames
  -> paired contours (r0, rπ)
       -> η and a
            -> dispersion spectra / fluctuation statistics
            -> measured a0 input
                 -> dispersion fit (Γfit, vzfit)
                      -> a-posteriori comparison with ΓPIV and vzPTV

PIV frames -> vθ(r) -> ΓPIV
PTV tracks -> vzPTV
```

The exact source-file/run joins, shared calibrations, temporal overlap, and covariance between these branches remain unknown until the Figshare package and acquisition manifests are recovered.

**Holdout rule:** any observation or derived product with a dependency path into parameter fitting, instrument calibration, feature/model selection, observation-map tuning, or decision-rule selection is calibration/training evidence for that freeze, not holdout evidence. A new holdout must be an identified acquisition block or predeclared nonoverlapping temporal block with its dependence structure documented. A different \(z\)-slice, a deterministic transform of the same contour pair, or a post-fit check used to tune the model cannot be relabelled as an untouched holdout.

PIV/PTV may remain valuable external measurement checks. They become a valid holdout only if source-level acquisition identities, non-use in tuning, and calibration/covariance separation are demonstrated. A separate modality is not by itself proof of statistical independence.

## 6. H0/H1 comparison matrix update

| Candidate | Shared/frozen quantities | Fit/calibration | Discriminating observable | Standard comparator | Failure/holdout condition |
|---|---|---|---|---|---|
| H0: classical Rankine-core Kelvin model | Measured \(a_0\); source-specific instrument calibration | Fit \((\Gamma,v_z)\) on declared training acquisition | \(S_{\eta\eta}(k,\omega)\), \(S_{aa}(k,\omega)\), and measured velocity profiles | Published equation (2), with its stated assumptions | Predeclared residual/uncertainty rule on an untouched acquisition; no threshold can be set from the summary paper alone |
| H1: finite-core H(s)H target | Same raw acquisitions, shared measured inputs, calibration, and fit budget as H0 | H(s)H observation map must be fixed before holdout; no holdout tuning | A source-derived change in the same native readouts that cannot be absorbed by H0 parameters or calibration | Same H0 equation and identical held-out data | No H1 result until the worldtube/timesheet-to-fluid-to-camera/readout map is explicit and identifiable |
| H1+f: one added twist/contact feature | All H0/H1 shared quantities plus one separately sourced feature parameter | Feature choice and estimation confined to calibration data | A distinct, preregistered change in the projected readout | H0 and H1 without the feature | Feature is optional unless its projected effect is identifiable and survives the same untouched holdout |

For local identifiability, a proposed H1 feature must change the projected observable in a way that cannot be absorbed by the shared H0 parameters, camera calibration, contour extraction, or other declared nuisance parameters. The relevant covariance-weighted sensitivity/identifiability calculation is **not performed**: the raw observations, full covariance, and H(s)H forward/readout map are unavailable. No numerical threshold is invented.

## 7. Geometry status: what is and is not forced

- The experiment and standard H0 comparator require a finite **fluid vortex core**; that is established by the apparatus and the Rankine/hollow-core model.
- The measured fluid-core radius \(a_0\) is not automatically the H(s)H intrinsic worldtube thickness \(\epsilon\).
- The optical contour width \(\delta_{\rm contour}\), the fluid-core radius \(a_0\), any H(s)H intrinsic thickness \(\epsilon\), and any filament/coiling scale \(\ell_f\) remain distinct quantities.
- No explicit H(s)H-worldtube → fluid-vortex → interface → camera-projection → \((\eta,a)\) map has been recovered. Therefore no H(s)H finite-thickness prediction is currently forced by these measurements.
- Additional twist, contact surfaces, or nested geometry remain optional hypotheses until an explicit map produces an independently identifiable observable consequence. No climbing-rope or other geometric analogy is used as a physical equivalence.

## 8. Proof, evidence, and status

This is a source-specific data-lineage and holdout-eligibility result, not a new abstract mathematical theorem. No new Lean module was created. An abstract graph theorem without the real acquisition graph would be a data-free formal calculation and is **BLOCKED_PENDING_NATHAN_PERMISSION**. Existing abstract feature-admission formalization in draft PR #1979 is not empirical evidence and does not authenticate any of the source/data premises.

**P2 remains HOLD.** The Figshare DOI is a locator only; raw files, exact dataset version, acquisition IDs, calibration records, joint covariance, H(s)H forward map, untouched holdout, and independent replication remain unavailable in this run. No raw-data fit, independent prediction, numerical falsification threshold, or independent measurement was produced.

No SAT-O or Blockwave equation was modified. No BEDROCK theory promotion, Factory Floor intake, paper-gate advancement, PR, new tool, dependency, subscription, or automation change.

## 9. Archive, tool, and continuity preflight

- The live HsH BEDROCK, controlling 2026-11-08 Primary Operational Guideline, Steering Charter 2026-10-26, Three-Manuscript Campaign, three-repository onboarding, current workflow orientation, branch map, revival/thread-first rules, worker autonomy protocol, PWH queue, and Mercer README/CONTINUITY/INBOX were read.
- The historical Mercer source was checked against the raw-export locator in the workspace: conversation `6a3a2037-3698-83ea-924d-2cb8c4ac7701`, direct user-role message `bb8ecf64-8863-4ee7-a078-ca8cc4104974`, timestamp `2026-10-01T20:56:07.264Z`, raw export blob `d828fef5352045cb4d9486fdbeabd04043c4c119`. It assigns the historical equations/dimensional-analysis/constitutive-physics/coarse-graining/forces/quantitative-consequences remit. The standing P0 Paper A/B presentation-QA assignment remains controlling outside this one-run Lane 36 overlay. No current authenticated Mercer thread was found.
- HsH, SAT archive, and HSH_RESOURCES root routing documents were read; HSH_RESOURCES `AI_START_HERE` was read, but no private/reference payload was opened. The external Kelvin paper is used only as a standard-physics comparator, not as an H(s)H premise. HsH default branch was `main`; the exact pre-write main-head SHA is recorded in the canonical receipt.
- Mersearch was not executed: no callable Mersearch action or installed `mersearch-stable-1.0` executable/local checkout was available. The four live request files remain occupied/requested; all twelve request-scoped manifest/receipt paths returned 404. No lane was overwritten, retriggered, or released. Tern retains release authority. Bounded GitHub code search is not represented as a Mersearch result.
- Math Hopper #578 remains open and PR #991 draft; Whirligig Kernel 0 remains SANDBOX ONLY. SciSpace is available but unnecessary for this source-specific audit. The available fork-list endpoint did not return a usable inventory; no fork was created or modified. No new tool, dependency, subscription, or paid service.
- The prior Mercer h941:s4 and h926:s3 reports/receipts, h907 readout report, h927 geometry/parameter-identity report, and P2 matrix #1855 were read to check repetition. The present addition is the source-specific acquisition/parameter-role DAG and holdout-unit rule, not another cross-spectrum or feature-necessity theorem. The last unrelated-reading cursor remains SAT archive `SAT Mark V/TheTANGLE.txt`, lines 2201–2240; next cursor 2241. FIE was last reviewed November 10 and is next due November 24, so neither was repeated prematurely.
- Project state remains P0 Code Grurple ACTIVE; P1 Orson cognition OVERDUE / NOT READY / Orson-owned; P2 HOLD; P3 INCOMPLETE. November 9 minor-paper gate is missed; November 30 major and December 14 full-theory gates remain separate. No gate advanced.

## 10. Next falsifiable step

Retrieve and version the Figshare package; enumerate file hashes and axes; join each file to the contour/PIV/PTV acquisition and calibration records; reconstruct the parameter dependency graph; estimate only source-supported covariance; then freeze an untouched acquisition and compare H0/H1 using the same raw observations and decision rule. If the H(s)H map cannot produce an identifiable readout difference after shared-parameter and calibration projection, the proposed extra feature is not established by this system.

## Sources

1. Barckicke, J., Falcon, E. & Gissinger, C. “Kelvin wave propagation along vortex cores.” *Nature Physics* (online 2026-02-10). [Version-of-record PDF and DOI](https://doi.org/10.1038/s41567-026-03175-w). Methods: measurement techniques, fitting, analysis, and data availability.
2. Barckicke, J., Falcon, E. & Gissinger, C. “Data for: Kelvin wave propagation along vortex core.” Figshare (2025). [Dataset DOI](https://doi.org/10.6084/m9.figshare.30903347). Locator only in this run; files/version not retrieved.
3. Existing P2 comparison matrix: [issue #1855](https://github.com/Satobloc/HsH/issues/1855). Existing feature-necessity evidence-admission draft: [PR #1979](https://github.com/Satobloc/HsH/pull/1979), not merged and not empirical evidence.
