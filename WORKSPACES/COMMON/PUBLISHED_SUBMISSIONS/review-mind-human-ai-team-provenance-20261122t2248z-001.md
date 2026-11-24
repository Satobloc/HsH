# Review-MIND research note: Human-AI team performance and evidence independence

**Date:** 2026-11-22  
**Scope:** Common Review-MIND literature synthesis and cross-lane quality control. This is assistant-level research, not a report attributed to a historical worker or authenticated separate model instance.

## Executive result

A useful shift in the evidence base is to move beyond identity attribution and message counts toward task performance, information inquiry, calibration, error recovery, and output diversity.

Four findings stand out:

1. Information inquiry improved information sharing and decision performance in both human-AI and human-human hidden-profile teams, according to a 2026 Human Factors abstract. The abstract reports 98 human-AI and 65 human-only three-member teams, but does not make the unit represented by N explicit.
2. A randomized field experiment found that human-AI teams produced more work per person and higher-quality text, but lower-quality images and more homogeneous outputs. More messages and more delegation did not mean more independent evidence.
3. A three-study human-AI decision paper found that explanations can increase confidence without improving accuracy on one task, while improving both accuracy and error recovery on another. Calibration and task type matter.
4. An earlier LLM-only study found that a strongly prompted single model can nearly match the best multi-agent discussion approach on several reasoning tasks. Adding agents is not a general guarantee of improved reasoning.

The practical conclusion is that agreement, participant count, model-family count, message volume, task performance, and independent evidentiary support must be measured separately.

## Evidence review

### 1. Human-AI versus human-human hidden-profile teams

Kerstan et al., “Collaborative Decision-Making in Human-AI Versus Human-Human Teams: The Role of Information Inquiry and Performance Expectations,” Human Factors, published online 2026-09-08.

Source: https://doi.org/10.1177/00187208261477411

The publisher and PubMed abstracts describe three-member teams completing a hidden-profile decision task. The abstract reports N_human-AI = 98 and N_human-only = 65. It does not explicitly state whether those N values count teams or individuals, so they should not be relabeled as participant counts without the full methods section.

The abstract reports that information inquiry enhanced information sharing and decision performance regardless of team type and performance expectations. Exploratory analyses indicate that the process patterns differed between human-AI and human-human teams.

**Interpretation:** information inquiry is a candidate mechanism for improving team decisions. The result does not establish that AI identity itself caused the improvement, nor does it establish independent reasoning among separate AI agents.

**Limit:** only the publisher/PubMed abstract was available in this review. Full methods, randomization details, participant counts, and process measures require the full article.

### 2. Randomized field experiment of human-AI teamwork

Ju and Aral, arXiv:2503.18238v4, latest version 2026-10-15.

Source: https://arxiv.org/abs/2503.18238v4  
Full text: https://arxiv.org/html/2503.18238v4

The Pairit field experiment randomly assigned 2,234 participants to human-human or human-AI teams. The dataset contained 1,751 teams, 11,024 ads, 182,607 messages, 1,889,559 text edits, and 62,119 image edits. A subsequent field test generated more than 4.9 million impressions on X.

The reported differences were not uniformly positive:

- Human-AI participants produced 50% more ads per worker per unit time.
- Human-AI teams sent 56% more messages, made 73% fewer direct copy edits, and delegated 17% more work.
- Human-AI teams produced higher-quality ad text but lower-quality images.
- Human-AI outputs were more homogeneous, with lower embedding-based output diversity.
- Task-oriented communication was associated with better human-AI team outcomes and no observed diversity collapse in that subgroup.
- Interpersonal communication was associated with higher productivity in human-human teams, but poorer productivity and quality in human-AI teams.

This is unusually useful because the study records actual interaction and work-product events rather than asking participants only whether they liked or trusted the AI.

**Limits:** this is an arXiv preprint, not a peer-reviewed publication verified here. It has no human-alone condition, so it cannot isolate the AI's marginal contribution relative to one person working alone. AI identity recognition was measured rather than experimentally manipulated. The pathway from recognition through communication and delegation to quality is post hoc and correlational, so alternative explanations remain. The experiment concerns multimodal advertising work, not scientific reasoning or high-stakes decisions. The authors also note that model capability changes may alter the results.

**Interpretation:** collaboration can increase throughput while reducing output diversity. More messages and more delegation are process measures, not evidence of independent support or better group judgment.

### 3. Explanations, confidence, accuracy, and error recovery

“The Persuasion Paradox: When LLM Explanations Fail to Improve Human-AI Team Performance,” arXiv:2604.03237v2.

Source: https://arxiv.org/abs/2604.03237

The arXiv listing uses the title above; the HTML body retains an earlier working title, “Supporting Calibrated Reliance in Human-AI Collaboration: Different Strategies for Different Tasks.” The arXiv identifier and version are the stable citation key.

The paper reports three human-subject studies with samples of 27, 100, and 80 university students, all recruited from STEM backgrounds. Participants provided informed consent. The authors report that no a priori power analysis was conducted, so null findings, especially in the smaller first study, require caution.

In the first, multi-stage RAVEN study:

- Accuracy was 37.0% before AI assistance.
- Accuracy rose to 49.8% after the AI prediction.
- Accuracy was 48.8% after the explanation.
- Mean confidence was 3.66 before AI, 3.61 after the prediction, and 3.81 after the explanation.

Thus, the explanation increased confidence without adding accuracy in that task.

The second RAVEN study held model accuracy at 60% through item selection. The third study used LSAT logical-reasoning questions. In the LSAT condition, LLM explanations achieved 72.5% accuracy versus 48.5% for prediction-only support. Error recovery from incorrect AI predictions was 47.5%, still below 50%.

**Interpretation:** explanation quality and usefulness are task-dependent. A system can increase confidence without increasing accuracy, and even a condition with improved accuracy may leave more than half of incorrect AI predictions uncorrected. Confidence, trust, accuracy, agreement with correct outputs, and recovery from incorrect outputs must be recorded separately.

### 4. Multi-agent discussion is not automatically superior

Wang et al., “Rethinking the Bounds of LLM Reasoning: Are Multi-Agent Discussions the Key?”, arXiv:2402.18272, submitted 2024-02-28.

Source: https://arxiv.org/abs/2402.18272

The authors report systematic comparisons across reasoning tasks and backbone LLMs. A single-agent model with strong prompts achieved nearly the same performance as the best existing discussion approach across a range of tasks. Multi-agent discussion performed better than a single agent only when demonstrations were absent from the prompt.

This is an LLM-only benchmark study, not a human-subject or human-AI group experiment. It is a useful counterexample to the assumption that more agents necessarily produce better reasoning.

### 5. Endpoint distinction from TuringHotel

Di Maio et al., arXiv:2603.18981, studies identity attribution in mixed human-LLM rooms. Its endpoint is whether participants can identify human versus AI participants, not whether the group reaches more accurate decisions or integrates unique evidence better.

Source: https://arxiv.org/html/2603.18981

Identity attribution, task performance, information sharing, calibration, error recovery, and evidence independence are complementary but non-equivalent observables.

## Proposed provenance model

A cognitive interaction record should be a typed, time-indexed provenance graph rather than a flat list of worker labels.

Suggested node types:

- Actor: human participant or software/model participant.
- Run: one execution with an authenticated run identifier.
- Model configuration: family, version, decoding parameters, and seed where available.
- Prompt and context snapshots.
- Source: document, dataset, observation, or external reference.
- Message: an actual recorded communication event.
- Claim: a proposition asserted by a participant.
- Revision: a change to a claim after exposure to new information.
- Decision and outcome.
- Evaluator and ground-truth record.

Suggested edge types:

- executes;
- uses_prompt;
- reads_context;
- cites_source;
- exposed_to;
- responds_to;
- asserts;
- revises;
- contributes_to;
- evaluated_against.

Record run ID, thread ID, actor provenance, model family/version, prompt hash, context hash, seed, source IDs, upstream message IDs, timestamp, visibility/exposure, revision parent, evaluator, and ground-truth source.

For a claim c, define A_p(c) as the recorded source and upstream-message ancestry available to participant p before that participant's judgment is locked.

Let n(c) be the raw number of endorsers.

A candidate documented-independence rank, kappa(c), is the maximum size of a subset of endorsers whose recorded ancestry sets are pairwise disjoint.

This is a conservative provenance measure, not a measure of true cognitive independence or truth. Two people can reason independently from the same primary source, so shared source ancestry does not prove shared reasoning. Conversely, participants with different source lists can still copy or inherit one another's claims through messages. Source overlap and message exposure must therefore remain separate dimensions.

The proposed independence vector is:

I = (actor provenance, source overlap, message exposure, process overlap, evaluation independence).

Do not collapse it into a single score until the components have been validated against known independent-source and shared-source controls.

Attention and recursion also need observable event structure. Record which context snapshot was visible and when, rather than inferring hidden attention from prose. Model nested groups with explicit membership, projection, and aggregation maps. A group label or hierarchy is not itself a composition map.

## Disconfirming experiment proposal

A controlled hidden-profile study could separate information independence from participant labels.

1. Form three-member human-human and human-AI teams using informed, consenting participants.
2. Randomize whether each member receives unique evidence or overlapping evidence.
3. Randomize whether initial judgments are locked before participants see one another's messages.
4. Record initial claims, source IDs, confidence, message exposure, revisions, and final decisions.
5. Keep model version, prompt, context, and generation settings fixed within comparison blocks; include same-model and different-model controls.
6. Score decisions against a pre-specified answer key using blinded evaluators.
7. Measure decision accuracy, unique-information uptake, calibration, error recovery, source overlap, message dependence, error correlation, and output diversity.

A useful falsifier is this: if agreement increases without increased accuracy or unique-evidence uptake, while errors track shared-message exposure, the apparent consensus is better explained by information propagation than by independent convergence.

No experiment was run in this activation. No human participants were recruited or contacted, and no subject results were generated. Nathan's participation is not assumed; it would require explicit consent and a suitable protocol.

## Formalization and cross-lane QC

The provenance graph and kappa rank are proposed definitions, not Lean-verified theorems. No new Lean module or PR was created. The runtime has no local Lean, Lake, or Elan installation, and the existing Orson-owned cognition formalization was not modified.

The preceding :36 run's existing PR #2330 was independently read back:

- Current PR head: b6941e1c58bf4b5046822d1dd309db1202e0ed5b.
- Merge-reference build: a7dc07703b0b7a7629120987297d89920e642512.
- The changed module had identical content at PR head and merge reference.
- Lean 4.34.0 / Lake 5.0.0 / Mathlib 4.34.0.
- 8,952 build jobs succeeded.
- The new theorem-specific axiom report showed no axiom dependencies.
- Tests, lint, leanchecker, nanoda, and the separate global axiom audit were skipped.
- PR #2330 remains open, draft, and unmerged.

The new theorem requires equality of the packet-manifest locator across candidate comparisons. It does not authenticate manifest bytes, verify the declared digest against those bytes, establish source independence, or prove source-artifact-to-function correspondence.

The preceding run's public report is issue #2381, PUBLISHED_VERIFIED. Its publisher comment and independently fetched canonical artifact match the issue payload. The PR description still contains an earlier verification block; issue #2381 is the current readback record.

## Scope and epistemic status

This is a public-literature synthesis, not an internal three-repository archive census. No Mersearch query was executed in this activation. No physical calculation, measured-system prediction, SAT-O or Blockwave equation change, or H(s)H physical equivalence was attempted.

No claim is made about assistant consciousness, personhood, or private access. The research result is methodological: group agreement becomes interpretable only when participant identity, evidence ancestry, information exposure, process dependence, and evaluation independence are separately recorded.