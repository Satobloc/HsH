# Elias Kern :36 | h841:s3 | Track A source-run witness and candidate-freeze correction

**Disposition: H837:S4 CANDIDATE-HELPER DEFECT INTERPRETATION CORRECTED AGAINST UNCHANGED SOURCE · BASE SELF-TEST 7/7 REPRODUCED · ACTOR-REGISTRY PATCH 13/13 REPRODUCED · SEPARATE FREEZE-BINDING COUNTEREXAMPLE REPRODUCED · NO POC/PR/PRODUCTION CHANGE · TRACK B DISPOSITION STILL PENDING.**

## 1. Rotation, authority, and thread status

`h=841`, `seq=5(841)+3=4208`, and `4208 mod 19=9`.

- Selected ring label: **Elias Kern**, index 9.
- Next ring label: **Nadir Voss**, index 10.
- Run key: `REVROT3-19-20261011:841:s3`.

Selection is not instance or thread authentication. The :36 automation run has `chat_ref=null`; the current automation conversation is not an authenticated Elias specialist thread. Existing-thread search did not establish a usable current Elias thread. No direct cross-thread delivery is claimed.

The historical Elias remit is grounded in the direct user instruction preserved in Elias/Tern inbox material: Track A workflow-switchboard prototype operation and documentation, with Nathan/Orson coordination and Sable/Tern Track B separation. The workspace README is assistant-maintained. No standalone signed specialist charter or original source-conversation ID was recovered. The direct instruction's limits remain controlling: no independent production-workflow authority and no SAT/H(s)H theory authority.

## 2. Required source and repository preflight

Read the live HsH BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, revival rotation and thread-first rules, current main branch, recent receipts, Elias README/CURRENT_WORK/INBOX, and the preserved direct assignment. Read the HsH, SAT archive, and HSH_RESOURCES front doors, plus the HSH_RESOURCES Tool Chest, switchboard READ_ME_FIRST, and POC description.

Prewrite repository snapshots:

| Repository | Observed main snapshot | Relevant state |
|---|---|---|
| HsH | `5c3b4774184cd61f23d32760aeb369152727596d` | Current control/reporting branch before this run's writes |
| SAT theory archive | `f6e3c9148b2d7e41c8c0a6b1e5f8d3a9c7b2e104` | Front door read; no theory artifact changed |
| HSH_RESOURCES | `0545b9d9a1b1c2941f2b30fa86ffec76a9f88178` | Inventory refresh; switchboard source file unchanged from the earlier pinned source snapshot |

Mersearch was attempted first. All four request lanes remain occupied/requested; no callable Mersearch action and no local pinned three-repository checkout were available. No request lane was overwritten, released, or retriggered. Bounded direct reads of the already-authorized Elias prototype source were used as fallback. The HSH_RESOURCES private/internal source locator and raw source are not reproduced in the public artifact.

Existing POC, Tool Chest, Math Hopper/Whirligig references, installed capabilities, and Lean PR #951 were checked before proposing the new evidence contract. The available SciSpace connector was not relevant to this source-execution task. No new dependency, fork, subscription, paid service, or repository tool was introduced.

## 3. Exact source identity

The switchboard source at the h837 report's pinned HSH_RESOURCES commit `d0a71f69062088c56d02a131933b3b1541d99dd9` and current main commit `0545b9d9a1b1c2941f2b30fa86ffec76a9f88178` has identical file bytes.

| Object | Bytes | Git blob SHA-1 | Raw SHA-256 |
|---|---:|---|---|
| Original switchboard source | 18,924 | `49988a769389b2baf264a27d596ba7c3ff822b36` | `876393e188134f059a1e3f4f6daecd7465495e7124e7b6c1d9d44b7063dcdf2a` |
| Preserved actor-registry patch | 3,076 | `fb5c79eaa6bc92d9e0b4eeb34e61f27af0c4c0c1` | `762ba3bdaff1694740039938ee9d518354f0b8727934bc73924d583016deef34` |
| Patched isolated copy | 20,361 | `213336bc96d01017e74fe9b4ad829e2cf32962f1` | `637f4c532835295031cbdb4670fe2ba3bf1c3856c4ae0a760de0aaedbea4d067` |

The preserved patch adds the Elias actor entry, one scenario, and six authority/routing assertions. It does not alter `candidate_scenario`, `apply_checks`, or the Hydra candidate branches. The patch was applied only to an isolated copy. Neither HSH_RESOURCES nor the HsH POC/PR was modified.

## 4. Exact-source execution and correction of h837:s4

Environment: Python 3.13.5, Linux x86_64, standard library only, isolated mode. Commands:

- `python3 -I -S workflow_switchboard_demo.py self-test`
- `python3 -I -S workflow_switchboard_demo_elias_sandbox.py self-test`
- `python3 -I -S source_run_witness_replay.py`

All three completed with exit code 0. No network access or external package was used.

| Run | Result | Stdout bytes | Stdout SHA-256 | Stderr |
|---|---:|---:|---|---|
| Original source self-test | 7/7 | 274 | `cca1febf9d4224b9bb6dbf7619b5b8ca7a15e82371d6719dcf5b2962e9cca20f` | 0 bytes |
| Patched sandbox self-test | 13/13 | 531 | `10a9963879b7640c760a5e4cf876231669d7a71608f3c29b82e0c9c4666ae154` | 0 bytes |
| Combined exact-source replay harness | All assertions passed | 1,244 | `3b6d8885831c36b4cc9e68eea0feccd145f268323fcf79edf31c9afb6b54a8e0` | 0 bytes |

Empty stderr SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Replay harness SHA-256: `8f991c8c76b0a5a80b6ea80c4926d3c1c0a431050866259cafae0368889ca081`.

The exact-source controls give:

| Input | Math check | Candidate stage | Hydra jobs |
|---|---|---|---|
| `candidate_scenario(False)` | `fail` | `checked_fail` | `prune_rebuild`, `salvage_lessons` |
| `candidate_scenario(True)` | `pass` | `checked_pass` | `prediction_packet`, `paper_pipeline`, `independent_reality_check` |

Base and patched candidate-scenario outputs are identical. The negative case does not spawn the pass-path jobs; the positive case does not spawn the prune path.

The h837:s4 report and issue #1755 claimed that both boolean branches resolved to a passing math-check status and that the negative case reached `checked_pass`. The exact pinned source contradicts that interpretation. In the source, `status` is `pass` for true and `fail` for false; the conditional at `candidate_scenario` lines 314-324 preserves that distinction. The built-in negative-case self-test passes. The actor-registry patch's 13/13 result is also reproducible.

**Correction:** the h837 candidate-helper defect claim was an assistant source-interpretation error, not a source-code change. The source blob is identical at the earlier and current reference commits. The earlier h837 report and receipt remain immutable; an additive receipt amendment records this correction. Issue #1755 remains publisher-rejected for SHA-256 mismatch and is not retried.

## 5. Separate candidate-freeze defect remains reproduced

This correction does not invalidate the earlier freeze-coherence finding at [issue #1727](https://github.com/Satobloc/HsH/issues/1727).

The source's `apply_checks` method merges results by check type with `checks.update(results)`; its check receipts do not carry a candidate/freeze identifier. The bounded exact-source software probe used synthetic software labels, not physical fixtures:

1. Record a passing math check while the active candidate label is `freeze-A`.
2. Change the active candidate label to `freeze-B`.
3. Add passing adversarial and provenance results.
4. The aggregator sets the active candidate stage to `checked_pass`.
5. Change the active candidate label again to `freeze-C`; the stage remains `checked_pass`.

A separate incomplete-check control leaves the stage at `constructed`.

This is a reproducible POC state-coherence counterexample. It is not a production failure, physical calculation, or independent empirical result. The candidate-failure helper is correct; the candidate-check aggregator remains unbound to a single frozen candidate.

## 6. Substantive architecture improvement: SourceRunWitness

Proposed a SourceRunWitness contract that separates execution evidence from candidate identity and from the EvidenceLedger's subject-scope/reviewer/exposure evidence.

A witness should record:

- exact source repository, commit, path, Git blob identity, raw-byte digest, and byte count;
- exact patch identity and base/result source identities;
- unit under test, source span, harness identity, and fixture/input provenance;
- interpreter/runtime, dependencies, working directory, and exact command;
- run ID/timestamps, exit code, stdout/stderr byte counts and digests;
- named assertions with expected and observed values;
- execution scope: static inspection, method replay, built-in self-test, integration test, or production observation;
- skipped tests, independent reproduction, and reviewer/authority status.

These dimensions must not collapse into one green status. A method replay is not a full self-test. A full self-test pass requires pinned source, harness, fixtures, runtime, command, exit code, raw outputs, named assertions, and explicit skipped-test accounting. Independent reproduction requires a second execution. Production validation requires an actual deployment and event record.

**CandidateFreeze and SourceRunWitness are separate identities.** Each check receipt should carry both the current candidate-freeze ID and the source-run-witness ID. A pass is valid only when every required check is attached to the same current freeze. Changing the candidate invalidates old results for the active gate while preserving them in history.

For an empirical H(s)H comparison, a candidate freeze must additionally bind exact source/equation versions, definitions and projection/composition maps, shared parameters, calibration, holdout split, data manifest, units, and uncertainty model. This is a workflow contract proposal, not an implemented POC schema or BEDROCK rule.

## 7. Formalization and research limits

The cross-freeze behavior is a finite state-machine property suitable for source-faithful Lean formalization. The target is to prove or exhibit a state sequence in which differently frozen check receipts produce `checked_pass`, and that candidate mutation fails to invalidate the active stage.

No Lean theorem or build was performed. The local environment has no Lean, Lake, or Elan. PR #951 remains OPEN/DRAFT/UNMERGED with 77 commits, 19 files, and zero formal reviews/review threads. ELIAS-2224's Track B disposition remains pending. No PR, branch, POC, adapter, or production workflow change was made. A Lean proof would validate only the formalized state machine, not the Python-to-model translation.

No physical calculation, fit, prediction, independent measurement, human/model trial, SAT-O/Blockwave equation modification, paper-gate advancement, or theory promotion occurred. No new P1 task was assigned; Orson's ownership remains protected.

## 8. Publication and continuity

A separate public-safe correction was submitted through the existing publisher:

- [Issue #1768](https://github.com/Satobloc/HsH/issues/1768)
- Submission ID: `elias-h841-source-run-witness-correction-20261115t0136z-s3-001`
- Content SHA-256: `4b586e1d5349aac652265c9ace321d242a52770e711980968c3484cfbe751ab9`
- Publisher disposition at report creation: `PUBLISH_PENDING`.

The public artifact contains no internal HSH_RESOURCES path, raw source, or private source locator. It is a new correction, not a retry of #1755 and not a duplicate of #1727.

## 9. Project and control-plane status

- P0 Code Grurple: ACTIVE.
- P1 cognition, Orson-owned: OVERDUE / NOT READY.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- FIE next review: November 24.
- The task graph remains 18 records against 16 declared branches; Tern retains graph authority.
- WH-05 remains blocked by occupied Mersearch lanes. WH-02 remains the highest unblocked item and Calder/maintainer-owned. No queue ownership was changed.
- All four Mersearch request lanes remain occupied/requested. No new request was submitted.
- The previous h840 unrelated-reading quantum remains recent; no duplicate reading quantum was manufactured. FIE review is not yet due.

## 10. Successor and scheduler routing

Next ring label is Nadir Voss. Nadir's h841:s4 :48 run had already started before the optional packet was created. A repository-only packet is therefore classified POST_START_OPTIONAL_CONTEXT_ONLY. It corrects the h837 helper interpretation while preserving the h822 candidate-freeze finding. It assigns no task, requests no review, creates no response obligation, and does not alter Nadir's finite-core geometry remit. No direct thread delivery, consumption, or acknowledgment is claimed.

Sable/Tern receive a separate optional correction packet because the earlier h837 Track B context carried the mistaken helper interpretation. ELIAS-2224 remains pending. No new Track B request or ownership transfer is made.

Scheduler observation for Tern only: the existing :36 task run ID `6e6dc6a2-fbb4-8326-bb47-548497f41394` reports scheduled `2026-11-15T01:36:00Z`, started `2026-11-15T01:31:46.733995Z`, status `IN_PROGRESS`, completion null, and `chat_ref=null`. The cached latest result still points to h840:s3 Alberr. This is recorded as observed metadata only; no retry, restart, concurrency, or backend cause is inferred. Tern retains scheduler authority.

## 11. Automation integrity

The existing :36 task remains enabled under ID `6a9f52b69ec08191b0a2ba24a074f781`, with its exact existing hourly America/New_York :36 VEVENT, prompt, and phase unchanged. The :48 task also remains enabled under its existing ID and schedule. No task, ID, cadence, prompt, phase, or enabled-state mutation; no sixth task; no signet or conversation rename.

**Final status:** source-run correction established by exact pinned source execution; candidate-freeze defect independently reproduced at the software level; SourceRunWitness proposed but not implemented; public correction submitted and awaiting publisher verification; POC/PR/production untouched; automation configuration preserved.