# Aster h1117:s3 | source-tuple integrity and FIE source cross-read

**Nominal UTC:** 2026-11-26T13:36Z  
**Run key:** `REVROT3-19-20261011:1117:s3`  
**Selected ring label:** Aster (index 2)  
**Next ring label:** Ariadne (index 3)  
**Disposition:** `SOURCE_TUPLE_GUARD_ADDED / FIE_CROSSREAD_COMPLETE / FORMAL_REREVIEW_NOT_DUE / NO_NEW_LEAN_THEOREM / P0_ACTIVE`

## 1. Authority and identity

Aster's historical source is the archived raw conversation at:

- Repository/path: `Satobloc/HsH / DEVELOPMENT_FULL_CONVOS/CONVOS_23/26.09.20•26.10.17•ASTER — raw.json`
- Git blob SHA-1: `1bf6e65c4ac1650297acb67d7e39f700454a03c8`
- Embedded conversation ID: `6ab006ce-e358-83ea-b3dd-7b23a26c00fa`
- Parsed graph: 1,818 mapping entries, 1,817 message-bearing nodes, 39 user-role messages; all 39 user-role messages occur on the current-node ancestry.

Direct user-role messages establish the source-fidelity remit: test whether a claim is actually present in Nathan-attributed source material, whether it appears elsewhere, and whether it contradicts earlier statements. The historical Paper A assignment is superseded for current operations: Code Grurple remains **REVIEW FROZEN / CROSS-READ OPEN**. No formal Paper A review was performed. No standalone signed Aster charter or authenticated current Aster thread was recovered; this is source-grounded assistant work, not historical-instance participation.

The exact raw SHA-256 and UTF-8 byte length remain those recorded in the existing source-custody correction, [issue #2591 comment #7188811605](https://github.com/Satobloc/HsH/issues/2591#issuecomment-7188811605). This run independently re-fetched the SHA-pinned Git blob and re-parsed its embedded conversation ID and graph counts; it did not recompute the raw SHA-256.

## 2. Substantive workflow improvement: source-object tuple cross-binding

The Aster h1110:s0 amendment at [issue #2591](https://github.com/Satobloc/HsH/issues/2591) initially carried a source-identity tuple belonging to Sable: conversation ID `6aa6701e-b800-83ea-a19a-31a802b7124d`, Sable's raw SHA-256, and Sable's mapping-node count. The additive correction in comment #7188811605 identifies the actual Aster source and preserves the original published artifact unchanged.

The failure mode is cross-document metadata substitution: a correct topic, worker label, path fragment, or copied report template does not make a nearby source ID/hash/count belong to the current source object.

I added a concise **Source-object tuple cross-binding** gate to [Aster NEW_INSTANCE_START_HERE.md](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ASTER/NEW_INSTANCE_START_HERE.md):

`repository + path + Git blob SHA-1 + embedded conversation_id + exact UTF-8 byte length + raw SHA-256 + mapping/message/user-role counts`

Every field must be derived from the same fetched bytes. Git blob SHA-1 and raw-file SHA-256 are separate identities. Before publication, compare the complete tuple with the workspace pointer and prior receipt. If any component disagrees, stop attribution as `SOURCE_TUPLE_MISMATCH`, preserve the prior artifact, and append a correction to the existing issue/receipt. Unknown fields remain UNKNOWN rather than being copied from another worker or template.

**Implementation readback:**

- Commit: `2382d0d7582c2654343c09247bedac4a45ac01e5`
- New file blob: `7573b3f1f9799f4d52550934d027cf9379a59346`
- Exact independent readback: PASS, 13,340 characters.

This is a worker-specific provenance control, not a new search tool, global policy change, identity claim, or authorship authenticator.

## 3. FIE source cross-read

The full extracted text of **THE FUNDAMENTAL INTUITIONS — EXTENDED 2** was read, pages 1–6, 12,892 characters.

- Original PDF Git blob previously identified as `ba0af013da1681a070b4947def6499cedb403162`.
- Extracted text blob: `468a04e9941165353e286b48e5a0ca27d5be58d9`.
- Extraction header source SHA-256: `d13d32109ca32b15dabd5e8d4084995d3a36f9e8ab8a5dcac45ae2f150a9a1d9`.
- Extraction request: `2026-09-10_root_pdf_extraction_pass_002`, requested by Ravel / ChatGPT.
- The extracted text records document dates 2 February 2025 and update 26 February 2026. No author field is present in the extracted text. The original PDF's visual pages and binary metadata were not independently inspected in this pass; the text is a derivative representation, not the PDF itself.

Proposition E describes `theta_4` as an angle of intersection with the time surface and says the vacuum lattice has a near-zero angle, but does not explicitly type whether that angle is measured relative to the surface or its normal.

The already-recovered direct user-role source in **Physics Beyond Mathematics** (conversation `67fbf051-c1d0-8003-b145-21041c7d7923`, raw blob `944589f39b6c396027f9aeff17d37fd2be1aed70`) preserves the distinction:

- 2025-04-16 03:07:36, message `90f469af-b4e6-49d5-8138-d1a9321b84b8`: warns against sliding between the angle relative to the wavefront surface and the angle relative to propagation direction.
- 2025-04-16 04:04:32, message `4ca159f7-6a38-49ba-b5ca-cb2689cf4373`: gives a tentative perfect-vacuum value of 90 degrees relative to the time surface.
- 2025-04-17 18:22:49, message `60e5dff1-8b55-44f0-bb1c-aaf914f59e93`: asks whether the angle is relative to the propagation normal; this is a question, not a completed definition.
- 2025-05-06 06:26:35, message `e3d19608-7439-410a-baaf-8a5bab3f945d`: describes a four-dimensional intersectional angle and its proposed energy-transfer/mass-inception role.
- 2025-05-06 07:07:32, message `b83aca0c-2c91-47b8-bb97-c914716b1a29`: says SAT lacks a way to measure `theta_4`.
- 2025-05-06 07:21:19, message `7783c215-7d7a-42f9-ac8a-56a1f9f3816e`: rejects attributing the `theta_4)-gradient gravity assumption to Nathan.

The August 27 direct witness in conversation `6a8eacca-c470-83ea-af92-8fb8df194de9`, raw blob `92454acdaad701193e2a0c6cf64a7d7b70a03dbb`, message `95319111-ba02-4b45-885a-6e44bd5fed7d`, states 90 degrees, perpendicular to the time sheet and parallel to the time normal/propagation direction, and uses inverse-pitch wording. It does not supply a fully normalized angle map.

Current BEDROCK BR-005 uses the later normal-relative zero baseline, but the exact 2026-09-16 raw event behind that entry remains unrecovered. Preserve the status distinction: FIE's near-zero statement is untyped; the April/August 90-degree statements are direct user-role witnesses with their own wording; BR-005 is the current working convention whose underlying raw event is still missing. Do not rewrite one into another as though they were source-identical.

## 4. Formal boundary

Existing PR #674 contains `FIEAngleConventionFidelity.lean`, blob `056ff72af5e01c2db4f554f549d9a99a7cb34ce9`. Its `Complementary` predicate assumes:

[
alpha_{\mathrm{sheet}}+\alpha_{\mathrm{normal}}=\pi/2.
]

It proves four algebraic consequences of that declared relation. Its own module comment identifies common metric, orthogonality, acute-angle convention and differentiable geometry as preconditions, not results. It does not derive complementarity from a Lorentzian 4D metric, choose the historical intended reference, prove a mass law, or validate a physical vacuum.

PR #674 remains OPEN / DRAFT / UNMERGED at head `138a40a678a61cfb8bb00448b6f5b4bc20b504c5`. No PR-triggered workflow run was returned for that exact head. Earlier successful run #40447650215 compiled the same module blob at earlier commit `74dbac1b8658117dfaacb9553b637df109656c63`; it is not exact-current-head verification. No new Lean theorem or build was warranted because this pass added no new mathematical proposition. The Euclidean complement relation remains conditional, not a demonstrated Lorentzian map.

## 5. Mersearch and repository boundaries

Read the current Mersearch worker guide and stable-release notes. The four shared request lanes remain occupied:

1. Calder angle-geometry source fidelity.
2. PHY-01 worldtube/Hinton/higher-categories.
3. Calder IRI/worldtube geometry.
4. Kestrel finite-core geometry.

Lane 2 has a request-scoped manifest, but its query is not this FIE/BR-005 source task; its post-containment raw results are withheld. No free lane was available. No request was overwritten, released, retriggered, or represented as a new Mersearch result. The exact known raw blobs were retrieved directly as a bounded source read, not as a Mersearch search. HSH_RESOURCES access remained limited to its root README and `indexes/AI_START_HERE.md`; no private payload was opened.

## 6. P0 and campaign boundaries

The latest discovery refresh [#45827238925](https://github.com/Satobloc/HsH/actions/runs/45827238925) succeeded at source cut `4c0efd55c5beaa8f00be0ef1ed5703c167a019ad`; generated-only current main was `c73e8619633f44f8955b63ea7523bbe12ce564f8). The latest snapshot summary records 18,022 documents, 48 docket entries, 417 square visuals and six extraction errors, with HsH and SAT archive inputs complete. That newest snapshot was not independently parsed record-by-record in this pass.

The last full record-level parse remains 18,016 documents, 11,084 workspace records (all missing `presentation_state` and carrying generic reader routes), and 26 machine/control records outside `WORKSPACES/**` (all carrying generic reader routes, 11 with excerpts). The newest snapshot's freshness is verified at its source cut; its full record-level safety is not newly re-parsed here.

**P0 remains FAIL.** Paper A/B live-route acceptance is NOT_OBSERVED; deployment is NOT_VERIFIED; release/standdown is NOT_AUTHORIZED. Tern retains release authority; Meridian implementation; Mercer independent A/B QA.

- P1 November 9 cognition paper: OVERDUE / FROZEN / Orson-owned.
- P2 November 30 measured-system paper: HOLD.
- P3 December 14 full-theory paper: INCOMPLETE.
- Last full FIE rereview in Aster's controlling CURRENT_WORK: November 24; next due December 8. This was a bounded FIE source cross-read, not a new scheduled full rereview.
- Unrelated-source break: last completed November 24; next due November 28.
- Tern retains PWH queue, task-graph and Comptroller authority. No queue or graph mutation.

No physical system or dataset was selected; no physical calculation, fit, prediction, uncertainty propagation, independent measurement, SAT-O/Blockwave equation edit, manuscript advancement, or BEDROCK theory promotion occurred.

## 7. Return cursor

**Current focus:** source-object identity must be validated as one cross-bound tuple before a source-fidelity claim is published.

**Immediate action:** apply the tuple guard to future Aster source reports; preserve the existing correction at #2591 comment #7188811605 rather than rewriting its historical artifact.

**Stop:** do not reopen Paper A review, infer the missing September 16 BR-005 source, infer a Lorentzian angle map, overwrite Mersearch lanes, or alter P0 release authority.

**Next ring label:** Ariadne. No authenticated current Aster thread, direct-thread delivery, consumption, or acknowledgment is claimed.