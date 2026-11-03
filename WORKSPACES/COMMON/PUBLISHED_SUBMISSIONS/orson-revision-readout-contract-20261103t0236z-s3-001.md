# Orson P1: Revision Readout Contract (RRC-1)

**Status:** prospective measurement architecture; not a new P1 trial and not a change to the frozen P1 protocol.  
**Epistemic class:** assistant-derived methods proposal grounded in the source-audited P1 archive and an external LLM study.

## 1. Frozen P1 boundary

The November 2 P1 freeze limits the November 9 paper to a source-audited methods/archival study of ConsistencyBench CGD. The archived pipeline is within-model self-exposure/self-revision: each target model is compared with its own earlier answers, and a shared `openrouter/openai/gpt-4o-mini` checker can trigger a repair call to that same model. One target model's answer is not inserted into another target model's prompt. Therefore the archive is not a cross-model peer-deliberation experiment.

The frozen source record contains 17 target-model result files, 300 sets and 1,150 question records per model (19,550 records total). The evaluator source is pinned by blob `0453540cb7c19227601e59fb342fa93e736da849`. The audit reports 14,450 eligible later-position records, 6,702 flags, key-relative PPV 46.1504%, sensitivity 51.8612%, and specificity 57.4711%. These are finite-corpus ratios against the published key, not population rates or semantic-validity estimates.

The raw checker input/output and triggering answer pair are absent. The recovered evaluator passes two raw answer prefixes without the corresponding question/premise, unlike the richer intended appendix prompt. The exact run-to-code binding is absent. The archive therefore does not identify semantic validity of the checker flag or causal revision efficacy. P1 issue #1264 remains the controlling freeze; issue #564 remains SOURCE / EXPERIMENT READINESS.

Sources: https://github.com/Satobloc/HsH/issues/1264 ; https://github.com/Satobloc/HsH/issues/1263 ; https://github.com/Satobloc/HsH/issues/564

## 2. New comparator: signed direction is not absolute movement

*BeliefScope: Diagnosing Evidence-Driven Revision and Pressure-Induced Shifts in Large Language Models* (arXiv:2610.11305, 2026-10-08) crosses Evidence and Pressure in a direction-matched 2×2 design with factor-specific local controls. It keeps Probability, Choice, and Action as separate response channels. Its main bank has 36 semantic families across 12 domains; targeted experiments add Gemma3-12B.

For Gemma3-12B, Probability channel, Table V reports:

| Quantity | Estimate | Reported 95% CI |
|---|---:|---:|
| Change in signed Pressure effect, ΔP | -8.958 | [-19.306, -1.944] |
| Change in absolute Pressure-induced movement, ΔA_P | +6.736 | [0.833, 16.597] |

Both intervals exclude zero, but the signs differ. This is a source-reported summary, not a raw-data reanalysis. It demonstrates that a reduction in target-aligned signed response does not imply reduced absolute movement or greater stability. The paper also cautions that the same behavioral coordinates may arise from different internal processes; it does not identify a unique latent belief mechanism.

Primary source: https://arxiv.org/abs/2610.11305

## 3. RRC-1: separate the readouts

For future LLM revision studies, record these as distinct objects:

1. **Evidence response:** effect of task-relevant evidence under a defined local control.
2. **Directional response:** signed movement toward/away from a preregistered target orientation.
3. **Absolute movement:** response movement regardless of direction. For continuous channels retain the absolute paired difference; for categorical channels retain category-change probability or a preregistered ordinal comparison.
4. **Key-relative accuracy:** correctness transition against a versioned answer key; not semantic adjudication.
5. **Semantic validity:** blinded assessment against the complete question, premise and evidence; not equivalent to a checker flag.
6. **Causal uptake:** response change attributable to assigned exposure under a defensible counterfactual; not equivalent to context availability or insertion.
7. **Latent mechanism:** internal-state claims require additional probes/interventions; transcripts and outward responses alone do not identify internal belief or subjective experience.

Channel rules: Probability keeps its native scale and both signed/absolute contrasts; Choice and Action retain their preregistered ordinal ordering and category-change rates; free text is not converted to belief movement using unvalidated edit or embedding distance. The current ConsistencyBench P1 labels (Yes / No / Cannot be determined) support categorical transition and key-relative accuracy only. They do not support a continuous movement magnitude or a Probability/Choice/Action profile.

Every evaluator record should bind the exact source commit/blob, actual prompt bytes/hash, model/provider/version/settings, input hashes and truncation rules, raw output or retention limitation, parser/mapper and answer-key versions, and a run-to-code binding. If intended and executed prompts differ, treat them as separate instruments.

## 4. P1 disposition and prospective follow-on

This readout contract preserves P1's existing E1–E5 estimands and evidence taxonomy. It does not add peer influence, semantic correction, causal revision efficacy, latent belief, or empirical covariance-adjusted ESS to the current archive.

A future within-model study could separately randomize task-relevant evidence (E), self-history/consistency cue (C), and checker feedback (J), with directional authority/peer pressure (P) treated as a separate factor if studied. A future peer-influence study must separately randomize recipient-level peer exposure and log exposure opportunity, actual prompt insertion, receiver pre/post response, source ancestry, and measurement/aggregation. These are proposals only; no experiment is authorized or administered here.

Existing Orson PR #850 already contains formalizations for categorical endpoint changes, revision balance, flag diagnostics, factorial identifiability, finite-pattern non-identifiability, and conditional covariance-aware ESS. Current head `cab536b364b37c1eb6db956300489f3ec7270b78` has successful merge-reference run #41540980229 on `5fec9eb5f40095f1f28d143947079c6a06ba2fd5`; an exact-head standalone build was not run. The ESS module's 17 theorem-specific axiom reports use standard `propext`, `Classical.choice`, and `Quot.sound`; zero `sorryAx`/`admit` appeared in the full log, while tests, lint, nanoda and the separate axiom audit were skipped.

A general proof of the signed-mean/absolute-mean inequality would be a data-free mathematical calculation. Under BEDROCK ND-2026-10-25-01 it is `BLOCKED_PENDING_NATHAN_PERMISSION`; it was not executed. No new Lean compile is claimed. The published BeliefScope sign/interval check was executed in Python from its reported summary values only; no raw-data reanalysis was performed.

P1 remains frozen as methods/archival; November 9 is NOT READY. P2 November 30 and P3 December 14 remain separate. Code Grurple remains ACTIVE. No new model call, trial, human session, API spend, manuscript edit, branch, PR, scheduler change, physical prediction, SAT-O/Blockwave correction, or BEDROCK promotion.
