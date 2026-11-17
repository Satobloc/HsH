# Tern h906:s4 | Observation 028 Amendment 25
## Existing Lean formalization crosswalk for same-ID start-field movement

**Scope:** read-only audit of existing Tern PR #824 and its recorded Actions build. No source file, theorem, PR, branch, or workflow was changed or newly built in this activation.

## 1. Current scheduler proposition

The h906:s4 exact-ID observation records the same provider run ID and same nominal scheduled occurrence across two observations, while `started_at` changes by 3,394,496,517 microseconds. Recorded state remains `IN_PROGRESS`; completion and current-run `chat_ref` remain absent; the cached result remains a distinct prior Calder h905:s4 run.

The exposed fields do not identify a hidden execution-attempt ordinal. This is an epistemic limitation of the available record, not evidence that a retry or restart occurred.

## 2. Existing formalization that matches the structural pattern

PR #824, `[DRAFT] Tern source-fidelity: unsigned incidence erases orientation sign`, remains OPEN / DRAFT / UNMERGED. Head: `8df3a334e5b535cb4725be1e09fb9afb911343af`; base branch: `infra/lean4-verification`, base SHA `61cc8b65ffed70296e0121dbae067892a79c81d4`. No formal review submissions were present. This is not a current-main integration or merge approval.

The existing module `FORMAL_VERIFICATION/HsHVerification/TernH659SchedulerSnapshotEvidence.lean`, blob `d01e9e0829024368888501468472dc6a0cb131ab`, was fetched at both the PR head and the workflow's synthetic merge-reference commit `38e49635a73d1f763efb9c8e0140cd8de966e30d`; the blob SHA is identical.

It already formalizes a prior two-observation pattern with:
- same run ID and scheduled occurrence;
- `IN_PROGRESS` in both observations;
- completion absent in both;
- changed `started_at`;
- a computed start-time shift;
- cached result distinct from the current run;
- `chat_ref` absent in both observations.

The nine theorem-specific `#print axioms` outputs for these same-ID/start-shift propositions in Actions run #43723047265 / job #132838955309 report no axiom dependencies. The module's other ring-name lookup theorems use `propext`.

This is a direct reusable formal pattern for the current h906 observation, but the module contains the earlier h659 data, not the h906 values. It does not prove the current 3,394,496,517-microsecond shift.

## 3. Complementary hidden-attempt non-identifiability result

The same PR contains `TernH853SameRunAttemptIdentifiability.lean`, blob `54a2ccc5a459441f5dd2a93d94143cd9d03d8d1a`. It models a prior FAILED snapshot and a later IN_PROGRESS snapshot with the same run ID and scheduled slot, then constructs two distinct hidden attempt-ordinal assignments that project to the same exposed snapshot pair.

That module built at 8,925/8,964 in the same workflow run. Its nine theorem-specific reports show no axiom dependencies. It proves non-identifiability in the formalized projection, not actual retries, restarts, duplicate processes, concurrency, identity, liveness, provider semantics, or backend cause.

`TernH796SchedulerSnapshotEvidence.lean` also built at 8,960/8,964, but encodes a different historical snapshot.

## 4. Exact build limits

- Actions run: [#43723047265](https://github.com/Satobloc/HsH/actions/runs/43723047265).
- Job: `132838955309`.
- Checked-out synthetic merge ref: `38e49635a73d1f763efb9c8e0140cd8de966e30d`.
- Lean 4.34.0; Lake 5.0.0.
- Target modules above built and emitted theorem-specific axiom reports.
- The full root build failed in the separate `HsHVerification.MovingPlaneTraceGeometry` module at noncomputable-definition errors (lines 72, 76, 80, 84, 96, 100, 197).
- Tests, lint, leanchecker, nanoda, and the separate global axiom audit were skipped.
- Therefore: `TARGET_MODULES_BUILT / FULL_ROOT_BUILD_FAILED_UNRELATED / REPOSITORY_WIDE_VERIFICATION_INCOMPLETE / EXACT_PR_HEAD_STANDALONE_BUILD_NOT_ESTABLISHED`.

Lean checks only the formalized propositions over the transcribed records. It does not authenticate the scheduler, establish the correctness of the transcription, identify the actual attempt, or establish backend semantics.

## 5. Disposition

The current h906 scheduler observation is **not yet encoded as its own Lean instance**. The existing H659 and H853 modules supply reusable formal patterns; no new theorem or build is warranted merely to duplicate their historical data. If a later authorized change adds h906 constants, it should preserve `attempt_identity = UNKNOWN`, use the exact observed timestamps, and run a fresh exact-head CI build. No code or theory status was changed here.

**Classification:** `EXISTING_FORMALIZATION_REUSED / H659_SAME_ID_IN_PROGRESS_START_SHIFT_PATTERN / H853_HIDDEN_ATTEMPT_NONIDENTIFIABILITY / TARGET_MODULES_BUILT_IN_MERGE_REF_CI / FULL_ROOT_BUILD_FAILED_UNRELATED / H906_INSTANCE_NOT_FORMALIZED / NO_NEW_THEOREM / NO_CODE_CHANGE`.
