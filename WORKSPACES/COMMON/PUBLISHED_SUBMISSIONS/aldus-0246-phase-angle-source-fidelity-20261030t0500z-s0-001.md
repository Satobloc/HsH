# 0.246 rad: phase-to-angle provenance and geometry-fidelity audit

Date: 2026-10-30
Disposition: SOURCE-FIDELITY FINDING; NO PHYSICAL VALIDATION; NO THEORY PROMOTION

## Executive finding

The inspected archive does not support treating 0.246 rad as a Nathan Direct geometric definition of theta_4.

The earliest located 0.246-bearing artifact is an assistant-generated optical simulation claim in the SAT Mark V transcript. The archive timeline assigns a 2025-05-21 date to a fixed 0.246-rad phase-shift claim, but the same row marks the claim "Not in source". A separate SAT phase-shift note uses a different expression and reports approximately 0.239 rad, not 0.246 rad.

A direct user-role correction dated 2025-06-23 says the optical paper arose from misidentifying refractive index as a literal direct measure of SAT theta_4. It explicitly says the optical exercise was not a SAT falsification or verification route and describes the paper as an ordinary refractive-index-variable anisotropic slab. The optical analogue and SAT filament geometry must therefore remain separate.

Private raw Library exports from 2026-02-27 and 2026-03-01 show 0.246 appearing in user-role messages containing pasted, unattributed technical prose. The embedded author is unresolved. In the 2026-03-01 conversation, the immediately following assistant response relabels the optical phase shift as theta_4 = 0.246 rad. A later flattened Worldlines.txt transcript reuses 0.246 as an "Obscuration Constant" and an "Achromatic Phase Snap" in pulsar geometry. No source-supported mapping connects these objects.

The current BEDROCK definition controls: theta_4 is measured from the time normal, is zero in the null/vacuum baseline, and for a particle at rest is equivalent to inverse helical pitch. The originating raw message for that BEDROCK entry was not recovered in this pass. No transfer map connects the optical phase to the current geometric angle.

Bottom line: 0.246 migrates from an assistant-generated optical phase claim into geometric-angle and pulsar-timing language. The migration is documented; the physical equivalence is not.

## Source chronology

| Date | Source | Attribution and status |
|---|---|---|
| 2025-05-08 | SAT Theory Synthesis raw conversation | Nathan Direct asks whether the filament's helical trace is physical, locking, and how the time-surface interface exchanges energy. The user asks whether theta_4 can be pinned. The assistant supplies a mass-angle formula using an empirically fitted scale. No 0.246 occurs in this raw conversation. |
| Archive-index date 2025-05-21 | SAT Mark V/SAT_optics_finding.txt | Assistant transcript contains "Total simulated Delta-phi approximately 0.246 rad". It is a simulation claim, not an independent measurement. Exact raw message timestamp was not preserved. |
| 2025-05-21 | SAT TIMESTAMPS.txt | Timeline row records a fixed 0.246-rad phase shift but labels it "Not in source". |
| 2025-05-21, date assigned by index | SAT Mark V/SAT_Phase_Shift_Note.txt | Separate assistant-generated note gives Delta-phi = eta integral sin^2(theta_4(x)) dx and reports approximately 0.239 rad for its stated parameters. Do not merge with 0.246. |
| 2025-06-23 | LAB 1: Validation Lead source extraction | Direct correction says the optical paper is not a SAT test and that refractive index is not a literal direct measure of theta_4. It is an anisotropic-optics analogy. |
| 2026-02-27 | Private raw Library export | User-role relay contains 0.246 as an optical-signal uncertainty. Embedded authorship unresolved. |
| 2026-03-01 | Private raw Library export | User-role relay contains 0.246 as a Mach-Zehnder phase-shift target. The following assistant response sets theta_4 = 0.246 rad. |
| Later transcript labeled Monday 2026-04-06 | DEVELOPMENT_FULL_CONVOS/Worldlines.txt | Assistant-generated prose reuses 0.246 as an obscuration angle and pulsar timing phase snap. Raw role graph not recovered. |
| 2026-09-16 | BEDROCK BR-005 | Current definition measures theta_4 from the time normal, with zero at null/vacuum and a rest-limit relation to inverse helical pitch. Raw originating message not recovered. |

## First extant versus first public

- First located extant 0.246 artifact: the SAT Mark V assistant transcript, with an archive-index date of 2025-05-21. The timeline itself marks the claim "Not in source" and the transcript does not preserve a raw message timestamp.
- Earliest public GitHub tree witness checked: commit f1926a9da8584eaab2a9e8441d76ec28d5cec194, dated 2026-03-02, already contains the SAT Mark V transcript. Repository visibility at that historical instant was not independently verified.
- First global public mention: unresolved. Podcast, social, and other public channels were not exhaustively searched.

## Geometry and mapping

The 2025-05-08 raw conversation treats the filament/time-surface mechanics as open questions. The user asks whether the filament is a solid continuous object, whether vibration sweeps out a helical trace, whether that trace becomes a physical locking structure, and whether crossing the time surface costs energy. The user proposes friction-like energy loss. These are exploratory questions and constraints, not a completed action or constitutive law.

The historical assistant overstates them by declaring that SAT requires a real, locking helical trace and by supplying a dissipation functional without deriving its coefficients or physical dimensions.

Current controlling theta_4: BEDROCK BR-005 sets the angle from the time normal; theta_4=0 is the null/vacuum baseline; at rest it is related to inverse helical pitch. The raw source message for this 2026-09-16 clarification remains unrecovered.

Mapping diagram:

4D filament + advancing 3D time surface
                 |
                 v
      theta_4 (time-normal baseline)
                 |
                 | missing physical transfer map
                 v
      Delta-phi_opt (optical phase)

Historical assistant shortcut:
Delta-phi = 0.246 rad -> theta_4 = 0.246 rad
-> theta_obs / Obscuration Constant = 0.246 rad
-> Achromatic Phase Snap = 0.246 rad

No source-supported projection or composition map connects these quantities.

## Glossary

| Term | Meaning in this audit |
|---|---|
| theta_4 | Current BEDROCK geometric angle measured from the time normal. |
| Delta-phi | Optical phase difference in a specified optical arrangement. Not automatically a geometric angle. |
| Delta-n | Refractive-index variation in an anisotropic optical medium. Not SAT theta_4. |
| B | Separate projection coefficient. Numerical proximity to 0.246 does not establish identity. |
| Helical trace | Candidate swept structure whose physical status and locking role were asked as questions in the 2025 raw conversation. |
| theta_obs / Obscuration Constant | Later assistant-generated label attached to 0.246. |
| Achromatic Phase Snap | Later assistant-generated pulsar timing proposal using 0.246. |

## Discrepancy ledger

1. The earliest located 0.246 artifact is assistant-generated, not a recovered Nathan Direct derivation or independent measurement.
2. The 2025 timeline records 0.246 but marks it "Not in source".
3. A separate phase-shift note reports 0.239 rad. These are distinct artifacts.
4. Optical phase and geometric theta_4 are different typed quantities. No transfer map is supplied.
5. Current BEDROCK measures theta_4 from the time normal. Older intersection-angle language is convention-sensitive.
6. The 2025 assistant's mass-angle relation uses an empirically fitted scale, not a first-principles derivation.
7. The user's helical-trace and locking questions were converted into assistant assertions.
8. The user's friction-like interface proposal was converted into an un-derived dissipation functional.
9. The 2025-06-23 direct correction says the optical paper is an anisotropic-optics analogy, not a SAT test.
10. The 2026 user-role relay contains pasted technical prose with unresolved embedded authorship; the assistant silently treats it as a geometric angle.
11. The later pulsar obscuration and timing claims are assistant-generated proposals, not measurements.
12. The raw originating message behind BEDROCK BR-005 remains unrecovered.
13. The first global public mention remains unresolved.

## Formalization and physical-data status

No new Lean theorem was created. Existing Enheduanna PR #800 and Loom PR #1076 cover adjacent angle/projection identities. The missing object here is a physically defined transfer map from the filament/time-normal geometry to an optical phase. Encoding Delta-phi = theta_4 now would formalize the historical conflation rather than test it.

No measured optical instrument, medium, path length, wavelength, polarization, reference arm, raw interferogram, calibration, uncertainty budget, or independent dataset was recovered. No physical calculation, prediction/fit comparison, or CODATA scoring was performed.

## Next research cursor

1. Recover the raw 2026-09-16 message behind BEDROCK BR-005; until then keep its raw genealogy marked SOURCE_RECOVERY_BLOCKED while retaining BEDROCK as controlling.
2. Recover the raw JSON behind the April 6 Worldlines.txt passage and its message UUIDs.
3. Recover the original author/source of the 2026 pasted 0.246 Mach-Zehnder passage. Do not promote the user-role relay to Nathan Direct.
4. Preserve the 2025-06-23 optical correction as the source boundary for the earlier anisotropic-slab paper.
5. Require an actual measured optical system and an explicit theta_4-to-phase map before any physical calculation.
6. Keep 0.239, 0.246, B, theta_4, theta_obs, and pulsar timing residuals separate until explicit maps are supplied.

## Public sources

- SAT Mark V/SAT_optics_finding.txt, Git blob d4843caa0dff3b1193f3758790d8c8a27802a4aa.
- SAT Mark V/SAT_Phase_Shift_Note.txt, Git blob f110f6f7a2e2c1515528619296957acec3518acb.
- SAT TIMESTAMPS.txt, Git blob 85b3fa8c44792c2c177fbc3859f28ba58c7481d0.
- DEVELOPMENT_FULL_CONVOS/Worldlines.txt, Git blob 1c86774915c8ea9255798a07d06891afe0f23549.
- BEDROCK.md, BR-005, current HsH control.
- WORKSPACES/COMMON/extraction_outputs/2026-09-15-LAB1-AFTER-015519.md, role-tagged extraction of the 2025-06-23 correction.
- WORKSPACES/MIRA/2026-10-30_OPTICAL_KINK_SOURCE_CORRECTION.md, prior source correction.

Private raw Library exports were inspected for role and timestamp boundaries. Their contents and identifiers are not reproduced in this public copy; the local execution report retains their hashes and message UUIDs.
