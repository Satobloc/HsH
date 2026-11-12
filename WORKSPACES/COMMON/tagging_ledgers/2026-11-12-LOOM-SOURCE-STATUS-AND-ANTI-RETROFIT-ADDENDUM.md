# Loom Manual Source-Status Tag Addendum

**Date:** 2026-11-12  
**Scope:** Additive manual status layer for the Blockwave/SAT equation-source review and the associated prediction-provenance case.  
**Authority:** Loom historical tagging remit; READ_IT_TAG_IT standing policy; raw source exports.  
**Status:** Manual ledger only. No generated autotag file or global tag dictionary was changed.

## 1. Why this addendum exists

The archive-wide autotagger is high-recall and its labels are retrieval aids, not authorship verification or theory status. The existing AUTOTAG_SUMMARY entry for message 052d3eb1-ab00-42c7-8fb4-45121ea7d00d carries 33 message-topic tags and WINNOW:A-DIRECT-MESSAGE score 94.0. That is useful for discovery, but it does not distinguish Nathan's direct annotations from the LLM-generated draft explicitly disclaimed in the same message.

The manual layer below preserves that distinction without rewriting source text or promoting any equation.

## 2. Proposed manual status-tag vocabulary

These are open-vocabulary manual tags for this ledger. They are not yet added to the machine tagger or promoted as global canonical taxonomy.

- SRCROLE:USER-DIRECT-FRAMING
- SRCROLE:USER-PRESENTED-DRAFT
- SRCROLE:ASSISTANT-RECONSTRUCTION
- SRCROLE:TOOL-RESULT
- SRCROLE:MIXED-SOURCE
- SRCSTATUS:CANDIDATE-CORRECTION
- SRCSTATUS:NOT-ADOPTED
- SRCSTATUS:SUPERSESSION-ANNOTATION
- SRCSTATUS:LLM-DRAFT-DISCLAIMED
- FORM:THREE-FORM
- FORM:TWO-FORM
- FORM:THREE-FORM-TO-VECTOR-DUAL
- FORM:TWO-FORM-SHADOW-MAP-UNDEFINED
- MODEL:REPRESENTATION-EQUIVALENCE-HYPOTHESIS
- MODEL:RECIPROCAL-CONSTRUCTION-RETIRED
- PARAM:ARBITRARY-SCALE-SETTER
- PARAM:POST-HOC-FACTOR
- EVIDENCE:RETRODICTION-NOT-PREDICTION
- EVIDENCE:NOT-TEST-READY
- IDENT:PARAMETER
- IDENT:PREDICTIVE
- READING:UNRELATED-SOURCE
- READING:LANGUAGE-GAME
- READING:NO-HINTS
- READING:SCOREKEEPING
- READING:REPETITION-AVOIDANCE

## 3. Manual source-status ledger

| Source item | Role / authorship boundary | Manual tags | Disposition |
|---|---|---|---|
| Casual Check-in 13c1bc3e-a725-49a9-8234-2389ce5c502e, 2026-02-24 23:20:53.930Z | User-role framing says “my Lagrangian”; embedded equation-origin beyond the presentation is not independently established | SRCROLE:USER-DIRECT-FRAMING, FORM:THREE-FORM, FORM:TWO-FORM, SRCSTATUS:FORM-DEGREE-CONFLICT | Preserve verbatim; do not harmonize |
| Casual Check-in 6c795ea6-ee18-496e-81f2-52f7becad3fe, 2026-02-24 23:21:55.639Z | User-role presentation of a two-form variant | SRCROLE:USER-PRESENTED-DRAFT, FORM:TWO-FORM | Separate variant; not a verified correction |
| Casual Check-in 53700d69-3144-4b84-a648-68e8164872da, 2026-02-24 23:52:47.331Z | User presents a candidate “Updated and Corrected Edition” for assessment | SRCROLE:USER-PRESENTED-DRAFT, SRCSTATUS:CANDIDATE-CORRECTION, SRCSTATUS:NOT-ADOPTED, FORM:THREE-FORM, FORM:TWO-FORM-SHADOW-MAP-UNDEFINED, FORM:THREE-FORM-TO-VECTOR-DUAL | Keep in a separate candidate-correction lane |
| 0.239 Radians 15338421-a5e7-4538-879a-d25d840d2bdd, 2026-02-25 01:12:37.975Z | User-role presentation of a later Page One–Three draft; origin of embedded document not established | SRCROLE:USER-PRESENTED-DRAFT, FORM:THREE-FORM, FORM:TWO-FORM, SRCSTATUS:MIXED-REPEAT, EVIDENCE:NOT-TEST-READY | Later recurrence, not independent validation |
| Casual Check-in 052d3eb1-ab00-42c7-8fb4-45121ea7d00d, 2026-02-26 | User directly marks portions of a model-generated draft as errors and supplies explicit corrections/hunches | SRCROLE:MIXED-SOURCE, SRCSTATUS:LLM-DRAFT-DISCLAIMED, MODEL:REPRESENTATION-EQUIVALENCE-HYPOTHESIS, EVIDENCE:NOT-TEST-READY | The direct corrections are Nathan's; the embedded draft is not Nathan-direct |
| Casual Check-in 4ca0b548-23ab-4cd0-b9aa-a984d9fb4ff4 | Direct user disclaimer that a supplied LLM draft is not the user's work and has not been reviewed | SRCROLE:USER-DIRECT-FRAMING, SRCSTATUS:LLM-DRAFT-DISCLAIMED | Do not transfer draft wording or values into Nathan's model |
| Meridian Minkowski Ring Analysis 090f5160-1020-486d-9c42-df3d7dff2063, 2026-10-21 00:17:23.235Z | Mixed-source message; only the >> annotation is direct | SRCROLE:MIXED-SOURCE, SRCSTATUS:SUPERSESSION-ANNOTATION, MODEL:RECIPROCAL-CONSTRUCTION-RETIRED | Preserve the direct supersession annotation; do not attribute surrounding pasted text |
| 2025 SAT 2a7b69af-14b8-4177-b79b-9172394fa9ff | Assistant-role reconstruction | SRCROLE:ASSISTANT-RECONSTRUCTION | Not a Nathan-direct equation source |
| 2025 “Interesting discovery shared” search hit | Tool-role result | SRCROLE:TOOL-RESULT | Retrieval evidence only |
| 2026 “Consciousness and AI Debate” search hit | Tool-role result | SRCROLE:TOOL-RESULT | File/tool copy, not a direct user message |
| Private Library exploratory calculation reviewed for the anti-retrofit gate | Private raw conversation; assistant-generated retrodiction steps separated from user prompts | PARAM:ARBITRARY-SCALE-SETTER, PARAM:POST-HOC-FACTOR, EVIDENCE:RETRODICTION-NOT-PREDICTION | Source identifiers and content intentionally not copied into public HsH |

The three Casual Check-in raw exports have the same conversation ID, 301 messages each, and identical normalized message-node graphs. Their different Git blob SHAs are duplicate archive copies, not independent source witnesses.

## 4. Public raw-export identities

The Casual Check-in conversation ID is 699e2c5d-b530-8331-a6b2-29e4d422f425. The three verified raw-export blob identities are:

- 7c08f209c1465263dd5f214d937b8da20aec3cc7
- a61fd28df8360f777515cfac2e6bfd5d8ab76a66
- c1318fd27db058939252287e92058b71bc75a78a

The separate 0.239 Radians in Science conversation ID is 699e4a02-26e4-832a-86ea-ad1dcaf3c4e3; raw-export blob 8b6794a2be3e19b6bba32acfbbc4c6636b1b02e3.

The 2025 SAT assistant-reconstruction export blob is c0a26b8375c88c845ebd8cfe9b14516992ccc99d. It is retained as assistant reconstruction, not a source-origin claim.

## 5. Manual selectivity audit

1. Keep the existing 33 machine topic tags on 052d3eb1; they are useful for recall.
2. Do not promote WINNOW:A-DIRECT-MESSAGE into a blanket claim that every embedded span is Nathan-authored.
3. Preserve the direct correction spans, the disclaimed LLM draft, and the user's hunches as distinct statuses.
4. Keep the candidate corrected three-form edition separate from the later mixed two-form/three-form repeat.
5. Keep tool and assistant hits out of the Nathan-direct equation corpus.
6. Do not add the proposed status tags to the global autotagger until a corpus-wide frequency/selectivity audit establishes precision, recall, and redundancy.
7. Do not overwrite earlier tags or source classifications; corrections are additive and retain their history.

## 6. Unrelated source reading

Read 000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt, lines 1161–1200. This is a language-identification guessing-game exchange. Manual tags: READING:UNRELATED-SOURCE, READING:LANGUAGE-GAME, READING:NO-HINTS, READING:SCOREKEEPING, READING:REPETITION-AVOIDANCE. Actual next cursor: line 1201.

## 7. Review cadence

The latest full FIE review was recorded on 2026-11-10, with the next review due 2026-11-24. No FIE rereview was due on 2026-11-12. This addendum does not change that cadence.

## 8. Non-promotion rule

This ledger is source classification and workflow support only. It does not establish the truth of the equations, choose a canonical form degree, validate a physical model, or promote any historical SAT/Blockwave variant into current H(s)H BEDROCK.