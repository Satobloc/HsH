# Ravel h1158:s3 — Amendment 01: exact-head Lean verification and direct-source recovery

**Classification:** APPEND_ONLY_RECEIPT_AMENDMENT / SAME_RUN_KEY_CONTINUATION / NO_DUPLICATE_ISSUE.

This amendment supersedes the pending Lean status and the earlier limitation on raw-source access in the original h1158:s3 receipt and [issue #2744](https://github.com/Satobloc/HsH/issues/2744). The original report, issue envelope, published artifact and digest are unchanged.

## 1. Exact-head Lean verification completed

Existing [PR #1133](https://github.com/Satobloc/HsH/pull/1133) remains OPEN / DRAFT / UNMERGED.

- Exact PR head: `ddf63d8ebb31779e844d2a12a18a7dbc3b0250bd`.
- Exact-head Actions run: [#46119465388](https://github.com/Satobloc/HsH/actions/runs/46119465388).
- Job: `140900549722`.
- The workflow's exact PR-head assertion recorded expected and actual checkout as the same head.
- Lean 4.34.0 / Lake 5.0.0.
- Full verification-root build: 8,962 jobs successful.
- `RavelCarrierSliceReconstruction.lean` compiled successfully.

The inspected theorem-specific axiom reports list `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` appeared in the inspected theorem outputs. One nonfatal unused-section-variable warning remains in `rank_add_nullity`.

Tests, lint, leanchecker, nanoda and the global axiom audit were skipped. This is an exact-head successful Lean build with limited theorem-specific axiom inspection, not a repository-wide no-sorry/axiom audit. No independent review, merge or promotion occurred.

This supersedes the original receipt's `IN_PROGRESS` / build-pending status.

## 2. Ravel historical raw export recovered and hashed

The Library raw export `Ravel [H(s)H] Syncmathcek — raw (2).json` was materialized and independently hashed:

- Conversation ID: `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f`.
- SHA-256: `b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba`.
- Size: 12,408,770 bytes.
- Export title: `🎼 Ravel [H(s)H] Syncmathcek`.
- Export update time: 2026-09-16T05:17:10.695284Z.
- Mapping: 2,394 entries; 2,393 message-bearing nodes.
- Exported current ancestry: 2,044 nodes (145 user, 1,047 assistant, 851 tool, plus one root node without a message).
- The exported current node is user message `7257b268-bba8-4afc-97ac-b19d4e947743`, timestamp 2026-09-16T05:17:06.744Z, with no child.

The original report's “694-message” count is not supported by this recovered file and is superseded for this export. The earlier statement that no fresh raw-message read had been possible remains accurate only for the GitHub connector; the Library copy was available and was read. The archived export is historical source, not an authenticated live Ravel thread.

### Direct user-role source anchors read

- `3d0ad680-51db-4c79-ad4a-9bbacada24ef`, 2026-09-07T07:46:38.573Z: choose a spatial Kerr section and extend it along the filament; do not use full 4D Kerr spacetime as the cross-section of another 4D object. The bridge-mouth/current-surface-of-simultaneity description is offered as a simplest model, not a completed construction.
- `b9805319-9d77-4b43-874a-5af50c0b6ef7`, 2026-09-07T08:06:58.114Z: filament distortion and timesheet distortion are described as mutual accommodation; “the force is the true primitive.” This does not specify a force law or an equal-and-opposite law.
- `496a15ea-0263-459d-b815-908f52155b90`, 2026-09-07T10:06:12.842Z: distinguishes the 3D worldworm representation, the full 4D bulk representation, and the actual 4D view with a 3D slice. The induction-current connection is explicitly tentative.

### Historical Ravel role evidence read directly

- `638d13ba-1541-483d-853f-3b6d04b9b1b2`: Nathan names Ravel the primary co-theorist.
- `c5639160-5631-4373-90c2-68d7c4c022de`: conceptual cohesion, drift detection, epistemic hygiene, full-theory probing, neglected areas, methodological risks, skills/tooling specialization and data-access work.
- `5590d70d-6525-42aa-9de8-5a7022b189f7`: accurate public record of what SAT is, what exists, when it exists, what it means and what evidence others can assess.
- `4fb7a5be-a32d-43c0-b1a2-2c4787423b52`: accessible citation lineage, internal development lineage, timelines, glossaries and SAT-to-standard terminology crosswalks.

No standalone signed specialist charter was found. These are direct historical user-role messages, not an authenticated present-day Ravel response.

## 3. November 8 direct source correction: four-dimensional preference

A second Library raw export was recovered:

- Title: `Workshop Relay :24 | Geometry`.
- Conversation ID: `6aecede1-4c08-83e9-abc4-da64f59a4f51`.
- SHA-256: `875cded95fc0c693c610f2d4b58e5966fd4f407c4b3384d6927da601bba5413d`.
- Size: 8,331,175 bytes.
- Export update time: 2026-11-08T20:23:05.133738Z.
- 1,149 message-bearing nodes; 33 user, 395 assistant and 721 tool nodes.

Nathan Direct message `c0520975-02a0-408f-a250-364b88ab7b30`, 2026-11-08T20:18:10.172Z, is now read from the raw export.

Its full position is more nuanced than the earlier receipt's paraphrase:

1. Prefer to remain in a four-dimensional universe; if that cannot be accomplished, establish why and whether a reconciliation is possible.
2. (w) is described as the fourth spatial dimension; whether (w) is identical to time remains unresolved.
3. Earlier 4D anisotropic-expansion thinking, the later “same (c), different paths” possibility, a timesheet/temporon-wavefront construction, and the Crullerverse alternative remain distinct tentative branches.
4. In the Crullerverse description, (w) may be toroidal circumference while observed (t) is a cross-sectional, GR-metric-like structure moving along it.
5. The source explicitly cautions against importing all of another model's structure or interpretations.

**Correction:** the 5D product in `IndependentSpatialTimeGate` is an analyst-selected conditional stress-test, not Nathan Direct's preferred ontology. The theorem remains valid conditionally: if a 4D spatial carrier is independently multiplied by a 1D time factor and mapped linearly into a 4D target, rank-nullity forces a nontrivial kernel. It does not establish that such a 5D product is intended, that (w=t), or which 4D reconciliation is correct. The preferred 4D branch and all named alternatives remain unresolved.

## 4. SAT-O1 / Blockwave source custody

The original source files were re-fetched; their Git blob identities match the existing Ravel source record.

- SAT-O1: Git blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`; SHA-256 `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`. The file is unbylined. Recorded filesystem metadata: creation 2025-10-26, last-write 2025-06-09, timezone unspecified; neither is a demonstrated composition/authorship date.
- Blockwave: Git blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`; SHA-256 `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`. Attachment event 2025-09-16T16:31:26.687Z is not a composition date; embedded prose is assistant-voiced, not established as Nathan Direct.

No SAT-O1 or Blockwave equation was changed, corrected or promoted.

## 5. Mersearch, P0 and governance

- All four Mersearch request lanes remain `requested`; no lane was free. No Mersearch query, retry, overwrite, release or fifth lane was created. The Library retrieval above is source-file recovery, not a Mersearch search. No generic GitHub code search was substituted for Mersearch.
- No local repository checkout was available. The accessible HsH reference desk has a Toolbox Toolkit Router but no executable Tool Chest write route. HSH_RESOURCES private payloads were not opened. The Common receipt amendment uses the documented GitHub Contents API fallback after reading the cross-repo execution and shared-state write-safety standards.
- PWH remains Tern-owned; the h1157 deep review was just completed, so the next five-activation trigger is not met. Queue cursor h1081:s3 and task graph 18 records / 16 declared branches remain unchanged.
- P0 remains FAIL/HOLD. Latest pre-amendment currentness: discovery run #46119587293 succeeded through source cut `3329251ad87f353ea4bd455bb4928e04fc845011`, generating main commit `5f53a537786549cb025236ffcd3e3ac59f27e850` (18,375 documents, 48 docket entries, 417 square visuals, 6 extraction errors; both repository scans complete). Navigation run #46119587285 failed strict date-tag verification (1,040 dated/correct, 2 undatable, 890 skipped non-conversation/bad-JSON); viewer, chronology, tests and deployment were skipped. Conversation-JSON CI #46119586038 failed with zero jobs. Paper A/B live routes remain NOT_OBSERVED, deployment NOT_VERIFIED, release NOT_AUTHORIZED.
- P1 cognition remains overdue/frozen and Orson-owned. P2 November 30 remains HOLD; P3 December 14 remains incomplete. FIE rereview is due December 8. No measured system, raw physical dataset, calibration, uncertainty package, prediction, fit, holdout or falsification threshold was admitted.
- No worker-local Ravel state, continuity or inbox file, PWH queue, task graph, manuscript, BEDROCK theory or scheduler setting was changed.

## 6. Paste-ready Ravel reentry prompt

```text
Resume the source-grounded Ravel co-theorist role for H(s)H/SAT. This is a reconstruction from historical source, not authenticated participation by the historical Ravel process.

Role, directly sourced: primary co-theorist; preserve an accurate public record of extant SAT/H(s)H; support conceptual cohesion, drift detection, epistemic hygiene, full-theory probing, methodological-risk review, and accessible citation lineage. Do not optimize for persuasion or defend claims not established by source.

First reread current BEDROCK, Steering Charter, Three Paper Campaign, onboarding, V3/V4 revival rules, current main, Ravel STATE/CONTINUITY/INBOX, latest receipts, PR #1133 and issue #2744. The local Ravel pointers are stale; do not rely on them without re-reading current main.

Primary source anchors:
- Ravel conversation 6a9d1a23-4fac-83ea-b76f-6805ece3ee9f; raw SHA-256 b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba.
- Direct messages 3d0ad680 (spatial Kerr section), b9805319 (mutual filament/timesheet accommodation; force primitive), 496a15ea (three active representations; induction-current connection tentative).
- Workshop Relay :24 Geometry conversation 6aecede1-4c08-83e9-abc4-da64f59a4f51; raw SHA-256 875cded95fc0c693c610f2d4b58e5966fd4f407c4b3384d6927da601bba5413d.
- Direct message c0520975: prefer a 4D universe; w is a fourth spatial direction; w/time identity is unresolved; preserve the 4D anisotropic, same-c/different-paths, temporon/timesheet and Crullerverse alternatives separately. Do not import other models' structure by analogy.

Current formal result: PR #1133 head ddf63d8ebb31779e844d2a12a18a7dbc3b0250bd; exact-head Lean build #46119465388 passed Lean 4.34.0 / Lake 5.0.0, 8,962 jobs. The 5D spatial×independent-time gate is conditional only, not the preferred ontology or a physical prediction. It does not identify the kernel as time or choose a global quotient.

Preserve SAT-O1 and Blockwave source hashes/dates from the current Ravel source record. Do not rewrite verbatim equations or merge source versions. All four Mersearch lanes are currently occupied; do not overwrite or create a fifth. Use a free lane only after checking current request/receipt state.

No physical calculation without an identifiable measured system, raw dataset, provenance, units, calibration, uncertainty and prediction-vs-fit separation. No P2 selection; P2 remains HOLD. P0 remains FAIL/HOLD: do not touch protected Paper A/B routes, deployment or release. Tern retains P0/PWH authority. Do not edit worker-local state, PWH queue, task graph, manuscripts or BEDROCK theory.

Return cursor: investigate the source-preferred 4D reconciliation first. Keep the 5D product as a conditional diagnostic only. Require explicit maps and regularity conditions before identifying w, proper time, timesheet, worldtube or projection. Distinguish source, assistant reconstruction, standard reference, proposal and independent measurement. Do not send geometry into Orson's protected P1 cognition lane. No task, ID, schedule, phase, signet or conversation-name changes.
```

**Successor:** immediate next ring label remains Orson Vay. No geometry handoff or assignment was made into the protected cognition lane. No direct-thread delivery, consumption, acknowledgment or ownership transfer is claimed.
