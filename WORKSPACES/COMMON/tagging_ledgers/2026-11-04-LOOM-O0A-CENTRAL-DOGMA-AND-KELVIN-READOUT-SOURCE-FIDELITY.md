# Loom source-tag ledger: O0-A, Central Dogma, and Kelvin readout

**Record date:** 2026-11-04  
**Run key:** `REVROT3-19-20261011:585:s2`  
**Worker selection:** Loom (ring index 1); next Aster (index 2).  
**Record type:** source custody, chronology, terminology crosswalk, and geometry/readout requirements.  
**Status:** internal source record; no theory promotion, no P2 selection, no physical calculation.

## 1. Loom remit and source authority

The historical `Tag Conversation Corpus` raw export was read, not inferred from the current role card:

- Conversation: `Tag Conversation Corpus`
- Conversation ID: `6aa67478-541c-83e9-b8fa-32d6d575eeb9`
- Raw JSON blob SHA-1: `6668ca60e451f8737903423727da7f9a430484e1`
- Created 2026-09-13; updated 2026-09-19.
- 515 mapping nodes; 10 user-role messages.

Nathan's user-role instructions establish a selective corpus-tagging remit: avoid over-granular tagging; use recognizable standard terminology; maintain glossary/crosswalks; distinguish historical and current meanings; preserve source dates and chronology; separate user-authored source from assistant synthesis; maintain a continuity record. The current Loom README and continuity are operational summaries, not a separately signed historical charter.

## 2. June 2025 SAT Big Paper: primary O0-A source

Primary document:

- Path: `SAT_THEORY_ARCHIVE_2023-25/✅SAT BIG PAPER.pdf`
- Source date on title page: June 2025; author line: Nathan.
- PDF SHA-256 recorded by extraction: `77eb9e652c45650e29cd08be1a86198f05572573b452d170ce274e53bfde9f93`
- Git blob SHA-1: `caf5771a9d01b8505c23c07ac7cccca04fff49f5`
- Extracted text: `SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT/✅SAT BIG PAPER.txt`
- Extracted-text blob SHA-1: `69b0085c86f6c4876aacc0556243dd2fccdc0aef`
- Extraction request: `2026-09-10_root_pdf_extraction_pass_002`; extraction timestamp 2026-09-10T16:03:31.820546Z; PyMuPDF; 171 pages; OCR not needed.
- O0-A appears on pages 11-12, extracted lines 361-445.

The same primary document's introduction explicitly describes the initial move as treating plotted worldlines as physical ontology, and separately states that data are primary and theory should organize and explain observed relationships. Preserve both statements as historical source claims. Do not silently replace them with the later methodological qualification.

### O0-A's three modes

| Mode | Source description | What is actually specified |
|---|---|---|
| 1 — True Block | Filament kinematics are frozen; the propagating time wavefront `Σ_t` accounts for apparent change. | A controlled baseline used for specified later derivations. The label is not, by itself, a settled claim about ultimate ontology. |
| 2 — Triggered Dynamics | `Σ_t` can trigger local filament-parameter changes as it passes; the emerging 3-geometry is intended to match Einstein curvature to first order. | The text says `⟨K⟩` is pegged to GR and minimal filament adjustments are back-solved. The actual parameter-update map is not supplied here. |
| 3 — Crystallisation | The block solidifies as `Σ_t` sweeps through; filament dynamics are determined during the sweep; afterward the history is fixed and `Σ_t` is only an ordering label. | Described as the future self-consistent target, not required for the predictive tests then being pursued. |

Mode 2 is called “Triggered Dynamics” in the primary O0-A text; “Semi-Dynamic” occurs as a supplementary-summary alias. Keep the primary label and the alias separate.

## 3. Central Dogma source genealogy: preserve distinct versions

The archive contains several related but non-identical formulations. They must not be collapsed into one timeless statement.

### A. Direct user-role model/formalism statement, 2026-02-23

Raw conversation:

- Path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_16/26.02.23•26.09.12•Worldlines and Unification — raw.json`
- Conversation ID: `699c4ebb-a468-8325-9a0e-853fb9f5b47d`
- Raw JSON blob SHA-1: `3a1fe59c8122eb17aae83d83b77bcfce5fdbae5a`
- User message ID: `0fc22772-0f00-4052-846e-052f05d5065a`
- Timestamp: 2026-02-23T12:57:36.902Z.

The user explicitly says the worldline construction need not have physical reality to function as a model. This is a direct user-role source for the model/ontology distinction. It is **not** the later expanded Central Dogma paragraph.

The raw conversation contains 17 user messages and 43 mapping nodes. Its 2026-09-12 attachment, `Pasted text(20260912-211511).txt`, is a check-in survey, not the Central Dogma source.

### B. FIE document, updated 2026-02-26

Primary document:

- Path: `SAT_THEORY_ARCHIVE_2023-25/THE FUNDAMENTAL INTUITIONS — EXTENDED.pdf`
- A second path, `THE FUNDAMENTAL INTUITIONS — EXTENDED 2.pdf`, has the same Git blob.
- PDF Git blob SHA-1: `ba0af013da1681a070b4947def6499cedb403162`
- PDF SHA-256 recorded by the archive extraction: `d13d32109ca32b15dabd5e8d4084995d3a36f9e8ab8a5dcac45ae2f150a9a1d9`
- Extracted text blob SHA-1: `468a04e9941165353e286b48e5a0ca27d5be58d9`
- Archive source index dates this six-page document to 2026-02-26.
- Its “Central Dogma” section is at extracted lines 174-182.

This is a **different wording** from the June 11 expanded passage. It calls the step of treating the useful geometric map as physically real the “big leap” of SAT. The FIE PDF does not contain the later “no ontological commitments / four-dimensional realism as a formalism” qualification.

### C. Expanded qualification in the June 11, 2026 compiled discussion

Source locator:

- Path: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/NESTED HOLONOMIES.txt`
- Blob SHA-1: `0a8d52da06d1a787252b9a120c4770aa29095879`
- Header: “SAT26 NESTED HOLONOMIES DISCUSSION”; section date: 2026-06-11.
- The Central Dogma block is at lines 5304-5305. Assistant analysis begins at line 5311.

This block contains the qualification that SAT has no ultimate block-ontology commitment and uses “a four-dimensional realism as a formalism,” while whether the universe is static-block, dynamic-block, growing-block, or another structure remains unknown.

Nathan Direct on 2026-11-03 explicitly identifies this passage as user-authored and directs that the qualification be preserved. The compiled discussion places the block before the assistant's later analysis, consistent with a pasted source passage. However, this text file does not preserve a raw user-role message ID or original message timestamp. Therefore the correct provenance label is:

**Nathan Direct authorship assertion; compiled source occurrence verified; raw historical role/timestamp not independently authenticated.**

Related compiled copies contain the same passage:
- `DEVELOPMENT_FULL_CONVOS/NEW TOEstext 4.txt`, blob `e5f323eaa06fef1eb08ec192ac134fc4e9deffa2`.
- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT BUILDING STORY.txt`, blob `5c4e20eb52043b655eb81496962133e0ffe33f04`.

These are not independent source confirmations and do not supply raw message metadata.

### Source-status conclusion

Keep the following distinct:

1. June 2025 Big Paper: worldline plots are presented as physical ontology; data are primary.
2. 2026-02-23 raw user conversation: the worldline construction may be a model without physical reality.
3. 2026-02-26 FIE: treating the useful map as physically real is described as a major step.
4. 2026-06-11 compiled discussion: the expanded Central Dogma adds the formalism qualification and leaves ultimate block ontology unresolved; Nathan Direct identifies it as user-authored, but the raw turn remains unrecovered.
5. 2026-11-03 Nathan Direct: the four-dimensional block treatment is a methodological formalism, not a settled metaphysical assertion; preserve all three O0-A modes.

Do not harmonize these formulations by silently deleting their differences. Do not interpret O0-A Mode 1's “True Block” label as a final ontological conclusion.

## 4. Explicit map contract required before formalizing the O0-A ladder

The source gives three interpretive modes but does not define maps between their state spaces. A future formalization would first need to specify:

- (X_1): Mode 1 frozen-filament configurations together with the `Σ_t` family.
- (X_2): Mode 2 histories with explicit local filament-parameter response.
- (X_3): Mode 3 completed/solidified histories.
- Embeddings (ι_{12}:X_1\to X_2) and (ι_{23}:X_2\to X_3).
- Projections (π_{21}:X_2\to X_1) and (π_{32}:X_3\to X_2).
- Observable/readout maps (R_i:X_i\to Y).

Candidate conditions, **proposed rather than source-given**:

1. (ι_{12}) embeds Mode 1 as the zero-trigger or frozen-response subspace of Mode 2.
2. (ι_{23}) records the Mode 2 `Σ_t)-indexed evolution as a completed Mode 3 history.
3. (π_{21}) forgets the triggered response while preserving the frozen filament skeleton.
4. (π_{32}) reconstructs the `Σ_t)-indexed process from the completed history.
5. Where defined, (π_{21}\circ π_{32}=π_{31}) and (ι_{23}\circ ι_{12}=ι_{13}).
6. Observable preservation requires commuting relations such as (R_2\circ ι_{12}=R_1) and (R_3\circ ι_{23}=R_2) on the appropriate subspaces.

Every map still needs its domain/codomain, topology, metric/signature if defined, boundary conditions, time parameterization, incidence rules, and readout semantics. The source does not supply these objects. The 2025 `Σ_t` is not silently equated with the current H(s)H timesheet/time-wavefront; that relationship remains a test hypothesis.

### Existing Lean scaffold and limits

The existing Kestrel PR #873 contains `hallway_factorization_iff_fiber_compatibility`: a deterministic map through a projection exists exactly when the target observable is constant on every source-projection fiber. The theorem-specific axiom report includes `Classical.choice`.

Verification is not a clean current-head pass:
- Earlier workflow #41468951678 was a merge-reference build, not exact-head-only verification.
- Later merge-reference runs #41690832586 and #41758925555 failed in `KestrelMovingSlice`; the latter reports unresolved goals at lines 114 and 125 and `sorryAx` in two declarations.
- Separate axiom audit, tests, lint, and nanoda were skipped.

This theorem is a conditional mathematical criterion, not an instantiated O0-A map and not physical validation. No new Lean module or run was made here. Local `lean`, `lake`, and `elan` are absent. Main has no active Lean toolchain/project; the only Mathlib infrastructure located is an old open draft PR. Math Hopper and Whirligig did not surface as installed repositories; no suitable fork or Lean app was found. SciSpace is available for literature work, not Lean compilation. No new tool or PR was created.

## 5. External measured-system source correction: Kelvin-wave camera map

Primary paper: Barckicke et al., *Kelvin wave propagation along vortex cores*, Nature Physics, DOI `10.1038/s41567-026-03175-w`. Its data-availability statement points to Figshare DOI `10.6084/m9.figshare.30903347`.

The Methods describe two distinct camera modalities:

1. Basler acA2040-120um, side view normal to the vortex axis, 2064 × 1564 pixels, 300 fps, with 8 mm and 12 mm lenses.
2. Phantom V1840, top view, 6000 fps, used for PIV.

The Results refer to “two orthogonal cameras” in the handedness check. The Basler side-view and Phantom top-view devices are a plausible pair, so the apparent one-camera/two-camera discrepancy may be a role-linkage gap rather than a contradiction. The paper does not explicitly connect the PIV camera to the handedness decision or specify cross-view synchronization, registration, or the handedness algorithm. Treat the reconciliation as a hypothesis, not a fact.

The Figshare page/API/DOI could not be retrieved through the available web path in this run. No dataset bytes, version metadata, file inventory, checksums, raw arrays, or calibration covariance were obtained. No numerical comparison, CODATA comparison, fit, or physical prediction was made. The candidate remains unselected under P2 HOLD.

The observation architecture should remain multi-modal and explicit:

- Core/worldtube state → Basler side-view image → contour extraction → position/radius channels.
- Flow field → Phantom top-view image → PIV/PTV reconstruction → velocity/circulation channels.
- Joint handedness/mode inference requires an explicitly documented cross-view map.

The last joint inference map is not specified by the inspected source.

## 6. Project controls and non-actions

- Current main commit observed: `368e3313e48d890b538b0be0d24d4c0d1ed86e0e`, containing Aster's published report #1347.
- `TASK_BRANCH_GRAPH.json` is a 16-branch snapshot updated 07:46Z, predating the #1347 publication. It was not edited; graph reconciliation remains with its control owner.
- Code Grurple remains ACTIVE. P2 issue #565 remains HOLD / no system selected. P1 November 9, P2 November 30, and P3 December 14 remain separate gates.
- All four Mersearch request lanes remain occupied; no released lane or request-scoped result manifest was available. No new request was submitted or overwritten. GitHub code search was used only as a bounded fallback, not represented as Mersearch.
- No SAT-O or Blockwave equation was changed, normalized, or promoted in this run.
- No physical system was selected; no physical calculation, invented fixture, data-free numerical calculation, CODATA comparison, or H(s)H prediction was performed.
- No BEDROCK, Steering Charter, Three Paper Campaign, task graph, PR, or paper gate was modified.
- FIE last full review remains 2026-10-27; the 14-day re-review is due 2026-11-10. This was a targeted source passage read, not a full FIE re-review.
- Unrelated reading completed: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/fun break - lx.txt`, lines 421-460. Next cursor: line 461. No physical break is claimed.
- No task ID, schedule, phase, cadence, or enabled-state change; no sixth task; no signet or chat rename.

## 7. Next source and geometry gates

1. Recover the raw user-role message ID and original timestamp for the expanded Central Dogma passage when a Mersearch lane is released. Until then, preserve the Nathan Direct authorship assertion and the raw-role gap separately.
2. Retrieve the Figshare dataset version, file inventory, checksums, and relevant raw camera/PIV data. Establish the camera synchronization and handedness pipeline before any numerical work.
3. Define the O0-A state spaces and projection/embedding maps from source statements before attempting a new Lean instantiation.
4. Only after Code Grurple standdown and the relevant P2 evidence gates clear should a system be selected for forward geometry → equations, reverse equations → geometry, and independent observable-prediction testing.

No public issue was created: this is an internal provenance correction, and the existing Aster issue #1347 already covers the Kelvin-wave report. A second public issue would risk duplication before the new source/data checks are complete.
