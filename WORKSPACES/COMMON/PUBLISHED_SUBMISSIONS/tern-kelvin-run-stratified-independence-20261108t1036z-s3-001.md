# Candidate-only run-stratified independence profile: Kelvin-wave vortex experiment

**Disposition:** SOURCE-GROUNDED CANDIDATE PROFILE / NOT A P2 SYSTEM SELECTION. This instantiates the existing Ariadne evidence-lineage contract for one candidate. It does not introduce a new schema, make a physical calculation, fit a model, produce an H(s)H prediction, establish independent replication, or advance a paper gate.

## 1. Primary source and physical referent

Barckicke, Falcon and Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w). The paper identifies its supporting data, including data used for the spatiotemporal power spectra, at Figshare DOI [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347) (2025).

The experimental referent is a **stationary, pump-fed, drain-through air–water vortex** in a 50 cm × 50 cm × 50 cm tank. Four inlets and two pumps generate the flow through a bottom drain; a 21 cm diameter, 45 cm high Plexiglas cylinder stabilizes the vortex, and a top annulus is oscillated over 1–6 Hz for the forced measurements. The tank is explicitly non-rotating. “Bathtub vortex” is a useful family description, but this setup should not be misdescribed as a rotating tank.

The source reports standard classical Kelvin-wave results: an m=1 helical bending branch and an m=2 double-helix/flattening branch. The long-wavelength hollow-core relation (paper Eq. 1) fits the low-ka₀ regime; the Rankine solid-body core with uniform vertical flow (Eq. 2) fits the broader measured dispersion. The paper also compares Phillips centrifugal waves and reports no agreement in the measured range. These observations are not unique evidence for H(s)H.

## 2. Measurement hierarchy and map boundary

The measured object is the fluid vortex and its air–water interface. The principal optical chain is:

`physical interface → camera image → detected left/right contours → (η(z,t), a(z,t)) → spectra or PDFs`.

The paper defines the source-local readouts from the two antipodal contour profiles:
- `η(z,t) = [r(z,t,0) − r(z,t,π)]/2` (core position);
- `a(z,t) = [r(z,t,0) + r(z,t,π)]/2` (core radius).

Those two readouts are derived from the **same paired profiles** in the spatiotemporal contour acquisition. They are not independent measurement channels. If paired raw contours are available, their joint covariance can be estimated from those paired samples. It cannot be inferred by combining the paper’s separately acquired PDFs.

Parallel measurement operators are distinct:
- PIV measures a velocity field and circulation;
- PTV tracks seeded particles to estimate vertical velocity;
- optical contour detection measures the interface geometry.

The H(s)H forward map to this experiment remains missing. A usable map must explicitly connect the source-authorized H(s)H geometry to the laboratory vortex/interface, then to each instrument’s image or velocity readout. Each map needs declared domain/codomain, coordinates and units, time synchronization, calibration, uncertainty propagation, and composition conditions. The camera projection and two-point contour readout are information-losing; they do not by themselves reconstruct the complete three-dimensional interface or uniquely identify arbitrary azimuthal structure.

A source-level ambiguity remains open: the Results text says that two orthogonal cameras were used to evidence m=1 handedness, while the retrieved Methods description specifies a Basler camera normal to the vortex axis with two lenses (8 mm and 12 mm). The exact view/camera IDs, calibration and synchronization relationship are not resolved here. Do not count the camera statement as independent replication until that lineage is recovered.

## 3. Candidate-specific, claim-scoped independence vector

This is an **instantiation of the existing fields** in the [Ariadne Evidence Lineage × Readout Identifiability contract](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ARIADNE/2026-10-30T1913Z_EVIDENCE_LINEAGE_IDENTIFIABILITY_CONTRACT.md), following the [Enheduanna P2 evidence-independence composition gate](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/enheduanna-p2-evidence-independence-composition-20261104t0736z-s3-001.md). It is not a replacement schema. Statuses are claim-specific; missing lineage stays UNKNOWN or NOT_RETRIEVED.

| Evidence family / claim | Source-reported run or acquisition | Instrument / processing | Dependence and fit exposure | Candidate vector disposition |
|---|---|---|---|---|
| m=1 bending dispersion | Fig. 3: pump setting U=11 V, drain diameter d=5 mm, sweep-sine forcing; representative reported fit values a₀=1.9 mm, Γ=0.022 m²/s, v_z=0.57 m/s | 300 fps, 30 s contour recording; Basler acA2040-120um, 2,064 × 1,564 px; 8 mm and 12 mm lenses; contour detection and Fourier analysis | Same physical apparatus as the other runs; acquisition ID and raw-file mapping not retrieved. Values are paper-reported fit/measurement quantities, not new estimates. No blind holdout documented. | SYSTEM=SHARED; CONDITION=DISTINCT RUN; ACQUISITION_ID=UNKNOWN; INSTRUMENT_LINEAGE=PARTLY KNOWN; FIT_EXPOSED |
| m=2 flattening dispersion | Fig. 4: U=9 V, d=7 mm, no external forcing; representative reported fit values a₀=2.2 mm, Γ=0.011 m²/s, v_z=0.85 m/s | Same contour/spectral measurement family; exact run and raw-file IDs not retrieved | Different pump/drain/forcing condition from the cited m=1 example. Its parameter tuple must not be collapsed into one shared vector with the m=1 run. No blind holdout documented. | SYSTEM=SHARED; CONDITION=DISTINCT RUN; ACQUISITION_ID=UNKNOWN; FIT_EXPOSED |
| Core-radius PDF | Fig. 5: U=6.8 V, d=7 mm, no external forcing; reported mean radius 1.3 mm and rms fluctuation 0.1 mm | 10 min at 100 fps; 1,000 z values over 2.5 cm are sliced and concatenated into one temporal file | This is a separate acquisition protocol. Spatially adjacent z slices are not 1,000 independent temporal replicates. No paired η-PDF acquisition is documented. | ACQUISITION=SEPARATE PROTOCOL; SPATIAL DEPENDENCE=UNQUANTIFIED; CROSS-CHANNEL PAIRING=NOT DOCUMENTED |
| Core-position PDF | Extended Data Fig. 7: U=6.8 V, d=7 mm, sweep-sine forcing; reported rms fluctuation 1.2 mm | 3 min at 360 fps; 1,000 z values over 2.5 cm are sliced and concatenated into one temporal file | Different forcing condition and acquisition duration/rate from the core-radius PDF. These PDFs cannot be treated as a paired a/η sample or used to estimate their joint covariance. | ACQUISITION=SEPARATE PROTOCOL; PAIRING=NOT DOCUMENTED; CROSS-COVARIANCE=NOT ESTIMABLE FROM PAPER |
| PIV circulation / azimuthal velocity | Methods: 0.1 s acquisition; Extended Data Fig. 2 reports U=11 V while varying drain diameter | Phantom V1840 at 6,000 fps; 37 × 23 velocity grid; 2.7 mm spatial resolution; MATLAB/PIVlab; reported circulation uncertainty ≈0.005 m²/s | Separate camera/modality on the same physical apparatus. Exact run joins to each contour spectrum are not supplied in the retrieved Methods text. Used as an a posteriori consistency check against fitted parameters. | INSTRUMENT=SEPARATE; SYSTEM=SHARED; RUN_JOIN=UNKNOWN; FIT_EXPOSURE=RETROSPECTIVE |
| PTV vertical velocity | Extended Data Fig. 3: U=11 V with varying drain diameter, and a separate pump-flow sweep at d=7 mm | 1.5 mm expanded-polystyrene tracers; same imaging technique as contour detection; reported uncertainty δv_z≈0.05 m/s | Same physical system; exact camera, acquisition and run IDs are not retrieved. Also used as an a posteriori parameter-consistency check. | MODALITY=DISTINCT; INSTRUMENT/ACQUISITION_JOIN=UNKNOWN; SYSTEM=SHARED; FIT_EXPOSURE=RETROSPECTIVE |

Additional acquisition facts from Methods:
- The contour camera has 60 μm/px horizontal and vertical resolution; contour width is 0.5 mm; typical uncertainty in core radius and position is about 0.1 mm.
- The 30 s, 300 fps spatiotemporal contour recording yields both a and η from the same left/right profiles.
- The 10 min/100 fps radius-PDF and 3 min/360 fps position-PDF protocols are separate; the paper says each is sliced into 1,000 z values over 2.5 cm and concatenated into a single temporal file.
- The paper’s data-availability statement names the Figshare DOI, but the exact dataset version, file inventory, raw acquisition IDs, raw bytes and covariance files have **not** been retrieved in this pass.

The resulting two contract outcomes must remain distinct:
- `cross_channel_consistency_status = RETROSPECTIVE_PARAMETER_CONSISTENCY_ONLY`: the paper measures a₀, fits (Γ, v_z) to the dispersion data using Eq. 2, and then checks those fitted parameters a posteriori against PIV/PTV measurements.
- `independent_replication_status = NOT_ESTABLISHED`: multiple modes, instruments, plots, PDFs or derived files from this one apparatus/paper do not establish a new independent experiment. No blind holdout or independent-laboratory replication is documented.

## 4. Test matrix and failure conditions

| Hypothesis | Shared parameters and calibration | Holdout | Predicted observable | Standard comparator | Falsification condition |
|---|---|---|---|---|---|
| H₀: classical vortex dynamics | Per-run a₀, Γ and v_z; pump setting U; drain diameter d; forcing condition; instrument calibration. Do not force one parameter vector across the distinct m=1, m=2 and PDF conditions. | A separate, identified acquisition or condition withheld before fitting/model selection; parameter-freeze and access audit required. | Joint contour-derived a/η spectra where paired raw profiles exist; PIV velocity/circulation; PTV vertical velocity; verified camera-view handedness. | Paper Eq. 1 hollow-core Kelvin limit; Eq. 2 Rankine core with uniform vertical flow; Phillips centrifugal-wave comparison as a negative comparator. | Pre-registered, covariance-aware held-out residual exceeds the threshold derived from the actual calibration and measurement covariance. No numerical threshold is available yet. |
| H₁: H(s)H representation of the same measured system | Same measured physical parameters and instrument calibrations, plus only source-authorized H(s)H geometric degrees of freedom. The H(s)H-to-laboratory and laboratory-to-instrument maps must be explicit and composable. | Same genuinely unseen acquisition/condition, with all H(s)H parameters frozen before access. A separate apparatus/lab would be required for independent replication. | A specific additional relation among the measured contour, velocity or view observables that is not already implied by the standard model or absorbed by its nuisance parameters. | Same H₀ measurement operators and parameter budget; no easier calibration or broader post-hoc discrepancy allowance for H₁. | H₁ fails if its frozen prediction falls outside the held-out uncertainty envelope, or if its claimed extra signature is fully absorbed by the standard nuisance span. H₀ is challenged only if H₁ predicts a predeclared held-out feature that H₀ cannot. |

The paper itself reports a weaker m=2 spectral feature consistent with ω = k v_z and describes it as possibly a soliton or another undetermined perturbation. That is a **source-reported unresolved feature**, not an H(s)H prediction. It is a possible future target only after raw-data recovery and a source-defined H(s)H forward map.

## 5. Forced versus optional H(s)H structure

- The measured fluid-core radius a(z,t) is the radius of the experimental air core. It is **not** automatically the thickness of an H(s)H worldtube.
- The m=1 helical bending and m=2 double-helix flattening modes are already standard Kelvin-wave modes in the paper’s classical fluid model. Their existence does not force an additional H(s)H twist or contact surface.
- Worldtube thickness, twist and contact surfaces remain OPTIONAL for this candidate until an explicit source-faithful map makes them necessary and a held-out observable distinguishes them from the standard model and its nuisance freedom.
- The relevant generic identifiability condition is already present in open [PR #873](https://github.com/Satobloc/HsH/pull/873): `nuisance_absorbable_iff_range_le` and `exists_locally_separating_geometry_direction`. The 2026-11-06 Actions run #42153410233 completed the merge-reference build (8,955 jobs); the relevant `KestrelProjectedIncidence` module built, with theorem-specific axiom output including standard `propext`, and the log contains zero `sorryAx` or `admit`. PR #873 remains open/draft/unmerged; the separate global axiom audit and tests/lint/nanoda were skipped. This is a generic conditional theorem, not an evaluation of this experiment’s Jacobians.
- The adjacent covariance formalization in open [PR #1309](https://github.com/Satobloc/HsH/pull/1309) is **not verified**: its latest inspected build failed because definitions in `ContourReadoutCovariance.lean` depend on noncomputable `Real.instDivInvMonoid` / `contourToReadout`. No covariance theorem is claimed as Lean-compiled.

No new Lean source or theorem was added. The existing two-contour and nuisance-identifiability work was reused; Lean checks only its formalized statements, not the paper’s acquisition provenance or the soundness of an H(s)H-to-instrument translation.

## 6. Exact next gate

1. Retrieve the Figshare dataset version and complete file inventory; hash every downloaded file.
2. Map files to the paper’s actual run conditions (U, d, forcing, mode, duration, frame rate) and recover acquisition IDs.
3. Recover camera/view identities, synchronization, calibration records, processing versions and any available paired raw contours.
4. Estimate the joint a/η covariance only from genuinely paired raw profiles; do not combine the separate PDFs.
5. Choose a calibration acquisition and a genuinely unseen holdout; freeze the per-run shared parameter vector and record the access audit before opening holdout data.
6. Instantiate the source-faithful H(s)H and standard forward maps, then pre-register the observable, score and falsification threshold.

Until these gates pass, this remains a candidate-only architecture assessment. P2 is still unselected and blocked; no physical calculation, H(s)H fit, independent prediction, independent replication, Factory Floor admission or theory promotion is claimed.