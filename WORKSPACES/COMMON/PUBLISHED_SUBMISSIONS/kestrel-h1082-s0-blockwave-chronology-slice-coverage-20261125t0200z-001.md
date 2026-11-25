# Blockwave attachment chronology and conditional slice-coverage boundary

**Disposition:** ADDITIVE_SOURCE_FIDELITY_CORRECTION / CONDITIONAL_FORMALIZATION_REVIEW / NO_PHYSICAL_CLAIM / NO_CODATA / NO_THEORY_PROMOTION.

This assistant-authored cross-boundary synthesis uses a deterministic Kestrel routing label only. No authenticated Kestrel instance or thread is claimed. This note does not rewrite the Morrow, Sable, Ravel, or Ariadne records.

## 1. Downstream chronology correction

The primary chronology is already published in [Morrow issue #1929](https://github.com/Satobloc/HsH/issues/1929). Its source is raw conversation 68c990dd-df28-832e-b766-c267190aaffa, HsH raw-export Git blob fa2586add42b4d87afe89a5b00e1e48a01aaee54, file ID file-LwaFTKkMemPPrLU4qCLpYB.

| Status | Event | UTC | Meaning |
|---|---|---|---|
| CONFIRMED | System attachment node 9ae20939-a3b7-4e7f-ba7c-313f537fd525 | 2025-09-16 16:31:26.687 | First verified raw attachment event |
| CONFIRMED | Following user message | 2025-09-16 16:31:34.670358 | User message carrying the same file |
| CONFIRMED | File-search result 0f3707aa-c0ae-4bb1-bc59-6333c025cf1c | 2025-09-16 16:31:34.670 | Retrieval of the same file ID, not a second upload |
| CONFIRMED | Repeated attachment records | 2025-09-18 04:21:36.445 and 04:25:10.528 | Same file ID, not a new version |

[Sable issue #2485](https://github.com/Satobloc/HsH/issues/2485) currently labels 16:31:34.670358Z as the attachment event. That is the later user-message time. The first verified attachment event is 16:31:26.687Z. This is an additive chronology correction only. It changes no source bytes, equations, authorship, or theory. Morrow #1929 already has the correct sequence, SHA-256 72b687cdd13af6f325faa8f84ed9966735021f084cae196009c9666b4838c64e, and verified readback. The Sable artifact remains unchanged; no Sable acknowledgment is claimed.

## 2. Source cluster and verbatim equations

**2024 Nathan Direct:** DIMENSIONAL GRAVITY raw conversation 252d05c0-22ed-4ea2-a474-7966ab13145a, HsH raw-export Git blob 2cea1924266418e19b825b95ae51e6b7cbace7e1, spanning 2024-03-22 through 2024-06-01. A moving plane intersects the aligned helix at one point. As the plane moves, the selected point travels along the helix; its moving-plane readout circles the axis. Radius is independent of pitch. Pitch and plane speed determine angular rate. The earlier assistant description of a spiral on one fixed plane was corrected by the user. This is a geometric heuristic, not physical validation.

**SAT-O1 historical file:** [SAT O1 4D.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SATOBLOC/SAT%20O1%204D.txt). Git blob 7577aa1ee5a6c3850ce3b226c75377de6367aedc; SHA-256 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937; file-index last-write 2025-06-09; first extant Git commit 2025-10-27; unbylined.

Verbatim source equations:

~~~text
gamma^mu(lambda) = (lambda, A_x sin(k_x lambda + phi_x), A_y sin(k_y lambda + phi_y), A_z sin(k_z lambda + phi_z))
v^mu = d gamma^mu / d lambda
S[gamma] = integral d lambda L(gamma^mu, v^mu)
L = 1/2 m v^mu v_mu - V_tension(gamma)
~~~

This is a one-parameter curve in R^(3,1) with a one-parameter action. Adjacent 4D-worldtube-volume prose does not define a rank-four support or its three extra fiber directions.

**Blockwave attachment:** [BLOCKWAVE.txt](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/%F0%9F%A7%B1BLOCKWAVE.txt). Git blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d; SHA-256 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664; first verified attachment event 2025-09-16 16:31:26.687Z. It is a user-supplied attachment whose embedded prose is assistant-voiced; original authorship is unresolved.

Verbatim source equations:

~~~text
nabla_mu J^{mu nu} = 0
J^{mu nu} = 1/2 epsilon^{mu nu rho sigma} nabla_rho B_sigma
A_mu(theta) = alpha_* nabla_mu theta
F_mu nu(theta) = nabla_[mu A_nu](theta)
integral_gamma A_mu dx^mu in 2 pi Z
~~~

The attachment describes a rank-two current for a two-dimensional worldsheet. It is not the same support as a one-dimensional filament or a four-dimensional tube without explicit maps. The source file and all equations remain unchanged.

## 3. Nathan Direct versus assistant translation

- **Nathan Direct, 2026-11-04:** the worldtube-timesheet mutual-curvature picture is a working hypothesis; worldline-only, timesheet-only, and mutually distributed descriptions remain open. User-role message 100388c5-89d6-4ffd-a895-598990636057, 2026-11-04 23:33:42.240897Z, raw-export SHA-256 de035c9ee69a0a1916d9fb938e32355be23bf05054cd77bc4a810c5af3f7cf0e. The source-locator correction records that this message occurs in multiple exports; it is not independently authenticated as an original utterance in another thread.
- **Nathan Direct, 2026-11-08:** a four-dimensional tube around a one-dimensional core, a three-dimensional boundary, and a two-dimensional worldsheet as a simplification are distinct descriptions whose maps remain unspecified. The same raw export, SHA-256 875cded95fc0c693c610f2d4b58e5966fd4f407c4b3384d6927da601bba5413d, contains messages bcbe9ee8-b621-4a40-9edb-b34c17783be5 and c0520975-02a0-408f-a250-364b88ab7b30; the latter treats w as a fourth spatial direction and proper time as distinct.
- **Nathan Direct epistemic limit:** message 429ad1fa-d171-44dd-97ff-aa080cea03ca in that export rejects a universal guarantee that a present slice reconstructs complete history.
- **Assistant reconstruction:** Blockwave's phrase that strings are records rather than objects is not a Nathan Direct proposition. No source-defined encoder, decoder, capacity measure, or complete-history readout accompanies it.

The earlier reciprocal-deformation construction was retired in the October 21 direct-source correction. The November 4 mutual-curvature hypothesis is later and distinct, not a revival of the retired model.

## 4. Formalization boundary

[Ravel PR #1133](https://github.com/Satobloc/HsH/pull/1133) has an exact-head Lean 4.34.0 / Mathlib 4.34.0 build success: [Actions run #45531821934](https://github.com/Satobloc/HsH/actions/runs/45531821934), job 138928736317, conclusion SUCCESS. PR head 8ae6bc1 on research/ravel-carrier-slice-reconstruction-20261031t0212z; base infra/lean4-verification-20261023 at 61cc8b65. The PR remains open, draft, and unmerged.

The compiled set-level results include:

1. sectionAt(i) = core intersect sheets(i).
2. sheetsCoverCore means every point of the core lies on at least one sheet.
3. completeSectionsRecoverCore proves recovery of the core from all labelled sections when coverage holds.
4. readoutNoninjectiveIfUncovered proves the bare set-intersection map is non-injective when an ambient point is absent from every sheet.
5. sameReadoutDeterminesCarrierIfCovered proves carrier equality from equal labelled sections under coverage.
6. The companion dimension gate gives the generic k-to-(k-1) intersection count for a k-dimensional carrier and a 3D sheet in a 4D ambient, conditional on smoothness and transversality.

The captured run reports no sorryAx or admit in the theorem-specific output. It did not run the full test suite, lint, leanchecker, nanoda, or a global axiom audit. Lean checks the formalized statements only. It does not establish that the source geometry was translated faithfully, that physical sheets cover the core, or that a physical detector readout equals bare set intersection.

This conditional theorem is compatible with the direct-source limit: reconstruction is possible under a coverage premise, but coverage is not guaranteed. It is not a theorem that every present slice contains the complete past. The separate [Ravel report #2528](https://github.com/Satobloc/HsH/issues/2528) records the support-degree and local-identifiability gate; this note adds the source-to-coverage interpretation.

## 5. Mapping diagram

~~~text
physical carrier or core
        |
        | intersect each labelled timesheet
        v
bare sections: core intersect sheet(i)
        |
        | union over observed sheets
        v
coverage test
   | covered                 | not covered
   v                         v
set-level carrier            bare intersection map
reconstruction possible      is non-injective
        |
        | physical response operator still undefined
        v
observables and coupling signature
        |
        | coupling-preserving projection required
        v
worldtube-only / timesheet-only / joint representation
~~~

The first half is the set-level structure formalized in PR #1133. The second half remains a missing physical map. The coupling-preserving projection gate requires the joint readout Q=(observable, coupling signature) to be constant on every fiber of an admissible projection. The current set-intersection module does not encode that coupling signature.

## 6. Stable glossary

- **Carrier/support:** the geometric object being represented; its dimension is not inferred from the number of observations.
- **Core:** the lower-dimensional object around which a finite tube or support may be constructed.
- **Timesheet family:** labelled candidate 3D slices; its coverage domain must be specified.
- **Section:** the bare set intersection of a carrier with one timesheet, not automatically a detector output or information record.
- **Coverage:** the union of observed sheets contains the full core.
- **Reconstruction:** recovery of the carrier from all labelled sections under coverage.
- **Physical readout:** the undefined map from geometry to measured observables.
- **Coupling signature:** the worldtube-timesheet relation that must survive a reduced representation.
- **Mutual curvature:** a provisional relational hypothesis, not a completed coupling law or equivalence proof.

## 7. Discrepancy ledger

| Status | Discrepancy | Consequence |
|---|---|---|
| CORRECTED | Sable #2485 assigns the later user-message time to the first attachment event. | Use 16:31:26.687Z for the first verified attachment; retain 16:31:34.670358Z as the following user-message time. |
| OPEN | SAT-O1 has a 1D curve and one-parameter action beside 4D-volume worldtube prose. | A source-defined three-direction thickening map is missing. |
| OPEN | Blockwave J is rank two and describes a 2D worldsheet. | It is not the same support as a 1D filament or 4D tube without explicit maps. |
| OPEN | Assistant-voiced Blockwave calls strings records. | No encoder, decoder, capacity measure, or complete-history readout is supplied. |
| CONDITIONAL | Lean proves reconstruction when the sheet family covers the core. | This does not establish physical coverage or universal completeness. |
| OPEN | Mutual curvature is not represented by the bare set-intersection theorem. | A joint observable and coupling-preserving projection are still required. |
| OPEN | R^(3,1) and the later four-spatial-coordinate description with proper time distinct are not mapped. | No metric, coordinate, or evolution map identifies the representations. |

## 8. Cross-domain lens

- **GR:** SAT-O1 R^(3,1) and the later four-spatial-coordinate description are not interchangeable without an explicit metric and coordinate map.
- **String theory:** a rank-two worldsheet current is not automatically the same object as a one-dimensional filament or finite-core worldtube. No Nambu-Goto or Polyakov equivalence is established.
- **SM/QM:** particle-as-intersection is a geometric proposal, not a map to standard fields, state spaces, or quantum numbers.
- **Information:** physical carrier, encoded information, slice observable, and reconstructed history are distinct. A proposed high information capacity does not imply that a particular slice reconstructs complete history.

## 9. Corrected equations and epistemic status

No corrected SAT-O1 or Blockwave equation is issued. The original equations and source files remain unchanged. The coverage definitions and theorems are a separate conditional formalization, not replacements for historical equations. No independent physical measurement, physical calculation, CODATA scoring, theory promotion, or paper-gate advancement was performed.

## 10. Next deeper cursor

Define the physical response/readout operator for the source-defined carrier and timesheet proposal. Specify its domain, codomain, observation window, coverage condition, and coupling signature. Then test whether worldtube-only, timesheet-only, and joint representations satisfy the coupling-preserving projection gate. Keep core-to-tube, tube-to-boundary, tube-to-timesheet, and mouth-to-timesheet maps separate until their domains, codomains, regularity, and composition conditions are source-defined. Do not infer a capacity theorem or complete-history guarantee from the set-level coverage proof.
