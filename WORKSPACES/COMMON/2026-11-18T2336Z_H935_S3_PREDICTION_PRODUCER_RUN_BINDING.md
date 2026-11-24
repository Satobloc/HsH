# H935:S3 | Prediction producer-run binding at the existing P2 freeze

**Run key:** `REVROT3-19-20261011:935:s3`  
**Nominal slot:** 2026-11-18T23:36:00Z  
**Selection arithmetic:** `h=935`; `seq=5×935+3=4678`; `4678 mod 19=4`.  
**Selected ring label:** Alberr (index 4). **Next ring label:** Mira (index 5).

## Participation and authority

The ring label is deterministic routing bookkeeping, not identity authentication. Alberr's live workspace says manual reentry is required, no authenticated current thread is established, no task or response obligation exists, and autonomy is total. It also says there is no standalone signed Nathan-authored specialist charter or assigned specialty. The recovered REV-001 wake packet is an assistant-maintained reconstruction, not such a charter.

Accordingly, this is **current-assistant, project-level Lane 36 work**, not Alberr-authored work or a claim that Alberr accepted a lease. No task was assigned to Alberr. Mira is next by ring arithmetic, but her Code Grurple quarantine boundary is not cleared; no Mira inbox write or handoff was made.

## Executive result

The existing P2 architecture binds comparison freezes, source/map/data witnesses, prediction-seal events, holdout access, evaluation artifacts, and chronology in separate but increasingly connected contracts. One remaining join is not explicit:

**The prediction-seal event must bind to the exact execution witness that generated the prediction bytes.**

A digest identifies the prediction file. A seal event can identify when a file was declared frozen. Neither, by itself, identifies the exact source, harness, command, environment, inputs, and execution whose output became that file.

This is an additive crosswalk at the existing `ComparisonFreeze` / `SourceRunWitness` boundary. It creates no new freeze, gate, schema, status taxonomy, or physical mechanism.

## 1. Existing surfaces checked

- P2 `ComparisonFreeze`, issue [#1735](https://github.com/Satobloc/HsH/issues/1735): paired H0/H1 comparison identity, common observation, calibration, covariance, shared parameters, holdout, comparator, analysis and decision rule.
- Ordered source-to-laboratory-to-instrument/readout chain, issue [#1738](https://github.com/Satobloc/HsH/issues/1738).
- `SnapshotBoundMapEdge`, issue [#1845](https://github.com/Satobloc/HsH/issues/1845): proposed exact source snapshot, locator, map artifact, domain/codomain, units, frame, composition order, conditions and transport status.
- `SpacetimeIndexWitness`, issue [#1847](https://github.com/Satobloc/HsH/issues/1847): proposed acquisition identity, array shape/axis order, coordinate vectors, units, masks, flattening and processing lineage.
- `SourceBoundP2Bundle`, PR [#1858](https://github.com/Satobloc/HsH/pull/1858): exact-head Lean build previously passed.
- Typed temporal provenance, PR [#1860](https://github.com/Satobloc/HsH/pull/1860): exact-head Lean build previously passed.
- Morrow Layer 10 event/artifact binding, issue [#1946](https://github.com/Satobloc/HsH/issues/1946): binds event claims to exact artifact bytes, repository snapshot, protocol, event time and access/evaluation lineage.
- Kestrel H918 freeze-event cross-binding, issue [#1962](https://github.com/Satobloc/HsH/issues/1962): binds map/index/readout/model witnesses and prediction/holdout/evaluation artifacts into one comparison-freeze lineage.
- Elias `SourceRunWitness` proposal, issue [#1768](https://github.com/Satobloc/HsH/issues/1768), plus `EXECUTION_ENVELOPE_COMPOSITION_MAP_v0.2.md`: proposed exact run/source/harness/command/environment/output identity. This remains a proposal, not an implemented P2 field or production schema.

## 2. The uncovered producer binding

H918 requires prediction event `P` to reference the comparison freeze, frozen H1 model, map/readout witnesses, code/configuration and prediction digest `p`. It then requires holdout-access event `U` and evaluation event `E` to preserve the same lineage and exact inputs.

Morrow Layer 10 binds the event to the exact prediction bytes and protocol. It explicitly warns that a digest establishes byte identity, not when those bytes were generated. Elias's proposed `SourceRunWitnessKey` supplies the missing producer-side identity, but it is not yet joined to the P2 prediction seal.

The remaining ambiguity is therefore:

- a prediction file can have a valid digest;
- a seal event can have a source-backed time;
- code/configuration can be listed in the freeze;
- yet no typed witness may connect that exact output digest to the exact execution of that code/configuration on the frozen inputs.

This is not evidence that any existing prediction was fabricated. It is an admissibility gap in the proposed chain.

## 3. Minimal additive join

For a prediction seal `P` under comparison freeze `C`, require a reference to one or more producer `SourceRunWitness` records in the same canonical manifest.

Each producer witness must bind:

1. **Run identity:** execution namespace, exact task/provider run ID, and an attempt ID only if the provider exposes one. Otherwise retain `ATTEMPT_UNEXPOSED`; do not infer attempts.
2. **Source identity:** repository, commit, tree, path, blob and byte identity for the executed source.
3. **Execution identity:** harness digest, exact command digest, environment/toolchain/dependency identity, configuration and execution scope.
4. **Input identity:** exact model-freeze, source/map/readout, observation/data, calibration/covariance, shared-parameter and decision-rule inputs, all resolved within `C`.
5. **Output identity:** the run's prediction-output digest must equal the exact prediction digest `p` named by `P`.
6. **Execution result:** exit status, raw stdout/stderr digests, named assertion manifest and explicit skipped-test accounting.
7. **Time identity:** source-backed execution-time interval, clock domain/scale and separate audit-observation time.
8. **Nondeterminism:** seed/state and relevant external state where controlled; otherwise record that reproducibility is uncharacterized rather than silently assuming determinism.
9. **Scope:** distinguish `PREDICTION_GENERATION` from `CI_COMPILE`, `METHOD_REPLAY`, `INDEPENDENT_REPRODUCTION` and `PRODUCTION_OBSERVATION`.

The existing chronology remains: `P` must be definitely before holdout access `U`, and `U` definitely before evaluation `E`, using comparable clock domains and uncertainty intervals. `E` must consume the same `p`, exact held-out data digest `d`, scoring/analysis digest `a`, and result digest `r`.

An independent reproduction is a separate execution witness and, for a physical replication claim, must also have a distinct acquisition root. A new run ID alone is not independent evidence.

## 4. Fail-closed diagnostics

Reuse existing freeze and evidence statuses rather than creating a new taxonomy:

- Missing producer witness: `UNBOUND`; no prediction score.
- Producer freeze or input mismatch: `FREEZE_BINDING_MISMATCH`.
- Run output digest differs from `p`: `PREDICTION_OUTPUT_UNBOUND`.
- Wrong execution scope, such as a Lean CI build offered as the physical prediction run: `EXECUTION_SCOPE_MISMATCH`.
- Missing command, harness, environment, or input manifest: execution reproducibility remains unverified.
- Unexposed provider attempt identity remains `ATTEMPT_UNEXPOSED`, not a fabricated failure or inferred retry.

A successful Lean compilation is not the physical prediction execution. The formal-build witness and the scientific prediction-run witness must remain distinct.

## 5. Formal verification and limits

No new Lean module or PR was created because the proposed `SourceRunWitness` fields are not yet an adopted P2 type or implemented manifest contract. Formalizing a reconstructed schema before its source authority and field names are accepted would overstate the result.

Two existing exact-head Lean runs were independently re-read:

- PR #1858, head `85780267a86bcadbcc4895e2031674f150f783e4`, run [#43969861179](https://github.com/Satobloc/HsH/actions/runs/43969861179), job `133658858335`: exact PR-head checkout assertion passed; Lean 4.34.0 / Lake 5.0.0; full build completed, 8,950 jobs. `LoomSourceBoundComparison` compiled; its reported source-bundle equality and declared-list-membership theorems had no axiom dependencies. Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped.
- PR #1860, head `1dc0f79901e18ff7df609db6ecf723c7c80afa70`, run [#43973867276](https://github.com/Satobloc/HsH/actions/runs/43973867276), job `133672845635`: exact PR-head checkout assertion passed; Lean 4.34.0 / Lake 5.0.0; full build completed, 8,951 jobs. `AldusTemporalProvenance` compiled; the reported strict-order and clock-comparability results were inspected. Some theorem reports depend on `propext`; the separate global axiom audit was skipped.

These are successful component builds, not a proof of the new producer-run join. No new theorem, exact-head build, global axiom audit, runtime validator or independent implementation check is claimed. Lean checks only its formalized statements, not source translation, artifact authenticity, timestamps, physical premises or empirical validity.

## 6. Scientific and project status

**P2 remains HOLD.** No measured system was selected, no raw dataset/version was acquired, and no physical calculation, fit, prediction, score, falsification threshold or independent measurement was produced. The Barckicke Figshare DOI remains a locator, not an analyzed dataset. No SAT-O or Blockwave equation was altered. No theory or paper gate was promoted.

P0 Code Grurple remains ACTIVE. PR #2009 remains draft/unmerged; no merge, rebase, deployment or live-route claim was made. P1 cognition remains Orson-owned and OVERDUE / NOT READY. P3 remains INCOMPLETE. FIE review is next due November 24, not due this run.

Mersearch is not callable in this runtime and all four request lanes remain occupied/requested. GitHub source search was used only as a bounded fallback. Existing Math Hopper #578, Lean PR #991, Whirligig Kernel 0 and the relevant existing Lean PRs were checked. No new tool, dependency, fork, branch, subscription or expense.

The task graph remains `ACTIVE_SEED`, 16 declared branches versus 18 records, discrepancy unresolved. WH-01 remains OPEN / P1-HIGH with its cursor unchanged; WH-02 remains Calder-owned; WH-05 remains blocked by the occupied Mersearch lanes.

## 7. Continuity and execution

- HsH default branch is `main`; final readback head was `5d5bacafa9a6304a16498e09562832714151633c`, a generated discovery refresh after this run's recorded start. No worker branch was assigned or modified.
- HSH_RESOURCES root README only; no private payload opened. SAT archive root README only; no equation/source alteration.
- The last completed unrelated-reading cursor remains `fun break - lx.txt`, lines 2041–2080; the next five-activation reading quantum is not yet due.
- No handoff to Mira: the Code Grurple quarantine boundary is not cleared. No inbox write, assignment, direct-thread delivery, consumption or acknowledgment is claimed.
- The existing :36 automation was independently peeked: task ID `6a9f52b69ec08191b0a2ba24a074f781`, enabled, original hourly America/New_York :36 schedule intact. Current run `85535885-a450-832a-beda-c4ee73c4c276` was `IN_PROGRESS` with `chat_ref=null` at final readback. No task, ID, prompt, schedule, phase, cadence or enabled-state change; no sixth task.

**Return pin:** `H935:S3 / CURRENT-ASSISTANT-LANE36 / ALBERR-LABEL-NO-ASSIGNMENT / MIRA-NO-HANDOFF-QUARANTINE / PREDICTION-SEAL-TO-SOURCE-RUN-WITNESS-JOIN / EXISTING-CONTRACTS-REUSED / COMPONENT-LEAN-BUILDS-VERIFIED / NEW-JOIN-NOT-FORMALIZED / P2-HOLD / P0-ACTIVE / PUBLISHED-STATUS-PENDING`.
