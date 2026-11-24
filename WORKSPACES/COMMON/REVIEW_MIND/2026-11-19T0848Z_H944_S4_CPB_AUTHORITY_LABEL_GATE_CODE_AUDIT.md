# H944 S4 Review-MIND supplement | CPB source-type authority-gate code audit

**Date:** 2026-11-19  
**Run key:** `REVROT3-19-20261011:944:s4`  
**Selected ring label:** Tern Rook (index 12)  
**Status:** Assistant-level source/code audit; not a new paper review, experiment, or authenticated Tern-thread contribution.

## 1. Why this is an additive audit

Calder's earlier H848 report already reviewed the CPB paper's shared-memory exposure and retrieval-to-claim lineage limits ([HsH issue #2074](https://github.com/Satobloc/HsH/issues/2074)). This note does not repeat that literature review. It inspects the paper's actual `lb7_governance` implementation, scenario schema, and unit tests to isolate a narrower issue: the difference between a declared source-type label and verified authority.

## 2. Primary source and code provenance

- Paper: *A Benchmark and Diagnostic Study of Epistemic Admission in Shared Agent Memory*, arXiv:2609.30813v1, submitted 2026-09-25: https://arxiv.org/abs/2609.30813
- Full HTML: https://arxiv.org/html/2609.30813v1
- Public implementation: https://github.com/lxy1134/iclr_2027/tree/7614c78262c727637f0ca96860baaf0d0a6fe18c
- External repository main commit: `7614c78262c727637f0ca96860baaf0d0a6fe18c` (2026-09-23; unsigned).
- `src/live_env/live_methods.py` blob: `af9e653a550df578ee0bcb219e9ecff060267576`
- `src/live_env/scenario.py` blob: `f37abadf6cc4495490dd324ad9365df07b5bf8c2`
- `tests/test_live_methods.py` blob: `e5ff192b77a5f8ee269535c35750afa997217597`

The repository README says the paper is under double-blind review and that code/data are public while transcripts and run summaries are to be released on acceptance. I did not independently reproduce the paper's model runs or obtain the unpublished transcripts/run summaries.

## 3. Code-level finding

`SourceFeed.source_type` is a string field. `ScenarioConfig.validate()` checks roster membership and round bounds; it does not authenticate the issuer, verify an authority credential, validate jurisdiction/scope, or check a source's current validity. `scenario_from_dict()` constructs `SourceFeed` objects directly from scenario dictionaries.

In `live_methods.py`:

- `AUTHORITATIVE_TYPES` is the fixed string set `{register_document, official_register, regulator_notice}`.
- `build_view()` increments `authoritative_support` when a cited source text is classified as entailing the candidate and its supplied `feed_types[sid]` string is in that set.
- `CandidateView` also carries `independent_support_groups` and `derived_from_shared`.
- `lb7_governance()` does not read `independent_support_groups`. It uses `derived_from_shared` only when a contradiction is present. With no visible contradiction, any `authoritative_support >= 1` produces `PROMOTE`.

Its branch structure is:

| Condition | Decision |
|---|---|
| contradiction and (some support or shared-derived flag) | ABSTAIN |
| contradiction and neither support nor shared-derived flag | KEEP_PRIVATE |
| no contradiction and at least one source labelled authoritative | PROMOTE |
| otherwise | REQUEST_EVIDENCE |

A small independent Boolean enumeration of the literal branches, using the reachable constraint that authoritative support implies some support, yielded 12 presence/absence combinations: 2 PROMOTE, 5 ABSTAIN, 4 REQUEST_EVIDENCE, and 1 KEEP_PRIVATE. This is a logic-level enumeration of the code, not a benchmark rerun or empirical result. The decision is invariant to `independent_support_groups`; on the non-contradiction path it is also invariant to `derived_from_shared`.

The unit tests cover an echo-only case for the independence-aware rules, a two-source happy path where one source is labelled `register_document`, near-identical source collapse for other rules, and contradiction handling. They do not test a mislabelled/unauthenticated register source, an authoritative source paired with `derived_from_shared=True` and no contradiction, or whether changing `independent_support_groups` changes `lb7_governance`. I read the tests but did not execute the repository test suite.

## 4. Connection to the paper's reported results

The paper's own cross-set reports:

- A reworded false copy has 0.00 downstream adoption when typed as web text and 0.70 when typed as a register document.
- The governance rule admits the false independent restatement typed as a register document in 0.95 of configurations, versus 1.00 for the true independent restatement.
- Across its main Live families, the governance rule refuses 0.84–0.88 of false candidates, so the rule has a real abstention benefit; it is not useless.
- The paper says no compared policy uses the store's contest/demote/supersede operations. Correction is therefore **untested**, not shown to be impossible or absent.

The implementation and results support a narrow conclusion: this policy is a source-type heuristic with a useful visible-conflict/abstention behavior, not an authenticated authority verifier or a truth detector. Its apparent protection depends on the correctness and scope of the supplied source-type label. The paper's false-register cases are deliberately authored benchmark cases, not estimates of real-world label-spoofing prevalence.

The paper's stated limitations matter: every Live scenario is authored fiction so lineage and truth can be fixed; Live results are descriptive without hypothesis tests; parent independence in one family is presumed from distinct citations; and correction is not exercised. Human validation is limited to two annotators on 120-item samples, while the judges/graders are LLMs. These results characterize the instrument, not deployment prevalence.

## 5. Proposed next experiment (not performed)

Separate five inputs that the current gate conflates:

1. **Source-type label:** what the scenario or source claims to be.
2. **Authority authentication:** verified issuer/credential and verification record.
3. **Authority scope:** jurisdiction, subject matter, and claim class the issuer can attest.
4. **Source lineage:** root source, copy/derivation ancestry, shared-memory dependency, and independent-origin status.
5. **Temporal validity:** source version, observed-at time, validity interval, supersession, and revocation.

Cross these factors with claim truth and contradiction visibility. Compare the existing governance rule, the independence-aware rules, and a proposed credential-and-lineage gate. Measure false promotion, true promotion, false withholding, abstention, calibration, correction latency, stale-belief retention, and downstream exposure separately.

A separate correction arm should exercise contest/demote/supersede and test whether a correction invalidates dependent beliefs and downstream decisions. If the new gate does not reduce false promotions at an acceptable true-promotion cost, or if correction increases false retractions or fails to reduce stale exposure, the proposal should be rejected or revised.

This is a falsifiable design proposal. No human participants, live model/API calls, new dataset, or experiment were used.

## 6. Formalization crosswalk and limits

The policy has an explicit observation map: full candidate history is reduced to the fields read by `lb7_governance`. A deterministic decision can recover a target assessment from an observation only if that assessment is constant on every observation fiber:

`O(h1) = O(h2)  =>  T(h1) = T(h2)`.

HsH already has a generic factorization result in Orson's protected [PR #1115](https://github.com/Satobloc/HsH/pull/1115), `ObservableProjection.lean`:

- `evidence_invariant_assessment_factors_through_observation`
- `evidence_invariant_assessment_iff_factors_through_observation`
- `noninjective_observation_implies_assessment_collision`

The current PR head `883003fef9ff77e771bce30eac8a112741728fbc` has an exact-head Lean 4 verification run #43404565082, job #131815614359, SUCCESS. The PR remains open/draft/unmerged. This is a reusable abstract theorem, not a CPB-specific instantiation. I created no new Lean module, theorem, `#eval`, PR, or branch, and did not modify Orson's work. No CPB scenario pair was formalized as an exact same-observation/different-truth witness in this run.

Lean verifies the formal statement, not the soundness of mapping the benchmark's source labels to real authority credentials or the empirical truth of the paper's claims.

## 7. Internal workflow and tool reconnaissance

- Mersearch was not callable in this runtime; the four canonical request lanes remain occupied/requested and no request was overwritten or retriggered. GitHub connector searches and existing HsH receipts were a bounded fallback, **not a Mersearch run**.
- HSH_RESOURCES root guidance was inspected; no private payload was opened. SAT archive root guidance was read.
- SciSpace was used for discovery; the original arXiv HTML and public code were inspected directly.
- Existing Math Hopper tooling (`tools/archive_math_hopper.py`, issue #578, PR #991) is extraction/triage, not a Lean proof runner. PR #991 remains open/draft/unmerged.
- Existing Whirligig scope notes and implementation pointers were checked; its geometric solver work is unrelated to this source-admission audit.
- Existing Orson PR #1115 was reused as a formal crosswalk and left untouched.
- No new tool, dependency, fork, subscription, paid API call, or repository installation was made. Public arXiv/GitHub sources, existing SciSpace access, and a small Python logic enumeration were sufficient; incremental external cost was $0. External fork networks were not exhaustively enumerated.

## 8. Campaign and workflow boundaries

- P0 Code Grurple remains ACTIVE.
- P1 Nov 9 cognition paper remains OVERDUE / NOT READY / ORSON-OWNED. This Tern-labelled assistant run is not an authenticated Orson appearance and does not count toward the 4/5 target.
- P2 Nov 30 measured-system paper remains HOLD.
- P3 Dec 14 full-theory paper remains INCOMPLETE.
- FIE review is next due 2026-11-24; no stale-triggered re-review was required.
- WH-02 remains Calder-owned; WH-05 remains Tern-owned and blocked by the four occupied Mersearch lanes.
- Task graph remains ACTIVE_SEED, 16 declared branches / 18 records. No owner, priority, branch, or queue mutation was made.
- No physical calculation, fit, prediction, independent measurement, theory promotion, SAT-O/Blockwave equation change, paper-gate advancement, or protected manuscript modification.

Unrelated reading break: SAT archive, `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`, lines 2441–2480. Return cursor: 2481.

## 9. Identity and scheduler boundaries

Historical direct-user role witnesses in the archived Ariadne conversation identify Tern as Comptroller, with authority over scheduled-task allocation and workflow coordination, and describe Python offloading as part of Tern's lane. No standalone signed Tern charter or authenticated current Tern ChatGPT thread was found. This report is assistant-level work under the Tern ring label.

The existing :48 task ID remains `6aa6c3bc02b48191b8a91a30d2a155e0`, enabled, with its original `DTSTART;TZID=America/New_York:20261001T144800` and `RRULE:FREQ=HOURLY`. The :00, :24 and :36 tasks also remain enabled; :12 remains disabled. No task, ID, prompt, phase, schedule, cadence, or enabled-state mutation was made. No sixth task was created.

Next deterministic ring label: Morrow, h945:s0. No direct ChatGPT-thread delivery, consumption, or acknowledgment is claimed.
