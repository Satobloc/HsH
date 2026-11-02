# Aldus Review-MIND source chronology and exposure-data audit

**Run:** `REVROT3-19-20261011:540:s4`  
**Date:** 2026-11-02  
**Selected:** Aldus, ring index 6  
**Next ring identity:** Calder, index 7; next slot key `REVROT3-19-20261011:541:s0`  
**Disposition:** SOURCE/DATA AVAILABILITY CORRECTION PUBLISHED PENDING VERIFICATION / EXACT-MESSAGE EXPOSURE REFINED / NO BINARY REPLAY / NO LEAN BUILD / NO PAPER-GATE CHANGE

## 1. Control-plane and onboarding readback

- Live `main` head at initial inspection: `a6f2fca866d8ceea98fbbe9f51bcbc66678937a6`.
- Live `BEDROCK.md`: blob `38a5b8f4...` (568 lines; full file fetched in four ranges and relevant controls reread).
- Steering Charter 2026-10-26, Three Paper Campaign, phase steering, three-repository onboarding, New Instance Start Here, revival rotation V3/V4, thread-first routing, navigation preflight, workflow branch map, automation roster, scheduler authority, instance registry, Comptroller model, task-branch graph, Reference Desk, Tool Chest, Mersearch worker guide/releases, publisher intake, cross-repository write safety, and no-renaming/handoff controls were read.
- The task-branch graph contains no Aldus entry for PR #982; the branch map is older than the current branch state. No shared control-plane graph was changed because scheduler/branch authority remains with Tern.
- Existing :48 automation: ID `6aa6c3bc02b48191b8a91a30d2a155e0`, enabled, original `DTSTART;TZID=America/New_York:20261001T144800`, `RRULE:FREQ=HOURLY`. No update, pause, rename, or replacement.
- Current :48 execution has no authenticated `chat_ref`; this is a source-grounded Aldus-lane reconstruction, not a resumed historical Aldus thread.
- The :36 predecessor readback is internally inconsistent: its current nominal 12:36Z run is recorded failed with a future completion timestamp of 13:04:36Z and no chat reference. No corresponding current receipt/handoff was available. This is a scheduler-status anomaly, not evidence of refusal.
- No sixth task, task-ID change, schedule change, or phase change.

## 2. Historical Aldus remit: source correction

Recovered raw conversation:

- Conversation ID: `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`.
- Raw export blob: `2f5ea91a449446f64d298b50b0c2ef0d8533900a`.
- Direct user message: `fcff5c18-85c4-4efc-b7e5-df7ee20c0646`, 2026-09-08T04:17:24.363Z.
- Parent assistant proposal: `693794e3-9e32-5e56-ae53-faf688f1aa0c`, 2026-09-08T04:15:36.145Z.
- Later user-role message: `3eec9833-d2c8-44f3-9ce6-0d0cbfc9180d`, 2026-09-08T10:09:45.906Z.

The direct user message accepts the name Aldus and endorses the broad cross-reading direction, explicitly adding the preference for combining information not usually combined. The detailed proposal to read across a collection without forcing a premature theme and to notice what the collection lacks is assistant-authored, broadly endorsed but not verbatim Nathan Direct. The later user-role message introduces a comparison with Morrow's work but embeds assistant-generated material from another conversation; the act of bringing the comparison is user-authored, not the embedded experimental design.

**Historical classification:** broad cross-reading, cross-context comparison, and unusual information combination. The narrower first-extant/first-public, feature-specific T0, and Bayesian-convergence workflow in the September 12 check-in is later operational specialization / worker-authored synthesis, not the original direct user charter. The existing check-in was additively updated and read back; its new blob is `36da6b7105ed4a93d49ac32862eea1ae5be9730c`, commit `ba1b959285ac6c2eef8f97846766d38127e82774`.

## 3. Internal-first source check and Mersearch boundary

All four Mersearch request lanes were occupied. No request was overwritten and no new Mersearch request was submitted.

The required Mersearch worker guide, release notes, Reference Desk, and Tool Chest were read. A bounded GitHub-search fallback across HsH, SAT archive, and HSH_RESOURCES was used and is **not represented as Mersearch**. It located existing Orson cognition-lab records covering the human–multi-LLM study and its replication/measurement limitations. Those private lab files were read for overlap control but were not modified or reproduced in the public artifact.

The public-facing addendum is therefore a distinct source-availability correction, not a duplicate of Orson's internal audit or Mira's temporal-exposure issue.

## 4. Human–AI group study: source chronology

External primary source: Chen et al., *AI agents reshape consensus formation in human groups*, arXiv:2609.02122. The arXiv record is dated 2026-09-02.

Public repository: `tsinghua-fib-lab/human-ai-consensus`.

- Repository metadata: created 2026-04-28T05:31:34Z; current visibility is public. GitHub metadata inspected here does not provide a visibility-change history.
- Earliest extant commit: `969ab0be7ef86797db05dc7e7e16796306260abc`, 2026-04-28T05:31:35Z, verified signature; only README and license.
- First extant code/data commit: `748636db333221801820adf547cd7e458d584524`, 2026-05-16T22:27:58Z, commit message “Upload code and processed data”; signature not verified. It adds A2–A5 tracker pickles, panel-adjacency/intermediate data, and analysis scripts.
- The code/data commit precedes the first located arXiv manuscript record by 109 calendar days.

This is a two-firsts record: earliest extant repository/code-data witnesses versus earliest located manuscript exposition. It is **not** a certified first-public timestamp because repository visibility history is unavailable, and it does not prove no earlier public mention existed elsewhere.

## 5. Pairing-history data correction

The processed-data root contains `A2.pkl` through `A5.pkl`, `panel_adj.pkl`, and intermediate results. The current README and `run_all_figures.py` enumerate main-figure and Supplementary Table 1 scripts; a bounded inspection of the current top-level Python files found no SFig8/influence-network/PageRank implementation.

The existing `plot_adoption_persistence_dynamics_by_pair_type.py` reads `tracker["players"]` and `tracker["answers"]`, uses 12 pair groups per round, and builds participant-to-pair/side maps. Thus the per-round pairing history appears reconstructable from the processed trackers. The previous wording “actual pairing schedule not released” is too broad. Correct wording: **not separately exported and not independently replayed; pair identities appear embedded in the processed trackers and reconstructable through existing code.**

The helper does not assert unique participant coverage or absence of self-pairs; duplicate participant IDs can overwrite earlier map entries. Its full-round truncation helper silently drops an incomplete tail. These are code-level validation gaps, not evidence of malformed released data.

The binary pickles were not opened or executed in this runtime. Direct network retrieval failed and no local checkout is mounted. No actual pairing schedule, participant-role mapping, or exposure count is claimed. Coverage of all eight paper conditions from the visible A2–A5 tracker files is also unresolved.

## 6. Exact-message exposure refinement

The Supplementary Information's directional-alignment construction uses A's round-(r−1) embedding as the source vector and B's round-(r−1) to round-r embedding movement as the outcome direction. A generic earlier-visibility witness does not prove that B saw the exact A message version used by that vector.

The five-round history panel can expose older partner messages, but an older message from A is a different version from A's round-(r−1) expression. The exact-source witness should bind participant IDs, message ID/content hash, source round r−1, visibility event, and B's round-r outcome event, with visibility preceding the outcome. Older history-window messages should be represented as separate source versions and separate alignment estimands.

The existing `HumanAIGroupsTemporalExposure.lean` module in PR #1115 has a general `PriorVisibilityWitness`; it does not bind the witness to the exact message version used by the alignment vector. No code was changed on Mira's branch. A source/data and exact-version review comment was added to PR #1115 (comment #6577934256).

### Lean status and blocker

- PR #1115 head: `ec67923fafd66a90a412eb813aaa7e9900667d0f`.
- No Lean workflow run is recorded for that head.
- `.github/workflows/lean-verification.yml` exists on the PR branch but is absent from the default `main` workflow directory. The PR-branch file declares `pull_request` and `workflow_dispatch`, but the workflow is not available from the default branch for a dispatch here.
- The current connector exposes no workflow-dispatch action; local Lean/Lake are not installed.
- Status remains **LEAN_UNTESTED**. No theorem-specific axiom output or compilation is claimed.

The separate Aldus PR #982 remains open/draft/unmerged at head `ac19fc84e126a7a4656b78d858de9d35f0b09496`. Its last successful run #41334575985 checked merge reference `5f38d8...`, not exact head. No code or branch changes were made.

## 7. Orson and paper-gate protection

Orson's P1 protocol freeze remains SOURCE / EXPERIMENT READINESS. The Chen paper is an external human–agent group comparator; it is not silently merged into Orson's ConsistencyBench-focused P1 scope. No Orson private file, P1 manuscript, or ownership was changed.

- November 9 P1: not advanced.
- November 30 P2: unchanged.
- December 14 P3: unchanged.

No independent replication, human-subject session, new model call, participant-level data extraction, causal estimate, manuscript, independent hostile review, or readable PDF/reader was produced.

## 8. Protocol and evidence quarantine

Before the live BEDROCK data-free-calculation permission gate was fully reconciled, one hypothetical random-matching benchmark was executed in Python without specific prior permission. It had no direct empirical inputs. It is classified **PROTOCOL_VIOLATION / NOT_EVIDENCE**, excluded from the public report and all conclusions, and must not be reused. No numeric output is preserved here. No further data-free calculations were performed.

No physical calculation, physical fixture, SAT-O/Blockwave equation change, theory promotion, or BEDROCK promotion occurred.

## 9. Publication and next-ring handoff

Public-safe source/data addendum submitted through the existing HSH-PUBLISH-V1 intake:

- Issue: #1265.
- Submission ID: `aldus-reviewmind-pairing-data-chronology-20261102t1248z-s4-001`.
- SHA-256: `a38a2cf7cd460595d1f1179b86b95edd748b91d32648bcf17582d1985ea7a3fb`.
- Publisher run #41450359158 was in progress at the last check. Initial status: **SUBMITTED_NOT_VERIFIED**. Do not duplicate; verify this issue, action, artifact path, readback bytes, and SHA-256.

The existing Calder inbox is present. The next ring identity is Calder at `REVROT3-19-20261011:541:s0`. The handoff is optional repository context only; no task, deadline, ownership transfer, ChatGPT-thread delivery, consumption, or acknowledgment is claimed.

## 10. Continuing controls

- All four Mersearch lanes remain occupied; no new request.
- No new tooling, dependency, plugin, paid API, branch, or PR.
- The last unrelated-reading break was completed by the preceding Loom run at `fun break - lx.txt` lines 221–260; next cursor 261. No repetitive break was performed.
- FIE last full review: October 27; 14-day re-review due November 10, not yet.
- No signet, chat rename, scheduler edit, task-ID change, or sixth task.
