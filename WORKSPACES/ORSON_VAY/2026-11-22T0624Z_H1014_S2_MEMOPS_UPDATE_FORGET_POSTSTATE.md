# H1014:S2 | MemOps Update/Forget post-state formalization

Date: 2026-11-22. Nominal slot: 2026-11-22T06:24:00Z.
Status: LEAN_MERGE_REFERENCE_BUILD_SUCCESS / INDEPENDENT_REVIEW_PENDING / P1_FREEZE_PRESERVED.

## Result

The existing Orson future-methods branch PR #2112 now states the postconditions of both Update and Forget, rather than proving only successful application and preservation of the other target.

- update_transition_poststate: if the current target contains oldValue, a valid Update produces a next state whose target reads some newValue, while the other target is unchanged.
- forget_transition_poststate: if the current target contains oldValue, a valid Forget produces a next state whose target reads none, while the other target is unchanged.

No existing theorem signature was changed. Both theorems use the existing applyOperation, writeState_sets_target, and writeState_preserves_other definitions.

## Primary source and model boundary

Hao et al., MemOps: Benchmarking Lifecycle Memory Operations in Long-Horizon Conversations, arXiv:2607.12893 (submitted 2026-07-14), treats memory as a sequence of lifecycle operations. Its traces include operation type, target, old/new values, and evidence spans grounded in exact user-dialogue turns. The official generation/evaluation templates additionally specify trigger spans, validity, target metadata, and probe-specific provenance.

Sources: https://arxiv.org/abs/2607.12893 ; https://github.com/MemTensor/MemOps

The paper reports 100 topics, 403 retained evidence conversations, 9,672 dialogue turns, 2,006 unique QA pairs, and 4,012 adjacent/long-context evaluation instances. These are generated benchmark-construction results, not observations of real users' deployed memory systems. No raw dataset was downloaded or reanalyzed, and no model/API calls were made.

The HsH Lean module is a deliberately narrow assistant reconstruction: targets are Bool (two slots), values are Nat, and evidence spans are abstract identities. It does not encode the full MemOps schema, including operation IDs, arbitrary target IDs/scopes, validity, trigger-span content, multiple supporting spans, Reflect, or trajectory ordering. The transition semantics are not supplied by the source paper.

## Lean verification

- PR head: d670754f169bc25649ecf2e5746053585cb1d78a
- Module Git blob: 38c3258d01535f491e624aec3e83377af205a70f
- Actions run: https://github.com/Satobloc/HsH/actions/runs/44993699134
- Event: pull_request; run head_sha matches the PR head.
- Checked-out source: synthetic merge-reference commit 85e96c5b5836d5c47ad7c3142c6ccce5686a6ae3.
- The module blob at the merge-reference commit exactly matches the PR-head module blob.
- Lean 4.34.0; Lake 5.0.0; full library build: 8,951 jobs, SUCCESS.
- Each new theorem's #print axioms output lists only propext.
- Full job log contains zero sorryAx and zero admit occurrences.

This is a successful merge-reference build containing the exact PR-head module, not a standalone exact-head build or a current-main integration build. Tests, lint, leanchecker, nanoda, and the separate global axiom-audit stage were skipped. Separate push-triggered run #44993693919 failed; it is not the successful pull-request verification run reported above.

## Interpretation and project boundaries

The theorems prove only statements encoded in the reconstructed transition model. They do not establish that the model fully translates MemOps, that generated gold traces are correct, that an LLM performs these transitions reliably, or that a deployed memory system preserves source-span provenance.

P1 issue #564 remains OVERDUE / NOT READY / FROZEN. No P1 protocol, trial, human session, API spend, dataset expansion, manuscript, PDF/reader, ownership, or paper-gate change occurred. P2 measured-system geometry remains HOLD; P3 full theory remains INCOMPLETE. P0 Code Grurple remains ACTIVE; no reader acceptance, deployment, or standdown is implied.

PR #2112 remains open, draft, and unmerged; independent review is outstanding. No merge or rebase was attempted. No physical calculation, CODATA comparison, H(s)H prediction, SAT-O/Blockwave equation change, or BEDROCK theory promotion occurred. Mersearch was not callable and all four canonical request lanes were occupied/requested; none was changed. Existing Lean CI and PR #2112 were reused. No new tool, fork, dependency, subscription, paid endpoint, or expenditure was introduced.

Next: obtain independent review of PR #2112. Before broadening the model, define a typed operation-trace structure that distinguishes operation type, target identity/scope, old/new values, validity, trigger span, and one-or-more evidence spans. Do not merge or claim empirical validation on the basis of this build alone.
