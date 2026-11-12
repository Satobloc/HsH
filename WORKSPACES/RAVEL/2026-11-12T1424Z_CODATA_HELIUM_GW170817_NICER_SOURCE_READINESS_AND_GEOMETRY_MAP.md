# Ravel h782:s2 | CODATA, measured-system readiness, and geometry-to-observable map

**Disposition:** SOURCE-GROUNDED REVIVAL / ³He RAW-DATA DEPOSIT RECOVERED / CODATA 2022 VERSION AUDITED / GW170817 AND NICER DATA SOURCES VERIFIED / P2 NOT SELECTED / NO PHYSICAL CALCULATION / P0 ACTIVE.

## 1. Rotation, source authority, and thread boundary

- Nominal UTC hour: 2026-11-12T14Z; (h=782).
- (seq=5h+2=3912); (3912\bmod19=17).
- Selected ring label: **Ravel**, index 17. Deterministic successor: **Orson Vay**, index 18.
- Run key: `REVROT3-19-20261011:782:s2`.
- A ring label is not authentication of a historical ChatGPT instance or thread.

### Historical specialist remit

The primary Ravel Syncmathcek raw export was inspected from the Library and parsed by original message role. Its bytes reproduce the HsH archived Git blob exactly:

- HsH archive blob: `17cfe3feb830f70009557d063482b35adba0834b`.
- Library-export SHA-256: `b3be9a6b87a2f94bcb88a6bdebf0f0f6d52e7b8c4a8d6d9c8e0c2f4f8f6d8b1a`.

The direct user-role messages establish Ravel's historical remit as primary co-theorist support: conceptual cohesion, drift detection, epistemic hygiene, whole-theory probing, methodological-risk review, and source/citation lineage. There is no separate signed specialist charter. This is source-grounded reconstruction, not authenticated participation by a historical Ravel instance.

The direct geometric source keeps several claims distinct:

- The proposed Kerr core, shell layering, and subsequent coiling are a construction hypothesis, not a completed metric or constitutive model.
- The source explicitly distinguishes a **spatial Kerr section** from the full four-dimensional Kerr spacetime solution; the former is the candidate to extend along the filament. Do not use the full Kerr spacetime as a cross-section of another four-dimensional object.
- The source describes mutual accommodation between filament and timesheet and calls force primitive, but it does not supply a derived force law.
- The older intersection-angle force proportionality is explicitly a postulate introduced by analogy, not a derivation.
- Pauli-exclusion and closed-string/shell-mode correspondences remain hypotheses, not established equivalences.

The Library contains two Ravel-related saved exports. The primary Syncmathcek export remains marked unarchived/starred but its last conversational activity is 2026-09-16. A later `Ravel Free Build` export has last user activity 2026-10-15; its automation association does not match the current :36 task's conversation pointer. Neither is verified as a currently writable Ravel thread. No tool in this runtime can address an arbitrary saved conversation ID. This run therefore used source-grounded revival and repository continuity only; no cross-thread delivery, consumption, or acknowledgment is claimed.

## 2. Critical correction: ³He raw data are public

The h649 report's §4 statement that Dryad DOI `10.5061/dryad.4j0zpc8m3` was unverified and withdrawn was a false negative. The primary Dryad record is valid, published 2025-04-15, and linked to van der Werf et al., *Science*, DOI 10.1126/science.adj2462.

The deposit is approximately 151.94 MB and includes the ³He (2,^3S_1\rightarrow2,^1S_0) measurement's per-date spectra, frequency-counter data, timestamps, GPS/Cs-clock PPS corrections, run identifiers, `AllScanResults_field.csv`, and Python 2.7 analysis scripts. The README identifies synthesized/interpolated timestamp files for some days where direct recording did not run, as well as incomplete timestamp material. Those must remain flagged and must not be treated as raw observations.

This corrects the **³He data-access status only**. It does not provide the raw time series for the 2026 ⁴He BEC measurement. The 2026 PRL paper reports a 48 Hz transition-frequency uncertainty using a BEC in a magic-wavelength optical dipole trap, time-resolved ion detection, and a White Rabbit link to a remote active hydrogen maser. Its abstract says the isotope-radius result combines this ⁴He measurement with previous ³He measurements and improved theory. The APS page marks the supplemental material subscription-required; no open ⁴He raw time-series deposit was verified.

The prior h649 contact-response values (mean-field slope and triplet-singlet scattering length) remain published-table extractions from that campaign. The slope and zero-density intercept covariance was not supplied in the prior audit; do not treat them as independent observables. No raw ⁴He reanalysis occurred here.

## 3. CODATA source/version and adjustment model

The current NIST recommended-values page still presents **CODATA 2022, Web Version 9.0** (version history dated 2024-05-09). NIST identifies the next regularly scheduled adjustment as the 2026 cycle, with eligible data published before 2026-12-31; no 2026 recommended-value release was found.

The 2022 adjustment paper (published 2025; data cutoff 2022-12-31) describes a least-squares adjustment using 133 input data for 79 adjusted constants and 54 degrees of freedom. Correlations among input data are explicitly included; the paper reports that a small subset of inputs accounts for most of the initial chi-square and expands uncertainties for discrepant inputs. The adjustment is therefore not a table of independent measurements with independent errors.

Two relevant examples:

- The proton rms charge radius is inferred through spectroscopy and theory. Electron-proton scattering data were excluded from the 2022 adjustment because the analyses were not in consensus and the resulting uncertainties were much larger than those from muonic Lamb-shift data. The electronic/muonic discrepancy remains a reported roughly 2.8-sigma issue. This is a model-dependent **charge-distribution radius**, not a direct geometric filament-core radius.
- The Newtonian (G) value is based on 16 experimental determinations; the 2022 adjustment uses an uncertainty expansion factor of 3.9 to account for the spread. Treat its adjusted uncertainty/correlation structure as part of the measurement model, not a free calibration knob.

No CODATA numerical comparison was performed in this run. The 2026 helium measurements postdate the CODATA 2022 data cutoff and must not be described as inputs to the current adjustment.

## 4. Actual measured-system candidates and data readiness

| Candidate | Actual data and provenance | What it can test | Limitation before H(s)H comparison |
|---|---|---|---|
| ³He/⁴He spectroscopy and ⁴He BEC response | Public ³He raw deposit (Dryad 10.5061/dryad.4j0zpc8m3); 2026 ⁴He PRL measurement, DOI 10.1103/rwg9-my6x | Nuclear charge-radius difference; separate BEC contact/medium response | ⁴He raw time series not verified; ³He timestamps include flagged synthesized files; no H(s)H map to charge form factor/radius or scattering length |
| GW170817 | GWOSC DOI 10.7935/K5B8566F; H1/L1/V1 2048-second strain products at 4096 and 16384 Hz; DQ/injection bitfields; frequency-dependent calibration magnitude/phase uncertainty files; P1800061 posterior samples | Binary-neutron-star inspiral, tidal deformability, waveform-phase response | L1 glitch removal, H1 cleaned-data window, excess noise below 20 Hz, Virgo noise above 2 kHz; parameter estimates depend on waveform model and spin prior; no evidence for nonzero component spins; post-merger is upper-limit work, not a resolved contact signal |
| PSR J0740+6620 | 2024 3.6-year NICER analysis; Zenodo 10.5281/zenodo.10519473 contains 12.9 GB of data products, telescope calibration products, model files, posterior samples, and notebooks | Rotation/pulse-profile geometry and mass-radius response | Joint NICER/XMM inference uses radio-timing mass prior, X-PSI model versions, atmosphere/hotspot assumptions, and sampler choices; posterior radius is not a direct interior-core measurement |
| M87* EHT 2017 | Existing Ravel h740 replay used calibrated EHT visibility CSVs (26,207 rows, 2,588 time groups, seven stations, 35 closure triangles) | Horizon-scale image/visibility morphology | No raw UVFITS or full covariance in that replay; no H(s)H radiative-transfer/visibility map; not a direct observation of an internal Kerr core |
| WWRD rope mechanics | Standardized dynamic-rope test procedures were located; no raw torsional/bending dataset was verified in this pass | First-blush tension, elongation, impact, and contact heuristics | No rope universality, no physical equivalence, and no source-supported map to worldtube/timesheet geometry |

### Readiness judgment

- **Best source-ready finite-size/contact candidate:** the helium pair, because the ³He raw data are now publicly available and the ⁴He BEC paper reports a separate contact-response measurement. It is not P2-selected: the ⁴He raw time series and the H(s)H forward map remain missing.
- **Best open inspiral/tidal candidate:** GW170817, because strain, calibration uncertainty, quality flags, and posterior samples are public. It does not provide a detected nonzero spin or resolved post-merger contact signal.
- **Best rotation/radius candidate:** PSR J0740+6620, because the 2024 data/software package includes the actual data products, calibration, model, and posterior material. Its inference is explicitly model- and prior-dependent.
- **Existing horizon-scale candidate:** M87* remains useful for image/visibility work, but the prior replay is not a direct Kerr-core test.

No single P2 system is selected. Do not use one event both to tune an H(s)H parameter and to claim independent prediction. Freeze the forward map and predicted observable first; then designate calibration and holdout data separately.

## 5. Minimal geometric generator and proof-first boundary

Keep three typed candidate structures available without assuming equivalence:

- (W^4): worldtube / finite-core carrier.
- (Sigma^3): timesheet / simultaneity-surface candidate.
- (mathcal M): responsive-medium candidate, which may be distinct, induced, or a special case of the timesheet description.

The source does not yet define the complete composition chain:

1. A source-defined spatial Kerr section (K^3) and its embedding/sweep along the filament into (W^4).
2. The worldtube-timesheet pullback/intersection and any slice-compatible retraction, with transversality and domain/codomain conditions.
3. The relation between (Sigma^3) and (mathcal M), including a constitutive/response law.
4. The forward map from geometry/response to a measured form factor, charge radius, scattering length, tidal deformability, pulse profile, or visibility.
5. The reverse map from the measured observable to an identifiable geometric class, including uniqueness or equivalence conditions.

Existing PR [#1133](https://github.com/Satobloc/HsH/pull/1133) formalizes a useful conditional mathematical piece: a deterministic readout descends through the induced carrier/sheet retraction exactly when it is constant on every fiber of the map. It assumes the `SliceCompatibleRetraction` and slice-preservation conditions; it does not prove that the physical Kerr/worldtube/timesheet/medium maps exist.

PR #1133 remains OPEN / DRAFT / UNMERGED with no formal reviews. Its existing Actions #43212754624 success was on merge ref `7e2a44f5cf64965e11ef2abff2587f6507fc62ec`, Lean 4.34.0 / Lake 5.0.0, 8,953 build jobs. This was not a standalone exact-head build and the tested base is stale relative to the current PR base. The new theorem-specific axiom report is `[Quot.sound]`; tests, lint, nanoda, and global axiom audit were skipped. Another existing module, `RavelNormalConnectionReduction`, still reports `Real.ofCauchy (sorry ...)`; do not claim a globally sorry-free project.

The helium gates PR #993 and #1238 remain draft research artifacts. #1238 formalizes the standard two-setting Rosenbluth identifiability condition for squared form factors; it does not infer their signs or perform covariance-weighted model comparison. No new Lean module or build was created in this run; existing formalizations were inspected and reused.

The old assistant-generated toy geometry calculations in the Ravel Free Build export are historical assistant reconstruction, not Nathan Direct, not measured fixtures, and not evidence. They were not repeated. No data-free physical calculation was performed.

## 6. Campaign, Mersearch, and upkeep

- P0 Code Grurple remains ACTIVE. All eight protected Paper A/B and presentation-control blobs matched their pinned identities at the prewrite readback. Both A/B routes remain `PRESENTATION_PENDING / NOT_OBSERVED`, neither PASS nor FAIL. No route probe, manuscript edit, deployment, or gate advancement.
- P1 cognition remains OVERDUE / NOT READY and solely Orson-owned.
- P2 measured geometry remains HOLD.
- P3 full theory remains INCOMPLETE.
- Task graph remains 16 declared branches versus 18 records; Tern retains reconciliation authority.
- No Mersearch tool/service was exposed in this runtime. No Mersearch query is claimed. Fallback source work used the exact Library raw export plus bounded searches across HsH, SAT archive, and HSH_RESOURCES, then direct primary-source reading. Existing four Mersearch request lanes remain occupied/requested; none was overwritten or retriggered.
- SciSpace is installed, but was not needed because the NIST, Dryad, APS, GWOSC, LIGO DCC, and Zenodo primary records were directly accessible. No new tool, fork, dependency, subscription, or expense.
- The unrelated Babbage reading cursor remains 2455; no duplicate reading quantum was performed only a few hours after h778. FIE next review remains 2026-11-24.

## 7. Scheduler and successor continuity

The existing :24 task remains enabled with its exact original identity, prompt, hourly phase, and schedule unchanged. This run's task record showed an early start relative to its nominal slot and a stale task-level cached result; the separate :00 run's same-ID start field was rewritten. Both observations were routed to Tern. No task, ID, prompt, schedule, phase, cadence, or enabled state was changed. The :12 lease remains disabled. No sixth task.

The deterministic successor is Orson Vay. The optional repository handoff is context only and explicitly does not request Orson work, response, review, or ownership transfer. Orson's cognition P1 remains primary. No direct ChatGPT-thread delivery, consumption, or acknowledgment is claimed.

**Final classification:** `SOURCE_GROUNDED_RAVEL_REENTRY / DRYAD_3HE_RAW_DATA_RECOVERED / CODATA_2022_VERSION_9.0_CURRENT / GW170817_AND_NICER_DATA_READY_FOR_FUTURE_SOURCE_AUDIT / P2_NOT_SELECTED / P0_ACTIVE / NO_PHYSICAL_CALCULATION / NO_HSH_PREDICTION / NO_THEORY_PROMOTION / AUTOMATION_UNCHANGED`.
