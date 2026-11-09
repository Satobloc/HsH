# h716:s4 Supplement 01 | Review-MIND, source-independence and current Lean provenance

**Nominal slot:** 2026-11-09T20:48:00Z  
**Run key:** `REVROT3-19-20261011:716:s4`  
**Selected ring label:** Tern Rook, index 12  
**Next ring label:** Morrow, index 13  
**Class:** additive QC supplement to the already verified h716 report and receipt. This is not a second activation identity, new task, new paper, or ownership transfer.

## 1. Authority and source boundary

The nominal hour is derived from the scheduler's `scheduled_for=2026-11-09T20:48:00Z`, not the delayed start time. Thus h=716, seq=3584, index 12. The deterministic label does not authenticate a current Tern thread.

Tern's recoverable historical remit is Comptroller/control-plane stewardship. The direct user messages recovered in the Ariadne raw export are `c4f0aae9-3290-42c6-a5d0-b42c19a88255` (Comptroller controls committed scheduled tasks) and `e689eb6e-5814-4a27-a366-796605bd5f4d` (allocation across hourly leases and workflow/state inspection). No standalone Nathan-authored Tern charter or authenticated current Tern thread was recovered. The Review-MIND lane overlay supplies this run's cognition-QC assignment; it does not transfer Orson's ownership.

The live control-document blob identities remain those recorded in the base h716 report: BEDROCK `0253ace674bbc361464b7bbaac2c41aa3d8e8867`, Primary Operational Guideline `a8e333b1d5b5aa1d9772366945dd88769d24153c`, Steering Charter `04822f3e48f746e9e464d893636ed4a670d68683`, Three Paper Campaign `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`, three-repository onboarding `fe40260cda5ce360909f2adfd64a3cc3e2c92a05`, and task graph `9e9f1b896fd5d4320a7b0142ddc3f8d9c524339c`. Current HsH main is `2877d4a36c5ea428bbad9e01e31e25d963d906b5`; the intervening commit is an automatic public-display refresh. The task graph still declares 16 branches while containing 18 records. Tern retains reconciliation authority; this supplement does not edit the graph.

All four Mersearch request lanes remain occupied/requested. The existing Tern role request was reused; no new query, request, overwrite or rerun was made. Repository code search and direct reads of already-pinned public sources are supplementary retrieval, not a claimed Mersearch result.

## 2. Orson PR #1115: new formalizations, not yet compiled

PR #1115 is OPEN / DRAFT / UNMERGED. Current head is `7e3b3e5e1ac9933cd6a7c0f5c42879b469f34c7e`; its base is `0efbc7ae1577c37ee36b6bcdb4a0fb7c17ee619c` on `research/orson-p1-shared-nli-bound-20261028t06z`. GitHub currently reports `mergeable_state=dirty`. PR #850's current head on that base branch is `3bb0c57b56e1eff49139dcc21fcfe518a7717b8d`, 53 commits ahead of the recorded PR #1115 base. No workflow run is recorded for PR #1115's current head. This is a stale stacked-branch/integration blocker, not a Lean proof failure. No rebase, branch update, workflow dispatch, or PR modification was attempted because this is Orson-owned work.

The three new modules received manual source and proof-shape review:

### `HumanAIGroupsSessionConfounding.lean`

The algebraic claim is sound conditionally. If a treatment level occurs in exactly one group, its treatment indicator equals that group's indicator. A treatment coefficient can then be shifted into the group fixed effect without changing fitted values, so those coefficients are not separately identifiable in that design.

The source-reported human counts `[24,21,16,12,6,16,16,16]` and complementary agent slots `[0,3,8,12,18,8,8,8]` sum to 127 humans and 65 agent slots, or eight 24-person groups. The exact condition-to-session mapping remains a source inference, not a Lean theorem. The theorem must remain conditional on one group/session per treatment level; it does not establish the empirical mapping or prove the study's reported estimates invalid.

### `HumanAIGroupsTemporalExposure.lean`

The module correctly separates current-pair alignment from prior visibility. In Chen et al.'s study, the S6 directional score compares a participant's round-r change with the current partner's prior-round embedding. Participants were rematched, and the interface retained recent partner descriptions for up to five rounds. A current pairing or positive directional score alone does not prove that the target saw that source message before acting.

The generic `PriorVisibilityWitness` is a useful formal contract, but it is not yet an empirical provenance record. Its `sourceMessageVisibleToTarget : Prop` and proof field are not bound to a source-output ID, target/session ID, visibility-log ID, payload hash, interface version, or immutable evidence path. Before using it to classify actual exposure, bind the witness to those records and require the source artifact to be visible before the target action. Visibility is necessary evidence for exposure, not sufficient evidence of causal uptake.

Keep the paper's M4 and S6 quantities separate. M4 compares a participant's change with the current partner's current-round embedding; both current-round submissions precede disclosure of the partner's response. M4 is therefore a contemporaneous alignment statistic, not direct evidence that the participant adopted that not-yet-seen response. S6 uses a lagged partner embedding and raises a different, recordable prior-visibility question. Source: Chen et al., arXiv:2609.02122, Methods and Supplementary Information.

### `HumanAIMemoryCarryover.lean`

The saturated 2x2 mean-model algebra is sound conditionally. If only the diagonal persona/history cells are observed, the persona and history main effects are aliased with their sum and interaction. All four cells identify the four coefficients algebraically.

This is design identifiability, not causal identification or an empirical result. The TRAIL platform's support for persistent identities and reflective memory does not establish that a particular study carried memory across session boundaries rather than resetting or cloning it. The persona conditions are multi-component bundles; name the factor as a persona-bundle assignment rather than implying one isolated trait. The experiment's memory policy and actual carryover state require explicit source records.

**Formal status:** none of these three new modules has a current-head Lean 4/Mathlib run. No local Lean, Lake or Elan executable is installed in this runtime. The prior successful PR #850 build is a different branch/run and does not compile these modules. Manual inspection is not compilation; no theorem is marked Lean-verified here.

## 3. A useful taxonomy for avoiding false cross-agent consensus

The current evidence supports at least five distinct designs. They must not be collapsed under the generic label “multi-agent consensus”:

1. **Within-model self-history:** ConsistencyBench CGD compares a model with its own earlier responses through a shared evaluator. This is self-exposure/revision, not cross-model peer influence.
2. **Human-team augmentation:** the P&G field experiment randomizes human individuals and two-human teams with AI access. AI is not a third autonomous team member.
3. **Human-LLM group interaction:** Chen et al. study actual mixed human/LLM groups. Interaction and influence claims require round-level visibility evidence, not just similarity or a current pairing.
4. **Parallel model ensemble:** the pinned Pauper Consensus source runs separate model generations and aggregates them; it does not pass one model's output into another model's prompt. Its registered primary analysis calls `align_anchored`; `align_free` is exploratory. The Orson PR #850 transitive-closure and order-sensitive top-k theorems describe the exploratory `align_free` path, not the registered primary analysis. They are conditional code/graph results, not a finding about the primary benchmark.
5. **Memory-mediated continuity:** a platform may support persistent identity or long-term memory, but actual carryover requires a logged state transition and a documented reset/carry/clone policy.

A second independent example is “LLMs as a Jury” (arXiv:2607.10139). Its authors explicitly state that jurors never see one another's work; it is a parallel panel, not interactive deliberation. The paper measures mean accuracy, pairwise error correlation and a shared-misconception floor. Its “parameter-free” law uses those measured panel statistics; it is not parameterless and does not establish independence of every upstream source, prompt, evaluator or aggregation stage.

A provenance graph for future cognition work should keep separate nodes/edges for: task and shared source; agent/model identity and run; source-output artifact; peer visibility event; target revision/action; shared evaluator; aggregation/cluster operation; human intervention; and memory snapshot carried into a later session. Agreement after aggregation is a statistic, not proof of independent corroboration or peer interaction.

### Disconfirming experiment proposal, not a trial

A future consented/privacy-preserving study could hold tasks, source material, prompt family, evaluator and aggregation fixed while randomizing the exposure graph: independent parallel generation, one-way peer exposure, reciprocal sequential exposure, and human-mediated review. Cross this with memory reset, carry, and cloned-state conditions where technically and ethically appropriate. Preserve source-output IDs/hashes, visibility-event IDs, target-action IDs, timestamps, session IDs, interface version, and memory-snapshot hashes.

Measure accuracy, pairwise error correlation, shared-error rate, calibration, revision direction, source attribution, abstention, and false-consensus rate. Disconfirming outcomes include agreement increasing without accuracy, peer exposure adding no effect after source/evaluator controls, memory carryover adding no incremental effect, or common evaluator/aggregation artifacts explaining the apparent agreement. No participant, model trial, output, or result is claimed from this proposal.

## 4. Cross-lane Lean and physical-evidence status

- **PR #850:** current head `3bb0c57...`; run #42416933193 succeeded on PR merge reference `17c3d740...`, 8,983 jobs. This is not an exact-head standalone build; tests, lint, nanoda and global axiom audit were skipped.
- **PR #1115:** current head `7e3b3e5...`; no workflow run; dirty/stale stacked base. No compile result.
- **PR #1133:** current head `891163566eff9a37e44972cf987c14a583f7f905`; run #42672531085 concluded FAILURE, but the Actions jobs endpoint returned zero job records. No job log or Lean proof failure is available; classify as workflow failure, cause undiagnosed.
- **PR #993:** run #42330897900 checked out `refs/remotes/pull/993/merge` at merge commit `32cd73bc...`, Lean 4.34.0 / Lake 5.0.0, 8,952 jobs succeeded. Tests and lint were skipped. This is a merge-reference build, not exact-head verification.
- **P2 physical lane:** issue #565 remains HOLD with no selected measured system. No raw-data analysis, physical calculation, fit, prediction or independent measurement was performed.

## 5. Paper and scheduler gates

Orson's P1 remains OPEN / NOT READY and Orson-owned. Issue #564 remains open; PR #850 remains draft/unmerged. The P1 gate still lacks a canonical repository manuscript, readable PDF/reader, and independent hostile review. PR #1115's new formalizations do not satisfy those gates and do not authorize a new model trial. November 30 P2 and December 14 P3 remain separate. No manuscript, PR, issue, branch, or owner was changed.

The latest read-only scheduler observations are:

- **:48 Tern h716:s4:** task `6aa6c3bc02b48191b8a91a30d2a155e0` remains enabled at its original hourly America/New_York :48 schedule. The same run ID `32591753-5174-8333-9314-dab824ee3a1b`, scheduled 20:48Z, is now reported IN_PROGRESS with `started_at=2026-11-09T21:43:59.279064Z`, `completed_at=null`, `chat_ref=null`. Earlier observations for this same run ID were FAILED at 21:11:58Z and IN_PROGRESS from 21:14:52.161Z. No attempt ID or backend cause is exposed. Do not infer retry, restart, duplicate execution, identity, or completion. The cached latest_result still belongs to h712 Enheduanna, not this run.
- **:00 Morrow h717:s0:** run `d884f10d-3b74-8332-ac50-0005f97ac1ac`, scheduled 21:00Z, is now recorded COMPLETED at 21:48:58.967026Z with a chat_ref. That scheduler field does not authenticate the historical Morrow identity or prove that the late optional h720 handoff was consumed. The next Morrow appearance remains h720:s4, 2026-11-10T00:48Z.

The existing Morrow h720 packet remains late optional context only. No task, response obligation, ownership transfer, cross-thread delivery, or recipient consumption is claimed.

## 6. Unrelated reading and non-actions

Continued Babbage on the exact HSH_RESOURCES blob `fa52e41ab73566a13109a0a7aeaed3e895b41163`, lines 1521-1560. Next cursor: line 1561 on that same blob. The current path resolves to a different blob; do not transfer the cursor to that new version without a crosswalk. FIE rereview is due 2026-11-10, not yet due.

No new Mersearch request, public issue, publisher submission, Lean module, workflow dispatch, local tool, branch, PR, physical calculation, model trial, human session, task, automation, schedule, phase, cadence, signet, or conversation rename was created or changed. The existing task graph and all five original scheduler IDs remain untouched; :12 remains disabled.
