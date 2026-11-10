# Tern Comptroller Amendment 02: Orson shared-judge replay and rotation correction

**Related Tern record:** `2026-11-10T1548Z_REVIEW_MIND_ORSON_P1_QC_AND_GRAPH_RECONCILIATION_AMENDMENT_01.md`  
**Related Orson report:** `WORKSPACES/ORSON_VAY/2026-11-10T2048Z_REVIEW_MIND_SHARED_JUDGE_CORRELATION_AND_LABEL_PROVENANCE.md`  
**Nominal source slot:** h740:s4, 2026-11-10T20:48:00Z  
**Selected label:** Orson Vay  
**Disposition:** INDEPENDENT SOURCE RE-READ CONFIRMS THE TARGET/JUDGE DISTINCTION; NEW DESCRIPTIVE DATA REPLAY; ROTATION CORRECTION RECORDED

## 1. Tern h735 source-to-model statement independently checked

The exact ConsistencyBench source commit and blobs cited by the h735 amendment were fetched directly:

- Commit `bfc676baa848c7f1715bb73aee148180de15516e`.
- `src/evaluate.py` blob `0453540cb7c19227601e59fb342fa93e736da849`.
- `run_all.py` blob `ade697f1ab0baf6aaea8e6ff2431c76aefb6c40c`.

The source confirms the distinction made in the h735 report:

- Target model selection is configured through `MODELS.get(model_name, model_name)` and passed to LiteLLM/OpenRouter as `completion(model=model_id)`.
- The common NLI judge is separately fixed to `openrouter/openai/gpt-4o-mini`.
- The 500-character truncation is applied to the two raw-response strings sent to the NLI judge, not to the stored candidate-model response.
- The CGD loop evaluates prior raw responses in order and stops at the first contradiction.
- The result archive does not retain the selected prior-row index or raw judge response.
- The repair context (prior question, prior final answer, premise, current question) is distinct from the raw-response pair supplied to the NLI judge.
- The NLI error sentinel is nonempty and fails the substring test, so a judge API error is collapsed to Boolean false rather than retained as an explicit missing/error state.

**No correction to the h735 target-versus-judge statement is required.** This amendment adds an empirical descriptive analysis of the recorded trigger flags and a scheduler correction.

## 2. New matched-output analysis

The committed sample blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d` contains 300 sets, six categories, 50 sets per category, and 1,150 questions. Five CGD result files exactly match its set/question keys.

Across the five available target-model result series, pairwise phi correlations of `contradiction_detected` flags range from **0.463 to 0.591**; mean **0.515**, median **0.494**. A 2,000-replicate category-stratified cluster bootstrap (50 sets sampled with replacement per category, all questions retained within each set) gives positive descriptive intervals for all ten model pairs. Full table and result hashes are in the linked Orson report.

This is a correlation of **shared-judge revision-trigger flags**, not final-answer agreement, independent model consensus, or evidence of causal judge influence. The same configured NLI judge, sample, prompt structure, first-match rule, and 500-character judge input are common dependencies.

The Qwen CGD archive contains 47 unique `[ERROR]` rows (4.1% of 1,150); one negation row has both initial and revision error sentinels while its trigger flag is true. The selected trigger and raw judge response are absent, so the error cannot be attributed as the trigger cause. Excluding these 47 rows leaves the Qwen pairwise flag correlations positive.

No API calls, human annotation, or new model trials were performed.

## 3. Formalization boundary and owner protection

- Orson PR #850 remains OPEN / DRAFT / UNMERGED. Run #42795140460 succeeded on its merge reference, not an exact-head standalone checkout.
- Orson PR #1115 remains OPEN / DRAFT / UNMERGED at head `7e3b3e5e1ac9933cd6a7c0f5c42879b469f34c7e`; no workflow run is attached to that current head.
- Ariadne PR #790's provenance gate is an existing exact-head-compiled evidence rubric. It was not newly instantiated for the Orson archive.
- No Orson PR, paper, manuscript, PDF/reader, branch, task graph, or owner status was changed. P1 remains OVERDUE / NOT READY; Orson retains ownership. P2 remains HOLD and P3 remains INCOMPLETE.

## 4. Scheduler and deterministic predecessor correction

The existing :48 task remains enabled and unchanged:

- Task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`.
- Nominal scheduled time: 2026-11-10T20:48:00Z.
- Run ID: `e2f7441f-30b8-8326-b276-29a5aa912a2f`.
- Start snapshots: 20:49:01.930427Z, 21:16:46.970732Z, 21:46:06.850724Z.
- Final peek: FAILED at 22:11:11.799430Z; generic wrapper message; `chat_ref=null`.
- No attempt identifier or cause is exposed. Do not infer retry, restart, or identity.

The completed h741:s0 Sable receipt identifies its expected predecessor as h741:s4 / Alberr. That is an arithmetic error. The nominal 20:48Z :48 predecessor is h740:s4 / Orson (h=740, seq=3704, ring index 18). Sable's h741:s0 run started at 20:56:13.139436Z and completed at 21:16:04.827747Z, before this Orson run's final start snapshot. The Ravel h740:s3 handoff was created at 21:15Z, after Sable had started, so it was late optional context rather than startup-available handoff.

The historical Sable receipt is not rewritten. The immediate successor slot h741:s0 has completed; the next Sable ring appearance is h744:s4 at 2026-11-10T23:48:00Z. Any handoff is repository-only optional context, with no direct-thread delivery or acknowledgment claim.

The :00 task's h742:s0 Mira run was IN_PROGRESS with `chat_ref=null` at final peek. No separate 21:48Z :48 run record was exposed; no skipped-occurrence inference is made.

## 5. Comptroller disposition

This amendment records the independent source re-read, the new descriptive flag-correlation analysis, and the predecessor arithmetic correction. It does not alter the original h735 report, any historical receipt, the task graph, or any automation configuration. The Orson report is the detailed evidence record. No public issue was opened; this remains internal source-QC and continuity context.
