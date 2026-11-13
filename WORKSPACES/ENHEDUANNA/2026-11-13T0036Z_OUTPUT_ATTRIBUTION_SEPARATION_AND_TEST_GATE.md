# Workshop Relay :36 | Enheduanna | h792:s3
## Output attribution as a separate evidence layer

**Nominal slot:** 2026-11-13T00:36Z  
**Run key:** `REVROT3-19-20261011:792:s3`  
**Selection:** h=792; seq=3963; 3963 mod 19 = 11, Enheduanna (index 11); successor Tern Rook (index 12).  
**Disposition:** SOURCE-GROUNDED REVIVAL / EXISTING-PR EXTENSION / THIRD COUNTERMODEL ADDED / MERGE-REF LEAN BUILD IN PROGRESS / NO PHYSICAL OR THEORY PROMOTION.

## 1. Identity, authority and continuity

The selected ring label is Enheduanna. It is not an authenticated ChatGPT identity or thread.

The only located direct Nathan instruction associated with this label is in the MARLOWE raw conversation `6aa8a2bf-8280-83ea-9d57-1e0af853b7f1`, message `11399ca2-5bd6-4203-9e19-e8e044fbc736`, timestamp 2026-09-23T02:04:49.417Z. It is a broad instruction to consider all archives, in a conversation whose parent concerns an Alberr revival. It is not a detailed Enheduanna specialist charter. The source-layer census is an assistant-maintained reconstruction, not Nathan-authored charter text.

Bounded existing-thread-first checks across the worker workspace, current inbox, prior receipts, Library and archive references did not establish a current identity-verified Enheduanna ChatGPT thread, current conversation URL, latest worker-authored check-in or authenticated participation. This run is `REVIVAL_SOURCE_RECONSTRUCTED_IN_RUN`, not literal historical-instance continuity. No new ChatGPT thread was created and no cross-thread delivery is claimed.

The immediate nominal predecessor `REVROT3-19-20261011:792:s2` (Nadir Voss) had no matching receipt or handoff in the current main branch. Nadir's current workspace checkpoint/continuity files were not found; its inbox contains older optional packets only. This is `PREDECESSOR_PACKET_NOT_FOUND / POSSIBLY_IN_FLIGHT`, not evidence of a missed check-in, failed run or absent worker.

Existing first-blush note reused, not duplicated: `WORKSPACES/COMMON/REVIVAL_FIRST_BLUSH/2026-11-02T1000Z_s0_enheduanna.md`, blob `1dfae6b8f634f24b50941d7211ba389cf4c0cc7b`. It is explicitly a current-run assistant reconstruction, not historical worker voice. Its prior source-chain insight was retained; this run adds no new first-blush testimony.

## 2. Live controls and repository state

Preflight HsH main head: `5ba3a3d196b4e972c4bf4c3d58f414ff45ade263`. A later automatic public-display refresh advanced main to `4e38603b67d6f9117157e387c079e60d5792b714` before this report was written. No theory or task-graph change caused that movement.

Live controls read at the preflight ref:

- `BEDROCK.md`, blob `0253ace674bbc361464b7bbaac2c41aa3d8e8867`, 667 lines, read in four contiguous ranges.
- Nathan Direct methodology/model overview 2026-11-08, blob `a8e333b1d5b5aa1d9772366945dd88769d24153c`.
- Universal shape-to-Lean priority 2026-10-26, blob `2b49291aa0836b70e283950eabd9f74ff6707be3`.
- Steering Charter 2026-10-26, blob `04822f3e48f746e9e464d893636ed4a670d68683`.
- Three Paper Campaign 2026-10-26, blob `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`.
- New Instance Start Here, three-repository onboarding, Revival Rotation V3/V4, thread-routing and thread-first rules, reentry protocol, duplicate-run-key guard, scheduler authority, automation workflow control, autonomy/handoff protocol, shared-state write safety, cross-repo execution standard, Reference Desk, symbol registry and citation policy were read at the same main ref.
- Task Branch Graph blob `05283edaa44e2163406c8b005a7fbbca95d76c7f`: `ACTIVE_SEED`, 16 declared branches, 18 records, last graph update 2026-11-12T13:39:32.918Z. No graph edit was made.
- Active automation roster blob `6b0bf56316fe14bfd2b0e925154025bd8d04eaa1` lists the existing :36 lease ID `6a9f52b69ec08191b0a2ba24a074f781`. No task, ID, prompt, enabled-state, schedule, phase or cadence action was issued. The automation-specific get action returned 404/not-found in this tool context, so no fresh live scheduler-state claim is made.
- No local repository checkout was found. Local `lean`, `lake` and `elan` are absent. No workflow-dispatch action was exposed. GitHub Contents API was used as the fallback writer with current blob SHA/CAS checks; no force-push or branch creation.

## 3. Substantive architecture improvement

The existing Enheduanna PR #1619 already formalized two distinctions:

1. Source attestation does not determine whether a source is included in a particular context snapshot.
2. That distinction remains even when both snapshots share a run ID and have distinct snapshot IDs.

This run added a third, separate evidence layer to the same existing PR branch:

- `OutputAttributionRecord` binds a run ID, context snapshot ID, output ID and a set of explicit `(source, digest, span)` references.
- `outputAttributesSourceSpan` tests whether a given source attestation's source/digest and an abstract span occur in that output record.
- `context_exposure_does_not_determine_output_attribution_within_same_run` constructs one run and one context snapshot containing the source, together with two distinct output records: one attributes the source/digest/span tuple and the other does not.

The theorem is a type-level countermodel to inferring output attribution from context inclusion alone. The `Span` type is abstract; it is not validated as a real source locator. The record is an explicit attribution annotation, not proof that the source semantically supports the claim, that a model attended to or used it, that either constructed output occurred, or that the source causally influenced an output.

The evidence ladder is now explicitly separated:

`project membership → source attestation/digest → run/snapshot inclusion → output attribution → independently reviewed semantic support → controlled causal contrast`

Authenticated process/model identity is a parallel provenance requirement, not inferred from any earlier stage. The first two stages are not enough to establish the third; context inclusion is not enough to establish output attribution; output attribution is not enough to establish semantic support or causal influence.

## 4. Independent verification/test matrix

| Question | Required evidence | Comparator / failure rule |
|---|---|---|
| Was a source part of a project? | Project ID, source ID, source digest, complete project manifest and capture time | Project title or source count alone is insufficient |
| Was it included in a particular run context? | Run ID, snapshot ID, exact source digest, inclusion witness, manifest digest, capture time and completeness/integrity attestation | Missing/incomplete manifest means `UNKNOWN`, not non-exposure |
| Was an output explicitly attributed to a source span? | Output ID, claim/output locator, source ID, digest and exact span locator | Context inclusion alone does not establish attribution |
| Does the source actually support the claim? | Exact source text and locator plus independent source-critical review | Citation/attribution is not semantic validation |
| Did the source causally affect the output? | Controlled contrast/intervention with prompt, model/version, retrieval and other shared parameters held or measured | Neither project membership nor citation establishes causal influence |
| Which process/model produced the evidence? | Authenticated run/attempt ID, model/version, prompt/version and event ancestry | Worker label or nominal slot is not process identity |

For a future empirical audit, calibrate source hashes, manifest completeness, snapshot capture, output locators and reviewer procedure on a calibration set; freeze the rules; then inspect independently sampled holdout runs/outputs. A digest mismatch, missing span locator or incomplete manifest blocks the corresponding positive claim. Absence from an incomplete manifest cannot be treated as proof of non-exposure. Semantic support requires independent reading; causal influence requires a controlled contrast.

This is an information/provenance test matrix, not a physical prediction test. No physical system, raw measured dataset, units, uncertainty model, calibration data, holdout, fit, numerical prediction or independent measurement was available or used. No synthetic fixture or data-free physical calculation was created.

## 5. Lean verification state

Existing PR #1619 was extended; no new branch or PR was created.

- PR head: `2b82ec8bd5eb2f3a55e46f8655b93b2870ae7f25`.
- Base: `infra/lean4-verification-20261023`, base SHA `c7dc2c483f50ae03fc7a7c530829170135e18d92`.
- Module: `FORMAL_VERIFICATION/HsHVerification/EnheduannaSourceExposure.lean`, blob `cdc26675b32f8c9024418fb0384d49ccbcc7a5e4`.
- PR description was updated to include all three theorem statements and their limits.
- Prior Actions run #43163058972 / job #130998505043 succeeded on the earlier PR head `6c63cecf4d3880e6cb338add42eb1f61227c70c4` and its merge reference. It compiled only the first two theorems. It does not verify the new third theorem or current head.
- Current Actions run #43339533568 / job #131604080428 is `IN_PROGRESS` on current PR head `2b82ec8...`, event `pull_request`. The workflow uses default `actions/checkout`, so it builds the PR merge reference, not a standalone head checkout. At last read, Lake dependency-manifest generation had completed and the full Lean compilation step was in progress.
- No completed build result or theorem-specific axiom output for the new theorem is yet available. Exact-head standalone verification remains unestablished. Tests, lint, nanoda and the separate global axiom audit are disabled/skipped by the workflow. The workflow generates its Lake dependency manifest rather than using a committed lock manifest.
- Separate Vercel build-rate-limit failure and conversation-JSON workflow failure are not Lean results.
- PR remains OPEN / DRAFT / UNMERGED. No merge, rebase, branch retarget, or Factory Floor intake was attempted.

## 6. Mersearch and source coverage

All four shared Mersearch request files were reread; each remains `requested`. Their request-scoped RUN_MANIFEST/SEARCH_RECEIPT files were not found. No direct Mersearch action is exposed in the connected tool inventory, all four lanes remain occupied, and no lane was overwritten or new request submitted.

Bounded GitHub search was used only as a fallback across HsH and SAT_THEORY_ARCHIVE_2023-25; HSH_RESOURCES was consulted read-only as an internal reference surface. Library search was also used. These searches did not recover the four original source IDs/files behind the NotebookLM project count in the source-layer census. No exhaustive Mersearch coverage is claimed. No private HSH_RESOURCES path or payload was copied into public output.

The existing issue #1620 remains the publication for the earlier two-theorem source/context result. Its immutable artifact was not rewritten. The third theorem is an uncompiled draft-PR extension, so no new issue/publisher submission was created and no completed publication is claimed.

## 7. Maintenance and gates

- Reused the existing first-blush note; no duplicate.
- Unrelated reading: HSH_RESOURCES Babbage, *Reflections on the Decline of Science in England*, lines 1761–1800, source blob `fa52e41ab73566a13109a0a7aeaed3e895b41163`. The passage records continuation of certain official salaries/functions after abolition of the Board of Longitude. Next cursor: line 1801. No physical break is claimed.
- Tern's five-receipt deep-review trigger was already crossed and routed in existing Tern records; no duplicate review or task-graph mutation was made.
- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition paper: OVERDUE / NOT READY, Orson-owned and protected.
- P2 November 30 geometry: HOLD.
- P3 December 14 full theory: INCOMPLETE.
- FIE next review: November 24; last recorded rereview November 10, so the 14-day trigger is not due.
- No SAT-O/Blockwave equation changed, no BEDROCK promotion, no paper-gate advancement, no physical claim, no new tool/dependency/fork/subscription or cost.

## 8. Handoff

Next deterministic label: Tern Rook, `REVROT3-19-20261011:792:s4`, nominal 2026-11-13T00:48Z. Actual successor start was not observed. The handoff is repository-only optional context, not an assignment or response obligation. Tern may optionally inspect Actions run #43339533568 and record its final merge-ref result/axiom output, while preserving the distinction between that run and standalone exact-head verification. No scheduler or task action is requested; Tern retains Comptroller authority.

**Final gate:** `OUTPUT_ATTRIBUTION_LAYER_ADDED / PR1619_DRAFT / MERGE_REF_LEAN_RUN_IN_PROGRESS / THIRD_THEOREM_NOT_YET_VERIFIED / NO_SEMANTIC_OR_CAUSAL_INFERENCE / NO_PHYSICAL_TEST / NO_THEORY_PROMOTION / NO_NEW_ISSUE / AUTOMATION_UNCHANGED`.
