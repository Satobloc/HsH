# Sable :12 | Track B sticky-experience gate and P1 exact-head QA

**Date:** 2026-10-30  
**Nominal slot:** 15:12 UTC / 11:12 America/New_York  
**Run key:** `REVROT3-19-20261011:471:s1`  
**Disposition:** SOURCE-GROUNDED RECONSTRUCTION / TRACK B REVIEW COMPLETE / P1 EXACT-HEAD BUILD VERIFIED / NO CODE CHANGE / INTERNAL ONLY

## Rotation and source identity

[
h=471,quad seq=5h+1=2356,quad 2356\bmod19=0.
]

Selected: **Sable** (ring index 0). Next: **Loom** (index 1), run key `REVROT3-19-20261011:471:s2`.

Historical ordinary-Sable source: **Revival Rotation**, conversation ID `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`, raw export blob `3bf173c217e0755419152aa2225f39713929a5fe`. The export contains 28 mapping nodes, 27 message nodes, one user message, 22 assistant messages and four tool messages. Its `is_archived=false` flag is not evidence of present live-thread access. No current successor thread or cross-chat delivery was authenticated. This run is a source-grounded current-assistant reconstruction, not historical Sable participation.

## Control-plane readback

Read the complete current 568-line BEDROCK in contiguous ranges; October 26 Steering Charter; Three Paper Campaign; New Instance onboarding; Revival Rotation V3/V4; thread-first/navigation-preflight rules; worker autonomy/handoff protocol; no-renaming rule; scheduler authority; cross-repo write and shared-state safety standards; Reference Desk/Tool Chest; Sable README, continuity checkpoint and inbox; current task graph, Code Grurple roster/presentation gate; and relevant worker receipts/inboxes.

- Task graph: 15 top-level branches. P1/P2/P3, Code Grurple, GRURPLE-A/B and HAGALAZ remain active.
- Code Grurple A/B manuscript gates are closed at pinned accepted versions; both actual reader routes remain pending. No rewrite or reader workaround.
- Orson retains P1, PR #850, protocol and November 9 gate. The four-of-five substantive cognition target is unchanged.
- P2 November 30 and P3 December 14 unchanged.
- All four Mersearch lanes remain occupied. No request was overwritten or created; this Sable systems/QA task did not require a new SAT-O/Blockwave search.
- No local repository checkout was present. The documented house/local writer route was unavailable for these internal files, so the existing Git Data API fallback was used with one grouped commit and a parent-head lease.

Immediate Ravel :48 and Orson :00 receipt/handoff paths were unavailable at intake. Latest verified packets read were Orson-to-Sable :12 at 11:12Z and Elias-to-Sable :12 at 13:12Z. Status: **IMMEDIATE_PREDECESSOR_MISSING_OR_IN_FLIGHT**, not a missed check-in.

## Independent Track B disposition: sticky experience

Sources:
- `Satobloc/HSH_RESOURCES/tools/workflow_switchboard_demo.py`, blob `49988a769389b2baf264a27d596ba7c3ff822b36`, source commit `b2ad3828b5a7f67985d5d91ec3911a2516e3a8ff`.
- `info/WORKFLOW_THREADING_PROTOTYPE.md` and `info/WORKFLOW_SWITCHBOARD_PROTOTYPE_READ_ME_FIRST.md`.

The docs explicitly call sticky experience **candidate state until tested/promoted**.

Code inspection:
- `sticky(actor, kind, text)` validates a bounded kind, hashes content, and appends a deduplicated `{id, kind, text}` record to `state["experience"][actor]`.
- The record has no candidate/promoted status, source/version, creation time, scope, transfer-test receipt, second-context result, or reviewer/exposure provenance.
- `wake()` can return the route label `experience`, but the inspected implementation does not load or apply entries from the experience bag to active rules.
- The built-in `self_test()` does not exercise sticky capture, promotion or transfer testing.
- A source-extracted Python reproduction confirmed that a call persists a record while the current wake path returns only a route label and does not apply the stored record. This is a method-level reproduction, not a full production integration test.

**Correction to earlier shorthand:** Elias's “durable write” description is accurate at the storage layer. It does not establish immediate behavioral promotion or demonstrated learning. The current prototype is an incompletely typed candidate store, not a production promotion gate.

| Element | Disposition |
|---|---|
| Hash-deduplicated capture | **KEEP** as candidate intake |
| Candidate/promoted state model | **MODIFY** before production |
| Independent second-context transfer | **TEST** before promotion |
| Implicit promotion from `sticky()` alone | **REJECT** |
| Production integration | **DEFER** until explicit gate and tests exist |

Recommended separation: candidate capture with provenance; a predeclared transfer test in a distinct context; a receipt recording expected behavior, source/version, exposure, result and reviewer; a separate promotion operation; and wake-time use of promoted entries only. No POC source, branch, PR or Track A implementation was changed. This is Sable's independent Track B view, not Tern's decision.

## P1 source and evaluator audit

Exact external source inspected:
- `aayambansal/ConsistencyBench/src/evaluate.py`
- Commit `bfc676baa848c7f1715bb73aee148180de15516e`
- Blob `0453540cb7c19227601e59fb342fa93e736da849`.

Confirmed:
- Fixed `openrouter/openai/gpt-4o-mini` contradiction checker receives two raw response texts, not question or premise.
- It compares prior raw answers within the same model's question sequence, not other models' answers. Panel majority is post-hoc aggregation, not peer exposure.
- The later repair prompt is context-rich: previous question, previous final extracted label, relationship/premise and current question.
- The stored tuple retains prior initial raw response alongside the final extracted label, so the next checker sees stale initial evidence while the repair prompt sees the final label.

The evaluator's `pairwise_consistency_rate` expression reduces to equality of correctness-status booleans. Aster/Calder already identified the both-wrong-pair consequence in P1 issue #564, including comment #6482793077. This pass independently reconfirmed it and created no duplicate public finding. The defensible P1 scope remains archival/methodological unless the original matched answer-keyed cognition bank is recovered. The current benchmark does not demonstrate causal peer influence or social conformity.

## PR #850 exact-head Lean verification

The previous head `dbd7529f6f2a3051bca31b47dbfbf7c86d7a66af` failed run #41078042006 at the powerset-sum rewrite. Orson repaired it in commit/head `0efbc7ae1577c37ee36b6bcdb4a0fb7c17ee619c`.

- PR #850 remains open, draft and unmerged.
- Exact-head run #41079040914, job #124142906377: **SUCCESS**.
- Lean 4.34.0 / Lake 5.0.0; 8,972 build jobs.
- `HsHVerification.OrsonFinitePatternDistribution` built.
- Eight selected theorem-specific axiom reports inspected; no `sorryAx` anywhere in the full job log. Dependencies reported are standard Lean/Mathlib axioms (`propext`, `Classical.choice`, `Quot.sound`).
- Tests, lint, nanoda and automated axiom-audit steps were skipped. No automated axiom-audit success is claimed.

The module proves, under its finite model assumptions, normalization of product-Bernoulli pattern weights, nonnegativity on the valid parameter domain, valid finite probability weights for both constructions, and a non-injective observation map between shared-gate and latent-difficulty labels. This is a conditional non-identifiability result: passive pattern frequencies cannot distinguish these two model labels within this parameterized family. The module explicitly does not authenticate either label as the real ConsistencyBench data-generating process. Lean verifies the formalized probability statements, not empirical mechanism, archive fidelity, semantic truth or causality.

Sable changed no code and did not alter Orson's ownership.

## P1 D1 reader/PDF continuity

The prior Sable report `WORKSPACES/SABLE/2026-10-29_2012Z_P1_READER_SOURCE_AND_PROOF_QA.md` records local D1 TeX/PDF and a reader-only caption repair. The small patch remains in the repository at `WORKSPACES/SABLE/PATCHES/2026-10-29_2012Z_orson_p1_reader_caption.patch`, blob `c871825aefee2f74721a5ef8766fcbb1dd59596d`.

The original TeX/PDF and patched PDF are absent from this run's container, exact-name Library search and repository file search. The patch is not the source document or compiled reader artifact. Therefore current PDF/TeX bytes and reader rendering are **NOT VERIFIED**; author approval and independent/hostile review are **NOT CONFIRMED**. D1 is not the November 9 paper itself.

## Unrelated reading and boundaries

Continued `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/TheTANGLE.txt`, lines 636-675. The passage is assistant-authored commentary, not Nathan Direct source. Next cursor: **line 676**. FIE was last fully revisited October 27; the 14-day trigger is not due.

No physical-system calculation, new SAT prediction, LLM call, model trial, human adjudication, new software/dependency/plugin/branch, POC or Orson code edit, manuscript/theory promotion, public paper submission, conversation rename, signet use, schedule edit or extra recurrence. No Orson cognition turn is counted.

**Next ring identity:** Loom. The handoff is context-only and does not reactivate Loom's paused Tag Conversation Corpus recurrence or transfer Sable/Orson ownership.
