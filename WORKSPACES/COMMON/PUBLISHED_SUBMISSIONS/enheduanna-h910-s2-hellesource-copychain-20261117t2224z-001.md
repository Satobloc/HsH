# Enheduanna | h910:s2 | Annotated-source attribution and transcript copy-family audit

**Run key:** `REVROT3-19-20261011:910:s2`  
**Selection:** `h=910`; `seq=5h+2=4552`; `4552 mod 19=11` -> Enheduanna (ring index 11).  
**Next:** Tern Rook (ring index 12).  
**Participation:** `SOURCE_GROUNDED_REVIVAL / NO_AUTHENTICATED_ENHEDUANNA_THREAD`.

## 1. Authority and scope

The recovered direct user instruction in the MARLOWE raw source is broad archive-revival guidance: Enheduanna is a similar case, and workers should "always consider all archives" (2026-09-23T02:04:49.417Z). It is not a detailed specialist charter. No standalone signed Enheduanna charter or authenticated current Enheduanna thread was recovered.

The h910 work was limited to source attribution, copy-family classification, and correction of overconfident interpretation. It did not reassign the worker's standing remit or alter P0/P1/P2 ownership.

## 2. One archived text attachment identified

A separate archived conversation container preserves an Enheduanna-related text attachment as a truncated embedded excerpt. The excerpt is 21,307 characters and contains the first 43 numbered lines of the poem, ending at line 43 with the export's truncation marker.

Its cuneiform, transliteration, English rendering, and commentary strongly match the public page **The Exaltation of Inana: Annotated translation** by Sophus Helle:

https://enheduana.org/exaltation/

The page explicitly credits the translation and commentary to Sophus Helle. The archived excerpt is therefore a snapshot of a modern scholarly annotated translation, not an original ancient tablet, a newly recovered manuscript witness, or an independent translation. No full-file byte comparison was possible; the export exposes only a partial excerpt.

The full public page contains 153 numbered poem lines. The archived excerpt does not contain the complete poem and must not be cited as if it did.

## 3. Two transcript-like attachments are one content family, not two witnesses

Two other Enheduanna-related transcript excerpts are distinct attachment objects but share an exact 28,947-character common prefix after removing the shorter excerpt's truncation marker. The longer excerpt continues 15,062 characters beyond that shared prefix before its own truncation.

This establishes a strong duplicate/longer-variant relationship between the exported excerpts. It does not establish byte identity or ancestry of the complete underlying files, because both embedded exports are truncated. They should be treated as one transcript content family, not as two independent sources.

The transcript material includes assistant-generated personality analysis and a speculative daily-life/world reconstruction. Those passages are assistant reconstruction, not historical testimony and not evidence from the ancient author. Claims about clothing, diet, sanitation, temple staffing, daily schedules, climate, and personal temperament require separate archaeological, administrative, textual, or environmental sources before being treated as historical findings.

The attachment event represented in this separate conversation occurred on 2025-09-18, after the NotebookLM project date recorded below. That later event does not identify these attachments as the project's original four sources.

## 4. Source-critical correction to the earlier personality reading

The transcript's earlier personality reconstruction treats the line commonly rendered "I gave birth to it for you" as a stable autobiographical statement. Helle's full commentary on line 138 records four manuscript readings of the final verb: `du11` ("speak" or "sing"), `du3` ("create"), `du2` ("give birth"), and `du8` ("release"). Helle notes that all four can make sense and that the ambiguity may be intentional.

Accordingly, "I gave birth to it" is one editorial reading, not an uncontested fact about Enheduanna's self-conception. It should not carry the weight of a fixed psychological datum.

Line 151 is also explicitly ambiguous. Helle notes that `nugig` may refer to Inana or to Enheduanna; different translators choose differently, and the ambiguity may be deliberate. The line therefore does not securely establish a direct self-identification or a single direction of address.

The full page describes a seven-line stanza pattern in the opening section. A deterministic scan of the archived 43-line excerpt finds the `nin-ĝu10` stanza introducer at lines 6, 20, 27, and 34; line 13 is the documented exception, where a threefold repetition of `si` replaces the expected phrase. The first section closes at line 40, and Helle describes lines 41-59 as a chiasm. The page also notes echoes between the poem's opening and ending. This is a partial text-derived check of Helle's editorial structure, not a new formal proof or an H(s)H geometric equivalence.

## 5. NotebookLM four-source project remains unresolved

The HsH project-list row for **Enheduanna: A Sister's Voice Across Time** records four sources and a project date of 2025-01-22. The row does not identify the four source titles or IDs. The earlier source-manifest gate records the connected NotebookLM Index entry as locked/private and does not recover source bodies.

This run did not retrieve the four source titles, IDs, or bodies. The later 2025-09-18 attachment event is not a substitute for the original four-source manifest.

- `NOTEBOOKLM_SOURCE_TITLES = UNRECOVERED`
- `NOTEBOOKLM_SOURCE_IDS = UNRECOVERED`
- `NOTEBOOKLM_SOURCE_BODIES_READ = 0/4`

Mersearch was checked first through tool discovery and the existing bridge documentation. No callable Mersearch action or local pinned checkout was available. All four canonical bridge request lanes remained `requested`; none was overwritten, retriggered, released, or newly submitted. The Browser connector could not access its originating browser context, and no Google Drive/NotebookLM connector was available. GitHub search across HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES found no additional indexed Helle/Enheduanna source file. HSH_RESOURCES private payloads were not opened.

Direct GitHub and Library retrieval are bounded fallbacks, not a Mersearch result and not proof of exhaustive archive coverage.

## 6. Formalization, physical, and campaign boundaries

Formalization status: `BLOCKED_BY_INCOMPLETE_TEXT_DERIVATION`. The finite line-index pattern is a candidate for formalization, but this run did not recover a complete line-structure map from the full 153-line text and did not state a source-complete theorem. No Lean module or exact-head build was run. Existing Enheduanna PR #1619 and its prior exact-head Lean result formalize provenance, not this poem's stanza structure; that build is not evidence for the present pattern. No new branch or PR was created.

No physical system, measured dataset, CODATA comparison, physical calculation, fit, prediction, or independent measurement was selected or performed. No SAT-O or Blockwave equation was changed. No paper gate or theory status advanced.

Current project gates remain:
- P0 Code Grurple: ACTIVE.
- WH-05 Mersearch: BLOCKED by four occupied request lanes; Tern retains release authority.
- WH-02: highest-priority unblocked archive/navigation item; Calder/authorized maintainer retains PR #1710 action.
- P1 Orson cognition: OVERDUE / NOT READY and remains Orson-owned.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- Lane 24 Cycle 08/08: COMPLETE / BACKSEAT / HOLD.
- FIE rereview: November 24.
- Paper gates remain separate: November 9 minor overdue; November 30 major; December 14 full theory.

No new tool, fork, dependency, subscription, expense, branch, or PR was created. No private HSH_RESOURCES payload was opened.

## 7. Next source-critical step

Recover the four original NotebookLM source identities and bodies through an authorized NotebookLM/Drive or Mersearch route. In parallel, treat the Helle page as one identified modern edition and compare its manuscript notes against other independently sourced editions before using the text for personality or daily-life reconstruction. Keep ancient textual evidence, modern editorial translation, assistant reconstruction, and historical inference in separate evidence classes.
