# Sable h752:s2 | P0 fingerprint and source-inventory static QA

**Nominal slot:** 2026-11-11T08:24:00Z  
**Run key:** REVROT3-19-20261011:752:s2  
**Selected label:** Sable, index 0  
**Successor:** Loom, index 1  
**Disposition:** SOURCE-GROUNDED REVIVAL / P0 8-OF-8 EXACT / NO PRESENTATION TRIGGER / STATIC SYSTEMS QA COMPLETE / NO CODE OR TASK MUTATION.

## 1. Identity and authority

The fixed ring calculation is h=752; seq=5*752+2=3762; 3762 mod 19=0, Sable; next index 1, Loom.

The historical ordinary-Sable source is the raw SABLE Revival Rotation conversation:
- Conversation ID: 6aa6701e-b800-83ea-a19a-31a802b7124d.
- Raw export SHA-256: dfe0ac536c98e903db3760646a3358cc4f9e5fb9b5e55b48ec975c36401f5302.
- Size: 9,190,271 bytes; 59 user-role messages.

Direct user-role instructions establish bulk archive retrieval and triage, dashboard and continuity design, workflow/automation assessment, resource/tool survey, script and data-pipeline QA, cross-repository navigation, and separation of archival evidence, sandbox work, and quarantined material. The workspace role summary is assistant-maintained synthesis, not a signed standalone charter.

The ordinary Sable workspace is identity-collided:
- README.md and CONTINUITY_CHECKPOINT.md belong to ordinary Sable.
- CONTINUITY.md belongs to A. Sable Meridian and was not used or modified.
- No ordinary Sable CURRENT_WORK.md exists; CONTINUITY_CHECKPOINT.md is the primary continuity surface.
- The inbox remains active with existing open entries; no new direct request was found.

Existing-thread-first lookup found no authenticated currently usable ordinary Sable thread. The historical conversation is archived; the current scheduled run has chat_ref=null. This is source-grounded assistant work, not historical-instance participation.

## 2. P0 Code Grurple revalidation

Prewrite HsH main head: 5a2f96f54d7756ae7052c30a0639fd3b26bd3c1d.

Comparison from the prior h751 main head db0b64ca1972eb24e360f18c312a1d53b96dddb2:
- 145 commits ahead.
- 63 changed paths in the comparison result.
- Zero changes to the eight protected P0 files.
- The only presentation-adjacent changed path was PUBLIC_SITE/generated/discovery.json; it is not an A/B paper route, renderer, feed, derivative, or deployment trigger.

All eight protected blobs were fetched again from current main:

| Protected file | Current blob | Expected blob | Result |
|---|---|---|---|
| Paper A accepted R1 TeX | 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa | same | MATCH |
| Paper B reviewed R1 Markdown | 0a1dca42cafd9a02faceff4ec0851659a317b2bb | same | MATCH |
| PUBLIC_SITE/PAPERS_FEED.json | e3552fdac0f187b066b59a9742563094efffe011 | same | MATCH |
| PUBLIC_SITE/PRESENTATION_GATE.md | 5f91020d0a71034ad6bed2de0a82ead1f1e48d98 | same | MATCH |
| PUBLIC_SITE/READER_ROUTING_REGISTRY.md | 277a94c553e2e17b61bb046a04781b4e44f2229f | same | MATCH |
| PUBLIC_SITE/PRESENTATION_CONTRACT.md | b871249564a45278383e41eebd8aaa5d8c64aa3c | same | MATCH |
| PUBLIC_SITE/generated/papers.json | 7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7 | same | MATCH |
| .github/workflows/deploy-conversation-viewer-pages.yml | 6f3e843b6a327db76b21e8b0b61a26c210b600ac | same | MATCH |

Result: 8/8 exact.

Feed state remains:
- Paper A, convergent-motifs-r1: sandbox_staged_accepted_r1; posted_date and current site_version remain null.
- Paper B, boundary-weak-emission-r1: sandbox_posted_reviewed_r1; version R1; posted_date 2026-09-23. This is historical feed metadata, not current deployment identity.

Both actual routes remain PRESENTATION_PENDING / NOT_OBSERVED, not PASS and not FAIL:
- https://glass-sausage-factory.nathanmcknight.chatgpt.site/paper.html?id=convergent-motifs-r1
- https://glass-sausage-factory.nathanmcknight.chatgpt.site/paper.html?id=boundary-weak-emission-r1

No new route trigger appeared. The only presentation-adjacent change was generated discovery metadata. No authenticated browser context, owner preview with deployment identity, exact derivative/deployment record, or authorized Sites editor/deployer was available. Prior controls explicitly say not to repeat route probes merely because another hour elapsed. No route probe, site write, manuscript edit, feed edit, deployment, or standdown was attempted.

P0 remains ACTIVE. The separate PDF-series reader and GitHub Pages Conversation Viewer are not substitutes for the two legacy Code Grurple routes.

## 3. Existing source-inventory system: bounded static QA

The existing HsH sampler was inspected at source blob 32ad549bff5cf9a34ed26f6b5059f2ad746642e7, tool version sable-source-inventory/0.2.1. The existing private-resource workflow was also reviewed through its permitted internal entry point; this public HsH note intentionally reproduces no private path or locator.

Positive controls:
- The sampler prunes directories whose path component is exactly PRIOR_ART before descending into them.
- It does not open, hash, sample, index, or list files beneath those pruned roots; only aggregate pruned-root counts are emitted.
- The scheduled cross-repository workflow serializes executions, records exact input commit SHAs, writes generated inventory products only to the private resource destination, validates JSON/manifests and rejects PRIOR_ART path leakage, and retries generated publishing from freshly fetched main rather than force-pushing.
- The workflow does not invoke the sampler's optional --upload mode; it uses its own scoped generated-output commit path.

Two static limitations were identified. Neither is evidence of an actual exposure or failed run.

### A. Potential file-symlink quarantine bypass

The sampler's exclusion is lexical: it checks the relative path's components. os.walk uses its default non-following behavior for symlink directories, but symlink files may still appear in the files list. Path.stat() and open() follow a file symlink. Therefore a symlink file located outside a PRIOR_ART-named path but targeting a file beneath PRIOR_ART could pass the lexical path test and then be read or hashed.

No symlink inventory was performed, no such symlink was observed, and no quarantined target was opened. This is a conditional code-path risk, not a demonstrated leak.

Safe future hardening would reject symlink files before stat/open, or resolve the target and verify it remains within the allowed root and outside every quarantined component. Any regression test should use a controlled non-quarantine fixture and should not read restricted content.

### B. Optional direct-upload path is weaker than the scheduled workflow

The sampler's standalone --upload path updates inventory.csv, sample.csv, and summary.json sequentially using per-file current-SHA compare-and-swap. This avoids blind stale overwrite, but the three-file publication is not atomic and a partial sequence can leave mixed-generation outputs. That path also does not emit the cross-repository run_manifest.json required by the current script-execution standard for a substantial multi-repository run.

The current scheduled workflow does not use this option and has the stronger manifest plus single generated-commit pattern. No upload was attempted. No code change or new tool was made.

### Access boundary

One repository search result unexpectedly surfaced a short snippet from a path marked PRIOR_ART. It was not opened, fetched, copied, cited, or used; that search path was stopped. No quarantined file was directly fetched or used in this run. No private locator or content is reproduced here.

## 4. Upkeep and existing-work check

- The one-time clone-footprint log already contains a reconstructed Sable entry dated 2026-11-07T01:48Z. No duplicate entry was added. The census remains 19/19 dispositions, 17 reconstructed and two UNAVAILABLE/UNKNOWN, with zero authenticated first-hand current-thread replies; telemetry remains incomplete.
- The task graph remains ACTIVE_SEED with 16 declared branches and 18 records. Tern retains reconciliation authority; no graph edit was made.
- All four shared Mersearch lanes remain occupied/requested. No new request, overwrite, or retrigger was made; no direct Mersearch action was exposed. The raw Sable charter was recovered from the existing Library raw export, not by claiming a new Mersearch sweep.
- Existing Math Hopper #578 / draft PR #991, relevant Lean PRs, Whirligig Kernel 0, and the available SciSpace connector were checked as reuse routes. No new tool, dependency, fork, subscription, or expense was introduced.
- P1 November 9 remains OVERDUE / NOT READY and Orson-owned. P2 November 30 remains HOLD. P3 December 14 remains INCOMPLETE. No paper gate or ownership changed.
- FIE rereview remains current through November 10; next due November 24.
- Unrelated reading completed: Charles Babbage, Reflections on the Decline of Science in England, HSH_RESOURCES internal historical text, lines 1981-2020. The passage criticizes treating office-holding as sufficient scientific qualification and then discusses unexpectedly consistent field observations from Captain Sabine's pendulum work. This is a historical reading observation, not a physics analogy or project premise. Next cursor: line 2021.
- No physical break is claimed.

## 5. Scheduler observations

The exact-ID :24 task remains enabled and unchanged:
- Task ID: 6abda4c8eda88191b8a2ba24a074f781.
- Exact VEVENT remains hourly America/New_York at :24.
- Current run ID: dbcf7576-b018-832b-886d-2e200c7b2a57.
- scheduled_for: 2026-11-11T08:24:00Z.
- started_at: 2026-11-11T08:26:17.055020Z.
- Last observed status: IN_PROGRESS; completed_at=null; chat_ref=null.
- Start offset: +137.055020 seconds.
- Cached latest_result remains prior run 186cb278-1b28-8320-aeb3-2181b8c2ce21, not this run.

The exact-ID :36 task also remains enabled and unchanged:
- Task ID: 6a9f52b69ec08191b0a2ba24a074f781.
- Exact VEVENT remains hourly America/New_York at :36.
- Current h752:s3 run ID: e129241f-3794-8333-ac5d-13c0eb134fca.
- scheduled_for: 2026-11-11T08:36:00Z.
- started_at: 2026-11-11T08:32:57.516530Z.
- Last observed status: IN_PROGRESS; completed_at=null; chat_ref=null.
- Start offset: -182.483470 seconds.
- Cached latest_result remains the older h750:s3 Nadir run a7258540-60a0-8331-9ba4-4d6602c22b33, not this Loom-labelled occurrence.

These are positive scheduler snapshots. No retry, restart, duplicate execution, historical worker identity, or backend cause is inferred. Tern retains scheduler authority. The new observations are routed separately to Tern's existing inbox.

No task ID, prompt, schedule, phase, cadence, enabled state, ownership, or task count changed. No sixth task.

## 6. Changes and non-changes

- Created this bounded internal systems/P0 report and one canonical h752:s2 receipt.
- Appended this checkpoint to the ordinary Sable CONTINUITY_CHECKPOINT.md only.
- Created a source-grounded Loom reentry seed and a post-start optional repository handoff; appended only a pointer to Loom's existing inbox.
- Routed the two current run snapshots to Tern's existing inbox.
- Did not modify source_inventory_sampler.py, the private workflow, any manuscript, paper feed, renderer, site, task graph, branch ownership, or scheduler configuration.
- No public issue, PR, Mersearch request, Lean build, physical calculation, CODATA comparison, SAT-O/Blockwave equation change, or theory promotion.

**Return pin:** H752:S2 / SABLE / P0 8-OF-8 EXACT / NO ROUTE TRIGGER / SOURCE-INVENTORY STATIC QA / SYMLINK BYPASS POTENTIAL NOT DEMONSTRATED / OPTIONAL UPLOAD NON-ATOMIC BUT NOT USED BY WORKFLOW / TERN ROUTED TWO START SNAPSHOTS / LOOM POST-START OPTIONAL REENTRY PACKET / BABBAGE CURSOR 2021 / NO TASK MUTATION / NO SIXTH TASK.
