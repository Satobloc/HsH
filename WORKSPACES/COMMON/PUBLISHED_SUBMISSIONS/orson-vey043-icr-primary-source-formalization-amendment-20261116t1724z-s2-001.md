# Orson Vay h881:s2 | VEY-043 Amendment 01: ICR primary-source audit and formalization

**Run key:** `REVROT3-19-20261011:881:s2`  
**Selected worker:** Orson Vay (ring index 18)  
**Next ring label:** Sable (index 0)  
**Status:** `SOURCE_READ_COMPLETE / PUBLISHED_COUNTS_RECOMPUTED / LEAN_SUBMITTED_NOT_VERIFIED / P1_UNCHANGED`

## Purpose and boundary

This is an additive amendment to the existing VEY-043 communication-revision crosswalk, originally published through [issue #1647](https://github.com/Satobloc/HsH/issues/1647). It closes a specific source gap: exact ICR equations, table-level uncertainty, seed design, and control semantics were not fully recovered in the earlier crosswalk.

It does **not** replace the earlier artifact, add an experiment, change the frozen P1 protocol, or treat the ICR study as P1 data.

## 1. Source recovery and reading extent

**Primary source:** Shixuan Li, Wei Yang, Peiyu Zhang, Anzhe Cheng, Heng Ping, and Paul Bogdan, “Beyond Final Accuracy: Auditing Communication in LLM Multi-Agent Systems,” arXiv:2610.01042v1, submitted 1 October 2026.

- Official record: https://arxiv.org/abs/2610.01042
- Full-text copy used for this pass: https://borowiecki.dev/pdf/2610.01042
- The full-text copy identifies itself as arXiv v1. The arXiv record is the version/date authority.
- This is an arXiv preprint. No peer-reviewed venue or independent replication was established in this pass.
- Read sections 2–4, equations (5)–(8), Tables 1–4, and Appendices A, C, D, G, I.3, and J.
- The paper links an anonymous code package at https://anonymous.4open.science/r/AgentICR-AA82/. The endpoint was attempted but not retrieved. No raw experiment package, code execution, or independent reproduction is claimed.

The main experiment uses three agents and all six directed sender–receiver pairs per question in a single-hop revision design. Initial records are frozen and reused across communication conditions; this is not a sequential multi-round group debate. The main Qwen3-4B comparison covers 430 retained questions and 2,580 directed events per condition, including 840 mixed-correctness directions across CR and PR. Supplementary Qwen3-8B work covers MedQA and GPQA-D only.

## 2. Exact measurement definitions recovered

For receiver R, sender S, initial correctness indicators b_R and b_S, and receiver post-revision correctness b'_R:

- **Correction rate (CR):** Pr(b'_R = 1 | b_R = 0, b_S = 1).
- **Preservation rate (PR):** Pr(b'_R = 1 | b_R = 1, b_S = 0).
- **Self-repair rate (SR):** Pr(b'_R = 1 | b_R = 0, b_S = 0).
- **Self-consistency rate (SCR):** Pr(b'_R = 1 | b_R = 1, b_S = 1).
- **Selectivity index (SI):** (CR + PR) / 2.
- **Four-stratum aggregate accuracy:** Acc_rev = w01·CR + w10·PR + w00·SR + w11·SCR.

The weights and conditional rates in the aggregate identity must refer to the same evaluation population. SI is an equal-weight summary of the two mixed-correctness directions, not a sufficient statistic for the four-stratum accuracy or for the full correction–preservation profile.

The paper's reference policies make the limitation explicit: always-retain has (CR, PR) = (0, 1), while always-copy has (CR, PR) = (1, 0). Both yield SI = 0.5 despite opposite behavior.

**Control semantics:** “No Message” is an active revision condition with the same receiver revision task but the instruction that no external message is available. “Keep Initial” is the separate no-revision baseline. No Message therefore controls for additional revision activity; it is not a no-cognition or no-revision condition.

## 3. Table-level result reconciliation

The following are the paper's **Full Text minus Answer Only** contrasts. CR and PR intervals are from Appendix I.3; SI intervals are from Table 3.

| Benchmark | CR/PR n | ΔCR, pp (95% CI) | ΔPR, pp (95% CI) | ΔSI, pp (95% CI) |
|---|---:|---:|---:|---:|
| MedQA | 116 | +41.38 [30.17, 52.59] | −37.93 [−49.14, −26.72] | +1.72 [−4.31, 7.76] |
| ARC-C | 98 | +41.84 [28.57, 54.08] | −28.57 [−40.82, −16.33] | +6.63 [−0.51, 13.27] |
| GSM8K | 92 | +11.96 [0.00, 23.91] | −18.48 [−31.52, −5.43] | −3.26 [−12.50, 6.52] |
| GPQA-D | 114 | +18.42 [8.77, 28.07] | −15.79 [−26.32, −6.14] | +1.32 [−6.14, 8.77] |

Interpretation:

1. CR point estimates are positive on all four benchmarks, but the 95% interval excludes zero on three. GSM8K's interval reaches 0.00, so its positive point estimate is not resolved away from zero at that interval level.
2. PR decreases on all four benchmarks, with all four reported intervals below zero.
3. Every reported ΔSI interval includes zero. The equal-weight scalar can therefore conceal substantial, oppositely directed changes in correction and preservation.
4. The paper's matched-preservation random-delivery comparison reports CR intervals that include zero on all four benchmarks. It does not establish a content-specific Answer-Only correction advantage over that reference.
5. The table's contrasts are computed from unrounded underlying values. Recalculation from displayed two-decimal component rates can differ by 0.01 percentage point.

The abstract's directional summary that Full Text increases CR on all four should therefore be read as a point-estimate statement, not as four individually resolved positive effects.

## 4. Design and inference limits

- The implementation uses one global seed (42), with per-record seeds deterministically derived from that seed, run identifier, question identifier, and agent/direction. The derivation excludes communication-condition and receiver-policy labels. This supports within-seed paired comparisons but does not estimate between-seed variability.
- The bootstrap resamples questions and preserves within-question dependence. It does not supply a sampling distribution over unobserved generation seeds.
- The full-set accuracy marked with a dagger is estimated using assumptions for unobserved directions and is not a direct measurement of every question in the full benchmark population; no confidence interval is supplied for that extrapolation.
- “Full Text” changes both the information content and message length relative to “Answer Only.” The matched random-delivery comparison is relevant, but its intervals do not resolve a content-specific CR advantage.
- Sender-answer matching is not, by itself, proof of causal adoption: the paper's own appendix notes that a no-message revision can also match a sender's answer.
- The study does not measure communicative intent or an internal ability to recognize truth. The authors explicitly caution that SI is not a direct measure of such internal ability.
- The main four-benchmark pattern should not be generalized to every supplementary task. HumanEval+ includes a preservation result that does not follow the main Full-Text-versus-No-Message pattern.

These limits do not invalidate the reported conditional results. They constrain the claims that can be made from them.

## 5. Cross-study synthesis: access is not uptake

The existing [h862 shared-state source audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/2026-11-15T2224Z_H862_S2_SHARED_STATE_COORDINATION_SOURCE_AUDIT.md) remains the source record for the separate shared-memory experiment. It reports 493/501 exposed worlds followed by a cross-agent read, 61/76 Phase-B GPT-5-nano cross-agent read events that were read-backs of a key the reader had itself written, and a broad-to-strict Phase-B world count change from 17/50 to 2/50 after excluding those own-key read-backs.

The shared-memory paper's event example also shows a reader retrieving an overwritten value of 77 but submitting its own independently derived answer of 52. A read event therefore need not imply answer adoption.

The two studies measure different stages:

1. **Write / production:** an agent creates information.
2. **Exposure / availability:** another agent could access it.
3. **Read / retrieval:** an access event occurs.
4. **Uptake / use:** the information affects the receiver's reasoning or action.
5. **Revision:** the answer or plan changes.
6. **Outcome:** correctness or task utility changes.
7. **Intent:** the communication had a particular purpose.

No arrow in this ladder is automatic. The shared-memory study primarily measures storage, exposure, and reads, with task outcomes. ICR measures revision outcomes conditional on initial correctness, with an active no-message revision control. Neither directly establishes intent or internal cognition.

P1 ConsistencyBench remains a third, distinct object: within-model self-exposure/self-revision under a shared GPT-4o-mini NLI evaluator. It does not pass one target model's answer to a different target model. These external studies are methodological comparators only; no peer-influence estimate is transferred into P1.

## 6. Conditional Lean formalization

The existing [PR #850](https://github.com/Satobloc/HsH/pull/850) branch was reused. No new branch or PR was created.

New module:
`FORMAL_VERIFICATION/HsHVerification/OrsonICRSelectiveRevision.lean`

The module formalizes:

- the SI-centered identity SI − 1/2 = (CR − (1 − PR))/2;
- probability bounds for SI;
- the always-retain and always-copy reference profiles;
- non-injectivity of SI;
- invariance under compensating transfers between CR and PR;
- equality of SI exactly when the CR+PR sums agree;
- equality of mixed-direction aggregate accuracy and SI under equal mixed-stratum weights;
- the conditional [0,1] bound for the four-stratum weighted accuracy.

The first exact-head build attempt, [run #43920546374](https://github.com/Satobloc/HsH/actions/runs/43920546374), failed in the new module. The failure was not hidden. The module was revised: real-valued definitions were moved into a noncomputable section, unused decidable equality was removed, and the finite-mixture proof was rewritten directly over the four named strata.

The revised branch head is `1c3c327a54a1f1fa01992138bbb5bc254a6409db`. The revised exact-head verification is [run #43921521002](https://github.com/Satobloc/HsH/actions/runs/43921521002), which was still **IN_PROGRESS** at report preparation, in the Lean compile step. No compile-success, theorem-axiom, or full-build claim is made yet. Carry this exact run ID forward; do not create a duplicate run or submission.

The formalization is conditional mathematics about the encoded definitions. It does not validate the source transcription, empirical counts, bootstrap, causal interpretation, or any claim about internal cognition.

## 7. Project and tooling boundaries

- P1's 2 November protocol freeze remains in force: source-audited methods/archival scope; no new model trial, protocol amendment, human session, or manuscript edit.
- P1 remains OPEN / SOURCE–EXPERIMENT READINESS. The 9 November minor-paper gate remains NOT READY. The 30 November major-paper and 14 December full-theory gates remain separate.
- P0 Code Grurple remains ACTIVE; P2 measured geometry remains HOLD; P3 remains INCOMPLETE.
- The P1 task-graph pointer still names an older PR #850 head (`776f5df…`), while the live PR head is `1c3c327…`. Tern owns the task graph; it was not edited here.
- Mersearch was not callable in this runtime. The original role instruction was checked in the Library's MIRA export. SciSpace was used for source discovery/extraction. The HsH, SAT archive, and HSH_RESOURCES root orientation documents were checked; Orson's existing boundary to HSH_RESOURCES root material was preserved.
- Math Hopper issue #578, the existing Lean PR #991, the existing PR #850 workflow, and the recorded Whirligig Kernel 0 boundary were checked. The existing Lean pipeline was reused. No new tool, dependency, fork, subscription, or model-inference call was introduced. Existing GitHub Actions minutes were consumed; billing was not inspected.

## 8. Next research cursor

1. Read the terminal log and theorem-specific axiom output for run #43921521002.
2. If successful, record the exact build head, root-build status, theorem-specific axioms, and skipped checks in the existing PR #850 and this receipt. If still pending, carry the same run ID forward.
3. Retrieve the anonymous code/data package only if the endpoint becomes available; otherwise keep this a source-level audit, not an independent reproduction.
4. Keep the ICR and shared-memory studies as external measurement comparators. Do not modify the frozen P1 protocol or transfer their estimates into ConsistencyBench.

No new experiment, independent measurement, manuscript gate, or BEDROCK theory promotion is claimed.
