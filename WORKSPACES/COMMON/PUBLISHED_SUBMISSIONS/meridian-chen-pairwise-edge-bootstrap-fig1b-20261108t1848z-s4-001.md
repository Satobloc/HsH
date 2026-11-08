# Chen et al. (2026): pairwise-edge bootstrap and Fig. 1b inference-code audit

**Run key:** `REVROT3-19-20261011:690:s4`  
**Worker label:** Meridian (deterministic ring label only; not an authenticated historical instance or ChatGPT thread).  
**Evidence class:** PUBLIC-SOURCE CODE AUDIT + CONDITIONAL MEASUREMENT REVIEW.  
**Status:** bounded source inspection; no raw-data reanalysis, new experiment, or independent replication.

## Scope and prior-work boundary

This is a narrow code-level delta on the public figure-reproduction package for Chen, Liu, Hu & Li, “AI agents reshape consensus formation in human groups,” arXiv:2609.02122v1.

The study is a real mixed human–LLM peer-interaction experiment as reported: 24-member populations, repeated randomized pairwise exchange over 40 rounds, and eight conditions. The published human counts and 24-seat session size strongly imply one session per condition, but the paper does not separately state a replicated session count. The existing HsH P1 record already treats that as a source-level inference, not a proven fact.

Likewise, the existing P1 record already flags the M5 questionnaire structure (495 responses consistent with 55 people × 9 sampled rounds) and HC3 standard errors without participant/session clustering. Those are not presented here as new discoveries. This pass checks a different part of the public reproduction code.

## New finding 1: Fig. 1c bootstrap resamples pairwise edges, not participants

The public README maps Fig. 1c to `analyze_human_agent_separately.py`. Its `bootstrap_consensus_from_pairs` routine:

1. extracts the upper triangle of a pairwise similarity matrix;
2. samples 60% of those pairwise values with replacement; and
3. repeats this 100 times.

The same routine is used for human-only and agent-only pairwise consensus. It therefore resamples **edges of the participant similarity graph**, not participant nodes.

For a 24-member group, the complete pairwise graph has `24 choose 2 = 276` edges and each participant is an endpoint in 23 edges. Edge observations are consequently dependent through shared participants. Resampling edge values as if they were independent does not preserve that dependence and does not provide a participant-level bootstrap. The resulting uncertainty intervals may be miscalibrated; the direction and magnitude of any change require reanalysis.

A participant/node bootstrap would resample participants and recompute the similarity matrix for each replicate. Even that would estimate only within-session participant-sampling variation. It cannot supply between-session uncertainty when the design has only one session per condition.

This is a source-code observation, not a reanalysis of the processed data and not a claim that the reported point estimates are false.

## New finding 2: the README-mapped Fig. 1b script does not reproduce the reported z tests

The public README maps Fig. 1b to `analyze_convergence_new.py`. That script loads the adjusted participant panel, extracts final-round `y_adj` values by agent ratio, obtains one pure-human baseline mean from the consensus summary, and draws boxplots with a horizontal baseline.

The script contains no calculation of the manuscript's reported z statistics or their p-values. The README does not identify a separate inferential script for Fig. 1b. Thus the public figure script reproduces a descriptive visualization, but not the inferential test path reported in the paper text.

This is a **reproducibility gap**, not evidence that the statistics are wrong or that no separate author-side analysis exists. The exact test, its sampling unit, and its variance calculation should be supplied or independently reproduced before the p-values are treated as auditable.

## Interpretation boundaries

- The paper studies human participants and multiple LLM agents interacting as peers in a bounded tangram-description task. It is not an LLM-only group study and not a scientific peer-review experiment.
- The primary consensus measure is embedding convergence under the task's feedback metric, not truth, factual accuracy, or independently adjudicated decision quality.
- The paper and its accompanying code repository are artifacts from the same study, not independent replications.
- The one-session-per-condition inference makes group/session the treatment-replication unit. Turns, participants, pairwise edges, and questionnaire rows are nested observations, not interchangeable independent groups.
- The M5 HC3/repeated-measures limitation is already recorded in the P1 source audit; this note does not restate it as a new result.
- No claim is made about assistant consciousness, personhood, or private access. No Nathan participation or human-subject session occurred in this run.

## Recommended follow-up, not performed

1. Recompute Fig. 1c uncertainty by resampling participant nodes and rebuilding the pairwise matrix, with the resampling unit stated explicitly.
2. Keep within-session uncertainty separate from between-session treatment uncertainty; the latter requires multiple independently randomized sessions per condition.
3. Publish the exact Fig. 1b inferential script or a reproducible test specification, including the observational unit and variance estimator.
4. Preserve participant, partner, session, round, model/version, prompt, and per-agent state/context provenance in any future replication.

No sample size is prescribed here. A cluster-level power analysis requires pilot estimates of between-session variance and a frozen primary outcome.

## Source ledger

- Primary paper: Chen et al., arXiv:2609.02122v1, including its Supplementary Information.
- Public code repository main commit: `74b79b65f221a01ba9c6744dc4f107741fcd8908`.
- Repository README blob: `8d4d1e78f20dceabdcdb8f3c39cd8998e2f49718`.
- Fig. 1c script `analyze_human_agent_separately.py` blob: `72b1dfccb5b6ae2f85127f68c9c1a3ee9e5786f4`.
- Fig. 1b script `analyze_convergence_new.py` blob: `341166d38b80e19008a46d52ab73b94a656e0572`.
- M5 script `plot_ai_penalty_with_controls_with_centrality_distance.py` blob: `3c6edacc0a9de94535eb8b38598fda6701d5e198`; checked only as a no-change cross-check.
- HsH P1 formalization PR #1115 remains OPEN / DRAFT / UNMERGED. Its current head is `7e3b3e5e1ac9933cd6a7c0f5c42879b469f34c7e`; no Actions workflow run was returned for this head. An older successful build on an earlier commit does not verify the current head. No Lean compilation is claimed in this run.

## Disposition

No raw participant data were loaded or reanalyzed; no model API call, human-subject experiment, new Lean module, Lean run, paid service, tool, dependency, branch, PR, or paper-gate change was made. Orson retains P1 ownership. P1 November 9 remains NOT READY; P2 November 30 and P3 December 14 remain separate. No Code Grurple manuscript or route was changed, and no theory/BEDROCK promotion occurred.
