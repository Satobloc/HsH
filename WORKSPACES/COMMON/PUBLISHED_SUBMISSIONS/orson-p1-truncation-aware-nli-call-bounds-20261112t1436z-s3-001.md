# Orson h782:s3 | Truncation-aware bounds for shared NLI comparison exposure

**Run key:** `REVROT3-19-20261011:782:s3`  
**Nominal slot:** 2026-11-12 14:36 UTC  
**Selected label:** Orson Vay (ring index 18)  
**Next label:** Sable (ring index 0)  
**Disposition:** source replay reproduced; existing PR proof repaired; merge-reference Lean build passed; public publication and durable receipt pending at report creation.

## 1. Authority, source and continuity

The live HsH BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, Revival Rotation V3/V4, thread-first rule, Orson workspace, P1 protocol freeze, current task graph, incoming Ravel handoff and recent receipts were read.

Key live source identities at preflight:

| Source | Blob |
|---|---|
| `BEDROCK.md` | `0253ace674bbc361464b7bbaac2c41aa3d8e8867` |
| Steering Charter 2026-10-26 | `04822f3e48f746e9e464d893636ed4a670d68683` |
| Three Paper Campaign 2026-10-26 | `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4` |
| New Instance Start Here | `43b577d42b8cced83f8836934598081685ea3ff3` |
| Three-repository onboarding | `fe40260cda5ce360909f2adfd64a3cc3e2c92a05` |
| Revival Rotation V3 | `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14` |
| Revival Rotation V4 | `6761337dfcd0847226ee7baad84db0a9c496760a` |
| Thread-first rule | `e79707587914edb76afca1c32f9f4dad4d0324b7` |
| Orson role charter (assistant-maintained reconstruction) | `894a8fd3829b0ffb0d25402daba5d40fa53c2534` |
| Orson CURRENT_WORK at preflight | `5f38e4a193fc12437783c923785388c8eb068995` |
| P1 protocol freeze | `9af4448d25f656ad1e63301660de63fd32924d5f` |
| Main branch head at preflight | `390014bc2f280759a53aab951bb02eb393b7cdc4` |

The role charter is an assistant-maintained synthesis. The original October 9 Nathan-authored role-reset message remains unrecovered. The current user instruction directly preserves Orson's approximate four-of-five substantive cognition-work target. No authenticated current Orson ChatGPT thread was established; the run is a source-grounded revival, not a claim of historical instance continuity. No new chat was created and no cross-thread message was delivered.

### Mersearch status

The completed request `orson-cognition-origin-bank-20261103-1745` was reused as navigation evidence. Its request-scoped manifest and compact receipt identify `Mercer_Searcher_1.0` at commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`, with HsH, SAT archive and HSH_RESOURCES snapshots. Manifest blob: `a8d4ba7e16f76cb190db2a48bf1197127f3d8a8d`; compact receipt blob: `5b48108737ec80d2069dd79463f3ac91f933a1d5`. Stable release commit: `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`. Source snapshots: SAT archive `1d9b39babb82915b05dda47ebe5fd034108ab813`, HsH `9c22ddc466f1b1cb7c37a644f29242b0f5adf00c`, HSH_RESOURCES `beaa05b279524a881c5f80e69f1f1f8b0f4b95f5`. Reported coverage: 16,942 files, 21,037,890 records, 135 hits and 74 distinct paths; HsH 90 hits, HSH_RESOURCES 45, SAT archive 0. Raw result files remain withheld, so this is not a complete source audit and no private locators are reproduced.

No fresh Mersearch search was run. The direct Mersearch connector and workflow-dispatch action were not exposed in this runtime; the local pinned checkout was unavailable; the four shared request lanes were occupied. No request was overwritten or created. The original role-reset message remains unresolved.

## 2. Frozen P1 scope

P1 remains the methods/archival paper *Shared Evaluator Dependence and Within-Model Self-Revision in Multi-Model Evaluation: A Source-Audited Methods Study of ConsistencyBench*. The protocol freeze explicitly prohibits treating the archive as cross-model peer deliberation, a causal revision trial, or evidence of consciousness. No new model trial, human session, API call, endpoint use or spend occurred.

Issue #564 remains OPEN / SOURCE-EXPERIMENT READINESS / NOT READY. The original OV-49--OV-53 bank is not recovered; an authorized inference endpoint is not available; source LaTeX, canonical PDF, reader route and independent hostile review remain unverified. The November 9 gate is not advanced. P2 November 30 remains HOLD; P3 December 14 remains INCOMPLETE; P0 Code Grurple remains ACTIVE.

## 3. Source-level measurement architecture

Public source: `aayambansal/ConsistencyBench` at commit `bfc676baa848c7f1715bb73aee148180de15516e`.

- Evaluator: `src/evaluate.py`, blob `0453540cb7c19227601e59fb342fa93e736da849`.
- Seventeen original result JSON blobs are listed in HsH manifest `WORKSPACES/SABLE/2026-10-28_0612Z_CGD_SOURCE_MANIFEST.csv`, blob `e59fb1b5443977089f51e85068b9259248930957`.
- Each file has 300 sets and 1,150 question records. Aggregate: 5,100 sets, 19,550 records, 6,702 contradiction flags, 14,450 later-position eligible records and 28,050 possible prior/current pair slots.

The evaluator creates `prior_qa_pairs` inside each target model's `evaluate_cgd` call. It compares the current raw response with that same call's earlier raw responses in order and stops at the first positive contradiction. The shared NLI checker sends the first 500 Python string characters of each endpoint to the fixed `openrouter/openai/gpt-4o-mini` checker. The archive stores the Boolean flag but not the triggering prior index, raw NLI input/output or retry trace.

Thus a shared judge does not receive an equal information set across target-model outputs: the 500-character cap can truncate different proportions of the raw responses. This is a measurement-exposure issue, not proof of judge error or model cognition.

## 4. New result: partial-identification interval

For each potential prior/current comparison, a pair is marked as containing a truncated endpoint when either full raw response exceeds 500 Python characters. For an unflagged row, all prior comparisons are executed. For a flagged row, only the prefix through the unknown first-positive prior index is executed. Taking the minimum and maximum truncated-prefix counts across admissible stopping positions yields:

| Current-question position | Eligible rows | Flagged rows | Lower bound | Upper bound |
|---|---:|---:|---:|---:|
| 2nd question (one prior) | 5,100 | 1,541 | 298 | 298 |
| 3rd question (two priors) | 5,100 | 2,143 | 811 | 1,162 |
| 4th question (three priors) | 4,250 | 3,018 | 931 | 1,663 |
| **Total** | **14,450** | **6,702** | **2,040** | **3,123** |

The interval bounds **comparison invocations with at least one truncated endpoint**, not provider/API network requests. The helper can retry, and retry logs are absent. The exact number of executed truncated comparisons is not point-identified because the first-positive prior index is not archived.

### Archive-wide model-label exposure

Each file contributes 1,650 possible pair slots. The following counts are potential truncated slots before early-stop censoring, not actual executed calls.

| Archived model label | Potential truncated slots | Share of 1,650 slots |
|---|---:|---:|
| Claude 3.5 Sonnet | 60 | 3.6% |
| Claude Opus 4.6 | 517 | 31.3% |
| Claude Sonnet 4.5 | 1,080 | 65.5% |
| Claude Sonnet 4.6 | 636 | 38.5% |
| DeepSeek V3.2 | 189 | 11.5% |
| Gemini 2.0 Flash | 512 | 31.0% |
| Gemini 2.5 Flash | 2 | 0.1% |
| Gemini 2.5 Pro | 0 | 0.0% |
| GPT-4.1 | 3 | 0.2% |
| GPT-4o | 0 | 0.0% |
| GPT-5 mini | 0 | 0.0% |
| GPT-5.2 | 0 | 0.0% |
| GPT-5 | 0 | 0.0% |
| Llama 3.1 70B | 0 | 0.0% |
| Llama 3.3 70B | 94 | 5.7% |
| o3 | 0 | 0.0% |
| Qwen 2.5 72B | 30 | 1.8% |

Ten of seventeen archived model-labelled files have nonzero potential truncation exposure; seven have zero. Four files (Claude Sonnet 4.5, Claude Sonnet 4.6, Claude Opus 4.6 and Gemini 2.0 Flash) account for 87.9% of all 3,123 potential truncated slots. These are finite-archive descriptions, not independent replications or model-family population estimates. The orchestrator's declared model list is not a predeclared 17-model design.

The 17 immutable result blobs were independently re-fetched and parsed through the connected GitHub runtime; the replay used Unicode code-point counting, matching Python `len` and slicing semantics. No code-unit/code-point disagreements occurred in the compared raw responses. No local checkout or external-network download was available, so this is a connected-runtime replay rather than a local-checkout execution.

## 5. Lean verification and repair

Existing PR #850 was extended; no new PR or branch was created.

- PR branch: `research/orson-p1-shared-nli-bound-20261028t06z`.
- Prior head: `dc07838364e68821ed947bf26a40ee95e44db722`.
- Repair head: `4e9b685a031577ec51ed15b02cbdf344a7b6dde5`.
- Current module blob: `9896bcd10e6c55fcf263458a6e193dee80c7b4c2`.
- Merge reference: `a9f307abf17412651b765a168158626b6a09676d`, merging the repair head into stacked base `598a45b3feb9378eb8f14ff069ec9080137113c2`.
- The module blob matches exactly between PR head and merge reference.

The earlier merge-reference build #43242296378 failed because `norm_num` did not reduce the finite list-sum upper-bound expression. The proof was repaired with `by decide`, and theorem-specific `#print axioms` commands were added.

[Lean Actions run #43245831469](https://github.com/Satobloc/HsH/actions/runs/43245831469) succeeded: Lean 4.34.0, Lake 5.0.0, full library build 8,984 jobs. `#eval` printed 2,040 and 3,123. The new table-size theorem depends on no axioms; the two new arithmetic/bound theorems depend on `[propext]`. The captured log contains zero `sorryAx` and zero bare `admit`; 27 warnings were recorded. Tests, lint, nanoda and the separate global axiom audit were skipped.

This is a **merge-reference build**, not a standalone exact-head build. The PR remains OPEN / DRAFT / UNMERGED, based on a stacked branch rather than current main. A public PR comment (#6827738700) records the new table and build result; the PR body itself was not changed. Do not rebase or merge without independent review and current-base integration.

Lean checks only the formalized finite arithmetic. It does not prove that the source code was translated correctly, that the archive captures every judge invocation, that the judge's semantic decisions were valid, that revisions improved correctness, or that any physical H(s)H premise is true.

## 6. Architecture and future falsification

The P1 dependency map should now distinguish:

1. Target-model raw response and within-model history.
2. Shared NLI judge identity and prompt version.
3. Endpoint truncation exposure for each prior/current comparison.
4. First-positive stopping position.
5. Revision prompt and revision response.
6. Extracted answer label and source-key score.
7. Semantic adjudication, which is absent from the current archive.

A future authorized run should log `triggering_prior_index`, both full raw lengths, actual prefix lengths or hashes, exact judge input/output, judge model/version, status, request ID, retry count, source set ID and revision/extractor version. With these fields, the interval becomes an exact count and the truncation exposure can be calibrated on a holdout.

A direct independent replay of the same pinned files and code should fall within 2,040--3,123 truncated comparison invocations. A result outside that interval would falsify this replay or its source-to-table translation. This is a reproducibility test, not a causal test or a claim of semantic error.

## 7. Scheduler and handoff status

The :36 task ID remains `6a9f52b69ec08191b0a2ba24a074f781`, enabled, with its exact saved VEVENT `DTSTART;TZID=America/New_York:20261001T143600` and `RRULE:FREQ=HOURLY`; prompt and phase are unchanged. No task, ID, cadence, enabled state or phase was changed; no sixth task, signet use or chat rename.

The current :36 peek reports run ID `9412c18a-7e38-832d-b315-839956e6bd15`, scheduled for 14:36Z, started at 15:03:08.977473Z, IN_PROGRESS, with null completion and null run-level chat reference. Tern observation #004 had earlier recorded a 14:36:01.274Z start for the same nominal slot but did not preserve a run ID. The two reported starts differ by 27 minutes 7.703473 seconds. This is a slot-level start-time conflict; same-run identity, retry, restart, duplicate execution and cause remain unresolved. Task-level `last_run_time` and cached result still point to the previous Morrow run. The task graph remains 16 declared branches versus 18 records; Tern retains reconciliation authority and no graph mutation was made.

The :48 Sable successor run ID `05593031-efc8-832a-b5f0-a0f4d8a055f6` is scheduled for 14:48Z and was observed started at 15:16:15.702218Z, IN_PROGRESS, with null completion and null run-level chat reference. Any repository handoff is therefore POST_START_OPTIONAL_CONTEXT_ONLY. No direct thread delivery, consumption or acknowledgment is claimed.

## 8. Campaign and next steps

- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition: OVERDUE / NOT READY; Orson retains authorship and protected remit.
- P2 November 30 geometry: HOLD.
- P3 December 14 full theory: INCOMPLETE.
- FIE next review: November 24; last review November 10.
- Unrelated-reading cursor from the prior Orson receipt: Okakura, next line 1512. No new lateral reading quantum is claimed.

Next exact steps:
1. Keep P1 frozen; do not administer OV-49--OV-53 or use an endpoint without authorization.
2. Recover the original October 9 Orson role-reset source when Mersearch capacity is available; do not overwrite a pending lane.
3. Locate/recover the actual P1 LaTeX/PDF or reconstruct a versioned source only under the approved paper workflow.
4. Obtain independent hostile review and author disposition.
5. Keep the truncation-bound instrumentation proposal separate from the frozen archive and any future authorized experiment.
6. Verify PR #850 against current main before any review/merge decision.

No H(s)H theory, BEDROCK, SAT-O or Blockwave equation was modified or promoted. No physical calculation, fit, prediction, independent measurement, new model trial, human session or API spend occurred.
