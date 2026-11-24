# Elias Kern h932:s4 | Case-only worker-label alias mutation probe

**Classification:** SOURCE-TRANSCRIBED METHOD-LEVEL COUNTEREXAMPLE / CONDITIONAL IDENTITY AMBIGUITY / NO UPSTREAM OR PRODUCTION TEST

## 1. Selection and authority

- Nominal UTC hour: **h=932**, beginning 2026-11-18T20:00Z.
- Sequence: 5(932)+4 = 4664; 4664 mod 19 = **9**.
- Selected ring label: **Elias Kern** (index 9); next: **Nadir Voss** (index 10).
- Run key: REVROT3-19-20261011:932:s4.

No standalone signed Elias specialist charter or authenticated current Elias conversation was recovered. The workspace preserves Nathan's 2026-09-24 Track A instruction: bounded operation/documentation of the sandbox Top/Central/Branch/Hydra and Threading prototypes, independent but communicating with Sable/Tern Track B, record actual behavior, and no production authority. This is assistant-level source-grounded work, not historical Elias participation. No direct-thread delivery, consumption or acknowledgment is claimed.

## 2. Preflight and source custody

Read the live HsH BEDROCK and 2026-11-08 Primary Operational Guideline, Steering Charter 2026-10-26, Three Paper Campaign, New Instance Start Here, three-repository onboarding and workflow orientation, Revival V3/V4/thread-first/routing, scheduler authority, Mersearch worker guidance, current task graph/main, Elias workspace/inbox/current checkpoint, h902/h913 receipts and reports, PWH state, and publisher-intake standard.

Pre-work HsH main was 4adb1a1b811ac5232da6d73f1e6b66470bd6a17b. Relevant source blobs:
- BEDROCK: 0253ace674bbc361464b7bbaac2c41aa3d8e8867 (667 lines).
- Primary Operational Guideline: a8e333b1d5b5aa1d9772366945dd88769d24153c (511 lines).
- Steering Charter: be44c424674764c602b5f618dfce528c0f97b0ef.
- Three Paper Campaign: 2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4.
- New Instance Start Here: 43b577d42b8cced83f8836934598081685ea3ff3.
- Three-repository onboarding: fe40260cda5ce360909f2adfd64a3cc3e2c92a05.
- Workflow Orientation v2: 2bb6d996ca61f41b2b3fb34480cab1acf906bd4f.
- Revival V3/V4/thread-routing: 7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14 / 6761337dfcd0847226ee7baad84db0a9c496760a / d9ea7c3a04e03822c65ee231d0b9545bf37907bd.
- Scheduler Authority: 9f7ffbbf0fe77fd4c561a110c9dbb2b686a88b45.
- Mersearch worker start: 086778737a004c467b0b52142d71aa5b961fc166.
- Task graph: 48cfe002495cabae9ff5a67cd72fc210b4fbfd36 (ACTIVE_SEED, 16 declared branches / 18 records).

The HsH, SAT archive and HSH_RESOURCES root README/front-door records were inspected. HSH_RESOURCES remains a private/internal reference boundary; no private payload or source was opened. Mersearch is not callable here; all four request lanes remain occupied/requested. GitHub search/read is a disclosed fallback, not a Mersearch run.

Existing resources were checked before any new tooling: the h902 receipt-replay harness, Math Hopper issue #578 and PR #991, Lean PR #951, and Whirligig Kernel 0. The existing standard-library Python harness sufficed; no tool, dependency, fork, subscription, API/model trial, cost, branch or PR was added.

## 3. Bounded mutation test

The test reuses the existing h902 source-transcribed method model (OutputReceipt, ThreadState.add_receipt, distinct_workers, and state_threshold_met). It does **not** execute the protected upstream module or authenticate any worker/event.

Baseline:
- 3 receipt rows;
- 2 raw worker-label strings;
- both success and failure outcomes;
- gate false (min_outputs=4, min_workers=3, both outcomes required).

Mutation: duplicate the first receipt and change **only** its worker-label case from Worker-A to worker-a. Artifact, seed version, outcome, timestamp and metadata remain identical.

Result, **11/11 assertions PASS**:
- row count becomes 4;
- raw string labels become 3;
- casefold-normalized labels remain 2;
- exact-row set contains 4 entries because the label differs;
- both outcomes remain present;
- the raw-string gate flips false → true;
- the same gate with casefolded worker labels remains false.

Reproducibility:
- Test: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ELIAS_KERN/CODE/receipt_label_alias_probe.py, SHA-256 c9eb032fa7ed2ef931f9da9753e81c8b38ef6395d51eaed767e614f2faf716eb.
- Output: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ELIAS_KERN/RESULTS/receipt_label_alias_probe_output.json, SHA-256 60e0bc7046ee1c67f2dc3cd3e6386da20b2a87612f74755df34a829a0a62bb04 (1,237 bytes).
- The test was executed in Python 3.13.5 against a local copy of the source-transcribed method definitions. It is reproducible with the existing h902 harness beside the test file. No upstream-byte or full-module execution is claimed.

## 4. Interpretation

**Conditional counterexample:** if Worker-A and worker-a are aliases of the same underlying actor, the source-transcribed gate counts the alias as a third worker and allows the four-row sample threshold to pass. This is a worker-label normalization ambiguity in the model, not a demonstrated production defect or real-world event.

Casefolding blocks this exact spelling mutation but cannot authenticate actors or establish independent work. The robust contract needs a stable authenticated ActorKey separate from display label, plus a stable ReceiptEventKey for idempotency. Same event key/same payload should be a no-op; same key/conflicting payload should be rejected/quarantined; distinct actors should be counted from authenticated keys, not labels. This is a proposal, not an approved schema or implementation.

This is an additive, narrow witness in the already-published receipt identity family (#1812), not a new general discovery. h902 exact-duplicate and h913 timestamp-only mutation results share the same source-transcribed method lineage; they are not independent upstream validations.

- h902 exact-duplicate report: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ELIAS_KERN/2026-11-17T1424Z_H902_S2_THREADING_EXACT_DUPLICATE_RECEIPT_COUNTEREXAMPLE.md
- h913 timestamp-mutation report: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ELIAS_KERN/2026-11-18T0148Z_H913_S4_TRACKA_RECEIPT_EVENT_IDENTITY_MUTATION_PROBE.md
- Existing public receipt-identity issue #1812: https://github.com/Satobloc/HsH/issues/1812

## 5. Proof-first triage and existing formalization

The finite identity-count proposition is mathematical and formalizable. Existing PR #951 already contains EliasThreadingWorkerIdentity, including finite aliased/distinct-world witnesses and a theorem that a label-only function cannot recover authenticated subject count. No new Lean module or proof was needed.

Fresh log readback:
- Actions run #42590880703 / job #129071904377: **SUCCESS**.
- Lean 4.34.0 / Lake 5.0.0, full 8,958-job build.
- EliasThreadingWorkerIdentity built at 8,930/8,958.
- #eval output: true, 1, 4.
- The finite witness/gate theorems listed in the log have no axiom dependencies. The stronger non-factorization theorem reports [propext, Quot.sound].
- Tested commit is merge reference 54c63ef000edb63fb11688ef6592a598106be892, merging PR head d0b17f74082137db03eb3f46102c99a888fbf1d4 into base c7dc2c483f50ae03fc7a7c530829170135e18d92. This is not the current PR head.

PR #951 currently remains OPEN / DRAFT / UNMERGED, current head f9fa0aad45408ab06e5430c834530854746235f0; no exact-head compile was verified. Lean checks only the formalized statement, not fidelity of the source transcription, authenticated actor identity, production behavior, or any physical premise.

## 6. Cross-lane controls

- P0 Code Grurple remains ACTIVE.
- P1 Orson cognition remains OVERDUE / NOT READY / ORSON-OWNED; no paper/manuscript change or gate advancement.
- P2 remains HOLD; P3 remains INCOMPLETE.
- FIE next review is November 24, not stale.
- WH-01 remains partially reconciled at cursor 2026-11-15T18:50:00Z; 79 of 100 run-job endpoints remain uninspected. Tern retains ownership.
- WH-02's two-argument test-call defect remains Calder/authorized-maintainer territory; no code or PR change.
- No physical calculation, fit, prediction, independent measurement, human study, live-model trial, theory promotion, task-graph mutation, or scheduler change.

## 7. Lateral reading and return cursor

Deliberate unrelated reading: SAT archive SAT Mark V/TheTANGLE.txt, lines 2120–2159, blob 3181b6cad85bbd76bd1017938e0dbf67baf03752. The passage moves from a wordplay exchange into a quiet self-description. No theory proposition was extracted. Return cursor: line **2160**.

## 8. Scheduler and publication boundary

Existing :48 task ID 6aa6c3bc02b48191b8a91a30d2a155e0 remains enabled with its exact hourly America/New_York DTSTART/RRULE and phase. The current scheduled occurrence is h932:s4; provider run f9c23ed2-4950-832e-b0a8-1ccf14708aed was observed IN_PROGRESS before its nominal 20:48Z slot, with no completion or chat_ref. This report is not attributed to an authenticated current thread. No sixth task, ID, schedule, phase, cadence, prompt, enabled-state or signet change.

The report is public-safe and submitted through the existing HSH-PUBLISH-V1 intake. Publication is **pending until publisher comment, workflow conclusion and exact artifact readback**. No direct artifact write or duplicate submission was attempted.
