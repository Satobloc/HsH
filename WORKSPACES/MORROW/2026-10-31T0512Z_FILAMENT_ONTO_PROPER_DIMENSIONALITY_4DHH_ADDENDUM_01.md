# Morrow supplemental source-stratigraphy note: Filament Onto, Proper Dimensionality, and 4DHH PDFs

**Nominal relay slot:** 2026-10-31 05:12Z  
**Current execution observed start:** 2026-10-31T05:41:58.547878Z  
**Run key:** `REVROT3-19-20261011:485:s1`  
**Selected / next:** Morrow / Kestrel  
**Status:** ADDITIVE ARCHIVE-PROVENANCE SUPPLEMENT. The same nominal slot already has a completed Morrow receipt with an earlier observed start (05:14:32.753Z). This note supplements that record; it is not a second execution receipt and does not claim original Morrow-thread access.

## 1. Role and controls

Morrow's recovered role remains provisional Team Archivist / corpus-appraisal, not physics-theory authority. The live Morrow README and TRIAL_CHECKPOINT retain the training-completion-not-asserted state and theory freeze. The project-wide 2026-09-12 Training Standdown remains active. This pass therefore stayed within source retrieval, chronology, file identity, provenance classification, and tagging. It did not integrate archive material into current theory.

Live controls read for this pass include BEDROCK (blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`), Steering Charter 2026-10-26, Universal Shape-to-Lean directive, Three Paper Campaign, onboarding, Revival Rotation V3/V4, thread routing, navigation preflight, branch map, scheduler authority, Morrow README/TRIAL_CHECKPOINT/INBOX, Read-It-Tag-It policy, layered tag schema, source-integration architecture, training standdown, Common Bulletin/Coordination/Handoffs, Tern's 05:00Z receipt and Kestrel README/INBOX.

The explicit 19-worker ring selected Morrow at h=485, seq=2426, index 13; next is Kestrel, index 14. The automation task remains `6aa61b3b2e4081918927a35b61007acc`, enabled, hourly at :12 America/New_York. No schedule or task mutation was made.

## 2. Mersearch-first retrieval state

The completed Enheduanna Page One lane-3 request was reused, not duplicated:

- Request: `enheduanna-page-one-origin-20261031-0100`
- Manifest blob: `dcaf63a8e9d770afec3d067d15dba08243e51304`
- Receipt JSON blob: `ccd9599a407495bf6bd80b079557d89e14f251aa`
- Receipt Markdown blob: `e1fa022458fe33945dd36435877c81d5f1605d03`
- Footprint: 15,780 files; 20,828,714 records; 1,585 hits; 298 distinct paths.

The request JSON's `requested` value remains trigger metadata, not an execution status; it was not edited. Raw payloads remain withheld. Exact-string GitHub repository searches below were supplementary navigation after reading the Mersearch receipt, not a new Mersearch execution. All four Mersearch lanes remain occupied; no request was created, overwritten, or retriggered.

## 3. FILAMENT ONTO / black-hole notes: related files, authorship unresolved

### 3.1 Canonical archive file identity

The following three SAT-archive paths return the same Git blob and exact content:

- `Filament onto.txt`
- `2026/SAT THEORY — Filament onto.txt`
- `SAT 2026 CONCEPTS/2026 NEW — Filament onto.txt`

Shared blob: `a13c67ff2b47cf178672804d91771e01d4c4a3e1`  
Length: 103,710 characters; 1,732 lines.

The header is only `FILAMENT ONTO`, followed by `here's an idea:`. No byline, source conversation ID, message UUID, or creation date is present in the inspected header. The first-person voice is not sufficient to authenticate Nathan Direct authorship. Classification: `UNBYLINED_FIRST_PERSON_ARCHIVE_TEXT`.

The text contains speculative black-hole, galaxy, baryon, chirality, and boson claims. It includes the phrase `ten to the power of 44 Jules per filament tension` on line 5, without a source, dimensionally usable unit specification, or measured-system provenance. This is not a measured tension and must not be imported as a physical parameter. The text itself uses explicit uncertainty language in several places; preserve that exploratory status.

### 3.2 Related but non-identical variants

- `2026/SAT THEORY — Gx Halos Etc .txt`: blob `b8a934635ffbfae177eeef53838beb3cdb5bc91c`, 103,704 characters. It shares a 16,876-character normalized opening with `Filament onto.txt`, then diverges. Not byte-identical.
- `BLACK HOLES AND BIG BANGS.txt`: blob `708c70ee1a721e81f0b9e0586e5617422407fa06`, 19,518 characters. The HsH copy at `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT 2026 PRE HsH/SAT 2026 THOUGHTS — BLACK HOLES AND BIG BANGS.txt` is byte-identical to this archive file. It shares an 18,738-character normalized opening with `Filament onto.txt`, but is not a byte-identical subset.
- `LIBRARY/generated/filament-onto.md`: blob `df8a0e018bb3ae3b27e9214d8c48728476a7cc26`, 107,419 characters. This is explicitly a presentation copy. Its metadata leaves date and development phase blank and labels the item Tier II / trial candidate. It points back to the historical SAT archive as source of truth; it is not an independent source.

For the two normalized-prefix checks, the comparison removed the leading title and optional `here's an idea:` line, collapsed whitespace, and counted the exact common prefix. These are text-overlap measurements only, not authorship or chronology evidence.

## 4. PROPER DIMENSIONALITY: high-value transcript segment, raw node not recovered

Archive source:

- Path: `2026 discussions/SAT THEORY — PROPER DIMENSIONALITY.txt`
- Blob: `1ea1f8d506210202517aaeb0489c5950357fa39f`
- Length: 199,907 characters; 3,607 lines.

Two HsH paths are exact copies of one shorter file:

- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/PROPER DIMENSIONALITY.txt`
- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/[SAT26 PRE-ROUNDUP - init]/PROPER DIMENSIONALITY.txt`

Shared HsH blob: `1d8cd1574a6acdc0f86691599191b74428a2c086`; 97,229 characters. The HsH copy is not byte-identical to the 199,907-character archive version.

At archive lines 1176-1178, a first-person, user-message-like transcript segment says that two different flattening strategies are being conflated with one another and with the actual 4D structures. It distinguishes useful reductions:
- filament worldtube to worldline;
- time slice to plane or slab;
- their intersection to a point plus angle `theta_4`;
- the more substantive 3D intersection manifold, bounded by the worldtube boundary and truncated by time thickness.

The passage explicitly asks that the full 4D structures not be casually collapsed into worldline language, and says not to settle on a formalism yet because the speaker is not clear how the proposed construction should be made logically consistent. It also includes a tentative `H_0` versus `H_0+c` differential-expansion idea and explicitly qualifies uncertainty about its construction.

The transcript uses interface-like date labels (`Monday, June 1` and `Today • 2:14 PM`), but no year, platform export ID, raw conversation UUID, or message UUID was recovered. Classification: `USER_MESSAGE_LIKE_TRANSCRIPT_SEGMENT / RAW_NODE_NOT_RECOVERED`, not a raw-authenticated Nathan Direct quotation.

At line 1179 the voice changes to an assistant-style expansion beginning `The refined ontic characterization...`. It adds a four-identical-spacelike-dimensions model, universal shell, gauge-group cycling, BV pushforward, 1D AKSZ, and 24-cell stabilization. Those are assistant-generated elaborations in this transcript, not user adoption. The preceding user-like passage explicitly says not to settle the formalism.

### Formalization triage

The passage contains geometry and therefore is not exempt from the universal shape-to-Lean review. A source-faithful proposition about the claimed 3D intersection manifold is presently `FORMALIZATION_BLOCKED_DEFINITION`. Missing definitions include:

1. the intrinsic dimension and mathematical type of the worldtube support (embedded submanifold, finite-core region, or distributional support);
2. the codimension, regularity, and finite-thickness meaning of the timesheet family;
3. the transversality or other intersection hypotheses;
4. the precise boundary/truncation operation;
5. the domain, codomain, and direction of each flattening map;
6. the metric and orientation convention defining `theta_4`.

No Lean theorem was attempted because a precise source-faithful statement cannot yet be formed from this transcript, and Morrow's training/theory freeze remains active. No physical calculation was performed.

## 5. 4DHH PDF pair: separate extraction objects, not a single authored derivation

### 5.1 4DHH LAGRANGIAN (nolat).pdf

- Extraction: `_AUTO_EXTRACTED_TEXT/4DHH LAGRANGIAN (nolat).txt`
- Extracted-text blob: `24d202bdbc79f3c0d83cfd8a9db584479eed5444`
- Source PDF SHA-256: `8443a85e8a4117422565745b848bd32764f0059e8fbedb9b73107b34e02a3923`
- 21 pages; 42,487 extracted characters; PyMuPDF; OCR not attempted.
- Extraction request: `2026-09-10_root_pdf_extraction_pass_002`, requested by Ravel / ChatGPT; extraction time 2026-09-10T16:02:17.165644Z.

Extracted lines 27-31 begin `We proceed with the formal execution...` and `As your co-investigator, I am now translating...`. The document speaks in an assistant/collaborator voice and supplies a 4DHH Lagrangian, statistical inverse-tangent metric, phase, elasticity, spectrum, matter, and interaction blocks. No raw source conversation or user-authored equation message was recovered. Classification: `ASSISTANT_VOICE / ASSISTANT_FORMALIZATION_CANDIDATE / RAW_NODE_NOT_RECOVERED`. It is not Nathan Direct mathematics and not a compiled derivation.

### 5.2 SAT.4DHH.UC.pdf

- Extraction: `_AUTO_EXTRACTED_TEXT/SAT.4DHH.UC.txt`
- Extracted-text blob: `c3c63e983663a1648aa78ce9f591c28e7997f055`
- Source PDF SHA-256: `9b28c5776516af59dd661485ac519983c9b77b56c435a4ec15436d24f8bf028f`
- 150 pages; 191,932 extracted characters; PyMuPDF; OCR not attempted.
- Same extraction request; extraction time 2026-09-10T16:03:00.196293Z.

The extraction begins with `LLM DROP` at line 22 and a prompt-like instruction at lines 23-26 asking for a fully explicit superhelical action and numeric checks. The following content includes Fundamental Intuitions and additional mathematical material. The prompt-like segment's speaker is not identified by a raw message node, and the full PDF is a mixed-origin compilation. Classification: `MIXED_ORIGIN_PDF / PROMPT_LIKE_SEGMENT / AUTHORSHIP_UNRESOLVED`. Do not attribute the entire document or its equations to Nathan.

Neither original PDF was visually inspected in this pass; these findings are based on the derived PyMuPDF text extractions, with OCR explicitly not attempted.

## 6. Existing compiled provenance theorem, separate from SAT physics

PR #663, `Morrow: Lean provenance gate for mirrored work-item IDs`, remains OPEN and UNMERGED. Its head is `937b8f4a902be48aa9c883e2ed99340e088dbd3e`. The exact-head GitHub check run #40438955871 / job #121974372375 succeeded. Job logs record Lean 4.34.0 / Lake 5.0.0 and a successful 8,942-job Lake build. The `MorrowEventIdentity` module reports five named theorem targets with no axioms. Test, lint, and automated axiom-audit steps were skipped. This is a compiled archival event-identity formalization, not a SAT geometry theorem or physical validation.

No new Lean code, theorem, branch, PR, or issue was created.

## 7. Read-It-Tag-It and unrelated reading

The source tag ledger is `WORKSPACES/COMMON/tagging_ledgers/2026-10-31-MORROW-FILAMENT-ONTO-PROPER-DIMENSIONALITY-4DHH-01.md`. It records the sources read here, their tags, exact hashes, and attribution limits. Tags are additive and do not promote authorship or theory status.

Unrelated reading continued in Jacoby, `Astronomer Talks`, lines 541-580 (historical explanation of the spectroscope, wavelength measurement, and visibility). Source blob: `a7f48e0a01dc7c647d6c18f5418d90d71242b8e3`. Next cursor: line 581. FIE last full revisit was October 27; the 14-day revisit threshold is not due.

## 8. Disposition and next cursor

- Source recovery: advanced; no byline or raw source node recovered for the three new document families.
- Mersearch: existing lane-3 result verified and reused; no new request.
- Geometry: identified but underdefined; `FORMALIZATION_BLOCKED_DEFINITION`.
- Lean: existing PR #663 compile verified; no new theorem.
- Physical calculation: none.
- Theory integration/promotion: none; Morrow training/theory freeze remains active.
- Publication: `NOT_SUBMITTED — INTERNAL SOURCE-PROVENANCE SUPPLEMENT`. No issue-publisher submission was made.
- Cross-chat delivery: not available or claimed. Kestrel receives repository-only optional context; consumption remains unverified.

Next archive cursor: recover the raw source/message behind the PROPER DIMENSIONALITY transcript segment; locate a dated/bylined original for FILAMENT ONTO; and recover the raw conversation/source document for the 4DHH LAGRANGIAN and SAT.4DHH.UC PDFs. Do not turn the assistant expansions into Nathan Direct material.
