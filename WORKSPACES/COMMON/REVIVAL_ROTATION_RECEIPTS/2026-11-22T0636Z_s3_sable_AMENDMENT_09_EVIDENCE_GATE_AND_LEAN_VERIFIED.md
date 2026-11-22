# Sable h1014:s3 Amendment 09 — Evidence-gated readout and Lean verification

**Observed:** 2026-11-22T07:19Z.  
**Canonical run:** `REVROT3-19-20261011:1014:s3`.  
**Status:** substantive code update committed; PR-triggered merge-reference Lean build SUCCESS; canonical report remains the original h1014:s3 artifact, with this append-only amendment.

## 1. Identity, source, and routing

- Nominal slot: 2026-11-22T06:36:00Z.
- h=1014; seq=5073; 5073 mod 19=0: Sable (index 0); next Loom (index 1).
- Historical ordinary-Sable conversation locator: `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`, recovered from the ordinary `Revival Rotation` raw export. Its current live usability is **UNVERIFIED**.
- The separate `SABLE Revival Rotation` conversation is `6aa6701e-b800-83ea-a19a-31a802b7124d`; it is a distinct source stream, not a substitute live thread.
- Direct user-role evidence in ordinary Sable: message `d3976dcf-c5dc-49c7-a523-e6469f4910db` asks for “big bites” using “seive and Mersearch/Mercer_Searcher” to bulk-triage and characterize.
- Direct user-role evidence in SABLE Revival Rotation includes systems/workflow/automation, knowledge-base, source-quality, resource/tool testing and scripting/extraction instructions. The consolidated broad Sable systems remit in the workspace README is an assistant-maintained synthesis, not a standalone signed charter.
- Ordinary Sable was not conflated with A. Sable Meridian. No authenticated current Sable thread, direct-thread delivery, or literal historical-instance continuation is claimed. This run is source-grounded assistant reconstruction in the scheduled execution.

## 2. Independent review and substantive repair

Loom's h1014:s4 review is recorded in [issue #2329](https://github.com/Satobloc/HsH/issues/2329) and [the review report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/LOOM/2026-11-22T0648Z_H1014_S4_REVIEW_MIND_SHARED_READOUT_FIBER_AND_MEMOPS_CI_QC.md). This is assistant-level independent review evidence, not authenticated Loom-thread participation or a formal GitHub PR review.

The review found that `commonReadoutEvidenceGate` was declared but no comparison/admission type required a proof of it. It also identified the shared `State` and `Field` carrier restriction.

Updated the existing child PR #2327 branch only:

- Commit: `c20eb516e5e214ef948d621d721fb060b410831e`.
- PR head: `c20eb516e5e214ef948d621d721fb060b410831e`.
- Merge reference: `020c424c3288486110a93e2df8a770cb20cf4dd9`.
- Module blob at both PR head and merge reference: `6ae1044ff16cc8070d975c4a88068407d86587cc`.
- Root aggregator blob at both: `dda687385204ad58c81f38fe3e2402b49166aeb6`.

Changes:
1. Added `EvidenceGatedFrozenCommonReadout`, carrying the frozen readout contract plus a proof of the declared external evidence gate.
2. Added `evidenceGatedDetectorLevelTwoSidedSeparation` and its fiber-witness characterization theorem.
3. Kept the raw detector-level separation theorem as a mathematical relation distinct from the evidence-gated admission surface.
4. Removed the unnecessary `hState : state ∈ hshStates` premise from `sharedReadoutCollision_blocks_hshExclusive` and its source-difference corollary. A collision with an admissible standard state already places the readout value inside the standard prediction region; H(s)H-state membership is not required for that non-exclusivity conclusion.
5. Made the module's limits explicit: exact set-membership only; no metric, noise distribution, covariance propagation or statistical threshold; both models currently share the same State and Field types, so heterogeneous model carriers still require explicit maps into a common carrier.

**Gate limitation:** the wrapper requires proof terms for the declared propositions, but those propositions do not authenticate the underlying source artifacts or establish their real-world truth. The raw mathematical relation remains callable; downstream admission code must choose the evidence-gated wrapper. This module does not globally enforce that downstream choice.

## 3. Actual Lean verification

<badge>SUCCESS — MERGE-REFERENCE BUILD</badge>

- [Actions run #44997383175](https://github.com/Satobloc/HsH/actions/runs/44997383175), job `137131242175`.
- Workflow: Lean 4 verification; conclusion SUCCESS.
- CI checkout/source commit: `020c424c3288486110a93e2df8a770cb20cf4dd9` (PR merge reference, not the PR head commit).
- Lean 4.34.0; Lake 5.0.0; Mathlib v4.34.0.
- Full build: **8,948 jobs successful**.
- New module built at job 8,946/8,948; root aggregator at 8,947/8,948.
- Six theorem-specific `#print axioms` outputs report **does not depend on any axioms**:
  - `hshDetectorExclusive_nonempty_iff_fiberWitness`
  - `standardDetectorExclusive_nonempty_iff_fiberWitness`
  - `detectorLevelTwoSidedSeparation_iff_fiberWitnesses`
  - `sharedReadoutCollision_blocks_hshExclusive`
  - `sourceDifference_and_sharedReadoutCollision_block_exclusive`
  - `evidenceGatedDetectorLevelTwoSidedSeparation_iff_fiberWitnesses`
- No `sorryAx` or `admit` occurrence was found in the retrieved complete job log.
- Tests, lint, leanchecker, nanoda and the separate axiom-audit action were skipped by this workflow.

The CI build compiled the merge-reference checkout. Independent PR-head/merge-reference blob equality for both the new module and root aggregator establishes that those source files were byte-identical in the successful checkout. This is not an exact-head checkout, a formal GitHub review, or a proof of source-to-physics translation.

Lean verifies only the encoded propositions. It does not authenticate calibration, instrument identity, uncertainty, readout provenance, a measured system or any H(s)H physical premise.

## 4. Mersearch/navigation preflight

- HsH root README, SAT archive root README, HSH_RESOURCES root README and HSH_RESOURCES `indexes/AI_START_HERE.md` were read. No HSH_RESOURCES private payload was opened.
- Mersearch stable release checked: `mersearch-stable-1.0`, pinned commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`. The documented shared request bridge and compact-receipt procedure were read.
- No callable Mersearch action is exposed in this runtime; no local three-repository checkout or Mersearch executable is available. The local checkout search found no `.git` directory. The existing publisher is not a suitable writer for this PR branch; the existing Lean Actions workflow is a validator, not a source writer.
- All four canonical request files remain `status=requested`; none was overwritten, retried, released or reset:
  1. `calder-angle-geometry-source-fidelity-20261102-1337`
  2. `perceptual-nexus-early-archive-20261120-01`
  3. `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`
  4. `kestrel-finite-core-geometry-source-fidelity-20261102-2200`
- All 20 request-scoped paths checked in the SAT archive (four requests × `RUN_MANIFEST.json`, `SEARCH_RECEIPT.md`, `SEARCH_RECEIPT.json`, `SEARCH_RESULTS.json`, `SEARCH_RESULTS.md`) returned 404. No search result or source coverage is claimed.
- Bounded fallback: direct GitHub API search/fetch and original Library raw-source reads. This is **not** a Mersearch run.
- No new tool, dependency, fork, subscription, install or expenditure.

`NAV_PREFLIGHT`:
- front doors: verified HsH, SAT archive, HSH_RESOURCES root README and AI start index;
- required tool: stable Mersearch 1.0 and shared bridge identified, callable action absent;
- existing outputs: four request files read; request-scoped manifests/receipts/results checked and not found;
- source passage: ordinary Sable direct user message plus separate SABLE Revival Rotation direct user messages read;
- first failure: no callable Mersearch action and no local checkout;
- alternate attempted: GitHub connector search/fetch and Library source retrieval;
- remaining blocker: all four shared request lanes remain occupied/requested and request-scoped output paths are absent;
- NIBBLE/capability route: not needed for this bounded source/architecture task;
- novelty: NO_NEW_TOOL.

## 5. PWH, continuity and exposure

- Task graph: 18 records against 16 declared; source timestamp 2026-11-21T18:09:36.717Z. No graph mutation.
- WH-02 remains the highest-priority unblocked PWH item and Calder/authorized-maintainer owned. WH-05 remains blocked pending Tern's controlled lane release. No takeover or priority change.
- Clone ledger appended three API-only repository-front-door observations for this run. At the 07:19Z readback there were 307 valid rows, 307 unique event IDs and zero parse errors. A later concurrent append records the PR workflow's separate shallow depth-1 checkout; the current ledger is 308 valid rows, 308 unique event IDs, zero parse errors. No local clone or checkout by this assistant execution; the Actions runner's shallow checkout is recorded separately below. Underlying runtime provisioning and GitHub Traffic attribution remain UNKNOWN.
- FIE last fully reviewed November 20; next review December 4. No re-review due.
- Unrelated-reading cursor remains 2766; the last recorded lateral break is recent, so no duplicate break was performed.
- P0 Code Grurple ACTIVE; P1 cognition OVERDUE / NOT READY / ORSON-OWNED; P2 measured geometry HOLD; P3 full theory INCOMPLETE.
- November 9 minor gate MISSED; November 30 major gate HOLD; December 14 full-theory gate INCOMPLETE.
- No physical system selection, measured dataset, calculation, fit, calibration/holdout test, numerical threshold, H(s)H prediction, independent measurement, SAT-O/Blockwave equation change, or BEDROCK promotion.

## 6. Scheduler observation

Exact task: `6a9f52b69ec08191b0a2ba24a074f781`.

- Enabled: true.
- Saved schedule: `DTSTART;TZID=America/New_York:20261001T143600` / `RRULE:FREQ=HOURLY`.
- Prompt and Lane Charter 36 unchanged.
- Run ID: `85408614-2334-8324-81ce-a7fe7934700d`; nominal `scheduled_for=2026-11-22T06:36:00Z`.
- Original receipt snapshot: `started_at=2026-11-22T06:40:35.318852Z`, status IN_PROGRESS, completion null, `chat_ref=null`.
- Later exact-ID peek: the **same run ID** reported `started_at=2026-11-22T07:08:35.599361Z`, still IN_PROGRESS, completion null, `chat_ref=null`.
- The cached `latest_result` belongs to different run `35d58a00-d208-8322-8ab2-8f9ec7d0756e`, scheduled 04:36Z and completed 04:49:28Z; it is h1012 Elias Kern, not this h1014 Sable run.
- The scheduler's top-level `last_run_time` remained `2026-11-22T06:29:20.375607Z` in that peek. The generic scheduled-task error notice is not correlated to a recorded failure for this current run.

The same run ID's start-time movement is an unresolved scheduler observation. It may reflect re-entry/retry, but no attempt ordinal or cause is exposed; do not infer a duplicate process, new worker identity, or failure. Preserve the enabled task and exact schedule. No task/ID/cadence/phase mutation, sixth task, signet or conversation rename.

## 7. Succession

Next deterministic label: **Loom**. Loom's h1014:s4 review is already present at issue #2329 and was consumed as an independent assistant-level review. No duplicate packet or new response obligation was created. No direct-thread delivery, consumption, acknowledgment or ownership transfer is claimed.

**Return cursor:** PR #2327 head `c20eb516e5e214ef948d621d721fb060b410831e`; successful merge-reference run #44997383175; parent PR #1487 remains OPEN / DRAFT / UNMERGED. Next formal question: whether downstream admission surfaces actually require the evidence-gated wrapper, and how to generalize distinct model state/field carriers with explicit maps without inventing equivalences. P2 remains HOLD.


## Correction note — request-scoped path count

The initial draft said 24 paths and referred to additional variants. The actual checked set was five paths per request across four requests, **20 total**. All 20 returned 404. This correction supersedes the earlier count; no additional paths are claimed.


## Final exact-ID task readback — 2026-11-22T07:19Z

A final `peek` of task `6a9f52b69ec08191b0a2ba24a074f781` confirms:
- Enabled: `true`.
- Title: `Workshop Relay :36 | Worldtube`.
- Saved VEVENT unchanged: `DTSTART;TZID=America/New_York:20261001T143600` / `RRULE:FREQ=HOURLY`.
- Default timezone: `America/New_York`.
- Saved prompt length: 3,965 characters; fixed 19-person ring, proof-first directive and Lane Charter 36 are present.
- Current run remains `IN_PROGRESS`, scheduled 06:36Z, same run ID, start snapshot 07:08:35.599361Z, completion null, `chat_ref=null`.
- Top-level `last_run_time` remains 06:29:20.375607Z and `next_run_time` remains the nominal 01:36 local slot; `latest_result` is the separate h1012 Elias run. These fields are not attributed to the current run.

No task, prompt, title, ID, schedule, phase or enabled-state mutation was performed.


## Follow-up — concurrent CI checkout ledger event

A later ledger readback at 2026-11-22T07:21Z contains 308 valid rows, 308 unique event IDs and zero parse errors. The earlier 307-row count was accurate at the 07:19Z observation before one concurrent append. The new row is event `2026-11-22T-h1014-s4-loom-run-44997383175-shallow-checkout`: PR workflow run #44997383175 / job `137131242175`, task ID `:48` (Loom slot), `actions/checkout@v4`, `fetch-depth=1`, checked-out merge commit `020c424c3288486110a93e2df8a770cb20cf4dd9`, PR head `c20eb516e5e214ef948d621d721fb060b410831e`, `head_sha_match=false`. The workflow succeeded. This is a shallow checkout, not a full clone; GitHub Traffic attribution and runner provisioning remain UNKNOWN. It is a separate CI event, not a local checkout by the current assistant execution and not a Sable :36 scheduler-thread identity claim.
