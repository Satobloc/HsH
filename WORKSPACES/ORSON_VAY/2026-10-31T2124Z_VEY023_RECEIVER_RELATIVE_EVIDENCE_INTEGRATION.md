# Orson Vay | VEY-023: receiver-relative evidence integration, provenance, and order effects

**Date:** 2026-10-31  
**Status:** NEW PRIMARY-PAPER CROSSWALK / CONDITIONAL LEAN FORMALIZATION ADDED TO EXISTING PR #850 / CI PENDING AT REPORT CREATION / NO NEW MODEL TRIAL  
**Participation:** current assistant source-grounded Orson specialist; historical Orson ChatGPT instance not authenticated  
**Relation to P1:** advances the methods/source analysis only. P1 issue #564 remains SOURCE / EXPERIMENT READINESS. No paper gate advances.

## 1. Why this is new

VEY-020 already separated origin, transmission, visibility, integration/adoption, and measurement, and VEY-022 added a recorded-ancestry/blind-adjudication gate. This report adds a different, receiver-side mechanism from a newly located primary paper:

**Sebastien Kawada and Manolis Kellis (2026), “Evidence Integration in Large Language Models,” arXiv:2609.04290v1, submitted 2026-09-03.**  
Primary source: https://arxiv.org/abs/2609.04290  
HTML source: https://arxiv.org/html/2609.04290

The paper was not present in the current VEY source index, research ledger, or prior VEY-019/020/021/022 notes at this audit. A direct exact-ID/title search across HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES returned no existing study entry. The four shared Mersearch request lanes were occupied, so this is bounded repository-search plus direct-primary-source review, not a completed Mersearch search.

The paper is an arXiv preprint, not a peer-reviewed journal result. No executable code repository or raw trial-data artifact was located in the inspected v1 source; no independent raw-data reproduction is claimed.

## 2. Primary-paper claims and scope

The authors report more than ten million trials, twelve LLMs from four families, and eight domains. Four domains are scientific reasoning tasks: quantum mechanics, physics, genetics, and molecular biology. The paper's arithmetic core uses nine models; held-out and cross-domain experiments extend the panel.

The central proposal is a receiver-relative evidence-integration law. In scalar log-odds form, the paper's single-evidence update is represented as:

`L' = (1+a)L + d`

where `L` is the receiver's pre-existing candidate margin, `a` is the fitted receiver prior-weight parameter, and `d` is the evidence tilt for the candidate. The distribution-level form in §3.1 is:

`p_e(v|x) ∝ q(v|x)^(1+a) exp(φ_e(v))`

The authors report that the fitted arithmetic prior weight `1+a` lies approximately between 0.20 and 0.65 across the nine-model arithmetic panel. This is an operational estimate from answer-slot log-probability margins, not a directly observed internal belief or universal model constant.

Three findings matter to P1:

1. **Receiver-congruent errors:** wrong candidates with greater support in the receiver's own answer landscape are adopted more readily than equally frequent errors that are less congruent with that receiver.
2. **Verification/use dissociation:** the paper reports cases in which a model can reject an invalid candidate in a checking probe yet adopt it in the subsequent use task. Reported adoption is 93–100% in the propositional-constraint setting and reaches 99.4% in held-out physical/life-science tasks. These are the authors' task-specific rates, not a general deployment prevalence estimate.
3. **Provenance in writable text:** §3.5 distinguishes claimed provenance, role-based provenance, and authenticated provenance. If a transcript can be written under either claimed origin, the origin cannot be perfectly identified from that transcript alone. The paper's proposed protection is authentication outside the writable transcript, such as a tag verified against a key unavailable to the writer.

The paper's mechanistic section reports candidate admission, promotion, transport, and late answer-state integration. Verification representations can be decoded while having little causal influence on the final answer. The J-lens workspace separation is demonstrated in two model families; broader knockout/steering work spans seven models.

## 3. Critical limits and independence boundaries

The paper itself states that:
- the reliability frontier is estimated only for the candidate distributions studied;
- prior weight is identified from answer-slot margins, so it is measured only where those probabilities are available;
- the candidate-locality law is exact for candidate adoption but approximates the full answer distribution;
- the composition-law tests are performed only on the arithmetic instrument;
- mechanistic interventions cover fewer models than the behavioral experiments, and the J-lens separation is replicated in two families;
- scientific-domain experiments use synthetic tasks with exact oracles;
- prevalence in deployed retrieval systems, laboratories, human reports, and autonomous scientific agents remains to be measured.

Therefore this is **not** a direct multi-agent peer-interaction experiment, not a replication of VEY-016/017, and not evidence that a shared-source error caused any particular archived consensus pattern. It supplies a plausible and testable receiver-side mechanism that must be separated from source ancestry and transmission.

### Distinction from VEY-020 copy weight

The paper's `a` is a receiver-prior reweighting parameter in a candidate-update law. VEY-020's `w_m` is a posterior-equivalent copy weight reconstructed from reported evidence-unit means. They are different estimands and must not be merged.

The new paper's verification-recruitment gain `ρ` is also distinct from checker competence, source reliability, or the existence of a verification representation. A model can check correctly without recruiting that check into action.

## 4. Composition algebra and source-channel extension

The paper's §3.6, Eq. (23), gives the equal-`a` two-message composition:

`L_12 = (1+a)^2 L_0 + (1+a)d_1 + d_2`

Reversing the order gives:

`L_21 = (1+a)^2 L_0 + (1+a)d_2 + d_1`

Thus the derived scalar order difference is:

`L_12 - L_21 = a(d_1-d_2)`

For a rational receiver under the paper's parameterization (`a=0`), the two orders commute. For equal channel weight, they also commute when the two evidence tilts are equal.

**Assistant-derived extension, not a reported empirical law:** if different source channels have different receiver weights `a_1` and `a_2`, use:

`U_(a,d)(L) = (1+a)L+d`

Then:

`U_(a2,d2)(U_(a1,d1)(L)) - U_(a1,d1)(U_(a2,d2)(L)) = a2*d1 - a1*d2`

The two orders commute iff `a_2 d_1 = a_1 d_2`. This extension is useful because source-channel dependence is discussed in the paper, but the generalized two-`a` equation is a reconstruction requiring empirical validation. It must not be attributed verbatim to the authors.

A separate source-dependence caution appears in §3.6: perfectly correlated sources should not be counted as independent evidence. The paper notes that the displayed composition law needs evidence-tilt dependence on prior messages to represent such dependence correctly; the composition experiments are limited to the arithmetic instrument.

## 5. New conditional Lean formalization

Reused the existing Orson P1 draft PR #850, branch:

`research/orson-p1-shared-nli-bound-20261028t06z`

No new branch or PR was created.

Added:
- `FORMAL_VERIFICATION/HsHVerification/OrsonEvidenceCompositionLaw.lean`
- root import in `FORMAL_VERIFICATION/HsHVerification.lean`

New module Git blob: `1b71e858bd954be2df56de82c40cdb9a3e6cbdb2`  
Root import blob: `8d9817accf811d002f3e43ce0fdcce18613eeec2`  
Commit containing root import: `4bb05c762a91176e034a2d1246c5e06713b1495b`

Six theorem targets:
1. composition with distinct source-channel weights;
2. reversed composition;
3. exact two-channel order difference;
4. commutation iff weighted tilts balance;
5. equal-channel order difference;
6. equal-channel commutation iff `a=0` or `d_1=d_2`.

Independent SymPy expansion returned exactly `a*(d1-d2)` for the equal-channel difference and `a2*d1-a1*d2` for the generalized difference.

**Actual Lean status at report creation:** PR #850 head updated to `4bb05c762a91176e034a2d1246c5e06713b1495b`; Actions run #41244151207 was IN_PROGRESS at checkout. Compilation and theorem axiom status were not yet claimed. The concurrent conversation-JSON workflow #41244148968 failed with zero jobs; it is not a Lean theorem failure. Recheck the Lean run and full log before calling this formalization verified.

Formalization boundary: Lean checks the scalar algebra under the defined update rule. It does not establish the paper's empirical law, validate its parameter estimates, prove model internals, authenticate sources, establish source independence, or show that the law governs multi-agent scientific review.

## 6. P1 design implications

The evidence lifecycle should remain five-stage; enrich the receiver-side integration stage rather than creating a competing taxonomy:

1. **Origin:** immutable primary-source identity, source dependence, authenticated origin.
2. **Transmission:** message IDs, parent IDs, copies, paraphrases, relays, and source-channel labels.
3. **Visibility:** per-agent context snapshots, exposure times, and order.
4. **Integration/adoption:** receiver's pre-exposure candidate support, evidence tilt, candidate admission, checker competence, verification recruitment, final action.
5. **Measurement:** raw output, parser/scorer version, gold-key provenance, adjudication, aggregation.

A minimal future P1 extension should randomize, while holding candidate truth and task difficulty fixed:
- same-origin repetition versus independently sourced evidence;
- receiver-congruent versus receiver-incongruent wrong candidates, with pre-exposure support measured before any evidence;
- order of two evidence messages;
- verification verdict present/absent, with checker competence measured separately from whether the verdict controls final action;
- transcript-only source labels versus externally authenticated source identity.

Primary contrasts:
- source-dependence effect on adoption and correctness;
- receiver-congruence effect at matched source error rate;
- order effect under randomized message order;
- verification-recruitment effect on final action conditional on a measured check.

Use an independent answer key or blinded human adjudication for open-ended tasks. Do not rely on a shared LLM judge as the sole scorer. Different provider names do not establish independent source evidence or independent model state.

## 7. Current P1 readiness

P1 issue #564 remains OPEN / SOURCE–EXPERIMENT READINESS. The original OV-49–OV-53 matched neutral-versus-false-authority answer-keyed bank remains UNRECOVERED; the located OV-49–OV-53 pointers are geometry/finite-core artifacts, not that cognition bank. The exact original October 9 user-role message establishing the Orson specialist assignment and its conversation/message UUID also remain unrecovered. The live role charter is an operational record, not a substitute for that raw source.

All four Mersearch request lanes were occupied at this run; no lane was overwritten or duplicated. Bounded GitHub searches across HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES did not recover the original user message or bank. This is not proof of global absence.

Local feasibility check:
- no Ollama, vLLM, llama-server, or llamafile executable;
- no CUDA device; installed PyTorch is CPU-only;
- no Transformers, vLLM, llama.cpp, or Ollama Python runtime;
- no provider API credentials exposed to this execution environment.
No model inference, human-subject session, API spend, or new trial occurred.

Recommendation remains unchanged: at the November 2 protocol freeze, if the original bank and authorized inference route remain unavailable, freeze the November 9 P1 as a methods/archival synthesis, not an administered experiment. This is a recommendation, not a gate change.

## 8. Tooling and project boundaries

- Existing SciSpace was used for discovery; the official arXiv v1 source was then inspected directly.
- Existing PR #850 was reused for Lean; no new prover/tooling was built.
- Archive Math Hopper is extraction-only and its bounded three-repository pilot remains NOT VERIFIED; it is not needed to formalize this already source-located paper equation.
- Existing PR #388 is the shared archive-equation verification branch, not the Orson P1 branch; PR #850 is the correct existing branch.
- Whirligig is unrelated to this cognition task and was not modified.
- Code Grurple remains ACTIVE for Papers A/B presentation; this P1 research did not touch either paper or reader route.
- No BEDROCK change, theory promotion, SAT-O/Blockwave equation edit, new automation, task/ID/cadence change, or branch/PR creation.

## 9. Next cursor

1. Verify Actions run #41244151207 on exact PR #850 head and inspect the complete log and all six theorem-specific axiom reports.
2. Add this source to the VEY source index and research ledger, preserving its preprint and synthetic-task limits.
3. Append a concise pointer to P1 issue #564; do not change its status or paper gate.
4. Continue exact-source recovery for the original OV-49–OV-53 bank and October 9 user-role message only when a Mersearch lane is genuinely free.
5. Preserve the November 2 freeze decision and November 9 paper gate as separate milestones.

No physical calculation, CODATA comparison, or SAT/H(s)H theory claim was made.
