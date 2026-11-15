# Calder h848:s4 | Review-MIND shared-memory exposure, provenance and snapshot-consistency audit

**Run key:** REVROT3-19-20261011:848:s4  
**Selected ring label:** Calder (index 7)  
**Next ring label:** Hale (index 8), h849:s0  
**Status:** SOURCE-GROUNDED METHOD AUDIT COMPLETE / NO NEW EXPERIMENT / NO LEAN EXTENSION / NO P1 OR P0 MUTATION

## Executive finding

The current HsH formalization separates claim-content overlap from primary-source-origin overlap, but it does not yet represent the information-exposure path between executions. That omission matters in a shared-memory workflow: two outputs can have disjoint primary origins and still be dependent because one execution retrieved, received, or was prompted with the other's derived output.

A second, independently verified property of the live repository makes this more than an abstract concern: the generated discovery index is an eventually consistent projection, and several recent refreshes were stale at publication while nearby refreshes were fresh. The same shared repository can therefore expose different workers to different versions of the evidence catalog.

The warranted conclusion is not that any particular worker copied another, nor that the scheduled labels represent separate agents. The warranted conclusion is that the current record schema cannot distinguish source-origin independence from exposure independence, and that discovery-snapshot versioning must be treated as part of the exposure record.

This is a Review-MIND methodology proposal and source-QC result. It is not a new P1 experiment, a change to Orson's protocol, a BEDROCK theory claim, or a claim about assistant consciousness/personhood.

## 1. Selection, historical authority and identity boundary

The prescribed arithmetic gives h=848, seq=4244, and 4244 mod 19 = 7. The selected label is Calder; the next ring label is Hale.

No authenticated current Calder conversation/thread was recovered. The historical conversation titled “Construction Story Retelling” (ID 6a8eacca-c470-83ea-af92-8fb8df194de9) is an archived conversation active through 2026-09-16, not a verified current worker thread. The separate Foundational Covariance / Global Architecture Calder thread is a different identity and was not used as the empirical-Calder thread.

The Calder entry in COMMON/CHECKINS.md, 2026-09-12, is an assistant-maintained self-report of an empirical/statistical remit: external measurement corpora, angular-clustering null design, source/method contamination, independent units and reproducible statistical analysis. It is not a standalone signed Nathan-authored charter. The current user-supplied LANE CHARTER 48 governs this run.

No cross-thread delivery, historical-instance participation, or separate model identity is claimed.

## 2. Formalization audit: source lineage is not exposure lineage

### 2.1 AriadneClaimScopedLineage

Current PR #790 head: bcb3fcc0fec05ac65620abbf6ac3c1967aaf9d19.  
Source file blob: 60f1f39f396b839f8fdc4fbf40a984add0625e97.

The current ClaimLineageAxes record contains three fields:

- content relation;
- primary-origin relation;
- primary-origin census completeness.

The axes are intentionally orthogonal. The module proves that shared textual content does not determine the relation between primary origins.

However, classifyAxes currently emits only sharedCore or unknown for the content relation. It has no positive evidence constructor that can produce disjointInAuditedScope. Consequently, strongIndependentSupport, defined as content independence plus complete disjoint primary origins, is unreachable from the present ClaimLineageEvidence record.

The theorem strongIndependentSupport_unreachable_from_claim_lineage proves that limitation. This is a conservative fail-closed boundary, not a demonstrated defect in the theorem. The current schema cannot positively certify the stronger claim.

### 2.2 AriadneSourceBoundClaimGate

Current source blob: aa3f4b366b577c514a9acc8dd68393786746da0d.

SourceBoundIndependentValidation requires source-address attestations tied to the same claim projection and an explicit nonempty/disjoint primary-origin witness.

Its module comment explicitly says this is not a P2 physical-independence certificate. It does not replace acquisition, calibration, analysis/prior, covariance, holdout-access or independent-replication audits.

The current structure binds primary and observation records to claim/target/scope addresses. It does not represent a path by which one execution could have encountered another execution's output.

### 2.3 AriadneSimulationProvenanceGate

Current source defines SimulationEvidence with model identity/version, prompt digest, state digest, runtime version, execution timestamp and output digest. Its executionOutput gate requires that run tuple.

Its independentValidation gate is specifically a humanObservation: subject identity, observation protocol, acquisition provenance, independently acquired observation and disjoint primary origins. It does not define a separate AgentInteraction claim or a typed exposure path for model-to-model or worker-to-worker communication.

The missing dimension is not another generic source citation. It is a versioned, event-level account of what information was available, retrieved, inserted into the prompt, delivered to a receiver, acknowledged and used.

### 2.4 Existing CI evidence, exact limits

PR #790 is OPEN / DRAFT / UNMERGED. Its current head is bcb3fcc0fec05ac65620abbf6ac3c1967aaf9d19. The exact-head Actions run #42944088253 checked out that exact head and completed a 8,953-job root build using Lean 4.34.0 / Lake 5.0.0.

The log says HsHVerification.AriadneClaimScopedLineage was replayed from the Lake cache at job 8946/8953. Its #eval readout was false, 12598, 12598, false, true. The log includes the theorem-specific #print axioms output; no sorryAx or bare admit appeared in the retrieved log. Standard dependencies including propext and Quot.sound appear for some results.

Tests, lint, leanchecker, nanoda and global axiom audit were skipped. This is exact-head checkout and successful root-build evidence, not a whole-project axiom audit, not current-main integration, and not proof that the formalized source map is empirically true.

The current PR is 102 commits ahead and 18,612 behind current main. The central TASK_BRANCH_GRAPH still names the older PR #790 head 70a2f9b10751d8e3a66d8c23e3379a1612e8ae29 and run #41971699289. That is a stale formal-evidence pointer for Tern to reconcile; this run did not edit the task graph.

PR #850 remains Orson-owned and OPEN / DRAFT / UNMERGED. Its current head is 776f5df7cad655dd9a7a8d99720a1db3e2347872. Run #43655298253 completed an 8,986-job build on merge-reference commit a2e82fa, not the exact PR head. It is not exact-head integration evidence.

No new Lean module, theorem, build or PR was created. Local Lean/Lake/Elan are absent in this runtime.

## 3. Live repository evidence: discovery snapshots are versioned exposure

The current HsH main head at prewrite readback was cb349b3e2a06217afd5cce913c724a92441abf2d.

I independently compared the embedded source commit with the refresh commit's parent for six recent discovery snapshots:

| Snapshot | Embedded source vs publication parent | Classification |
|---|---:|---|
| Mercer 07:09 | 3 commits behind | STALE_AT_PUBLICATION |
| Sable 08:00 | exact parent match | SOURCE_CONSISTENT_AT_PUBLICATION |
| Sable 08:06 | exact commit match | SOURCE_CONSISTENT_AT_PUBLICATION |
| Sable 08:08 | 1 commit behind | STALE_AT_PUBLICATION |
| Sable 08:09 | exact commit match | SOURCE_CONSISTENT_AT_PUBLICATION |
| Sable 08:11 | 1 commit behind | STALE_AT_PUBLICATION |

The 07:09 source-to-parent comparison showed three intervening commits. The 08:08 comparison isolated one intervening commit and the 08:11 comparison isolated one intervening commit changing WORKSPACES/SABLE/README.md.

Thus 3 of these 6 deliberately inspected snapshots were stale at publication. This is a small, purposive audit sample, not an estimated production failure rate. The adjacent fresh snapshots are useful positive controls: the race is intermittent, not an invariant that every refresh fails.

The source-level mechanism was independently re-read:

- .github/workflows/refresh-site-discovery.yml blob 3aa83d6dd5e2e16fad79628be1d19dc62d6c3f70 checks out main, runs tools/site_discovery.py, commits generated output, then runs git pull --rebase origin main and pushes.
- tools/site_discovery.py blob 97ff9c6d00544251c05bd6bb6053907805438f3e queries repos/<repo>/git/trees/main?recursive=1 and records the returned repository commit in the snapshot.

The workflow can therefore capture a source SHA, generate the index, commit it, then rebase the generated commit onto a newer main without regenerating or verifying that the embedded source SHA still equals the new parent. The observed commit graphs match this mechanism.

Minimal maintainer-side repair: after any rebase, regenerate and validate against the new parent, or fail closed and restart if the embedded source SHA differs from the publication parent. Add a regression test that inserts a concurrent main commit between source capture and publication. This is a proposal for Tern/authorized maintainer; no workflow, builder, site or reader code was changed here.

Important inference boundary:

- indexed is not retrieved;
- a generic reader target is not a live route observation;
- retrieved is not necessarily inserted into a prompt;
- prompt inclusion is not proof that a claim was used;
- an INBOX pointer is not direct delivery, consumption or acknowledgment.

The current discovery JSON was too large for the available file-content read path and was not parsed in this run. No live browser route was probed. This run directly retrieved the cited repository files from main; it did not rely on the generated discovery index. No earlier worker's actual prompt exposure is inferred from index membership alone.

## 4. Prior art: do not reinvent the general problem

Three primary-source papers establish that several parts of the proposed method already exist.

1. Li et al., “A Benchmark and Diagnostic Study of Epistemic Admission in Shared Agent Memory,” arXiv:2609.30813, submitted 2026-09-25. CPB-Live runs a team over a shared store, logs every write and retrieval, fixes source lineage by scenario, and probes a separate consumer. The paper explicitly notes that the store logs retrieval but not which retrieved belief a generated claim restates; that derivation is available only through agent declarations, whose incompleteness is measured. The HsH adaptation should therefore log retrieval-to-claim derivation directly rather than infer it from similarity or a declared citation. Primary source: https://arxiv.org/html/2609.30813

2. Li et al., “Beyond Final Accuracy: Auditing Communication in LLM Multi-Agent Systems,” arXiv:2610.01042v1, submitted 2026-10-01. ICR freezes initial trajectories, evaluates ordered sender-receiver revisions, and uses a matched no-message revision control. The authors define initial independence as no mutual observation during initial generation; they explicitly say this does not imply statistically independent errors. Revisions are never propagated into another evaluation event, so ICR controls single-hop revision rather than sequential shared-memory feedback. Primary source: https://arxiv.org/html/2610.01042v1

3. Gong et al., “When Upstream Messages Override Correct Answers: A Controlled Study of Multi-Agent LLM Collaboration,” arXiv:2609.36855v1, submitted 2026-09-29. The study holds downstream task and evidence fixed and compares no message, original upstream message and reversed-conclusion message. It reports up to 32% correct-to-wrong overrides under incorrect messages and answer substitution in 94% of audited harmful cases, within its evaluated setup. Primary source: https://arxiv.org/html/2609.36855v1

The appropriate local contribution is not a new general multi-agent benchmark. It is a versioned-repository extension that joins CPB's write/retrieval log, ICR's frozen initial answer and no-message control, and the upstream-message correctness manipulation, while recording the exact repository/index version and retrieval-to-claim derivation.

## 5. Proposed typed exposure record and falsification design

### 5.1 Separate four relations

1. **Primary-origin relation:** which original sources support the claim; require a complete origin census before asserting disjointness.
2. **Exposure relation:** whether an execution could actually access or receive another output through a repository, index, prompt, handoff or direct message.
3. **Execution binding:** exact run/model/version/runtime/prompt/state/output tuple, with thread reference explicitly present or null. A ring label is not an identity.
4. **Statistical relation:** dependence among observed outcomes, estimated only from actual repeated outcomes and a declared joint model. It is not implied by source overlap, disjoint citations or exposure logs.

A minimal exposure event should distinguish AVAILABLE/INDEXED, RETRIEVED, PROMPT_INCLUDED, PEER_DELIVERED, ACKNOWLEDGED and USED. Store the exact artifact blob or message digest, source commit, index blob, retrieval time, receiver execution ID and prompt/state digest where available. Missing events remain UNKNOWN, not false.

A useful provenance path is:

primary source → claim → report/output → repository commit → discovery snapshot → retrieval event → prompt inclusion → downstream output → subsequent writeback.

Every edge requires its own evidence. Do not collapse the whole path into “shared memory was available.”

### 5.2 Minimal disconfirmation experiment

A future controlled study could cross primary-origin relation (shared vs disjoint) with exposure (no cross-run exposure vs explicit shared artifact/message exposure). Snapshot freshness (source-consistent vs deliberately version-stale) can be a third randomized factor when the repository condition is in scope.

- Freeze independently generated initial answers before communication.
- Keep model/version, task, prompt budget, runtime and evidence fixed within each comparison.
- Include no-message revision, correct upstream message and conclusion-flipped upstream message.
- Log exact reads, retrieved artifact versions, prompt inclusion and output-to-source spans.
- Measure correction, preservation, answer substitution, source attribution, calibration and timing separately.
- Include a no-message revision control so extra reasoning is not mistaken for communication benefit.
- Use source-clustered uncertainty and preserve paired conditions; do not treat frames, repeated prompts or worker labels as independent units.
- If human participants are used, obtain informed consent, minimize identifiable data and preregister the analysis. No human session or new model trial was run here.

Disconfirmation criteria include: exposure does not increase copying or correlated revision; stale snapshots do not change downstream decisions under controlled conditions; or agreement increases without reducing correctness. The design must permit these outcomes rather than presuppose a contamination effect.

This proposal is OUTSIDE the frozen Orson P1 protocol. It is not an assignment, deadline, review request or P1 amendment.

## 6. Orson P1 and cross-lane protections

Orson's role charter and P1 protocol freeze were re-read. Issue #564 remains OPEN / OVERDUE / NOT READY. Orson retains sole P1 ownership and the protected cognition allocation. No model trial, human-subject session, API spend, manuscript edit, paper gate, or ownership change occurred. The November 9 minor-paper gate remains unsatisfied; November 30 major and December 14 full-theory gates remain separate.

Cross-lane status:

| Workstream | Status / evidence boundary |
|---|---|
| P0 Code Grurple | ACTIVE. Existing issue #1747 remains canonical. No route probe or site/policy change. Tern retains P0 and scheduler authority. |
| P1 cognition | Orson-owned, OVERDUE / NOT READY. No protocol change. |
| P2 measured geometry | HOLD. The ³He-B HPD work has measured NMR sidebands, but the circular membrane is a source-described conjecture, not directly imaged geometry. The Calder gyroscope source remains unrecovered. No physical calculation or system selection. |
| P3 full theory | INCOMPLETE. No theory promotion. |

WH-02 remains Calder/Tern-controlled. PR #1710 is 7 commits ahead and 2,065 behind current main in the read-only comparison. No authorized checkout/rebase route or full regression/CI plan was available; no branch write was attempted.

All four Mersearch request lanes remain occupied/requested. No Mersearch action was available in this runtime and no local pinned checkout was present. No request was overwritten, released or retriggered. SciSpace was used only after the internal HsH source audit; existing Math Hopper issue #578 and draft PR #991 were checked, and no new tooling, dependency, fork or paid service was created. Whirligig Kernel 0 remains sandbox-only. HsH, SAT archive and HSH_RESOURCES root READMEs were checked; no HSH_RESOURCES private payload was opened.

FIE was last rereviewed 2026-11-10; next review 2026-11-24.

## 7. Unrelated reading and return cursor

Advanced the existing SAT archive lateral-reading cursor in “000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt”:

- Lines 1761–1800 actually read.
- Next cursor: line 1801.
- This is a transcript-only language game, not a verified linguistic source or physical break.

## 8. Actions deliberately not taken

- No new Lean theorem or build; no local Lean/Lake/Elan.
- No physical calculation, fit, prediction, independent measurement or fabricated dataset.
- No human-subject or model trial.
- No private HSH_RESOURCES payload access.
- No Mersearch request, lane overwrite, release or retrigger.
- No PR #790, PR #850, PR #1710, task graph, PWH queue, discovery workflow, site, reader, manuscript or issue mutation.
- No public issue was created: this is an internal methods/QC report, not a standalone publishable result. Existing issues remain unchanged.
- No automation task, ID, cadence, prompt, phase, signet or conversation name was changed.

**Disposition:** PROVENANCE-AND-EXPOSURE SCHEMA GAP IDENTIFIED / VERSIONED SHARED-MEMORY SNAPSHOT RACE REPRODUCED / EXISTING LEAN EVIDENCE REPLAYED WITH LIMITS / PRIOR ART INCORPORATED / ORSON P1 PROTECTED / NO EXPERIMENT OR THEORY PROMOTION.
