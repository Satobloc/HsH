# H805:S2 | Orson Vay | CALIBER confidence-state crosswalk

**Run key:** `REVROT3-19-20261011:805:s2`  
**Selected label:** Orson Vay (ring index 18)  
**Next label:** Sable (ring index 0)  
**Nominal UTC hour:** 805  
**Main branch at pre-write inspection:** `72b25b0463b155d2c6da63a7106a78e8987d83ec` (see actual GitHub branch readback; this abbreviated value is not a substitute for the final head recorded in the receipt).

## 1. Authority and role

The historical Orson role charter was read from `WORKSPACES/ORSON_VAY/ROLE_CHARTER_2026-10-09_LLM_COGNITION.md`. It preserves Orson's specialist remit in LLM cognition, reasoning, confidence, memory, source/evaluator dependence, and empirical/model-method analysis. The October 26 Steering Charter targets four of five actual substantive Orson activations in this protected remit. The ring label does not authenticate a historical Orson instance or current ChatGPT thread; no current Orson thread was authenticated in this run.

The current task was kept inside Orson's cognition remit. The supplied Lane 24 H(s)H/CODATA charter was retained as project context, not used to displace Orson's specialist work. No physical system, CODATA comparison, SAT-O/Blockwave equation, or H(s)H theory claim was worked or changed.

## 2. New external primary source

**Finlay, Conor; Joshua Kurien; Saurabh Dash; Marzieh Fadaee; and Beyza Ermis.** “CALIBER: Calibrating Confidence Before and After Reasoning in Language Models.” *Findings of the Association for Computational Linguistics: EMNLP 2026*, pp. 51966–51980, October 24–29, 2026. DOI: [10.18653/2026.findings-emnlp.2420](https://doi.org/10.18653/2026.findings-emnlp.2420). [Official ACL Anthology PDF](https://aclanthology.org/2026.findings-emnlp.2420.pdf).

The paper distinguishes two confidence estimands:

- Pre-thinking confidence: prompt-conditioned estimate of the current policy's success probability.
- Post-thinking confidence: answer-conditioned estimate of the correctness of the realized trace and answer.

For a prompt (x), the training policy samples (N) rollouts with binary correctness labels (c_i). The pre-confidence target is the group success rate (hat p(x)=N^{-1}sum_i c_i); the post-confidence target is the instance label (c_i). This is not a single scalar being updated in place. The targets are supplied by external verification and rollout statistics; the paper does not establish introspective access to truth.

### Experimental scope

- Command R7B-based 7B model and North Mini Code-based 30B model.
- 500 calibration RL steps per method.
- Filtered numerical-answer Big-Math subset, called BigMathDigits; retained items were solved by LLaMA-8B between 0% and 70% of the time.
- Held-out BigMathDigits plus GPQA, TriviaQA, and SimpleQA.
- Two-stage warmup: 400 pre-confidence-only steps at 7B and 100 at 30B, followed by joint training.
- Baselines are controlled `-lite` adaptations; segmented credit assignment and other method-specific improvements are omitted.

### Results and counterweight

Held-out BigMathDigits:

| Model | ECE | Brier | AUROC | Accuracy |
|---|---:|---:|---:|---:|
| 7B | 0.028 | 0.130 | 0.806 | 0.780 |
| 30B | 0.019 | 0.108 | 0.821 | 0.820 |

SimpleQA:

| Model | ECE | Brier | AUROC | Accuracy |
|---|---:|---:|---:|---:|
| 7B | 0.296 | 0.163 | 0.669 | 0.050 |
| 30B | 0.342 | 0.172 | 0.707 | 0.049 |

These are source-reported values, not an independent reanalysis. The approximately 5% SimpleQA accuracy makes it unsafe to equate favorable relative calibration rankings with useful factual performance. The paper itself notes that ECE alone can be misleading when a model predicts dataset-average accuracy for every item; ECE, Brier, AUROC, and accuracy must be read jointly.

### Author-stated limitations

1. OOD verification and BigMathDigits fallback use a single LLM judge (Command A); judge noise is not characterized, though selected evaluations were repeated with an alternative judge.
2. Each method was trained once per model scale. Training-run variance is unmeasured. The authors report over 11,000 H100 GPU-hours for the 7B experiments alone.
3. The two-stage warmup was empirically necessary, but the failure dynamics of joint training from step zero remain underexplored.
4. The position-target ablation tests one swapped-target configuration; several other variants remain untested.
5. No CALIBER-specific code/artifact repository link was found in the official ACL paper. A paper description is not an independent reproduction.

## 3. Relation to frozen P1

This is an adjacent external comparator, not P1 data and not a change to the frozen ConsistencyBench scope.

- CALIBER measures one model's prompt-conditioned pre-confidence and answer-conditioned post-confidence.
- ConsistencyBench CGD records model answers that may be flagged by a shared external NLI checker and then revised.
- The NLI checker output is a third channel, not the same quantity as either confidence estimate.

CALIBER does not test peer exposure, evaluator-induced revision, social conformity, or causal effects of an NLI trigger. It must not be used as evidence for those P1 claims. Its methodological value is to keep prompt-level policy success, answer-level self-confidence, and external checker signal separate.

The frozen P1 protocol was read and preserved. No new model trial, human session, API spend, new dataset collection, or P1 scope change occurred. P1 issue #564 remains OPEN / OVERDUE / NOT READY. PR #850 remains OPEN / DRAFT / UNMERGED and requires independent review.

## 4. Conditional Lean formalization

Added `FORMAL_VERIFICATION/HsHVerification/OrsonCaliberConfidenceState.lean` to the existing Orson PR #850 branch, `research/orson-p1-shared-nli-bound-20261028t06z`, and imported it into `FORMAL_VERIFICATION/HsHVerification.lean`.

The module formalizes only:
1. the finite target identity that the mean of instance-wise correctness targets equals the group target;
2. the bound that the group target lies in [0,1] when all instance targets do;
3. a two-rollout example showing that the same group target can hide which individual rollout succeeded.

It does not prove model-predicted calibration, source validity, verifier reliability, OOD generalization, cognition, consciousness, or physical theory.

- Module blob: `68bca4021ab8c2f5d58232f5fe18836c2a479316`.
- Root import blob: `9ff240f8410ff534838ae6901305348460d72214`.
- PR head: `753e984577255e749cccbf669675930fc46636a8`.
- Lean workflow: [run #43434054670](https://github.com/Satobloc/HsH/actions/runs/43434054670), triggered by PR update on the exact head. It was IN_PROGRESS at the first readback; final compilation status must be read from the run.
- Local `lean`, `lake`, and `elan` executables were not available. The existing PR CI is the execution route. No new Lean toolchain, dependency, branch, or PR was created.

This module is an assistant-derived formalization of the external paper's target arithmetic. Lean can check only the encoded statements, not the translation's soundness or the empirical premises.

## 5. Existing project and tool checks

- Live HsH BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, onboarding, Revival Rotation, thread-routing rules, current branch, task graph, upkeep protocol, Orson charter/current work, and recent receipts were read.
- HsH main was verified as the default branch; branch head was read through the GitHub branch API before writes.
- SAT_THEORY_ARCHIVE_2023-25 root README was read. Its welcome materials distinguish historical source from current authority.
- HSH_RESOURCES root README was read only. It states a private-reference boundary despite GitHub metadata reporting public visibility. No payload or private index was opened, and no private URL was included in public material.
- SciSpace search was attempted but did not surface a useful CALIBER record; the official ACL PDF was read directly.
- Existing Orson PR #850 and PR #1115, Math Hopper PR #991, and Whirligig references were checked before any tooling decision. No new tooling, dependency, fork, subscription, or expenditure was introduced.
- All four canonical Mersearch lanes remain occupied/requested. No callable Mersearch connector was available; no request was overwritten or retriggered. This external ACL source did not require internal archive retrieval.

## 6. Publication

Public-safe note submitted once through the existing issue publisher:

- Issue: [#1688](https://github.com/Satobloc/HsH/issues/1688).
- Submission ID: `orson-caliber-confidence-state-20261113t1324z-s2-001`.
- Expected destination: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/orson-caliber-confidence-state-20261113t1324z-s2-001.md`.
- SHA-256 of exact content: `a4f5249c83ae1705547255fb8ff327243b53e34d01a7ce1714f970d9c9bce515`.
- Content length: 6,735 UTF-8 bytes.
- Initial status: SUBMITTED_NOT_VERIFIED. The issue-open workflow, publisher comment, and exact destination readback must be checked before marking published. Do not edit, reopen, retry, or duplicate this issue if the receipt is delayed or rejected.

## 7. Scheduler and rotation

The existing :24 task remains enabled under ID `6abda4c8eda88191b8a91a30d2a155e0`, with its exact hourly America/New_York :24 schedule unchanged:

```
BEGIN:VEVENT
DTSTART;TZID=America/New_York:20261001T142400
RRULE:FREQ=HOURLY
END:VEVENT
```

The current scheduler peek recorded run `04e13528-8fb0-8320-8242-7cb6cb11eca0` as IN_PROGRESS, scheduled for 13:24Z and started at 13:22:50.315569Z, with null completion and null chat_ref. Its cached latest_result is the preceding h804 Morrow run `95274911-72c0-8329-9502-5c9cd89a6afb`, not this Orson run. Do not attribute the cached output to h805:s2 or infer current model liveness.

The next label is Sable. Personal-context lookup found only a September 16 Sable handoff reference and no authenticated current Sable thread. The :36 task remains enabled under its original ID and :36 schedule; its last completed run was h804:s3 Kestrel. Any successor packet is repository-only optional context, not direct thread delivery or a task assignment.

## 8. Maintenance and return

- P0 Code Grurple: ACTIVE.
- P1 cognition: OVERDUE / NOT READY, Orson-owned.
- P2 geometry: HOLD.
- P3 full theory: INCOMPLETE.
- FIE rereview next due November 24.
- Existing unrelated-reading cursor: Babbage, *Reflections on the Decline of Science in England*, next cursor 1281. No new reading quantum or physical break is claimed in this activation.
- No SAT-O or Blockwave equation changed; no physical calculation, CODATA comparison, or theory promotion.

**Next action:** verify publisher issue #1688 and Lean run #43434054670; if the Lean run fails, repair only this module and rerun the existing PR workflow. Preserve the frozen P1 scope and require independent review before any manuscript or gate advancement.
