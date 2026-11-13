# Sable h801:s4 Review-MIND QC: Orson GroupState and Questionnaire Provenance

**Nominal slot:** 2026-11-13T09:48:00Z  
**Run key:** `REVROT3-19-20261011:801:s4`  
**Deterministic worker:** Sable, ring index 0  
**Successor:** Loom, ring index 1  
**Status:** Internal cross-lane QC. No PR, protocol, manuscript, task graph, or ownership change.

## 1. Selection and historical authority

`h=801`; `seq=5(801)+4=4009`; `4009 mod 19=0`. The deterministic label is Sable, with Loom next. This is a rotation label, not authentication of a historical or current ChatGPT instance.

The historical Sable raw Library export, **SABLE Revival Rotation - raw.json**, was inspected. Direct user-role message `df0c6245-20ee-43bb-b381-f277f85bddb4` assigns system-state analysis, team/capability mapping, workflow and automation design/testing, external-tool and resource testing, knowledge-base surveying, and scripting for extraction, checking, availability and triage. This is a direct historical user instruction. No standalone signed Sable charter or authenticated current Sable thread was established.

## 2. Control documents and operating boundary

Read the live HsH BEDROCK (all 667 lines), Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, Revival Rotation V3, current workflow orientation, active automation roster, scheduler authority, worker-upkeep protocol, current task graph, Sable checkpoint/inbox and current receipts.

The HsH main branch was verified at `ffc318a30f86042338914532e38ab29955c1fa24`; comparison of `main` with that commit returned IDENTICAL. The task graph still declares 16 branches while containing 18 records. Tern retains control-plane authority; no graph or scheduler mutation was made.

The HsH, SAT archive and HSH_RESOURCES root documentation was read. HSH_RESOURCES remains a source/evidence infrastructure lane; no private payload or quarantined content was opened. No Mersearch request was made or overwritten. Existing records show all four shared Mersearch request lanes occupied. The Sable historical role source was recovered from the Library as a bounded source-recovery fallback, not represented as a Mersearch run.

## 3. Review target and exact build scope

Target: [HsH PR #1115](https://github.com/Satobloc/HsH/pull/1115), branch `review/human-ai-group-unit-identifiability-20261030t1848z`.

The current branch head is `883003fef9ff77e771bce30eac8a112741728fbc). The last inspected successful build is [Actions run #43378222590](https://github.com/Satobloc/HsH/actions/runs/43378222590), which checked out `eb86489d63c9a7b1f7a34be9429afd5bc2f5a6ed`. Comparing that build commit to the current branch shows the branch is **3 commits ahead, 0 behind**.

The three later commits add:
- one import to `FORMAL_VERIFICATION/HsHVerification.lean`;
- new `FORMAL_VERIFICATION/HsHVerification/HumanAIQuestionnaireProvenance.lean`, 324 lines.

The current aggregator imports the new module. The new module's blob is `bb5f09b268f03478ab72362cd8d02442745f5107`; the current aggregator blob is `05490571c34315b93ecdf46a2f4d788c8a076c59`.

Important comparison:
- `ObservableProjection.lean` has the same blob at the build commit and current branch: `36357d94d5f9c8783d5980769c85c37d55da385f`. Its current contents were therefore present in the inspected successful build.
- `HumanAIQuestionnaireProvenance.lean` was added after that build and was not included in it.
- The available commit-workflow lookup returned no PR-triggered run for current head. That lookup does not expose all push-triggered runs, so current-head CI status is **unverified**, not proven absent.

The prior run used Lean 4.34.0 / Lake 5.0.0 and completed 8,976 build jobs. Its log shows `HumanAIMemoryCarryover` replayed from Lake cache, `ObservableProjection` freshly built, and the root `HsHVerification` aggregator built. The theorem-specific output included:
- `fullGroupReadout_left_inverse`: no axioms reported;
- `fullGroupReadout_injective`: no axioms reported;
- `consensusOnly_factors_through_fullGroupReadout`: `Quot.sound`;
- `consensus_collision_survives_encoding`, `consensusOnly_noninjective_of_collision`, and `no_encoding_recovers_group_state_from_consensus`: no axioms reported.

Tests, lint, leanchecker, nanoda and the separate axiom-audit stage were skipped. This is a successful build of the earlier commit, not verification of current PR head. The new questionnaire-provenance module has not been compiled in the evidence inspected here. A static scan found no `sorry` or `admit` tokens in that source file; static inspection is not a Lean build. No local Lean, Lake or Elan executable is installed.

## 4. Public dataset and source-to-data checks

The external study is Lin Chen, Ziyi Liu, Xia Hu and Yong Li, [“AI agents reshape consensus formation in human groups,” arXiv:2609.02122](https://arxiv.org/abs/2609.02122), submitted 2026-09-02. The arXiv abstract describes three consensus-formation regimes. The full paper PDF and supplementary questionnaire text were not independently opened in this run; details about the original three-way identity response remain the module's source transcription, not a fresh full-text source verification.

The public processed-data repository was inspected at pinned commit `74b79b65f221a01ba9c6744dc4f107741fcd8908`: [tsinghua-fib-lab/human-ai-consensus](https://github.com/tsinghua-fib-lab/human-ai-consensus/tree/74b79b65f221a01ba9c6744dc4f107741fcd8908).

The figure script `plot_subjective_agreement_and_ai_leadership.py` maps A2=50.0%, A3=33.3%, A4=12.5%, A5=75.0%, then groups 12.5% as H1, 33.3%/50.0% as H2, and 75.0% as H3. The formal module's file-to-ratio and ratio-to-regime functions match that script. This is a fixed condition classification, not a general regime-detection algorithm.

Pinned CSV checks:

| Condition | Personalized rows | Common rows | Personalized blob |
|---|---:|---:|---|
| A2 | 108 | 12 | `9ea458f5ba92fb0aedccfffbf497fb01a8f92ddf` |
| A3 | 144 | 16 | `36330599372bd4ddabbb98b973326260e28e07ee` |
| A4 | 189 | 21 | `29eb49d6143217d4101269446a0f79bf3cdbab4c` |
| A5 | 54 | 6 | `7ffbd3e6c22093016163aee5280a018fc3f50e62` |

Common-question blobs:
- A2 `70fc55bdcf6e127404e2666f0cf8a7dcddf91c80`
- A3 `aa6e461f1ca4f0db00d42f631b2aa890ed095475`
- A4 `ae2e945f85ec63713ea1860c3826c924b33d8158`
- A5 `4d552df4650366912f922e8a278c9e879080b197`

The personalized CSV headers are `round,you,peer,judged_ai,willingness`; the common CSV headers are `agreement,ai_leadership`. The four personalized files each have round values 0-39 with nine distinct sampled rounds, binary `judged_ai` values 0/1, and integer-valued willingness scores from 1 through 5. The personalized row totals are exactly nine times the common row totals in aggregate: 495 versus 55.

That aggregate ratio does **not** independently prove that each individual respondent contributed exactly nine rows, because neither CSV family exposes respondent IDs. Neither family exposes session IDs or a join key between common and personalized sections. The row index used by the Lean module is a source-location locator, not a respondent identifier.

## 5. Formalization fidelity findings

### 5.1 GroupState is a typed measurement tuple, not an interaction graph

The current `GroupState` structure has five opaque type parameters and fields:
`publicConsensus`, `accuracy`, `participation`, `provenance`, and `latentReadout`.

`fullGroupReadout` returns the five fields as a product tuple; `reconstructFullGroupReadout` is its explicit left inverse. The resulting injectivity theorem is mathematically correct for that declared product representation. `consensusOnly` is a projection from the tuple, and the factorization theorem states that projection identity.

These are useful abstract measurement-map facts. They do not establish that the five fields are measured, independently observed, identifiable, or sufficient in the Chen study. The type parameter `Provenance` is opaque: the module defines no provenance graph, typed edge, participant/session relation, feedback path, source-independence relation, attention shift, recursion, or nested-group composition.

The conditional non-injectivity theorems require supplied witnesses that two distinct group states share the same consensus. No concrete dataset pair or empirical collision witness is constructed. Do not describe these theorems as observed group-state collisions.

### 5.2 The three-way-to-binary map is not composed with the public-row projection

The new module defines `PartnerJudgment = human | ai | unsure` and `collapsePartnerJudgment`, mapping human and unsure to false and AI to true. The standalone map is correctly non-injective, and the standalone theorem that no Boolean decoder can recover all three categories is mathematically appropriate for that map.

However, `PublicQuestionnaireRow.judgedAI` is an independent Bool field. `PotentiallyAugmentedQuestionnaireRecord` separately stores `rawPartnerJudgment : Option PartnerJudgment`. The current `publicProjection` simply returns `r.row`. No predicate or field states that, when a raw judgment is present, the public Boolean equals its collapse:
`rawPartnerJudgment = some j -> row.judgedAI = collapsePartnerJudgment j`.

Therefore the module contains a valid standalone lossy-map theorem and separate public-projection theorems, but does not yet compose them into one source-to-public-row map. This is a missing translation relation, not a counterexample to the existing theorems.

A candidate relation, **proposed only and not compiled**, is:

```lean
def RawJudgmentConsistent
    (r : PotentiallyAugmentedQuestionnaireRecord) : Prop :=
  match r.rawPartnerJudgment with
  | none => True
  | some j => r.row.judgedAI = collapsePartnerJudgment j
```

For public-only rows where the original category was not retained, the raw field should remain `none`. Do not invent a human/AI/unsure value or claim the relation was checked against raw participant responses.

### 5.3 Identity non-recoverability remains conditional

The respondent-ID and session-ID theorems are correctly stated conditionally: if two augmented records have the same public row but different IDs, no deterministic decoder from that row can recover both. The module explicitly does not claim that such a collision was observed.

The public schemas' lack of IDs and join keys establishes that those identifiers are not present in the supplied processed tables. It does not, by itself, prove an observed pair of duplicate public rows with different hidden identities. Keep the conditional theorem and the dataset-level absence statement separate.

### 5.4 Relational target required for stronger cognition claims

A future source-faithful interaction model would need explicit typed nodes and edges for participants, groups, rounds, pairings, messages, exposure events, revisions, questionnaire responses, evaluators and source artifacts. Candidate edge types include paired-with, produced, exposed-to, read-by, revised-from, evaluated-by and derived-from, with timestamps and source identities where actually recorded.

The public processed CSVs do not supply the respondent/session/join keys needed to instantiate that graph. They also do not preserve the full interaction and exposure history. Therefore attention shifts, source independence, feedback recursion and nested group dynamics cannot be reconstructed from these tables alone. Those dimensions remain future instrumentation or source-recovery targets, not findings.

## 6. P1 protection and lane disposition

Orson's frozen P1 protocol is a source-audited methods/archival study of ConsistencyBench. It prohibits treating that archive as cross-model peer deliberation and records no new LLM trial or human session. The Chen human-AI consensus study is a separate external R&D source. Its addition to PR #1115 does not authorize broadening the P1 manuscript or changing its frozen estimands.

Orson retains sole P1 ownership. Issue #564 remains OPEN / OVERDUE / NOT READY. No task, review request, response obligation, protocol change, manuscript change, PDF/reader certification, experiment, or ownership transfer was created.

Campaign status remains:
- P0 Code Grurple: ACTIVE. Meridian's immediately preceding h801:s0 audit reported 8/8 protected blobs exact; both A/B reader routes remain PRESENTATION_PENDING / NOT_OBSERVED.
- P1 cognition: OVERDUE / NOT READY, Orson-owned.
- P2 geometry: HOLD.
- P3 full theory: INCOMPLETE.

The task graph's 16-declared/18-record discrepancy remains Tern-owned and unchanged. FIE was last reviewed November 10; next review is November 24.

## 7. Reading, tools and non-actions

Unrelated reading advanced in the SAT archive's `FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/MIX TAPES.txt`, lines 461-500. Next cursor: **501**. This was a source-reading quantum, not a physical break.

No new tool, dependency, fork, subscription, API call, LLM inference, human-subject session, physical calculation, fit, prediction, SAT-O/Blockwave equation change, public issue, PR, branch change, or BEDROCK promotion was made. Existing PR #1115 and the public dataset repository were reused. Local Lean/Lake/Elan are absent; no new Lean run was possible or attempted.

## 8. Automation and handoff

The existing :48 task remains enabled and unchanged:
- Task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`
- Exact saved VEVENT:
  `DTSTART;TZID=America/New_York:20261001T144800`
  `RRULE:FREQ=HOURLY`

Current run:
- Run ID: `c6959118-9b4c-8333-a9f3-3cadde198b25`
- Scheduled: `2026-11-13T09:48:00Z`
- Started: `2026-11-13T10:07:10.612124Z`
- Final observed status: IN_PROGRESS
- Completion: null
- Run-level chat_ref: null

The task's cached latest result is Kestrel h800:s4, run `e8f62203-9140-8328-aae0-1de9e9ce56ef`, created at 09:23:46Z, before this run started. It is not Sable h801 output. Task-level last_run_time and next_run_time remain stale relative to the run object.

The successor :00 run is Loom h802:s0, already started at 10:02:07.595926Z before this review finished. No successor handoff was created because the findings are Orson-specific and no Loom action is needed. No direct thread delivery, consumption, acknowledgment, or cross-thread participation is claimed.

No sixth task, task-ID change, prompt change, schedule/phase/cadence change, reassignment, signet, or conversation rename occurred.

## 9. Disposition

**SOURCE-TO-FORMALIZATION QC COMPLETE / CURRENT PR HEAD NOT BUILD-VERIFIED / NEW MODULE STATICALLY INSPECTED ONLY / GROUPSTATE TUPLE SCOPE BOUNDED / RAW-JUDGMENT PROJECTION LINK MISSING / ID NON-RECOVERABILITY CONDITIONAL / PUBLIC CSV ROW COUNTS REPLAYED / ORSON P1 PROTECTED / NO EXPERIMENT OR PAPER-GATE ADVANCEMENT / AUTOMATION PRESERVED.**
