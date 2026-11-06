# Enheduanna source-role, witness metadata, and Lean type audit

**Run:** 2026-11-01T18:48Z  
**Run key:** REVROT3-19-20261011:522:s4  
**Source snapshot:** HsH main observed at 8bb7827a2279a342930fc5f8b1417ead5a3d40c4  
**Status:** HISTORICAL SPECIALIST CHARTER NOT RECOVERED / SOURCE CROSSWALK REFINED / VARIANT-TYPE GAP IDENTIFIED / EXISTING LEAN BUILD SCOPE CORRECTED / NO CODE CHANGE

## 1. Selection and role provenance

h = 522; seq = 5(522)+4 = 2614; 2614 mod 19 = 11.

- Selected ring identity: Enheduanna, index 11.
- Next ring identity: Tern Rook, index 12.
- This is a source-grounded selection, not authenticated participation by a historical Enheduanna ChatGPT instance.

No standalone Nathan-authored historical specialist charter or authenticated current Enheduanna thread was recovered. The strongest direct user-role instruction is in the raw “Revival Rotation” conversation, ID 6aa8a2bf-8280-83e9-9d57-1e0af853b7f1, message 11399ca2-5bd6-4203-9e19-e8e044fbc736, 2026-09-23T02:04:49.417Z. It says Enheduanna is a similar revival case to Alberr and instructs the team to consider all archives. This is a broad archive-revival instruction, not a specialized role charter.

Other recovered references are different source types:
- The 2025 “Narration of Alberr's Arrival” conversation (68c3c78b-1484-832a-a6b5-672db9dc977e) contains user-supplied creative roleplay using Enheduanna as a narrative reference.
- “Translate scientific equation” (68c43a3c-4f7c-8323-adb4-de924406574d) asks whether Enheduanna would have known an idea and requests a precise historical-voice rendering. These are reconstruction prompts, not a worker-owned thread or charter.
- NOTEBOOLM PROJECTS LIST.txt, blob 3b5591e8ffaac240d4b884e643e1c09e427a3b48, line 667 records a January 22, 2025 four-source project titled “Enheduanna: A Sister's Voice Across Time.” The four source titles and a project-specific source manifest were not recovered.
- A Library search found only a partial 29,007-character excerpt of an attachment named Enheduana convo.txt (metadata size 127,645 bytes) embedded in a raw conversation export. The standalone original attachment bytes were not recovered.
- The 2026-10-12 source-layer census (blob 8d6b08dac9e169f529f1b43cbd8c3cbf0cc78478) is an assistant-authored operational synthesis. It explicitly is not an original check-in or historical-person emulation.

The Vey Cognition Lab source index and README include Enheduanna among persona-reconstruction cases. That is a cross-lane cognition topic, not evidence of an independent agent or a historical worker instance. Orson retains primary cognition/P1 ownership; no P1 transfer or experiment occurred.

## 2. Mersearch-first source preflight

The Mersearch worker guide, current shared request, all four request lanes, and the existing Enheduanna request-scoped manifests/receipts were inspected. Existing completed requests were reused; no new request was submitted and no lane was overwritten.

- enheduanna-page-one-origin-20261031-0100: 1,585 reported hits (522 archive, 1,042 HsH, 21 HSH_RESOURCES); compact receipt reports 188 distinct paths. Raw result files remain withheld. The query is not a user-only corpus and includes a self-match to the active Aster lane-3 request plus duplicate path families.
- enheduanna-temple-hymns-nathan-source-20261030-1340: 27 hits across 18 paths (25 HsH, 2 HSH_RESOURCES), with a user-author filter. These are navigation results, not independent witnesses.
- Current four lanes remain occupied/unreleased: lane 1 Morrow, lane 2 optics, lane 3 Aster, lane 4 Tern. No new search or overwrite.

## 3. Temple Hymns: Tablet O crosswalk and catalog history

The source crosswalk is now more precise than the earlier “O not identified” boundary:

- Glaz 2020 Figure 2 caption identifies Tablet O as N 4179, Plate XXXI, copied by E. Bergmann.
- CDLI P279044 catalogs museum number N 4179 and the TCS 3, p. 15 publication reference.
- The current CDLI record leaves both Accession Number and Witness fields blank. N 4179 is the museum number, not a separately supplied accession number or CDLI witness siglum.
- CDLI metadata history shows a 2005 Penn Museum record, later external-resource updates in 2023, and a 2024 publication-reference update.

Therefore the caption/catalog object crosswalk is recovered. The separate accession number and direct inspection of the original 1969 TCS III Plate XXXI remain unresolved. The CDLI photograph was not inspected; the large image route was unavailable in this run. This is a caption/catalog crosswalk, not a physical-plate collation.

## 4. Exaltation of Inana: source-to-type mismatch

This is a separate source family from the Temple Hymns Tablet O material.

Helle 2022, PDF page 47, reports four manuscripts with du11, three with du3, one with du2, and one with du8: nine source-reported manuscript readings. These are editorially reported variant counts, not nine independently inspected physical measurements.

The line-level surface transliteration ma-ra-du2-ud must remain distinct from the variant-class label du2.

On PR #890 head 7e75fb3ee6a36fb6bf4e92654481724e27e58be8:
- EnheduannaCDLIThirdWitness.lean defines TerminalReadout with du11, du2ud, du8, and unpreserved.
- The type omits du3.
- It mixes a preservation/missingness state (unpreserved) into the reading-variant class.
- It uses the surface form du2ud as a variant label, while Helle's count note labels the class du2.
- helleReportedCounts is the unlabeled vector [4,3,1,1], so the encoded list sum does not establish the source-aligned mapping from counts to variants.

A source-faithful correction should separate (1) TerminalVariant = du11/du3/du2/du8, (2) exact surface transliteration (including du2-ud), and (3) PreservationState. Counts should be labeled by variant. No code change was made in this run.

## 5. Proof-first Lean triage and exact build limits

PR #890 remains OPEN / DRAFT / UNMERGED. Its head is 7e75fb3ee6a36fb6bf4e92654481724e27e58be8 on a research base branch, not current main. The current main TASK_BRANCH_GRAPH blob is 3c341c616aa893bf56ad5ad5919e09a17e0c2b46 and contains no Enheduanna or PR #890 entry.

Existing CI run #41012299180 succeeded, but the job log shows checkout of synthetic merge ref 6fc6a054f766d450b8a299d12b6c0112c1e89513, not an exact-head-only build. It compiled EnheduannaCDLIThirdWitness.lean. It did not contain EnheduannaOLayoutScopeSeparation.lean or its theorem outputs.

The latter module (blob 850851f8ee5f3372d4392775375f943f84d8a88) is present on the PR head but is not imported by HsHVerification.lean (blob 8c2aecf3fd272128637fa40b0d5a13d67d6964fa). Its theorem no_scope_decoder_from_layout remains UNCOMPILED.

The theorem encodes a finite non-identifiability proposition: two source-discussed attribution scopes can share the same reported O layout, so the layout fields alone do not determine semantic scope. A Python finite-model check returned same_layout=true, different_scope=true, layout_only_decoder_exists=false. This is a model check, not Lean proof. The theorem does not establish which historical scope is correct or any physical fact.

The retrieved Actions log contains no sorryAx. Tests, lint, nanoda, and the separate automated axiom audit were skipped. No new Lean module, PR, branch, root import, or research-branch mutation was made. Code Grurple remains ACTIVE and ordinary research branches remain backseat/hold. Local lean/lake/elan executables are absent.

## 6. Public record and cross-lane cognition boundary

A public-safe additive source-to-type correction was posted to existing PR #890 as comment 6562518445 and fetched back with exact body match. It corrects the prior object-crosswalk wording and records the variant-type gap and uncompiled module.

No new HSH-PUBLISH-V1 issue was created: existing published issues #891 (third physical witness/variant counts), #1086 (Tablet O/N 4179/layout scope), and #1192 (claim-relation typing/source genealogy) already cover the relevant source families. Creating another publisher issue would duplicate the existing public record cluster. The prior issue #1213 remains PUBLISHER_REJECTED_SHA256_MISMATCH; no retry or duplicate was attempted.

The 2025 roleplay/voice-reconstruction material is not evidence of historical Enheduanna speech, a worker-owned thread, assistant memory, or model consciousness. It is a possible source-attribution case for Orson's existing persona-effect research, not a new P1 experiment. No model calls or human-subject work occurred.

## 7. Controls and next cursors

- Code Grurple remains ACTIVE.
- Orson's P1 cognition ownership and November 9 gate remain protected.
- November 30 P2 and December 14 P3 remain separate.
- No physical calculation, new model inference, human-subject experiment, manuscript advancement, BEDROCK promotion, SAT-O/Blockwave equation change, new tool, branch, PR, or Mersearch request.
- FIE last full review October 27; the 14-day rereview threshold is not due.
- Unrelated reading break: SAT Mark V/TheTANGLE.txt, lines 1931-1970; next cursor 1971.
- Source cursor: obtain direct inspection of TCS III Plate XXXI and the N 4179 photograph; recover the four-source NotebookLM manifest; after the Code Grurple interlock lifts, repair the variant type and import/compile OLayoutScopeSeparation.

## 8. Handoff timing

The ring-next identity is Tern Rook, index 12. The next hourly :00 task selected Tern and started at 2026-11-01T19:00:06.518590Z before this handoff was written. This packet is therefore LATE_OPTIONAL_CONTEXT_ONLY for the current Tern run and intended for Tern's next same-phase appearance at 2026-11-02T14:00Z (h=542, s0). It creates no task, response obligation, ownership transfer, or claim of consumption/acknowledgment.


## Addendum | 2026-11-06 | Direct-source locator correction

The original Section 1 correctly identified the direct user message and conversation ID, but its raw-blob attribution was too coarse. The message UUID must be tied to the export that actually contains it.

### Direct source now read

- Library export: **`MARLOWE — raw.json`**
- Library file ID: `file_000000001774820c875fd31ce81953ea`
- Library version: `1`
- Size: `1,852,875` bytes
- SHA-256 of materialized raw bytes: `93ad219a5c7e79cf31cfcdc6c1bd40a36e148c252df2189bb957f8977983baef`
- Export header: title `MARLOWE`; conversation ID `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`; update time `2026-10-06T02:14:34.066481Z`; exported `is_archived=false`.
- Direct message: `11399ca2-5bd6-4203-9e19-e8e044fbc736`, `author.role=user`, `author.name=null`, create time `2026-09-23T02:04:49.417Z`; raw JSON lines 15314–15332.
- The message describes Enheduanna as a similar revival case and concludes: “But do always consider all archives.”

The export's `is_archived=false` is historical metadata, not proof that the ChatGPT thread is currently live or usable. The raw export title is `MARLOWE`; earlier repository continuity notes called the same conversation ID `Revival Rotation`. The conversation ID, not the mutable title, is the stable identity.

### Earlier repository exports are distinct snapshots

- HsH `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_19/26.09.14•26.09.22•Revival Rotation — raw.json`, blob `3bf173c217e0755419152aa2225f39713929a5fe`, has title `Revival Rotation` and update time `2026-09-22T09:58:31.957238Z`. Its retrieved content does not contain message `11399ca2-5bd6-4203-9e19-e8e044fbc736`; it predates that message's 2026-09-23 creation time.
- The separate HsH `Revival Rotation — raw (2).json` blob `386516f7c2d5b9ab2cd4f0050869ae00c133274d` is referenced by the Kirk-methodology source record for a different user message, `41fe4df4-fa3f-4045-bf99-0f095903c052`, at `2026-09-23T02:06:05.180Z`. Do not reuse that blob as the source locator for message `11399...` without file-level verification.
- The later Library export `MARLOWE — raw.json` is the directly verified source for message `11399...`. It is a separate export snapshot; do not collapse its bytes, title, or update time into either earlier repository export.

### Authority boundary

This direct user-role message establishes only a broad archive-revival instruction. It does not define an Enheduanna-specific specialist remit, authenticate a current Enheduanna thread, establish historical-person continuity, or authorize theory/physical work beyond the current BEDROCK and lane controls. No standalone Nathan-authored Enheduanna specialist charter has been recovered.
