# Lane 24 | Measured-system and Lean status delta
**Date:** 2026-11-08  
**Relay key:** `REVROT3-19-20261011:695:s2`  
**Selected ring identity:** Sable  
**Next ring identity:** Loom  
**Epistemic status:** assistant reconstruction / source audit; no authenticated Sable instance or cross-thread delivery is claimed.

## Executive result

This run made one useful advance: the existing finite-core/vortex source portfolio is better characterized, and the current Kestrel geometry PR has a newer successful merge-reference Lean build than the November 4 CODATA note recorded. The best new empirical lead is Estepa-Cantero et al.'s 2026 4D-LPT bubble–vortex-ring experiment. Its full 4D-LPT data remain available only upon reasonable request, but its supplementary material includes raw camera-image sequences. That improves its readiness from “supplementary movies only” to “raw-image subset located; reconstruction inputs still incomplete.”

No physical model comparison, H(s)H prediction, fit, or numerical physical calculation was performed. No P2 system was selected. P0 remains active. No theory was promoted.

## 1. Sable historical specialist charter: direct-source check

Read the current [Sable workspace README](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/SABLE/README.md), checkpoint, inbox, and preceding Sable receipts.

The historical source is not merely an assistant summary:
- The Library raw conversation export contains direct user-role instructions from 2026-09-14/15 establishing Sable's broad systems/capability remit: team-machine analysis, automation and outside-tool leverage, knowledge-base/resource surveying, scripting and reproducibility, capability mapping, and modular continuity.
- A separate raw conversation blob `3bf173c217e0755419152aa2225f39713929a5fe` contains direct user message `d3976dcf-c5dc-49c7-a523-e6469f4910db`, timestamp `2026-09-22T20:03:52.997Z`. It explicitly asks Sable to take “big bites” using a sieve and Mersearch/Mercer_Searcher for bulk triage and characterization.
- Current scheduler authority and the 2026-10-26 Steering Charter supersede any older implied permission to change schedules or allocate workers.

The present execution is assistant reconstruction under the selected ring identity. No authenticated Sable thread was established. The nine existing Sable inbox entries were left untouched.

## 2. Repository and control-plane preflight

Read the live HsH BEDROCK (667 lines), the 2026-11-08 Nathan Direct methodology/model overview (511 lines), the 2026-10-26 Steering Charter, Three Paper Campaign, three-repository onboarding, New Instance Start Here, current workflow orientation, revival rotation V3, V4-not-found recovery note, thread-first/routing rules, scheduler authority, workflow branching map, active automation roster, task graph, Code Grurple roster, and current Sable workspace/receipts.

At pre-write readback (before this report commit):
- HsH `main`: `760d61a519f5350b83867f9ca48be66864124626`
- SAT theory archive `main`: `35804a91bca29e596033837971de5db9848e9dfb`
- HSH_RESOURCES `main`: `169184fc76db367dcb1d95d5ecd104852b2926fa`
- Repository metadata reported zero forks for all three repositories.
- The task graph reports 16 declared branches but 18 records. Tern owns reconciliation; no graph edits were made.
- The existing :24 automation is still listed as enabled in the latest repository roster. No task, ID, schedule, phase, or enablement setting was changed. The live Automations ID-specific peek was not accessible in this runtime, so no stronger scheduler-state claim is made.

### P0 gate

The current Code Grurple roster still marks P0 ACTIVE. The eight-file P0 route vector was re-read against the established baseline: **8/8 blob identities match**, canonical manifest fingerprint `833ad26d6082dbba7278f01be2bf896c588a3db5d7fe37e762cec7a7f1370161`. No route trigger was observed. No standdown, reader acceptance, or deployment identity was inferred.

The paper gates remain separate:
- November 9 P1: Orson-owned, NOT READY.
- November 30 P2: HOLD; no selected measured system.
- December 14 P3: separate full-theory gate, not advanced.

## 3. Mersearch and archive-source status

Mersearch remains the preferred internal archive route. The current tool inventory exposes no direct Mersearch connector or local CLI; the existing four-lane GitHub Actions bridge is the available route.

All four documented request lanes remain occupied:
1. `calder-angle-geometry-source-fidelity-20261102-1337`
2. `archive-harvest-20261025-optics-01`
3. `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`
4. `kestrel-finite-core-geometry-source-fidelity-20261102-2200`

The four request files still report `requested`. The expected request-scoped `RUN_MANIFEST.json`, `SEARCH_RECEIPT.md`, and `SEARCH_RECEIPT.json` paths were not present in HsH. The four lane workflows exist, but no completed output artifact was independently read back. No request was submitted, overwritten, or duplicated. The current Tern inbox already records the four-lane state; no duplicate Tern notice was appended.

Consequences:
- GitHub code search was used only as a bounded fallback, not represented as full archive coverage.
- No verbatim SAT-O or Blockwave original equation was newly recovered, transcribed, or corrected.
- No equation hash/date pair was promoted. Original and corrected equations remain separate future source-custody tasks.

## 4. Existing tools, Lean work, and cost check

No new tool, dependency, branch, PR, workflow, or paid service was created.

| Existing resource | Current readback | Disposition |
|---|---|---|
| Math Hopper issue [#578](https://github.com/Satobloc/HsH/issues/578) and PR [#854](https://github.com/Satobloc/HsH/pull/854) | Existing adapter and smoke workflow; full three-repository/100-document pilot remains unverified | Reuse; do not duplicate |
| Whirligig Kernel 0 | Sandbox only; restricted projection maps; no general equation-to-curve encoder | Keep sandboxed |
| Local runtime | Python and Git available; no local Lean, Lake, Elan, or repository checkout | No local Lean claim |
| SciSpace | Existing connected app; used for a focused 2023–2026 empirical-literature sieve | No new tooling or paid API |
| Forks | Zero reported for the three repositories | No fork reuse candidate surfaced |

### Kestrel PR #873: newer successful build

PR [#873](https://github.com/Satobloc/HsH/pull/873) remains open, draft, and unmerged. Its current head is `1971e3d58a28f7c6de5cf024039dbcedb133121c`; its base is `infra/lean4-verification-20261023`, not `main`.

GitHub Actions run `42153410233`, job `127681789766`, completed successfully with Lean 4.34.0 / Lake 5.0.0 and a full 8,955-job build. The job log checked out merge-reference commit `a2c3304edafa5274530ce5286cbe15ac1ed47b0b`. Therefore this is a successful **merge-reference build**, not a standalone exact-head build or main-base integration.

Read-only source/log audit:
- `KestrelKelvinVortexReadout.lean` formalizes the two-sided contour readout `(r+, r-) ↔ (η, a)`, its inverse, and one-sided non-injectivity. This is a specific measurement/projection map, not a general H(s)H ontology.
- Its executed `#eval` checks return exact rational conversions: core uncertainty (100/60=5/3) px; contour width (500/60=25/3) px; uncertainty/contour-width ratio (1/5); PIV circulation uncertainty (1/200) m²/s; PTV vertical-velocity uncertainty (1/20) m/s. A separate Python rational check reproduced these conversions from the published rounded inputs.
- The WKBJ broadening theorem is conditional on a bracket (1.650 < B < 1.651), yielding (7.9 < \Delta k/(2\pi) < 8.1) m⁻¹. The logarithmic bracket itself is not proved in Lean.
- `KestrelMovingSlice.lean` now proves the moving-slice intersection rate carries the slope factor (dy/dz); it is not equal to the slice speed without the corresponding slope condition. This is an assistant-reconstruction geometry result, not a verbatim SAT-O/Blockwave equation.
- The audited modules contain no `sorry`, `admit`, or explicit `axiom` declarations. The theorem-specific `#print axioms` output shows only standard `propext`, `Classical.choice`, and `Quot.sound` dependencies. The workflow sets `nanoda-allow-sorry: true`, and its separate axiom-audit step was skipped, so this source/log check is not a substitute for an independent full axiom audit.

This build verifies only the formalized conditional statements. It does not validate the source-to-formalization translation, the experimental premises, or any physical equivalence.

## 5. Empirical-system sieve

A focused SciSpace search produced a five-paper comparison table. The strongest leads are:

### A. Estepa-Cantero et al. (2026): bubble–vortex-ring interaction

[Journal of Fluid Mechanics paper](https://doi.org/10.1017/jfm.2026.12078) · [arXiv PDF](https://arxiv.org/pdf/2606.08193) · [supplementary raw-image DOI example](https://doi.org/10.1017/jfm.2026.12078.sm002)

This is the strongest new 3D responsive-medium candidate:
- Water tank (0.25\times0.25\times0.6) m; 56 µm fluorescent tracer particles; vortex Reynolds numbers (8\times10^3)–(15\times10^3); initial core/ring ratio (a_0/R_0\approx0.3)–0.4; bubble radius (R_b=3.65\pm0.05) mm; (R_0/R_b\approx4.5); (We\approx0.4)–1.
- Six high-speed cameras at 1496 Hz; 4D-LPT measurement volume (100\times160\times80) mm³; 3D calibration from 11 target positions 10 mm apart; final image scale 17.91 px/mm; volumetric self-calibration.
- Reported cumulative relative velocity uncertainty is below 2% near the vortex core and up to 10% in the far field.
- Three observed regimes: weak interaction, bubble capture/drag/release, and binary bubble breakup.
- Circulation is checked by both a vorticity surface integral and a velocity line integral; the authors report agreement.
- The full supporting data are available upon reasonable request. Supplementary movies are listed for raw camera-image sequences for Cases I–III, but the 4D-LPT trajectories, calibration coefficients/target images, and reconstruction-ready files were not retrieved. No Zenodo or other raw-data repository was independently verified. A download attempt for the supplementary movie did not complete.

**Readiness:** strongest current candidate for a finite-core, 3D, responsive-medium interaction, but NOT selected. Raw-image supplements are not equivalent to the calibrated 4D-LPT trajectories. Reproduction also depends on the paper's DaVis/Shake-the-Box workflow; no replacement pipeline was built.

### B. Knister et al. (2026): counter-rotating vortex interaction

[Journal of Fluid Mechanics paper](https://doi.org/10.1017/jfm.2026.11120)

The open article reports volumetric PIV/cavitation measurements of counter-rotating vortices, three streamwise measurement volumes, finite-core deformation, circulation, eccentricity, axial velocity, and stretching. The facility reports velocity uncertainty about 0.06% and static-pressure uncertainty about 0.08%; uncertainty in derived core/circulation/strain quantities is higher because of numerical differentiation/integration. The paper reports a mismatch between a linear-theory wavelength prediction and observation, with the thin-filament assumption (b\gg r_c) not satisfied. Supplementary movies are present, but no raw volumetric-PIV dataset locator was found.

**Readiness:** strong potential finite-core falsifier; raw fields and derived-quantity covariance still missing.

### C. Barckicke et al. (2026): Kelvin waves along a finite vortex core

[Nature Physics paper](https://doi.org/10.1038/s41567-026-03175-w) · [Figshare dataset DOI](https://doi.org/10.6084/m9.figshare.30903347)

The paper reports 60 µm/px image scale, a 0.5 mm contour width, typical core readout uncertainty around 0.1 mm, PIV circulation uncertainty 0.005 m²/s, and PTV vertical-velocity uncertainty 0.05 m/s. The data DOI is identified in the paper, but the Figshare file manifest, version, bytes, and joint covariance were not retrieved. The paper fits (Gamma) and (v_z) to the dispersion data and then checks consistency against measured PIV/PTV values a posteriori; this is not a blind held-out prediction.

**Readiness:** strong finite-core/Kelvin-wave candidate; data locator present, files not yet verified.

### D. Additional leads

- Han et al. (2026), *Evolution of three-dimensional vortex structures on interaction of vortex ring with free surface*, DOI [10.1063/5.0312376](https://doi.org/10.1063/5.0312376): abstract reports time-resolved 3D LPT at (Re=4500) and (7400); raw-data locator and uncertainty detail were not available in the accessible record.
- Estepa-Cantero's study is also a better-developed alternative to a purely planar bubble/vortex study because it combines volumetric carrier-phase velocity with reconstructed bubble morphology.
- GW241011 remains the existing inspiral candidate with public strain data; it was not retrieved in this run, and parameter-estimation products remain waveform-model dependent.
- The Huttunen vortex-ring-collision Zenodo locator remains unverified; no raw dataset was retrieved.
- No rope experiment or universal rope constraint was established. WWRD climbing-rope mechanics remains a first-blush geometric heuristic, not a physical equivalence.

**Selection decision:** no P2 system selected. Estepa-Cantero is the leading 3D responsive-medium candidate if the full 4D-LPT/calibration package can be obtained; Knister is the leading finite-core interaction/falsifier candidate; Barckicke is the leading finite-core/Kelvin-wave candidate with a named data DOI. No numerical comparison or H(s)H prediction was performed.

## 6. CODATA source custody

The Morrow source-custody note was read and checked against the official NIST source:
- Current NIST constants database: 2022 CODATA, Web Version 9.0 (updated 9 May 2024); this remains the latest recommended set shown by NIST. The next regularly scheduled adjustment is 2026.
- The 2022 adjustment uses theoretical and experimental data available through 2022-12-31.
- The 2022 report describes 133 input data, 79 adjusted constants, and 54 degrees of freedom.
- (G) is handled separately because it is independent of the other adjusted constants: 16 measurements, three stated correlation coefficients, no new (G) input since the 2018 closing date, and a 3.9 multiplicative uncertainty expansion factor to address inconsistency.

Sources: [NIST 2022 CODATA paper](https://www.nist.gov/publications/codata-recommended-values-fundamental-physical-constants-2022), [NIST version history](https://physics.nist.gov/cuu/Reference/versioncon.html), [official CODATA paper PDF](https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=958143).

No CODATA numerical comparison was made. The recommended (G) value is an evaluated least-squares result, not a new experiment.

## 7. Disposition and next actions

1. Keep P0 ACTIVE; do not start a new P2 cycle or promote a theory claim.
2. Do not overwrite any Mersearch request. When a lane actually frees, use the existing bridge to recover original SAT-O/Blockwave sources first; preserve verbatim equation text, source date, and SHA separately from any corrected transcription.
3. For Estepa-Cantero, seek the full 4D-LPT trajectories, per-case calibration coefficients/target images, and covariance or uncertainty products. The raw-image movies alone are not enough for a physical calculation.
4. For Knister, seek raw volumetric PIV fields and uncertainty/covariance for derived core quantities; the observed thin-filament mismatch is a potential falsifier, not yet a reproducible numerical test.
5. For Barckicke, retrieve the Figshare versioned file manifest and bytes before reproducing the dispersion fit or making a prediction.
6. Keep forward geometry→equations, reverse equations→geometry, and independent observable prediction as separate tests. Require explicit projection/composition maps and their conditions; do not infer nesting or equivalence from visual resemblance.
7. Do not treat the climbing-rope heuristic as a physical equivalence.

No public issue/comment was created: issue #565 remains the existing candidate docket, and the new/updated leads are not yet data-ready for a new public claim. No handoff to Loom was made; no cross-thread delivery or acknowledgment is claimed. No task, branch, PR, automation, signet, or chat name was changed.
