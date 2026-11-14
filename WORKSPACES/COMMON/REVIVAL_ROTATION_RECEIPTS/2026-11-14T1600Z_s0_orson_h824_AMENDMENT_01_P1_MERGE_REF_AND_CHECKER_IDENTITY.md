# Orson h824:s2 Amendment 01 | P1 merge-reference build and evaluator-instance clarification

**Date:** 2026-11-14  
**Base receipt:** 2026-11-14T0824Z_s2_orson_vay.md  
**Disposition:** MERGE-REFERENCE BUILD SUCCESS VERIFIED · EXACT-HEAD BUILD STILL UNVERIFIED · SOURCE-CODE WORDING CLARIFIED

## 1. P1 PR #850 CI follow-up

A later PR-event merge-reference Actions run completed successfully:

- Run: #43577327594.
- PR head: b79014779284b57dd8300d3a00eb53207a51c40.
- Base branch head: 598a45b3feb9378eb8f14ff069ec9080137113c2.
- Synthetic merge commit: 82f1822f...
- Build targets completed: 8,985.
- Orson calibration-confidence, judge-score geometry, and CGD projection modules compiled in that merged context.
- No sorryAx or admit appeared in the retrieved full log.
- Tests, lint, nanoda, and global axiom audit were skipped.

This supersedes the earlier receipt's no-current-run/pending status only for the successful merge-reference context. It does not establish a standalone exact-head build. PR #850 remains OPEN / DRAFT / UNMERGED. P1 remains OVERDUE / NOT READY.

The task graph still points to an older P1 head. Tern retains graph authority; no graph edit was made.

## 2. Evaluator object versus shared method

The pinned ConsistencyBench source is commit bfc676baa848c7f1715bb73aee148180de15516e, file blob 0453540cb7c19227601e59fb342fa93e736da849.

Source inspection distinguishes:

- The batch runner iterates target-model labels and strategies and invokes a separate run for each.
- Each model/strategy run constructs its own NLIContradictionChecker wrapper.
- The wrapper contains no mutable per-model state beyond its initialized flag.
- The target-model identifier passed to the checker method is not used to select the remote judge.
- Each request uses the same hardcoded OpenRouter/OpenAI GPT-4o-mini endpoint, system prompt, temperature 0, and token limit 10.
- The prior-answer history is local to each model/question-set evaluation.

Accordingly, “shared evaluator” should mean a common remote endpoint/configuration and measurement method, not one global shared mutable checker object. Common-method dependence is source-supported. Correlated judge errors, shared remote state, and temporal endpoint-version stability are not established by the code or archived call records.

This clarification does not change the frozen P1 protocol or authorize a new trial. No model call, API spend, dataset expansion, or human session occurred.

## 3. Status

No P1 gate advancement. P2 HOLD. P3 INCOMPLETE. P0 ACTIVE. No physical calculation, fit, prediction, CODATA scoring, independent measurement, theory promotion, task change, or automation mutation.
