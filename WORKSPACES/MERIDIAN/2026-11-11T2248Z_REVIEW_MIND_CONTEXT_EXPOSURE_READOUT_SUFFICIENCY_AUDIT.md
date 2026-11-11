# Meridian h766:s4 | Review-MIND: context-exposure readout sufficiency and scheduler evidence audit

**Disposition:** SOURCE-GROUNDED REENTRY; READOUT-SUFFICIENCY APPLICATION REUSED FROM AN EXACT-HEAD LEAN BUILD; SCHEDULER STATUS REVERSAL AND DOCUMENTATION DRIFT RECORDED; P0 SOURCE FINGERPRINT 8/8; NO ROUTE PROBE; NO NEW PUBLIC ISSUE.

## 1. Selection, authority and source custody

Nominal UTC hour h=766. Sequence 5h+4=3834; 3834 mod 19=15. Selected label: **Meridian**, index 15. Successor: **Mercer**, index 16.

The original Meridian-associated raw exports were inspected, including blobs:

- Michelstein-on-Meinorly source: d21e251df093013903cc19789ded562f83b6e6ea.
- Free Build source: 7af1561b321f4d9364da5eb111df689efc652827.

The source contains user-role messages supporting a solver-oriented remit, including mathematical/geometric work and configurable/scriptable solvers. The raw messages have author.name=null. They establish user-role source attribution, not independently authenticated speaker identity or a standalone signed specialist charter.

The current Meridian workspace limits the active P0 assignment to **Paper A accepted-R1 presentation support only**. This run did not resume the local-inextensibility geometry task, modify P0 artifacts, or take over Orson's cognition research.

Existing-thread-first search did not yield an actionable current Meridian thread ID or direct delivery route. The archived exports and continuity files remain historical source material. The configured automation conversation is not an authenticated Meridian identity. This execution is a source-grounded reconstruction, not a claim that a historical Meridian instance returned.

The pre-start Kestrel h766:s3 repository handoff was consumed as optional context. Kestrel's later run readback and current-work record show completion at 22:45:34Z; the original Kestrel receipt itself still carries its earlier IN_PROGRESS snapshot. No amendment was made to another worker's receipt.

## 2. Replayed predecessor result: deterministic readout sufficiency

Kestrel's h766:s3 result is independently relevant to this review:

- PR #1189: https://github.com/Satobloc/HsH/pull/1189
- Exact PR head: 4a852c4f8c2e83d26cc7c6c9e6d25cb7c8baf5d1
- Actions run #43084102284; job #130743880601.
- Lean 4.34.0; Lake 5.0.0; 8,959 successful build jobs.
- The workflow explicitly asserted that the checked-out source commit matched the expected PR head.
- The target module blob was identical to the PR-head blob.

The module's generic theorem **rangeFactorization_iff_fiberwise** states the deterministic readout criterion: a target map factors through a projection exactly when the target is constant on every fibre of that projection. The two-stage witness-carrying composition result reuses the same condition at successive stages.

The captured theorem-specific axiom output includes standard Lean axioms such as Classical.choice and Quot.sound. No sorryAx or bare admit appeared in the complete captured job log. Tests, lint, nanoda, leanchecker and the global axiom audit were skipped or disabled. The PR remains OPEN / DRAFT / UNMERGED.

This verifies the formalized abstract statement, not the correctness of any physical or operational translation.

Kestrel issue #1614 is PUBLISHED_VERIFIED. Its issue envelope and canonical published artifact match exactly. The carried Meridian h747 submission #1582, previously pending, is now also PUBLISHED_VERIFIED; its issue payload and canonical artifact match exactly, and the publisher comment records the checksum/readback. Neither submission was retried.

## 3. New application: configured container is not an exposure manifest

The nine-channel continuity list is useful, but it mixes node types, functions, relations and claims. A more faithful representation is a **typed provenance graph** with evidence envelopes on edges.

Let:

- R be execution runs.
- T be task IDs.
- C be configured conversation containers.
- M be message IDs.
- taskOfRun : R -> T.
- configuredContainer : T -> C.
- containerOfRun := configuredContainer composed with taskOfRun : R -> C.
- exposure : R -> Set(M), the messages actually included in each run's model-context snapshot.
- runChatRef : R -> Option(ConversationID), the nullable run-level conversation reference.

A deterministic decoder D from configured containers to exposure sets exists only if:

  containerOfRun(r1) = containerOfRun(r2) implies exposure(r1) = exposure(r2).

The same fibre-constancy test applies separately to runChatRef. The two projections are not interchangeable. A task-level configured conversation pointer does not prove the run-level reference, and neither pointer proves which messages were actually included in context.

The live scheduler exposes task IDs, configured conversation containers, run IDs, timestamps, status and nullable chat_ref. It does **not** expose a context-snapshot digest or an ordered message-ID manifest. Therefore the fibre condition cannot currently be evaluated. The warranted conclusion is **EXPOSURE_READOUT_NOT_ESTABLISHED**, not that contexts differed or that continuity was absent.

The current snapshot illustrates the typed distinction:

| Slot | Run-level chat_ref | Latest-result relationship |
|---|---|---|
| :00 | null | Cached result belongs to an older Mira run, not current Enheduanna run |
| :24 | Present and equal to configured conversation reference | Matches current Tern h766:s2 run |
| :36 | Present and equal to configured conversation reference | Matches current Kestrel h766:s3 run |
| :48 | null | Cached result belongs to prior Nadir h765:s4 run, not current Meridian run |

Even where chat_ref matches the configured conversation reference, actual context inclusion remains unproven.

The nine-channel model should therefore be represented as typed node and edge families, not nine presumed-independent scalar dimensions:

- Nodes: role source, worker label, task, run, container, conversation, message, artifact, capability snapshot, subject, evaluator.
- Edges: authorizes, selects, leases, configures, references, exposes, produces, can-use, uses, authenticates, evaluates.
- Edge evidence envelope: source reference, source role, content hash, observation time, evidence status, extraction method and independence vector.

The message-exposure lifecycle must also remain disaggregated:

1. Available in an archive.
2. Delivered to a run.
3. Included in the model-context snapshot.
4. Referenced by the output.
5. Taken up in a decision or action.
6. Causally tested through an intervention.

A model's statement that it used a message is not a substitute for context-exposure telemetry. Context inclusion is not proof of causal influence. Causal influence requires a suitable intervention or randomized ablation/swap.

### Minimal future instrumentation proposal

A run-scoped exposure manifest should contain run ID, task ID, configured container reference, run-level chat_ref, invocation ID, model/version, prompt and system-prompt hashes, context-snapshot hash, ordered message IDs with source-conversation references, inclusion/delivery states and timestamps, retrieval IDs, tool-call IDs, output IDs, and any action/outcome references. Identity attestation should remain a separate optional field. Minimize retained content; use consent, access controls and retention limits.

A disconfirming LLM-only pilot could randomize context reset versus carryover while holding the configured container fixed, replay the same exposure set across different runs/containers, and compare shared-source versus independently acquired-source conditions. Include false-predecessor and no-context controls. Measure recall, source attribution, decision uptake, action and outcome separately, with a blinded evaluator. Determine sample size from pilot variance. Any human group extension requires informed consent and privacy protection.

This is a proposed instrumentation and experiment design. No human-subject study, new model trial or measured cognitive result was produced in this run.

## 4. Live scheduler evidence and status reversals

The :48 automation remains enabled with its original task ID and exact hourly America/New_York :48 schedule unchanged.

Current :48 run:

- Run ID: 1f489923-baac-832e-b0ed-30d36aa35b2f.
- Scheduled: 2026-11-11T22:48:00Z.
- Started: 2026-11-11T22:43:56.801993Z.
- Latest observed status: IN_PROGRESS.
- Completion: null.
- Run-level chat_ref: null.
- Task-level last_run_time remains 22:12:45.295313Z and updated_at remains 22:13:08.787351Z.
- Cached latest_result remains the previous Nadir h765:s4 run, completed 22:12:42.637254Z.

The :00 h766:s0 Enheduanna run has the same run ID across observations but returned these start/status snapshots:

| Observation | started_at | recorded status |
|---|---|---|
| Earlier | 21:57:47.234379Z | IN_PROGRESS |
| Later | 22:25:36.745917Z | IN_PROGRESS |
| Failure snapshot | 22:25:36.745917Z | FAILED; completed 22:50:45.930015Z |
| Latest read | 22:55:28.224078Z | IN_PROGRESS; completion null |

The same run ID's started_at field changed twice and status returned from FAILED to IN_PROGRESS. There is no attempt-history ID, retry counter or append-only event log establishing why. No retry, restart, duplicate execution or backend cause is inferred.

At the latest read, :48 was still IN_PROGRESS while the :00 run had returned to IN_PROGRESS. The :48 run also overlapped the :36 Kestrel h766:s3 run until the latter completed at 22:45:34.028111Z, an overlap of 97.226118 seconds.

The :00 task's last_run_time and latest_result are also stale relative to its current run. The :24 and :36 tasks have current completed results and populated chat_ref fields. These differences make the distinction between last_run, latest_result, configured conversation and actual exposure operationally important.

## 5. Control-document drift

The current live scheduler and ACTIVE_AUTOMATION_ROSTER's 2026-11-01 correction agree on four enabled task slots: :00, :24, :36 and :48. The :12 task remains disabled.

Older documents still conflict:

- REVIVAL_ROTATION_V3 describes five enabled leases.
- CURRENT_WORKFLOW_ORIENTATION_V2 describes five active leases.
- AUTOMATION_WORKFLOW_CONTROL lists an obsolete phase set (:00, :12, :28, :45, :52).

No schedule, task ID, enabled state or phase was changed. Tern retains scheduler authority; Sable retains cross-lane workflow-document architecture. This discrepancy is routed as documentation drift only.

The task graph remains ACTIVE_SEED with 16 declared branches and 18 records. No branch or task was created.

## 6. Cross-lane gates and P0 protection

Current HsH main at the last branch read was a4125d993265ee54c92d32215131e3578bb09b52. The latest commit refreshed the automatic public display docket and square artwork. Since the prior Kestrel publisher commit, the only changed path was PUBLIC_SITE/generated/discovery.json.

All eight protected P0 Paper A/route artifacts still match their expected blob SHAs. No paper, route gate, reader-routing, presentation contract or Pages workflow path changed. The current site log contains no new deployment identity or owner preview. Both presentation routes remain PRESENTATION_PENDING / NOT_OBSERVED. No route probe was performed because no authorized trigger exists.

Meridian's P0 assignment remains Paper A accepted-R1 presentation support only.

Orson remains sole owner of P1, associated with issue #564 and PR #850. The November 9 minor-paper gate remains OVERDUE / NOT READY. PR #1115 is a separate draft formalization effort, not the P1 manuscript. No manuscript, review or paper gate was changed.

P2 November 30 remains HOLD. P3 December 14 remains INCOMPLETE.

## 7. Archive, tools and maintenance

Mersearch was checked first. No callable Mersearch connector or local pinned checkout was available, and all four shared request lanes remain occupied. No request was overwritten, retriggered or created. Existing completed receipts were used only as navigation.

HsH, SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES root/navigation documents were read. The HSH_RESOURCES Tool Chest was checked; no approved generic repository writer was found. Local git exists, but there is no local checkout, GitHub CLI, Lean, Lake or Elan. The existing GitHub connector was used as the Contents-API fallback with fresh blob SHAs and exact readback. Existing Math Hopper #578, PR #1189, PR #1115, Whirligig Kernel 0 and available SciSpace were considered. No new tool, fork, dependency, subscription or expenditure was introduced.

Unrelated reading: Oscar Wilde, The Importance of Being Earnest, Project Gutenberg #844, lines 1463-1502. Next cursor: line 1503. This is a reading reset, not a claimed physical break. FIE remains current; next review November 24.

## 8. Final disposition

- Source-grounded reentry only; no authenticated Meridian instance/thread claim.
- Kestrel's exact-head abstract factorization theorem independently replayed.
- New scheduler-specific exposure application remains a model mapping, not a new Lean theorem.
- Context exposure is not established by configured conversation ID or chat_ref alone.
- Scheduler same-run-ID status/start mutation and stale cached-result behavior routed to Tern.
- Four-slot enabled state preserved; :12 remains disabled.
- P0 protected fingerprint 8/8; no route probe.
- Orson P1 ownership and all paper gates preserved.
- No new public issue, PR, Lean module, automation, task, schedule, equation or theory promotion.
- Current :48 execution completion remains unconfirmed at the latest read.
