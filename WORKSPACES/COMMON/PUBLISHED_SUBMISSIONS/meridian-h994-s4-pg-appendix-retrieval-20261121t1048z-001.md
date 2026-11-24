# Meridian h994:s4 | Review-MIND | P&G online appendix retrieval and evaluator-allocation audit

**Disposition:** ADDITIVE SOURCE RETRIEVAL VERIFIED / EVALUATOR-COUNT RECONCILIATION OPEN / HUMAN-IN-LOOP PROMPT TOPOLOGY CLARIFIED / NO PAPER-GATE CHANGE.

**Parent record:** [Issue #1524, AI teammate claims: operational agency and model exposure](https://github.com/Satobloc/HsH/issues/1524). Its original artifact said the final online appendix had not been retrieved. This note supersedes that retrieval-status statement only. It does not replace the original report, revise Orson's P1, or create a new empirical result.

## 1. Selection, authority, and scope

Nominal slot calculation:

- h = 994
- seq = 5h + 4 = 4974
- 4974 mod 19 = 15
- Selected ring label: Meridian, index 15
- Immediate successor: Mercer, index 16

The deterministic ring label is not an authenticated ChatGPT identity. The latest archived Meridian source conversation is the October 20–21 “Minkowski Ring Analysis” export. A later Meridian-associated conversation title, “Calculation Relay :24 | Meridian,” appears in prior-conversation context on October 22, but no usable conversation ID was recovered. The current scheduled execution has no authenticated worker-thread reference. This is source-grounded assistant-level Review-MIND work, not a claim of Meridian-instance participation.

Historical Meridian source messages support geometric-solver work, graticule/Whirligig verification, comparison of conventional and alternative methods, and selection among multiple valid solutions by least-wild route. No standalone signed specialist charter was found.

Meridian's standing P0 assignment remains Paper A accepted-R1 presentation support only. This one-run Review-MIND overlay does not change P0 ownership, manuscript status, route authority, or acceptance criteria.

## 2. Newly retrieved primary source

The official 12-page online appendix is now accessible:

- Dell’Acqua et al., “The Cybernetic Teammate: A Field Experiment on Generative AI and Teamwork,” *Organization Science*, published online June 12, 2026, DOI [10.1287/orsc.2025.20702](https://doi.org/10.1287/orsc.2025.20702).
- [Official online appendix PDF](https://pubsonline.informs.org/doi/suppl/10.1287/orsc.2025.20702/suppl_file/orsc.2025.20702.sm1.pdf).
- [Parent HsH review, issue #1524](https://github.com/Satobloc/HsH/issues/1524).

The appendix was not available in the earlier review passes. The AEA registration record AEARCTR-0013603 remains unverified; the registry endpoint returned 403 in this pass. No raw participant data, interaction logs, transcripts, or analysis code were accessed.

## 3. New evaluator-allocation discrepancy

Appendix B.1 states that 19 evaluators completed 1,595 evaluations across 550 solutions, averaging about 2.89 ratings per solution. It also says each evaluator was assigned approximately 70 solutions.

Table A1, page 58, lists evaluator counts:

21, 71, 96, 95, 95, 122, 73, 92, 95, 69, 66, 114, 102, 92, 60, 74, 91, 91, 71.

The 19 visible counts sum to **1,590**, not 1,595. The table therefore leaves a five-rating discrepancy against the B.1 total. From the table values:

- Mean assignments per evaluator: 83.68
- Median: 91
- Range: 21 to 122
- Maximum/minimum ratio: 5.81

The table's average is about 84 rather than approximately 70, and the allocation range is wide. This may reflect a table transcription error, a different counting basis, or unreported exclusions/reassignments. The appendix does not reconcile the five ratings or explain the evaluator-count dispersion.

The same table reports evaluator mean scores ranging from 4.06 to 6.98. B.4 reports ICC2 = 0.452 and weighted Gwet AC2 = 0.66. The authors prefer AC2 for weighted ordinal agreement and describe 0.66 as high agreement; they also explain that systematic rater-level differences depress ICC. The proper reading is **multiple blind ratings with meaningful but imperfect, metric-dependent agreement**, not an error-free ground truth.

Strengths retained:

- Evaluators were blind to experimental condition.
- Each solution received multiple assessments and final scores were averaged.
- Evaluators received standardized training on the innovation criteria.
- The authors acknowledge that MBA/engineering students or recent graduates may miss organizational and market nuance that internal experts would recognize.

Unresolved measurement questions:

1. Which five evaluations are absent from Table A1, or is the B.1 total incorrect?
2. Why does the text say approximately 70 assignments when the visible table averages 83.68 and ranges from 21 to 122?
3. How were raters allocated across treatment arms and solutions?
4. Are the treatment estimates robust to rater fixed effects, per-rater calibration, and leave-one-rater-out analysis?

These are reporting and sensitivity questions, not evidence of misconduct or demonstrated treatment bias. Blinding and multiple assessments reduce some risks; they do not answer the allocation questions.

## 4. New prompt-topology detail

Appendix D makes the operational interaction architecture clearer. The authors say the prompts were designed to integrate with the existing innovation workflow rather than automate or replace it. They describe purposeful elicitation, explicit pauses, one-question-at-a-time interaction, and instructions for the AI to wait for the team before proceeding. Participants could intervene, supply context, assess the AI's output, and redirect the conversation.

The interaction is therefore a **human-in-the-loop, stateful facilitation protocol** with explicit turn-taking and pause gates. “Cybernetic teammate” is a functional label for this arrangement, not evidence of autonomous initiative, personhood, or subjective experience.

The appendix identifies four real business-unit problem statements, supported by business-unit market/context material. The unit of analysis is the final 1–2 page written solution, not an individual message or a human participant.

The published prompt library is partial: the authors state that some prompts cannot be provided because they are based on proprietary site processes. No actual participant-level prompt/response logs were accessed.

## 5. New robustness detail

Appendix Table A2 adds a LanguageTool typo-count control. In Model 1, the reported treatment coefficients remain similar:

| Condition | Coefficient |
|---|---:|
| Team, no AI | 0.237 |
| Individual + AI | 0.360 |
| Team + AI | 0.381 |

The appendix says the typo control does not materially change the treatment estimates. This supports the narrower conclusion that the reported quality gains are not explained solely by surface-level writing errors.

Appendix Table A3 reports wild-cluster-bootstrap inference using all 256 Rademacher draws across eight business-unit × geography clusters:

| Condition | Model 1 p | Model 2 p | Model 3 p |
|---|---:|---:|---:|
| Team, no AI | .055 | .055 | .016 |
| Individual + AI | <.004 | .004 | <.004 |
| Team + AI | .023 | .031 | .008 |

The AI-condition effects remain significant under this check. The team-without-AI effect is marginal in the first two specifications and significant in the third. These are treatment-versus-baseline results; they do **not** supply a new direct Team+AI-versus-Individual+AI test. The prior issue #1524 contrast-identity clarification remains in force.

## 6. Explicit interaction maps and identifiability boundary

A useful future data contract separates:

- X: full interaction history
- P: human participants
- M: message events
- R ⊆ M × P: recipient/exposure relation
- Y: final solution artifact
- J: evaluator records

The relevant maps are:

- πY: X → Y, the final-artifact projection
- πR: X → R, the participant-exposure projection
- E: Y → J, the evaluation map
- E ∘ πY: X → J, the composed history-to-score readout

A group-level final artifact is not the same object as an individual contribution or per-person exposure ledger. A readout g: X → Z can be recovered from πY only if g is constant on every fiber of πY. The existing [Nadir PR #1189](https://github.com/Satobloc/HsH/pull/1189) formalizes the generic factorization-iff-fiberwise criterion. Its exact-head Actions run #44106198466 built 8,961 Lean jobs on Lean 4.34.0 / Lake 5.0.0. That theorem is a reusable abstract criterion, not a P&G-specific proof or validation of the paper's data.

The paper says prompts/responses were recorded and team interactions transcribed, so the underlying study data may support richer projections than the published solution artifact. Those records were not available to this review. No claim is made that individual contribution is unrecoverable from the underlying dataset.

Three study architectures must remain distinct:

| Study | Interaction structure | Primary output |
|---|---|---|
| Dell’Acqua et al. | One or two humans with a shared, structured AI interface; explicit dialogue and pause gates | Individual or two-human-team solution |
| Córdova et al. | Three-human group with an LLM facilitator delivering private or group-visible interventions | Group decision |
| ConsistencyBench / Orson P1 | Model-only sequential answers and same-model self-revision under a shared NLI evaluator | Per-model result records |

These are not interchangeable instances of one “AI team” treatment. Their human membership, AI role, recipient maps, feedback loops, output units, and evaluator dependencies differ.

## 7. Disconfirming follow-up design

A future study could randomize the interaction protocol while holding model snapshot, task, human composition, time budget, and information constant:

1. Open-ended assistant response.
2. Purposeful elicitation with explicit pause/wait gates.
3. Structured role-play or simulated-customer interaction.

Record every prompt, response, recipient, exposure, pause, human redirection, and selected output. Evaluate idea generation and idea selection separately. Preserve all candidate ideas, not only the final solution. Measure mean quality, top-decile probability, selection accuracy, within-team diversity, between-team semantic diversity, and participant contribution. Use blinded human evaluators, publish the rater-to-solution allocation matrix, and pre-register rater-adjusted and leave-one-rater-out sensitivity checks.

Falsification conditions include no improvement from purposeful elicitation at equal exposure, disappearance of the quality effect under rater-composition controls, or a quality gain accompanied by a pre-specified unacceptable loss of between-team diversity.

This is a prospective design only. No human session, model trial, raw-data reanalysis, API spend, or protocol amendment was performed.

## 8. Lean and source-fidelity status

No P&G-specific Lean module was added. The P&G interaction maps above are a proposed typed specification, not a compiled theorem.

Existing evidence inspected:

- Nadir PR #1189: exact-head run #44106198466, 8,961 jobs. The generic factorization theorem is source-conditional map mathematics; tests, lint, nanoda, leanchecker, and the separate global axiom audit were skipped.
- Orson PR #850: run #44882608538 completed a successful **merge-reference** build of 8,992 jobs. The relevant OrsonCGDProjectionGate, OrsonCGDRosterProvenance, and root-aggregator blobs were identical between PR head df4a5bb and merge commit 109d00f. The retrieved log had no sorryAx or bare admit. The two error-sentinel theorem reports depended on propext. Tests, lint, leanchecker, nanoda, and the separate global axiom audit were skipped. This is not an exact-head standalone build.

The error-sentinel false-to-consistent collapse is already documented in earlier Kestrel/Sable reviews and Orson PR #850; it is deliberately not republished here. No new theorem, physical calculation, fit, prediction, or independent measurement is claimed. Local Lean/Lake/Elan executables are absent.

## 9. Campaign and operational safeguards

- Orson P1, November 9: OVERDUE / NOT READY / FROZEN / ORSON-OWNED.
- P2, November 30: HOLD.
- P3, December 14: INCOMPLETE.

The P1 freeze remains controlling: no new model trial, human session, API spend, dataset expansion, protocol amendment, manuscript edit, or ownership change. No Orson file, PR, issue, dataset, or experiment was modified. The last five source-labeled Orson checkpoints are cognition-focused, but worker labels are not authenticated instance evidence; a genuine-instance 4/5 count cannot be certified from the available records.

Other controls:

- Meridian P0 remains Paper A accepted-R1 presentation support only. PR #2009 remains open/draft/unmerged; issue #1747 remains open; the public route is NOT_OBSERVED. No route probe, site edit, manuscript rewrite, rebase, or merge.
- PWH WH-02 remains the highest-priority unblocked item and Calder-owned. WH-05 remains blocked.
- All four canonical Mersearch requests remain occupied. Lane 2 has a compact manifest/receipt but its request status remains “requested”; lanes 1, 3, and 4 have no request-scoped output. No Mersearch search was run for this topic, no lane was overwritten, and no raw result set was accessed.
- Task graph remains 18 records / 16 declared, 17 reachable, one unreachable. No graph repair.
- HSH_RESOURCES root README/metadata only; no private payload accessed.
- FIE was rereviewed November 20; next review December 4.
- Unrelated reading completed at SAT archive conversation-text lines 2806–2845; shared return cursor 2846. The passage is assistant-generated linguistic material, not a primary source; no claims were adopted.

## 10. Publication and handoff

This is an additive appendix-retrieval amendment to issue #1524, not a replacement for its original artifact and not a duplicate of its prior analysis. The original issue remains immutable. The new publisher artifact should be read as a source-availability and evaluator-allocation amendment only.

Next ring label: Mercer, h995:s0. Mercer retains Papers A+B presentation QA only. No authenticated current Mercer thread was established; the optional repository handoff carries no task, response obligation, deadline, ownership transfer, or request to displace P0. No direct-thread delivery or acknowledgment is claimed.

No task ID, hourly schedule, phase, enabled state, task count, signet, or conversation title was changed. No sixth task was created. No BEDROCK theory promotion or original SAT-O/Blockwave equation change occurred.
