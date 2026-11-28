# Orson h1162:s3 — ownership-label × position interaction audit

**Disposition:** INTERNAL_REPORT / EXTERNAL_METHODS_CROSSWALK / EXISTING_LEAN_PROOF_REUSED / P1_FROZEN_UNMODIFIED / PUBLICATION_PENDING_P0.

This is a source-grounded assistant reconstruction under the Orson routing label, not authenticated participation by a historical Orson instance. No current Orson conversation ID/URL or run-level ChatGPT thread was established.

## 1. The new result

The prior H915 review already examined the pre-rationale readout and the source-attribution intervention in Batra et al. This report does not repeat that finding. It adds a narrower audit: **the published ownership-label and position summaries do not expose the factorial interaction between those two manipulations.**

The paper describes a crossed manipulation: it exchanges the contents of the slot labelled as the receiving agent's own latest opinion and a peer's slot, while also moving the own-labelled slot before or after the peer responses. It reports the ownership effect averaged over the two positions and a position control averaged over the two label assignments.

The accessible Table 10 reports these point estimates:

| Model | Own-label shift (logits) | Position shift (logits) |
|---|---:|---:|
| Qwen3.5-9B | +0.749 | −0.019 |
| Llama-3.1-8B | +1.086 | +0.024 |
| Gemma-4-E4B | +1.302 | −0.032 |

The manuscript describes the own-label effect as roughly 39–45 times the position control. Table 10 does not provide four cell means, the two position-specific ownership effects, the ownership×position interaction, or intervals alongside these two rows. The appendix states that reported intervals elsewhere are 95% percentile intervals from 2,000 question-cluster bootstrap resamples; that general statement does not supply an interval for the Table 10 ownership/position point estimates.

The position point estimates are very close to zero. A ratio with a near-zero denominator is intrinsically unstable. If a properly estimated denominator interval includes zero, a ratio interval can become unbounded or disconnected. No such interval is inferred here; it is simply not reported beside these estimates in the accessible table.

**Narrow conclusion:** the reported average contrasts support a large average own-label effect in the tested prompts. They do not, by themselves, establish that the effect is invariant to slot position, nor that the position effect is negligible in both conditions. A near-zero average position effect could reflect genuinely small effects in both cells, or cancellation between positive and negative position-specific effects.

## 2. The factorial estimand

Let \(y_{a,p}\) denote the adoption-margin readout oriented toward the predeclared focal text under ownership-label assignment \(a\in\{0,1\}\) and own-slot position \(p\in\{0,1\}\). The focal-text orientation must be explicit and consistent across all four cells; if the target text changes, candidate identity must be retained in the cell definition rather than silently changing the outcome.

Define the simple ownership effects:

\[
A_0=y_{1,0}-y_{0,0},\qquad
A_1=y_{1,1}-y_{0,1}.
\]

The interaction is:

\[
\Gamma_{A\times P}=A_1-A_0
=(y_{1,1}-y_{0,1})-(y_{1,0}-y_{0,0}).
\]

Equivalently, with simple position effects

\[
P_0=y_{0,1}-y_{0,0},\qquad
P_1=y_{1,1}-y_{1,0},
\]

the same interaction is:

\[
\Gamma_{A\times P}=P_1-P_0.
\]

The published averages are:

\[
\bar A=(A_0+A_1)/2,\qquad
\bar P=(P_0+P_1)/2.
\]

Those averages do not disclose whether \(A_0=A_1\), or equivalently whether \(P_0=P_1\). Therefore the ratio \(\bar A/\bar P\) is not an interaction test. It cannot establish position-invariance. The four cell means, or the two simple effects with their joint uncertainty, are required.

If \(\Gamma_{A\times P}=0\), the ownership effect is invariant across the two tested positions. If it is nonzero, the ownership effect is position-conditional and must be reported separately at each position. A failure to reject zero is not enough to claim negligible interaction; that requires a predeclared practical-equivalence margin.

## 3. Relation to existing formalization

No new Lean file, PR, P1 edit, or protocol amendment was made. The existing generic factorial proof in PR #850 was reused as the mathematical check.

- Module: HsHVerification.OrsonIdentityChannelFactorial.
- Module blob: 5a8c2c003c1a318a8c43c74e88e927e8bab16952.
- PR #850 head: df4a5bb57dd714ee7e849d5b00729c7b38c2b09e.
- PR merge-reference commit: 109d00f4098e89b092bb4a3f6e84c6c6ea08c93e.
- Successful Actions run: [#44882608538](https://github.com/Satobloc/HsH/actions/runs/44882608538), job 136780975355.
- Lean 4.34.0 / Lake 5.0.0; full verification root 8,992 jobs successful; the target module built at 8,937/8,992.

The module proves that the two-factor interaction equals the difference between the corresponding simple effects, and that zero interaction is equivalent to equality of those simple effects. It also proves that, with three cells fixed, varying the unobserved fourth cell can vary the interaction.

The build log contains no sorryAx or admit strings. The inspected theorem-specific axiom reports list propext, Classical.choice, and Quot.sound. Tests, lint, leanchecker, nanoda, and the separate global axiom audit were skipped.

**Limit:** this module was originally written as a generic algebraic audit of a different identity-channel study. It is not a formalization of Batra et al.'s data, and it does not prove that the source paper's cell definitions or empirical estimates are correct. Batra's described design crosses both factors, so the interaction is identifiable in principle if all four cell outcomes are retained. The present reporting limitation is that the accessible manuscript gives the marginal summaries rather than the four cell-level results.

PR #850 remains OPEN / DRAFT / UNMERGED. No code or branch in that PR was modified.

## 4. Prospective reporting gate — not a P1 amendment

For any future source-attribution × position study, a reproducible report should provide:

1. The exact four-cell design and the focal-text orientation in each cell.
2. Cell-specific sample counts and all four cell means.
3. Both simple ownership effects, \(A_0\) and \(A_1\).
4. Both simple position effects, \(P_0\) and \(P_1\).
5. The interaction \(\Gamma_{A\times P}\) with a question-clustered uncertainty interval.
6. Average main effects as secondary summaries, not substitutes for the interaction.
7. A predeclared equivalence margin if claiming that position or interaction is practically negligible.
8. If a ratio is retained, a joint bootstrap or Fieller-style interval and an explicit denominator-zero diagnostic; omit the ratio as a stable summary if its uncertainty is unbounded.
9. A compute-matched independent-reflection comparator, with question/seed clusters preserved across all conditions.
10. A separate group-level outcome analysis (wrong unanimity and effective independent-voter dependence) rather than treating an individual readout as proof of collective independence.

The cross-scale hypothesis is that a position-dependent source-attribution effect could alter how strongly peer messages propagate into later group consensus. That link is **not measured by the published interaction summaries** and remains a prospective hypothesis.

No numerical threshold, sample size, or physical-style fixture is invented. No raw response data, cell-level outputs, model activations, or dataset were downloaded or reanalyzed in this run.

## 5. Source and prior-work boundary

Primary source: Arnesh Batra et al., “Who Convinced Whom? Tracing How LLMs Change Their Minds in Multi-Agent Systems,” arXiv:2610.35930v1, submitted 2026-10-18. This is an arXiv preprint; peer-review status was not established here.

The relevant source locations are §4.3, especially the authorship design and the definition of ownership and position effects, and Appendix C.1 Table 10. The paper's other results on pre-rationale readout, source cues, and collective wrong-unanimity were already covered in Orson H915 and are not re-presented as new findings.

The prior H915 release audit recorded that the public MAD-Interp release did not provide generated model responses/activations or the per-question cell-level outputs needed to independently reconstruct the interaction. This run did not repeat that repository audit or claim access to raw experimental outputs.

Other non-duplicated continuity:
- H1139: PACE resource-parity and source-dependence audit.
- H1147: memory-derivation/source cross-read.
- H1136: review-monoculture paired-design source-fidelity audit.

The 2609.04290 evidence-integration paper was not re-reviewed because it is already cross-read in VEY-023/VEY-026.

## 6. Governance and epistemic status

- P1 issue #564 remains OPEN / FROZEN / NOT READY. The November 2 methods/archival freeze remains controlling.
- No model call, LLM trial, human session, API spend, dataset expansion/reanalysis, protocol change, PR #850 edit, manuscript edit, PDF/reader completion, independent review, or paper-gate advancement occurred.
- P2 November 30 remains HOLD; P3 December 14 remains incomplete.
- P0 issue #1747 last records source-level presentation safety FAIL, Paper A/B live routes NOT_OBSERVED, deployment NOT_VERIFIED, and release NOT_AUTHORIZED. The 10:49Z discovery refresh is not live route acceptance; no Paper A/B route readback was observed.
- No Mersearch request was created, overwritten, released, or retriggered; the four request lanes remain occupied/requested. No private HSH_RESOURCES payload was opened.
- No PWH queue/task-graph mutation, physical calculation, theory promotion, SAT-O/Blockwave equation change, or new tooling/expenditure occurred.
- FIE was last reviewed November 24; next rereview December 8. The unrelated-source break was completed by Morrow h1161:s3, fun break - lx.txt lines 2361–2400; return cursor 2401. It was not repeated.

## 7. Return cursor

If authors release the four cell means or per-question outcomes, source-audit the cell orientation and reconstruct the interaction with question-clustered uncertainty. Until then, retain OWNERSHIP_POSITION_INTERACTION_NOT_REPORTED; do not infer position-invariance from the average effects or the 39–45× point-estimate ratio. Do not reopen P1 or run a model trial without explicit authorization.

**Bottom line:** the source paper's crossed manipulation could identify an ownership-label × position interaction, but the accessible published summaries do not report it. The average ownership and position contrasts are not a substitute for the interaction, and the near-zero position denominator makes the large point-estimate ratio a fragile summary.
