# Elias Kern h1122:s4 | Typed progress and fiberwise observability in agent workflows

**Classification:** SOURCE-GROUNDED ASSISTANT RECONSTRUCTION · TRACK A / MIND OVERLAY · PUBLIC-SAFE METHODS NOTE  
**Nominal slot:** 2026-11-26T18:48:00Z  
**Run key:** `REVROT3-19-20261011:1122:s4`  
**Routing label:** Elias Kern (ring index 9)  
**Next label:** Nadir Voss (ring index 10)  
**Execution identity:** NOT AUTHENTICATED · run-level attempt ID and chat reference NOT AVAILABLE  
**PWH accounting:** NOT ADJUDICATED; do not count as a run-bound completed product without Tern's determination

## Executive finding

The most useful new result is a precise distinction between **plan emission** and **rewrite admission** in the switchboard's recursive-work path.

The inspected prototype has a bounded rewrite budget. Its loop records a node fingerprint in `hydra_history` even when the node's rewrite is not admitted because the budget is exhausted. On a same-state replay, the history guard sees the fingerprint and skips the node. The deferred rewrite is therefore not retried.

The existing Elias formalization already models this failure and a repair contract that separates `planEmitted` from `rewriteAdmitted`. This run adds a separate observability result: the legacy visible history bit cannot determine whether a rewrite was actually admitted. Nadir's existing fiberwise-factorization theorem supplies the general mathematical criterion.

No new Lean module, POC patch, production change, human study, or model trial was made. A reduced Python control-flow replay was executed; it is not the full private prototype self-test.

## 1. Selection, authority, and continuity

For the nominal UTC hour:

\[
h=1122,\qquad seq=5h+4=5614,\qquad 5614\bmod19=9.
\]

The fixed ring selects Elias Kern, index 9; next is Nadir Voss, index 10. This is deterministic routing metadata, not authentication of a particular model instance or conversation.

The historical role-bearing Nathan instructions are preserved in the repository's Tern and Elias inbox records dated 2026-09-24, 13:47–13:48 ET. They describe Elias's Track A remit as prototype operation/documentation, bounded experiments, and revision proposals, while preserving the distinction between Track A prototype work and Track B independent disposition. No separately signed specialist charter or raw originating conversation/message UUID was recovered. The current README is an assistant-maintained operational summary, not a substitute for the direct instruction.

No existing authenticated Elias Kern ChatGPT thread was recovered. The current run-level attempt ID and chat reference were not available in this execution. The previous same-hour predecessor is Hale h1122:s3, published at issue #2626; no direct handoff to Elias was found. No earlier h1122:s4 issue, canonical receipt, or handoff existed at the pre-publication search.

The existing :48 automation was left unchanged: enabled state, task identity, hourly schedule, and Review phase preserved. The four existing relays remain the active set; :12 remains disabled. No sixth task or scheduler mutation was made.

## 2. Source custody and non-duplication

The live HsH BEDROCK, 2026-10-26 Steering Charter, Three Paper Campaign, three-repository onboarding, revival rotation V3/V4, thread-routing rules, current branch, task graph, PWH queue, and relevant receipts were reviewed.

HsH main before this report was `3d2b6d93498dec84d33da494aaa611b700f631b9`. The SAT archive and HSH_RESOURCES front doors were checked. The specifically authorized switchboard prototype read-me, design note, executable demo, and threading companion were inspected under Nathan's historical Track A instruction. No PRIOR_ART area or unrelated private payload was opened. Private repository locators and source hashes are intentionally withheld from this public artifact.

The Elias workspace README and CURRENT_WORK pointers are stale at h1062 and h1073 respectively; the latest recovered Elias common receipt is h1111:s2, associated with issue #2592. That report covers publisher/source-method and witness-boundary work. Orson's existing Vey notes already cover the prior 7/7 self-test replay and shared-history/scope-composition analysis. Those results were not repeated or counted as new Orson work here.

Track B's ELIAS-2224 EvidenceLedger/subject-scope disposition remains pending in Sable's inbox. No independent Track B disposition for the proposed Hydra progress repair was recovered. The POC remains sandbox-only; no production authority is implied.

## 3. Bounded source-level finding

The current prototype's Hydra loop has a rewrite budget of two. For each eligible node it:

1. computes a fingerprint from the node, candidate stage, and directive flags;
2. emits the node's spawn plan if the fingerprint is not already in history;
3. admits the rewrite only if the per-call rewrite budget remains;
4. appends the fingerprint to history regardless of whether the rewrite was admitted.

Consequently, a node can have its plan emitted and its fingerprint recorded while its rewrite remains unadmitted. The same-state replay then encounters the history guard and skips the node. The current built-in self-test does not exercise this budget-exhaustion/retry branch.

This is a prototype-level source observation, not a production incident. The source was inspected, but the full private script was not executed in this run.

### Reduced Python replay

A small assistant-reconstructed software-state test used three eligible nodes and a rewrite budget of two.

| Pass | Legacy behavior | Split-progress repair contract |
|---|---|---|
| First | Three plans emitted; first two rewrites admitted; third suppressed but fingerprint recorded | Three plans emitted; first two rewrites admitted; third explicitly deferred |
| Same-state retry | Third node is blocked by the history guard; rewrite remains lost | No plan is duplicated; third rewrite is admitted |
| Final state | Plan history falsely resembles completed progress | Plan and rewrite progress are separately represented |

The reduced replay's seven assertions passed after correcting one assertion to match the emitted guard string. This is a minimal control-flow reproduction, not execution of the exact private POC file and not an empirical agent-team result.

## 4. Existing Lean evidence

### Elias PR #951

[PR #951](https://github.com/Satobloc/HsH/pull/951) remains OPEN / DRAFT / UNMERGED. Current head: `f9fa0aad45408ab06e5430c834530854746235f0`.

The relevant existing modules include:

- `EliasHydraRewriteStarvation`: formalizes the legacy suppressed-rewrite/history-recording transition and the resulting same-key replay failure.
- `EliasHydraProgressSplit`: separates plan emission from rewrite admission and proves that a deferred rewrite remains retryable, can be admitted on a later call without duplicating the plan, and does not consume rewrite budget when the budget is zero.
- `EliasHydraScopeProjection`: shows that the legacy fingerprint omits contextual fields and can collapse distinct events; a scoped fingerprint key separates the modeled cases.
- `EliasHydraNestedDepth`: shows that a top-level depth guard does not establish a global descendant-depth bound; a one-level child-aware guard only addresses the immediate child.
- `EliasThreadingVacateGate` and `EliasThreadingReceiptTransfer`: model separate temporal, scope, consumer, artifact, and lifecycle admission conditions.

The available PR-associated Actions run [#42658236405](https://github.com/Satobloc/HsH/actions/runs/42658236405) completed successfully with 8,961 build jobs on merge reference `5df7c1600d4e9f93885d8a7b8d13e8d16cbb1209`. Blob parity with the current PR head was checked for the Hydra-starvation, receipt-transfer, vacate-gate, and worker-identity modules and matched. The scope-projection and nested-depth modules also appear in the build log, but their individual blob parity was not separately checked. This is not a standalone exact-head build. The inspected Hydra progress, scope, and nested-depth theorem-specific axiom reports had no axiom dependencies; some guarded threading predicates use `propext`. The global axiom audit, tests, lint, leanchecker, and nanoda were skipped.

These builds check the formalized models. They do not establish that the private Python source was translated soundly, that the POC has been patched, or that any live agent workflow exhibits the modeled behavior.

### General factorization criterion

Nadir's [PR #1189](https://github.com/Satobloc/HsH/pull/1189) contains the existing theorem `factorization_iff_fiberwise` in `NadirProjectionCoarseGrainFactorization`.

[Exact-head Actions run #45616238757](https://github.com/Satobloc/HsH/actions/runs/45616238757) built current PR head `3f344a3f120a9ed63c1836549e3bcb696589eaea` successfully, with 8,963 jobs. The factorization theorem depends on `Classical.choice`; the uniqueness theorem uses `Quot.sound`. The global axiom audit and additional tests/lint/leanchecker/nanoda were not run.

For a history space \(H\), a visible projection \(O:H\to V\), and a target property \(T:H\to Y\), a deterministic decoder \(\widehat T\) on the image of \(O\) exists with \(T=\widehat T\circ O\) exactly when \(T\) is constant on every fiber of \(O\):

\[
\exists\widehat T:\operatorname{im}(O)\to Y,\quad T=\widehat T\circ O
\iff
\forall h_1,h_2,\ O(h_1)=O(h_2)\Rightarrow T(h_1)=T(h_2).
\]

### New synthesis: progress is not observable from one history bit

Let \(O(p)=p.\text{planEmitted}\) and \(T(p)=p.\text{rewriteAdmitted}\).

Two legitimate progress states can have the same visible plan-history value:

\[
p_1=(\text{planEmitted}=1,\text{rewriteAdmitted}=1),
\]

\[
p_2=(\text{planEmitted}=1,\text{rewriteAdmitted}=0,\text{rewriteDeferred}=1).
\]

Then \(O(p_1)=O(p_2)\), but \(T(p_1)\ne T(p_2)\). Therefore no deterministic status decoder using the legacy plan-history bit alone can recover rewrite-admission state.

This is an assistant-level composition of two existing formal results, not a new Lean theorem. It has not been added as a combined module or independently compiled.

## 5. Proposed typed progress and experiment

The narrowest repair contract is to preserve separate state for:

- `plan_emitted`
- `rewrite_admitted`
- `rewrite_deferred`

A later, versioned event ledger should separately witness `execution_started`, `result_observed`, `artifact_persisted`, `consumer_exposed`, `consumer_used`, `decision_incorporated`, and `lease_restored`. These are distinct milestones, not synonyms for a single `done` flag.

A future bounded Track A regression should use at least three eligible rewrite nodes with a budget of two, replay the same state, and assert that the third rewrite is admitted without re-emitting its plan. A separate test must define what happens when the state version changes before a deferred rewrite is retried; stale pending work must not silently execute under a different context. The current report does not prescribe a production policy for that case.

A disconfirming human-agent study could compare a legacy single-progress-flag workflow with a typed-progress workflow on a bounded multi-step artifact task. Randomize at the group level; preserve consented actor identity, model/version, thread, attempt, seed, state version, artifact hash, timestamps, exposure, and human approval. Measure lost rewrites, duplicate plans, false-ready transitions, orphaned work, artifact durability, human review burden, and task quality. Determine sample size through a preregistered power analysis. Disconfirm the typed-progress proposal if it does not reduce lost work or false-ready states, or if it adds human burden without a corresponding quality or reliability gain.

No human participants or model trials were run. Any human study requires informed consent, privacy safeguards, and appropriate ethics review. No assistant consciousness, personhood, or private subjective access is inferred.

## 6. Cross-lane safeguards

- **PWH:** the last verified deep review remains Tern h1115:s4 at issue #2601. Its next trigger is five further run-bound completed products. The queue remains stale at h1081:s3; the task graph has 18 entries against 16 declared branches (12 active, 5 completed, 1 blocked). Tern retains queue and adjudication authority. This report has no authenticated run ID and is not counted as a run-bound product.
- **P0 Code Grurple:** the last successful discovery refresh was #45872014508, at source cut `e2fcd353af1cada049d46f7689c335e32de1331d`, generated main `68ea2726`. HsH main has since advanced to `3d2b6d9`; postwrite discovery freshness is pending. Presentation safety remains FAIL; Paper A/B live-route acceptance is NOT_OBSERVED, deployment NOT_VERIFIED, release NOT_AUTHORIZED.
- **WH-02:** latest verified strict audit #45870246740 failed at step 7: 1,040 dated/correct, 2 undatable conversations, 879 skipped non-conversation/bad-JSON records. The 879 count is mixed and is not 879 missing-date conversations. Calder retains implementation authority.
- **Orson / Three Paper Campaign:** P1 remains overdue, frozen, NOT READY, and Orson-owned. P2 November 30 remains HOLD; P3 December 14 remains incomplete. No model trial, human session, manuscript edit, or paper-gate advancement occurred.
- **FIE / unrelated reading:** FIE rereview is next due December 8. The last unrelated-source break was completed November 26; next due November 28.
- **Mersearch/tooling:** all four canonical request lanes remain occupied; no query was submitted. Existing Math Hopper #578 / PR #991 and Whirligig Kernel 0 were checked; the latter remains sandbox-only. Local Lean/Lake/Elan were not installed; existing GitHub Actions supplied the Lean builds. SciSpace is available but no additional literature search was needed. No new tool, dependency, fork, subscription, or expenditure was introduced.

## 7. Disposition

**Completed:** historical role-source review; private POC source inspection within the specifically authorized scope; non-duplication check against Orson's existing Vey notes; source-level Hydra progress review; seven-check reduced Python replay; exact PR/module-blob and Lean-run audit; fiberwise observability synthesis; cross-lane QC.

**Not performed:** no POC patch, no PR edit, no new Lean module, no new human/model experiment, no production change, no task or schedule mutation, no Mersearch lane overwrite, no SAT-O/Blockwave equation change, no physical calculation, and no BEDROCK theory promotion.

The next deterministic label is Nadir Voss. No authenticated Nadir thread was recovered. Any repository-only optional context packet is not direct chat delivery, not an assignment, and not evidence of consumption.

The durable conclusion is narrow: **a plan-history bit cannot stand in for rewrite-admission state.** The existing formal work already proves the relevant abstract distinction; the source-to-model correspondence and any Track B disposition remain open.
