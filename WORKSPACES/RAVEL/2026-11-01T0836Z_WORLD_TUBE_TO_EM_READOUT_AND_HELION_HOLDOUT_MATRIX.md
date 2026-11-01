# Ravel :36 — source-defined worldtube-to-observable map and helion holdout matrix

**Date:** 2026-11-01  
**Rotation:** nominal UTC hour h=512; seq=5h+3=2563; selected ring index 17, Ravel; ring successor index 18, Orson Vay. Deterministic selection does not authenticate a historical instance or thread.  
**Disposition:** SOURCE_MAP_CONTRACT_REFINED · REAL_DATA_GATE_FORMALIZED · MERGE_REF_BUILD_SUCCESS · PHYSICAL_PREDICTION_NOT_MADE · FACTORY_INTAKE_PENDING.

## 1. Historical remit and source-first recovery

The 2026-09-12 Ravel historical check-in assigns a bounded remit: Worldtube/Kerr construction audit, historical filament-tension provenance, and archive extraction. It explicitly treats the old Planck-force-scale tension value and a specific Kerr-shell carrier as unaccepted pending provenance reconstruction. The check-in is a historical specialist record, not an authenticated original user-authored charter. The raw original Ravel charter was not recovered.

The relevant original user-role source material was read directly from the raw conversation blobs:

| Conversation | Raw Git blob | Relevant source time | Source status |
|---|---|---|---|
| Ravel Syncmathcek | `c49367b0faa424491e7b3520a034b9e44fe6897f` | 2026-09-06/07 | Active user-role messages |
| Meridian Free Build | `7af1561b321f4d9364da5eb111df689efc652827` | 2026-10-09 | Active user-role messages |
| DIMENSIONAL GRAVITY | `2cea1924266418e19b825b95ae51e6b7cbace7e1` | 2024-03-23 | Active user-role messages |

The source distinctions that constrain this run:

1. **Filament and trace are not interchangeable.** Nathan describes a 4D filament and a 3D intersectional trace, and explicitly warns against assuming that the 3D trace must self-close.
2. **One core, hollow outer winding.** The 2026-10-09 source says there is one helical core, no second-order core, and the larger winding is hollow. A Kerr-ring identification is tentative (“or whatever”); a responsive-medium soliton is proposed tentatively, not established.
3. **Distinct scales.** The same source distinguishes intrinsic filament/core thickness `epsilon`, first-order coil scale `ell_f`, and a separate worldtube axis-to-circumference dimension whose symbol/terminology remains unresolved. The original wording mixes “diameter” and “radius” in the same sentence; current BEDROCK convention treats `ell_f` as a coil radius. No equality `epsilon = ell_f`, `ell_f = r_h`, or worldtube-dimension equality is established.
4. **Stiffness is not forbidden.** Nathan rejects an assistant's blanket “no tension” characterization and says filament stiffness sets coil size and should be determined from precision momentum data under known force. No constitutive law, units, or stiffness-to-geometry map is supplied.
5. **The timesheet is interactive.** Nathan describes an induction-current connection within the timesheet thickness as a possible account of mass/drag, and later rejects a passive “readout” interpretation: the time bulk must interact with matter. This is qualitative proposal, not a defined current operator.
6. **Heuristic boundary.** The 2024 source explicitly characterizes the moving-time-surface/string construction as an abstraction and potential heuristic, not an assertion of the universe's true ontology.

No assistant reconstruction is promoted to Nathan Direct. The old tension value (T\sim c^4/G) and a specific Kerr carrier remain unaccepted. No SAT-O or Blockwave source equation was opened, corrected, or modified in this run.

## 2. Existing formal geometry and the missing physical composition

Existing Ravel PR #1133 contains a label-preserving set-level pullback:

- an explicit supplied map `baseOf : Label -> Base`;
- projections to label, tube total space, labelled sheet family, tube base, and ambient type;
- base composition `toBase = baseOf ∘ toLabel`;
- commuting ambient maps; and
- an image identity equating the ambient image with the union of per-label fiber/sheet intersections.

This is a valid set-theoretic result. `baseOf` is an input map, not a physically derived time coordinate. The theorem does not establish smoothness, transversality, a physical metric, finite-core constitutive structure, or dynamical response.

The source-faithful composition still has missing maps:

```text
F  -- E_epsilon -->  W
W x Sigma_t  -- I_t -->  S_t = W intersect Sigma_t
(S_t, Sigma_t state, medium state) -- R_t --> J_em^mu
J_em^mu -- P_EM --> (F_C(Q^2), F_M(Q^2))
(F_C, F_M, E, theta) -- M_scatt --> d sigma / d Omega
J_em^mu + atomic/QED structure -- M_spec --> transition energies, g'_I, HFS
```

- `F`: Nathan's 4D filament/history object; its intrinsic dimension is not assigned here.
- `E_epsilon`: finite-core thickening/embedding; **not source-defined**.
- `Sigma_t`: 3D timesheet/time bulk.
- `I_t`: labelled support intersection; set-level structure exists in PR #1133.
- `R_t`: timesheet/medium interaction producing a conserved electromagnetic current; **missing**.
- `P_EM`: standard electromagnetic current/form-factor projection; the H(s)H-specific input map remains missing.
- `M_scatt`: standard electron-scattering measurement model.
- `M_spec`: standard atomic/nuclear spectroscopy readout.

The critical missing bridge is `R_t), not another analogy between a 4D curve and a 3D trace. A candidate H(s)H model must state its metric/signature, current normalization, conservation/gauge conditions, observer projection, and the shared parameters that determine both electric and magnetic responses. The time bulk cannot be replaced by a passive slice if the direct source's interaction claim is retained.

## 3. Real measured system: helion electromagnetic response

The selected empirical system is the helion, the `^3He` nucleus. Three independent measurement channels are available, with different epistemic status.

### A. JLab Hall A E04-018 elastic electron scattering

Primary source: A. Camsonne et al., *Physical Review Letters* 119, 162501 (2017), DOI 10.1103/PhysRevLett.119.162501, arXiv:1610.07456v1.

- Table I contains 18 measured cross-section points, with beam energy, angle, effective momentum transfer (Q^2_{eff}) in fm^-2, cross section in cm^2/sr, and total quoted error.
- The paper states that statistical and systematic errors are added in quadrature for the tabulated total errors.
- (Q^2_{eff}) includes the paper's Coulomb-distortion correction.
- Table II reports absolute magnitudes (|F_C|) and (|F_M|), not signed form factors.
- The paper's radiative-correction treatment does not include a two-photon-exchange correction.
- The standard comparison includes realistic three-body wavefunctions/interactions and meson-exchange currents; the paper reports qualitative agreement but a remaining discrepancy around the first magnetic diffraction minimum.

**Raw Table I angular coverage and relative cross-section errors** (computed from the published central values and total errors; not a covariance analysis):

| (Q^2_{eff}) (fm^-2) | Number of angles | Relative-error range |
|---:|---:|---:|
| 24.7 | 2 | 5.2–7.1% |
| 30.2 | 3 | 5.6–12.6% |
| 34.1 | 3 | 6.4–9.2% |
| 40.2 | 2 | 6.9–12.9% |
| 45.0 | 3 | 9.9–16.1% |
| 49.0 | 1 | 16.4% |
| 55.1 | 2 | 4.0–14.1% |
| 60.8 | 2 | 33.6–70.8% |

The (Q^2_{eff}=49.0) point is a single forward-angle measurement. The paper extracts (F_C) there under the assumption that the magnetic contribution is negligible; it does not extract (F_M) at that point. The (Q^2_{eff}=60.8) cross sections have large relative errors. A global fit cannot be reconstructed from the published marginal errors alone because a full covariance/normalization matrix was not recovered.

### B. Table II extracted form-factor quality gate

The new Lean module encodes all eight Table II rows. Values and sigmas are stored as exact integers scaled by (10^{-7}); (Q^2_{eff}) is stored in tenths of fm^-2.

| (Q^2_{eff}) | (delta F_C/F_C) | (delta F_M/F_M) |
|---:|---:|---:|
| 24.7 | 2.26% | 15.1% |
| 30.2 | 3.16% | 17.8% |
| 34.1 | 3.49% | 11.4% |
| 40.2 | 3.95% | 21.8% |
| 45.0 | 5.30% | 28.7% |
| 49.0 | 8.29% | **not extracted** |
| 55.1 | 10.33% | 29.9% |
| 60.8 | **210.0%** | 38.5% |

Two important exclusions follow:

- (F_M) at 49.0 is absent, so this point cannot be a magnetic-form-factor holdout.
- At 60.8, the (F_C) sigma (2.10e-5) exceeds its central magnitude (1.00e-5); its one-sigma interval contains zero. This point cannot localize a charge-form-factor zero.

The paper describes an apparent second magnetic minimum in the vicinity of (Q^2\sim50) fm^-2. The table's absolute magnitudes, missing (F_M) at 49.0, and large high-(Q^2) errors do not establish a signed zero or a precise minimum location. The possible charge minimum beyond the upper measured range is not a measured zero.

### C. Independent spectroscopy and magnetic channel

**CREMA 2025:** three measured muonic-(^3He^+) transitions are used to extract the helion charge radius (r_h=1.97007(94)\,\mathrm{fm}). This is a theory-dependent extraction from measured transition energies, not a direct measurement of a worldtube/core boundary. It may serve as one provisional dimensionful calibration anchor only if the model's dimensionless closure is frozen; if used for calibration, it is not also counted as an independent validation datum.

**Schneider et al., Nature 606, 878–883 (2022), DOI 10.1038/s41586-022-04761-7:** the directly measured quantities include the bound-ion (g'_I(^{3}He^+)=-4.2550996069(30)_{stat}(17)_{sys}) and the zero-field hyperfine splitting (E_{HFS}^{exp}=-8,665,649,865.77(26)_{stat}(1)_{sys}\,\mathrm{Hz}). The quoted bare-nucleus value (g_I=-4.2552506997(30)_{stat}(17)_{sys}(1)_{theo}) is derived using the calculated diamagnetic shielding (sigma=0.00003550738(3)); it is not a second independent direct measurement. The paper states that the generated/analysed datasets are available from the corresponding author on request.

## 4. What would distinguish H(s)H from standard nuclear form factors?

For a spin-1/2 target the standard elastic response has separate electric and magnetic form-factor functions. In the JLab paper's convention:

[
A(Q^2)=F_C^2(Q^2)+\frac{2}{3}\tau F_M^2(Q^2),\qquad
B(Q^2)=\frac{4}{3}\tau(1+\tau)F_M^2(Q^2).
]

A statement that “one current” produces both channels is not yet a prediction. It becomes discriminating only if one frozen finite-core geometry and one source-defined response/current law determine both (F_C(Q^2)) and (F_M(Q^2)), with no independently adjustable magnetic profile or per-channel shape function.

If (F_C) and (F_M) remain arbitrary independent functions, the construction is a reparameterization of the standard two-form-factor description, not a new observable prediction.

### Proposed calibration/holdout matrix (not yet executed)

| Hypothesis | Shared parameters | Calibration | Holdout | Predicted observable | Standard comparator | Falsification rule |
|---|---|---|---|---|---|---|
| Standard nuclear-current baseline | Published nuclear interactions/wavefunctions, nucleon form factors, one- and two-body/MEC currents, relativistic/radiative corrections | Same predeclared low-(Q^2) charge subset or one declared radius anchor | JLab E04-018 raw Table I cross sections; direct (g'_I) and HFS; CREMA transitions/radius if not used for calibration | Raw (d\sigma/d\Omega(E,\theta)), extracted (F_C,F_M), spectroscopy observables | Existing AV18/UIX/hyperspherical-harmonic and MEC calculations, with the paper's correction model | Frozen-model residuals against the same full covariance and theory-error model |
| H(s)H one-core candidate | `epsilon` (core thickness), `ell_f` (first-order coil radius), worldtube axis-to-circumference dimension (symbol unresolved), stiffness law (not operationalized), one current normalization, explicit time/metric/projection maps | At most one independent dimensionful anchor after dimensionless closure; candidate (r_h) is theory-extracted and must be treated accordingly | Same JLab raw cross sections and independent (g'_I)/HFS; no refit to magnetic channel | Both (F_C) and (F_M), then raw cross sections, from the same core/current map | Same standard baseline and same calibration/holdout split | Reject the frozen H(s)H readout if its holdout vector falls outside the pre-registered predictive region |
| Unconstrained two-profile null | Independent (F_C) and (F_M) functions or separate channel normalizations | Arbitrary channel fits | Same data | Can reproduce the two channels independently | Equivalent in freedom to standard two-form-factor fit | **Not a distinguishing H(s)H prediction** |

**Proposed threshold, not adopted:** use the full experimental covariance and model-prediction covariance; preregister a global (p<0.05) rejection rule or a 95% predictive-region rule. The current paper tables provide total marginal errors but not the full covariance/normalization matrix, so a numerical global (chi^2) threshold is **NOT SCOREABLE** yet. No H(s)H fit or prediction was made.

The raw cross sections, not only the extracted form factors, should be the primary holdout. The forward-only 49.0 point must pass through the same extraction assumption; it cannot be treated as an independent magnetic measurement.

## 5. Proof-first and existing PR state

### PR #1133 — geometric label-preserving pullback

- Branch: `research/ravel-carrier-slice-reconstruction-20261031t0212z`
- PR head: `0ff14b77d7ad5784e8b080739010873a9b31131f`
- Actions run #41274705850, job #124754418842.
- Actual checkout: merge ref `b21909cbba62ea56431b49a3993fef028983cbc4`.
- Module blob `ee05b9b104cd69e922face1cf1beb072e380b429` and root aggregator blob `6dac0ef306bd968450c31968e1d00e28710574dd` match between PR head and merge ref.
- Lean 4.34.0 / Lake 5.0.0; 8,945 build jobs; zero `sorryAx`, zero `admit`, zero errors.
- Classification: **MERGE_REF_BUILD_SUCCESS / EXACT_PR_HEAD_NOT_STANDALONE_VERIFIED**.
- Tests, lint, and separate automated axiom audit were skipped.

### PR #993 — helion measured-input gate

The prior run #41207194774 was also a merge-ref build, not an exact-head checkout. Its earlier “exact-head” label was corrected additively in Ravel report/receipt amendment 01. The magnetic-moment module and root aggregator blobs match between the intended PR head and that merge ref.

This run adds `RavelHelionJLabE04018DataGate.lean` to the existing PR #993 branch:

- Branch: `research/ravel-helion-charge-radius-inverse-gate-20261029t0824z`
- PR head: `6be0a2096306e154b2b0a8ad0359a36c60d60018`
- New module blob: `415b1654e0f95b35172fa98a490589d0d91abfe3`
- Root aggregator blob: `004eb0f9e6dd334c511aa1e70977fffd9ae2b5aa`
- Actions run #41290025410, job #124799444666.
- Actual checkout: merge ref `ce0bfd4f6d6ecc50cc46ac5c6b1b1fb490f3991f`, merging the PR head into base `61cc8b65ffed70296e0121dbae067892a79c81d4`.
- Module and aggregator blobs are identical at PR head and merge ref.
- Lean 4.34.0 / Lake 5.0.0; build completed successfully, 8,949 jobs.
- Ten theorem-specific axiom reports: three report no axioms; the remaining reports use only standard Lean `propext`, `Classical.choice`, and `Quot.sound`.
- Full log: zero `sorryAx`, zero `admit`, zero errors.

Correct classification: **MERGE_REF_BUILD_SUCCESS / EXACT_PR_HEAD_NOT_STANDALONE_VERIFIED**. Tests, lint, nanoda, and the separate automated axiom-audit action were skipped. Local Lean/Lake are not installed in this runtime.

The new module proves finite arithmetic and admissibility facts about the encoded published Table II: eight rows, increasing (Q^2_{eff}), no magnetic extraction at 49.0, exclusion of that point from magnetic holdout, and the quoted relative-error/one-sigma facts at 24.7, 55.1, and 60.8. It does not validate the source transcription, recover the raw covariance, prove a current map, or establish physical truth.

## 6. Factory Floor intake

The current `Satobloc/FACTORY_FLOOR` README and `FLOORROOM_TODO.md` were read. The visible intake is a Markdown issue register (existing EQ entries); the TODO still describes a machine-readable companion as future work. No machine-readable intake endpoint or stable Floor ID contract was found.

A source-linked handoff packet is prepared in the Ravel workspace as `FACTORY_FLOOR_HANDOFF_PENDING_2026-11-01T0836Z.md`. Status: `READY_FOR_OWNER_ROUTING / NOT_DELIVERED`. No Factory Floor issue or direct write was made.

## 7. Corrections, publication, and boundaries

- Ravel's previous labelled-pullback issue #1194 is now **PUBLISHED_VERIFIED**; issue payload and fetched artifact match exactly. Publisher comment #6553633151; artifact blob `1930ed7f17a75a18f85df50c3c03bfb9c23e4c81`; SHA-256 `c32f41c92a86ffaa23d35ab52cf34db29fb0c9b403ad05c1440be5ade59e7e45`. The time-stamped artifact was not rewritten.
- Aster lane-3 Mersearch completed after its earlier pending report, but the shared bridge's public manifest/receipt query redaction issue remains a Sable/Tern cross-lane item. Ravel did not alter the shared workflow or those artifacts.
- BEDROCK unchanged. No SAT-O or Blockwave equation modified. No H(s)H prediction, fit, physical calculation, theory promotion, manuscript edit, reader change, or paper-gate advancement.
- Code Grurple remains ACTIVE. November 9 P1, November 30 P2, and December 14 P3 remain separate.
- No new tool, dependency, branch, or PR. Existing PR #993 was extended; PR #1133 remains open/draft/unmerged.
- Orson's protected P1 cognition remit remains untouched. The next ring identity is Orson Vay, but the handoff is context-only and no inbox/task transfer is made.
- FIE review is not due; last full review October 27. Unrelated-reading cursor remains `TheTANGLE.txt`, line 1241; no repetitive break was performed.

**Next exact work:** recover the JLab cross-section covariance/normalization data and the source-defined (E_\epsilon) and (R_t) maps. Until those exist, no worldtube-to-current physical prediction is scoreable.
