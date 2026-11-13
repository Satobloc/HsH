# H805:s2 | CALIBER source note and Lean status | Amendment 01

**Date:** 2026-11-13  
**Purpose:** correct the initial publication/Lean status after asynchronous readbacks. The original research report remains the source note; this amendment controls the operational status.

## 1. Publication verification

The single existing issue submission is **PUBLISHED_VERIFIED**.

- Issue: [#1688](https://github.com/Satobloc/HsH/issues/1688).
- Submission: `orson-caliber-confidence-state-20261113t1324z-s2-001`.
- Publisher run: [#43434394719](https://github.com/Satobloc/HsH/actions/runs/43434394719), completed SUCCESS.
- Publisher comment: #6854435004, reports PUBLISHED and the expected fixed destination.
- Artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/orson-caliber-confidence-state-20261113t1324z-s2-001.md`.
- Artifact blob: `71b113905018cd84b221f8f1cbc94bc3ce896d4e`.
- SHA-256: `a4f5249c83ae1705547255fb8ff327243b53e34d01a7ce1714f970d9c9bce515`.
- Independent readback: fetched issue #1688 and the exact artifact; decoded issue content and artifact content compare equal. Publisher comment's digest matches the declared digest.

No second issue, retry, edit, reopen, or duplicate submission was created.

## 2. Public correction to the Lean classification

The public note's phrase “exact-head Lean workflow” was inaccurate. A correction was posted as issue comment #6854483759 on #1688.

- Run #43434054670 was a `pull_request` workflow with PR head `753e984577255e749cccbf669675930fc46636a8`.
- Its job log reports checkout source commit `85c123cfeba07c73203e22c8385e98fe24842659`, a synthetic PR merge commit. This is a **MERGE-REFERENCE BUILD ATTEMPT**, not a standalone exact-head build.
- That run failed only on `OrsonCaliberConfidenceState`: the Real-valued division definition required noncomputable treatment, and one upper-bound proof retained the goal `↑n ≤ 1 * ↑n`. The failed theorem's axiom print included `sorryAx` because of that unsolved goal. The source file itself contains no explicit `sorry`; no successful proof is claimed from the failed run.
- Repair commit: `36d79cdd9d03bd6a9fc205886087fa0a00c44e9e`, same existing PR #850 branch. It adds a `noncomputable section` and simplifies the upper-bound proof.
- New PR-triggered Lean run: [#43434833215](https://github.com/Satobloc/HsH/actions/runs/43434833215), head `36d79cdd9d03bd6a9fc205886087fa0a00c44e9e`. At this amendment's first readback it remained IN_PROGRESS; its checkout source/merge commit and final build result are still required.

The Lean module remains an assistant-derived formalization of finite target arithmetic only. It does not establish model calibration, verifier reliability, OOD generalization, source truth, cognition, or physical theory.

## 3. P1 and project boundary

- P1 protocol freeze unchanged.
- Issue #564 remains OPEN / OVERDUE / NOT READY.
- PR #850 remains OPEN / DRAFT / UNMERGED; independent review is still required.
- No model trial, human session, API spend, P1 scope expansion, paper-gate advancement, physical calculation, CODATA comparison, or H(s)H theory promotion.


## 4. Source-notation clarification

Public issue comment #6854508245 clarifies that the conditional-probability notation (p_{pre}(x)=P(c=1\mid x)) and (p_{post}(x,z,\hat y)=P(c=1\mid x,z,\hat y)) in the summary is an assistant reconstruction of the intended estimands, not a verbatim equation/notation claim from the ACL paper. The source's operational targets are the empirical group success rate across sampled rollouts for pre-confidence and the individual rollout's correctness label for post-confidence. Read the probability notation as an idealized interpretation, not evidence that the model directly accesses true conditional probabilities.
