# Ariadne h851:s4 | CGD source-to-model fidelity and parser-observability audit

**Disposition:** SOURCE-LEVEL QC COMPLETE. NEW PARSER HAZARD AND RESULT-PROVENANCE GAPS IDENTIFIED. TERN'S h735 SOURCE-TO-MODEL CAUTION CONFIRMED AND SHARPENED. CURRENT PR #850 BUILD IS MERGE-REFERENCE / CACHE-REPLAY EVIDENCE, NOT EXACT-HEAD STANDALONE VERIFICATION. ORSON'S FROZEN P1 SCOPE AND OWNERSHIP PRESERVED.

## 1. Selection, identity, and source authority

- Nominal slot: 2026-11-15 11:48:00Z.
- (h=851), (seq=5(851)+4=4259), (4259\bmod19=3).
- Selected ring label: **Ariadne**, index 3.
- Next ring label: **Alberr**, index 4, next nominal appearance h852:s0.
- Run key: `REVROT3-19-20261011:851:s4`.

The ring label is routing, not an authenticated ChatGPT identity. The current :48 run is `b283e955-a108-832f-9c1e-66558c280b00`, scheduled 11:48Z, recorded start 11:53:02.588963Z, IN_PROGRESS, completion null, run-level `chat_ref=null`.

The task-level cached `latest_result` is Tern h849:s4, run `44f83e57-6d94-832b-ace8-e2ae1247d00d`, scheduled 09:48Z and completed 10:55:35.469384Z. It is not the current Ariadne run. Task-level `last_run_time` remains 10:55:37.516363Z and `next_run_time` still points at the already-fired 06:48 local occurrence. Preserve the detailed run and cached result as distinct records; no cause is inferred.

The original Library export `ARIADNE — raw.json` was re-read, not merely inferred from the workspace summary:
- Conversation title: ARIADNE.
- Historical conversation ID: `6ab339d2-8fb4-83ea-b728-c8001a034371`.
- Raw SHA-256: `2996046ea29672f69fbf48670c0b27049701039741229c158d4e89f5453b22a8`.
- 6,226,127 bytes; 1,364 mapping nodes; 1,363 message-bearing nodes; 10 user-role messages.
- All ten user-role nodes have `author.name=null`; use **user-role / Nathan-attributed**, not independent author-name authentication.

The direct September 23 instructions authorize broad archive examination/reproduction under current controls, constructive suggestions to Tern and other workers, and diagnosis before classifying apparent failures. They explicitly leave scheduler/task authority with Tern. No standalone signed Ariadne specialist charter was found; the role description is assistant-maintained synthesis.

Existing-thread-first was honored. The September 23 ARIADNE export is a historical identity pointer, not proof of current usability. A newer November 9 “Hi Ariadne” conversation candidate remains title/ID/URL unknown and live usability unverified. The current automation run has no chat reference. This is source-grounded current-assistant work, not historical-instance participation or cross-thread delivery.

## 2. Scope and protected P1 boundary

The controlling P1 source remains Orson's frozen methods/archival protocol:
[ P1 Protocol Freeze, 2026-11-02 ](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/P1_PROTOCOL_FREEZE_2026-11-02_METHODS_ARCHIVAL_SCOPE.md).

P1 issue [#564](https://github.com/Satobloc/HsH/issues/564) remains OPEN / OVERDUE / NOT READY. The November 9 minor-paper gate is not met. November 30 P2 and December 14 P3 remain separate gates. Orson retains sole P1 ownership and the protected approximately four-of-five substantive cognition allocation.

This audit used the public, pinned ConsistencyBench source only. No HSH_RESOURCES research payload, raw result archive, OV-49–OV-53 bank, private model outputs, or human-subject material was accessed. No model trial, human session, API spend, manuscript edit, paper-gate advancement, or scope expansion occurred.

## 3. Pinned source and execution path

Primary source:
- Repository: [aayambansal/ConsistencyBench](https://github.com/aayambansal/ConsistencyBench)
- Commit: `bfc676baa848c7f1715bb73aee148180de15516e`
- File: [src/evaluate.py](https://github.com/aayambansal/ConsistencyBench/blob/bfc676baa848c7f1715bb73aee148180de15516e/src/evaluate.py)
- File blob: `0453540cb7c19227601e59fb342fa93e736da849`

Source regions inspected: `call_model` lines 137–170; `NLIContradictionChecker` lines 238–293; `evaluate_cgd` lines 299–328; `run_evaluation` lines 440–520; `run_full_evaluation` lines 540–590.

The code confirms the existing P1 scope correction: CGD is **within-target-model self-exposure and self-revision**, not cross-model peer debate. `prior_qa_pairs` is local to one `evaluate_cgd(model_id, question_set, ...)` call. The current response is compared with that same target model's earlier responses. A flagged contradiction may cause another call to the same target model. No target model's answer is passed to a different target model as a peer message in this path.

The NLI checker receives only the two raw response strings, each truncated to 500 characters. The checker prompt contains neither the corresponding question nor the premise, even though its instruction describes contradiction “given the same premises.” The repair prompt is different: it receives the previous question, previous final extracted answer, premise relationship, and current question; it does not receive the current first-pass raw response. History appends `(question, final_answer, raw_response)`, so after a revision the repair-facing answer changes while the future checker-facing raw answer remains the original response.

## 4. New finding A: substring parsing can accept a negated verdict

The pinned source parser is:

```python
"CONTRADICTORY" in response.upper() if response else False
```

I executed this exact string-level predicate locally against fixed strings. This was a deterministic code-semantics check, **not** a model call, archived output, or estimate of observed frequency.

| Response string | Source parser result |
|---|---:|
| `CONTRADICTORY` | True |
| `CONSISTENT` | False |
| `[ERROR]` | False |
| `NOT CONTRADICTORY` | **True** |
| `No, the responses are not contradictory.` | **True** |
| `I cannot determine whether they are contradictory.` | **True** |

The prompt asks the model to return one of two words, but the source does not enforce exact equality or a structured schema. Any nonempty response containing the substring `CONTRADICTORY` is treated as positive, including negated or uncertain prose. This is a **potential parser false-positive path**, not evidence that any archived run actually emitted such a response.

The current Boolean also collapses distinct control-flow states:
- **NOT_EVALUATED:** the first question has no prior pair, so the loop is not entered and the default remains false.
- **EVALUATED_NO_POSITIVE:** prior pairs were checked but none returned a positive substring.
- **CALL_ERROR:** `call_model` exhausted its retry and returned `[ERROR]`, which the parser maps to false.
- **EMPTY_OR_MALFORMED:** an empty or nonmatching response also maps to false.
- **CONTRADICTION_FOUND:** any response containing the substring sets true and short-circuits the first-match loop.

Thus `contradiction_detected=false` does not mean “the checker successfully judged the pair consistent.” It can mean no check occurred, a successful nonpositive response, an error, or malformed output. The archive retains the Boolean but not the call status, exact judge output, attempted-call count, or trigger index.

**Owner-controlled future correction, not implemented:** use an explicit verdict/status type such as `NOT_EVALUATED | CONSISTENT | CONTRADICTORY | CALL_ERROR | MALFORMED`; accept only an exact normalized verdict or use a structured constrained output; preserve call status separately from semantic verdict. The exact Lean proposition suggested by the current function is `sourceNliParserUpper "NOT CONTRADICTORY" = true`. It is **not added or compiled here**; Orson retains ownership of the P1 module.

## 5. New finding B: evaluator route and result-source provenance are under-recorded

The checker ignores its `model_id` argument and hardcodes the route string `openrouter/openai/gpt-4o-mini`, with temperature 0 and a 10-token limit. `call_model` returns only `response.choices[0].message.content`; response ID, returned model/provider metadata, usage, and other response metadata are discarded.

The result JSON records the target model, target model ID, strategy, set count, metrics, and result rows. It does not record the NLI judge route/version, resolved provider/model, request ID, source commit, evaluator prompt hash, or per-call error/retry status. The strongest supported description is therefore **a common configured checker route/method in this audited source revision**, not a proven identical deployed judge snapshot, shared mutable judge instance, or measured correlated-error process.

A further source-lineage gap appears in `run_full_evaluation`: when an output file already exists, the runner loads it and skips evaluation. It then builds the summary from both loaded and newly generated outputs. The result file does not carry its producing source commit or evaluator configuration. Consequently, the current source pin does not attest that every archived result file was generated by this exact source revision. This is a **provenance gap**, not evidence that the archive actually mixes versions; raw outputs were not accessed.

The checker object is created once per target-model/strategy `run_evaluation` and reused across that run's question sets. It has no conversational memory/state in this source. That is not a single global persistent judge shared across all target models. Common route/configuration, exact runtime identity, persistent state, and correlated errors are four different claims.

## 6. Tern h735 amendment and Lean source-to-model review

Tern's existing source-to-model fidelity amendment is directionally correct:
- [Amendment 01](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/TERN/2026-11-10T1548Z_REVIEW_MIND_ORSON_P1_QC_AND_GRAPH_RECONCILIATION_AMENDMENT_01.md)
- [Amendment 02](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/TERN/2026-11-10T1548Z_REVIEW_MIND_ORSON_P1_QC_AND_GRAPH_RECONCILIATION_AMENDMENT_02.md)

The existing `FullTrace` structure contains an unconstrained `triggerPair`, `judgePrompt`, and `judgeOutput`; the theorem `archived_projection_does_not_identify_trigger_pair` exhibits two arbitrary values with the same `LoggedResult`. This proves non-injectivity of the projection on the **unrestricted formal product type**. It does not yet prove non-identifiability among source-admissible Python traces, because the formalization has no admissibility predicate encoding the actual chronological first-match loop, checker input construction, parser semantics, call status, retry behavior, or repair/history transition.

The theorem name can still be read more strongly than its current premises warrant. Safe disposition: retain the result as an **abstract projection non-injectivity lemma**, or add a source-admissible trace relation before making a source-specific trigger-pair claim. A source-faithful trace would need, at minimum, the selected prior index, ordered prior candidates, exact truncated checker inputs, parsed verdict and call status for each attempted candidate, first-positive condition, repair context, and the archive projection. A source-admissible pair of distinct traces with the same archived record would then be required to prove empirical/source-specific non-identifiability. No synthetic witness is substituted for actual archived data.

### Current PR #850 verification

- PR: [#850](https://github.com/Satobloc/HsH/pull/850), OPEN / DRAFT / UNMERGED.
- Current PR head: `59faf725dc2484c5b4fc990df5746bb0c2ecae1e`.
- PR base: `598a45b3...`.
- Current HsH main at pre-write read: `1708246625aa46bade27be9611c9cda0086b0153`.
- Main-to-PR comparison: 199 commits ahead / 18,717 behind.
- `OrsonCGDProjectionGate.lean` blob: `b60d3ad7d50ede1c5c58f5a15c178ba8e1a281e8`, identical in the PR branch and the run's merge tree.

Actions run [#43708035823](https://github.com/Satobloc/HsH/actions/runs/43708035823) completed SUCCESS with 8,986 build jobs, Lean 4.34.0 and Lake 5.0.0. The log checked out synthetic merge commit `048c67447376de7827b973203f012d32341816ef` (“Merge 59faf725… into 598a45…”). `OrsonCGDProjectionGate` was **replayed from Lake cache**, not freshly compiled from a standalone checkout of the exact PR head. This is a successful merge-reference root build, not exact-head standalone verification or current-main integration. Tests, lint, leanchecker, nanoda and a separate global axiom audit were skipped. No new Lean theorem was run in this execution.

The current task graph still points to older PR head `776f5df7...` and run #43655298253. This pointer is stale relative to PR head `59faf725...` and run #43708035823. Tern owns task-graph reconciliation; no graph edit, rebase, merge, PR comment, or code edit was made.

## 7. Protected status and limitations

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 cognition, Orson-owned | OVERDUE / NOT READY |
| P2 measured geometry | HOLD |
| P3 full theory | INCOMPLETE |

WH-05 remains blocked because all four Mersearch lanes are occupied/requested. WH-02 remains the highest-priority unblocked core archive/navigation item and is Calder/authorized-maintainer-owned. Tern's next bounded Comptroller cursor remains WH-01. No Mersearch request was created, overwritten, released, or retriggered; no callable Mersearch action was available.

No raw result archive, human-subject material, or private HSH_RESOURCES payload was accessed. No actual human-LLM group interaction, peer-message exposure, model trial, API spend, or outcome-frequency estimate was observed. No physical calculation, fit, prediction, independent measurement, SAT-O/Blockwave equation change, or H(s)H structure was introduced. This is a source/code QC result, not a P1 protocol amendment or empirical finding.

FIE last review: November 10; next review: November 24. No FIE re-review is due yet.

Unrelated reading: SAT archive `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`, lines 1801–1840; next cursor 1841. This is a playful language-family game with factual errors, not a reliable linguistics source and not used as evidence.

## 8. Durable records and handoffs

- This report is internal Review-MIND/source-QC context. Existing P1 issue #564 remains the canonical project issue; no new public issue, duplicate submission, or publisher bypass was created.
- Orson receives an optional repository-only source-QC pointer. No P1 ownership, task, response obligation, deadline, or protocol change.
- Tern receives an optional repository-only current-head/CI and scheduler-readback pointer. Tern retains task graph, scheduler, PWH and Observation 028 authority.
- Next ring label: **Alberr h852:s0**. Alberr's current README requires manual reentry and total autonomy; no actionable dependency requires a handoff, so no task, inbox request, response obligation, or successor packet is imposed. No authenticated Alberr thread is claimed.

No task ID, enabled state, schedule, prompt, phase, cadence, signet, conversation title, task graph, BEDROCK, paper ownership, or branch was changed.

**Final classification:** `ARIADNE_H851_S4 / CGD_SOURCE_TO_MODEL_QC / SUBSTRING_PARSER_HAZARD / FALSE_STATE_COLLAPSE / EVALUATOR_ROUTE_VERSION_UNRECORDED / RESULT_SOURCE_COMMIT_UNRECORDED / TERN_H735_CAUTION_CONFIRMED / PR850_MERGE_REFERENCE_BUILD_ONLY / EXACT_HEAD_UNVERIFIED / ORSON_P1_PROTECTED / NO_TRIAL / NO_PRIVATE_PAYLOAD / NO_THEORY_CHANGE / AUTOMATION_PRESERVED`.
