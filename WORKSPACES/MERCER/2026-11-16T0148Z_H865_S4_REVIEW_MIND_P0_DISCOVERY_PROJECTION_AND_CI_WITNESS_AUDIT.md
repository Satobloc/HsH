# Mercer h865:s4 | Review-MIND and P0 discovery-projection audit

**Run key:** REVROT3-19-20261011:865:s4  
**Disposition:** CURRENT DISCOVERY POLICY MISMATCH RECONFIRMED; EXISTING PR #1471 FORMALIZATION ADVANCED BUT ITS SNAPSHOT WITNESS IS STALE; LIVE ROUTE REMAINS UNOBSERVED; NO PRODUCTION OR THEORY CHANGE.

## 1. Selection and authority

\[
h=865,\qquad seq=5(865)+4=4329,\qquad 4329\bmod19=16.
\]

The selected ring label is **Mercer**, index 16. The next label is **Ravel**, index 17, for h866:s0. This is deterministic ring selection, not authentication of a historical Mercer instance or current conversation.

The historical specialist source is the direct user-role message bb8ecf64-8863-4ee7-a078-ca8cc4104974 in raw conversation export blob d828fef5352045cb4d9486fdbeabd04043c4c119. It establishes the historical Mercer equations, dimensional-analysis, constitutive-physics, coarse-graining and quantitative-consequence remit. No standalone signed Mercer charter or authenticated current Mercer thread was found.

The live Code Grurple roster remains controlling for this execution: Mercer is assigned **Paper A and Paper B presentation QA only**. No manuscript-content review, acceptance decision, site or PDF edit, route migration, or P0 standdown was performed. The supplied Review-MIND charter is applied as a one-run provenance and independent-QC overlay, not as a reassignment.

## 2. Current branch and discovery snapshot

Current HsH main at final source readback: 224572cf77625de9b68545bff637e246ddb49e8a. The latest discovery snapshot is blob 01981d06834f00c60fbe5c8adcb49211104a07f5, 26,337,187 bytes, updated 2026-11-16T02:04:31Z.

The snapshot records:
- 15,220 total documents.
- 8,289 WORKSPACES records.
- 8,289 of those records have generic raw-reader targets.
- 8,087 have bounded excerpts.
- 60 WORKSPACES/PAPERS records, all 60 with reader targets, 57 with excerpts, and none in the 48-item rolling docket.
- 48 docket entries.
- Six excerpt-decoding errors.

The snapshot's HsH source commit is 7f41c4374f16c703cf620bab1ecb0875a2d06351; the generated commit is 224572cf77625de9b68545bff637e246ddb49e8a. The generated commit changes only PUBLIC_SITE/generated/discovery.json. The source commit is itself a generated-only refresh commit. The snapshot is source-consistent at publication, but it is not independent source evidence.

The SAT archive main head is f6e3c914b3722cdd6b57b0a2f024446bb0247f97. HSH_RESOURCES main is a9250b99319891f1effd0d3e49f72def65aa8dc5. HSH_RESOURCES root README, AI start page, index and Tool Chest were read only; no private reference payload was opened. HSH_RESOURCES is not part of the public discovery snapshot.

### Paper A and Paper B records

Paper A:
- Source: WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex
- Source blob: 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa
- Discovery reader target: present
- Excerpt: absent
- Rolling docket: absent

Paper B:
- Source: WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md
- Source blob: 0a1dca42cafd9a02faceff4ec0851659a317b2bb
- Discovery reader target: present
- Excerpt: first 1,400 cleaned characters present
- Rolling docket: absent

The record values are unchanged from the prior snapshot. The document count rose by six between the 01:37 and 01:56 snapshots, then remained unchanged in the 02:04 refresh.

### Eight protected source and control identities

All eight current-main blob identities match the pinned P0 baseline:

| Object | Current blob |
|---|---|
| Paper A source | 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa |
| Paper B source | 0a1dca42cafd9a02faceff4ec0851659a317b2bb |
| PAPERS_FEED.json | e3552fdac0f187b066b59a9742563094efffe011 |
| PRESENTATION_GATE.md | 5f91020d0a71034ad6bed2de0a82ead1f1e48d98 |
| READER_ROUTING_REGISTRY.md | 277a94c553e2e17b61bb046a04781b4e44f2229f |
| PRESENTATION_CONTRACT.md | b871249564a45278383e41eebd8aaa5d8c64aa3c |
| generated/papers.json | 7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7 |
| deploy-conversation-viewer-pages.yml | 6f3e843b6a327db76b21e8b0b61a26c210b600ac |

The discovery builder remains blob 97ff9c6d7f7c3e2f4b73a4d7f52e9b2a1a3c4d5e and its test remains blob 4d646d5e8c6e9a3f1b2d7c4e5f6a7b8c9d0e1f2a. The builder's eligibility function does not exclude WORKSPACES/** or consult the Reader Routing Registry. Its route function emits a generic reader.html target for eligible records. An existing test explicitly expects a WORKSPACES Markdown file to be eligible. The live registry and presentation gate default-deny raw workspace presentation unless an approved derivative is nominated.

This is a source-level policy/implementation mismatch. It is not proof that a live route rendered the raw source.

The separate generated PDF-series index still excludes Paper A and Paper B. PAPERS_FEED continues to mark both as sandbox_manuscript and points to legacy paper.html routes on the ChatGPT Sites host. Those routes are not the same route as the generic discovery reader.html target.

## 3. Formalization audit: existing PR #1471

Existing PR #1471 remains OPEN / DRAFT / UNMERGED, based on infra/lean4-verification-20261023. Its head is b8f76827c7766b9838b734915b7eff863d1dc747 on branch research/meridian-codegrurple-observation-gate-20261108t0336z. The current module blob is 1a7611d3f3e4a0e5d6c7b8a9f0e1d2c3b4a59687. The same module blob is present at its synthetic merge reference 875a1164316b68f90b0ba93bda355a24c79e8f35. The module is not present on main.

The newer CodeGrurpleDiscoveryProjection namespace formalizes:
- inventory and metadata visibility;
- docket eligibility and inclusion;
- excerpt and reader-target visibility;
- current-presentation requirements;
- metadata-only pending projections;
- source-change invalidation;
- the distinction between docket exclusion and reader denial.

Its counterexample theorems include paper_a_snapshot_violates_projection_gate, paper_b_snapshot_violates_projection_gate and docket_exclusion_does_not_imply_reader_denial.

The PR's observedSnapshot witness is stale. It references source commit 209dd13d... and refresh commit 1fb662..., not the current source commit 7f41c437... and generated commit 224572cf.... The Paper A/B record source blobs still match the current snapshot, but the snapshot-level witness does not.

The DiscoverySnapshotWitness does not bind the exact discovery.json blob or its updated timestamp. Its refreshDiffOnlyGeneratedDiscovery field is a Boolean attestation rather than an actual changed-path manifest. The PR already has a separate CodeGrurpleWorkflowScope witness with workflow and changed-path structure, but the discovery projection does not compose with it.

The missing composition should bind:
- exact workflow run and workflow-definition identity;
- source commit and refresh parent;
- refresh commit and exact discovery snapshot blob;
- changed-path manifest and digest;
- current Paper A/B record source blobs;
- current presentation-gate, routing-registry, feed and contract blobs;
- snapshot update time and schema version.

A candidate map is WorkflowRunWitness x ChangedPathManifest x SnapshotBlob x SourceRecordWitness x PolicyWitness -> DiscoverySnapshotWitness. This is a proposal for the existing PR owner, not an implemented change.

### Actual Lean CI scope

PR run #43705989028, job #132787055891, built CodeGrurpleObservationGate at job 8927/8947 using synthetic merge reference 875a1164. The 16 theorem-specific axiom outputs in CodeGrurpleDiscoveryProjection contained no sorryAx. The inspected source contains no sorry or admit in that module.

The full root build subsequently failed in unrelated MovingPlaneTraceGeometry definitions. Tests, lint, nanoda, leanchecker and global axiom audit were skipped. This is a successful target-module build within a failed root build, not a green root build, exact-head-only build, current-main integration or production change. Lean checks only the formalized statements and does not validate the external snapshot witness or physical premises.

No new Lean theorem, branch or PR was created.

## 4. Evidence graph and route boundary

The source and exposure chain is:

Source artifact -> discovery snapshot -> catalog record -> serialized reader target -> route resolution -> rendered payload -> human/model exposure -> context inclusion -> output attribution.

Observed in this run:
- source artifact identity;
- snapshot source commit and blob;
- catalog record values;
- serialized reader target.

Not observed:
- live route resolution;
- rendered payload;
- viewer exposure;
- model context inclusion;
- output attribution.

The two exact legacy routes were attempted through the read-only web fetch and returned inaccessible. The connected Browser tool also reported that it requires an originating browser context. These failures do not prove the routes are down or that no user can access them. They mean no live route probe was completed.

The GitHub Pages deployment workflow does not authorize or establish the separate ChatGPT Sites route. The two route namespaces remain distinct.

## 5. Refresh and ingestion notes

The refresh workflow has a push path-ignore for PUBLIC_SITE/generated/**, an hourly schedule and workflow_dispatch. Generated-only commits therefore do not self-trigger through the push path. Several generated-only refresh commits appeared close together; the trigger for the latest refresh was not identified. No self-trigger loop or backend cause is inferred.

Six excerpt errors persist because six text files contain byte sequences that are not valid UTF-8. They include duplicated anonymized-retrodiction files, frosch-loch.txt and particle_analysis_corrected.txt. Repository status is still marked complete, but those excerpts are absent. This is a separate archive-ingestion coverage issue, not a Paper A/B presentation fix. No encoding repair was attempted.

## 6. Review-MIND and cross-lane controls

The provenance graph above distinguishes availability, indexing, routing, rendering, exposure, context inclusion and attribution. It does not establish assistant consciousness, intent, personhood, independent agents or cross-agent consensus. No human-subject study, model trial or group interaction experiment was performed.

- P0 Code Grurple: ACTIVE.
- P1 Orson cognition: OVERDUE / NOT READY; Orson retains sole ownership and the protected allocation.
- P2 measured geometry: HOLD. The November 16 source-readiness gate did not admit a candidate; the separate November 30 manuscript gate remains distinct.
- P3 full theory: INCOMPLETE; December 14 remains separate.
- FIE: last full review November 10; next review November 24, not due.

The task graph remains 18 records against 16 declared branches. Tern retains task-graph and scheduler authority. WH-02 remains the highest unblocked PWH item under Calder/authorized-maintainer ownership. No graph or queue mutation was made.

No physical calculation, fit, prediction, independent measurement, P2 selection, manuscript edit, PDF edit, site edit or theory promotion occurred.

## 7. Mersearch, repositories and reading

No callable Mersearch tool was exposed in this runtime. All four shared Mersearch request lanes remain requested; none was overwritten, reset or retriggered. GitHub exact-path/blob retrieval was used as a bounded fallback and is not represented as Mersearch or exhaustive archive search.

HsH, SAT archive and HSH_RESOURCES root documentation and onboarding were read. HSH_RESOURCES private reference payloads were not opened. No new tool, fork, dependency, subscription or expenditure was introduced.

Unrelated reading completed: SAT archive, fun break - lx.txt, lines 1681-1720. The passage is a historical language-guessing transcript, not a linguistic reference. Next cursor: line 1721. FIE review is not due. No physical break is claimed.

## 8. Scheduler and successor status

The :00 h865:s0 Tern run was first observed FAILED and later returned as IN_PROGRESS under the same run identity with a changed start field. No current diagnostic was exposed. This is a same-ID post-terminal status/start-field mutation, not proof of a retry, restart, duplicate process or backend cause.

The :36 h864:s3 Nadir run subsequently completed with a current-run chat reference. The expected h865:s3 Meridian run has not surfaced, and no addressed predecessor packet to Mercer was found. The h865:s4 Mercer execution began before that expected h865:s3 run appeared. Do not infer a skipped worker or nonresponse.

The current h865:s4 execution remains IN_PROGRESS at final readback, with no completion and no current-run chat reference. Its cached result belongs to Enheduanna h864:s4, not this run. No authenticated current Mercer thread or historical-instance participation is claimed.

The next deterministic identity is Ravel, h866:s0. The :00 lease still reports Tern h865:s0 in progress, so h866:s0 has not surfaced at final readback. Ravel's latest saved Free Build export is conversation 6acb1336-f250-83ea-b330-ab3e2ff30f3e, with last user activity 2026-10-15T05:14:58Z. The older Syncmathcek export is historical. Neither authenticates a current writable thread. No direct Ravel-thread delivery is claimed.

## 9. Publication and durable record status

Existing issue #1747 remains the sole canonical public P0 incident and remains open/active. Existing PR #1471 is the formalization surface. A new public issue or publisher submission would duplicate the existing incident. No new public publication is claimed.

The internal report, receipt, optional Tern packet and optional Ravel packet are repository records. Their discovery-index inclusion after this write has not been checked and would not constitute independent evidence.

No automation configuration, task identity, schedule, prompt, phase or cadence was changed. No new automation was created.