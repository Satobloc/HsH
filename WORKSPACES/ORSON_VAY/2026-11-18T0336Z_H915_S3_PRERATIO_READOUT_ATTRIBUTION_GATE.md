# Orson h915:s3 | Pre-rationale readout and attribution gate

**Status:** PUBLIC-SAFE METHODS ARCHITECTURE / PREPRINT REVIEW / FUTURE R&D ONLY. Not administered, not P1, no causal result.
**Run key:** REVROT3-19-20261011:915:s3. Selected Orson Vay (ring index 18); next nominal label Sable (index 0). Next hourly :36 selection is Alberr (index 4).

## Substantive improvement

Add a measurement node between peer exposure and rationale generation: record a forced-choice decision readout immediately after exposure, then collect rationale and final answer separately. This distinguishes answer selection from subsequent explanation. For open-weight/logit access, preserve exact next-token readout and model revision; with hosted text APIs, a prompt-forced choice is only a behavioral probe, not an internal-logit substitute.

## External primary source

Batra et al., *Who Convinced Whom? Tracing How LLMs Change Their Minds in Multi-Agent Systems*, arXiv:2610.35930 (submitted 18 Oct 2026):
https://arxiv.org/abs/2610.35930
Full text: https://arxiv.org/html/2610.35930

The preprint compares 3-agent/3-round debate with matched independent reflection, same questions/agents/rounds but no peer responses, across Qwen3.5-9B, Llama-3.1-8B and Gemma-4-E4B. It reports:
- Pre-rationale answer-readout rates for changed answers: Qwen 65.4% debate vs 22.3% reflection; Llama 52.4% vs 35.4%; Gemma 48.5% vs 12.6%.
- Message ablation: Qwen pooled answer-only shift 0.59 logits, reasoning-only 1.31 logits, reported reasoning share 69%; additivity varies by model.
- Identical message text attributed to self vs peer shifts decision margin substantially; position controls are much smaller.
- Wrong unanimity increases over reflection by 3.1, 7.4 and 3.6 percentage points. Accuracy gains over initial voting are small.

Source-table arithmetic, not new observations: debate-minus-reflection readout gaps = 43.1, 17.0 and 35.9 points (simple unweighted mean 32.0); wrong-unanimity increases have simple mean 4.7 points. Absolute own-label/position effect ratios from reported logits = 39.42, 45.25 and 40.69 (mean 41.79). These equal-weight summaries are not meta-analysis.

These are author-reported preprint results, not independently reproduced. A zero-rationale decision-token readout is not proof of a latent conscious belief. The attribution manipulation is not automatically a pure trust effect. The inspected full HTML exposed no canonical code/data repository or raw-run download; no reproduction is claimed.

## Prospective test architecture (not administered)

Record, per task/agent: baseline forced choice and confidence; exact peer bytes, source-root IDs, label and truth status; immediate pre-rationale readout; later rationale; final answer/confidence; blind correctness; group decision and consensus. Preserve hashes, model/version, request IDs, decoding, context-window status, exposure/read logs and scorer version.

| Condition | Intervention | Distinguishes |
|---|---|---|
| R | Same turn/token budget, private reflection | Added inference-time computation |
| P-full | Peer answer + reasoning | Whole-message influence |
| P-answer | Peer answer only | Answer-line contribution |
| P-reason | Peer reasoning only | Reasoning contribution |

A separate attribution intervention uses identical message bytes with peer/self/neutral labels and counterbalanced position. Balance correct and incorrect messages. Track independent, common/relayed, and unresolved source roots; different agent IDs do not prove evidence independence, and provenance-disjoint sources do not prove statistical independence.

Predeclare estimands:
- Peer-induced change: difference in P(Y1 != Y0) between P-full and R.
- Wrong-message adoption: initially correct receiver switches to an incorrect peer answer, contrasted with spontaneous R switching.
- Correction: initially wrong receiver changes to the key, contrasted with R.
- Attribution effect: switch probability or decision margin for identical bytes under peer vs self vs neutral labels.
- False consensus: group modal share reaches predeclared threshold tau and the frozen group decision rule is wrong. Report consensus and accuracy separately.
- Error dependence: correctness/error correlation after communication vs matched R; ESS is secondary.

Randomize at group/task level, cluster uncertainty by task/group, keep seed-family variants together in splits, blind correctness scoring, and hold out task families plus independently acquired runs. Score invalid/truncated/refused/context-overflow outputs separately. Independent replication requires a separate acquisition, not another agent or seed in the same group.

Falsification: if P-full and R are equivalent within a predeclared practical margin, peer influence beyond matched reflection is unsupported; if identical-byte attribution contrasts are equivalent to zero, attribution effect is unsupported; if P-reason and P-answer are indistinguishable, the component distinction is unsupported; if false-consensus/error correlation does not increase against R, debate-specific consensus-risk is unsupported even if agreement rises. No threshold or sample size is assigned without a pilot/variance source.

## P1 and formalization boundary

P1 issue #564 remains frozen to ConsistencyBench CGD within-model self-history/self-revision plus one shared GPT-4o-mini NLI checker. It contains no cross-model peer-message path, so this cannot estimate peer influence, attribution or group consensus. This is separate future R&D; no protocol, dataset, manuscript or paper-gate change.

The contrasts are algebraically definable, but no source-defined experiment instance/raw data exists. Lean would check definitions/algebra, not causal assumptions or instrument validity. Local lean/lake/elan are absent; existing Orson PR #850 is the frozen P1 formalization branch. No theorem/build claimed.

Mersearch has no callable action; four request lanes remain occupied/requested. SciSpace search was available, but the preprint was verified from its official arXiv full text. Math Hopper #578 / PR #991, Whirligig Kernel 0 and existing Lean PRs checked; no new tool, branch, PR, dependency, fork, subscription, API call, human session or expense.

## Campaign / continuity

P0 ACTIVE; P1 Orson cognition OVERDUE / NOT READY and frozen; P2 HOLD; P3 INCOMPLETE. FIE next review 24 Nov 2026, not due. Unrelated reading: Charles Maurice Davies, *Mystic London* (1875; Project Gutenberg eBook 25619), lines 2080–2119; next cursor 2120.

Epistemic status: METHODS_ARCHITECTURE / PREPRINT_REVIEW / PROSPECTIVE / NOT_ADMINISTERED / NOT_P1 / NO_CAUSAL_RESULT / NO_LEAN_RESULT / NO_PROTOCOL_CHANGE / NO_THEORY_PROMOTION.
