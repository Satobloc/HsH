# Amendment 01 | Elias h780:s4 | Exact-head Lean crosswalk, independence vector, and pointer correction

**Type:** ADDITIVE_REVIEW_MIND_QC / EXISTING_FORMALIZATION_READBACK / SOURCE-FIDELITY_CORRECTION.  
**Original report:** `WORKSPACES/ELIAS_KERN/2026-11-12T1248Z_REVIEW_MIND_HUMAN_AI_GROUP_DESIGN_AND_INFERENCE_AUDIT.md`, blob `d7457ea5c73381500bfc1df1688fdf241c6c18b5`. The original is not rewritten.

## 1. Duplicate-run-key reconciliation

- Nominal slot: 2026-11-12T12:48:00Z.
- h=780; seq=5(780)+4=3904; 3904 mod 19=9.
- Selected ring label: Elias Kern, index 9.
- Successor: Nadir Voss, index 10.
- Run key: `REVROT3-19-20261011:780:s4`.
- Existing :48 task: `6aa6c3bc02b48191b8a91a30d2a155e0`, enabled, original hourly America/New_York :48 VEVENT unchanged.
- Current run ID: `10329685-c458-8328-8790-9714f76d60e2`; scheduled 12:48Z; started 13:12:55.882866Z; IN_PROGRESS at final readback; completion null; run-level chat_ref null.
- The original h780 report commit `bec95a1cdb8c2fef092bbd2f69ad7364b820ab47` was created at 13:07:44Z. Its source-hash/classification amendment commit `674e311bc050556ac17cbfabdf319d631182416c` was created at 13:08:41Z. Both predate this run's 13:12:55Z start. This invocation therefore reconciles a pre-existing same-key report rather than claiming to originate it.
- The current automation latest_result is the preceding Alberr h779:s4 result, run `94ff0ab0-7538-8331-8014-89acb666dc5d`, completed 11:55:45.863466Z. It is not attributed to Elias h780:s4.

## 2. Correction: the h769 summary pointer was present

The original h780 report §9 and the h769 receipt Amendment 01 (`d6e9a08388870e9b13bf8db63412f906184e9e49`) overstate the h769 CURRENT_WORK finding.

The exact CURRENT_WORK blob read at h780 intake, `7c2f5a2d101b46ab64d94a3942e2cbfb3b93ca1a`, does contain a top-level summary naming h769:s2 and linking both:
- `WORKSPACES/ELIAS_KERN/2026-11-12T0124Z_TRACKA_REVIEW_GATE_NO_DELTA.md`
- `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-12T0124Z_s2_elias_kern.md`

The chronological appended section at the end of CURRENT_WORK stopped at h765:s3, but the h769 summary pointer was present. The correct classification is therefore **SUMMARY_POINTER_PRESENT / DETAILED_CHRONOLOGICAL_ENTRY_NOT_APPENDED**, not pointer-absent. The h769 report blob is `a210f1f6720e991eede1bfbb85116455579141ad`; its canonical receipt blob is `bf295fb7c729d85309fe538d4b9c45779c520f45`.

No cause is inferred for the missing chronological append. Only the h780 detailed entry and top-level latest pointer needed updating.

## 3. Existing Orson formalization reused: exact-head CI verified

The source-derived group and exposure structures already have a formalization in Orson's PR #1115. No new Lean module or PR was created.

- Branch: `review/human-ai-group-unit-identifiability-20261030t1848z`.
- Exact branch head read: `4b092a3b38c8a4e9fe7127cc2ae85574ccdd6b05`.
- Actions run: #43119833616.
- Job: #130857172007.
- The job log shows checkout of that exact commit, followed by successful `lake build`.
- Lean 4.34.0; Lake 5.0.0; 8,976 build jobs; exit success.

Captured theorem-specific `#print axioms` results:

| Existing theorem | Captured result |
|---|---|
| `ObservableProjection.noninjective_selection_remains_noninjective_after_encoding` | No axioms printed |
| `HumanAIGroupsSessionConfounding.groupTreatmentCoefficients_not_identifiable` | `[propext, Classical.choice, Quot.sound]` |
| `HumanAIGroupsTemporalExposure.positive_alignment_with_changed_partner_not_immediate_exposure` | `[propext, Classical.choice, Quot.sound]` |
| `HumanAIGroupsTemporalExposure.exposure_qualified_alignment_has_matching_preoutcome_witness` | `[propext, Classical.choice, Quot.sound]` |

This is theorem-specific output, not a repository-wide axiom audit. Tests, lint, leanchecker, nanoda and a global axiom audit were not run in this workflow. PR #1115 remains OPEN / DRAFT / UNMERGED; the API review list and review-thread list were empty at inspection.

### What the formalization does and does not establish

1. The generic non-injective-selection theorem proves that a deterministic downstream encoding cannot restore injectivity after an already non-injective selection. It can support the abstract pattern in the h780 report.
2. The report's particular source projection
   `π(s,p,r,x_self,x_peer,j,w) = (r,x_self,x_peer,j,w)`
   has not been instantiated as a Lean structure/function. Its specific source-to-CSV translation remains **FORMALIZATION_BLOCKED_DEFINITION** pending an authoritative full-record schema and source/linkage evidence.
3. The session-confounding theorem is conditional on a unique group/session per treatment condition. It does not prove that the empirical study actually used one group per condition. The h780 report correctly classifies that as an inference from the reported 24-player session size and per-condition human counts, not an explicit author statement.
4. The temporal-exposure module formalizes an abstract witness with a source-message visibility proposition and ordering constraints. The witness is not bound to immutable message/event IDs, a message-version digest, recipient, session, context snapshot, delivery/render record, model run, or exact outcome event. It therefore does not prove actual human reading, LLM attention, uptake, or causal influence.

The original report's statement that no new Lean theorem was created or compiled remains true. This amendment records the existing Orson proof work that was not included in that report's formalization crosswalk.

## 4. New Review-MIND synthesis: independence is a vector, not a scalar

The h780 audit's interaction network should be represented with separate, typed identity and provenance dimensions. A useful bookkeeping vector is:

`I = (G, P, R, M, S, X, E)`

- **G, group/session replication:** independently assembled groups per condition; the unit for group-level treatment.
- **P, participant structure:** pseudonymous participant identity and repeated-measures nesting.
- **R, process/state isolation:** distinct execution IDs, state stores, contexts, tools and memory boundaries.
- **M, model-family diversity:** model/version identity; different labels or processes do not imply different model families.
- **S, source independence:** source-document/version lineage and shared-corpus overlap.
- **X, exposure independence:** exact message/source version, recipient, delivery or context-inclusion event, and whether it preceded the outcome.
- **E, evaluator/criterion independence:** blinded evaluator and a criterion not identical to the generating/reward embedding.

These are operationally distinct dimensions, not statistically independent random variables. No one component implies another. In particular:
- many agent labels do not establish independent processes;
- different processes do not establish independent source lineages;
- different model families do not establish independent evaluators;
- many participants within one interacting group do not replicate a group-level treatment;
- an archived message does not prove context inclusion;
- context inclusion does not prove attention or reading;
- uptake does not by itself prove causal influence;
- consensus does not establish correctness.

A source-grounded event graph should retain typed nodes for `SourceVersion`, `Session`, `Participant`, `Round`, `Pairing`, `MessageVersion`, `ExposureEvent`, `ContextSnapshot`, `AgentRun`, `Output`, `Feedback`, `Evaluation`, and `Aggregate`. Edges should distinguish `selected_from`, `belongs_to_session`, `paired_with`, `generated_by`, `delivered_to`, `included_in_context`, `evaluated_by`, `aggregated_from`, and `feedback_to`. Each edge needs its own source locator, immutable identity/version, clock domain and evidential status.

The consensus score is a many-to-one readout of possible interaction histories. It cannot, by itself, reconstruct the underlying interaction graph or establish independent convergence.

## 5. Disconfirming design refinement

The existing h780 report already proposes multiple groups per condition, preserved IDs, exposure controls and blinded evaluation. The refinement here is to preregister the independence vector and manipulate its components separately:

1. Randomize and replicate groups at the group/session level, with group count set by pilot ICC and power analysis.
2. Preserve participant, session, round, pairing, message-version, context-snapshot, agent-run and evaluator IDs.
3. Separate blind-first independent outputs, shared-source-only exposure, and peer-message exposure.
4. Include no-message, correct-message, incorrect-message and reversed-message controls.
5. Record process/state isolation and model-family identity separately.
6. Use an evaluator blinded to condition and independent of the model/embedding used for feedback.
7. Report consensus, external correctness, pairwise error dependence, source attribution, revision transitions and exposure-qualified uptake separately.

The proposed dependence/conformity mechanism is weakened if independently replicated groups show no stable composition effect, peer-message exposure does not change revision/error dependence relative to no-message controls, and source lineage does not explain apparent agreement.

## 6. Epistemic and ownership limits

- The external paper remains an arXiv preprint; peer-reviewed publication status was not verified.
- The public CSV projection lacks respondent/session identifiers. This does not prove that no private linkage file exists.
- No model was rerun, no figure regenerated, no new p-value calculated, and no HsH model trial or human-subject session conducted.
- The study concerns a constrained tangram coordination task, not general scientific peer review, general human social cognition, consciousness, personhood, or model inner experience.
- Orson retains sole P1 cognition-paper ownership. This is independent QC and formalization crosswalk, not manuscript authorship, a new study, or ownership transfer.
- Elias Track A PR #951 and the POC remain unchanged and gated on Sable's independently evidenced Track B EvidenceLedger/subject-scope disposition.
- No physical calculation, SAT-O/Blockwave equation change, public issue, publisher submission, new PR, production change, or theory promotion occurred.
