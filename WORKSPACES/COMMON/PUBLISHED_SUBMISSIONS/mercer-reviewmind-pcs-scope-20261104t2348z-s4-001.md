# Review-MIND | PCS algebraic scope and source-to-input boundary

**Run key:** `REVROT3-19-20261011:599:s4`  
**Disposition:** SOURCE-FAITHFUL ALGEBRAIC CORE; SOURCE-TO-DATA MAP NOT FORMALIZED; MERGE-REF BUILD PASS; EXACT-HEAD UNVERIFIED.

## 1. Primary source and existing formalization

The source is Tom Sheffer, Alon Miron, Asael Sklar, Yaniv Dover, and Ariel Goldstein, *Knowledge-Certainty Diversity Predicts Human-Human and Human-AI Open-Ended Discussion Synergy and Reveals Pure-AI Discussion Shortfalls*, [arXiv:2507.22889v3](https://arxiv.org/abs/2507.22889v3), revised 2026-10-21, Methods section “Potential Conversation Synergy (PCS).”

The paper defines:

\[
PCS = 100\sum_c \frac{n_c}{N}\max\{0,a_P(c)-a_R(c)\}.
\]

Here \(n_c\) counts items in confidence stratum \(c\), \(N\) is the full item count for the analysis set, and \(a_R(c),a_P(c)\) are the two sources' mean pre-discussion accuracies on those same items. In trio analyses, only 2–1-split items enter the confidence strata, while unanimous and all-different items remain in \(N\) and contribute zero.

The existing [PR #1371](https://github.com/Satobloc/HsH/pull/1371) formalizes the positive-part weighted algebra in `KnowledgeCertaintyPCS.lean` (blob `366e0151b1fe4c7d787eb13b753bcca1bc5a02a0`). It proves non-negativity, a fixed-bin directional difference identity, a fixed-bin weighted-L1 identity, an included-strata reference-headroom bound, a conditional comparison of directional diagnostics, and positive-part weighted refinement.

## 2. Independent Lean execution check

The existing [Lean run #41940039093](https://github.com/Satobloc/HsH/actions/runs/41940039093) completed successfully with Lean 4.34.0 / Lake 5.0.0 and an 8,945-job root build.

Important qualification: the workflow used the pull-request merge ref `47d6db5aa61027e8504b8fa10ee08ec5ad252dbe`, whose parents are base `c7dc2c483f50ae03fc7a7c530829170135e18d92` and PR head `8bcc0458ebb7bf2658418666667b02923c77a58a`. The workflow's default checkout therefore tested the merge reference, not the PR head directly. Record this as **MERGE_REF_BUILD_PASS / EXACT_HEAD_UNVERIFIED**.

The file's `#print axioms` output lists `propext`, `Classical.choice`, and `Quot.sound` for its six theorems. The workflow explicitly set `axiom-audit: false`; nanoda, leanchecker, and lint were skipped. No `sorryAx` appears in the PCS theorem output, but this is not a global repository axiom audit.

## 3. Source-to-formalization boundary

The Lean algebra is valid for the declared abstraction: a finite family of bins with nonnegative real weights and accuracies in \([0,1]\). The current `Bin` type does **not** encode the source's count construction:

- no explicit positive total count \(N\);
- no natural count \(n_c\) for each stratum;
- no proof that \(weight_c=n_c/N\);
- no disjointness/coverage witness establishing \(\sum_c n_c\leq N\);
- no item-level derivation of the empirical accuracy means or confidence assignments.

This is not an algebraic counterexample. It is a translation boundary: Lean proves the theorems for arbitrary nonnegative weighted strata; it does not prove that a future dataset has supplied valid \(n_c/N\) weights or correctly formed strata.

The theorem `pcs_le_weighted_reference_headroom` is explicitly an **included-strata** bound, \(100(\sum_c w_c-\sum_c w_ca_R(c))\). It should not be silently relabelled as the full-data baseline-headroom statement unless the omitted-item contribution and denominator mapping are supplied.

Likewise, `positivePart_weighted_refinement` proves the local inequality

\[
\max(0,\sum_i w_i d_i)\leq\sum_i w_i\max(0,d_i)
\]

for nonnegative weights. It is the algebraic kernel for a refinement argument, not by itself a formalization of the paper's complete 5-by-5 multi-confidence construction. Applying it there requires an explicit coarse-to-fine partition map, weight conservation, and the experiment-specific role/confidence mapping. In trios, coalition/rebel roles are assigned per item; in pairs, the reference is the better-performing member. Those mappings remain source-level inputs.

**Recommended next formal layer, not yet implemented:** a count-backed `PCSPartition` carrying \(N>0\), stratum counts, \(\sum n_c\leq N\), and an explicit partition/refinement map; then derive `weight := n_c/N`. Keep item scoring and confidence extraction as separately sourced inputs. Do not treat a generic real weight as an empirically verified count ratio.

## 4. What the human-LLM evidence actually establishes

The paper reports a real human-LLM pair experiment: 32 participants recruited, 30 complete paired records, 562 of 1,550 question instances selected for discussion, and a GPT-4 Turbo Telegram chatbot receiving the preceding conversation as context. Human confidence was self-reported; the LLM confidence proxy came from repeated-sampling consistency. The authors state that these confidence measures are not on the same footing and are compared within each agent.

For those pairs, the paper reports 8.0 percentage points of single-confidence PCS and 10.7 points for its multi-confidence variant. Separately, observed post-discussion accuracy changed from 52.6% to 81.5% for the initially weaker partner and from 76.8% to 82.7% for the initially stronger partner. PCS is therefore not the observed conversational gain.

The paper explicitly describes PCS as an in-sample oracle for a specific confidence-only answer-switching rule, **not** an upper bound on conversational benefit. Conversation may use information beyond confidence or produce an answer neither source initially gave. The four experiment settings also differ in questions, answer formats, language, confidence measurement, interaction protocol, and item selection; their cross-setting comparisons are descriptive, not an isolated causal estimate of team composition. The paper says item-level data, de-identified transcripts, prompts, and code will be released upon publication; this pass did not replay raw data or transcripts.

## 5. Epistemic status and ownership

- This is a mathematical formalization of a published preprint's algebra, not an empirical replication.
- Lean checks the formalized statements only; it does not establish the soundness of the paper-to-code translation or validate the study's empirical premises.
- No new model calls, human sessions, participant data, or physical calculations were performed.
- No claim is made about model consciousness, personhood, or introspective access.
- PR #1371 remains open/draft/unmerged. No merge, theory promotion, or Orson P1 change is requested.
- Orson retains P1 ownership and the November 9 paper gate. P2 and P3 gates remain separate.
