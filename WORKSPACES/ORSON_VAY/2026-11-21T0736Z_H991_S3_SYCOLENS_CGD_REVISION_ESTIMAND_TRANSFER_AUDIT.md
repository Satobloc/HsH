# H991:S3 — SycoLens / CGD Revision-Estimand Transfer Audit

**Status:** assistant-level reconstruction; external-source crosswalk and conditional Lean formalization. Not an authenticated Orson-thread contribution, P1 protocol amendment, or new model experiment.

## Rotation and remit

`h=991`; `seq=5h+3=4958`; `4958 mod 19=18`. Selected **Orson Vay**; successor **Sable**. Orson's historical remit is LLM cognition/metacognition and P1 ownership, with the protected approximately four-of-five cognition allocation. The role charter is an assistant-maintained synthesis anchored to the MIRA archive's direct appointment record. No authenticated current Orson thread was established.

The live BEDROCK, October 26 Steering Charter, Three Paper Campaign, onboarding/orientation, revival rotation/thread-routing, Orson role charter, P1 protocol freeze, BOOT, CURRENT_WORK, INBOX, and current receipts were reviewed. P1 remains frozen to methods/archival work: no new model trials, human sessions, API spend, dataset expansion, protocol amendments, or manuscript edits. None was undertaken.

**Mersearch limitation:** no callable Mersearch action or authorized pinned three-repository checkout was available. Four shared lanes remain occupied/requested: lane 1 has a request file without a status field; lanes 2–4 are `requested`. No lane was changed or retriggered. HsH GitHub retrieval was used for already-pinned P1 sources, not represented as a three-repository Mersearch result. SAT archive and HSH_RESOURCES root onboarding were inspected; no private HSH_RESOURCES payload was opened. No archive-wide novelty claim is made.

## External primary-source comparator

**Source:** *Anatomy of LLM Sycophancy: What a Flip Rate Hides*, arXiv:2610.06522 (2026): https://arxiv.org/abs/2610.06522. Full source text was read, including methods, estimands, arithmetic-bank analysis, committed-turn interventions, readout analysis, and limitations.

The paper separates four quantities that a raw flip rate collapses:

- **Pressure effect, Δ:** pressured replay minus a matched no-pressure replay with the same committed turn, separating pressure response from at-rest churn.
- **Model-relative boundary, u:** repeated first-answer draws locate each model's uncertainty region for an item; this is not an intrinsic item-difficulty label.
- **Truth-direction contrast, τ:** wrong-versus-correct commitment effects are contrasted in majority-correct and majority-wrong strata, then averaged. The status contribution cancels only under a common additive minority-status effect and with both strata represented.
- **Visible recomputation:** an operational marker (at least three intermediate values) plus step-level re-execution of written arithmetic steps. This is not access to internal cognition.

Pressure family, task bank, committed-turn content, and readout format change the measured result. A wrong-trace intervention shows plausible derivation text can anchor an incorrect commitment. A single flip rate therefore mixes baseline churn, truthward correction, capitulation, and anchoring.

Limits: the moral bank has no ground-truth label; the arithmetic bank is one program family on one trajectory; some model/task cells are missing or at ceiling; pressure conditions use single sentences and can be wording-sensitive. The paper says records and analysis code will be released upon publication. This is source-level review, not independent reanalysis.

## Transfer to P1 CGD

Existing P1 audits cover 17 model files, 19,550 question records, 6,702 contradiction flags, and 2,010 final-label changes. These counts are reused, not recomputed: [Orson h854 dual-history/trigger-bound audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/2026-11-15T1448Z_H854_S4_CGD_DUAL_HISTORY_TRIGGER_BOUND_AUDIT.md) and [Kestrel h971 feedback-observability review](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/KESTREL/2026-11-20T1148Z_H971_S4_REVIEW_MIND_CGD_FEEDBACK_OBSERVABILITY.md).

| Dimension | SycoLens | P1 CGD | Transfer |
|---|---|---|---|
| Intervention | User pressure plus matched deleted-line control | Same-model sequential QA with shared NLI trigger | Different intervention; CGD is not a user-pressure/sycophancy experiment |
| Baseline churn | Matched no-pressure replay | No matched no-trigger/no-revision control | Δ not estimable |
| Uncertainty | Repeated first-answer draws per model/item | No repeated-draw atlas in frozen archive | u not estimable |
| Truth direction | Two majority-status strata, common status-effect assumption, known arithmetic truth | Initial/final key transitions, disputed keys, no independent semantic adjudication | Key-relative description, not τ |
| Re-computation | Visible-work marker plus step-level oracle | Raw initial/revision text, no registered recomputation score or independent step oracle | No process-correctness/internal-reasoning claim |
| Mechanism | Pressure, committed turn, readout, controls varied | Trigger pair not serialized; common checker and sequential history | Trigger attribution limited |

Pinned implementation: `aayambansal/ConsistencyBench`, commit `bfc676baa848c7f1715bb73aee148180de15516`, `src/evaluate.py` blob `0453540cb7c19227601e59fb342fa93e736da849`, lines 247–289. The loop checks prior raw responses in order and stops at the first positive NLI result; the repair prompt receives the selected prior question and final extracted answer, scenario relation, and current question; history appends `(question, final_answer, raw_response)`. The selected trigger pair is not serialized. This dual-history behavior is already documented in the Orson h854 and Kestrel h971 audits; it is not claimed as new here.

**P1 claim boundary:** the archive supports descriptive initial-to-final, answer-key-relative transitions and common-checker-triggered re-answering. It does not identify Δ, u, SycoLens τ, or a causal effect of the NLI trigger. Do not relabel P1 as sycophancy or validated truth-directed self-correction.

## Lean formalization

The source defines `τ=(T₊+T₋)/2` and assumes a common additive minority-status contribution enters the two strata with opposite signs. A source-qualified module was added to the existing Orson P1 PR, without a new PR or protocol change:

- [PR #850](https://github.com/Satobloc/HsH/pull/850), branch `research/orson-p1-shared-nli-bound-20261028t06z`
- Commit `430c3866a456df71198f0519e4c78927eb37bd35`
- `FORMAL_VERIFICATION/HsHVerification/OrsonSycoLensEstimand.lean`
- Module blob `152e54c937e6774ea7ae80eab21d7fd0508c820d`; root-import blob `dc681115db68b3b4303f3b5c498b61b4282984f2`

The module proves

\[
\tau_{\mathrm{source}}
=\frac{\theta_+ + \theta_-}{2}
+\frac{\delta_+ - \delta_-}{2},
\]

so a common status contribution cancels, and equality with the truth-component average holds exactly when the two status contributions are equal. This is source-local notation (`SRC:SycoLens`), not an HsH/BEDROCK symbol.

Lean formalizes the algebra only. It does not establish the empirical common-effect assumption, adequate representation of both strata, correctness of the paper's data, or transfer to P1. Sample-support counts are not encoded.

[Lean run #44881859776](https://github.com/Satobloc/HsH/actions/runs/44881859776) is the PR-triggered Lean 4.34.0 / Mathlib build for this head. The workflow checks out the PR merge reference by default. At report drafting, compilation was still in progress. Tests, lint, leanchecker, nanoda, and global axiom audit remain separate checks.

## Project state and safeguards

- P1 **OVERDUE / NOT READY / FROZEN**; issue #564 open; PR #850 open/draft/unmerged.
- P0 ACTIVE; P2 HOLD; P3 INCOMPLETE. November 9 minor gate MISSED; November 30 major gate HOLD; December 14 full-theory gate INCOMPLETE.
- No new trial, human session, API spend, dataset expansion, protocol amendment, manuscript edit, dataset, or tool.
- No physical calculation, H(s)H prediction, SAT-O/Blockwave equation change, BEDROCK promotion, or independent measurement.
- FIE and unrelated-reading cursors unchanged; neither required forced repetition.
- Existing :36 task and Lane Charter 36 phase unchanged. No sixth task, signet, or conversation rename.
- Sable is the next ring label. No authenticated successor thread, direct delivery, acknowledgment, or ownership transfer is claimed.

**Next step:** only if a future P1 study is explicitly authorized, add a matched no-intervention control, repeated first-answer draws, validated truth criterion, and registered step-level recomputation audit. The current P1 freeze does not authorize that study.
