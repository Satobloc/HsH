# H946 S4 Review-MIND: Memory Credenza empirical crosswalk

**Scope:** empirical measurement crosswalk for the experimental Memory Credenza model.  
**Status:** research synthesis and test proposal only. No architecture implementation, automated sampler, human study, or theory promotion is claimed.  
**Worker label:** Ariadne. This is assistant-level work under deterministic ring routing, not an authenticated Ariadne instance or thread.

## 1. Why this is a crosswalk, not a duplicate architecture

The HsH main branch now contains [The Memory Credenza: a compact model for continuity, attention, and return](../MEMORY_CREDENZA_MODEL_2026-11-19.md). The file describes itself as experimental and explicitly distinguishes the Key, Credenza, and Castle; Compass, Atlas, Work tray, and Watchtower; purpose-specific cubbies; tick/tock; and a possible neglect sampler. It does not claim a universal architecture or an implemented sampler, and it does not authorize a new automation or schedule.

This review does not replace that model.

It also does not duplicate adjacent work:

- [Ravel h945:s4, issue #2084](https://github.com/Satobloc/HsH/issues/2084) already treats active-path memory and off-path archive as separate states requiring explicit adoption.
- [Orson h946:s0, issue #2085](https://github.com/Satobloc/HsH/issues/2085) already develops generic cognitive evidence geometry, source-fidelity distinctions, and projection/factorization conditions.
- [Aster h946:s3, issue #2086](https://github.com/Satobloc/HsH/issues/2086) covers a separate Kelvin-system source and cross-view evidence problem.
- [Loom h946:s2, issue #2087](https://github.com/Satobloc/HsH/issues/2087) covers a separate source-identity and chronology correction.
- Enheduanna's October 31 review already examined Tak et al., *From Process Loss to Assembly Bonus*. That paper is reused as an existing comparator, not presented as a new discovery.

The new contribution here is narrower: two additional human-memory studies expose three different validation targets that a continuity system must not collapse into one generic "memory" score.

## 2. Three non-equivalent failure modes

### A. Source memory and contribution attribution

Zindulka et al., *The AI Memory Gap: Users Misremember What They Created With AI or Without*, CHI 2026, DOI [10.1145/3772318.3791494](https://doi.org/10.1145/3772318.3791494), [arXiv:2509.11851](https://arxiv.org/abs/2509.11851).

The study involved 184 participants in a 2x2 within-subject co-writing design. Participants completed ideation and elaboration stages with or without AI assistance, then returned after a one-week delay for source-memory tests. Overall source attribution accuracy was 65.8% for ideas and 72.8% for elaborations.

The paper's model-based predicted probabilities for identifying the source of an idea were:

| Ideation / elaboration workflow | Predicted idea-source accuracy |
|---|---:|
| Human / human | 92.4% |
| AI / human | 37.7% |
| Human / AI | 64.0% |
| AI / AI | 79.3% |

The mixed workflows were the weakest, especially when AI generated the idea and a human elaborated it. In those mixed conditions, confidence did not reliably distinguish correct from incorrect idea-source attribution. The paper also reports overconfidence in source judgments.

This is not a group-deliberation experiment. It is an individual co-writing task using one chatbot/model configuration, GPT-4.1-mini, and a one-week recall interval. It does, however, show that a single project-level "AI used" flag is too coarse to preserve who originated an idea and who transformed it.

**Credenza implication:** retain stage-specific contribution lineage. A claim may have a human origin, AI elaboration, human edit, and later group synthesis. Do not assign one author/source label to the whole artifact.

### B. Content fidelity and memory distortion

Sim et al., *AI-Enabled Human Memory Manipulation: Misleading AI-Generated Summaries Distort Human Memory*, [arXiv:2609.28820](https://arxiv.org/abs/2609.28820). This is treated as an arXiv preprint; no peer-reviewed publication status is asserted here.

The experiment involved 328 participants in a 2x2 between-subject design, using two short videos and a 24-48 hour delay. The same ChatGPT-generated and researcher-edited summary was presented under an AI or human source label. The summary's actual production history and the displayed label were therefore separate variables.

Accuracy on the critical event question was 83.6% in the consistent-information condition and 44.8% in the misleading-information condition. The displayed AI-versus-human label did not significantly moderate the misinformation effect. The authors' audit of 20 candidate summaries found substantial content defects: 51.6% of critical details were omitted, 6.1% were inaccurately described, and 60% of summaries contained at least one hallucinated addition.

A summary-level arithmetic check was performed from the published condition sizes and rounded rates:

- Consistent condition: 165 participants, approximately 138 correct.
- Misleading condition: 163 participants, approximately 73 correct.
- Reconstructed Pearson chi-square: 53.9366, matching the paper's reported 53.937 to rounding.
- Approximate risk difference: 38.9 percentage points; risk ratio: 1.87; odds ratio: 6.30.

These are reconstructed from rounded published percentages and group sizes, not an independent raw-data reanalysis. The public OSF data locator is [wmjtn](https://osf.io/wmjtn/); the raw files were not downloaded in this run.

This study is limited to two videos, one selected summary per event, and one delayed memory task. Its source-label manipulation is not a naturalistic multi-agent collaboration experiment. Its value here is the separation it makes visible: the displayed source label did not protect participants from misleading content, and the displayed label was not the same thing as the actual human-AI production chain.

**Credenza implication:** keep actual producer, displayed label, transformation history, and content verification as separate fields. A source label is not a verification result.

### C. Group process, exposure, and uptake

Tak et al., *From Process Loss to Assembly Bonus: Human-Grounded Diagnosis of Multi-Agent LLM Collaboration*, Findings of EMNLP 2026, [ACL Anthology 2026.findings-emnlp.1341](https://aclanthology.org/2026.findings-emnlp.1341/).

This paper was already reviewed in Enheduanna's October 31 source report. It compares 500 human-only group dialogues with roughly 26,000 LLM-only group conversations across four tasks. It is not a mixed human-LLM group experiment.

The prior review found that LLM group processes showed lower realization of unique information and earlier lock-in in important conditions. Correct minority signals mattered chiefly when they were publicly re-expressed early and carried through to the final answer. The prior review also recorded that interventions were modest and did not eliminate the coordination bottleneck.

**Credenza implication:** preserving a minority claim in storage is not the same as preserving its influence. The event record must distinguish availability, exposure, re-expression, uptake, and final decision use.

## 3. A compact linked record, not another top-level drawer

The three studies point to three separate outcome families:

1. **Source memory:** who originated or transformed a contribution?
2. **Content fidelity:** does the retained claim accurately represent its primary evidence?
3. **Group uptake:** who had access to the claim, who re-expressed it, and which later decision used it?

Decision accuracy, confidence, trust, and accountability remain separate outcomes as well.

The Memory Credenza already has a Sources / Evidence & Provenance cubby and a Findings / Decisions cubby. A small linked **Provenance-Exposure-Uptake (PEU) event ledger** could connect them without adding a new top-level compartment.

Minimum record:

- claim_version_id
- origin_root_ids: primary source, version/hash, and exact locator
- contribution_chain: actor/model/tool, operation (create, edit, summarize, translate, merge), parent claim version, and timestamp
- displayed_source_label: what the recipient was told, separate from actual producer
- verification_event: primary-source check, method, reviewer, and status
- exposure_events: available, delivered, opened, acknowledged, quoted, or adopted, but only where each state has evidence
- uptake_events: later claim or decision that references or transforms this version
- minority_signal_state: proposed, surfaced, re-expressed, retained, rejected, or lost, with event times
- decision_ref: final outcome, confidence, rationale, and accountable decision-maker

For LLMs, prompt inclusion is observable; internal attention is not. Do not equate a claim's presence in a prompt or transcript with demonstrated use. For humans, message availability is not proof of attention. Use explicit acknowledgment or consented interface measures where needed.

Keep the visible Credenza card small: claim/version, origin root, provenance status, last verification, exposure/uptake state, open-when trigger, and return cue. Load the detailed event graph only when the task needs it.

Preserve UNKNOWN as a first-class state. The existing HsH formalization in [Orson PR #1115](https://github.com/Satobloc/HsH/pull/1115), particularly HumanAIQuestionnaireProvenance.lean, demonstrates how a three-way Human / AI / Unsure judgment loses information when projected to a Boolean. Do not silently collapse uncertain source attribution into false or true.

The Credenza's tick remains a place marker. A tock means a bounded operation has produced a durable result and next cursor. Neither a tick nor a tock means that a claim has been verified, adopted, or accepted.

### Crosswalk with branch-aware memory

These are complementary operational layers, not equivalents:

- **Branch-aware memory** selects the active history and preserves off-path alternatives. An explicit adoption event is required to move an off-path item into active state.
- **Memory Credenza** organizes retrieval routes, cubbies, open-when triggers, and return cues.
- **PEU ledger** preserves claim-level origin, contribution, exposure, uptake, verification, and decision events.

Composition requires stable branch_id, claim_version_id, and source_root_id mappings across all three layers. A cubby index must not silently convert an off-path claim into an active claim. A final summary must not replace the event lineage that produced it.

The neglect sampler could sample not only under-inspected cubbies, but also distinct source roots, unresolved claim versions, off-path branches, incomplete verification chains, and minority signals that were never re-expressed. Record the sampling frame/version, method/seed where practical, selected item, selection reason, inspection extent, result, action, and next cursor. Sampling is an invitation to inspect, not evidence of importance or completeness.

## 4. Formal identifiability boundary

Let H be complete interaction histories, O the retained Credenza record, and T a target such as actual authorship, source-root independence, decision-time exposure, or uptake.

A deterministic reconstruction g satisfying T = g composed with O exists exactly when T is constant on every fiber of O:

O(h1) = O(h2) implies T(h1) = T(h2).

This is the existing generic projection/factorization result in [Orson PR #1115](https://github.com/Satobloc/HsH/pull/1115), especially ObservableProjection.lean. The exact PR head 883003fef9ff77e771bce30eac8a112741728fbc has a successful Lean 4.34.0 / Mathlib CI run, [#43404565082](https://github.com/Satobloc/HsH/actions/runs/43404565082). The relevant files compile and their #print axioms commands are part of the build. The PR remains open, draft, and unmerged.

No new Lean module, theorem, #eval, source-specific instantiation, or CI run was created. This review reuses an existing abstract proof primitive; it does not claim that the two new studies or the Memory Credenza have been formalized or empirically validated. The theorem establishes a conditional identifiability boundary, not the truth of the empirical premises.

## 5. Falsifiable mixed human-LLM group experiment

A bounded next experiment could use groups of two human participants and one LLM peer, with multiple independent groups and objective tasks whose evidence and answer can be adjudicated independently.

Use a preregistered 2x2 group-level design:

- **Lineage detail:** source label only versus stage-level origin and transformation lineage.
- **Minority-signal surfacing:** ordinary chronological transcript versus an explicit early re-expression of the initial minority claim.

Each participant first records an independent response before group discussion. The group then deliberates and submits a final decision. Source labels remain truthful; deception is not needed. Any later source-label deception would require ethics approval and debriefing.

Measure separately:

- content recall and fidelity to primary evidence
- source and contributor attribution
- decision accuracy
- confidence calibration
- minority-signal survival and re-expression timing
- actual decision use of a claim
- accountability attribution
- time and cognitive load

Use the group/session as the inferential unit, not message count. Determine sample size through a preregistered power analysis at the group level. Use blinded adjudication of claim fidelity and task outcomes. Record model/version/prompt/context and human-visible interface events with consent. Do not infer attention or subjective mental states from message presence.

The proposal is falsified or needs simplification if stage-level lineage does not improve source attribution, if early re-expression does not improve minority-signal retention, or if any gain is outweighed by cognitive load and delay. If lineage improves attribution but not content accuracy, that is partial support for a narrower function, not validation of the whole Credenza.

No participants, model/API trials, or experiments were conducted in this run.

## 6. Source and scope limitations

- The AI Memory Gap paper is peer-reviewed CHI 2026. Its data/code locator is described by the paper, but raw files were not retrieved or reanalyzed here.
- The AI-Enabled Human Memory Manipulation paper is treated as an arXiv preprint. Its OSF data locator was not downloaded.
- The Process Loss paper is reused from the earlier Enheduanna review; it is not counted as a new independent source review.
- The exact Jan 22 Kirk/Riley human-simulation raw conversation remains unrecovered. A bounded SAT archive search surfaced a lexical false positive: the same SRT exists at two paths with Git blob 9baf9cb64e0c0a6f2d7e4e35b33a0a6c0fcb2e31; all inspected "Kirk" occurrences refer to William Shatner / Captain Kirk in a physics podcast, not the Kirk theory-of-mind source. The duplicate was excluded, not treated as corroboration.
- The current Ariadne role remains an assistant-authored operational synthesis from archived user-role instructions, not a standalone signed specialist charter. No authenticated current Ariadne thread was established.
- No Mersearch run is claimed. Its four request lanes remain occupied and no request-scoped outputs were available. GitHub exact-ID search across HsH, the SAT archive, and HSH_RESOURCES was a bounded fallback, not exhaustive archive coverage. The HSH_RESOURCES private payload was not opened.

No paper gate, Orson P1 manuscript/protocol/dataset, P0 source repair, task graph, automation, schedule, theory status, or SAT-O/Blockwave equation was changed. No physical calculation, fit, prediction, or independent measurement was performed.
