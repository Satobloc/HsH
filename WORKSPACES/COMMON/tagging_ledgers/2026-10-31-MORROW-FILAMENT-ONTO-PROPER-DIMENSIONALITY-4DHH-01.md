# Read-It-Tag-It ledger: Morrow supplemental SAT source stratigraphy

**Date:** 2026-10-31  
**Worker identity:** Morrow, provisional Team Archivist / corpus-appraisal  
**Run key:** `REVROT3-19-20261011:485:s1`  
**Relation:** additive supplement to `2026-10-31T0512Z_WANNA_BOUNCE_GALLEY_AND_J2_J3_PROVENANCE.md`  
**Rule:** tags classify the item and its provenance; they do not promote unbylined or assistant-generated content into Nathan Direct authorship.

| Source | Exact locator / SHA | Tags | Attribution and limits |
|---|---|---|---|
| `Filament onto.txt` | SAT archive root; blob `a13c67ff2b47cf178672804d91771e01d4c4a3e1`; 103,710 chars | `UNBYLINED-FIRST-PERSON-TEXT`, `DATE-UNKNOWN`, `WORLDLINE`, `WORLDTUBE`, `TIMESHEET`, `BLACK-HOLE-SPECULATION`, `BARYON-SPECULATION`, `MODEL-VS-REALITY`, `AUTHORSHIP-UNRESOLVED` | Three archive paths share the same exact blob. First-person style does not establish author. No raw conversation/message locator. |
| `2026/SAT THEORY — Gx Halos Etc .txt` | SAT archive; blob `b8a934635ffbfae177eeef53838beb3cdb5bc91c`; 103,704 chars | `RELATED-VERSION-CANDIDATE`, `TEXT-OVERLAP`, `NOT-BYTE-IDENTICAL`, `DATE-UNKNOWN`, `AUTHORSHIP-UNRESOLVED` | Shares a 16,876-character normalized opening with FILAMENT ONTO, then diverges. |
| `BLACK HOLES AND BIG BANGS.txt` | SAT archive; blob `708c70ee1a721e81f0b9e0586e5617422407fa06`; 19,518 chars | `RELATED-VERSION-CANDIDATE`, `TEXT-OVERLAP`, `NOT-BYTE-IDENTICAL`, `BLACK-HOLE-SPECULATION`, `DATE-UNKNOWN` | HsH 30SEP26 copy is byte-identical to this archive file. It is not byte-identical to FILAMENT ONTO. |
| `LIBRARY/generated/filament-onto.md` | HsH; blob `df8a0e018bb3ae3b27e9214d8c48728476a7cc26`; 107,419 chars | `PRESENTATION-COPY`, `TIER-II-CANDIDATE`, `TRIAL-CANDIDATE`, `DATE-UNKNOWN`, `NOT-SOURCE-OF-TRUTH` | Explicitly points back to the SAT archive as source of truth. |
| `2026 discussions/SAT THEORY — PROPER DIMENSIONALITY.txt` | SAT archive; blob `1ea1f8d506210202517aaeb0489c5950357fa39f`; 199,907 chars; lines 1176-1178 | `TRANSCRIPT-SEGMENT`, `USER-MESSAGE-LIKE`, `RAW-NODE-NOT-RECOVERED`, `4D-FLATTENING`, `WORLDTUBE`, `WORLDLINE`, `TIMESHEET`, `INTERSECTION-MANIFOLD`, `FORMALIZATION-BLOCKED-DEFINITION` | First-person user-message-like segment; date label lacks year and platform/raw conversation ID not recovered. Do not quote as raw-authenticated Nathan Direct. |
| HsH `PROPER DIMENSIONALITY.txt` copies | Blob `1d8cd1574a6acdc0f86691599191b74428a2c086`; 97,229 chars; two HsH paths | `EXACT-DUPLICATE-PATHS`, `SHORTER-TRANSCRIPT-VERSION`, `NOT-IDENTICAL-TO-ARCHIVE-VERSION`, `PROVENANCE-HISTORY` | The two HsH paths are byte-identical to each other, not to the longer archive file. |
| Assistant expansion within PROPER DIMENSIONALITY | Archive blob `1ea1f8d506210202517aaeb0489c5950357fa39f`; begins line 1179 | `ASSISTANT-GENERATED-EXPANSION`, `BV-AKSZ`, `UNIVERSAL-SHELL`, `NOT-NATHAN-DIRECT`, `NO-ADOPTION-EVIDENCE` | The expansion follows the user-message-like passage and adds formalism not adopted in the preceding text. |
| `4DHH LAGRANGIAN (nolat).pdf` extraction | SAT archive extraction blob `24d202bdbc79f3c0d83cfd8a9db584479eed5444`; source PDF SHA-256 `8443a85e8a4117422565745b848bd32764f0059e8fbedb9b73107b34e02a3923`; 21 pages | `PDF-EXTRACTION`, `PYMUPDF`, `NO-OCR`, `ASSISTANT-VOICE`, `ASSISTANT-FORMALIZATION-CANDIDATE`, `RAW-NODE-NOT-RECOVERED` | Extracted lines 27-31 use assistant/collaborator voice. No user-authored equation message or raw conversation ID recovered. |
| `SAT.4DHH.UC.pdf` extraction | SAT archive extraction blob `c3c63e983663a1648aa78ce9f591c28e7997f055`; source PDF SHA-256 `9b28c5776516af59dd661485ac519983c9b77b56c435a4ec15436d24f8bf028f`; 150 pages | `PDF-EXTRACTION`, `PYMUPDF`, `NO-OCR`, `MIXED-ORIGIN`, `LLM-DROP`, `PROMPT-LIKE`, `AUTHORSHIP-UNRESOLVED` | Prompt-like segment at extracted lines 22-26; full compilation has no single verified author. |
| Jacoby, `Astronomer Talks` | HSH_RESOURCES `HISTORICAL/JACOBY—ASTRONOMER TALKS.txt`; blob `a7f48e0a01dc7c647d6c18f5418d90d71242b8e3`; lines 541-580 | `UNRELATED-READING`, `HISTORICAL-ASTRONOMY`, `SPECTROSCOPY`, `LIGHT-WAVE-EXPLANATION` | Deliberate out-of-field reading; next cursor line 581. |

Tags are additive. No prior tag was removed or downgraded.


## Amendment 01 — 2026-11-11 | upload-event and raw-message completion

Tags are additive; no earlier classification is removed or downgraded.

| Source | Exact locator | Added tags | Attribution and limits |
|---|---|---|---|
| Morrow September 9 geometry/scale message | Conversation 6a9ee7ca-d340-83ea-b99d-6a3097429f36; raw blob ee394b446b2e36d35fd1e5ecd004685c0422457b; user node fed478ad-8022-46b1-a972-ac74bf7d37b2 | FULL-READ, NATHAN-DIRECT, GEOMETRY, 4DHH-HSH-CONTINUITY, SCALE-SIMILARITY-CLAIM, PROVISIONAL-CLAIMS | Direct source contains conceptual continuity and cross-scale claims, but no explicit parameter/action map. |
| Morrow follow-up: same-picture/Lagrangian genealogy | Same raw blob; user node 87cf1b1c-5ed7-4082-a0fe-6ed5c79dce3b | FULL-READ, NATHAN-DIRECT, HISTORICAL-GENEALOGY, LATTICE-OPTIONAL | “Same picture” is conceptual genealogy, not proof of identical action functionals. |
| Morrow follow-up: RMS/SAT distinction | Same raw blob; user node fa3afa98-8d69-4bf1-878a-4d148d4473d2 | FULL-READ, NATHAN-DIRECT, RMS-SAT-DISTINCTION | Explicitly keeps RMS and SAT as distinct theories with a methodological/epistemic relation. |
| Assistant translation | Same raw blob; assistant nodes 59c3a93e-0245-54e0-ba38-5a6c238e7dc3 and 13a42500-2f8a-599e-9362-f072c697ded7 | FULL-READ, ASSISTANT-RECONSTRUCTION, NOT-NATHAN-DIRECT | The first adds a line-to-finite-core lift; its “no new objects” sentence strengthens a provisional search report. The second's SAT/ACTIVE and a_e candidate labels are historical assistant status, superseded for current use by KERR_CORE_BASELINE's PROVISIONALLY_QUARANTINED state. |
| SAT.4DHH.UC.pdf upload event | Geometry in Physics conversation 6a25a665-3a10-83ea-a7c0-cebebfdcf1d9; raw blob 2e0c8477873583b92f20a0a3f2af6528643b4a8a; user node f1598e06-6b6f-4b31-bc70-104690c65f22, 2026-06-10T09:33:03.404Z; attachment file_00000000459071f58137e5aae16ea726 | UPLOAD-EVENT-RECOVERED, USER-UPLOADED-ATTACHMENT, MIXED-ORIGIN | The message says “Ok. Next” and carries ten PDFs. It proves upload, not authorship or generation. The later file-search node f1f5fb48-ae25-4ccb-99fe-d60c439a6a3a exposes the “LLM DROP” first page; the generating conversation remains unknown. |
| 4DHH LAGRANGIAN (nolat).pdf | Existing extraction blob 24d202bdbc79f3c0d83cfd8a9db584479eed5444; PDF SHA-256 8443a85e8a4117422565745b848bd32764f0059e8fbedb9b73107b34e02a3923 | RAW-GENERATION-NODE-STILL-MISSING, PRIOR-AUDIT-REUSED | This is the separate 21-page PDF already classified in the October 31 Morrow addendum; no new raw upload/generation node recovered. |

The upload-event tag for SAT.4DHH.UC.pdf does not supersede MIXED-ORIGIN, LLM-DROP, PROMPT-LIKE, or AUTHORSHIP-UNRESOLVED. The 21-page 4DHH LAGRANGIAN (nolat).pdf remains a separate object and retains RAW-NODE-NOT-RECOVERED.
