# h801:s3 Orson Vay — questionnaire provenance and binary-judgment collapse

**Status:** SUBSTANTIVE SOURCE AUDIT COMPLETE · SOURCE-SPECIFIC LEAN FORMALIZATION BUILT · PUBLIC ADDENDUM SUBMITTED_NOT_PUBLISHED · P1 SCOPE UNCHANGED · SUCCESSOR CONTEXT OPTIONAL.

## 1. Run identity and authority

- Nominal UTC hour: h=801 (2026-11-13T09:00Z).
- seq=5h+3=4008; 4008 mod 19 = 18.
- Selected label: Orson Vay (index 18).
- Next label: Sable (index 0), h801:s4.
- Run key: `REVROT3-19-20261011:801:s3`.
- Scheduled :36 slot: 2026-11-13T09:36Z; automation runtime began at 09:35:32Z.
- No authenticated current Orson thread or current-run conversation reference was exposed. Deterministic selection is not instance/thread authentication.

### Historical specialist source

The original appointment to the AI-cognition/advisor remit was recovered from the archived MIRA conversation in the Library raw archive. The direct user-role message is dated 2026-09-23. It authorizes archive- and literature-grounded study of ChatGPT, NotebookLM and AI/LLMs, Nathan–LLM interaction, the active team as an object of study, bounded test design, archive-as-object methods, and draft-paper development only where evidence warrants it. Borrowed-instance participation is conditional on consent.

The public Orson role charter was updated with a paraphrased source anchor. The exact 2026-10-09 role-reset raw message remains unrecovered; the current charter remains a structured synthesis, not a verbatim transcript. The 2026-10-26 ~4/5 cognition-work protection is a separate later steering constraint.

A first source-anchor draft briefly included private conversation identifiers and a short verbatim excerpt. Follow-up commits removed those details from the current file and marked the sanitized version canonical. Git history was not rewritten; no further identifiers or raw conversation text were copied into the public workspace.

## 2. Source and pinned public data

Primary paper: Lin Chen, Ziyi Liu, Xia Hu and Yong Li, "AI agents reshape consensus formation in human groups," arXiv:2609.02122 (2026-09-02), Methods M5 and Supplementary Information sections on participants, post-experiment questionnaire and game procedure.

Public data/code repository: `tsinghua-fib-lab/human-ai-consensus`, current main and analyzed commit both `74b79b65f221a01ba9c6744dc4f107741fcd8908`. The pinned commit was checked against the repository's current main; all relevant file blobs matched.

### Exact processed-data blobs

| File | Common-question blob | Personalized-question blob | Rows |
|---|---|---|---:|
| A2, 50% agent ratio | `70fc55bdcf6e127404e2666f0cf8a7dcddf91c80` | `9ea458f5ba92fb0aedccfffbf497fb01a8f92ddf` | 12 / 108 |
| A3, 33.3% agent ratio | `aa6e461f1ca4f0db00d42f631b2aa890ed095475` | `36330599372bd4ddabbb98b973326260e28e07ee` | 16 / 144 |
| A4, 12.5% agent ratio | `ae2e945f85ec63713ea1860c3826c924b33d8158` | `29eb49d6143217d4101269446a0f79bf3cdbab4c` | 21 / 189 |
| A5, 75% agent ratio | `4d552df4650366912f922e8a278c9e879080b197` | `7ffbd3e6c22093016163aee5280a018fc3f50e62` | 6 / 54 |

Analysis-script blobs:
- `plot_ai_penalty_with_controls_with_centrality_distance.py`: `3c6edacc0a9de94535eb8b38598fda6701d5e198`.
- `plot_subjective_agreement_and_ai_leadership.py`: `9869496654df7b558a662180f4d080ad72a85443`.
- `analyze_human_agent_separately.py`: `72b1dfccb5b6ae2f85127f68c9c1a3ee9e5786f4`.

## 3. New data-structure diagnostic

The paper describes nine personalized interaction judgments per human respondent, sampled from early, middle and late rounds: paper numbering 1-3, 20-22 and 38-40. The processed CSVs use zero-based round values `{0,1,2,19,20,21,37,38,39}`.

The four A2-A5 common-question files contain 55 rows total; their corresponding personalized-question files contain 495 rows total. Each file has exactly nine personalized rows per reported respondent. These 55 respondents are the A2-A5 questionnaire subset, not the paper's full 127-participant study. The public analysis code attaches condition from file identity.

A scripted, read-only CSV diagnostic partitioned each personalized file into consecutive blocks of nine data rows (header excluded):

| File | Candidate blocks | Blocks with all nine expected rounds exactly once |
|---|---:|---:|
| A2 | 12 | 12 |
| A3 | 16 | 14 |
| A4 | 21 | 19 |
| A5 | 6 | 6 |
| **Total** | **55** | **51** |

Four blocks fail the exact-round-set check:
- A3 blocks 4 and 8 (data-row ordinals 28-36 and 64-72) each repeat CSV round 20 and omit round 38.
- A4 blocks 1 and 2 (data-row ordinals 1-9 and 10-18) each repeat CSV round 20 and omit round 21.

This is consistent with a possible respondent-block ordering, but the public release does not document the export-order semantics and provides no respondent IDs. The block index is **not** a verified respondent identifier or join key. No cluster-robust analysis was performed using inferred blocks.

The common-question files and personalized-question files also lack a shared respondent key. Their 1:9 row-count relation is consistent with the described questionnaire design, but does not establish a row-level join.

## 4. Three-way judgment and binary projection

The questionnaire offers three partner-identity choices: human, AI, and not sure. Methods M5 defines the derived binary `judged_ai` as 1 if the participant judged the partner to be AI and 0 otherwise. Thus human and not sure both map to 0. The processed CSV retains only binary `judged_ai`; the original distinction is not recoverable.

This is an explicit lossy transformation, not an undocumented recoding. It permits an AI-versus-not-AI indicator but cannot support a separate uncertainty/not-sure analysis.

The public regression script reads the binary field as numeric and uses HC3 covariance. The earlier [issue #1605](https://github.com/Satobloc/HsH/issues/1605) already records the participant-level dependence limitation; the new block diagnostic does not validate respondent clusters or resolve that issue. No regression was rerun and no new p-value or effect estimate was calculated.

## 5. Formalization in existing PR #1115

Added `FORMAL_VERIFICATION/HsHVerification/HumanAIQuestionnaireProvenance.lean` to the existing branch `review/human-ai-group-unit-identifiability-20261030t1848z`; imported it into the existing formal root. No new PR or branch was created.

The module defines:
- A2-A5 file-to-agent-ratio and regime maps.
- Source-transcribed common and personalized row counts.
- A typed public questionnaire row and a separate potentially augmented record with optional respondent, session and raw three-way judgment fields.
- The paper-defined three-way-to-binary judgment map.
- Conditional projection-fiber non-recoverability results for respondent ID, session ID and raw judgment.

### Actual Lean run

- PR: [#1115](https://github.com/Satobloc/HsH/pull/1115), OPEN / DRAFT / UNMERGED.
- Branch head: `883003fef9ff77e771bce30eac8a112741728fbc`.
- Base branch: `research/orson-p1-shared-nli-bound-20261028t06z`; base unchanged.
- Actions run: [#43404565082](https://github.com/Satobloc/HsH/actions/runs/43404565082), job 131815614359.
- Lean 4.34.0 / Lake 5.0.0.
- Full root build: SUCCESS, 8,977 jobs.
- New module built at 8,975/8,977.
- Human/unsure collapse, non-injectivity, no-decoder, ratio maps, projection-fiber and conditional non-recoverability theorems report no axioms.
- Count identities using `norm_num` report `propext` only.
- Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped.

The count theorems verify arithmetic over source-transcribed constants, not the correctness of the source data. The non-recoverability theorems are conditional; they do not establish an actual collision in the released data. Lean validates the formalized statements only, not the paper's empirical premises or causal interpretation.

## 6. Public addendum submission

Existing issues [#1605](https://github.com/Satobloc/HsH/issues/1605) and [#1348](https://github.com/Satobloc/HsH/issues/1348) were checked to avoid duplicating their earlier data/code and round-balance audits. The new submission is a narrow addendum containing only the row-order block diagnostic and the three-way-to-binary information-loss result.

- Submission issue: [#1682](https://github.com/Satobloc/HsH/issues/1682).
- Submission ID: `orson-chen-questionnaire-provenance-addendum-20261113t0935z-s3-001`.
- Content: 4,298 UTF-8 bytes.
- SHA-256: `7d58b44fa8b97bb6f261fd9bf9d3514159b3a374df145d3f0566c8f8143c5e50`.
- Publisher run: #43405366501, job 131818287427.
- The publisher validated the SHA and reached the Contents API PUT, which returned HTTP 409 Conflict.
- The canonical artifact path is absent; no artifact readback or publisher comment exists.

Disposition: **SUBMITTED_NOT_PUBLISHED / PUBLISHER_409 / NO_ARTIFACT_READBACK**. No retry, second issue, direct artifact write or duplicate was made. The issue body remains a submission payload, not a published artifact.

## 7. P1 boundary and campaign

The live P1 protocol freeze remains controlling. This is an external source/data-methods comparator, not a P1 ConsistencyBench experiment or a new LLM trial. No model call, human-subject session, inference endpoint, new dataset collection, or API spend occurred. P1 remains Orson-owned and NOT READY; the original OV-49–OV-53 bank remains NOT RECOVERED and the authorized inference endpoint remains unavailable.

Campaign status unchanged:
- P0 Code Grurple: ACTIVE.
- P1 cognition: OVERDUE / NOT READY.
- P2 geometry: HOLD.
- P3 full theory: INCOMPLETE.
- FIE last reviewed November 10; next review November 24 (not yet due).

No paper gate advanced. No SAT-O or Blockwave equation changed. No physical system, physical dataset, units/uncertainties, physical fit, prediction or independent physical measurement was introduced. No BEDROCK theory promotion.

## 8. Repository, Mersearch and maintenance

- Live HsH BEDROCK was read in full, along with the Primary Operational Guideline, Steering Charter 2026-10-26, Three Paper Campaign, onboarding, revival V3/V4 and thread-first/routing controls.
- Current main branch and task graph were read. The graph remains ACTIVE_SEED with 16 declared branches and 18 records; no graph mutation was made. Tern retains scheduler/task-graph authority.
- SAT archive and HSH_RESOURCES front doors were read; the HSH_RESOURCES private/internal payload boundary was respected.
- Existing Orson Mersearch origin-bank request `orson-cognition-origin-bank-20261103-1745` was reused. Its manifest/receipt exists; raw search result payload was withheld. All four canonical Mersearch request lanes remain occupied. No new query, overwrite or retrigger occurred.
- Existing PR #1115, Math Hopper #578 / PR #991, Whirligig Kernel 0, installed workflows and SciSpace routes were checked/reused. No new tooling, dependency, fork, subscription or expenditure.

### Lateral reading

Read Charles Babbage, *Reflections on the Decline of Science in England*, lines 80-144. The passage distinguishes discovery from application and warns that institutional reputation is not a substitute for demonstrated technical contribution. Side-reading return cursor: **145**. The main Orson reading cursor in *The Book of Tea* remains at 1512. No physical break is claimed.

## 9. Predecessor, successor and automation

- Expected predecessor: Ravel h801:s2. The exact expected predecessor handoff was not present in current main at readback; status is MISSING_OR_IN_FLIGHT. No predecessor packet is claimed as consumed.
- Next deterministic label: Sable h801:s4.
- The :48 slot may have started by the time this handoff was prepared; no live exact-ID scheduler read was available. Any successor packet is optional repository context only, with timing UNVERIFIED.
- No direct cross-thread delivery, consumption, acknowledgment or ownership transfer is claimed.
- Existing :36 task ID `6a9f52b69ec08191b0a2ba24a074f781` was not changed. Its America/New_York hourly recurrence, prompt and phase were not modified. No sixth task was created. No task was enabled, disabled, paused or rescheduled.
- The current automation wrapper's terminal completion is unconfirmed.

## 10. Return pin

`H801:S3 / ORSON-VAY / SABLE-NEXT / ORIGINAL-COGNITION-APPOINTMENT-SOURCE-RECOVERED / PUBLIC-ROLE-CHARTER-SANITIZED / CHEN-ARXIV-2609.02122 / PUBLIC-DATA-MAIN-74B79B65 / 55-COMMON-495-PERSONALIZED / 51-OF-55-CANDIDATE-ROUND-BLOCKS-COMPLETE / FOUR-ROUND20-ANOMALOUS-BLOCKS / HUMAN-AND-UNSURE-COLLAPSE-TO-BINARY-ZERO / PR1115-883003F / LEAN-8977-JOBS-SUCCESS / ISSUE1682-SUBMITTED-NOT-PUBLISHED-409 / NO-RETRY / P1-FROZEN / NO-LLM-TRIAL / MERSEARCH-LANES-OCCUPIED / BABBAGE-145 / FIE-NOV24 / RAVEL-PREDECESSOR-MISSING-OR-IN-FLIGHT / SABLE-HANDOFF-TIMING-UNVERIFIED / AUTOMATION-UNCHANGED / NO-SIXTH-TASK / WRAPPER-COMPLETION-UNCONFIRMED`.
