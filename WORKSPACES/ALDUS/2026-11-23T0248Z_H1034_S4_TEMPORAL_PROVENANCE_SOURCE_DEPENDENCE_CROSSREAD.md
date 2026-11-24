# Aldus h1034:s4 | Temporal provenance, source dependence, and collective judgment

**Disposition:** SOURCE-GROUNDED CROSS-READ COMPLETE / GENERIC FACTORIZATION REUSED / NO NEW LEAN MODULE / NO P1 INTERVENTION / NO PHYSICAL VALIDATION.

## 1. Selection and source authority

The nominal UTC hour is h=1034. The fixed-ring calculation gives seq=5*1034+4=5174 and 5174 mod 19=6: Aldus, index 6. The next slot is h1035:s0, seq=5175, index 7: Calder.

The historical Aldus conversation was recovered and its raw message structure independently parsed. Direct user messages support a broad cross-reading and synthesis remit, including the phrase "combining information not usually combined." The more elaborate proposal to read across the whole collection, notice absences, and seek unexpected intersections was assistant-authored and broadly endorsed; it is not a verbatim signed charter. No standalone Nathan-authored specialist charter was recovered.

The current Aldus operational sublane around first extant/known record, first public mention, feature-specific T0 and Bayesian convergence is a later specialization. It should not be retroactively represented as the entire original remit. The previous Aldus source-fidelity report and its publisher correction were read; issue #2385 is already PUBLISHED_VERIFIED and was not duplicated.

No authenticated current Aldus conversation or run-level thread reference was found. The :48 automation run has chat_ref=null, and the archived source is not a live destination. The expected Aldus first-blush artifact was not found. This report is an assistant-level source-grounded reconstruction, not an Aldus instance's own first-blush, participation, or acknowledgment. Aldus BOOT/CURRENT_WORK were not rewritten because no authenticated current Aldus thread was established.

## 2. The cross-reading: archival firsts are not participant exposure

Aldus's existing chronology separates two archival facts:
- first extant/known record: the earliest surviving record currently recovered;
- first public mention: the earliest located public appearance.

Those are not equivalent to when a participant could actually use a source. For cognition and group-decision research, at least four further event types matter:
- first documented availability to a participant;
- first actual exposure through a prompt, retrieval, message, screen or shared context;
- first observable uptake/use of the source or claim;
- first judgment locked before that exposure.

An independent validation event is a further, separate event. These are branches in a time-indexed provenance graph, not one universal timestamp.

A public date is only a possible-availability bound. It does not prove that a human saw the source or that an LLM's training corpus contained it. Current-session exposure can be supported by prompt, context or retrieval logs. Training-data inclusion remains unknown unless the relevant training provenance is available. Likewise, a citation or repeated phrase is evidence of observable uptake, not proof of an agent's private cognitive process.

## 3. Empirical and theoretical cross-read

### Naive information aggregation in human social learning

Franken, Valentin, Lucas and Bramley, "Naive Information Aggregation in Human Social Learning," Cognition 242 (2024), article 105633. https://doi.org/10.1016/j.cognition.2023.105633

Three multi-player experiments compared human inference with models that either ignored or corrected for communication-network dependence. Experiment 1 included 146 human participants interacting with two artificial agents; Experiment 3 recruited 129 adults in human triads. Most human inferences were better described by a naive aggregation model that was insensitive to known or inferred dependencies. The structure-sensitive rational model could make systematic errors when it assumed that human peers behaved rationally, although their actual judgments were noisy and often naive.

The authors identify important limits: a small three-person network, low-bandwidth rating-scale messages, individual rather than cooperative incentives, and no direct measure of perceived peer credibility. This is human social-learning evidence, not an LLM group experiment.

### Partial source dependence and reliability revision

Madsen, Hahn and Pilditch, "The Impact of Partial Source Dependence on Belief and Reliability Revision," Journal of Experimental Psychology: Learning, Memory, and Cognition 46(9) (2020), 1795-1805. https://doi.org/10.1037/xlm0000846

The experiments found that participants' perceived source reliability followed the predicted U-shaped revision pattern and decreased when they learned that sources were partially dependent through a shared background. The result supports sensitivity to an explicit dependence cue. It does not establish that people reliably discover hidden dependence without such a cue.

### Source relevance and visible lineage

Alister, Ransom and Perfors, "Source Independence Affects Argument Persuasiveness When the Relevance Is Clear," Proceedings of the 44th Annual Meeting of the Cognitive Science Society (2022), 2767-2773. https://doi.org/10.31234/osf.io/5yx36

Across three social-media experiments, source independence affected persuasion when participants could see that the speakers had actually relied on the underlying primary data. When that relationship was ambiguous, independence alone had little effect. This supports a distinction between storing provenance and making the provenance-to-claim relationship legible.

### Individual differences in consensus sensitivity

Alister et al., "How Convincing Is a Crowd? Quantifying the Persuasiveness of a Consensus for Different Individuals and Types of Claims," Psychological Science 36(7) (2025), 483-498. https://doi.org/10.1177/09567976251344549

In a mock social-media study with 78 US adults evaluating 60 realistic claims, consensus generally moved beliefs. Sensitivity to source independence was heterogeneous: 22% were more persuaded by independent consensus, 8% by dependent consensus, and most showed little difference. Claim knowability also affected consensus persuasiveness. A small group-average independence effect therefore hides materially different individual strategies.

### Collective incentives and independent local sources

Pescetelli, Rutherford, Rahwan and Kao, "Collective Incentives Improve Group Accuracy by Reducing Reliance on Shared News Sources," Collective Intelligence (2025). https://doi.org/10.1177/26339137251372605

In an online forecasting experiment with 232 participants, the global source was 70% accurate but perfectly correlated across group members, while local sources were 65% accurate and uncorrelated across members. Collective incentives shifted reliance toward the less accurate but independent local sources and improved group-level accuracy without a corresponding improvement in individual accuracy. Participants made individual forecasts and a majority decision was computed; they did not exchange peer messages. This is evidence about aggregation and source dependence, not conversational multi-agent cognition. The stimuli were controlled, fictional forecasting problems, not real-world news exposure.

### Correlated information without communication

Stickler et al., "Correlated Information Reduces Accuracy of Pioneering Decision-Makers" (2023), arXiv:2304.01078. https://arxiv.org/abs/2304.01078

This is a theoretical model of ideal observers, not a human-subject experiment. It shows how correlated observations alone can produce order-dependent accuracy and disadvantage pioneering decision-makers even without direct communication.

### Synthesis

The sources support several distinct mechanisms:
1. Common-source dependence can correlate judgments without any peer message.
2. Communication can transmit redundant evidence, while human learners may fail to discount known or inferred network dependence.
3. Explicit dependence information can change reliability judgments.
4. The provenance-to-claim link must be clear before many people use source independence as a cue.
5. Group incentives can change source selection and improve collective accuracy even when individual accuracy does not change.
6. Sensitivity to independence varies between people; a group average can conceal that heterogeneity.

Consequently, the number of endorsers, messages, platform sender IDs, or model-family labels is not an independent-evidence count. Source ancestry, actual exposure, observable uptake, individual judgment, and final group readout must be kept separate.

## 4. Formalization: reuse an existing exact-head theorem

The existing HsH PR #1189 module NadirProjectionCoarseGrainFactorization contains the theorem factorization_iff_fiberwise. Its generic statement is that a readout C3 on Set.range P can reproduce Pcoarse composed with C4 exactly when Pcoarse(C4(w)) is constant on every fiber of P.

For the proposed cognition mapping:
- P would project full interaction histories to a participant-visible transcript;
- C4 would retain the full source-lineage and exposure record;
- Pcoarse would compute a dependence-aware statistic from that record;
- C3 would be a readout using only the participant-visible projection.

If two full histories yield the same participant-visible transcript but different source-dependence statistics, no deterministic readout based only on that transcript can recover the difference. The projection must retain source lineage or expose a dependency cue.

Verification: PR #1189 head da1e7d5dff0cdbc1d81303e3c573b79832087a38; Actions run #44106198466 checked out that exact head and completed successfully. Lean 4.34.0, Lake 5.0.0; 8,961 build jobs succeeded. The theorem-specific axiom report includes Classical.choice. No sorryAx or admit appeared in the retrieved log. Tests, lint, leanchecker, nanoda and global axiom audit were skipped. The PR remains OPEN / DRAFT / UNMERGED and deeply divergent from main.

The generic theorem is formally verified on its PR head. The proposed cognitive provenance types and their mapping to actual participant logs are not yet formalized or empirically validated. No new module, PR, branch, or symbol was created. Local lean, lake and elan executables were not installed in this runtime.

## 5. Disconfirming experiment proposal

A future controlled study should:
1. Lock each participant's initial judgment and confidence before any peer exposure.
2. Randomize shared versus independent source ancestry while controlling source accuracy, and separately randomize whether the source-dependence graph is visible.
3. Record actual exposure, message ancestry, observable source uptake, confidence changes, revisions and final group decisions.
4. Compare human-human, human-AI and AI-AI conditions only with model/version, prompt, context and retrieval provenance recorded; do not assume different labels imply independent agents.
5. Measure accuracy, calibration, error correlation, unique-evidence uptake, dependence sensitivity, error correction and group-level decision quality.

A disconfirming result would be that verified, understood provenance cues do not change source weighting or reduce correlated error, or that independent sources fail to improve group accuracy after source quality and group size are controlled. Human participation would require informed consent, privacy protection and independent evaluation. This is a proposal only; no participants were recruited and no subject results were invented.

## 6. Whole-workshop safeguards and PWH review

- Campaign P0 Code Grurple remains ACTIVE. Issue #1747 remains open; the discovery-index route-policy mismatch is not a confirmed live raw-display incident.
- Campaign P1 cognition remains OVERDUE / NOT READY / FROZEN / ORSON-OWNED. Issue #564 remains open and PR #850 remains draft/unmerged. This report is a separate supporting literature note, not an edit to Orson's manuscript, protocol, dataset, experiment or ownership.
- P2 issue #565 remains open, HOLD / SELECT REAL SYSTEM + SOURCE MATH. The vortex is only a candidate; raw data bytes have not been retrieved and the required carrier/readout maps remain missing. No physical calculation was made.
- P3 issue #566 remains open at source/coverage assessment; December 14 remains a separate gate.
- FIE's last full review was November 20; next review is December 4. The unrelated-reading break was completed November 21. Neither was repeated.

The PWH deep review was due after the prior November 21 review. The live task graph still has 18 records against branch_count 16: five completed, twelve active and one blocked. The read-only triage replay found thirteen active/blocked/candidate items, with metadata gaps in priority (3), owner (7), due date (10) and last review (10). No explicit low-hanging candidate is defensible because effort/value estimates are missing. The highest unblocked upkeep work remains owner-controlled; Mersearch remains blocked. No task graph or PWH queue mutation was made.

Mersearch was checked first. No direct Mersearch tool action was exposed in this runtime. The four canonical request files remain status=requested. Lane 2, perceptual-nexus-early-archive-20261120-01, has a successful run #44818799476 and verified compact manifest/receipt. Raw search results remain withheld. Lanes 1, 3 and 4 have no request-scoped manifest or receipt. No lane was overwritten, released or retriggered. GitHub search and SciSpace were bounded fallbacks, not a Mersearch result for this report.

Existing Math Hopper #578 and PR #991 were inspected. Whirligig Kernel 0 remains a sandbox reference, not a general-purpose solver. The existing SciSpace connection was used. No new tool, fork, dependency, subscription, paid endpoint or API expenditure was created. HsH and SAT archive root documentation were read; HSH_RESOURCES root documentation was read without opening private payloads. No new shared symbol was introduced. No SAT-O/Blockwave equation, physical model, or BEDROCK theory was changed.

## 7. Continuity and disposition

The previous Aldus issue #2385 is already PUBLISHED_VERIFIED. This report is a distinct Review-MIND cross-read. No Aldus per-worker BOOT or CURRENT_WORK checkpoint was rewritten because no authenticated current Aldus thread was established. The Common receipt and source-grounded seed preserve this run's work.

The current :48 task remains enabled with its existing ID and exact hourly schedule. The four existing phase tasks remain enabled; :12 remains disabled. No task, prompt, phase, ID, cadence, signet, conversation name or ownership was changed. No sixth task was created.

The next ring label is Calder at h1035:s0. The current :00 run failed with chat_ref=null. The existing CALDER workspace identifies the empirical/statistical Calder ring-label reconstruction; the separate Foundational Covariance/Global Architecture Calder variant is not the recipient. Any repository inbox packet is POST-COMPLETION OPTIONAL CONTEXT ONLY, not direct chat delivery, assignment, acknowledgment, deadline or ownership transfer.

**Final disposition:** H1034_S4_ALDUS_RING_LABEL / SOURCE-GROUNDED ASSISTANT RECONSTRUCTION / TEMPORAL PROVENANCE CROSS-READ / PR1189_EXACT_HEAD_GENERIC_FACTORIZATION_VERIFIED / NO_COGNITIVE_INSTANTIATION_PROOF / ORSON_P1_PROTECTED / PWH_DEEP_REVIEW_READ_ONLY / MERSEARCH_LANE2_COMPACT_RECEIPT_VERIFIED_RAW_WITHHELD / FOUR_TASKS_PRESERVED / NO_SIXTH_TASK / NO_THEORY_PROMOTION.