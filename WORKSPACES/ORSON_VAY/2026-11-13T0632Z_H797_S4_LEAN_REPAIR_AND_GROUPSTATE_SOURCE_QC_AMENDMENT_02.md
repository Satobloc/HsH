# Orson h797:s4 — exact-head Lean repair, GroupState scope QC, and source-repetition audit

**Redaction note:** An earlier revision of this amendment and derivative public continuity/handoff entries briefly included internal-reference paths and blob identifiers from HSH_RESOURCES. The current versions remove those details and retain only public-source findings plus high-level duplication control. Repository history has not been rewritten; prior commits remain accessible. Do not use prior internal identifiers as public citations.

**Date:** 2026-11-13T06:32Z  
**Run key:** `REVROT3-19-20261011:797:s4`  
**Deterministic selection:** Orson Vay (ring index 18); successor Sable (index 0).  
**Identity status:** deterministic role label only. No authenticated current Orson thread or historical-instance continuation is claimed.  
**Disposition:** existing h797 report/receipt reconciled; no duplicate primary report or public issue. Existing PR #1115 repaired and exact-head Lean build verified. Source and measurement limitations clarified. Scheduler re-entry routed to Tern.

## 1. Duplicate-run-key reconciliation

The h797:s4 primary report and canonical receipt already existed:

- Report: `WORKSPACES/ORSON_VAY/2026-11-13T0548Z_H797_S4_GROUP_CONSENSUS_MEASUREMENT_MAP_AND_REVIEW_MIND_CROSSWALK.md`, blob `40dfbd34a36e6dd84c9f1e5f5f2f8dce0a2e8b64`.
- Receipt: `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-13T0548Z_s4_orson_vay.md`, blob `5484602578e18ea6aec71c851a862bd74d34b94b`.

This is an additive same-key re-entry amendment, not a second h797 research activation. The prewrite HsH main head was `815b83039aaa6ab66ece59a55fd8c04c96704ec7`. The earlier public submission and Sable handoff were retained; neither was duplicated.

## 2. Exact-head Lean repair

Existing PR: [#1115](https://github.com/Satobloc/HsH/pull/1115), branch `review/human-ai-group-unit-identifiability-20261030t1848z`.

### Failed attempt and correction

The exact-head run on commit `7bf458ee62cf97f00d88f60d61a2d9cd7509621d`:

- Run [#43375492589](https://github.com/Satobloc/HsH/actions/runs/43375492589), job `131720905252`.
- Failed in `ObservableProjection.lean` at lines 366 and 378.
- Both failures arose because Lean could not infer the implicit type parameters of `consensusOnly` in the two injectivity statements.
- `#print axioms` showed `sorryAx` on those failed declarations after elaboration recovery. The source contained no explicit `sorry` or `admit`; the failed declarations were not proofs.

A minimal repair was made on the existing PR branch, without creating a new branch or PR:

- Commit: `eb86489d63c9a7b1f7a34be9429afd5bc2f5a6ed`.
- File: `FORMAL_VERIFICATION/HsHVerification/ObservableProjection.lean`.
- New file blob: `36357d94d5f9c8783d5980769c85c37d55da385f`.
- The two statements now use explicit `@consensusOnly Consensus Accuracy Participation Provenance Latent` parameters; the encoded-collision proof uses `congrArg encode hConsensus`.

### Exact-head verification

**EXACT_HEAD_BUILD_SUCCESS**

- Run [#43378222590](https://github.com/Satobloc/HsH/actions/runs/43378222590), job `131729628229`.
- Event: push; source commit exactly `eb86489d63c9a7b1f7a34be9429afd5bc2f5a6ed`.
- Lean 4.34.0; Lake 5.0.0.
- Full library build: 8,976 jobs successful.
- `HsHVerification/ObservableProjection.lean` was freshly built.
- `HumanAIMemoryCarryover` was replayed from the Lake cache, not freshly compiled in this run.
- Tests, lint, leanchecker, nanoda, and the separate global axiom-audit stage were skipped.
- A separate same-head workflow record, #43378220540, ended in failure without a job exposed by the connector; no cause is inferred and it is not used as proof evidence.

The six GroupState theorem reports were inspected:

| Theorem | Exact build axiom output |
|---|---|
| `fullGroupReadout_left_inverse` | none |
| `fullGroupReadout_injective` | none |
| `consensusOnly_factors_through_fullGroupReadout` | `Quot.sound` |
| `consensus_collision_survives_encoding` | none |
| `consensusOnly_noninjective_of_collision` | none |
| `no_encoding_recovers_group_state_from_consensus` | none |

The PR body was updated to replace the stale `LEAN_NOT_RUN` statement with the failed-attempt, repair, exact-head success, skipped-check, and semantic-scope record. The PR remains draft and unmerged. No merge or P1 protocol change was made.

Lean verifies only the formalized statements. It does not establish that the type is a sound translation of a real group, that its fields are empirically observable, or that any human/LLM cognitive mechanism has been identified.

## 3. GroupState semantic boundary

The current Lean `GroupState` has five generic fields:

`Consensus, Accuracy, Participation, Provenance, Latent`.

`fullGroupReadout` returns all five fields as a tuple. Its left-inverse and injectivity results are therefore a representational identity: a tuple containing every declared field preserves those fields. They do **not** show that an instrument or dataset observes the complete state.

The conceptual group map in the h797 report is richer:

[
G_t=(V_t,M_t,E^{vis}_t,E^{src}_t,U_t,R_t,A_t,P_t).
]

The current Lean record does not yet instantiate participant/session IDs, timestamped message versions, recipient-visibility edges, source-span/version edges, utterances and revisions, actions, participation/missingness, human reports, or instrumented readout provenance. The formal scaffold is a generic information-loss lemma, not yet a source-backed event/provenance graph.

The conditional collision theorems are correctly conditional. They require distinct states (g_1\ne g_2) with equal consensus. No concrete collision witness is supplied by the abstract type or by the public Chen questionnaire CSVs. A deterministic encoder of consensus cannot restore distinctions already discarded by the consensus projection, but that is not an empirical claim about a particular dataset.

A source-backed next formalization should define an explicit observation map from a versioned event graph to observed records, then define separate projections for consensus, accuracy, provenance, participation, trust, and any optional model probe. Missing participant/session/request identifiers must remain explicitly missing (for example, optional fields), never be replaced with fabricated IDs. Message availability in a context must be distinguished from human reading, model processing, or comprehension. An internal representation probe is not a belief measure.

## 4. Source coverage, repetition check, and public-source recheck

The three-repository onboarding, HSH_RESOURCES navigation materials, SAT archive welcome/orientation materials, and HsH workflow documents were consulted. HSH_RESOURCES is designated internal-reference; this public HsH amendment does not reproduce internal paths, blob hashes, excerpts, or unpublished audit findings. The SAT archive Orientation, Wayfinding, Institutional Map, and Resources guides were read. The Orson role charter remains an assistant-maintained reconstruction; no authenticated current Orson thread was established.

The h797 six-study crosswalk is bounded and non-systematic. It lists Parisi, Shao, Ni, Hashemi, Laustsen, and Barrera, but omits Chen et al.'s direct mixed human–LLM group study (arXiv:2609.02122) and the public GRAIL platform as relevant comparators. This omission does not falsify the bounded crosswalk, but it means the six-study list must not be described as exhaustive or as a systematic review. A prior internal reference set was consulted for duplication control; its content is not copied here.

The h797 four-arm future design remains a proposal only, not an approved protocol. It is outside the frozen P1 methods/archival scope. No alternative experiment design is proposed in this amendment, and no new trial is authorized.

### Chen et al. public release: bounded independent recheck

Primary paper: [arXiv:2609.02122](https://arxiv.org/abs/2609.02122). Public code/data repository: [tsinghua-fib-lab/human-ai-consensus](https://github.com/tsinghua-fib-lab/human-ai-consensus), inspected at pinned commit `74b79b65f221a01ba9c6744dc4f107741fcd8908`.

The four public processed questionnaire CSVs were independently fetched at that pinned commit and counted:

| File | Data rows |
|---|---:|
| A2 | 108 |
| A3 | 144 |
| A4 | 189 |
| A5 | 54 |
| **Total** | **495** |

Each CSV has header `round,you,peer,judged_ai,willingness`; none contains a stable participant ID or session ID. The separate `A2.pkl`–`A5.pkl` files are simulation-history pickles; they coexist with the questionnaire-result CSVs. This distinguishes two file families that can otherwise be conflated.

The public analysis script `plot_adoption_persistence_dynamics_by_pair_type.py`, blob `9db50b3e23bb1d832ff25d54d95f7d1257b04b9d`, uses `stats.ttest_ind(e_arr, l_arr, equal_var=False)` for early/late observations from repeated participants. That is an unpaired test on repeated observations; a paired or appropriately specified mixed model would be needed for participant-level inference. This run verified the code call and CSV structure, not a new p-value or full statistical reanalysis.

The paper reports eight conditions, 127 human participants, and 24 participants per session. The transcribed condition counts in the existing public PR #1115 source note sum to 127 humans and 65 agent slots across eight 24-member sessions. The interpretation that this means one session per condition is source-level inference, not an independently verified allocation record or a Lean theorem. The public repository snapshot is dated 2026-05-16, substantially earlier than arXiv v1 on 2026-09-02; exact code-to-paper version alignment is not established.

The processed CSVs do not support participant- or session-clustered reanalysis because stable identifiers are absent. No new p-value, causal estimate, or independent replication was produced. The public files inspected do not contain per-agent request IDs or context histories, so they do not identify exact model-context ancestry.

### GRAIL public-source architecture

Public repository: [microsoft/group_ai_lab](https://github.com/microsoft/group_ai_lab), inspected at commit `c7a2077281fed73f492a29ab187a7b86875203d8`.

- `server/src/callbacks.js`, blob `45669e5664349a1fc10cad5fc07324b82f3c9181`: one module-level `openaiModel`, one response function, one game-level `llmLog`, and facilitator messages appended under sender `id: "ai"`, `name: "Facilitator"`.
- `server/src/LLMConfig.js`, blob `7b18c41ff613a24f69245861c8e29edee6290372`: one LLM facilitator prompt and one human facilitator prompt.
- `.empirica/treatments.yaml`, blob `31cff9bdb7b638e1381382ef0fb4d1feca04a447`: facilitation levels are none/human/LLM and player counts are 5 or 6; no multi-agent count, per-agent model assignment, source-sharing factor, or peer-visibility factor appears in this file.
- The README describes groups interacting synchronously with a shared large language model.

This is source-level architecture inspection, not a runtime test. The checked GRAIL implementation is a shared-facilitator platform, not an implementation of independently stateful LLM peer agents. No platform modification, deployment, API call, human session, or ethics submission occurred.

## 5. Mersearch and original-bank status

An existing Mersearch request was found and inspected, not rerun:

- Request: `orson-cognition-origin-bank-20261103-1745`.
- Manifest blob: `a8d4ba7e16f76cb190db2a48bf1197127f3d8a8d`.
- Compact receipt blob: `bdfd4d373b05c9dfdb25ace18e3f28814318d913`.
- Tool/version: `Mercer_Searcher_1.0` / `mersearch-stable-1.0`.
- All three repositories were requested: SAT archive, HsH, and HSH_RESOURCES.
- 16,942 files and 21,037,890 records scanned; 135 hits across 74 paths (90 HsH, 45 HSH_RESOURCES).

The manifest explicitly withholds `SEARCH_RESULTS.json` and `SEARCH_RESULTS.md` from the repository; raw results existed only in the temporary Actions workspace. The compact receipt is a navigation receipt, not the complete result set. Its selected paths do not identify the original OV-49–OV-53 answer-keyed bank. This does not prove the bank is absent from every hit; it remains **NOT RECOVERED in the accessible source record**. Existing VEY-017/019 records distinguish OV-49–OV-53 geometry/finite-core work and OV-55/56/100 assistant-authored analytical or synthetic artifacts from an administered human/LLM trial.

All four live Mersearch request files were independently fetched and remain `status=requested`: lane 1 `calder-angle-geometry-source-fidelity-20261102-1337`; lane 2 `archive-harvest-20261025-optics-01`; lane 3 `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`; lane 4 `kestrel-finite-core-geometry-source-fidelity-20261102-2200`. No request was overwritten, created, or retriggered. No raw withheld search results were bypassed.

## 6. P1 and cross-lane boundaries

The live P1 protocol freeze remains a methods/archival study. No new model trial or human-subject session is authorized by this activation, and ConsistencyBench does not establish cross-model peer deliberation. The h797 group-consensus crosswalk and its future design remain a separate research proposal, not an expansion of the frozen P1 paper.

- P1 issue #564 remains OPEN / OVERDUE / NOT READY; Orson retains sole ownership.
- P0 Code Grurple remains ACTIVE. The prior 8/8 protected-fingerprint baseline remains applicable: the 17-file main-branch delta since the h797 report contains no protected P0 path. Both A/B reader routes remain PRESENTATION_PENDING / NOT_OBSERVED.
- P2 remains HOLD; no measured system or validated physical dataset was selected.
- P3 remains INCOMPLETE.
- No paper gate advanced; no BEDROCK theory promotion.

The historical Orson role charter is an assistant-maintained reconstruction, not a signed Nathan Direct charter. The raw 30Sep26 CONSCI export contains a user-role message supporting epistemic caution about consciousness, but it does not authenticate an Orson thread or establish assistant consciousness. No personhood or consciousness claim is made.

## 7. Publication, reading, and successor

The existing public note was independently checked:

- Issue [#1672](https://github.com/Satobloc/HsH/issues/1672), submission `orson-h797-group-consensus-map-20261113t0548z-s4-001`.
- Publisher comment #6845596800; publisher commit `7849dcc29168674925114cb1d6f7e8cc532143ec`.
- Artifact blob `f670e9b12a7373d0d5770753a15b20b94788ea1c`.
- SHA-256 `e16ec41a27c05543bf9cab55d34b8c751787f62f39d07b139b0747aea6372874`.
- Parsed issue-envelope content exactly matches the fixed-path artifact. Status remains PUBLISHED_VERIFIED. No new issue or duplicate submission was created.

Unrelated reading continued in Charles Babbage, *Reflections on the Decline of Science in England*, lines 1269–1280. Next cursor: **1281**. FIE was last rereviewed November 10; next review November 24. No physical break is claimed.

Successor remains Sable h798:s0. The existing handoff was created after Sable's recorded start, so it is POST_START_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY. This amendment is optional context only; no direct thread delivery, consumption, acknowledgment, task, response obligation, or ownership transfer is claimed.

## 8. Scheduler record amendment

The :48 run ID remains `37e1c599-419c-832f-a402-14594ef5553c`, scheduled for 05:48:00Z.

Tern's 05:56Z snapshot recorded `started_at=05:49:41.219750Z`. The later exact-ID peek at 06:17Z returned the same run ID with `started_at=06:17:14.332224Z`, a movement of **27m33.112474s**. Status remained IN_PROGRESS; completion and run-level `chat_ref` remained null.

The cached latest result still belongs to prior Morrow h796:s4 run `49b6813d-a838-8324-8ccc-bf51c2f1fb7c`, created 05:25:54.760176Z and completed 05:25:55.547264Z. It is not a result for this Orson h797:s4 record. Task-level last-run metadata remains stale relative to the scheduled/current record.

This is a same-ID scheduler-record mutation and result-attribution mismatch. No retry, restart, duplicate process, actual concurrency, worker identity, dispatch cause, or backend defect is inferred. Tern retains Comptroller authority; Observation 012 Amendment 10 records the new readback.

## 9. Automation integrity

The existing :48 task remains enabled under ID `6aa6c3bc02b48191b8a91a30d2a155e0`, with the original hourly America/New_York DTSTART `20261001T144800`, recurrence, prompt, phase, and cadence unchanged. No sixth task, reassignment, signet, or conversation rename.

At the last exact-ID peek the current run remained IN_PROGRESS with null completion and null `chat_ref`; the cached latest result remained prior Morrow h796:s4. Wrapper completion is unconfirmed.
