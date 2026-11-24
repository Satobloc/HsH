# H960:s3 | PNAS turbulent-blob calibration-lineage addendum

**Run key:** `REVROT3-19-20261011:960:s3`  
**Ring selection:** Meridian (index 15); next Mercer (index 16).  
**Participation class:** assistant reconstruction under a deterministic ring label; not authenticated historical Meridian participation or an authenticated current Meridian thread.  
**Status:** `SOURCE_DERIVED_CALIBRATION_LINEAGE / FIT_CONDITIONED_COMPARATOR / HOLDOUT_NOT_DOCUMENTED / P2_HOLD`.

## Scope and non-duplication

This is a narrow addition to the existing PNAS turbulent-blob source chain. Hale h955:s2 already documented the measured-system/data gate, 2D PIV versus 3D PTV acquisition distinction, data-conditioned 3D CDS simulation, and missing raw-data/holdout evidence. Kestrel h956:s3 separately documented laboratory time versus logarithmic sampling time. Meridian h956:s4 separately checked the source derivation of the logarithmic sampling equation and its Lean scope.

This addendum does **not** repeat those findings. It adds the exact calibration target and fitting window disclosed in Supplementary Information Fig. S17, then tightens the existing P2 comparison-freeze requirement so calibration, initialization, and holdout cannot be conflated.

## New source finding: calibration is a fit, not a blind prediction

Primary source: Matsuzawa et al., “Nonlinear diffusion and decay of a blob of turbulence spreading into a quiescent fluid,” *PNAS* 123(7), e2526858123 (2026), DOI [10.1073/pnas.2526858123](https://doi.org/10.1073/pnas.2526858123). Relevant source locations are Supplementary Information §5B and Fig. S17, especially panel (b).

The SI states that the model coefficients `c0` and `epsilon0` are estimated by minimizing the mean-squared error of the experimental front-growth observable `dot(R_blob)(t)` over **1.2 s ≤ t ≤ 5 s**. Fig. S17(a) displays the resulting comparison using `c0 = 1.2` and `epsilon0 = 0.88`; Fig. S17(b) supplies the two-parameter MSE map.

This changes the correct epistemic label of that comparison:

- `dot(R_blob)(t)` over the stated interval is a **calibration target**.
- `c0` and `epsilon0` are **fitted parameters**, not independent measurements.
- The measured integral scale `ell(t)` is supplied as a model input.
- The 3D CDS comparison in SI Fig. S15 uses a measured 3D PTV-derived initial condition, while the displayed validation comparison is against 2D PIV data.
- The inspected SI does not identify a separate acquisition/run or condition reserved exclusively as an independent holdout for the fitted pair.

The 2D MSE surface is a useful identifiability diagnostic, but the inspected text does not provide a joint parameter covariance, profile interval, or an independently validated parameter region. The displayed point pair must not be treated as proof that `c0` and `epsilon0` are separately identified. No numerical ridge width, confidence region, or parameter correlation is inferred here.

The exact fitting interval is new relative to the earlier H955 source/data gate. It is a source-derived fact, not a new fit performed in this run.

## Calibration-lineage record to attach to the existing comparison freeze

No new schema or PR is proposed. The existing `ComparisonFreeze` and `SourceRunWitness` work should carry enough concrete provenance to resolve these fields rather than leaving `holdout_partition` as an opaque label:

| Field | PNAS small-blob status from inspected source |
|---|---|
| Calibration observable | `dot(R_blob)(t)` |
| Calibration interval | `[1.2 s, 5 s]` |
| Objective | mean-squared error |
| Fitted parameters | `c0`, `epsilon0` |
| Displayed coefficient pair | `(1.2, 0.88)` |
| Model input | measured `ell(t)` |
| Initialization input | measured 3D PTV-derived initial condition |
| Validation display | 3D CDS central slice compared with 2D PIV |
| Holdout acquisition/run IDs | `NOT_IDENTIFIED_IN_INSPECTED_SOURCE` |
| Joint parameter covariance/profile | `NOT_REPORTED_IN_INSPECTED_SOURCE` |
| Independent holdout result | `NOT_ESTABLISHED` |

A future comparison freeze should bind: calibration source/run IDs; exact observable and time window; fit objective; fitted parameter vector and joint uncertainty/profile; initial-condition source and digest; measured-input source and digest; holdout run/condition IDs; and the exact observation operator applied to both model and data.

For a **conditional forecast**, measured `ell(t)` may be supplied to both H0 and H1 only if it is explicitly declared as a common exogenous input and is not also counted as a predicted target. For a **full forecast**, the model must predict `ell(t)` rather than consume the held-out measurement. The two test modes must not be blended.

The holdout must be a separate acquisition or condition not used to build the initial condition, select parameters, choose the analysis window, or tune the observable operator. A different frame from the same realization is not automatically an independent holdout.

## Updated conditional test matrix

| Element | Standard comparator H0 | H(s)H candidate H1 |
|---|---|---|
| State / forward model | Published Kolmogorov–Barenblatt / 3D CDS model | Not source-defined for this system |
| Inputs | Measured `ell(t)` and source-derived initial condition, explicitly frozen | Same declared inputs for a conditional comparison, or independently predicted inputs for a full forecast |
| Calibration | `c0`, `epsilon0` fitted to `dot(R_blob)` over 1.2–5 s | Must use the same training partition and disclose all added parameters |
| Observable | `R_blob`, front growth, and spatial energy-field readout after a declared operator | Must define geometry → physical field → measurement/readout composition |
| Holdout | Separate acquisition/condition not used in initialization or fitting | Same holdout, frozen before evaluation |
| Identifiability | Joint `c0`/`epsilon0` uncertainty not established by the inspected source | Added geometric parameters must not merely absorb the H0 calibration trade-off |
| Falsification | Requires raw data, run IDs, calibration and covariance | Requires the same evidence plus a distinct, predeclared observable consequence |

The discriminating requirement for H1 is not simply a better in-sample fit. It must predict a held-out feature that remains distinguishable after profiling the admissible H0 parameter region and applying the same observation operator. The current source does not provide the raw data, joint covariance, or a complete H(s)H geometry-to-readout map needed to instantiate that test.

## Geometry, proof, and physical limits

The source contains explicit geometry and transformations: a 3D simulation, a central-slice comparison, a measured 3D initial condition, and a radial/energy observable. The physical composition map from H(s)H worldtube/timesheet structure to the measured `q` field and then to the PIV/PTV readout is not defined. The 2D-to-3D reconstruction, run-level registration, and covariance needed to make that map source-faithful remain insufficiently specified.

**Formalization status:** `FORMALIZATION_BLOCKED_DEFINITION`. Existing PR #1852 / issue #1853 formalizes a common comparison-freeze identity; PR #1858 adds source-bound comparison evidence. Those results do not prove this experiment's calibration/holdout independence, parameter identifiability, or physical measurement map. No new Lean theorem or build was created because a faithful proposition for the missing physical map and data partition cannot yet be stated without inventing source assumptions. Lean would verify only the eventual formalized contract, not the physical premises.

No raw Zenodo/HDF5 data were downloaded, no new numerical fit or physical calculation was performed, and no independent measurement or validation is claimed. No numerical falsification threshold is instantiable without the raw run-level data, calibration, covariance, and a frozen holdout.

No worldtube thickness, twist, contact surface, or new medium law is forced by this experiment. Those remain optional H(s)H hypotheses until an explicit forward map produces a distinct, independently testable observable.

## Project and authority boundaries

- P2 remains `HOLD`; the turbulent-blob study remains candidate-only and is not selected as a P2 system.
- P0 Code Grurple remains ACTIVE. Meridian's standing Paper A accepted-R1 presentation-support assignment is unchanged; this Lane 36 pass does not edit the reader, manuscript, site, or P0 ownership.
- P1 Orson cognition remains Orson-owned; no work or ownership was reassigned.
- P3 remains incomplete. The November 30 major-paper and December 14 full-theory gates remain separate.
- FIE review is next due November 24; no premature re-review or paper-gate advancement.
- No SAT-O or Blockwave equation was retrieved, normalized, corrected, or modified. No BEDROCK theory status was changed.

## Internal continuity and references

- Prior H955 data/closure gate: `WORKSPACES/HALE/2026-11-19T1924Z_H955_S2_TURBULENT_BLOB_DATA_AND_CLOSURE_GATE.md`.
- Prior Kestrel sampling-coordinate report: issue [#2127](https://github.com/Satobloc/HsH/issues/2127).
- Prior Meridian source-derivation QC: issue [#2129](https://github.com/Satobloc/HsH/issues/2129).
- P2 tracker: issue [#565](https://github.com/Satobloc/HsH/issues/565).
- Existing comparison-freeze formalization: [PR #1852](https://github.com/Satobloc/HsH/pull/1852), [issue #1853](https://github.com/Satobloc/HsH/issues/1853).
- Existing source-bound comparison work: [PR #1858](https://github.com/Satobloc/HsH/pull/1858).
- Supplementary Information PDF: [PNAS supporting information](https://guava.physics.ucsd.edu/~nigel/REPRINTS/2026/Matsuzawa%20decay%20and%20spread%20of%20turbulence%20PNAS%202026.pdf).
- Study-data locators: [Zenodo 10.5281/zenodo.18380405](https://doi.org/10.5281/zenodo.18380405); [UChicago 10.6082/bztvb-5gq91](https://doi.org/10.6082/bztvb-5gq91).

This artifact is an assistant-authored source/architecture addendum. It is not Nathan Direct, not an independent review, not a new physical result, and not an adoption or promotion into BEDROCK.
