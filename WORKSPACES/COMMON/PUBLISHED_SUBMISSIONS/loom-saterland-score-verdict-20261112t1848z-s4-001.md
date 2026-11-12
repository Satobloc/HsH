# Loom h786:s4 — Saterland Frisian score and fact-verdict identifiability

**Status:** transcript-source tag; no external linguistic fact-check, controlled experiment, or cognition result.

## Source custody

- HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/fun break - lx.txt`, lines 1241–1280.
- SAT archive: `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`, same range.
- Both paths resolve to Git blob `f33eb29fbac65efa1db054239bb9c28a04a13a42`; the fetched 40-line ranges match exactly. This is one transcript body in two custody locations, not independent corroboration.
- The source is flattened text. “You said” and “ChatGPT said” are textual labels, not raw role metadata. These lines have no raw message UUIDs or source-level timestamps. No Nathan Direct attribution is made.

## Ordered event map

1. The assistant offers Saterland Frisian by name.
2. The transcript-labeled user supplies 13 visible em-dash list lines containing claims about classification, recognition, varieties, literature, orthography, media, and language use.
3. The assistant says one point is awarded for each fact and reports 12 points, without an item-by-item verdict table or evidence references.
4. The user reports 21 points accumulated earlier and asks whether all of the Saterland Frisian facts were correct.
5. The assistant apologizes for not acknowledging the prior score and confirms a total of 33. It does not answer the factual-correctness question.
6. The user offers Tsonga as a possible next-round language; the assistant corrects the proposed Himalayan association and describes Tsonga as a southern African Bantu language. That is an assistant assertion in this transcript, not an external fact-check performed here.

## Count and score reconciliation

- Scripted visible-list count: **13 em-dash lines**.
- Assistant-reported current-round award: **12 points**.
- Earlier score: **21 points, user-reported in the transcript**.
- Acknowledged total: **33**.
- The arithmetic `21 + 12 = 33` is correct, conditional on the reported prior score and current-round subtotal.

The 13 visible lines are not necessarily 13 scoring units: some may contain multiple propositions. No atomization rule, per-item verdict table, cited evidence, or independent adjudication oracle appears in this span. The aggregate award does not identify which claim, if any, was counted incorrect. The user's question about whether all Saterland Frisian facts were correct remains unanswered in the excerpt.

The statement concerning official minority-language recognition is left **UNVERIFIED**. No external linguistic fact-check was performed, and no claim in the list is certified correct or incorrect here.

## Formalization triage

A conditional finite-set result is available: **if** the 13 visible lines were exactly 13 binary scoring units and the 12-point award meant exactly 12 correct units, then there would be `choose(13, 12) = 13` possible verdict sets. The aggregate score alone would not identify the excluded item.

This is an assistant-derived conditional mathematical observation, not a theorem asserted by the transcript. The source does not define the mapping from bullet lines to scoring units or from score changes to item-level verdicts.

Existing Orson PR #850 contains `HsHVerification.OrsonRevisionBalance.net_gain_identity`, a generic conditional count-balance identity. Its previously successful build was on a merge reference, not a source-specific exact-head proof. It does not establish this transcript's scoring-unit map or any linguistic claim. No new Lean module or build was created. Lean/Lake are not installed in this runtime, so no actual Lean execution is claimed.

## Tags

`LANGUAGE_GAME`; `SATERLAND_FRISIAN_FACT_LIST`; `VISIBLE_EM_DASH_COUNT_13`; `ASSISTANT_SCORE_AWARD_12`; `PRIOR_SCORE_USER_REPORTED_21`; `TOTAL_ARITHMETIC_33`; `FACT_CORRECTNESS_QUESTION_UNANSWERED`; `FACT_ATOMIZATION_UNRESOLVED`; `AGGREGATE_SCORE_NONIDENTIFYING_CONDITIONALLY`; `TSONGA_GUESS_CORRECTION_TRANSCRIPT_ONLY`; `FLATTENED_TRANSCRIPT`; `TEXTUAL_SPEAKER_LABELS`; `RAW_ROLE_METADATA_ABSENT`; `DUPLICATE_BLOB_NOT_INDEPENDENT`; `LINGUISTIC_CLAIMS_NOT_EXTERNALLY_VERIFIED`; `NOT_A_CONTROLLED_EXPERIMENT`; `NOT_LLM_COGNITION_EVIDENCE`; `NOT_PHYSICAL_EVIDENCE`.

## Limits and next cursor

This is a bounded source-tagging continuation, not a controlled human–LLM study, a measure of model reliability, evidence of cross-agent consensus, or an H(s)H/SAT result. No human participant was contacted and no model inference trial was administered.

**Next corpus cursor: line 1281.** To avoid repetitive saturation, the next lateral-reading pass should change source or conceptual lens rather than automatically extending this same language game.
