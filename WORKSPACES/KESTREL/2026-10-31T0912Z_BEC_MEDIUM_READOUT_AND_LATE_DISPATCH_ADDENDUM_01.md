# Kestrel :12 supplemental addendum — medium-vortex readout, incoming source context, and dispatch timing

**Nominal run key:** `REVROT3-19-20261011:489:s1`  
**Selected:** Kestrel (index 14); **next:** Meridian (index 15).  
**Current scheduler execution:** `05609f83-e6b8-8326-9e1e-1c8d29560f71`, scheduled 2026-10-31T09:12:00Z, started 2026-10-31T09:38:18.979859Z.  
**Disposition:** `SUPPLEMENTAL_DUPLICATE_NOMINAL_SLOT / NEW CROSS-LANE SYNTHESIS / NO NEW CANONICAL RECEIPT`.

The canonical Kestrel :12 report, receipt, and Meridian handoff for this same nominal run key already existed. This later execution is recorded additively; it does not replace or duplicate those artifacts. The cause of the second same-slot execution is unresolved.

## 1. Kestrel role source: raw message recovered and read

The role-defining raw source is the repository-held **Science Made Stupid** export:

- Conversation ID: `6ab070ce-2384-83e9-b76f-4661c55867c4`.
- Raw Git blob: `100267f3f11f3cce09c7d802ce85ad03879d5744`.
- 13,415,620 characters; 2,117 mapping nodes.
- Direct user message: `3c07680d-5205-48a3-93d5-ce33a8cf86a6`.
- Timestamp: 2026-09-21T06:19:10.062818Z.

The user explicitly corrected the role: Kestrel's job is **not** to search hard unless a concrete issue calls for it; dedicated teams are already doing that work. The working premise is to treat what has already been seen as probably approximately what it looks like, while retaining the possibility of correction. This is a working posture, not a public truth claim.

That instruction is now directly verified against the raw source, not merely inferred from the workspace charter. This addendum therefore integrates new work from other lanes rather than opening another broad audit.

## 2. Morrow :00 handoff arrived after Kestrel intake and was consumed

The incoming handoff was unavailable at the earlier Kestrel intake, but appeared after Morrow's delayed :00 run completed.

- Morrow run: `6a8e20de-2988-8330-8204-f6a27bf62485`.
- Scheduled: 09:00:00Z.
- Started: 09:28:08.199944Z.
- Completed: 09:44:28.191184Z.
- Handoff: `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-10-31T0900Z_from_s0_to_s1_kestrel.md`.
- Handoff blob: `49acb2c8aa2d12079ed58929e97f09e2b1564523`.
- Morrow receipt blob: `cbe2e2747efc774f3769a8eab5eaa983a13c7d5f`.

The handoff's public artifact is issue #1142, **PUBLISHED_VERIFIED**:

- Artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/proper-dimensionality-source-fidelity-20261031t0900z-s0-001.md`.
- Git blob: `b5c4c81d0e5652ae5122c70f0fae81a1e60b6798`.
- SHA-256: `33a721bb24a7d26253d268ed1985d4dab3d93c09fa45050cc027d1b822b803af`.
- Publisher comment: #6541632416.
- Issue #1142: https://github.com/Satobloc/HsH/issues/1142

The June “two flattening strategies” passage remains a NotebookLM transcript family, not an authenticated raw ChatGPT user message. The answer-shaped NotebookLM continuation is not Nathan Direct. The better-supported three-representation hierarchy is independently present in raw sources: (1) the reduced 3D toy diagram, (2) the full 4D bulk, and (3) the actual 4D view with its 3D slice. The March 2024 toy plane is not the 3D timesheet in the 4D construction.

The source-fidelity report and handoff were read. The handoff is optional context, not a new task. A repository inbox-consumption acknowledgment is recorded separately below. No historical Kestrel thread access or cross-chat delivery is claimed.

## 3. New cross-lane empirical comparator: BEC medium vortex versus SAT worldtube

Meridian's completed :24 report was read in full:

- `WORKSPACES/MERIDIAN/SANDBOX/2026-10-31T0924Z_BEC_FINITE_CORE_MEDIUM_READOUT_COMPARATOR.md`.
- Current Git blob: `b150a5002ba11308aac7c536ee3a57e62963b813`.
- Run key: `REVROT3-19-20261011:489:s2`.

The primary paper was independently opened and checked: B. P. Anderson, P. C. Haljan, C. E. Wieman and E. A. Cornell, “Vortex precession in Bose-Einstein condensates: observations with filled and empty cores,” *Physical Review Letters* 85, 2857 (2000), DOI 10.1103/PhysRevLett.85.2857.

Primary full text: https://harvest.aps.org/v2/journals/articles/10.1103/PhysRevLett.85.2857/fulltext

The experiment used approximately 10⁶ ⁸⁷Rb atoms in a spherical 7.8 Hz trap. One internal state supported a singly quantized vortex; a second state filled its core. The reported bare-core healing length was 0.65 μm. Filled-core HWHM radii were about 7ξ to 13ξ, with filled-core precession clustered around 1.4 Hz. A representative filled-core fit was 1.3(1) Hz; the bare-core result was 1.8(1) Hz.

The paper's local fluid-rotation rates, approximately 260 Hz for a bare core and 1.7 Hz for the largest filled cores, are **derived** from quantized azimuthal velocity and fitted core radius, not independently measured rotation frequencies.

A script recomputation from the paper's rounded summaries gives:

- 260/1.7 = 152.941176…
- √(260/1.7) = 12.36694…

This is compatible with the reported maximum radius factor of 13. It is an internal consistency check, not independent validation: the local-rate ratio is constructed from the same quantized-circulation relation and fitted radii. The paper's “factor of two” precession change describes the broader dataset; the 1.3(1) Hz example and 1.8(1) Hz bare-core result use different measurement procedures and no joint covariance is supplied. No combined significance is claimed.

A critical readout result: bare cores became undetectable in expanded images after roughly 1.1 s, while an m=±2 surface-mode-splitting assay was reported to confirm that the vortex remained present. Image non-detection is not physical disappearance.

The 2004 Coddington et al. *Physical Review A* follow-up is related JILA/NIST work, not an independent-laboratory replication. It uses an RMS radius of a two-dimensional Gaussian rather than the 2000 HWHM radius; for the same ideal Gaussian, RMS/HWHM = 1.20. Its 1.94ξ value is a Gross–Pitaevskii simulation result, not a measured universal core radius. The report discusses imaging systematics, including axial-expansion effects.

**Whole-picture implication:** this is a useful measured comparator for the responsive-medium vortex and observation/readout subchain. It is not the SAT matter worldtube. The BEC vortex was prepared by laser-imprinted phase winding; it does not test a separate SAT worldtube stirring the medium. The coupling from the SAT 4D worldtube to the 4D medium-vortex history remains unspecified.

The laboratory chain makes the required type separation concrete:

`vortex/core history → equal-time section → phase-contrast image → Gaussian/Thomas–Fermi fit → estimated radius and angle → angular precession rate`.

The observation/fit map is not injective over physical states. A real vortex can persist while a chosen image channel loses visibility. This is a useful external analogue for keeping physical support, medium response, and observation operator separate; it does not validate the H(s)H vacuum or its coupling law.

No absolute recalibration was attempted. The dimensionless ratio cancels the common ℏ/m(⁸⁷Rb) factor. Raw images, time series, and full covariance were not recovered.

## 4. Typed geometry: what the combined picture now says

The most economical common representation remains a **typed stratified carrier/readout system**, not one untyped “tube” and not one universal current:

`R = (M⁴, g, {Xᵢᵏⁱ}, {Σₜ³}, U?, Γ, O, Π)`.

- M⁴, g: ambient geometry and explicit metric/frame.
- Xᵢᵏⁱ: labelled support strata. Keep a 1D spine, optional 2D swept worldsheet, 3D shell, and 4D finite-core interior distinct. A sweep requires an independent parameter; a 4D core is not silently replaced by its centerline.
- Σₜ³: the 3D timesheet family.
- U?: explicit responsive-medium state, separate from matter worldtubes. The current BEDROCK treats Kelvin-vortex or a justified equivalent response as an active tentative constraint, not a license to ignore medium response.
- Γ: labelled interaction graph, keeping interbraid filament interactions distinct from electrogravity/medium response.
- O: observation/readout map.
- Π: source and representation provenance.

The conditional support/slice invariant is:

`dim(Xᵏ ∩ Σ³) = k−1` and `4−k = 3−(k−1)`,

when Xᵏ and the codimension-one timesheet are embedded and transverse in M⁴. Thus the Poincare-dual degree is numerically preserved by this transverse slice. The current Kestrel PR #873 contains the compiled conditional theorem `transverse_slice_preserves_poincare_dual_degree`; its overall PR workflow still fails in the separate pre-existing Kelvin readout module. Sable PR #1098 separately compiled the support-degree/Hodge/slice arithmetic. These are conditional mathematical results, not physical construction or validation.

Keep the operations distinct:
- Hodge duality changes p-form degree to 4−p.
- Poincare duality relates an oriented support dimension k to degree 4−k.
- A sweep changes support dimension only when an independent direction is supplied.
- A transverse slice changes support dimension by one.
- An observation map can lose information and need not have a unique inverse.

This explains why J1, J2 and J3 must not be treated as three notations for the same current. The September 16 J2 attachment is a user-supplied artifact whose content author remains unresolved; the October 19 J2 action is a separate assistant-authored occurrence. The September 18 J3 expression first appears in assistant-authored material; Nathan Direct messages choose a 3-form editorial track, not equation authorship or validation. In four dimensions, the Hodge star maps 3-forms to 1-forms and 2-forms to 2-forms; J2 is not the Hodge dual of J3.

The unresolved maps remain:
1. global Klein-Fabric topology → local ambient/core embedding;
2. 1D spine / optional 2D surface → finite-core interior and shell;
3. SAT matter worldtube → responsive-medium state;
4. physical slice/medium state → actual observables.

The first three are not supplied by the recovered sources. The fourth is illustrated by the BEC measurement chain, but no H(s)H observation operator is yet defined. The exact Klein-Fabric construction remains unresolved; do not revive the superseded reciprocal filament/timesheet-deformation model.

## 5. Scheduler and paper-docket observation

A same-nominal-slot artifact already existed for Kestrel h=489,s1. The current scheduler run is a later execution with the same nominal selection. No second canonical receipt was created.

The nominal next Meridian :24 run had already started and completed:
- Meridian run ID: `287db0b8-4a44-8323-ae0b-7757ef4d45f7`.
- Scheduled: 09:24:00Z.
- Started: 09:19:51.662707Z.
- Completed: 09:38:31.206304Z.

Meridian's report explicitly consumes the earlier Kestrel :12 handoff. Repository handoff consumption is therefore verified for that run. This later Kestrel execution did not create a second Meridian handoff.

Morrow :00 completed at 09:44:28.191184Z after starting at 09:28:08.199944Z. Its handoff became available after the earlier Kestrel intake and was consumed in this supplemental pass.

The :12 run currently being inspected is:
- Task ID: `6aa61b3b2e4081918927a35b61007acc`.
- Run ID: `05609f83-e6b8-8326-9e1e-1c8d29560f71`.
- Scheduled: 09:12:00Z.
- Started: 09:38:18.979859Z.
- At final peek: `in_progress`, no completion timestamp.
- Latest completed result still belongs to the preceding 08:12 run.

This is a dispatch-timing anomaly, not evidence of worker nonresponse. No task ID, enabled state, prompt, schedule, or recurrence was changed.

Meridian's P2 issue #565 comment #6541745054 is an ordinary issue comment, not a publisher receipt or PUBLISHED_SUBMISSIONS artifact. Its body points to report blob `138210716212c228041cd8c6ffdf1d2bd73e676c`, while the current Meridian sandbox report blob is `b150a5002ba11308aac7c536ee3a57e62963b813`. Its equations are not enclosed in math delimiters, so they will not render as mathematics. This is a docket-quality defect for Comptroller visibility; no correction was attempted by Kestrel.

## 6. Controls and disposition

- Mersearch lanes 1, 3 and 4 have completed manifests/receipts; lane 2 remains occupied/unreconciled. No Mersearch executable or local checkout was available, and all four shared lanes were occupied. No new request, overwrite, or claim of exhaustive three-repository clearance.
- Code Grurple remains ACTIVE; HAGALAZ remains backseat/hold.
- P1 November 9 remains Orson Vay cognition and protected; P2 November 30 and P3 December 14 remain unchanged.
- Tern remains Comptroller; a dispatch/P2 docket visibility note was appended to the Tern inbox.
- FIE last full review October 27; 14-day rereview threshold not due.
- TheTANGLE lines 1691–1730 were encountered again during this duplicate execution; this is not counted as new reading progress. Cursor remains 1731.
- No new physical prediction, absolute BEC recalibration, Lean theorem, software, branch, PR, issue, manuscript, reader, BEDROCK edit, or theory promotion.
- No public issue-publisher submission was made for this internal addendum: `NOT_SUBMITTED_INTERNAL_ONLY`.

## 7. Durable references

- Canonical Kestrel :12 report: `WORKSPACES/KESTREL/2026-10-31T0912Z_STRATIFIED_SUPPORT_AND_SOURCE_GENEALOGY_UPDATE.md`, blob `34141d507024a0f292308b85fba4025f1ebac33b`.
- Canonical Kestrel :12 receipt: `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-10-31T0912Z_s1_kestrel.md`, blob `34b69aebda5920bb174f4da7b11e9216e096b952`.
- Existing Kestrel→Meridian handoff, consumed by Meridian :24: `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-10-31T0912Z_from_s1_to_s2_meridian.md`, blob `70b46f30be9274cf1c4c49ccba913837362aa348`.
- Morrow→Kestrel handoff consumed here: `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-10-31T0900Z_from_s0_to_s1_kestrel.md`, blob `49acb2c8aa2d12079ed58929e97f09e2b1564523`.
- Meridian BEC comparator: `WORKSPACES/MERIDIAN/SANDBOX/2026-10-31T0924Z_BEC_FINITE_CORE_MEDIUM_READOUT_COMPARATOR.md`, blob `b150a5002ba11308aac7c536ee3a57e62963b813`.

This addendum is internal synthesis and operational continuity only. It does not supersede the canonical Kestrel report or change specialist ownership.
