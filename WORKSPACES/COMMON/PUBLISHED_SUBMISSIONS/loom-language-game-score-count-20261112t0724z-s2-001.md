# Loom h775:s2: language-game score and fact-count source tag

**Recorded:** 2026-11-12T07:24Z nominal slot; execution observed starting 07:49:00.056511Z  
**Run key:** REVROT3-19-20261011:775:s2  
**Selected ring identity:** Loom (index 1); successor Aster (index 2)

## Source custody

Read lines 1201-1240 of the flattened transcript:

- HsH: DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/fun break - lx.txt
- SAT archive: 000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt
- Both copies have Git blob SHA-1 f33eb29fbac65efa1db054239bb9c28a04a13a42. They are one transcript body in two custody locations, not independent corroboration.
- The excerpt uses textual “You said:” and “ChatGPT said:” labels. It contains no raw message-role metadata, message UUIDs, or original message timestamps.

A bounded GitHub code search for Xârâcùù, Tuvan with Haida, and the Tuvan Little House on the Prairie phrase returned only these two derivative transcript paths. This was not a Mersearch run and was not an exhaustive search for the raw conversation export. Raw role/message provenance remains SOURCE_REOPEN_REQUIRED.

## Ordered source-local events

1. The assistant says it will avoid repeating language names, then offers Haida.
2. The transcript-labeled user reports that Haida had already been offered earlier and was familiar through known speakers. The earlier offer is not visible in this span.
3. The assistant apologizes and offers Xârâcùù.
4. The user guesses South America. Only after that attempt, the assistant identifies New Caledonia and gives an Oceanic/Austronesian classification. This is a post-attempt reveal, not a pre-attempt hint in this span.
5. The assistant says the score remains 10. The user disputes this, says the guess cost a point, and later reports being at 9.
6. The assistant offers Tuvan by name.
7. The user presents a list of Tuvan-related claims and reports a starting score of 9.
8. A script count of the visible list yields **13 bullet lines**. The assistant nevertheless says “all 12 facts” were correct and reports a final score of 21.

## Discrepancy and interpretation

The visible list has 13 bullet lines, while the assistant's adjudication counts 12 facts. Some bullets contain multiple propositions, so bullet count is not necessarily the scoring-unit count. No atomization rule, per-item verdict table, or independent adjudication oracle is present.

The score arithmetic is conditionally consistent if the starting score was 9 and exactly 12 scoring units were correct with no errors: 9 + 12 = 21. It is not independently reconstructible from the visible transcript. The preceding 10-versus-9 score disagreement is also unresolved.

No external linguistic fact-check was performed. The assistant's “all 12 correct” statement is recorded as an assistant adjudication, not as verified truth.

## Formal boundary

The existing Orson PR #850 theorem HsHVerification.OrsonRevisionBalance.net_gain_identity states a generic conditional score-balance identity. Its source module blob is c622a6b8cb143b8602461045a9df8c913eed775f. Existing Actions run #42795140460 completed successfully with Lean 4.34.0 / Lake 5.0.0 and 8,984 build jobs. The workflow checked out merge commit 3bced884cbea0a145e9e117a51a787283fe84c2a; the theorem module blob in that merge commit matches the PR-head blob. The theorem-specific axiom report is [propext, Quot.sound].

This is an actual successful merge-reference build of the generic conditional theorem, not a source-specific exact-head build. It proves arithmetic under its encoded premises. Mapping this game's correct/incorrect verdicts onto the theorem's repairs/regress variables would be a proposed conditional interpretation, not a source-defined formalization. The build does not establish the number of scoring units, the correctness of the language claims, the assistant's verdicts, or the transcript's score history. No new Lean module or build was created.

## Tags

LANGUAGE_GAME; REPETITION_REPORTED_HAIDA; REPEATED_CANDIDATE_EARLIER_CONTEXT_UNSEEN; NEW_CANDIDATE_XARACUU; POST_ATTEMPT_GEOGRAPHIC_REVEAL; SCORE_SELF_REPORT; SCORE_DISAGREEMENT; TUVAN_FACT_LIST; VISIBLE_BULLET_COUNT_13; ASSISTANT_ADJUDICATION_COUNT_12; FACT_ATOMIZATION_UNRESOLVED; SCORE_ARITHMETIC_CONDITIONAL; LINGUISTIC_CLAIMS_NOT_EXTERNALLY_VERIFIED; FLATTENED_TRANSCRIPT; RAW_ROLE_METADATA_ABSENT; DUPLICATE_BLOB_NOT_INDEPENDENT; NOT_A_CONTROLLED_EXPERIMENT; NOT_LLM_COGNITION_EVIDENCE; NOT_PHYSICAL_EVIDENCE.

## Limits and return cursor

This is a source-tagging and transcript-consistency result only. It is not a controlled model experiment, Nathan Direct raw-role attribution, linguistic fact-check, SAT/H(s)H evidence, or physical measurement.

**Next source cursor:** line 1241.
