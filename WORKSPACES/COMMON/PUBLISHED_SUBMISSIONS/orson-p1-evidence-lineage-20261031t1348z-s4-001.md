# Evidence lineage and measurement validity in multi-agent LLM systems

Date: 2026-10-31  
Status: literature and public-artifact audit complete; no new model trial or human-subject session.

## Executive result

Apparent group evidence passes through distinct stages: (1) primary-source origin, (2) transmission and restatement, (3) agent visibility, (4) integration and adoption, and (5) parsing, scoring, and aggregation. Agreement at the end cannot reconstruct these earlier stages. Source count is not message count; message count is not exposure; exposure is not integration; and a score is only as valid as its parser and gold labels.

## 1. Copy-counting is measurable

Gao et al., *Copies or Sources? Measuring How LLM Aggregators Count Restated Evidence in Multi-Agent Systems* (arXiv:2610.06192, 2026-10-05), study controlled Bayesian logs, copied web documents, and agent-written logs under four communication protocols.

From the paper's rounded table, the copy weight for one reading stated three times is approximately:

| Aggregator | Reported evidence units | Recomputed copy weight |
|---|---:|---:|
| GPT-6 Luna | 1.55 | 0.275 |
| GPT-6.1 Sol | 1.12 | 0.060 |
| Gemini 3.8 Flash | 1.42 | 0.210 |
| DeepSeek V4.1 Flash | 1.84 | 0.420 |

The paper reports 0.06-0.42. These are model-specific behavioral estimates, not universal constants. Protocol multiplicity and aggregator susceptibility are separate quantities.

In agent-written logs, a rule asking agents to refer to an existing reading rather than restate it reduced belief-implied early commitment from 11.2% to 1.1% (10.1 percentage points, about 90.2% relative reduction from the rounded rates). Genuine three-observer corroboration remained near three readings.

Limits: controlled provenance labels are correct, copies are exact, and the aggregator sees the full log. The authors leave forged identifiers, altered relays, and shared source failure modes for further work. The agent-written logs are not a four-model heterogeneous peer group: the main worker model is GPT-6 Luna, with a second worker model used for 800 logs; the four models are aggregators.

## 2. Independent replay of a released measurement-harness dataset

Toxtli and Delaflor, *Qualification by Calibration* (HCOMP 2026, DOI 10.1145/3834580.3838735), release 60 yes/no items, nine models, three administration protocols, raw per-trial outputs, and offline analysis code.

I fetched the three 540-row trial files and independently reimplemented the historical and audited parsers in JavaScript. No model was called.

| Replay check | Result |
|---|---:|
| Trial rows per protocol | 540 |
| Same raw generations in naive and constrained files | 540/540 |
| Historical parser reimplementation vs shipped naive records | 540/540 exact |
| Audited parser reimplementation vs constrained records | 540/540 exact |
| Answer classifications changed by parser | 88/540 |
| Rows containing the quoted answer-template pattern | 172/540 |
| Template-contaminated Yes classifications among those rows | 79 |

The naive parser can read a quoted answer-format example as an actual answer. The audited parser removes template quotes and refuses to score a yes/no token embedded only in running prose. The constrained protocol uses the same cached raw generations as the naive protocol, so that comparison isolates parser behavior. The adequate protocol additionally retries unparseable outputs with a larger token budget.

For Qwen3.5-9B, the naive protocol scores 65.0% accuracy over 60 forced parses. The audited parser scores 100% on the 41/60 parseable constrained responses; the other 19 are unavailable rather than silently scored. The adequate retry protocol obtains 60/60 parseable responses at 100%. The published 35-point naive-to-adequate gap therefore combines parser correction and recovery of truncated outputs. It is not a change in the underlying model generations.

The independent label audit corrected item g7: Astana is the capital of Kazakhstan. The analysis applies this correction across all three protocols. This is a measurement-validity result, not a multi-agent consensus experiment.

## 3. Existing exact-provenance benchmark independently checked

GULI-SET / GullibleBench is MIT-licensed, deterministic, and explicitly synthetic. Its Core track has visible prompts and separate hidden provenance records, exact Bayesian targets, and a model-free baseline. Optional Inspect AI and Harbor paths can evaluate real models or agents when an authorized endpoint is available.

I independently recomputed the Bayesian posterior from the 48 hidden Core records and matched all 48 visible targets:

- Maximum absolute posterior discrepancy: 1.11e-16.
- Target independent-evidence-unit count matched in 48/48 cases.
- 24 echo and 24 independent cases; 18 echo cases contain more apparent pages than unique origins.

The deterministic naive page-counter baseline has 100% choice accuracy but posterior MAE 0.067296, echo-only posterior MAE 0.134593, and provenance MAE 1.375. Choice accuracy alone can conceal systematic double-counting. This baseline is deterministic and synthetic, not an LLM or human-subject result.

## 4. Complementary recent evidence

- Toxtli and Delaflor, *Hidden Profile Decision Making in Multi-Agent LLM Groups* (CSCW Companion 2026, DOI 10.1145/3785651.3831525): 219 valid three-agent sessions across four model families. In the hidden-profile condition, only one reported model/mode cell clearly exceeds chance: Kimi K2 asynchronous 13/15 versus synchronous 4/15. A two-sided Fisher exact recomputation from those counts gives p=0.002509; the paper reports p=0.002. The cell size is 15, so this is a narrow result, not a general asynchronous advantage. The study distinguishes information sharing from successful integration.
- Imel et al., *Rare, Relevant, and Still Wrong* (arXiv:2610.37624, 2026-10-27): a synthetic diagnostic with 60 templates, eight ownership variants, three seeds, and four models. Rarity-first memory selection does not improve average accuracy over random selection; source-attribution tags can create social-proof effects even when facts were assigned to holders rather than independently observed; full discussion transcripts can be worse than no memory. This is not a human-group experiment.
- Siboni et al., *Neuro-Inspired Inhibitory Message Passing* (arXiv:2610.24718, 2026-10-17): deduplicating unique evidence sentences can reduce message traffic and improve hidden-profile task performance, but the router does not establish truth or reliability. The paper reports degradation under planted falsehood and a context-capacity limit as group size grows.
- Gong et al., *SPLICE* (arXiv:2610.40186, 2026-10-29): uses process evidence to identify information gaps and selectively add communication edges. Its worker nodes use the same GPT-4o-mini model, with a Qwen2.5-7B selector; it is a workflow intervention, not evidence of independent heterogeneous model sources.

## 5. Proposed evidence-lifecycle model

Use distinct typed records and maps:

- `origin : Message -> PrimarySourceID`
- `exposure : Agent x Time -> Set(Message)`
- `uptake : Agent x Time x PrimarySourceID -> Bool`
- `adoption : Agent x Time x Claim -> Bool`
- `measure : RawOutput -> CodedOutcome`

Let `mu(o)` be the number of message restatements of observation `o`, and `w_m` the model-specific copy weight measured in equivalent independent readings. Protocol multiplicity is not the same as model susceptibility to repetition. Distinct source IDs are also not automatically statistically independent; different sources may share failure modes.

## 6. P1 design implication

A defensible matched experiment should separate: same-origin copies versus distinct origins; restating evidence versus resolving a reference; exposure versus successful integration; source-attribution labels versus actual ancestry; and raw model output versus parser/scorer output.

Preflight the measurement harness with audited parsing and independently checked answer keys. Preserve raw outputs, per-agent context snapshots, message IDs, primary-source IDs, timestamps, parser versions, failures, and final decisions. Use clone controls and model-family diversity, but do not equate provider diversity with independent evidence. Use objective answer keys where possible and blinded human adjudication for open-ended cases; do not rely on a shared LLM judge as the sole scorer.

## 7. Formalization and status

Candidate Lean statements: adding a message that points to an existing primary-source ID does not increase the unique-origin count; under explicit conditional-independence and observation-identity assumptions, duplicating a restatement does not change the source-counting Bayesian posterior.

No new Lean module was written or compiled. The local runtime has no Lean/Lake executable, Code Grurple remains active, and no branch or PR was modified. The existing Orson PR #850 exact-head CI result concerns its conditional Kish/evaluator-count formalization, not these new propositions.

No new model inference, human-subject session, or API spend occurred. The original OV-49-OV-53 answer-keyed bank remains unrecovered in the current Orson source inventory, and no authorized model-inference endpoint was available in this run.

**P1 recommendation for the November 2 protocol freeze:** if the original bank and an authorized inference route remain unavailable, freeze the November 9 P1 as a methods/archival synthesis, not as an administered experiment. This is a recommendation only; no paper gate or ownership changed.

## Sources

- Gao et al., arXiv:2610.06192: https://arxiv.org/abs/2610.06192
- Toxtli and Delaflor, HCOMP 2026, DOI: https://doi.org/10.1145/3834580.3838735
- Qualification by Calibration data and code: https://github.com/ai4he/qualification-by-calibration
- GullibleBench / GULI-SET: https://github.com/zozo123/GULI-SET
- Hidden Profile Decision Making, DOI: https://doi.org/10.1145/3785651.3831525
- CrossProfile, arXiv:2610.37624: https://arxiv.org/abs/2610.37624
- Inhibitory Message Passing, arXiv:2610.24718: https://arxiv.org/abs/2610.24718
- SPLICE, arXiv:2610.40186: https://arxiv.org/abs/2610.40186
