# Nadir h788:s3 Amendment 03 | Exact-fibre theorem exact-head verification

**Amendment time:** 2026-11-12T21:57:39Z  
**Canonical run key:** `REVROT3-19-20261011:788:s3`  
**Selected ring label:** Nadir Voss, index 10  
**Next ring label:** Enheduanna, index 11  
**Classification:** `DUPLICATE_RUN_KEY_RECONCILIATION / INCOMPLETE_EXISTING_RUN_KEY / EXACT_HEAD_BUILD_VERIFIED / NO_PHYSICAL_VALIDATION / NO_THEORY_PROMOTION`

This is an additive amendment to the existing h788:s3 report and canonical receipt. The canonical run key already existed, and issue #1653 was already published. No second canonical receipt, issue, submission, PR, branch, or Mersearch request was created.

## 1. Exact-head Lean repair completed

The existing [PR #1189](https://github.com/Satobloc/HsH/pull/1189) was inspected at its prior head `9b02e279ea1ca39a85ef821ebccaf67b6d567e80`. The exact-head build attempt [#43309578120](https://github.com/Satobloc/HsH/actions/runs/43309578120), job `131501799575`, failed at the declaration boundary: the theorem docstring immediately preceded `omit [PseudoMetricSpace Y] in`, and Lean reported an unexpected `omit` token while expecting a declaration.

This was a parser-placement failure, not a counterexample to the theorem or a failure of its mathematical argument.

The minimal correction moved `omit [PseudoMetricSpace Y] in` before the theorem docstring. The theorem statement and proof were not changed.

- Corrected PR head: `4d426c45a9782a409bf049d5ff65a3c7896f8261`.
- Corrected module blob: `cc68538ac5e0f6c09ac9f6a9f803c2b8c6708b80`.
- Commit: `4d426c45a9782a409bf049d5ff65a3c7896f8261`, “Nadir: place omit before theorem docstring”.
- Exact-head Actions run [#43314038015](https://github.com/Satobloc/HsH/actions/runs/43314038015), job `131517252202`: **SUCCESS**.
- Checkout-identity assertion passed; actual checked-out source was exactly the PR head above.
- Lean 4.34.0 / Lake 5.0.0; full root build completed **8,960 jobs**.

The two theorem-specific axiom reports are:

- `no_lipschitz_standard_predictor_can_fit_both`: `[propext, Classical.choice, Quot.sound]`.
- `exact_baseline_fiber_separation_excludes_fit`: `[propext, Classical.choice, Quot.sound]`.

The captured complete job log contains no `sorryAx`, bare `admit`, or compiler error occurrence. The target module emitted no warning. Other modules emitted non-fatal warnings. Tests, lint, leanchecker, nanoda, and the separate automated axiom audit were skipped; `nanoda-allow-sorry=true`. This is an exact-head full-build result, not a repository-wide sorry-free or global axiom audit.

A separate `conversation-json-content-ci` workflow run was recorded as failure with zero jobs exposed. Its branch filter targets a different branch; no job-level failure or connection to the Lean result was established. It does not alter the successful Lean verification.

## 2. Mathematical result and explicit projection hierarchy

The exact-fibre corollary now needs no metric on the baseline codomain and no Lipschitz constant.

Let:

- (S:X\to Y) be the baseline readout;
- (H:X\to Z) be the proposed readout;
- (f:Y\to Z) be any deterministic baseline-only predictor;
- (d_Z) be the output pseudometric;
- (\delta\ge 0) be the output tolerance.

If

\[
S(x)=S(y),\qquad d_Z(H(x),H(y))>2\delta,
\]

then no deterministic (f\circ S) can fit both proposed outputs within (\delta). The proof is the triangle inequality: equality of the baseline readouts forces the predictor outputs to coincide, so two errors each bounded by (\delta) would force candidate-output separation at most (2\delta).

The approximate-fibre theorem retains the calibrated Lipschitz bound:

\[
d_Y(S(x),S(y))\le\varepsilon,\qquad
d_Z(H(x),H(y))>K\varepsilon+2\delta.
\]

It excludes every declared (K)-Lipschitz baseline-only predictor from fitting both observations within (\delta).

The existing map hierarchy is also explicit in the same PR branch:

- `NadirProjectionCoarseGrainFactorization.lean`, blob `e547d9c5aa10be2f73b15ce757ec1645a67fd46b`, proves that an induced coarse map on `Set.range P` exists iff the downstream composition is constant on every fibre of (P). Its codomain is the actual image, so ambient surjectivity is not assumed.
- `NadirWitnessCarryingComposition.lean`, blob `babec58f7bcdf3b25b3688888c5dc5f2648876ea`, carries the intermediate image witness through two successive projections and proves the two-stage composition law when both fibre-compatibility conditions hold.

These are conditional typed-map theorems. They do not construct a physical worldtube, timesheet, contact surface, medium response, instrument map, or measured projection.

## 3. Independent test matrix

| Element | Required independent specification |
|---|---|
| Hypothesis | A proposed observable varies within fibres of a declared baseline projection/readout. |
| Shared parameters | Freeze (S), (H), instrument transfer maps, nuisance parameters, units, and output metric before holdout access. |
| Calibration | Derive (\delta) from candidate-output covariance; for approximate fibres, bound (K) on a declared calibration domain and derive (\varepsilon) from baseline resolution/covariance. |
| Holdout | Independent acquisitions or states, with raw provenance, calibration ancestry, units, full covariance, and no splitting of correlated frames/channels into pseudo-independent runs. |
| Predicted observable | Held-out pairwise separation (d_Z(H(x),H(y))) among states with exact or bounded-close baseline readouts. |
| Standard comparator | All deterministic (f\circ S); for approximate fibres, the preregistered (K)-Lipschitz class with the same frozen parameters. |
| Falsification threshold | Exact fibre: (d_Z(H(x),H(y))>2\delta). Approximate fibre: (d_Z(H(x),H(y))>K\varepsilon+2\delta). A reproducible holdout witness rejects that declared baseline-only predictor class on the tested domain. |

Failure to find a witness does not establish equivalence, validate the standard model, or validate H(s)H. If (H), the instrument map, (K), covariance, or uncertainty bounds are unspecified, the experiment is `NOT_TEST_READY`.

**Forced versus optional geometry:** a reproducible within-fibre readout difference beyond the uncertainty threshold would force the declared baseline representation to be insufficient for that observable. It would not uniquely force worldtube thickness, twist, contact surfaces, or a responsive-medium primitive. Those are competing additional-state explanations requiring separate source-grounded maps and distinct predictions.

## 4. Publication state

The existing [issue #1653](https://github.com/Satobloc/HsH/issues/1653) remains `PUBLISHED_VERIFIED` for the earlier exact-head theorem at `5630ba595e0ec50312386a032358278b60424cfd`.

- Publisher comment: #6836118115.
- Publisher commit: `f393373791e3bba67d209fb2afc025126b055d9d`.
- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/nadir-robust-readout-separation-20261112t2036z-s3-001.md`.
- SHA-256: `218e826998d4027251af39407c2a3525c317fd021cd2c6b02cdb492d9cbc78eb`.
- Artifact blob: `fdbd2d1f1f52254aabb668356fb2472e15986e83`.
- Fresh readback confirmed the issue-envelope content and canonical artifact are exactly equal.

The stronger exact-fibre corollary is present in the public PR branch and the PR description, but is not part of the immutable issue #1653 artifact. No duplicate issue, publisher retry, or direct artifact write was made.

PR #1189 remains OPEN / DRAFT / UNMERGED with zero formal reviews. Its base remains `research/nadir-gpb-joint-covariance-bound-20261027t1312z` at `7a3add552cebd8a9f9d6a8a9f2b758f729b3d72d58bcc`? No: the exact base SHA is `7a3add552cebd8a9fa7f2b758f729b3d72d58bcc`. It is 78 commits ahead / 4 behind that base and 132 ahead / 15,173 behind HsH main `4b8c9ec1dd7566577f60f6fc5f166bfde4837db4`. No rebase, merge, base change, or current-main integration build was attempted.

The PR description was updated additively to supersede its prior `SUBMITTED_NOT_VERIFIED` status for the exact-fibre strengthening.

## 5. Source, Mersearch, and tool boundaries

The original Nadir-associated source was re-read from HsH raw export:

- Path: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/26.06.23•26.10.01•Quantum Gravity and Experiments — raw.json`.
- Git blob: `d828fef5352045cb4d9486fdbeabd04043c4c119`.
- Conversation: `6a3a2037-3698-83ea-924d-2cb8c4ac7701`.
- 43 mapping entries; 8 user-role messages.
- Three direct user instructions dated 2026-10-01 authorize a separate sandbox, source/invention separation, no target-fitting of old magic numbers or particle labels, and a trial H(s)H Lagrangian.

The label “Nadir Voss” is assistant-generated. The workspace README is an assistant-derived specialization, not a standalone Nathan-authored specialist charter. Bounded prior-context retrieval found no newer authenticated Nadir thread. No historical-instance participation, current Nadir identity, or cross-thread delivery is claimed.

The broad October 1 sandbox authorization does not override the later BEDROCK requirement for specific prior permission before data-free calculations or the measured-system gate for physical calculations.

Mersearch was not run: the direct Mersearch action is not exposed in this runtime, all four shared request lanes remain occupied, and their request-scoped output directories are absent. No request was overwritten. The known raw HsH source path was read directly; this is not represented as Mersearch coverage.

Existing PR #1189 and its CI were used. No new tool, fork, dependency, subscription, or expense was introduced. No local repository checkout or GitHub Actions dispatch/write tool was available; the existing GitHub connector was used with current blob SHA for the branch correction and create-only writes for new records.

## 6. Live controls and scheduler reconciliation

The following live controls were read in this run:

- HsH `BEDROCK.md`, 667 lines, blob `0253ace674bbc361464b7bbaac2c41aa3d8e8867`.
- Steering Charter, blob `04822f3e48f746e9e464d893636ed4a670d68683`.
- Three Paper Campaign, blob `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`.
- Three-repository onboarding, blob `fe40260cda5ce360909f2adfd64a3cc3e2c92a05`.
- New Instance Start Here, blob `43b577d42b8cced83f8836934598081685ea3ff3`.
- Revival Rotation V3, blob `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14`.
- Duplicate Run-Key Guard, blob `14531964363c1fa3e6bf1e493a6d744d8a02d4da`.
- Reentry Protocol V2, blob `7486f6ef658e882dc47058b271b12ed73673db80`.
- Current Workflow Orientation, blob `2bb6d996ca61f41b2b3fb34480cab1acf906bd4f`.
- HsH main `4b8c9ec1dd7566577f60f6fc5f166bfde4837db4`; SAT archive main `37fcbdc49b331cd11209d203384c0b64a604c7b9`; HSH_RESOURCES main `88957555cc933ac986b5a291de45aafd6efd063e`.
- Task graph: 16 declared branches / 18 records / 13 active-or-blocked; no graph mutation.

The duplicate-run-key guard applies: the canonical h788:s3 receipt was preserved and this is Amendment 02, not a second receipt.

At the 2026-11-12T21:57:39Z readback, the same :36 scheduler run ID `7ad77dc2-6170-8321-9b78-c468048c3dfc` remained IN_PROGRESS, with null completion and null run-level `chat_ref`. Its reported start field had moved from the prior 21:00:20.563115Z snapshot to 21:47:16.768997Z, a further 46m56.205882s shift. Its cached result still belonged to the preceding Mira h787:s3 run, not the current Nadir h788:s3 event. No retry, restart, process concurrency, worker identity, or cause is inferred.

The :48 task's current h789:s4 run is a separate next-hour record; the cached result belongs to the completed Enheduanna h788:s4 immediate successor. Therefore the Enheduanna handoff below is POST_COMPLETION_OPTIONAL_CONTEXT_ONLY.

Tern's existing Observation 008 received Amendment 02; the Tern inbox was updated. Tern retains scheduler authority. No task, ID, schedule, phase, enabled state, cadence, or ownership was changed. No sixth task was created.

## 7. Upkeep and paper gates

- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition: OVERDUE / NOT READY, Orson-owned.
- P2 November 30 geometry: HOLD.
- P3 December 14 full theory: INCOMPLETE.
- FIE last review: November 10; next review November 24. The 14-day trigger has not been reached.
- Unrelated reading: SAT archive `FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/MIX TAPES.txt`, lines 461–500. Next cursor: 501.
- No embodied physical break is claimed.

No physical system, raw dataset, units, calibration, covariance, holdout, measured prediction, fit, or independent measurement was supplied or used. No SAT-O/Blockwave equation was altered. No BEDROCK theory promotion, manuscript gate advancement, or task-graph mutation occurred.

## 8. Successor and final classification

The deterministic next label is Enheduanna. The immediate h788:s4 run had already completed before this packet was prepared, so the handoff is post-completion optional context only. The repository handoff and Enheduanna inbox pointer make no claim of direct thread delivery, consumption, acknowledgment, or comprehension. No task, response obligation, review request, deadline, or ownership transfer was created.

**Final classification:** `DUPLICATE_RUN_KEY_RECONCILIATION / EXACT_FIBRE_EXACT_HEAD_BUILD_SUCCESS / PR_OPEN_DRAFT_UNMERGED / ISSUE1653_PRIOR_VERSION_PUBLISHED_VERIFIED / NO_DUPLICATE_PUBLICATION / MERSEARCH_NOT_RUN_ALL_LANES_OCCUPIED / NO_PHYSICAL_DATA_OR_PREDICTION / NO_THEORY_PROMOTION / ENHEDUANNA_POST_COMPLETION_OPTIONAL / TERN_SCHEDULER_AMENDMENT_02 / AUTOMATION_UNCHANGED`.
