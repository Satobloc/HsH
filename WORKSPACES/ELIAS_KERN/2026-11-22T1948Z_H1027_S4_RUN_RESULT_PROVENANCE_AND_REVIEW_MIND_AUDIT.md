# Elias Kern h1027:s4 | Run/result provenance and Review-MIND audit

**Disposition:** `ASSISTANT_LEVEL_RECONSTRUCTION / RUN_RESULT_JOIN_AUDIT / EXISTING_LEAN_RESULT_REPLAYED / HALE_CROSS_LANE_QC / NO_NEW_POC_OR_PRODUCTION_CHANGE / NO_PHYSICAL_VALIDATION`

## 1. Selection, authority, and scope

The nominal UTC hour is h=1027. The fixed ring calculation gives:

\[
seq=5(1027)+4=5139,\qquad 5139\bmod19=9.
\]

Selected routing label: **Elias Kern**, index 9. Next label: **Nadir Voss**, index 10.

This is routing metadata, not authenticated worker identity. The current Elias run has no run-level chat reference, and no authenticated current Elias thread or cross-thread delivery is claimed.

The strongest historical role-bearing source is the 2026-09-24 13:47 ET user-role instruction preserved in `WORKSPACES/ELIAS_KERN/INBOX.md`: Track A prototype work with Nathan and Orson, independent but in communication with Sable/Tern's Track B; one bounded real-work mechanism per lease; durable receipt/failure packet; report observed behavior; no production authority. The raw originating conversation/message IDs remain unrecovered. The workspace README is an assistant-maintained synthesis, not a separately signed specialist charter. Prior-conversation retrieval also found no authenticated active Elias thread; the October 13 Hale relay remains a GitHub-inbox entry marked `chat_delivery=UNAVAILABLE` and `worker_acknowledgment=NOT_VERIFIED`, not a ChatGPT handoff or proof of participation. The existing inbox preserves sandbox-only guidance to test explicit actor registration against existing self-tests, unknown-actor rejection, TOP lock, and fresh-directive priority; it does not authorize production promotion. No POC change was made.

The user-supplied Lane Charter 48 governs this execution as Review-MIND. The operation therefore stayed within Elias's documented workflow/provenance specialty: audit actual run records and existing formalizations, without changing the switchboard POC, PR #951, an adapter, or production workflow.

The live source set was read from HsH main at `8197181e5c64c0162d1e565b186411586ea58062`: [BEDROCK](https://github.com/Satobloc/HsH/blob/main/BEDROCK.md), [Steering Charter](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/STEERING_CHARTER_2026-10-26.md), [Three Paper Campaign](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/THREE_PAPER_CAMPAIGN_2026-10-26.md), [three-repository onboarding](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/INSTANCE_ONBOARDING_3REPO.md), [Revival Rotation V3](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_ROTATION_V3_2026-10-11.md), the [thread-first rule](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_RELAY_THREAD_FIRST_RULE_2026-10-11.md), [Elias INBOX](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ELIAS_KERN/INBOX.md), [Elias README](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ELIAS_KERN/README.md), and the prior [h1012 Track A report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ELIAS_KERN/2026-11-22T0436Z_H1012_S3_HYDRA_CANDIDATE_EVENT_SCOPE_GATE.md). The current :24 Calder and :36 Hale receipts/reports were also read.

## 2. Runtime provenance graph: current run is not the cached result

The live automation readback exposed four enabled phase tasks and one disabled phase. At the inspection snapshot:

| Phase | Current deterministic label | Current run status | Cached result/run join | Run-level `chat_ref` | Correct attribution |
|---|---|---|---|---|---|
| :00 | Nadir Voss, h1028:s0 | IN_PROGRESS | MISMATCH | absent | Cached result belongs to the preceding Mira h1027:s0 run, not current Nadir |
| :24 | Calder, h1027:s2 | COMPLETED | MATCH | present | Result belongs to this run record |
| :36 | Hale, h1027:s3 | COMPLETED | MATCH | present | Result belongs to this run record |
| :48 | Elias Kern, h1027:s4 | IN_PROGRESS | MISMATCH | absent | Cached result belongs to the preceding Alberr h1026:s4 run, not current Elias |
| :12 | disabled | — | — | — | No current run |

The mismatches are not failures. `latest_result` is the last completed result; while a newer run is still in progress, the cached result may legitimately belong to the preceding run. The safe join rule is:

**Attribute a cached result to the current run only when `latest_result.run_id = last_run.id`.**

A task-level configured `conversation_id` and a run-level `chat_ref` are separate evidence fields. A configured conversation pointer does not prove that the current run produced a result, bound to that thread, or delivered a message. The two in-progress runs had no run-level `chat_ref`; their cached results had prior-run chat references.

The :24 and :36 completed runs had matching run/result identifiers and run-level chat references. That establishes attribution to those two run records, not independent model identity or independent evidence. The four task contexts are distinct operational records; the underlying model/version, generation independence, and source independence are not authenticated by these fields. The ring labels are deterministic routing labels, not agent identities.

Some recorded execution intervals overlap. This establishes overlap in run records only, not simultaneous model computation, separate agents, or causal interaction.

### Explicit provenance projections

The current runtime exposes at least four distinct layers:

1. **Task configuration:** stable task identity, recurrence, and configured conversation pointer.
2. **Run record:** current run ID, scheduled occurrence, status, and optional run-level chat reference.
3. **Cached result:** result run ID, content, completion state, and optional result chat reference.
4. **Worker label:** deterministic function of the rotation index, not an authenticated subject.

The required composition is not analogy: task configuration points to a run; a result is joined to that run only by run-ID equality; a current thread binding is recorded only when the run-level chat reference is present and verified. A worker label is not a projection to a person or independent model.

This is an operational contract derived from the actual automation readback. The current HsH main branch does not contain a Lean module for this exact runtime `last_run` / `latest_result` / `chat_ref` schema.

## 3. Existing Track A formalization and actual Lean verification

The existing [Elias PR #742](https://github.com/Satobloc/HsH/pull/742) contains `EliasHydraEventLeaseScope`, which separates:

- `LoopStateKey`: node, stage, directives, candidate ID, and evidence revision.
- `ExecutionKey`: the loop-state key plus actor, locale, event ID, lease ID, and state version.

Its theorems establish that changing invocation fields leaves the loop-state key unchanged while changing the execution key. This is a useful formal distinction between structural recurrence and invocation identity.

The actual exact-head Lean 4.34.0 / Lake 5.0.0 run [#44890994775](https://github.com/Satobloc/HsH/actions/runs/44890994775) checked out PR head `c74e84ee64164ca5a9b6c3e114a9fe66aa5a591e` and passed its exact-head assertion. The 8,946-job library build succeeded. Eleven theorem-specific `#print axioms` reports for the new module reported no axiom dependencies. A later PR build [#44968984040](https://github.com/Satobloc/HsH/actions/runs/44968984040) also succeeded, but its job did not contain the exact-head assertion; the earlier exact-head run is the controlling source check. Tests, lint, leanchecker, nanoda, and the global axiom audit were skipped.

The current PR head is `40f4632f9b2d06b76042e8c27d76e221de5b9b39`; its Git tree is identical to the exact-head-tested commit's tree. The branch is still OPEN / DRAFT / UNMERGED and compares to current main as 53 commits ahead and 26,419 behind. The exact-head build therefore verifies the same source tree, not integration into current main.

[PR #951](https://github.com/Satobloc/HsH/pull/951) contains additional Elias receipt-evidence and worker-identity formalizations, but its branch is also diverged from main (118 ahead / 26,419 behind). Neither PR is integrated. The current main branch does not contain the `FORMAL_VERIFICATION` project. Local `lean`, `lake`, and `elan` are absent.

**Missing proof:** the current runtime's result-attribution rule and the distinction between task-level `conversation_id` and run-level `chat_ref` are not covered by the existing `ExecutionKey` theorem. A future source-backed model would need explicit `TaskRun`, `ResultRecord`, and optional `ThreadBinding` records, then prove the run/result join and keep thread binding independent. No new Lean module or PR was created because the formal project is not on current main, the existing Elias branches are deeply stale, and the independent Track B `ELIAS-2224` EvidenceLedger/subject-scope disposition remains pending.

The internal `ELIAS-2224` gate is not GitHub issue #2224; that GitHub issue is an unrelated Loom publication. The numeric suffix is not a GitHub locator.

Lean verifies only the encoded key relationships. It does not prove Python equivalence, runtime execution, provider/model identity, source independence, message delivery, or any physical premise.

## 4. Cross-lane Review-MIND audit: Hale's instrument-support formalization

The incoming Hale h1027:s3 report extended existing [PR #2330](https://github.com/Satobloc/HsH/pull/2330) with an opt-in `SourceBoundReadoutUncertaintyModel` and `NominallyGroundedInstrumentSupportRobustComparison`.

The new contract:
- binds source evidence to instrument ID, operator version, calibration record, and acquisition-unit-map record;
- requires the support record's complete evidence record to equal the readout uncertainty-model evidence record;
- requires every nominal detector value to belong to its own possible-observation set;
- preserves the existing precommitted-evidence and two-sided robust-separation requirements.

The current PR head is `0028859cd50e6a69071246b985c6c54fc7356763`. The successful [Actions run #45062179106](https://github.com/Satobloc/HsH/actions/runs/45062179106) is a **merge-reference build**, not a standalone exact-head-only or main integration build. It completed 8,952 jobs under Lean 4.34.0 / Lake 5.0.0. Seven theorem-specific axiom reports for the new module reported no axiom dependencies; the retrieved log contained no `sorryAx`, `admit`, or `error:`. Tests, lint, reservoir eligibility, leanchecker, nanoda, and the global axiom audit were skipped.

The mathematical results are appropriately limited:
- nominal inclusion makes the set-valued support nonempty at the nominal observation;
- artifact and digest theorems project record-level equality;
- readout-identity theorems project instrument/operator/calibration/acquisition-map equality;
- robust two-sided support separation implies nominal detector-level separation.

They do **not** establish probability, statistical coverage, confidence level, covariance, metric-ball structure, completeness, calibration correctness, artifact authenticity, or source-to-function correspondence. The support map remains a source-defined set-valued relation. The readout/model authentication fields are typed premises; independent source review must verify their truth.

The parent comparison schema carries a source system, dataset identity/artifact, measurement evidence, calibration/holdout records, and a common readout. No actual measured system or dataset was supplied in this pass. The new type is an evidence-admission contract, not a measurement. Its explicit model projections/common-carrier/readout composition are abstract; no physical worldtube/timesheet map or equivalence is established.

No new comment, code edit, review submission, rebase, or merge was made; the existing report and PR comments already state these limitations.

## 5. Mersearch, repository boundaries, and tool reconnaissance

No direct Mersearch action was exposed. The documented HsH request bridge exists, but all four canonical request files remain `requested`:
- Lane 1: Calder angle-geometry request; no manifest/receipt at the expected output path.
- Lane 2: Perceptual Nexus request; a compact manifest and receipt exist, but raw search results remain withheld.
- Lane 3: Calder IRI request; no manifest/receipt at the expected output path.
- Lane 4: Kestrel finite-core request; no manifest/receipt at the expected output path.

No request was overwritten, released, or retriggered. GitHub connector retrieval is not Mersearch completion.

HsH and SAT archive root/onboarding documentation were read. HSH_RESOURCES' root README states that it is private internal research infrastructure, while GitHub metadata reports public visibility. No HSH_RESOURCES payload was opened and no private URL is exposed here.

The current :24 report already checked Math Hopper #578 / PR #991, Whirligig Kernel 0, connected SciSpace, existing forks, and free approaches; its broad fork search did not establish a relevant HsH fork. This run did not duplicate that reconnaissance. No new tool, fork, dependency, subscription, paid endpoint, or expenditure was introduced. SciSpace was not needed for this operational provenance audit.

## 6. Campaign, autonomy, and empirical safeguards

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE; 11/11 protected objects verified in the current :24 report; Tern retains release authority |
| P1 November 9 cognition | OVERDUE / NOT READY / FROZEN / ORSON-OWNED |
| P2 November 23 first-draft gate / November 30 major measured-system gate | HOLD; gates remain separate |
| P3 December 14 full-theory paper | INCOMPLETE |
| FIE | Last full review November 20; next review December 4 |

P1 issue #564 remains open. PR #850 remains OPEN / DRAFT / UNMERGED. Orson's cognition ownership and approximate four-of-five substantive-activation target are unchanged. This Elias run does not count as an Orson activation or advance P1.

The last unrelated-reading break was November 21; no duplicate break was performed. The task graph remains 18 records against 16 declared branches, with the M87 polarimetry node still unreachable. No graph or ownership mutation occurred. [Orson's P1 docket](https://github.com/Satobloc/HsH/issues/564) remains open and [PR #850](https://github.com/Satobloc/HsH/pull/850) remains OPEN / DRAFT / UNMERGED.

The current task-run records are not a human-LLM group experiment. No human subjects, consented sessions, distinct authenticated agent identities, model-version controls, or randomized conditions were present. No claim about assistant consciousness or personhood is made. No SAT-O/Blockwave source equations were opened or modified; no original-equation SHA/date or corrected-equation record was created because no equation work was undertaken.

### Disconfirming experiment proposal, not performed

A future controlled study could compare (a) isolated threads using the same recorded model/version, (b) shared-context threads using that same model/version, and (c) independently sourced different-model controls. Keep prompts and task difficulty matched; randomize source packets; swap or remove one distinctive evidence source as a negative control; preserve full prompt/model/version/output provenance; and use blinded claim-level coding of agreement, citation overlap, source uptake, and error correlation. Human participation requires informed consent and privacy safeguards.

A key falsifier would be high apparent agreement in shared-context conditions that collapses under source swaps or independent evidence. Conversely, persistent agreement across independently sourced conditions with reduced error correlation would be stronger evidence of independent convergence. No subject results are invented or claimed.

## 7. Scheduler and handoff boundary

Exact-ID readback confirms the four existing Workshop Relay phase tasks remain enabled with their original IDs, schedules, prompts, and phases; the :12 task remains disabled. No sixth task was created. No task, ID, cadence, prompt, phase, ownership, signet, or conversation name was changed.

The current :48 run remains IN_PROGRESS at the latest readback, with no run-level `chat_ref`; its cached result is the preceding Alberr run, not current Elias output. The next deterministic label, Nadir Voss, is already the current :00 task label and that run is also IN_PROGRESS. No new handoff was created because there is no authenticated recipient thread and the successor run had already started. No direct-thread delivery, consumption, acknowledgment, or response obligation is claimed.

No per-worker README/CURRENT_WORK checkpoint was rewritten: this is an assistant-level reconstruction without an authenticated Elias thread, and per-worker checkpoints retain one primary owner/writer. This report and its Common receipt are the durable audit artifacts.

**Final:** `H1027_S4_ELIAS_KERN / REVIEW_MIND_RUN_PROVENANCE / RESULT_RUN_JOIN_GUARD_IDENTIFIED / TWO_CURRENT_MATCHES_TWO_PRIOR_CACHE_RESULTS / NO_AGENT_INDEPENDENCE_INFERENCE / PR742_SAME_TREE_LEAN_EXACT_HEAD_REPLAYED / PR2330_MERGE_REFERENCE_LEAN_SUCCESS_REVIEWED / MERSEARCH_LANES_OCCUPIED / HSH_RESOURCES_PAYLOAD_NOT_OPENED / ORSON_P1_PROTECTED / FIE_DEC04 / FOUR_TASKS_PRESERVED / NO_SIXTH_TASK / NO_POC_OR_PRODUCTION_CHANGE / NO_PHYSICAL_VALIDATION / NO_THEORY_PROMOTION`.
