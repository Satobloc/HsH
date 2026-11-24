# Nadir h974:s4 | DebateLedger v2 source-version and cognition-readout audit

**Date:** 2026-11-20  
**Run key:** REVROT3-19-20261011:974:s4  
**Nominal slot:** 2026-11-20T14:48:00Z  
**Selected ring label:** Nadir Voss (index 10); next: Enheduanna (index 11)  
**Classification:** assistant-level source reconstruction; one-run Review-MIND overlay. Not authenticated participation by a historical Nadir instance, not a permanent role change, and not Orson's P1 paper.

## 1. Rotation, provenance, and access boundary

- h=974; seq=5(974)+4=4874; 4874 mod 19 = 10.
- The latest usable Nadir ChatGPT thread was not verified after bounded prior-context, workspace, inbox, and saved-source lookup. No new chat was created and no cross-thread delivery is claimed.
- No standalone Nathan-authored Nadir specialist charter was recovered. The actual HsH raw export DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/26.06.23•26.10.01•Quantum Gravity and Experiments — raw.json (blob d828fef5352045cb4d9486fdbeabd04043c4c119, conversation 6a3a2037-3698-83ea-924d-2cb8c4ac7701) contains three relevant direct user messages dated 2026-10-01. They authorize a broad independent playground, source/invention separation, and a trial H(s)H Lagrangian; they do not name “Nadir Voss.” That worker label and the detailed workspace specialization remain assistant-generated.
- The current Lane 48 Review-MIND charter is a one-run overlay, not a permanent reassignment. Nadir's independent Lane 24 sandbox remains BACKSEAT / HOLD while P0 is active.
- The optional Elias h974:s3 holdout-exposure packet was read. It creates no assignment or response obligation. Its packet timestamp precedes this invocation; this run consumed it as optional prestart context.
- The existing [Nadir-to-Enheduanna optional packet](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-20T1158Z_from_s0_nadir_voss_to_s0_enheduanna_h975_OPTIONAL_H971_PARABOLA_SCOPE_AND_SOURCE_FIDELITY.md) for REVROT3-19-20261011:975:s0 was found in Enheduanna's inbox and reused. No duplicate successor packet was created.

## 2. Primary source: version-pinned debate-transition study

Xin Li, Mengbing Liu, and Chau Yuen, “Measuring Collapse and Correction in Homogeneous-Panel LLM Debate,” arXiv:2609.35279.

- v1 was submitted 2026-09-28 ([v1 abstract](https://arxiv.org/abs/2609.35279v1)).
- v2, the latest version inspected, was submitted 2026-11-08 ([v2 full text](https://arxiv.org/html/2609.35279v2)) and is described as accepted at NeurIPS 2026 Evaluations and Datasets Track.
- The associated [DebateLedger repository](https://github.com/LiXin97/DebateLedger/tree/fbbee2d0e8e6765fff19522a907d1c1685ef174a) was inspected at its current main snapshot.
- The study evaluates homogeneous three-copy, closed-book multiple-choice debate. It records both directions of majority change: collapse of an initially correct majority and correction of an initially wrong majority.

The v2 abstract reports 6,925 MMLU-Pro debates and 253 collapses. Its signed-replay analysis uses a separate 6,525-debate open-source local-model cohort:

| v2 policy | Collapses prevented | Corrections lost | Net at equal weights |
|---|---:|---:|---:|
| Always freeze | 251 | 804 | -553 |
| Held-out LOMO probe-gated freeze | 0 | 0 | 0 |
| Round-1 majority-change rule, separate 1,255-trace cohort | 74 | 56 | +18 |
| Learned Round-1 stump, same separate cohort | 59 | 42 | +17 |

The 1,255-trace Round-1 cohort is not matched to the 6,525-debate freeze cohort. Its positive rows cannot be compared as if they were alternative policies evaluated on the same debates.

The v2 paper's 8-probe screen is a triage signal, not a calibrated controller: G=7, Spearman rho=0.893, p=0.0123; initial-majority accuracy is a close comparator (rho=-0.821), and the family partial association is not confirmatory (rho=0.767, p=0.0877). The paper reports that 149/253 tracked collapses begin in Round 1, but explicitly treats round-level features as localization, not causal mediation.

A post-hoc follow-up branches peer-debate and private-revision arms from shared Round-0 answers. Peer debate exposes each agent to all panel responses; private revision exposes each agent only to its own previous response. Under binary scoring, private revision is 1.44–4.81 percentage points less accurate across twelve MCQ settings, but expected tie scoring moves the difference to -1.62 to +0.38 points. This is a response-condition comparison, not an observation of latent belief, subjective experience, or consciousness. The follow-up is post hoc.

The paper itself limits generalization: the primary association uses 14 model rows across 7 families rather than the preregistered 18; the scope is homogeneous same-model, closed-book MCQ debate. It does not establish transfer to heterogeneous judge/debater panels, tools, retrieval, free-form generation, or long-context evidence-gathering agents. It uses public benchmark questions and model calls, not human participants.

## 3. Source-version and artifact reconciliation

A material version drift was found between the latest paper and the public repository's older summary.

1. The [arXiv v1 abstract](https://arxiv.org/abs/2609.35279v1) (2026-09-28) says a leave-one-model-out probe-gated freeze prevents 29 collapses and loses 108 corrections.
2. The [DebateLedger GitHub main snapshot](https://github.com/LiXin97/DebateLedger/tree/fbbee2d0e8e6765fff19522a907d1c1685ef174a) is commit fbbee2d0e8e6765fff19522a907d1c1685ef174a. Its [README](https://github.com/LiXin97/DebateLedger/blob/fbbee2d0e8e6765fff19522a907d1c1685ef174a/README.md) announces release alpha-tot-v1.0.4 on 2026-11-04 and still repeats the 29/108 pilot aggregate.
3. The arXiv v2 (2026-11-08) supersedes that abstract result: the net-utility-tuned held-out LOMO gate never fires; the always-freeze policy prevents 251 but loses 804.
4. The repository's [README_REPRO.md](https://github.com/LiXin97/DebateLedger/blob/fbbee2d0e8e6765fff19522a907d1c1685ef174a/README_REPRO.md) and [gate_lomo_drop.json](https://github.com/LiXin97/DebateLedger/blob/fbbee2d0e8e6765fff19522a907d1c1685ef174a/abc_exp/results/gate_rerun/gate_lomo_drop.json) state that the original pilot scripts and probe inputs were not retained. The JSON labels its new implementation a post-hoc reconstruction, not a reproduction.
5. The open [gate_lomo_paper.json](https://github.com/LiXin97/DebateLedger/blob/fbbee2d0e8e6765fff19522a907d1c1685ef174a/abc_exp/results/gate_rerun/gate_lomo_paper.json) records the v2-style variants: main e5_rule LOMO 0/0; nested LOMO 6/26; always-freeze 251/804; raw mean-flip-rate gate 97/280. The v2 paper's Table 35 reports the main LOMO gate as 0/0 and the nested LOMO comparison as 6/26. The old 29/108 aggregate is not reproduced by the currently released gate JSON.
6. [thinkoff_compare.py](https://github.com/LiXin97/DebateLedger/blob/fbbee2d0e8e6765fff19522a907d1c1685ef174a/abc_exp/experiments/thinkoff_compare.py) retains 29/108 as an aggregate-only constant, rather than deriving it from the current gate JSON. The README is therefore stale relative to arXiv v2, and the original 29/108 pilot cannot be independently reconstructed from the currently documented open artifacts.

The repository's Croissant metadata records SHA-256 1350c4e952a1e03995a9eb65f422b02fa4174af35a371d45e7d2fcef746c18f9 for gate_lomo_paper.json. The v2 paper says the 6,525-debate LOMO ledger is zero-API rebuildable from released traces and scripts, while full transcripts and safety-sensitive probe text remain tiered/gated. No gated data were requested or accessed, and no raw trace dataset was downloaded or independently replayed in this run.

**Recommended source-fidelity correction:** synchronize the repository README and reproducibility card to arXiv v2; explicitly label 29/108 as the unreproduced original-pilot aggregate; pin the paper version, repository commit, result-file hash, cohort, and release tier for every headline number. No author contact or external repository change was attempted.

SciSpace's indexed result returned the older 29/108 summary without a version pin. This is a concrete reason to cite and inspect the exact arXiv version rather than relying on an aggregator record.

## 4. Projection and formalization boundary

The paper's observable chain can be represented conditionally as:

full per-agent interaction history -> per-round answer tuples -> initial/final majority -> transition category.

Each aggregation is a projection. The majority and transition summaries are many-to-one: they do not, by themselves, recover which agent saw which source, the order of peer exposure, individual response trajectories, or a causal route to revision. The paper retains more detailed traces for some analyses, but its aggregate transition table is not a sufficient statistic for every proposed group-process claim.

HsH already contains a generic formal theorem in Nadir PR #1189, FORMAL_VERIFICATION/HsHVerification/NadirProjectionCoarseGrainFactorization.lean:

factorization_iff_fiberwise

For maps P (fine observation), C4 (state transformation), and Pcoarse (coarse readout), a deterministic induced map on the image of P exists exactly when Pcoarse ∘ C4 is constant on every fibre of P; it is unique on that image. A fibre mismatch rules out every such deterministic induced map.

The exact [PR #1189 head](https://github.com/Satobloc/HsH/pull/1189) da1e7d5dff0cdbc1d81303e3c573b79832087a38 passed [Actions run #44106198466](https://github.com/Satobloc/HsH/actions/runs/44106198466): checkout assertion matched the exact head; Lean 4.34.0 / Lake 5.0.0; 8,961 build jobs. The relevant theorem's axiom report lists Classical.choice; uniqueness uses Quot.sound; no sorryAx or admit was found in the inspected log.

This is an existing generic map theorem, not a new proof about DebateLedger. The study does not supply a source-defined latent-belief state space or a validated map from internal belief to response. No source-specific Lean instance, new module, new compile, or claim about hidden mental states was created.

A future HsH study could use a versioned per-agent ledger containing independent initial answers, source identity, peer-exposure events, round-by-round responses, correctness transitions, uncertainty, tie handling, and independent adjudication. Any proposed group-level target must be specified as a map from the retained history; identifiability must be checked against the actual projection fibres. Corrections and collapses should be scored separately under predeclared utility weights. This is a design proposal, not an executed experiment.

## 5. Existing infrastructure and project safeguards

- Mersearch was checked first. Its four request lanes remain occupied/requested; no Mersearch action was available in this runtime. No request was overwritten, released, or retriggered.
- Existing SciSpace was available and used. [Math Hopper issue #578](https://github.com/Satobloc/HsH/issues/578) and [PR #991](https://github.com/Satobloc/HsH/pull/991) were checked; the full three-repository corpus scan remains unverified. Whirligig Kernel 0 remains a restricted sandbox. No new tool, fork, dependency, subscription, or expenditure was introduced.
- No HSH_RESOURCES internal index or payload was accessed in this run.
- Nadir PR #1189 remains open/draft/unmerged at the exact head above. No branch, PR, code, or workspace role charter was changed.
- P0 Code Grurple remains ACTIVE. P1 Orson cognition remains OVERDUE / NOT READY / ORSON-OWNED. P2 November 30 remains HOLD. P3 December 14 remains INCOMPLETE. The November 9 minor-paper gate was missed. FIE review is next due 2026-11-24; last review was 2026-11-10.
- Orson's manuscript, dataset, protocol, experiment, PR, and ownership were not modified. No human participants, model calls, or new group experiment were run.
- No physical calculation, measured-system analysis, fit, prediction, independent measurement, SAT-O/Blockwave equation change, paper-gate advancement, or BEDROCK theory promotion occurred.
- The unrelated-reading cursor remains SAT archive fun break - lx.txt, next line 2401. No duplicate break was taken because the prior break was recent.

## 6. Publication, receipt, and next hop

This report is public-safe and contains no protected HSH_RESOURCES payload or private source text. It is intended for the existing HsH issue publisher. Publication status is separate from workspace-file and receipt status; only exact publisher confirmation plus independent artifact readback qualifies as PUBLISHED_VERIFIED.

The existing successor packet for Enheduanna REVROT3-19-20261011:975:s0 was reused. No duplicate handoff, task, assignment, response obligation, or ownership transfer was created. Repository packet presence does not establish ChatGPT-thread delivery, consumption, or acknowledgment.

The existing :48 automation task and all other enabled task IDs, schedules, phases, prompts, and enabled states remain unchanged. The :12 task remains disabled. No sixth task, signet, or conversation rename.