# Orson Vay | h748:s2 | Qwen target-error sentinel propagation and 850-row sensitivity

**Observed:** 2026-11-11, nominal 04:24Z.  
**Run key:** `REVROT3-19-20261011:748:s2`  
**Routing:** `h=748; seq=5h+2=3742; 3742 mod 19 = 18`. Selected label: Orson Vay (index 18). Successor label: Sable (index 0). Selection is deterministic routing, not authenticated ChatGPT-instance/thread identity.

## 1. Authority and scope

The live Orson role card is `WORKSPACES/ORSON_VAY/ROLE_CHARTER_2026-10-09_LLM_COGNITION.md` (blob `894a8fd3829b0ffb0d25402daba5d40fa53c2534`). It is an assistant-maintained synthesis; the original October 9 user-role reset message remains unrecovered. The October 26 Steering Charter and current task graph independently protect Orson's LLM-cognition remit and the approximate four-of-five target for genuine cognition work.

The current P1 protocol freeze is `WORKSPACES/ORSON_VAY/P1_PROTOCOL_FREEZE_2026-11-02_METHODS_ARCHIVAL_SCOPE.md` (blob `9af4448d25f656ad1e63301660de63fd32924d5f`). It controls this run: no new LLM trial, human session, API spend, OV-49–OV-53 matched-prompt administration, or scope expansion without the missing source bank and authorized inference endpoint.

No authenticated current Orson thread was found. The :24 run-level `chat_ref` is null. This report is source-grounded assistant execution, not authenticated participation by the historical Orson instance.

## 2. Required preflight and repository state

Read/rechecked at the current observed HsH main head `d531335fdf25ee00bd3de384b78a670dbac2d0de`:

| Governing source | Blob |
|---|---|
| BEDROCK (667 lines) | `0253ace674bbc361464b7bbaac2c41aa3d8e8867` |
| Nathan Direct Primary Operational Guideline, 2026-11-08 (511 lines) | `a8e333b1d5b5aa1d9772366945dd88769d24153c` |
| Steering Charter, 2026-10-26 | `04822f3e48f746e9e464d893636ed4a670d68683` |
| Three Paper Campaign | `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4` |
| New Instance Start Here | `43b577d42b8cced83f8836934598081685ea3ff3` |
| Three-repository onboarding | `fe40260cda5ce360909f2adfd64a3cc3e2c92a05` |
| Revival Rotation V3 | `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14` |
| Revival thread-routing rule | `d9ea7c3a04e03822c65ee231d0b9545bf37907bd` |
| Scheduler Authority | `9f7ffbbf0fe77fd4c561a110c9dbb2b686a88b45` |
| Code Grurple roster | `cc96c0bfafc95c54e7960899c7306031e5abce17` |
| Task branch graph | `628fa5eba8da29a083271a545050ae3c90739bec` |

The three-repository front doors and onboarding were consulted. The existing Mersearch request `orson-cognition-origin-bank-20261103-1745` was reused, not rerun. Its manifest and compact receipt record all three repositories, 16,942 files, 21,037,890 records, 135 hits and 74 distinct source paths. Raw result files remain withheld; the receipt is a bounded navigation record, not source excerpts or proof of exhaustiveness. The OV-49–OV-53 matched-prompt bank remains **NOT RECOVERED**, not proven absent. All four request lanes remain occupied; no new request or overwrite was made.

The current task graph still declares 16 branches against 18 branch records. Tern retains reconciliation authority; no graph edit was made.

## 3. New source-level cognition finding

The pinned public ConsistencyBench evaluator at commit `bfc676baa848c7f1715bb73aee148180de15516e` has the following path:

- `call_model` makes an initial request, retries once after an exception, then returns literal `[ERROR]` if the retry also fails (source lines 137–170).
- `extract_answer` maps an unparseable response such as `[ERROR]` to `Unclear` (lines 98–134).
- In `evaluate_cgd`, if prior question/answer pairs exist, the current raw target response is passed to the NLI checker against each prior raw response. There is no target-error-sentinel guard before the call (lines 249–264).
- The loop stops on the first positive checker result, then calls the same target model for a repair response (lines 266–279).
- The serialized result retains the Boolean `contradiction_detected` and `revision_response`, but not the selected prior pair, raw NLI prompt/output, retry/error details or request ID (lines 281–290).
- The shared NLI checker compares the first 500 characters of the two raw responses using fixed GPT-4o-mini; the question and premise are not included in that NLI prompt (lines 306–327).

### Observed row

In the Qwen 2.5 72B archive:

- 47 rows have an initial target-call `[ERROR]` sentinel.
- 13 are first-position rows, with no prior pair and excluded from the 850-row later-position panel.
- 34 are eligible later-position errors: 12 at zero-based position 1, 11 at position 2, 11 at position 3.
- Exactly one of those 34 has `contradiction_detected=true`; the other 33 do not.
- The flagged row is `CB-91490`, category `negation`, zero-based index 3 (fourth question). Its initial response is `[ERROR]`, initial answer `Unclear`, trigger flag true, revision response `[ERROR]`, final answer `Unclear`.

Because the row is fourth, three prior raw-response pairs exist. The current `[ERROR]` sentinel is therefore supplied as the second NLI input in comparisons against prior raw responses. The true flag establishes that at least one comparison returned true. It does **not** identify the selected prior pair or raw judge output, and does not establish that the sentinel itself was semantically judged contradictory. The checker also uses substring presence of `CONTRADICTORY`, not exact-token matching; the missing raw judge output prevents recovery of the actual wording.

This is a target-model call failure entering the shared judge's input path, not an observed NLI-judge API failure. Those are distinct error locations.

## 4. Reproduced 850-row sensitivity

All 17 result-file blob IDs in the existing Orson replay script were re-fetched by path at the pinned ConsistencyBench commit and matched 17/17. The sample benchmark, evaluator and Qwen result blobs also match their pinned source IDs. The 850 eligible later-question rows form 17 category-by-position strata of 50 rows each; 136 pairwise model comparisons were recomputed.

The baseline reproduces the published issue #1574 to its reported rounding:

| Estimand | Recomputed baseline |
|---|---:|
| Mean raw pairwise binary phi | 0.3744428585 |
| Mean category-by-position-adjusted pairwise correlation | 0.1326232362 |

Sensitivity rows were removed only for comparisons involving Qwen; the other 120 model pairs remain unchanged. Pairwise category-by-position residual means were recomputed on each comparison's complete rows.

| Qwen error treatment | Mean raw phi | Mean adjusted correlation | Adjusted change |
|---|---:|---:|---:|
| Baseline | 0.3744428585 | 0.1326232362 | — |
| Remove the one flagged error row | 0.3745345021 | 0.1326902978 | +0.0000670616 |
| Remove all 34 eligible Qwen error rows | 0.3757010678 | 0.1338882467 | +0.0012650104 |

The one-row removal changes the adjusted mean by about 0.0067 percentage points; removing all 34 eligible Qwen error rows changes it by about 0.1265 percentage points. These are descriptive point estimates; no sensitivity-specific bootstrap interval was computed. The published baseline interval [0.109, 0.158] in issue #1574 is not an interval for either sensitivity.

The sensitivity suggests that Qwen's eligible error rows have a small influence on the mean adjusted dependence statistic. It does not resolve the semantic validity of the flagged row or estimate a causal shared-judge effect.

## 5. Lean/formal status

Existing Orson PR #850 remains OPEN / DRAFT / UNMERGED at head `3041f7c2cd717b51945dacaf1d24bc69a0394987`.

Actions run #42795140460 built merge reference `3bced884cbea0a145e9e117a51a787283fe84c2a` using Lean 4.34.0 / Lake 5.0.0; the root build completed 8,984 jobs. `OrsonCGDProjectionGate.lean` has identical blob `b60d3ad7d50ede1c5c58f5a15c178ba8e1a281e8` at the PR head and merge reference.

- `archived_projection_does_not_identify_trigger_pair`: no reported axioms; a synthetic non-injectivity witness in the encoded trace model, not proof of this row's unobserved trigger.
- `checker_view_ignores_question_premise_and_final_answer` and `checker_view_keeps_original_raw_after_revision`: compiled; theorem-specific outputs report `propext` and `Quot.sound`.
- `error_sentinel_maps_to_false`: compiled; reports `propext` and `Quot.sound`. It concerns `[ERROR]` as the **NLI judge's output** being mapped to false. It does not prove that a target-model `[ERROR]` is excluded from the judge's **input**.

This is a merge-reference build containing the exact same target-module blob, not an exact-head standalone build. Tests, lint, nanoda/leanchecker and the separate global axiom audit remain skipped/unverified. Lean checks the formalized statements only, not the soundness of the Python-to-Lean translation or empirical premises. No new theorem or PR was created.

## 6. P1 and campaign disposition

P1 issue #564 remains OPEN, Orson-owned, ACTIVE / METHODS-ARCHIVAL, and NOT READY after the November 9 gate. The frozen scope remains within-model self-history and the shared GPT-4o-mini NLI checker; the archive does not expose cross-model peer answers, so this is not a multi-agent peer-deliberation or social-conformity experiment.

Still missing: OV-49–OV-53 matched-prompt bank, authorized inference endpoint, canonical source LaTeX, compiled PDF, readable reader route, independent/hostile review and author disposition. No new model call, human session, API spend, manuscript completion or paper-gate advancement occurred.

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE; eight protected blobs match exact expected SHA at main head `d531335fdf25ee00bd3de384b78a670dbac2d0de` |
| P1 cognition, November 9 | OVERDUE / NOT READY / Orson-owned |
| P2 geometry, November 30 | HOLD |
| P3 full theory, December 14 | INCOMPLETE |

No P2 physical calculation, SAT-O/Blockwave equation change or BEDROCK theory promotion occurred.

## 7. Tooling and write-route preflight

Checked existing Math Hopper issue #578 / PR #991, Orson PR #850 and #1115, Whirligig Kernel 0 and SciSpace before considering new tooling. No new tool, dependency, fork, subscription or expense was introduced. Fork enumeration remains unverified.

The runtime has Git and Node, but no local repository checkout, `gh`, Lean, Lake or Elan. The public supplement used the existing HSH-PUBLISH-V1 issue publisher. For internal continuity files, the documented local/Actions writer route was not exposed for this path, so the approved GitHub Contents API fallback was used with current-file SHA/CAS and independent readback.

## 8. Freshness and lateral reading

FIE rereview remains current through November 10; next review November 24. Continued unrelated Babbage reading, *Reflections on the Decline of Science in England*, lines 1981–2020. Next cursor: line 2021. No physical break is claimed.

The passage concerns scientific appointments, public scrutiny of mathematical competence, and Captain Sabine's pendulum observations. No theory analogy was drawn.

## 9. Scheduler and automation preservation

The existing :24 task is `6abda4c8eda88191bf23a6f2849e9a17`, enabled, `exact_schedule`, with its original hourly America/New_York :24 VEVENT unchanged. Current run `15ce1def-a9f0-8327-afdc-8126a664b88d` was last observed IN_PROGRESS, scheduled 04:24Z, started 04:28:06.823982Z, no completion timestamp and `chat_ref=null`. Its cached latest result belongs to the prior 03:24 occurrence, not this run. The task-level `next_run_time` remains stale at 2026-11-10T23:24-05:00; the VEVENT itself is unchanged.

The deterministic successor Sable's existing :36 task `6a9f52b69ec08191b0a2ba24a074f781` is also enabled on its original hourly :36 VEVENT. Sable h748:s3 run `9c26ec1e-5460-832f-9215-471846f68075` had already started at 04:35:17.201268Z and remained IN_PROGRESS with `chat_ref=null`. The handoff is therefore POST_START_OPTIONAL_CONTEXT_ONLY. No current authenticated Sable thread was established; no direct-thread delivery, consumption or acknowledgment is claimed.

No task ID, prompt, schedule, phase, cadence, enabled state or task count was changed. No sixth task was created.

## 10. Public supplement

A distinct additive HSH-PUBLISH-V1 submission was created because the existing issue #1574 contains the primary 17-model analysis but not this source-path clarification and error-excluded sensitivity.

- Issue #1581.
- Submission: `orson-qwen-error-input-sensitivity-20261111t0424z-s2-001`.
- Content SHA-256: `bcf354cb64ca0f9846762e69b15d72d966bc6f5f84e2548a695eeed4693a6179`.
- Content size: 8,298 UTF-8 bytes.
- At the last verification, the issue body matched the submission payload, but there was no publisher comment and the destination artifact was not yet visible. Status: **SUBMITTED_NOT_VERIFIED**. Do not duplicate or resubmit. Carry issue #1581 and the submission ID forward until PUBLISHED readback or explicit rejection.

## Final disposition

The new finding is that one archived target-model failure was still routed into the within-model NLI trigger path and then failed again during repair. The archived record cannot identify the triggering prior pair or raw judge output. The 850-row sensitivity shows only a small shift in the mean adjusted dependence statistic when the error rows are excluded.

P1 remains NOT READY. The source and formalization boundaries are now more precise; no new experiment or theory claim has been made.
