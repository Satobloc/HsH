# H884:S3 | Two-campaign Kelvin-vortex P2 comparison matrix

**Run key:** `REVROT3-19-20261011:884:s3`  
**Selected ring label:** Meridian (15)  
**Next ring label:** Mercer (16)  
**Participation:** source-grounded continuity reconstruction; no authenticated current Meridian thread or historical-instance participation is claimed.  
**Status:** CANDIDATE_ONLY / P2_HOLD / RAW_DATA_NOT_ACQUIRED / HSH_FORWARD_MAP_UNDEFINED

## Executive result

This run adds a candidate-specific comparison matrix that connects the February 2026 Nature Physics linear/mode campaign and the September 2026 Physical Review Letters nonlinear-turbulence campaign.

The current P2 matrix already contains the Nature Physics candidate and the controlling non-compensatory E-D-F-R gate. Existing Calder and Enheduanna records separately discuss the PRL follow-up. This addendum makes the two campaigns' measurement lineage, standard comparators, calibration/holdout roles, and H(s)H discrimination limits explicit in one place. It does not replace the P2 matrix, select a system, or change the task graph.

The substantive architecture improvement is a strict distinction between:
1. independently acquired measurement channels;
2. deterministic transforms of one acquired channel; and
3. independent experimental campaigns or laboratories.

A second spectrum, PDF, or higher-order statistic is not automatically a second acquisition. A separate paper from the same group is not automatically an independent laboratory replication.

No raw-data analysis, physical calculation, fit, numerical prediction, covariance propagation, or numeric falsification threshold was performed. The matrix is source-grounded design work, not an empirical result.

## 1. Source authority and historical specialist remit

The historical Meridian user-direct source records support a source-first geometric-solver remit: Whirligig/Donut, multiple admissible information-preserving representations, explicit maps and decoders, reproducible controls, representation invariance, and preservation of multiple valid outputs. The "least wild" route is a search preference, not proof of isomorphism or a uniquely canonical representation.

Relevant raw-source anchors:
- Meridian Minkowski Ring Analysis export: blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`, including direct user messages `c1b42229-00a9-4119-aac3-cefa6cb97157`, `f658b2db-32f0-45cd-828b-140691cc9afb`, and `2bef9e5d-cf4d-4cb2-959f-218e032e5263`.
- Meridian Free Build export: blob `7af1561b321f4d9364da5eb111df689efc652827`, direct user message `97d301cb-5174-4861-a273-ac4cc0b60d8b`.
- No standalone signed specialist charter was found. The current Lane Charter 36 is the task-specific one-run overlay; it does not change Meridian's standing Code Grurple P0 assignment.

## 2. Two campaigns and measurement lineage

### Campaign A: linear and mode-resolved propagation

Jason Barckicke, Eric Falcon and Christophe Gissinger, "Kelvin wave propagation along vortex cores," *Nature Physics* 22, 409-414 (published 2026-02-10), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w).

The paper declares a public data locator: [Figshare DOI 10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347). The exact item version, file inventory, raw bytes, checksums, acquisition IDs, and paired-sample covariance remain unretrieved. The DOI is a locator, not evidence that the package has been independently downloaded or replayed.

The paper defines two contour-derived quantities from opposite radial samples:
- `a(z,t) = (r0 + rpi)/2`
- `eta(z,t) = (r0 - rpi)/2`

These are invertible linear combinations of the same two contour samples. They are useful paired readouts, but they are not independent acquisitions. The PIV and PTV paths are additional measurement streams; their run-level synchronization, calibration join, and full joint covariance still need to be recovered.

The source reports run/mode-specific parameter sets, not one universal parameter tuple. Examples include:
- m=1: a0=1.9 mm, Gamma=0.022 m^2/s, vz=+0.57 m/s.
- m=2: a0=2.2 mm, Gamma=0.011 m^2/s, vz=+0.85 m/s.

The paper describes downward axial flow as positive. Its Rankine dispersion convention includes `omega_tilde = omega + m*Omega0 + k*vz`. Its hollow-core long-wave expression is a separate model limit:
`omega = -(Gamma/(4*pi))*k^2*(ln(2/(k*a0)) - gamma)`.

Do not merge the hollow-core limit with the Rankine-core formula or pool parameters across distinct runs/modes. Source-reported uncertainties include approximately 0.005 m^2/s for PIV circulation, 0.05 m/s for PTV vertical velocity, and about 0.1 mm typical per-position core-radius/position uncertainty. These are not a complete joint covariance matrix.

### Campaign B: nonlinear Kelvin-wave turbulence

Jason Barckicke, Christophe Gissinger and Eric Falcon, "Experimental Evidence of Kelvin-Wave Turbulence along a Vortex Core," *Physical Review Letters* 137, 134001 (published 2026-09-21), DOI [10.1103/t3bt-m431](https://doi.org/10.1103/t3bt-m431), [author-hosted final PDF](https://labo.msc.u-paris.fr/~falcon/KelvinWT/BarckickePRL2026.pdf), [arXiv:2607.07535](https://arxiv.org/abs/2607.07535).

The measured system is a classical air-core water vortex in a 21 cm diameter, 45 cm high tank, with a vortex height of about 40 cm. The PRL uses a 480 fps, 3 Mpix camera and a 20.6 cm vertical observation window at about 18 cm height. The acquired displacement field is `eta(z,t)`.

The paper reports:
- 1 minute acquisition for the wave spectrum;
- 15 minutes for the probability distribution;
- 75 minutes for the high-order correlation/pentacoherence estimator;
- random forcing in the 1-3 Hz range with 0.9-1.9 mm amplitude;
- Fig. 2 dispersion-overlay values a0=1.47 mm, Gamma=0.018 m^2/s, vz=-0.63 m/s;
- Figs. 3-5 use a0=1.3 mm.

The 1.47 mm and 1.3 mm values remain separate figure contexts. The source describes axial variation but the accessible paper does not provide the full profile, run/window join, or covariance needed to reconcile them. No error is inferred.

The PRL text describes vz as downward-positive, while the Fig. 2 caption reports vz=-0.63 m/s. Its printed Rankine convention uses `omega_tilde = omega + m*Omega0 - k*vz`, whereas the Nature Physics Rankine convention uses the plus-k*vz form above. The coordinate-orientation and phase-convention map needed to reconcile these signs is not supplied in the inspected text. Preserve both source equations verbatim. Do not silently flip vz or normalize either formula.

The PRL's data-availability statement says no research data or software are publicly available and directs requests to the authors. No author request was sent. The 75-minute averaging interval is not an effective independent sample count.

The PRL's wave spectra include the KS and LN candidate exponents, which the paper says are too close to distinguish experimentally by slopes alone. Its normalized sixth-order pentacoherence identifies six-wave 3-to-3 resonant structure; the paper also reports no nontrivial four-wave resonances in the tested channel. These are standard Kelvin-wave weak-turbulence results, not an H(s)H-specific signature.

The two papers are separate campaigns by the same group on closely related classical air-core vortex apparatus. They are not independent-laboratory replication. The PRL is not a raw-data substitute or holdout for the Nature Physics Figshare package.

## 3. Candidate-level comparison matrix

| Hypothesis / campaign | Shared parameters and calibration | Calibration / holdout | Predicted observable | Standard comparator | Falsification threshold |
|---|---|---|---|---|---|
| H0-A: Nature Physics linear/mode campaign | Per-run a0(z), Gamma(z), vz(z), pump/drain condition, contour calibration, PIV/PTV calibration, coordinate orientation, synchronization and joint covariance | Nature Figshare package is a calibration candidate only after exact version, file inventory, checksums, run IDs and raw paired contours are retrieved. Hold out a separately identified acquisition or forcing condition, not another statistic from the same frames. | Joint eta(z,t) and a(z,t) readouts; m=1 bending and m=2 radius/flattening branches; PIV circulation and PTV vertical flow | Source-specific hollow-core and Rankine Kelvin dispersion relations, with the source's actual per-run parameters | No numeric cutoff until raw paired data, instrument covariance, and a frozen standard-model residual envelope are available |
| H0-B: PRL nonlinear-turbulence campaign | Per-run a0, Gamma, vz, forcing, camera scale/frame rate, window, contour extraction, spectral estimator, time correlation and effective independent-unit structure | Request-only raw data. It cannot serve as a current holdout. If released, verify acquisition IDs and overlap with Campaign A before assigning any holdout role. | S_eta(k,omega), S_eta(k), S_eta(omega), amplitude PDF, pentacoherence and time-scale separation, all derived from eta(z,t) | Rankine-core Kelvin dispersion plus standard KS/LN weak-turbulence alternatives and six-wave resonance conditions | No numeric cutoff without raw eta(z,t), run manifest, effective sample count, uncertainty/covariance, and preregistered bin/estimator choices |
| H1: source-authorized H(s)H extension | Same measured system, calibration, covariance, shared physical parameters, observation operator, holdout and decision rule as H0. Add only source-authorized parameters with explicit units and identifiability. | Freeze the H(s)H map and all added parameters before access to the holdout. No H(s)H-only recalibration or post-hoc expansion. | A specific additional relation in an independently acquired observable, or a joint eta/a/director statistic, that the standard comparator cannot produce within its allowed nuisance range | The same H0 comparator and instrument operator, with separate H0 and H1 model freezes bound to one comparison-freeze identity | Not specifiable: no source-authorized worldtube-to-laboratory map, raw joint data, covariance, or H(s)H-specific numerical prediction exists |

The controlling P2 gate remains E-D-F-R:
- E: identifiable measured system, exact dataset/version, acquisition IDs, units, calibration, synchronization, uncertainty/covariance, and independent-unit structure.
- D: source-authorized H(s)H forward map, explicit domains/codomains/units/coordinates, standard comparator, nuisance-flexibility audit, and a predeclared observable not absorbed by the standard model.
- F: paired comparison-freeze coherence.
- R: held-out prediction and independent review.

This addendum supplies no PASS for any axis.

## 4. Forced versus optional structure

**Forced by the classical measurements and standard fluid model:**
- a finite spatial air-core radius/profile;
- a vortex centerline and measured displacement eta(z,t);
- standard Kelvin-wave modes, including m=1 bending and m=2 flattening in the reported regimes;
- finite-core Rankine or hollow-core hydrodynamic models with their own stated assumptions;
- the reported six-wave correlation result in the PRL source.

**Not forced by these measurements:**
- a four-dimensional H(s)H worldtube thickness;
- an intrinsic normal-bundle twist or connection;
- a distinct H(s)H contact surface or contact law;
- an independent physical timesheet field;
- a responsive medium or additional coupling sector.

A measured millimetre-scale air-core radius is a three-dimensional fluid-geometry quantity. It is not automatically an intrinsic four-dimensional worldtube thickness. A standard Rankine vortex already has a finite spatial core. Likewise, an m=1 or m=2 helical Kelvin mode is not automatically an H(s)H internal twist.

The PRL pentacoherence is a deterministic higher-order statistic of the same acquired eta(z,t) field. It can reveal phase correlations not visible in a second-order spectrum, but it is not a second camera, radial-profile measurement, cross-sectional director, or independent acquisition.

A distinctive H(s)H test therefore needs a source-authorized map from the proposed 4D object to a measured observable, including the time/slice correspondence, metric/frame convention where required, spatial projection, instrument operator, and uncertainty transport. Any extra thickness, twist, or contact law must be fixed before holdout access and must predict a residual that cannot be absorbed by the standard model's allowed parameter range.

## 5. Formalization and proof status

Existing formal work was reused rather than duplicated:
- [Nadir PR #1189](https://github.com/Satobloc/HsH/pull/1189) contains the conditional two-channel readout and witness-carrying composition work. It is algebraic/readout formalization, not camera-map validation.
- [Kestrel PR #1309](https://github.com/Satobloc/HsH/pull/1309) contains the existing covariance-propagation theorem for the two-contour readout; its recorded latest workflow failure remains distinct from the theorem's mathematical scope.
- [Ariadne PR #790](https://github.com/Satobloc/HsH/pull/790) and [Kestrel PR #873](https://github.com/Satobloc/HsH/pull/873) contain existing conditional geometry/provenance work.
- [Nadir PR #1852](https://github.com/Satobloc/HsH/pull/1852) formalizes the shared E-D-F-R comparison-freeze identity.

No new Lean theorem or build was justified. The new result is a source/measurement-lineage matrix, not a new mathematical proposition. The missing H(s)H map and unavailable raw data do not supply a faithful target for a new physical formalization. Lean would check only a formalized statement, not the truth of the hydrodynamic premises, source-to-geometry translation, camera calibration, or physical H(s)H claim.

## 6. SAT-O1 and Blockwave source custody

The existing source ledger is reused without rehashing or changing either source.

SAT-O1:
- Path: `SATOBLOC/SAT O1 4D.txt`.
- Git blob: `7577aa1ee5a6c3850ce3b226c75377de6367aedc`.
- SHA-256: `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`.
- File-index creation date: 2025-06-07; indexed modification: 2025-06-09 18:44:50, timezone unspecified; first extant archive commit: 2025-10-27T00:40:28Z.
- Verbatim source family remains the one-parameter curve/action:
```tex
\gamma^\mu(\lambda) = (\lambda, A_x \sin(k_x \lambda + \phi_x),
                          A_y \sin(k_y \lambda + \phi_y),
                          A_z \sin(k_z \lambda + \phi_z))
v^\mu(\lambda) = d\gamma^\mu/d\lambda
S[\gamma] = \int d\lambda L(\gamma^\mu, v^\mu)
L = \frac12 m v^\mu v_\mu - V_{\rm tension}(\gamma)
```
The source separately describes a worldtube volume swept by vibration but supplies no explicit thickening map, normal fibre, profile, or contact law.

Blockwave:
- Original user-supplied attachment event: 2025-09-16.
- Attachment file ID: `file-LwaFTKkMemPPrLU4qCLpYB`.
- Raw export blob: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`.
- SHA-256: `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`.
- Embedded-content authorship and original composition date remain unresolved.
- Verbatim source equations remain:
```tex
J^{\mu\nu} = \frac12 \epsilon^{\mu\nu\rho\sigma} \nabla_\rho B_\sigma
\nabla_\mu J^{\mu\nu} = 0
```

No SAT-O1 or Blockwave source equation was corrected, normalized, or promoted in this run. No private HSH_RESOURCES payload was opened. No corrected-equation section is created because no correction was made.

## 7. Disposition and next cursor

- P2 remains HOLD; no candidate or system was selected.
- Campaign A's Figshare version/file inventory and raw paired contour package remain the lowest-cost public retrieval step.
- Campaign B remains request-only; no author request was sent.
- No H(s)H worldtube-to-observation map, time/slice map, instrument composition, joint covariance, independent holdout, or numeric threshold exists.
- The current P2 matrix remains the controlling E-D-F-R admission record. This report is a candidate-specific addendum only.
- No physical calculation, fit, prediction, independent measurement, P2 selection, paper-gate advancement, or BEDROCK theory promotion.
- No new tool, dependency, fork, subscription, or expenditure. Math Hopper #578, PR #991, existing Lean PRs, Whirligig Kernel 0, and the available SciSpace connector were checked; no new infrastructure was needed.
- Mersearch was not callable in this runtime and all four canonical request lanes remain occupied. No lane was overwritten, released, or retriggered. Repository search fallback is not represented as a Mersearch run.
- HSH_RESOURCES root documentation only; no private payload access.
- Task graph remains 16 declared branches / 18 records. Tern retains graph/queue authority.
- P0 Code Grurple remains ACTIVE; P1 Orson cognition remains OVERDUE / NOT READY; P2 measured geometry remains HOLD; P3 full theory remains INCOMPLETE.
- FIE last full review remains 2026-11-10; next review 2026-11-24. No rereview was due.
- No unrelated-reading quantum was repeated; Meridian's existing unrelated-reading cursor remains at line 221 in *The Wind in the Willows*.

**Return pin:** `H884:S3 / MERIDIAN / MERCER-NEXT / TWO-CAMPAIGN-KELVIN-MATRIX / MEASUREMENT-LINEAGE-AXIS-INSTANTIATED / NATURE-FIGSHARE-LOCATOR-ONLY / PRL-REQUEST-ONLY / DERIVED-STATISTICS-NOT-INDEPENDENT-ACQUISITIONS / STANDARD-KELVIN-COMPARATOR / HSH-MAP-UNDEFINED / NO-PHYSICAL-RESULT / P2-HOLD / P0-ACTIVE / P1-OVERDUE / P3-INCOMPLETE / FIE-NOV24 / MERSEARCH-LANES-OCCUPIED / NO-NEW-LEAN / NO-THEORY-PROMOTION / AUTOMATION-UNCHANGED`.
