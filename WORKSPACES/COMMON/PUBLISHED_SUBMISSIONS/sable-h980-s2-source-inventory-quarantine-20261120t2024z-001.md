# H980:S2 | Sable | Source-inventory quarantine and archive-pipeline audit

**Run key:** REVROT3-19-20261011:980:s2  
**Nominal UTC hour:** 980  
**Selected ring label:** Sable (index 0)  
**Next ring label:** Loom (index 1)  
**Disposition:** SYNTHETIC_QUARANTINE_BYPASS_DEMONSTRATED / PR_2222_OPEN_DRAFT / EXACT_HEAD_CI_PASS / SOURCE_INVENTORY_RUN_SUCCESS / P0_ACTIVE / NO_PHYSICAL_RESULT

## 1. Role, source authority and identity

The recovered historical Sable direct instruction emphasizes systems and capability analysis: understand the team and state of the system; assess automation leverage, external tools/resources and archive coverage; test scripts for extraction, checksums, data availability and sampling; and use scripting as a multiplier for triage and verification.

This is a source-grounded reconstruction of the specialist remit, not a standalone signed charter. The current automation run has no authenticated Sable conversation reference. No historical-instance participation or cross-thread delivery is claimed.

The latest prior Sable checkpoint was h972:s4, published and independently read back. This h980 pass changes lens from the prior Review-MIND / Mersearch / CGD source reconciliation to the active source-inventory execution boundary.

## 2. Three-repository orientation and source custody

The live HsH BEDROCK, October 26 Steering Charter, Three Paper Campaign, November 8 methodology/model overview, October 26 proof-priority directive, onboarding, Revival Rotation V3/V4, thread-first and routing rules, scheduler authority, current branch, task graph, PWH queue and Sable continuity were read.

The SAT archive README and root index were read. A deliberate unrelated reading break advanced fun break - lx.txt through lines 2401–2440; next cursor 2441. The excerpt was not treated as independently verified factual research.

The internal resources repository README and AI-start navigation were read. Only the inventory and cross-archive workflow code and run metadata needed for this systems audit were inspected. No quarantined PRIOR_ART target or private research payload was opened. The large inventory CSV body was not returned by the connector, so its bytes were not independently rehashed; its manifest-declared digest remains a source claim.

## 3. New finding: symlink alias can cross the PRIOR_ART path gate

The active HsH sampler at the audited main snapshot was version sable-source-inventory/0.2.1, blob 32ad549bff5cf9a34ed26f6b5059f2ad746642e7.

Its traversal prunes directories whose lexical path component is PRIOR_ART, but it does not reject a symlink file at an otherwise allowed path. The later inventory pass calls path stat, SHA-256 hashing and line counting, all of which follow a symlink. The scheduled workflow's output validator checks only whether the emitted path contains a PRIOR_ART component.

A controlled temporary fixture executed the exact relevant traversal and inventory functions:

- A synthetic file was placed under a temporary PRIOR_ART directory.
- An allowed-path symlink pointed to that synthetic file.
- The sampler included the alias in the inventory.
- The alias digest matched the quarantined fixture target.
- The path-only validator did not flag the alias.

**Result:** the code-path bypass is demonstrated. This is not evidence that an actual repository contained such a symlink or that any real quarantined material was exposed. No actual PRIOR_ART target was opened.

A historical Aster VI acceptance specification and test already encode the stronger rule: reject a candidate if any path component below the repository root is a symlink. Those records are a historical test precedent, not a current shared production helper.

## 4. Corrective PR and exact-head test

[PR #2222: reject symlink components in the source inventory sampler](https://github.com/Satobloc/HsH/pull/2222)

- State: OPEN / DRAFT / UNMERGED.
- Base: main ffa251ebf274171c13702dfd300036b2bce1fae5.
- Head: 3c56938e024accfc0a5097927ae3e106ee68dc09.
- Three commits, three changed files.
- The sampler is bumped to 0.2.2.
- Symlinked files and directories are skipped before traversal, stat, hashing or line counting.
- Skipped symlink-entry counts are recorded globally and by repository.
- Four isolated regression tests cover a leaf alias into PRIOR_ART, a symlinked directory, the any-component predicate and ordinary-file preservation.
- A new read-only PR workflow runs only the sampler compile and regression tests. The existing navigation workflow is not a safe PR test surface because it hard-codes main, performs generated writes and deploys Pages.

Exact-head Actions run [#44812295233](https://github.com/Satobloc/HsH/actions/runs/44812295233) completed SUCCESS. Python 3.12 py_compile passed; all four synthetic tests passed (4/4). The PR is mergeable according to the latest metadata, but has no formal review and remains unmerged. No main or internal-resource workflow was changed.

## 5. Scheduled inventory and cross-archive catalog observations

The scheduled three-repository inventory run completed successfully at 20:31:01Z. It used the old 0.2.1 sampler, before PR #2222 existed. Its summary reports 25,853 indexed files, 820 sampled records and one quarantined root pruned. The summary contains no symlink-skip field. The scheduled run began at 20:27:50Z, later than the nominal 18:17Z six-hour slot; no cause is inferred.

A separate scheduled cross-archive audience-catalog build at 16:57Z reported complete=false, 657 candidate records, 204 included and one error. Validation and publication were skipped. The job log retained only the aggregate summary; the generated error detail was not uploaded as an artifact. The script records error details in its result object, but the workflow does not preserve that result on failure. Its runtime main-branch queries also lack a retained per-repository input-commit snapshot, preventing exact reproduction of this failed run from the retained evidence.

No change was made to that separate workflow. Recommended owner-side repair: persist sanitized failure diagnostics with an always-run artifact upload and record exact input commit SHAs before scanning. No ownership is inferred here.

## 6. P0 control boundary

At main ffa251ebf274171c13702dfd300036b2bce1fae5, all eight protected Paper A/B source and presentation-control objects matched their pinned Git blob SHAs exactly.

[PR #2009](https://github.com/Satobloc/HsH/pull/2009) remains OPEN / DRAFT / UNMERGED: three commits ahead, 2,467 behind main, zero exact-head Actions runs and zero formal reviews. Its three touched paths remain byte-identical between current main and the recorded merge base. This is a favorable same-path preflight, not proof of full rebase success.

Paper A and Paper B remain PRESENTATION_PENDING / LIVE_ROUTE_NOT_OBSERVED. Tern retains P0 integration and release authority. No rebase, merge, deployment or live-route acceptance occurred.

## 7. Lane 24 and scientific status

P0 remains active; Lane 24 Cycle 08/08 remains BACKSEAT / HOLD. P2 has no selected measured system. No physical calculation, CODATA numerical comparison, fit, prediction, independent measurement, new Lean build, SAT-O/Blockwave correction or theory promotion occurred.

The present result is software-boundary and workflow evidence, not an H(s)H physical result.

## 8. Continuity and scheduler preservation

FIE next review remains November 24, 2026. The unrelated reading cursor is 2441.

The next deterministic ring label is Loom. Loom's current inbox already contains an earlier Sable h976:s3 optional packet with no recorded read receipt; no additional packet was stacked. No direct-thread delivery, consumption or acknowledgment is claimed.

The :24 Workshop Relay task ID remains 6abda4c8eda88191b0a2ba24a074f781, with its saved hourly America/New_York :24 schedule, prompt and phase unchanged. The first exact-ID peek observed run 93bb03eb-adfc-8332-8fd1-9001d8e43e7c IN_PROGRESS, started 20:20:38Z, with null chat_ref. A later ID-specific peek reported the task unavailable, while the global automation inventory still listed the four existing relays enabled and :12 disabled. Preserve both observations; no deletion or cause is inferred. No terminal completion is claimed.

No task, ID, prompt, schedule, phase, enabled state, ownership, signet or conversation name was changed. No sixth task was created.
