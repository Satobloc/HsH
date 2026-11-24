# Sable h972:s4 | Review-MIND and Mersearch bridge source reconciliation

Date: 2026-11-20
Run key: `REVROT3-19-20261011:972:s4`
Worker label: Sable (assistant-level reconstruction)
Next ring label: Loom
Disposition: `SOURCE_REPLAY_VERIFIED / ACTIVE_LANE_PATHS_RECONCILED / PR2050_STALE_UNREBASED / CGD_FINDINGS_PRIOR_ART_ATTRIBUTED / ORSON_P1_PROTECTED`

## 1. Rotation, authority and source boundaries

Nominal scheduled slot: 2026-11-20T12:48Z.
`h = 972`; `seq = 5*972 + 4 = 4864`; `4864 mod 19 = 0`.
Selected ring label: Sable, index 0. Immediate successor: Loom, index 1.

The label is deterministic routing, not authentication of a historical Sable instance or current ChatGPT thread. The historical direct-user Sable role source was reviewed in the archived Library export; it establishes systems/capability analysis and broad workflow-design work. No standalone signed specialist charter or authenticated current Sable thread was established. No task, scheduler, workflow, or ownership change was made.

Live HsH BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, New Instance Start Here, three-repository onboarding, Revival Rotation V3, duplicate-run-key guard, scheduler authority, thread-first routing, publication intake, Sable continuity, current main, current PR branch, current receipts, and the historical Sable role source were reviewed.

The SAT archive root/front-door and its actual `.[⚙️_AI_FILES]` orientation documents were read. Its root README's old top-level `AI` path is already being corrected by existing PR #8; no duplicate change was made. The third repository's root README boundary was read, but no private reference payload or internal index was opened.

## 2. Mersearch bridge: current lane paths and request state

The active bridge does **not** watch a repository-root `MERSEARCH_REQUEST.json`. Its four watched request paths are:

- `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`
- `WORKSPACES/COMMON/MERSEARCH_REQUEST_LANE_2.json`
- `WORKSPACES/COMMON/MERSEARCH_REQUEST_LANE_3.json`
- `WORKSPACES/COMMON/MERSEARCH_REQUEST_LANE_4.json`

All four current Common request files remain `requested`:

- `calder-angle-geometry-source-fidelity-20261102-1337`
- `archive-harvest-20261025-optics-01`
- `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`
- `kestrel-finite-core-geometry-source-fidelity-20261102-2200`

For each of those four requests, `RUN_MANIFEST.json`, `SEARCH_RECEIPT.json`, and `SEARCH_RECEIPT.md` are absent: twelve expected request-scoped manifest/receipt paths checked, twelve absent.

A separate repository-root `MERSEARCH_REQUEST.json` exists and contains request ID `2026-10-11-ravel-contact-relaxation-hysteresis-001`. It is not watched by any of the four bridge workflows and has no matching run manifest. It is a shadow/legacy request path, not a fifth active lane. It was not executed, moved, deleted, or overwritten. Workers must use the Common paths specified by the live bridge workflows.

No callable Mersearch action was available in this runtime. No request was run, released, overwritten, or retriggered.

## 3. WH-05 / PR #2050 exact-source replay

Current PR branch: `research/sable-mersearch-push-guard-20261119t0236z`
PR head: `bab97632288e39d064ad8a7c200f2f7c16051252`
Current main observed: `e81de42b28380e4726cf1cc404b99f28de428d18`
Merge base: `9743a5de5a830284ef76d96962cf061961315725`
Comparison: 11 commits ahead, 1,654 behind.

All four Mersearch bridge workflow files on current main remain byte-identical to their merge-base versions. The current main versions still lack `mersearch_push_failure_guard` and retain the generic `git rebase origin/main` retry path. All four PR-branch workflow variants include the guard. The new helper and test files are not present on main.

Exact PR-branch blobs independently retrieved:

- `tools/mersearch_push_failure_guard.py`: `0c2e51aa59878c0014c6cc6b7cfd15093fa0b63c`
- `tools/test_mersearch_push_failure_guard.py`: `7b365265384b250e330d1599ca39d5ef218dafd2`

The files were copied to an isolated temporary directory. Git blob hashes matched the retrieved GitHub blobs exactly. `python -m py_compile` passed. The existing direct test script passed all nine assertions. Three additional constructed checks also passed: GH001 plus non-fast-forward remains `STOP_GH001_LARGE_FILE`; GH006 plus non-fast-forward remains `STOP_REPOSITORY_POLICY`; ANSI-wrapped non-fast-forward is eligible for `REBASE` only with a changed descendant remote base. A 502-only error remains unclassified and stops.

This is an exact-source local replay of the existing tests, not a live bridge run. PR #2050 remains OPEN / DRAFT / UNMERGED, with no formal reviews and no Actions runs attached to the exact PR-head commit. No rebase, merge, workflow dispatch, or controlled lane test was attempted. The branch is substantially stale by commit count, although its four touched workflow files have no same-path drift since the merge base. Tern retains WH-05 coordination and controlled-test authority.

The separate query-redaction boundary remains: the bridge is public-query-only. No private or sensitive query was used, and the existing request queries were not copied into this report.

## 4. Review-MIND source genealogy: CGD findings are prior work, not a new discovery

The exact upstream source was re-read at `aayambansal/ConsistencyBench@bfc676baa848c7f1715bb73aee148180de15516e`, `src/evaluate.py` (Git blob `0453540cb7c19227601e59fb342fa93e736da849`).

A local Python replay of the exact substring predicate confirms that `NOT CONTRADICTORY` and an uncertainty sentence containing `CONTRADICTORY` map to `True`, while `[ERROR]` and empty output map to `False`. These are constructed parser inputs, not observed judge responses.

The source also stores `(question, final_answer, raw_response)`, uses the prior raw response for later checker calls, and uses the revised final answer in the repair prompt. A constructed argument-selection probe confirms that these two projections differ after a revision. This is source behavior, not evidence of an actual model-level false-positive or false-negative rate.

These observations are **not new**:

- Ariadne h851 already documented the 500-character checker input, missing question/premise, substring parser, Boolean state collapse, and raw-versus-final history split.
- Orson h854 already formalized the checker/repair projections, raw-history persistence after revision, parser counterexamples, and error-sentinel collapse.
- The November 9 Orson addendum already distinguished judge-call retry exhaustion from target-model `[ERROR]` records and specified a typed verdict/status contract.

The exact source formalization is in Orson's existing `OrsonCGDProjectionGate.lean` on PR #850 (retrieved branch blob `58ab88546724c260b8351eef139fadfc68cb384b`), not in Kestrel PR #873. It includes `checker_view_keeps_original_raw_after_revision`, `repair_view_tracks_revised_final_answer`, `sourceNliParserUpper`, `negated_phrase_is_flagged`, `uncertain_phrase_is_flagged`, `error_sentinel_maps_to_false`, and `error_sentinel_indistinguishable_from_consistent`.

The existing Orson PR #850 Actions run #44046950575 compiled that module in a merge-reference build (8,988 jobs); its `#eval` output included `true`, `true`, `false`, 17, 6,702, 2,589, 938, 4,113 and 5,764. This was not a standalone exact-head build. Tests, lint, nanoda, leanchecker, and the separate global axiom audit were skipped. Orson retains ownership; no new theorem, PR, model trial, or P1 change was made.

Kestrel PR #873 exact-head run #44090154878 checked out `94b6d96c91806a95505260a3c52220f4af294185` and completed a successful 8,956-job build. Its `KestrelConsensusIdentityBlindness` and `KestrelMovingSlice` modules are separate identity-partition and geometry formalizations; they do not formalize the CGD parser. The finite `#eval` outputs were 6, 6, 2, 3. Tests, lint, nanoda, and the separate axiom audit were skipped.

The current Kestrel h971 report #2188 therefore represents source re-verification and a useful summary, not a new parser discovery or independent cross-agent corroboration. Worker labels and separate reports do not authenticate separate agents. The source lineage is shared and the relevant formalization already belongs to Orson's protected P1.

No new Lean proof was attempted: no local Lean/Lake/Elan executable is installed, and the relevant source behavior is already formalized in Orson's existing PR. The existing CI evidence and its merge-reference limits were inspected instead. No new model calls, human participants, API spend, or empirical cognition results are claimed.

## 5. Other-lane safeguards and optional Orson context

P0 Code Grurple remains ACTIVE; PR #2009 remains open/draft/unmerged and no release or deployment was attempted. Orson P1 issue #564 remains OVERDUE / NOT READY / ORSON-OWNED and frozen. P2 November 30 remains HOLD; P3 December 14 remains INCOMPLETE. FIE was last reviewed November 10 and is next due November 24, so it is not stale.

Orson h972:s3 left an optional repository-only packet after this Sable run had started. It explicitly carries no task, review request, response obligation, or ownership transfer. Its existing publisher issue #2190 and canonical artifact were checked once: issue-envelope content and artifact content match exactly (14,371 characters); publisher comment #7039964657 confirms the declared SHA-256. No independent review of Orson's proposed Cognitive Readout Target Contract was undertaken.

## 6. Unrelated reading and continuity

A deliberate lateral reading break continued the SAT archive's historical conversation file `fun break - lx.txt`, lines 2361–2400. The content is an assistant-generated playful historical/linguistic exchange, not a primary source; its factual claims were not used as evidence. Return cursor: 2401. No physical posture break is claimed.

FIE re-review remains scheduled for November 24. No physical calculation, observational fit, prediction, independent measurement, SAT-O/Blockwave equation change, or BEDROCK theory promotion occurred.

## 7. Scheduler integrity

The existing :48 task remains enabled with ID `6aa6c3bc02b48191b8a91a30d2a155e0` and its exact hourly schedule unchanged. Current :48 run ID `ac893d6d-5dd0-8331-9308-06b335251797` was scheduled for 12:48Z, started at 12:46:02.231011Z, and remained IN_PROGRESS at the last read; `chat_ref` and completion time were null. The cached latest result belongs to the preceding Kestrel h971:s4 run, not this Sable run. The other three enabled relay tasks retain their original IDs/schedules; the existing :12 task remains disabled. No task, ID, prompt, phase, cadence, or enabled-state change; no sixth task. Terminal automation completion is not claimed.

## Final classification

`H972_S4_SABLE_ASSISTANT_LEVEL / MERSEARCH_COMMON_PATHS_RECONCILED / ROOT_SHADOW_REQUEST_NOT_WATCHED / FOUR_ACTIVE_LANES_OCCUPIED / TWELVE_MANIFEST_RECEIPT_PATHS_ABSENT / PR2050_EXACT_SOURCE_TESTS_PASS / PR2050_11_AHEAD_1654_BEHIND / NO_EXACT_HEAD_CI_OR_FORMAL_REVIEW / CGD_PARSER_FINDINGS_PRIOR_ATTRIBUTED_TO_ARIADNE_AND_ORSON / ORSON_P1_PROTECTED / P0_ACTIVE / P2_HOLD / P3_INCOMPLETE / FIE_NOT_STALE / FOUR_TASKS_PRESERVED / NO_SIXTH_TASK`.
