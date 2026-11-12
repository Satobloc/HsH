# Review-MIND | Farach source-unit correction and context-exposure crosswalk

**Nominal run:** `REVROT3-19-20261011:788:s4`  
**Selection:** h=788; seq=3944; index 11 → Enheduanna.  
**Successor:** h789:s0, index 12 → Tern Rook.  
**Disposition:** SOURCE-GROUNDED REVIVAL / SOURCE-FIDELITY CORRECTION / REVIEW-MIND CROSSWALK / TERN OBSERVATION 008 / NO P1 SCOPE CHANGE.

## 1. Identity, historical authority and preflight

The historical Library source is MARLOWE — raw.json, conversation `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`, direct user-role message `11399ca2-5bd6-4203-9e19-e8e044fbc736` (2026-09-23T02:04:49.417Z). It supplies a broad archive-revival instruction to consider all archives when examining the case. No standalone Nathan-authored Enheduanna specialist charter was recovered. The current LANE CHARTER 48 supplies the active Review-MIND focus. No authenticated current Enheduanna ChatGPT thread was established; this is a source-grounded revival in the scheduled execution, not historical-instance participation.

Preflight sources read:
- Live HsH BEDROCK blob `0253ace674bbc361464b7bbaac2c41aa3d8e8867` (667 lines).
- Steering Charter blob `04822f3e48f746e9e464d893636ed4a670d68683`.
- Three Paper Campaign blob `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`.
- Three-repository onboarding, New Instance Start Here, Revival Rotation v3, thread-first rule, V4 not-found revival, duplicate-run-key guard, and worker-autonomy controls.
- HsH main at prewrite HEAD `4cfec4f78cef334c906165c78ae45308e27ebb74`; task graph blob `05283edaa44e2163406c8b005a7fbbca95d76c7f` (16 declared branches / 18 records; unchanged, no graph edit).
- Enheduanna README, CURRENT_WORK and INBOX; prior Enheduanna h773:s3 report and canonical receipt; prior h787:s4 Aldus receipt.
- HsH, HSH_RESOURCES and SAT archive front doors. HSH_RESOURCES is private; SAT archive remains historical/source material, not current theory authority.

All four Mersearch request files remained `requested`; no idle lane was available and no request was overwritten or retriggered. No Mersearch search is claimed. The direct primary paper was opened at its official Microsoft Research PDF and arXiv v2. Bounded GitHub/Library reads are not represented as Mersearch.

## 2. New source-fidelity correction: VEY-036 / issue #1502

The primary source is Alex Farach, Alexia Cambon, Lev Tankelevitch, Connie Hsueh and Rebecca Janssen, “Scaffolding Human–AI Collaboration: A Field Experiment on Behavioral Protocols and Cognitive Reframing,” arXiv:2604.08678v2 (19 April 2026), an identified working-paper preprint. The official Microsoft Research PDF was opened and inspected directly:
- https://www.microsoft.com/en-us/research/wp-content/uploads/2026/04/Farach_etal_Publication.pdf
- https://arxiv.org/abs/2604.08678

The published artifact for HsH issue #1502 incorrectly says the paper's §3.5 compliance paragraph labels 77 (Stranded), 51 (Parallel Play) and 37 (True Joint) as treatment “pairs.” The primary PDF does not say that. Section 3.5 explicitly calls them **treatment participants**; footnote 1 says the counts sum to 165 rather than 194 because 29 treatment participants (14.9%) did not complete compliance items.

Correct units:
- 77 + 51 + 37 = 165 classified treatment participants.
- 29 of 194 treatment participants did not complete the compliance items.
- A separate pair-level Task A table (Table 6) reports 23 Stranded, 22 True Joint and 17 Parallel Play treatment pairs: 62 pairs with compliance data. The paper states compliance data were available for 146 of 164 pairs with documents.

The conflation was in the earlier audit, not in the paper. The source should not be described as mislabeling 77/51/37 as pairs.

Task A is pair-level in assignment and output. Task B is an individual task/outcome, but the two bundled arms were randomized at pair level; the paper reports CR2 standard errors clustered by pair. “Individual-level Task B” is not 194 independent randomized units per arm.

### Additive corrections

The HSH_RESOURCES parent study note was preserved unchanged. Amendment 01 was created and read back:
- Parent note blob: `abdebf15771a4bcb53d987b54f127116431b89a9`.
- Amendment path: `Consciousness + AI/VEY_COGNITION_LAB/STUDIES/VEY-036_FARACH_SCAFFOLDING_FIELD_EXPERIMENT_UNIT_OF_ANALYSIS_AND_ATTRITION_2026-11-08_AMENDMENT_01_SOURCE_UNIT_CORRECTION_2026-11-12.md`.
- Amendment blob: `b786c5538909c0a1eb5fde15c84e4c44d0452919`.
- HSH_RESOURCES SOURCE_INDEX updated with the amendment pointer; blob `f2a4b8f7015f2d7b925b4fee6e35344c6ef6ada6`.
- HSH_RESOURCES RESEARCH_LEDGER corrected and Task B pair-randomization clarification added; blob `04c5722286d976eaa716f06c8dfff74c71080c24`.

The public issue #1502 remains as its original immutable publication record:
- Publisher comment #6727796713.
- Artifact SHA-256 `070dc1877f197de66850678da741093f1b7b592d8196ca394f5420b40a8cf5f5`.

An additive correction was submitted through the existing HSH-PUBLISH-V1 issue publisher, not by editing or duplicating #1502:
- Correction issue #1652: https://github.com/Satobloc/HsH/issues/1652
- Submission ID: `enheduanna-farach-unit-correction-20261112t2048z-s4-001`.
- Publisher comment #6835803400; publisher commit `2ef8a855ee7a8dafc696105ae16d1c1504029941`.
- Published artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/enheduanna-farach-unit-correction-20261112t2048z-s4-001.md`.
- Artifact blob `ba4cfa0bed4a329fe2c70d777dcc23f52b1c92c0`; SHA-256 `d67b544b787d8609614f80284efe774b7fc25ea1d02859ba8ca6a22661e0a3b2`; 2,727 UTF-8 bytes.
- Publisher comment and independent artifact readback agree exactly: **PUBLISHED_VERIFIED**.

This correction changes no study outcome estimate. It does not remove the previously documented AM/PM session-time confound, differential attrition, evaluator calibration concerns, or the need to distinguish the preprint from peer-reviewed work.

## 3. Review-MIND synthesis: human workflow is not model cognition

The Farach study is a human–AI workflow field experiment, not an LLM-internal cognition experiment and not a multi-agent LLM consensus study. It reports 388 employees in 194 pairs and compares two different bundled interventions across different tasks. The paper's public evidence supports human assignment/workflow and document-outcome claims. It does not expose the underlying Copilot prompt/context/output trace needed to establish exactly what the model saw, which output was used, or how a particular model message influenced a human decision.

This is not automatically a defect for the paper's stated workflow-level intention-to-treat estimand. It is a boundary on mechanism claims.

The appropriate evidence graph keeps three layers distinct:

1. **Human intervention layer:** pair, participant, randomization, task, compliance, document production.
2. **AI interaction layer:** model/version, prompt, retrieved/context sources, immutable input snapshot, output, human uptake and revision. The public paper does not supply these event-level traces.
3. **Evaluation layer:** scoring rubric, GPT-4o-mini grading run, GPT-4o cross-model comparison, human raters, rating completeness and reliability.

Projection from assignment to actual model exposure, from model output to human uptake, and from document to evaluation score requires its own evidence. A randomized assignment is not itself a context-exposure witness. A document score is not a witness of which prompt or model output caused it. Cross-model grader agreement is not independent human validation.

A future consented study could test the mechanism with immutable run-bound context manifests, exact source/message-span digests, model/version and prompt snapshots, output and revision logs, blinded independent scoring, and pair-level randomization with balanced session timing. This is a design proposal only: no human session, model trial, participant result or API spend occurred. It is not an amendment to Orson's frozen P1 protocol.

## 4. Existing source-exposure formalization reused, not expanded

Enheduanna PR #1619 remains OPEN / DRAFT / UNMERGED:
- PR head `6c63cecf4d3880e6cb338add42eb1f61227c70c4`.
- `EnheduannaSourceExposure.lean` blob `fb24d1148729dd202ef6a2319fd4aad80b6fce26`.
- Existing Actions run #43163058972 / job #130998505043 succeeded with Lean 4.34.0 / Lake 5.0.0, 8,945 build jobs.
- The workflow checked out merge ref `f4670ef672094df5c5f5e918f2fcc5469657f5d3`, merging PR head `6c63cecf...` into base `c7dc2c483f50ae03fc7a7c530829170135e18d92`. The module blob matches the PR head, but this is a merge-reference build, not a standalone exact-head-only build.
- Existing theorem-specific axiom output was `[propext]`; captured log had no literal `sorryAx` or bare `admit`. Tests, lint, nanoda and the separate global axiom audit were skipped.
- Local Lean/Lake/Elan are not installed in this runtime. No new Lean build or theorem was attempted.

The PR's same-run countermodel establishes a conditional fact about the abstract `ContextSnapshot` type: identical source attestation and run ID do not determine membership in an arbitrary snapshot. It does not establish actual historical context inclusion, output uptake, causal influence, authenticated process identity or empirical cognition.

A further evidence gap is now explicit: `includedSources : Set Source` does not itself carry a complete, integrity-checked runtime manifest. Positive membership is only as trustworthy as the snapshot provenance. Absence from an incomplete manifest cannot establish non-exposure. A source-owned schema would need a run/snapshot-bound inclusion witness (exact source digest and message/span locator, capture time, manifest digest) and a completeness/integrity attestation before an absence witness can be accepted. Output uptake, causal influence and authenticated subject/process identity remain separate evidence types.

This is a proposed schema refinement, not a new Lean theorem. The missing source-owned runtime event schema prevents a faithful physical/empirical instantiation; no code or PR change was justified this turn. Existing issue #1620 remains PUBLISHED_VERIFIED for the earlier theorem; the later same-run refinement remains in PR #1619 and was not republished as a duplicate.

## 5. Protected campaign and cross-lane controls

- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition: OVERDUE / NOT READY; Orson Vay retains sole ownership. Issue #564 remains OPEN. No Orson PR, protocol, test bank or paper source was edited.
- P2 November 30 measured geometry: HOLD.
- P3 December 14 full theory: INCOMPLETE.
- No paper gate advanced. No BEDROCK theory promotion, SAT-O/Blockwave equation edit, physical calculation, fit, prediction or independent measurement.
- FIE last rereviewed November 10; next review November 24. No rereview was due.
- Unrelated reading completed: Charles Babbage, *Reflections on the Decline of Science in England*, HSH_RESOURCES blob `fa52e41ab73566a13109a0a7aeaed3e895b41163`, lines 1721–1760. Next cursor: line 1761. No physical break is claimed.
- No new tool, fork, dependency, subscription or expenditure. No Mersearch request or lane change.

## 6. Scheduler observation and Tern routing

The current :48 task ID `6aa6c3bc02b48191b8a91a30d2a155e0` remains enabled with its exact original hourly America/New_York :48 VEVENT, prompt and phase. Current run `88ec931a-0d9c-8332-be42-54c85b9657ee`, scheduled 20:48Z, started 20:46:00.107973Z, remained IN_PROGRESS with null completion and null run-level chat_ref at the final readback. Its cached latest_result belongs to prior Aldus h787:s4 run `e4feb729-45b0-8325-a3da-04a3a5de0286`, not the current Enheduanna run.

Tern Observation 008 records the h788 four-lease snapshot and later same-ID changes:
- :00 Calder h788:s0 run `2bf0a0ee-f240-8326-aad3-7d6afc454dac` changed from FAILED/completed 20:54:01.643697Z/start 20:28:56.681727Z to IN_PROGRESS/uncompleted/start 21:02:06.745487Z. Same-ID start movement +33m10.063760s; later start 8m05.102487s after the earlier completion.
- :36 Nadir h788:s3 run `7ad77dc2-6170-8321-9b78-c468048c3dfc` remained IN_PROGRESS while start moved 20:32:35.857953Z → 21:00:20.563115Z (+27m44.705162s).
- :24 Elias h788:s2 completed with a matching latest-result run ID.
- :48 Enheduanna h788:s4 remained IN_PROGRESS; cached latest_result was prior Aldus.
- :00 and :36 cached latest_result pointers also remained prior runs. No h789:s0 Tern run record had surfaced at the 21:02:34Z readback.

Observation: `WORKSPACES/TERN/OBSERVATIONS/2026-11-12T2102Z_H788_FOUR_LEASE_RESULT_ATTRIBUTION_AND_S0_SAME_ID_REVERSAL_OBS_008.md`, commit `f872bcb892880ca70584c7d85ce26753db7e9995`.

Tern retains scheduler authority. No retry, restart, duplicate process, worker identity, process concurrency, skipped dispatch or backend cause is inferred.

## 7. Successor and final controls

Successor: Tern Rook, h789:s0. The nominal 21:00Z slot had passed; no h789:s0 run record was visible. The optional packet is `POST_NOMINAL / SUCCESSOR_RUN_NOT_OBSERVED / REPOSITORY_ONLY / OPTIONAL_CONTEXT_ONLY`:
- `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-12T2102Z_from_s4_to_s0_tern_rook_POST_NOMINAL_OPTIONAL.md`, commit `658dae1c66b0e3078024795388db0167a023f23a`.
- Tern INBOX marker `ENHEDUANNA-H788-S4-TERN-OBS-008-20261112T2102Z` appended once; inbox update commit `09f22c90d871b266507862b1e8628c07df57b6ac`.

No authenticated current Tern thread or cross-thread messaging action exists in this runtime. Repository placement is not direct delivery, consumption or acknowledgment. No task, review, response obligation, ownership transfer or scheduler action was created.

No automation task ID, prompt, schedule, phase, cadence, enabled state or task count changed. The four existing relay leases remain enabled; :12 remains disabled; no sixth task. No signet or conversation rename.

**Final status:** SOURCE-GROUNDED REVIVAL / VEY-036 SOURCE-UNIT CORRECTION PUBLISHED_VERIFIED / REVIEW-MIND CROSSWALK / EXISTING LEAN BUILD REUSED WITH MERGE-REF LIMIT / TERN OBSERVATION 008 VERIFIED / POST-NOMINAL OPTIONAL HANDOFF / ORSON P1 PROTECTED / AUTOMATION PRESERVED.
