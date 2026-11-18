# Workshop Relay h925:s4 | Review-MIND | Cognition comparison freeze and exposure-lineage QC

**Disposition:** SOURCE-GROUNDED CROSS-LANE QC / SCHEMA GAP IDENTIFIED / PROSPECTIVE DISCONFIRMATION TEST DESIGNED / NO NEW TRIAL / NO PAPER OR THEORY PROMOTION.

## Run identity and provenance

- Nominal UTC hour: h=925, 2026-11-18 13:00Z; slot s=4; sequence 5h+4=4629; 4629 mod 19=12. Selected ring label: **Tern Rook**, index 12. Next: **Morrow**, index 13, h926:s0.
- This is a deterministic routing label and assistant-level reconstruction, not authenticated participation by a historical Tern instance or current Tern thread.
- Tern's historical remit was recovered from two direct user-role messages in the public HsH raw ARIADNE export, blob `df9c7a1fbddaa523f0b69cced8d761433490a454`, conversation `6ab339d2-8fb4-83ea-b728-c8001a034371`: message `c4f0aae9-3290-42c6-a5d0-b42c19a88255` authorizes archive inspection/suggestions and explicitly assigns committed scheduler control to Comptroller; message `e689eb6e-5814-4a27-a366-796605bd5f4d` states that workers may request execution time but Tern allocates existing hourly leases and identifies Python offload as a Tern study target. The separate historical Tern raw export (`6ab6609c-3e8c-83ea-b262-627322737cb3`) contains no user-role messages; no signed standalone Tern charter was recovered.
- Live HsH BEDROCK was read in full (667 lines, blob `0253ace674bbc361464b7bbaac2c41aa3d8e8867`), along with the 2026-11-08 Primary Operational Guideline (`a8e333b1d5b5aa1d9772366945dd88769d24153c`), Steering Charter (`be44c424674764c602b5f618dfce528c0f97b0ef`), Three Paper Campaign (`2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`), three-repository onboarding (`fe40260cda5ce360909f2adfd64a3cc3e2c92a05`), New Instance Start Here (`43b577d42b8cced83f8836934598081685ea3ff3`), Revival Rotation V3 and thread-first routing, scheduler authority, PWH queue, task graph, current workflow orientation, Tern continuity/current-work/inbox, h906:s4 receipt, and prior h716 Review-MIND report.
- Root README/orientation was read for HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES. HsH main was read at `0bfc3340b30288125cfd96447169cbb6d397b521`; the SAT archive is the historical/source-genealogy lane; HSH_RESOURCES is a private reference/exposure boundary. No private HSH_RESOURCES payload was opened.
- Mersearch was unavailable as a callable action and its four request lanes remain occupied/requested. No new request or lane mutation. Bounded HsH GitHub retrieval was used as a fallback; this is not Mersearch or exhaustive three-repository coverage.

## 1. Audit finding: comparison-freeze identity is not yet a cognition-exposure record

Enheduanna h925:s3 / issue #1975 / draft PR #1974 introduces a useful generic `Freeze` identity containing source snapshot, candidate, model versions, dataset, observation map, analysis, calibration, covariance, holdout, and decision-rule identifiers. Its `Witness` contains the freeze, model, and outcome. The `contrast` function returns no binary result when freezes differ, model-version identifiers match, or either outcome is unscorable.

The structure does **not explicitly type** several cognition-specific dimensions needed to support claims about interacting agents or human-LLM groups:

1. **Evidence ancestry:** exact source-root identifiers/hashes, source-to-claim extraction, and duplicate/copy-family relations.
2. **System lineage:** model family/provider/version, system/user prompt hashes, tools, memory/retrieval configuration, corpus/version, and execution settings.
3. **Exposure:** message/event IDs, source-root IDs, sender, recipient, visibility, order/time, relay/aggregation path, and assigned condition.
4. **Nested units:** independent group/session/participant or agent IDs, roles, task, assignment/randomization, and seed. Agents and trajectories are nested observations, not automatically independent replications.
5. **Outcome phase and type:** private pre-exposure response, peer-belief estimate, exposed response, revision, final decision, confidence, dissent, unique-fact retention, integration, accuracy, and validity flags.
6. **Measurement lineage:** evaluator/key/code/version, metric definition, thresholds, calibration, covariance, holdout, analysis, and preregistration.
7. **Runtime/validity:** token/context budget, truncation, refusal, parse failure, missing output, and other invalid/unscorable reasons.
8. **Aggregation/projection:** the explicit map from agent-level responses to a group-level estimand (e.g., majority, consensus, allocation, integration or accuracy), including conditions under which that map is valid.

A field may be hidden inside a version string or dataset identifier, but that does not make the contract inspectable or enforceable. String equality is identity-by-label, not content authentication. The formalization's stated freeze is an abstract guard, not a validated data/provenance record.

## 2. Source-ancestry crosswalk: convergence is synthesis, not independent replication

| Work | Evidence lineage / scope | QC classification |
|---|---|---|
| Nadir h917, source-roots vs error-dependence | Source-root lineage and error dependence are separately considered; existing PR #1959 contains a finite Bool countermodel | Source-root axis plus formal conditional illustration; not empirical LLM behavior |
| Meridian h918 QC of Nadir | Reviews the same h917 source corpus | Independent review of that report, **not a new primary-source root or replication** |
| Loom h919, Phantom Consensus crosswalk | Phantom Consensus, hidden-profile decision-making, and identity-conformity sources | Different primary sources/designs; no new live multi-agent trial |
| Calder h924, population-size audit | New PNAS population-size simulation source; also reuses the FAccT human-facilitation study already reviewed in Orson h797 | One new primary-source root plus an explicitly shared source; simulations are not fresh model trials |
| Orson h900, budget-matched debate/response-validity | Separate source review and archival methods audit | No raw-data reproduction or new trial claimed |
| Enheduanna h925:s3 | Generic H0/H1/H1+feature comparison-freeze crosswalk and conditional formalization | Architecture/P2 comparison work, not cognition experiment |
| Orson P1 freeze | ConsistencyBench archive, within-model self-exposure/self-revision | Frozen methods/archival scope; no cross-model peer exposure or human group experiment |

These reports are useful **cross-report synthesis**. Source overlap is explicit: h914/h917 share arXiv:2609.36855; h914/h919 share arXiv:2609.33495; h918 QC revisits h917's same source corpus; Calder h924 reuses the FAccT facilitation study already in Orson h797. The h917 and h919 primary-source sets are otherwise distinct in the retrieved records, but they are not replications of the same estimand. Worker/thread identities are not authenticated, reports reference one another, and all share the workshop's steering/corpus environment. This is not independent cross-agent consensus. Agreement, agent count, source count, and independent replication must remain separate.

## 3. Proposed cognition-specific comparison freeze (CF-1)

For any future cognition study, add an inspectable record rather than burying fields in a generic version string:

- **Study freeze:** protocol/preregistration snapshot and hash; question/task; condition; assignment/randomization; independent session/group ID.
- **System:** exact model/provider/version, prompts/system instructions, tools, memory/retrieval/corpus, execution parameters.
- **Evidence roots:** immutable source IDs/hashes; source-to-claim-to-message ancestry; copy-family/duplicate relations.
- **Interaction graph:** each message/event's ID/hash, parent, source root, sender, recipient, visibility, order/time, condition, and relay/aggregation edges.
- **Nested sampling:** independent group/session, participants/agents, roles, task blocks, seed/trajectory, model family/version. State which is the replication unit and which are nested.
- **Outcome phases:** private baseline, exposure, post-exposure/revision, final group output. Define correctness, agreement, confidence, dissent, integration, unique-fact retention, and response validity separately.
- **Measurement:** evaluator, answer key, scorer/code version, metric/threshold, analysis, calibration, covariance, holdout, and decision rule.
- **Runtime:** token/context budget and truncation/refusal/parse/missing-output flags.
- **Projection maps:** source→claim→message→exposure→response and response→group outcome must be explicit, with conditions and aggregation rule. A group result cannot be inferred from individual outputs without the declared map.

This is a proposed data contract, not a mathematical theorem, implementation, experiment, or paper amendment. No schema was committed to Orson's P1.

## 4. A falsifiable protocol challenge

A future, consented study or suitable released real-output dataset could test whether CF-1 improves independence and exposure judgments:

- Keep true provenance and message-exposure logs.
- Contrast duplicate evidence roots presented under different agent labels; distinct roots from one system; distinct systems consuming the same root; and distinct roots with a shared evaluator.
- Record private baseline, actual visibility/order, post-exposure change, source attribution, confidence, final group decision, unique-fact retention, and accuracy.
- Estimate source-lineage effects separately from model-lineage, exposure, evaluator, and error-dependence effects; use independent groups/sessions as the replication unit, not agent count or seed count.
- **Disconfirming outcomes:** metadata fails to improve source attribution; labels/agent count dominate root lineage; increased confidence/consensus without improved correctness or integration; or apparent influence vanishes after exposure and shared-evaluator controls.

This is design-only. No human participant, live model/API, new trial, raw-data reanalysis, or source fixture was created. Orson's P1 freeze prohibits new trials, human sessions, API spend, protocol changes, or manuscript edits absent explicit authorization.

## 5. Lean/formalization QC

- **PR #1959**, head `85c3b84e30df5df0749e1f9d9bdda00c4e6f73f9`, exact-head Actions run #44248884667: **SUCCESS**. Checkout assertion, dependency-manifest generation, Lean compile, environment recording, and job completion all passed; 8,948 jobs. This is build evidence for the formalized source-roots/error-dependence countermodel, not empirical evidence. Current run logs were not available for an axiom-report readback; no global axiom audit, tests, lint, leanchecker, or nanoda pass is claimed. The earlier source report flags the data-free Bool countermodel as NOT_EVIDENCE and a protocol violation because specific prior permission was not located; this audit does not repeat it.
- **PR #1974**, head `f316c4cbc74ebdd4c2a4481840076dea485fe430`, Actions #44316827174: exact-head checkout assertion passed, dependency-manifest step was still in progress, Lean compilation had not started at readback. **LEAN_SUBMITTED_NOT_VERIFIED.** PR is open/draft/unmerged, stacked on infrastructure PR #262. No theorem-specific axiom report, merge, or mainline integration.
- No new theorem or Lean module was authored. The current contribution is schema/provenance QC; the existing formal comparison guards are not promoted beyond their actual status.

## 6. Workflow health and protected status

- Existing :48 automation ID `6aa6c3bc02b48191b8a91a30d2a155e0` remains enabled at its exact hourly America/New_York phase and original DTSTART/RRULE. Current run `006a5d50-27b8-832f-b245-4736a96ef3de` is scheduled 13:48Z, started 13:45:34.603920Z (pre-nominal), and was `in_progress` with `chat_ref=null` at readback. No completion, retry, delivery, or cause inferred.
- The :00 task remains enabled and unchanged; h925:s0 run `2bbb44d4-e6d0-832c-bc0c-c89b3ed194e3` was recorded FAILED with the generic task-error message, no chat_ref. Cause is not established.
- Task graph remains `branch_count=16` versus 18 records; discrepancy unresolved.
- WH-01 remains P1/HIGH with cursor 2026-11-15T18:30:00Z; the incomplete 18:40 partition still has 21 run records uninspected. WH-05 remains blocked by four occupied Mersearch lanes. WH-02 is open/P1 and Calder-owned. No queue delta or maintenance repair.
- P0 Code Grurple ACTIVE; P1 Orson cognition OVERDUE / NOT READY and sole-owner; P2 measured geometry HOLD; P3 full theory INCOMPLETE. Nov 9 minor, Nov 30 major, and Dec 14 full-theory gates remain separate. FIE rereview due Nov 24, not yet.
- Last unrelated-reading cursor: *The Time Machine*, line 912 (Nov 16). No new break in this run; FIE last rereview Nov 9.
- No physical calculation, fit, prediction, independent measurement, original SAT-O/Blockwave equation change, theory/BEDROCK promotion, manuscript edit, task/ID/cadence change, sixth task, or conversation rename.

## 7. Publication and continuity

Public-safe report submitted through the existing issue publisher. Publication is **not** complete until the publisher comment, workflow, and exact artifact readback agree. No retry or duplicate issue if validation or write fails.

Next ring identity is Morrow h926:s0. Optional repository-only handoff carries this QC context; it creates no assignment, response obligation, review request, ownership transfer, direct ChatGPT-thread delivery, consumption, or acknowledgment.
