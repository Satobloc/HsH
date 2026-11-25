# Aldus h1076:s3 | Interval-censored public T0 evidence gate

**Nominal slot:** 2026-11-24T20:36Z  
**Actual automation start:** 2026-11-24T21:03:35Z  
**Run key:** `REVROT3-19-20261011:1076:s3`  
**Routing:** h=1076; seq=5h+3=5383; 5383 mod 19 = 6, Aldus; next ring label Calder (index 7).  
**Participation:** assistant-level, source-grounded reconstruction only. The deterministic label does not authenticate an Aldus instance or historical thread. No current authenticated Aldus thread was established.

## Preflight and source authority

Read the live HsH BEDROCK at blob `2629ab29a5838d933c31727455553d206577a258` (753 lines), the 2026-10-26 Steering Charter, Three Paper Campaign, New Instance Start Here, three-repository onboarding, current workflow orientation, revival V3/V4, thread-first rule, worker autonomy and scheduler controls, current main, task graph, PWH queue, current Aldus workspace and prior receipts.

Repository snapshot: HsH main `7265f616df89a34c1173eee049665c94613e1a0c`. The current task branch remains `main`; the formalization extension below is isolated on the existing PR branch.

The three repository front doors were read:
- HsH root README and current onboarding.
- SAT archive root README.
- HSH_RESOURCES root README only. No private HSH_RESOURCES payload or private reference index was opened, and no private repository link is used in this public report.

The original Aldus raw conversation was fetched and parsed directly: conversation `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`, HsH Git blob `2f5ea91a449446f64d298b50b0c2ef0d8533900a`, 1,578 mapping nodes, 47 user-role messages, 7,139,684 characters.

Primary role evidence:
- User message `939e981d-72ec-451b-81a3-f0a07b3a2c48`, 2026-09-08T03:56:33.466Z: Nathan directly describes Aldus as a broad cross-domain reader, explorer and synthesizer, including bringing together unrelated threads.
- User message `fcff5c18-85c4-4efc-b7e5-df7ee20c0646`, 2026-09-08T04:17:24.363Z: accepts the Aldus name and explicitly adds “combining information not usually combined.”
- The detailed experimental reading plan in assistant message `693794e3-9e32-5e56-ae53-faf688f1aa0c` was assistant-authored and only broadly endorsed. The later user message `3eec9833-d2c8-44f3-9ce6-0d0cbfc9180d` contains pasted assistant-authored experimental-design text; it is not a verbatim role charter.

No standalone signed specialist charter was found. The original role is broad cross-reading and synthesis. The narrower first-public/T0/Bayesian chronology workflow is a later assistant-level operational specialization, not Nathan Direct.

## One substantive architecture improvement

Extended existing PR #1860, rather than creating another module or tool, with an explicit interval-censoring boundary for public-availability chronology.

The problem: a single positive public-access snapshot at time t1 establishes that the exact content was accessible by t1. Under a monotone-availability model it gives an upper bound on release time, not an exact T0. Without an earlier negative observation, many release times remain compatible with the same positive snapshot.

The new Lean draft adds:

1. `PublicAccessHistory`: one subject, exact content version, one public surface, declared clock domain and scale, finite observation scope, coverage status, and an explicit monotonicity premise.
2. `PublicAvailabilityTransitionWindow`: verified, source-located negative and positive observations on that same history, with nonempty evidence IDs, source IDs and locators.
3. `ScopedFirstPublicT0`: the transition window plus an explicit `completeForDeclaredCorpus` coverage attestation.
4. `transitionWindow_contains_first_accessible_tick`: under the stated within-scope monotonicity premise, the first accessible tick in the declared scope is strictly after the negative observation and no later than the positive observation.
5. `scopedFirstPublicT0_has_first_accessible_tick`: carries the same result for the scoped-first type.
6. `one_positive_snapshot_does_not_identify_exact_T0`: proves that one positive snapshot is compatible with at least two distinct release times in the monotone release model.

The key distinction is now encoded: `first public mention`, `public release/accessibility`, `repository ingestion`, `collection indexing`, and `first extant record` remain different event kinds. A release/accessibility T0 must not be inferred from a mention, ingestion, index entry, filename, or later capture timestamp.

## Conditions and limits

- The theorem is conditional on a monotone public-availability history for one exact content version on one declared surface and clock, over a finite declared scope. If access can be revoked or toggled, this model is inapplicable to first-ever exposure.
- `completeForDeclaredCorpus` is an input attestation. Lean does not authenticate the corpus, source records, observation process, surface list, or completeness claim.
- The result is not global across undeclared surfaces, versions, or time ranges. A global first-public claim requires a complete declared surface/corpus manifest and independently sourced coverage.
- A lone positive snapshot supplies an upper bound only under the monotone release model. It does not supply an exact release date.
- The proof does not establish that any particular SAT/H(s)H feature was publicly available at a particular date. No feature-specific T0 was newly asserted.
- The new type names are local code identifiers, not new shared mathematical symbols. No symbol-registry entry or SAT-O/Blockwave equation change was required.

## Cross-disciplinary method check

Internal-first retrieval was used because Mersearch has no callable action in this runtime and all four canonical request lanes remain occupied. No lane was overwritten, retried, or released.

SciSpace was then used for a bounded methodological cross-read:
- Chen, Sun and Peace, *Interval-Censored Time-to-Event Data: Methods and Applications* (2012), https://scispace.com/papers/interval-censored-time-to-event-data-methods-and-1nd1r530s8. The retrieved record identifies current-status data and Bayesian semiparametric methods among the covered topics.
- Zeng, Mao and Lin, “Maximum likelihood estimation for semiparametric transformation models with interval-censored data” (2016), https://scispace.com/papers/maximum-likelihood-estimation-for-semiparametric-32s3wd3zdy. The retrieved record describes semiparametric transformation models, nonparametric maximum likelihood, and an EM-type estimation procedure.

This literature supports the observation-process distinction, not a physical analogy or H(s)H premise. A single positive snapshot is current-status/left-censored evidence; a verified negative-to-positive pair can produce an interval-censored event window. Statistical estimation of a population event-time distribution is a separate layer. No survival model, estimator, imputation, or numerical calculation was run here. SciSpace supplied record/abstract and extracted-method summaries, not full-text verification; the returned extracts did not state study limitations.

## Formalization and CI status

The existing module was extended on the existing branch:
- PR: https://github.com/Satobloc/HsH/pull/1860
- Branch: `research/aldus-temporal-provenance-20261116t2236z`
- New commit: `fb08c234fc8800714333088f113d7d02b44f4238`
- Module blob: `e4dbd193a5e3b17e0c7488bea0625ea1adab5bd0`
- New theorem names and `#print axioms` commands are present in the fetched exact-head file.

**LEAN_UNTESTED.** No actual Lean 4.34.0/Mathlib compile or run is claimed for the new commit. Local `lean`, `lake`, and `elan` are absent. The GitHub connector exposes commit-run readback but no workflow-dispatch action; the exact-head run query returned no run for `fb08c234...`. The Vercel preview status is not Lean CI.

The prior successful run #43973867276 belongs to the previous PR head and does not verify this extension. The PR remains OPEN / DRAFT / UNMERGED. Its base is the existing Loom source-bound branch; exact comparison is diverged, 5 commits ahead / 4 behind. No rebase, merge, new PR, new branch, or main-branch theory change was made. The new proof is a formalization draft until exact-head CI compiles and executes it, theorem-specific axiom output is inspected, and skipped checks are handled. Lean will verify only the formalized conditional statements, not source authenticity or real-world completeness.

## Existing tooling and project controls

- Existing PR #1860 and its stacked base PR #1858 were reused. No new Lean module or tool was created.
- Existing HsH references to Math Hopper #578 / PR #991 and Whirligig Kernel 0 were checked. A separate installed-repository search returned no Math Hopper or Whirligig repository. SciSpace was already available and was used; no new dependency, fork, subscription, paid service, or expenditure was introduced.
- PWH WH-02 remains the highest-priority unblocked item and Calder-owned. WH-05 remains blocked under Tern's Mersearch release authority. No PWH owner, priority, queue, or task-graph change.
- The task graph remains 18 records against 16 declared branches, with one unreachable node. It was read, not modified.
- P0 Code Grurple remains ACTIVE. P1 remains overdue/frozen/not ready and Orson-owned. P2 November 30 remains HOLD; the November 23 first-draft/hostile-review gate was not met. P3 December 14 remains incomplete.
- FIE's full rereview was completed November 24 in the preceding relay; next review is December 8. The unrelated-source break was last completed November 21; next due November 28. Aldus's separate SAT archive reading cursor remains `fun break - lx.txt`, line 2401. This cross-disciplinary interval-censoring read was relevant methodological cross-reading, not a substitute for the unrelated-source break.
- No physical system or dataset was selected, downloaded, or reanalyzed. No physical calculation, fit, prediction, uncertainty propagation, falsification threshold, independent measurement, or P2 admission occurred.
- No BEDROCK promotion, manuscript edit, SAT-O/Blockwave equation change, or scheduler/task mutation occurred.

## Scheduler, identity and next cursor

The existing :36 Worldtube task ID `6a9f52b69ec08191b0a2ba24a074f781` remains enabled with its original hourly America/New_York :36 schedule and phase. The run-level selection is a routing label only; no authenticated Aldus thread or cross-thread delivery is claimed. No handoff, assignment, response obligation, or acknowledgment was created.

**Next ring label:** Calder.

**Return cursor:** PR #1860 exact head `fb08c234fc8800714333088f113d7d02b44f4238`. First obtain an actual Lean 4.34.0/Mathlib run, inspect all three new theorem axiom reports, and confirm no `sorryAx`/`admit`. Then review whether the public-surface coverage manifest is sufficiently typed for any claim broader than one surface. Do not claim global T0 or use the type for revocable/toggled access histories without a different event model.

**Final status:** `INTERVAL_CENSORED_PUBLIC_T0_GATE_ADDED / EXISTING_PR1860_EXTENDED / LEAN_UNTESTED / PR_DRAFT_UNMERGED / P2_HOLD / NO_PHYSICAL_REANALYSIS / NO_GLOBAL_T0_CLAIM / NO_CROSS_THREAD_CLAIM / TASK_UNCHANGED / NO_SIXTH_TASK`.