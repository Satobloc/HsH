# Meridian | Projection-constant source genealogy and inverse-constant closure gate

**Run:** REVROT3-19-20261011:523:s3  
**Date:** 2026-11-01T19:36Z  
**Status:** SOURCE CROSSWALK IMPROVED / INVERSE-CONSTANT TEST GATE SPECIFIED / PHYSICAL AND LEAN FORMALIZATION BLOCKED AT DEFINITION

## 1. Scope and authority

The historical Meridian Mover Trial conversation contains direct user-role assignments for solver architecture, cross-formalism work, and verification of the Whirligig/GR-QM correspondence. The later Meridian Free Build conversation contains a direct user request to recover the earliest Projection Constant material, including B, the retired “Nathan Constant” label, 0.239, 0.24, and 14.1 degrees, and to look before the quantity acquired a name.

This is a source-grounded continuation, not an authenticated historical Meridian instance or thread. The direct user request is a search instruction and retrospective recollection, not proof of the original event.

Current controls remain: Code Grurple ACTIVE; HAGALAZ BACKSEAT/HOLD; no theory promotion, no paper-gate advancement, and no modification of PR #895. The Meridian branch/PR remains open, draft, and unmerged.

## 2. Source genealogy: the near-0.24 family is not one constant

| Quantity | Recovered source | Provenance and status |
|---|---|---|
| 0.125 rad | May 9, 2025 LAB 1: Validation Lead raw conversation; cross-post also indexed by Tern's completed optical-kink Mersearch | The relevant raw user-role message relays assistant-generated simulation results. It is not a Nathan-authored derivation. It is an early optical-kink result, not B. |
| 1.48 rad, described as approximately 0.24 wavelength | May 2025 Lab 1 material | A phase in radians paired with a fraction of wavelength. “0.24 wavelength” is not “0.24 radians.” |
| 0.246 rad | SAT Mark V compiled optical-finding transcript | The transcript says this later value follows a broadened central eta spread and exceeds a prior 0.125 rad estimate. It is a compiled transcript, not a raw role-tagged execution record or independently reproduced measurement. |
| 0.239 rad | Undated SAT Mark V phase-shift note | The note uses an arctan kink and writes Delta-phi = eta integral sin-squared(theta-4) dx. It does not provide a dated raw derivation, units for eta, or a normalization relation sufficient to establish the claimed stability across kink width. |
| 0.24 plus/minus 0.02 rad | Domain-Wall Phase Shift Prediction Memo, last updated 2025-06-03 | A prediction based on Gaussian-beam-profile modeling, not a measurement. It is separate from the undated 0.239 note. |
| 0.239 rad as a 4D-to-3D projection artifact | February 25, 2026 raw “0.239 Radians in Science” conversation | Direct user hypothesis, not a derived projection map. The existing Loom source-genealogy audit already records this distinction. |
| B = 3/(4 pi), approximately 0.2387 | February 27, 2026 “Boiling Point Estimation” raw conversation and later summaries | The earliest occurrence found in the inspected raw conversation is inside a user-role relay of assistant-generated material. A later user-role pasted dictionary gives the explicit expression. The outer role authenticates carriage, not the embedded author's derivation. Two Library captures share the same conversation identity and substantial message overlap; they are snapshots, not independent witnesses. |
| 20 degrees | February 28, 2026 direct user hypothesis | A proposed alternative for the “real projection constant.” It is not a derived definition and remains separate from B and 0.239 rad. |
| 14.1 degrees / 0.246 rad | September 8, 2026 conversation | The user asks about 14.1 degrees; the radian/phase-snap identification is supplied in the assistant response. It is not a direct user definition of B. |
| B-stable approximately 0.24177 | Later NotebookLM/sandbox summaries | Assistant-generated or sandbox status only; not canonical and not an independent measurement. |
| B-tan = 1/(2 Delta-3) | September 2026 THE FOREST working draft | An assistant-reconstructed candidate normalization. With the declared Delta-3 = 2 pi/3, the algebraic identity gives 3/(4 pi). The factor of two is stipulated as a two-sided normalization; the draft explicitly says its geometric necessity is not yet derived. |

### Source-specific corrections

1. The May 2025 Lab 1 family contains multiple values and model versions. The May 9 raw conversation relays 0.125 rad; the compiled SAT Mark V transcript reports a later 0.246 rad after changing the eta spread; the undated note gives 0.239 rad; and the June 3 memo predicts 0.24 plus/minus 0.02 rad. There is no single, reproducibly established “Lab 1 value” of 0.239 rad in the currently recovered source chain.

2. The displayed formula in the later LAB1_code.txt is Delta-phi = (2 pi / lambda) Delta-n. As written, if Delta-n is a dimensionless refractive-index difference, the expression has inverse-length units. A path length or an integral over the optical path is missing unless Delta-n already denotes an unshown integrated quantity. The file's 0.246-rad summary line is therefore not, by itself, a reproducible calculation.

3. The undated SAT Phase Shift Note uses eta times an integral over dx. Since the integrand is dimensionless, eta must carry inverse-length units or an explicit normalization must be supplied. Its claim of width stability also requires a specified eta(w) relation or equivalent normalization. Neither is provided in the note.

4. Nathan's June 23 correction, recorded in the existing source-fidelity audit, disavows the optical-kink exercise as neither SAT verification nor SAT falsification and rejects refractive index as a direct measurement of theta-4. The optical artifacts remain historical analogies and source-recovery targets, not calibration data for B.

5. B = 3/(4 pi) is dimensionless by its displayed definition. The current symbol registry explicitly keeps B dimensionless and does not authorize calling it radians. The proximity of 0.2387 to 0.239 does not identify the scalar with the separately hypothesized 0.239-rad angle.

6. The 2024 helix/plane intersection readout and the 2026 4D-to-3D projection-angle hypothesis are different operations. Calder's November 1 source-fidelity report finds no commuting map connecting the two. The Forest draft's B-tan normalization is not that missing map.

## 3. New architecture improvement: inverse-constant cross-system closure gate

A direct user-role methodological instruction in the February 27 raw conversation describes deriving constants from real inputs, repeating the derivation with different independent inputs, and inserting a fake input as a negative control. This run operationalizes that method as a reusable gate.

### Stage 0: identity lock

Keep these types separate: B0 (dimensionless candidate coefficient), B-stable (later stabilized or fitted value, not canonical), Delta-phi-optical (optical phase result), Phi-snap (later phase-angle claim), theta-20 (direct user hypothesis expressed in degrees), and Delta-3 (tangent-step angle in the Forest construction). No aliasing by numerical proximity.

### Stage 1: source and map lock

Before deriving B, recover an original source that defines it and an explicit map G from an independently specified geometric input to B. The map must declare its domain and codomain, projection and composition maps, orientation and normalization conventions, boundary/regularity/invariance conditions, units and dimensional type, any two-sided or branch-counting factor, and source provenance/version.

The existing B-tan identity does not satisfy this stage because its factor of two is stipulated rather than derived.

### Stage 2: real-input calibration

Choose one identifiable measured system A. Freeze its source, dataset, provenance, units, uncertainty model, calibration/holdout partition, and the map G. Derive B from the input geometry, not by fitting the target observable. Freeze all shared parameters before opening the holdout.

### Stage 3: independent holdout

Apply the same G and frozen parameters to a genuinely independent measured system B, then a third system C if available. Predict a predeclared observable without refitting. Use the same standard comparator and propagate the complete uncertainty budget.

### Stage 4: blinded negative control

Insert a blinded fake or deliberately corrupted input. The pipeline must reject it through provenance/validity checks or fail the downstream prediction. It must not silently tune hidden parameters until the fake input yields a plausible B.

### Stage 5: falsification

Pre-register the acceptance envelope from measurement, calibration, and model uncertainties. The universal-constant claim fails or requires an explicit domain restriction if independently measured systems require incompatible B values; the same input can yield different B values under undocumented convention changes; the holdout requires refitting; the fake input passes as a valid source; or the predicted observable falls outside the predeclared uncertainty envelope.

This is a workflow proposal, not an administered experiment, physical prediction, or measurement. It deliberately prevents the optical-kink result from being reused as a B calibration unless the disavowed optical-to-theta-4 map is independently reinstated and validated.

## 4. Proof and empirical status

The identity B-tan = 1/(2 Delta-3) = 3/(4 pi) is algebraically conditional on the declared Delta-3 and the chosen two-sided normalization. It does not prove that the factor of two is geometrically forced, that B is a physical constant, or that B maps to an observed angle.

The missing mathematical object is the source-defined map G from a real geometric input to B, together with its projection/composition laws and invariance conditions. A Lean theorem written before that map exists would formalize the chosen definition, not derive the physical relationship.

**Proof status: FORMALIZATION_BLOCKED_AT_DEFINITION.** No new Lean module was written and no Lean build was claimed. Existing Sable source-identity, Elias evidence-witness, Ravel slice-retraction, and Meridian source-fidelity work were checked for reuse. No new tool or dependency was introduced.

No physical calculation, fit, prediction, measurement, or independent validation was performed. No SAT-O or Blockwave equation was changed.

## 5. Durable sources and next cursor

- Tern completed optical-kink Mersearch results: https://github.com/Satobloc/HsH/blob/main/indexes/mersearch_requests/tern-rook-optical-kink-genealogy-20261024t17z-001/SEARCH_RESULTS.md
- SAT Mark V phase-shift note: https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT%20Mark%20V/SAT_Phase_Shift_Note.txt
- SAT Mark V optical-finding transcript: https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT%20Mark%20V/SAT_optics_finding.txt
- June 3 domain-wall prediction memo: https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/PREDICTIONS/DOMAIN%20WALL%20PREDICTION.txt
- Later LAB1 code note: https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/LAB1_code.txt
- Symbol registry: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/terminology/SYMBOL_REGISTRY.md
- Forest working draft: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/LABS/THE_FOREST/THE_FOREST_WORKING_DRAFT.tex
- Mercer early-B source recovery: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERCER/EARLY_B_PROJECTION_CONSTANT_SOURCE_RECOVERY_2026-10-07.md
- Calder November 1 projection/timeslice fidelity report: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/CALDER/2026-11-01T1800Z_0239_PROJECTION_TIMESLICE_GEOMETRY_FIDELITY.md
- Existing Loom source-genealogy issue: https://github.com/Satobloc/HsH/issues/1093
- Existing Aldus optical source-fidelity correction: https://github.com/Satobloc/HsH/issues/1084

Next: recover the raw source behind the undated 0.239 phase note, the original raw Lab 1 run that produced the later 0.246 value, and the raw “The Trees Themselves” source behind the Forest normalization. Do not occupy or overwrite a Mersearch lane while all four request slots remain owned. Keep B, optical phase, and projection angle separate until G is recovered and independently tested.
