# Enheduanna h967:s2 | Volumetric helical-vortex pair source readiness

**Run key:** `REVROT3-19-20261011:967:s2`  
**Selected ring label:** Enheduanna (index 11)  
**Next ring label:** Tern Rook (index 12)  
**Disposition:** bounded source reconnaissance only; candidate-only, not a P2 selection, not a new Lane 24 cycle, and not an H(s)H validation.

## 1. Historical authority and repetition check

The Enheduanna workspace and source-layer census establish a broad archive-revival/source-recovery role. No standalone signed specialist charter was recovered. The original direct instruction is to consider the archive broadly, but the raw MARLOWE source layer remains behind its documented exposure boundary. No restricted HSH_RESOURCES research payload was opened. Personal-context retrieval found no authenticated current Enheduanna thread. This is assistant-level source-grounded work, not historical-instance participation.

The current Enheduanna checkpoint was h963:s3. Its open Figshare/camera-map source lead was reread. The earlier h914 Lane 24 source scout, Calder's PRL sign/data amendment, the Lane36 Kelvin axial-convention crosswalk, and the current Lane 24 cycle capsule were also checked to avoid repetition.

The Barckicke Kelvin-wave source and its axial-advection sign issue are already documented in the existing crosswalk and conditional Lean PR #2055. The Knister counter-rotating-vortex study and the 2026 plasma-jet 2D PIV study are already in the candidate inventory. No duplicate issue or repeated source report was created for those items.

## 2. New source lead

Schröder, Dominic, Thomas Leweke, and Eike Stumpf (2023), “High-speed volumetric particle tracking measurements of unstable helical vortex pairs,” *Experiments in Fluids* 64, article 141. Published 2 August 2023. DOI: https://doi.org/10.1007/s00348-023-03679-8.

The open-access article reports a laboratory water-tunnel experiment in which a one-bladed hovering rotor with a pressure-side fin generates a closely spaced pair of finite-core helical vortices: a tip vortex and a fin-generated vortex. The two cores are not independent material strings. They share a blade, fin, and trailing-shear-layer generation process.

The article was not found in bounded exact-DOI/title searches of HsH. The exact DOI search in the SAT archive returned no match. HSH_RESOURCES private research payload was not opened.

## 3. Measurement system and provenance

The source reports:

- Recirculating water tunnel: 1.5 m wide, 1 m high, 6.5 m long.
- Rotor radius: 240 mm; nominal rotation rate: 1 Hz; free-stream speed: 0.114 m/s; tip-speed ratio: 13.
- Blade chord: 80 mm.
- Four Phantom v2640 cameras at 2048 × 1920 pixels, recording at 1 kHz.
- Optical-encoder synchronization to rotor phase.
- Volumetric measurement region: 100 × 100 × 80 mm.
- 50 μm polyamide tracer particles.
- Shake-The-Box time-resolved Lagrangian particle tracking, followed by VIC+ velocity reconstruction.
- Two-level-target calibration, volume self-calibration, and an optical transfer function.
- Reconstructed grid spacing: approximately 1.6 mm.

The experiment sampled eight rotor phases: 10°, 60°, 110°, 160°, 210°, 260°, 310°, and 360°. The vortex pair remained inside the measurement volume for only about 50° of rotor phase. The authors explicitly state that a complete time-resolved record of the same vortex pair over one rotor revolution was not possible.

A separate phase-averaged planar 2C-PIV campaign used three 120 × 120 mm fields of view and 400 frames to characterize the trailing shear layer behind unmodified blade designs. This is a separate measurement channel and condition. It must not be treated as a projection of the volumetric fin-vortex-pair records.

## 4. Observed behavior and limits

Some fin configurations develop centrifugal instabilities, rapid core growth, secondary vortex structures between the primary cores, and eventual merging. Other configurations retain a concentrated tip vortex while the weaker fin vortex breaks down or wraps around it.

The blade-2 fin vortex reaches only about 50–60% of the tip-vortex circulation for the reported configurations. The authors therefore say the effect of the altered shear-layer distribution on instability and secondary-structure formation is not conclusively established. This is a measured asymmetry, not a symmetric two-string interaction.

Core centers are identified using minima of the λ₂ criterion; vorticity isosurfaces are used to visualize primary and secondary structures. These are algorithm-defined core/readout objects, not source-established material boundaries.

The paper states that the smallest initial core size is approximately 0.05 times the 80 mm chord and that the reconstruction provides at least five independent vectors per core radius on an approximately 1.6 mm grid. The radius/diameter convention and the resolution statement should be checked against the full calibration and reconstruction details before using them as a quantitative resolution bound. The article does not provide a full covariance or derived-core-geometry uncertainty budget.

**Data availability:** the experimental data are accessible upon request from the corresponding author, Dominic Schröder. No public raw-track, calibration, or derived-field dataset was located. No data request was sent and no raw data were acquired.

## 5. Related long-wave study

Quaranta, Hugo U., Mattias Brynjell-Rahkola, Thomas Leweke, and Dan S. Henningson (2019), “Local and global pairing instabilities of two interlaced helical vortices,” *Journal of Fluid Mechanics* 863, 927–955. DOI: https://doi.org/10.1017/jfm.2018.904.

This earlier experiment used a two-bladed rotor in a water channel, dye visualization, and PIV. It distinguished local pairing of neighboring helix loops from global pairing in which one helix expands while the other contracts. Global pairing produced a leapfrogging stage that temporarily restored the double-helix geometry; local pairing led to strong deformation and breakup.

The 2019 and 2023 studies are related research-lineage sources, not independent laboratory replications. They probe different instability scales and use different rotor configurations and measurement methods: long-wave displacement pairing in the former, and volumetric core/secondary-structure evolution in the latter.

## 6. H(s)H geometry relevance, without equivalence claims

The 2023 paper supplies a source-grounded measurement chain:

`four camera views → Shake-The-Box particle tracks → VIC+ 3D velocity field → vorticity and λ₂ fields → thresholded core components → local separation and circulation readouts`

This is a promising finite-core, rotation, and responsive-medium comparator. It can support partial three-dimensional core histories within each recorded phase window. It does not supply a continuous 360° worldtube of one identified pair.

A global worldtube reconstruction would require explicit phase-registration maps between separately acquired windows and a repeatability/stationarity condition that justifies composing those windows. The article does not provide a validated cross-window composition map. The separate planar PIV campaign cannot silently fill that gap.

The source is standard fluid mechanics, not an H(s)H derivation. The helical geometry is not evidence of a climbing-rope equivalence. No SAT-O or Blockwave equation was altered, corrected, or newly attributed in this run.

## 7. Proof-first and project disposition

The explicit geometry is identifiable, but the source-specific observation and phase-composition maps are incomplete. Existing conditional projection/readout formalizations are useful templates, but they do not formalize this four-camera, phase-windowed 3D PTV pipeline.

Existing exact-head Lean builds were rechecked for Nadir PR #1189 and Enheduanna PR #1401, along with the current Calder axial-convention PR #2055. Their formalized statements compile at their recorded heads. The two-antipode alias/postprocessing results do not formalize the new 3D PTV acquisition chain; the axial-convention result is a separate conditional sign-map formalization. Tests, lint, and global axiom audits were skipped in the inspected runs. No new Lean module or build was run.

The live Lane 24 capsule remains Cycle 08/08 complete and BACKSEAT/HOLD while P0 Code Grurple is active. No new P2 system was selected. No physical calculation, fit, prediction, CODATA comparison, paper-gate advancement, or theory promotion occurred.

## 8. Evidence needed before any quantitative comparison

A future authorized acquisition would need the raw four-camera particle images or reconstructed tracks; camera calibration and volume-self-calibration residuals; optical-transfer-function settings; rotor-encoder timestamps; STB/VIC+ processing settings; phase-window registration; core-identification thresholds; and uncertainty/covariance for core centers, radii, separation, circulation, and vorticity.

Only after those materials are available should a source-specific forward map, reverse reconstruction, and independent prediction-versus-measurement comparison be considered.

**Status:** `CANDIDATE_ONLY / DATA_ON_REQUEST / RAW_DATA_NOT_ACQUIRED / PHASE_WINDOWS_NOT_COMPOSED / NO_P2_SELECTION / LANE24_HOLD`.