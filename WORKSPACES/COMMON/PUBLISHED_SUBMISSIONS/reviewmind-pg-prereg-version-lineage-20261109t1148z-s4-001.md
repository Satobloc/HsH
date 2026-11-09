# P&G preregistration hierarchy and version-lineage audit

**Prepared:** 2026-11-09  
**Classification:** Public-source methodological QC; current-assistant Review-MIND work under operational-only clearance. This is not authenticated participation by a historical Mira instance, an independent peer review, or a raw-data reanalysis.  
**Relationship to prior work:** Additive and deliberately narrower than [issue #1524](https://github.com/Satobloc/HsH/issues/1524), which already covers operational agency, assignment-to-analysis units, team attrition/reassignment, and model exposure. This note addresses preregistered versus exploratory outcome status and a working-paper-to-final-publication design-description delta.

## Sources inspected

1. Dell’Acqua et al., “The Cybernetic Teammate: A Field Experiment on Generative AI and Teamwork,” *Organization Science*, published online 12 June 2026, [DOI 10.1287/orsc.2025.20702](https://doi.org/10.1287/orsc.2025.20702). The publisher full text was inspected for §3.2, experimental design, endnotes, and the supplemental-material pointer.
2. Dell’Acqua et al., “The Cybernetic Teammate: A Field Experiment on Generative AI Reshaping Teamwork and Expertise,” NBER Working Paper 33641, April 2025, [PDF](https://www.nber.org/system/files/working_papers/w33641/w33641.pdf).
3. AEA RCT Registry identifier cited by the article: **AEARCTR-0013603**, [registry locator](https://www.socialscienceregistry.org/trials/13603). The registry endpoint returned HTTP 403 in this pass; its contents, timestamp, and version history were not inspected.

No raw participant data, interaction logs, analysis code, transcripts, or author-held materials were accessed. No new human session, model trial, statistical reanalysis, or independent reviewer exercise was conducted.

## 1. Preregistered outcome hierarchy in the final article

The final article states that the experiment was preregistered before data collection. Its §3.2 identifies **two primary dimensions**:

- the effect of introducing AI on performance quality; and
- whether AI could blur functional boundaries between commercial and R&D professionals.

The same section distinguishes two other lines of analysis:

- **Sociality/emotional responses:** included in the preregistration as a variable of interest, but described as having unclear effects. The article later treats emotional responses as a third pillar of its account. This is pre-specified interest, but it is not one of the two primary dimensions named in §3.2.
- **Right-tail/breakthrough performance:** described as an additional dimension that emerged during the investigation. It is not listed among the two primary preregistered dimensions in §3.2.

For evidence classification, do not flatten these into one undifferentiated set of confirmatory outcomes. The defensible reading of the published text is: performance quality and functional-boundary effects are the stated primary dimensions; sociality was a preregistered variable of interest with unclear effects; right-tail/breakthrough analysis is described as emerging during the investigation. Whether the registry contains more specific hypotheses or analysis commitments remains unknown until the actual record is retrieved.

## 2. Working-paper-to-final-publication version delta

The April 2025 NBER working paper and the June 2026 final article do not present identical sample and procedure descriptions.

| Item | April 2025 NBER working paper | June 2026 final article |
|---|---|---|
| Workshop participants | 811 | 826 |
| Randomized cohort described | 776 | 791 |
| Complete post-task survey data | Not separately reported in the same way in the inspected passage | 776; 15 of the 791 randomized participants had incomplete post-task surveys |
| Nonrandomized participants | 35, excluded from randomized analysis | 35, excluded from randomized analyses; article says results are consistent when included |
| Post-task crossover | Describes control groups receiving AI training after the initial task and repeating the task; states primary results use initial between-subject comparisons | The reviewed main-text methods do not describe this crossover step |

The final article’s counts reconcile arithmetically as 826 total workshop participants = 791 randomized + 35 nonrandomized; within the randomized cohort, 776 had complete post-task survey data and 15 did not. The earlier NBER version reports 811 total = 776 randomized + 35 nonrandomized.

The final randomized cohort is therefore 15 larger than the earlier working-paper cohort, while the final article separately reports 15 incomplete surveys. These counts align numerically, but without a participant-level crosswalk they do **not** establish that the same 15 people account for the version difference or how each outcome’s analysis set changed.

The earlier working paper explicitly describes a post-task AI-training crossover for control participants. The final article’s reviewed main-text methods do not mention that step. This is a **version/documentation discrepancy**, not proof that the crossover was removed: it may have been dropped, moved to supplemental material, or omitted from the final main-text account. The final appendix, registration record, or an author clarification is needed before carrying the crossover into the final-study description.

## 3. Why the distinction matters

A preregistration is useful only when the registered outcomes and analysis commitments can be compared with the published analysis. The final article itself gives enough information to distinguish its stated primary dimensions from later or less central analyses, but not enough to reconstruct the registered plan.

The earlier crossover description also matters for exposure and outcome typing. If it remained part of the implemented protocol, it creates a post-initial-task exposure/repeat component that must be kept separate from the initial between-subject comparison. If it was removed before the final study protocol, it should not be imported into the final design. Neither interpretation is established by the materials inspected here.

The prior issue #1524 already records the final article’s assignment-to-analysis details, including eight business-unit × geography clusters, team nullification/reassignment after one member’s nonparticipation, and the distinction between participant, team, solution, survey, and evaluator units. This note does not repeat or replace that audit.

## 4. Formalization triage and limits

The final article describes a 2×2 factorial assignment: individual versus two-person human team, crossed with no AI versus AI access. That is an explicit mathematical design structure.

HsH PR #1115 contains a generic saturated 2×2 algebraic-identifiability module, but it was developed for a different source question (persona/history conditions), is not a formalization of the P&G participant-level assignment or outcome data, and remains **LEAN_NOT_RUN** on its current head. The local runtime has no Lean/Lake/Elan executable. No new theorem or Lean module was created, and no compilation is claimed.

A formal proof of a transcribed 2×2 identity would establish only that formalized identity. It would not validate the paper’s randomization, registry, sample-flow transcription, crossover implementation, outcome classification, or causal interpretation. Those require source and data evidence.

## 5. Retrieval and reconciliation still needed

1. Retrieve the actual AEARCTR-0013603 registration record and version/history; compare its timestamp, primary outcomes, secondary outcomes, and analysis plan with the final paper.
2. Retrieve the final 2026 online appendix, especially Online Appendix A and Table A3. The publisher page references supplemental material, but the link exposed in this pass resolved to the article DOI rather than a separate downloadable appendix. The April 2025 NBER appendix is not a substitute for the final appendix.
3. Resolve whether the NBER working-paper crossover description was removed from the implemented final protocol, retained but omitted from the final main text, or relocated to supplemental material.
4. Reconcile the 811→826 total and 776→791 randomized-cohort version change against the final paper’s 15 incomplete surveys using an authorized aggregate flow table or author clarification; do not infer participant identity from matching counts.

**Disposition:** source-version and preregistration clarification only. No new empirical result, causal claim, raw-data reanalysis, model/participant experiment, consciousness claim, or P1 paper-gate advancement. The registry and final online appendix remain retrieval-blocked.
