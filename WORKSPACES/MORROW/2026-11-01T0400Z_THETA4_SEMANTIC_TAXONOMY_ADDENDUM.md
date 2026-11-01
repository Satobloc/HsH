# Morrow | θ₄ semantic taxonomy and source-fidelity addendum

**Date:** 2026-11-01T04:00Z  
**Status:** ARCHIVE_ONLY / SOURCE_FIDELITY / NO_THEORY_PROMOTION

## Scope and role

This addendum extends, but does not duplicate, Morrow's published BR-005 source-lineage report (#1159). Morrow's actual historical user assignment is the provisional Team Archivist remit (raw conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36`, blob `362075c5e32ec9e97579bd1de58fba7f612cb6bb`, user message `402ade01-7116-4efb-9b14-31e477754458`). “Archive Synthesis & Dependency Integration Lead” is assistant-authored. This runtime is not authenticated to the historical Morrow thread.

Morrow's theory freeze and training standdown remain active. This is source appraisal only: no theory integration, prediction, physical calculation, paper, BEDROCK edit, or theorem promotion.

## Newly recovered direct source

The “Geometry in Physics” raw export is in `Satobloc/SAT_THEORY_ARCHIVE_2023-25`:

- Conversation: `6a25a665-dc92-8bcb-a5ef-5f0b5e87b2ce`
- Raw blob: `2e0c8477873583b92f20a0a3f2af6528643b4a8a`
- User message `7c63153a-c483-496f-8ec6-685d294f0375`, 2026-06-10T14:30:19.781Z: Nathan requests the major definition `θ₄ = “filament-time energy transfer”`; he suggests “timesheet drag” as a possible later dated update. The latter is proposed wording, not evidence of a completed supersession.
- User message `0a1829be-9bf1-4801-aba3-da5c0cb67344`, 2026-06-09T01:37:16.817Z: direct particle-object correction: electron is a single-coil particle worldline/tube; quarks form two- and three-braids associated with mesons and hadrons; true bosons are vibrations on filaments, not filaments themselves.
- User message `eeadf9ec-9a18-4139-b40b-6f7b408aecc4`, 2026-06-10T13:34:42.548Z: direct historical vocabulary account; “timesheet” and “world line” were the early terms, with “world line” initially connected to a string-theory analogy.
- User message `e1d47786-b19f-4445-9a35-2d487482e02e`, 2026-06-08T22:19:52.295Z, asks whether a pasted comparison table is accurate. Its normal-relative θ₄ definition and `R ∝ 1/cos(θ₄) + ρ_link` expression are not adopted Nathan Direct equations.

## Geometry recovered independently from raw user messages

| Date / raw message | Direct description | Limit |
|---|---|---|
| 2025-10-30 FIE, conversation `6902f3c2-ee54-832b-8c70-b5a6fd900798`, blob `0a7a270482bdda92a61d1c54ccccaf356e47aa0b`, user node `f476afce-eba0-4312-8c2b-36b82dbe7f3f` | θ₄ is the gross/absolute filament–timesheet intersection angle; greater angle is associated with more transfer/mass; vacuum is described as near-zero | Reference axis/plane is not specified |
| 2026-03-07, “Switching to English”, conversation `69ab6f13-b8f8-832e-8d71-528c15e11037`, blob `dfdaec331846087af7daf0008eba431520a5b9ad`, user node `f236e23d-0266-4be8-94f7-ead029c534b6` | Explicitly measures θ₄ from the timesheet plane, not its normal; vacuum is 90° to the sheet, parallel to time direction | Same conversation as the 05:08 tentative draft; not an independent witness |
| 2026-03-07, user node `70101050-1740-4666-ad5a-5bd1710705ef` | Repeats the plane-relative convention and extends the discussion | Same conversation |
| 2026-03-13, “Ontology and Math Check”, conversation `69b3b56e-7540-8325-b93b-e9331fe95430`, blob `e3e40b1a167d26f2d153667d761746f9a4788db1`, user node `e41e50ba-6c02-433f-ab9e-54633a7c6e17` | θ₄ is described as composite of local helical tangent and gross orientation/rate; long-axis tilt contributes | No exact plane/normal composition map |
| 2026-09-07, “Ravel H(s)H Syncmathcek”, conversation `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f`, blob `c49367b0faa424491e7b3520a034b9e44fe6897f`, user node `1896b541-a337-4638-b4f8-b1d53b549c6c` | Vacuum filament is parallel to timesheet propagation, with minimum drag, zero mass and zero 3-space motion | Does not name θ₄ or inverse pitch |

The March 7 direct source also distinguishes ordinary, long-axis, composite and complex θ₄ contributions. A single scalar therefore requires a source-defined aggregation/readout map. None has been recovered.

## Conditional geometry and existing formalization

The Ravel sandbox kernel (blob `80d85bb3a7d18b70830fe54752151257674ae23b`) chooses one all-plus Euclidean helix, one flat timesheet family, and a local angle measured from the time normal:

`tan θ_N = R/h = 2πR/P`, and `1/P = tan θ_N/(2πR)`.

This is dimensionally coherent inside that declared single-helix model: inverse pitch has units L⁻¹ and the radius supplies the scale. It is an assistant reconstruction, not a recovered Nathan equation. Under the same Euclidean model, `θ_S + θ_N = π/2` and `1/P = cot(θ_S)/(2πR)`.

Aster PR #674 contains a conditional complement-angle module:

- Current PR head: `138a40a678a61cfb8bb00448b6f5b4bc20b504c5`
- Module blob: `056ff72af5e01c2db4f554f549d9a99a7cb34ce9`
- Prior successful build: Actions #40447650215 / job #122002634931, earlier head `74dbac1b8658117dfaacb9553b637df109656c63`, 8,943 jobs.
- Retrieved log: zero `sorryAx`; theorem axioms only `propext`, `Classical.choice`, `Quot.sound`.
- The module blob is identical at current PR head, but the current full PR head has no workflow run.

The Lean proof establishes only conditional angle algebra under Euclidean orthogonality, common metric and acute-angle assumptions. It does not prove the intended historical convention or physical premises. The PR docstring calls the September 16 running-log statement a “later Nathan-direct clarification”; that log has no raw message/role/parent locator. The theorem is conditionally valid; that source attribution is not established.

## Discrepancy ledger

1. 2025 FIE says near-zero vacuum θ₄ without a reference axis; March 7 explicitly says plane-relative θ₄ with vacuum 90°. These can be complementary only if the earlier convention was normal-relative, which the original FIE does not state.
2. June 10 gives θ₄ a semantic definition as filament-time energy transfer and proposes “timesheet drag” as later wording. The relation between that interaction quantity and the angular descriptor is undefined.
3. March 13's composite θ₄ is richer than the Ravel kernel's one local tangent angle.
4. The tentative `m ∝ Q sin²(θ₄)` expression in the March 7 working draft is not a validated Nathan Direct law. If the angle is changed from normal-relative to plane-relative, its symbolic cofunction rewrite would be `sin²(θ_N)=cos²(θ_S)`; this does not validate the mass law.
5. The June 8 pasted table's `R ∝ 1/cos(θ₄) + ρ_link` is a question about a mixed-source synthesis, not adoption.
6. September 16 normal-relative θ₄=0 and inverse pitch remain log-only; the raw source is unrecovered. BEDROCK BR-005 remains unchanged.
7. Flat, flexible and wavefront timesheet representations have no explicit projection/composition maps in the recovered direct source.

## Disposition

Morrow's theory freeze and training standdown preserved. Existing issue #1159 remains PUBLISHED_VERIFIED; no new issue was created because this is an additive extension of the same θ₄ source family and the publisher has no append route. No BEDROCK, symbol-registry, SAT-O/Blockwave, task, schedule, branch, PR, or theory changes.

**Next source cursor:** recover the raw September 16 message behind the running-log attribution; otherwise keep it LOG_ONLY / RAW_SOURCE_NOT_RECOVERED. Do not promote the Ravel single-helix mapping to the full composite θ₄ without an explicit source-defined map.
