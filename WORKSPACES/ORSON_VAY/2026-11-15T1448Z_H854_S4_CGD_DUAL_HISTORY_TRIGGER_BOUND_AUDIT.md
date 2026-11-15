# Orson Vay h854:s4 | CGD dual-history source audit and trigger bounds

**Status:** source-grounded revival in the present execution. No authenticated current Orson ChatGPT thread was established. Research and repository evidence are distinguished from historical-instance identity.

## 1. Selection, authority and continuity

The nominal-slot calculation is h=854, seq=4274, index 18. The selected ring identity is Orson Vay; the next identity is Sable at h855:s0.

The current user instructions are the operative authority for this Review-MIND work. The recovered Orson role charter is an assistant-maintained synthesis, not a standalone signed Nathan-authored charter. The original October 9 role-reset statement remains unrecovered. The October 30 candidate conversation titled “Workshop Relay | Orson Vay → Sable” still lacks a verified UUID and current usability. Personal-context search did not recover a newer authenticated Orson thread. No impersonation or cross-thread delivery is claimed.

The current Orson INBOX was read. Its latest relevant packet is Ariadne h851:s4. No matching Ravel h854:s3 predecessor packet addressed to Orson h854:s4 was present at the start of this work. This run therefore proceeded from the current user prompt and live repository sources.

The preceding five substantive Orson activations were all within cognition, epistemology or P1 source/method research. This activation continues that protected specialty rather than diverting it.

## 2. Executive findings

1. The existing Orson P1 formalization already models the distinct checker and repair projections and the missing trigger-pair index. This run did not duplicate those theorems.
2. A replay of the 17 source-pinned result files adds a finite-corpus partial-identification bound: among 6,702 flagged later positions, 0 to 2,589 could have been triggered by a previously revised prior item; 0 to 938 could have been triggered by a prior item whose extracted answer label changed. The actual trigger index is not archived.
3. The known substring-parser hazard was added to the existing PR #850 formalization as explicit executable examples and Lean theorems.
4. The existing PR branch now has a successful merge-reference Lean build containing the additive theorems and count arithmetic. Exact-head standalone verification remains unverified.
5. The P1 paper remains OVERDUE / NOT READY. No paper gate, model trial, human session, API spend or manuscript edit occurred.
6. One publisher intake was rejected because this run supplied two extra JSON keys. The content digest was correct, but no canonical PUBLISHED_SUBMISSIONS artifact was created. No retry or duplicate issue was made.

## 3. Exact source provenance

**Implementation repository:** aayambansal/ConsistencyBench

- Source commit: bfc676baa848c7f1715bb73aee148180de15516e
- Source file: src/evaluate.py
- Source file Git blob: 0453540cb7c19227601e59fb342fa93e736da849
- Paper source: final-paper/main.tex
- Paper Git blob: dbd471235a310aa9821c95faf570432c21339592

**HsH evidence:**

- Existing 17-file source manifest: FORMAL_VERIFICATION/HsHVerification/OrsonCGDManifestBounds.lean
- Manifest blob on the existing P1 branch: f19805cc34526ce6643360efe8b391ddb646506c
- Existing formalization extended: FORMAL_VERIFICATION/HsHVerification/OrsonCGDProjectionGate.lean
- Updated module blob: 58ab88546724c260b8351eef139fadfc68cb384b
- Existing PR: #850, OPEN / DRAFT / UNMERGED
- PR branch: research/orson-p1-shared-nli-bound-20261028t06z
- Current PR branch head: 0c4264c0d4cc2e92a28ddd0f8badd858f866193c
- Main head at the start of durable report creation: 262dce0e677601f505542450d37f9ee61a811ad6

No new branch or PR was created. The existing branch is stacked on an older base and substantially behind current main. No rebase, merge or force-push was attempted.

## 4. Paper-to-code history mapping

The paper algorithm in final-paper/main.tex, lines 122-134, describes a history of question-answer pairs. It checks the current answer against prior answers, replaces the current answer if repair is triggered, and then appends the resulting answer to history.

The implementation in src/evaluate.py distinguishes three values for each prior item:

- prior question;
- prior final extracted answer;
- prior original raw response.

At lines 258-264, the NLI loop compares the prior raw response with the current first-pass raw response, each truncated to 500 characters. At lines 269-277, the repair prompt receives the prior question, prior final extracted answer, shared premise and current question. It does not receive the current first-pass raw response. At line 279, the triple is appended to history.

This yields two distinct projections:

| Stage | Information actually supplied |
|---|---|
| Checker | Prior original raw response + current original raw response |
| Repair | Prior question + prior final extracted answer + shared premise + current question |

If a prior answer was revised, a later checker still sees that prior item's original raw response, while the repair prompt sees its final extracted answer.

The paper pseudocode does not spell out this raw-versus-final distinction. This is a source-to-paper representation gap requiring author clarification, not proof of an erroneous result.

The repair operation is a fresh answer call conditioned on prior context, rather than a textual edit of the current first-pass response, because that response is not supplied to the repair prompt. This operational reading is consistent with the pseudocode's re-answer function, but should be stated explicitly in any reproducibility account.

## 5. Archived 17-file replay and trigger bounds

The 17 immutable result blobs listed in OrsonCGDManifestBounds.lean were fetched by exact Git blob ID and parsed at the pinned ConsistencyBench commit. The replay covered 300 question sets per file, 1,150 question records per file, 5,100 sets and 19,550 records overall. There were 14,450 eligible later-position records and 6,702 archived contradiction flags.

The per-file replay was repeated in a second pass. The per-file counts below are flagged current rows having at least one earlier item in the specified state. They are not counts of actual NLI trigger pairs.

| Target-model result file | Flagged rows | Any prior revision response | Any prior extracted-label change |
|---|---:|---:|---:|
| claude-3.5-sonnet | 366 | 134 | 24 |
| claude-opus-4.6 | 414 | 182 | 36 |
| claude-sonnet-4.5 | 476 | 211 | 110 |
| claude-sonnet-4.6 | 391 | 172 | 82 |
| deepseek-v3.2 | 384 | 145 | 78 |
| gemini-2.0-flash | 480 | 223 | 138 |
| gemini-2.5-flash | 421 | 165 | 78 |
| gemini-2.5-pro | 409 | 152 | 47 |
| gpt-4.1 | 375 | 126 | 25 |
| gpt-4o | 385 | 138 | 54 |
| gpt-5-mini | 337 | 127 | 60 |
| gpt-5.2 | 334 | 118 | 23 |
| gpt-5 | 321 | 107 | 34 |
| llama-3.1-70b | 465 | 181 | 59 |
| llama-3.3-70b | 365 | 112 | 19 |
| o3 | 426 | 174 | 56 |
| qwen-2.5-72b | 353 | 122 | 15 |
| **Total** | **6,702** | **2,589** | **938** |

Complements:

- 4,113 flagged rows have no earlier item with a revision response.
- 5,764 flagged rows have no earlier item whose extracted answer differs from its initial extracted answer.
- No flagged row has all earlier items revised or all earlier extracted labels changed. The first item in each set has no earlier history and cannot itself be revised.

The actual first-positive trigger index is absent from the archive. Therefore:

- The number of flagged rows whose actual trigger may have involved a previously revised prior item is bounded by 0 to 2,589, or 0 to 38.6% of flagged rows.
- The number whose actual trigger may have involved a prior item with a changed extracted label is bounded by 0 to 938, or 0 to 14.0%.

The lower bounds are zero because the first prior candidate is always unrevised and may have been the first positive. The upper bounds are the rows with at least one eligible prior item in the relevant state.

These are partial-identification bounds, not estimates of actual trigger frequency, API-call counts, judge errors or false-positive frequency. The 17 target-model files share one configured GPT-4o-mini checker route; they are not 17 independent judge channels. The code path is within-model history checking, not cross-model peer deliberation.

## 6. Parser hazard formalized

The NLI prompt at evaluate.py line 315 requests only the exact word CONTRADICTORY or CONSISTENT. The parser at line 324 tests whether the uppercase response contains the substring CONTRADICTORY.

Consequently, after uppercase normalization:

- NOT CONTRADICTORY maps to true.
- An uncertainty sentence containing the word CONTRADICTORY maps to true.
- CONSISTENT maps to false.
- The error sentinel [ERROR] also maps to false.

The first two are deterministic parser test cases, not observed judge outputs. The archive contains no raw NLI response from which to establish that such a response actually occurred.

The existing OrsonCGDProjectionGate module already formalizes the checker/repair projection distinction, the trigger-pair non-identifiability and the error-sentinel Boolean collapse. This run added:

- negated_phrase_is_flagged;
- uncertain_phrase_is_flagged;
- exact_consistent_token_is_not_flagged;
- per-file arrays for flagged rows, rows with any prior revision and rows with any prior label change;
- arithmetic theorems for the 17-file total and the two candidate-row bounds.

## 7. Lean execution and limits

The first additive commit, 1d2b50e8e5686edd188e8e46120b20ca306fe7fa, produced a failed merge-reference run because the new section was placed outside the namespace containing sourceNliParserUpper. The error was caught. No failed proof was represented as successful.

The corrected commit is 0c4264c0d4cc2e92a28ddd0f8badd858f866193c. The subsequent Actions run #43726963604 completed SUCCESS on merge-reference commit d1fd8e6a9e34444bad821312fd8bc8b389613419, combining PR head 0c4264c0d4cc2e92a28ddd0f8badd858f866193c with PR base 598a45b3feb9378eb8f14ff069ec9080137113c2.

Verified run properties:

- Lean 4.34.0 and Lake 5.0.0.
- Full root build completed, 8,986 jobs.
- Target OrsonCGDProjectionGate module compiled.
- Executed evaluations returned true, true, false, 17, 6702, 2589, 938, 4113 and 5764.
- The new parser theorems reported standard dependencies propext, Classical.choice and Quot.sound. The count theorems reported propext.
- No sorryAx or admit was reported in the corrected run.

Tests, lint, nanoda, leanchecker and global axiom audit were skipped. This was a successful merge-reference build, not an exact-head standalone build. Lean verifies only the encoded propositions and transcribed arithmetic. It does not verify the Python-to-Lean translation, JSON parsing, source-to-table transcription, NLI semantic validity, or actual trigger index.

The task graph still points to an older PR #850 head and older run. Tern retains task-graph authority; no graph edit was made.

## 8. Disconfirmatory design, not executed

A future authorized validation should preserve, per question position:

1. Full raw first-pass response and normalized answer.
2. Prior final answer and revision response.
3. Exact ordered first-positive trigger index.
4. Full NLI request and raw response.
5. Resolved evaluator model/provider/version and request ID.
6. Retry, timeout, malformed-output and error state.
7. Exact repair prompt and output.

A frozen pair bank could compare raw-history and final-answer-history conditions. A separate condition could supply the current first-pass answer to a direct-edit repair prompt, contrasting with the current re-answer behavior. The parser should use a strict structured verdict enum distinguishing contradiction, consistency, abstention, malformed output and call failure. Blinded human adjudication with the actual questions and shared premise would be needed for criterion validity.

No model trial, human session, API spend, randomized intervention or new dataset was conducted. No paper manuscript or protocol was edited.

## 9. P1 and other-lane controls

P1 issue #564 remains OPEN / OVERDUE / NOT READY. The November 9 minor-paper gate remains missed. The November 30 major-paper and December 14 full-theory gates remain separate. No source TeX/PDF was recovered from the current Library search, and no canonical byte-identical manuscript source was edited. No independent review or reader-ready paper is claimed.

The original OV-49–OV-53 source bank remains unrecovered. All four Mersearch lanes remain occupied. No callable Mersearch action was exposed in this runtime; public pinned GitHub source and the existing manifest were used as the bounded fallback. No new request or overwrite was made.

Other lanes remain unchanged:

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 cognition, Orson-owned | OVERDUE / NOT READY |
| P2 measured geometry | HOLD |
| P3 full theory | INCOMPLETE |

The HPD ³He-B circular-membrane interpretation remains a conjecture beyond the measured NMR signals. Knister pressure-UQ methods remain methodological prior art, not a validated uncertainty map for its particular dataset. No new physical calculation or theory promotion occurred.

FIE last review remains November 10; next review November 24. The task graph remains Tern-owned, with 18 records and 16 declared branches. WH-01 through WH-09 remain escalated P1/HIGH; WH-05 remains blocked and WH-02 remains Calder-owned. No task graph change was made.

Unrelated reading advanced through Okakura Kakuzō, The Book of Tea, Project Gutenberg eBook 769, lines 1651-1690. Next cursor: 1691. The older Babbage cursor conflict remains unresolved; no Babbage segment was advanced.

No HSH_RESOURCES private payload was accessed. No SAT-O or Blockwave original equation was modified. No new tooling, fork, subscription or expenditure was introduced.

## 10. Publisher attempt and disposition

One unique publisher intake issue, [#1794](https://github.com/Satobloc/HsH/issues/1794), was opened for the public-safe methods note. The content SHA-256 was 2eb85f39641ed052b96ee8a1308af7232fa2daf244c14fe3f4d28b676df6148f.

The publisher rejected the intake with “unexpected payload keys.” This run supplied artifact_filename and artifact_sha256, but the live issue_publish.py script and the intake instructions require exactly four keys: schema, submission_id, content and sha256. The error was this run's payload-construction mistake; the publisher instructions were consistent.

The issue remains open with rejection comment #6896503963. Its body remains publicly visible, but the expected PUBLISHED_SUBMISSIONS artifact path was checked and does not exist. No manual write, retry, second issue or duplicate submission was made. The methods note is therefore NOT PUBLISHED_VERIFIED.

## 11. Durable state and successor

This report is the detailed h854:s4 source and data record. The canonical receipt records the same evidence, Lean result, publisher rejection and limits. Orson BOOT and CURRENT_WORK point to this checkpoint. The frozen P1 protocol document was not changed.

Next ring identity: Sable, h855:s0. Any repository packet is optional context only, not a blind independent-review request. Sable has prior P1 exposure; no independent review is claimed. Tern retains task-graph and publisher authority.

The existing relay configuration remains enabled and unchanged. No sixth task, reassignment, cadence change, signet or conversation rename. Research and repository work are verified; no terminal completion acknowledgment is claimed.
