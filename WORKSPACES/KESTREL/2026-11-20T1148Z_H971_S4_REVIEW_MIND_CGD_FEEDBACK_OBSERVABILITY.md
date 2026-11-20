# Kestrel h971:s4 | Review-MIND: CGD verifier feedback observability

**Nominal slot:** 2026-11-20T11:48Z  
**Selected label:** Kestrel (ring index 14)  
**Immediate successor:** Meridian (ring index 15)  
**Attribution:** assistant-level, source-grounded reconstruction; no authenticated current Kestrel thread  
**Status:** SOURCE_PIN_VERIFIED / FEEDBACK_OBSERVABILITY_GAP_IDENTIFIED / EXISTING_LEAN_MERGE_REF_BUILD_ONLY / NO_EXPERIMENT / ORSON_P1_UNCHANGED

## Executive result

A version-pinned read of ConsistencyBench `src/evaluate.py` exposes three distinct verifier-path risks:

1. **Failure-state collapse:** after both model-call attempts fail, the helper returns `[ERROR]`; the contradiction parser maps that string to the same `False` branch as a non-contradiction result.
2. **Substring acceptance:** the prompt requests one exact token, but the parser accepts any response containing `CONTRADICTORY`, including negated or uncertain phrases.
3. **Split-state feedback:** the history stores the revised final answer alongside the original raw response; subsequent consistency checks consume the original raw response, not the revised answer.

The checker also sees only the first 500 characters of each response, without the question or premise fields, and uses one fixed GPT-4o-mini evaluator across model families. These are source-level properties and possible failure modes, not observed failures in archived runs or measured effects.

This is a bounded Kestrel cross-boundary synthesis under the Review-MIND overlay. It does not replace Orson's ownership of P1, alter the P1 manuscript, or constitute a new P1 paper contribution.

## 1. Historical role and scope boundary

The historical Kestrel source conversation is `6ab070ce-2384-83e9-b76f-4661c55867c4`, raw export blob `100267f3f11f3cce09c7d802ce85ad03879d5744`. The direct-user material supports a trust-first, cross-boundary companion role, not primary-auditor or proof-owner status. No standalone signed Nathan-authored Kestrel specialist charter was recovered.

The Review-MIND instruction is treated as a bounded overlay: investigate concrete cross-lane questions, preserve responsible ownership, and avoid broad repeated audits. The historical source conversation is not a live thread. No current authenticated Kestrel thread, direct-thread delivery, consumption, or acknowledgment is claimed.

## 2. Primary source custody

**Upstream source**

- Repository: `aayambansal/ConsistencyBench`
- Commit: `bfc676baa848c7f1715bb73aee148180de15516e`
- Path: `src/evaluate.py`
- Git blob: `0453540cb7c19227601e59fb342fa93e736da849`
- Inspected source ranges: lines 137–177 and 238–325
- [Pinned source, call/retry path](https://github.com/aayambansal/ConsistencyBench/blob/bfc676baa848c7f1715bb73aee148180de15516e/src/evaluate.py#L137-L177)
- [Pinned source, CGD and contradiction-checker path](https://github.com/aayambansal/ConsistencyBench/blob/bfc676baa848c7f1715bb73aee148180de15516e/src/evaluate.py#L238-L325)

The fetched file's Git blob matches the source pin in Orson's existing formalization. This is a source read, not a replay of the benchmark or its archived model calls.

## 3. Source-level findings

### 3.1 Failed checker calls become “no contradiction”

`call_model` retries once. If the retry also raises, it returns the literal `[ERROR]`. `NLIContradictionChecker` then evaluates:

`"CONTRADICTORY" in response.upper() if response else False`

For `[ERROR]`, the result is `False`. The caller stores a Boolean `contradiction_detected`, so a checker outage can enter the same non-contradiction branch as a valid `CONSISTENT` response.

This does **not** prove that any archived call failed. It establishes that the source does not preserve checker failure as a distinct result state.

### 3.2 The parser does not enforce the requested exact token

The prompt asks the checker to answer only `CONTRADICTORY` or `CONSISTENT`. The parser instead searches for the substring `CONTRADICTORY` anywhere in the returned text.

Consequently, the pinned parser returns true for constructed strings such as `NOT CONTRADICTORY` and `I CANNOT DETERMINE WHETHER THESE RESPONSES ARE CONTRADICTORY`. The existing Lean source abstraction contains these deterministic examples. They are parser counterexamples, not observed judge outputs.

### 3.3 Repair and subsequent checking use different representations

`evaluate_cgd` calls the checker with `prev_raw` and the current `raw_response`. When a contradiction is flagged, the repair prompt receives the previous question, previous extracted final answer, premise relationship, and current question. It does not receive the current first-pass raw response.

After revision, the history appends `(question, final_answer, raw_response)`: the revised final answer is stored, but the original raw response remains the future checker input. The next checker therefore evaluates the pre-revision raw response, not the revised answer.

This may be an intentional policy to preserve first-pass evidence. If so, the source should label the two states explicitly. As written, “prior answer” can refer to different representations in the repair and checker paths.

### 3.4 Context and audit trace are incomplete

The checker receives only the first 500 characters of each response. Its prompt does not include the question or premise fields, although it describes contradiction in terms of the same premises. Whether the response text itself supplies enough context is unmeasured.

The archived result record stores the initial response, initial extracted answer, contradiction flag, revision response, final extracted answer, and reasoning reference. It does not store the triggering pair, raw judge prompt, or raw judge output. The existing Lean abstraction demonstrates that distinct full traces can share the same archived result projection while having different trigger pairs. That is a schema-level non-identifiability result, not evidence that a particular archived row had multiple actual triggers.

### 3.5 The evaluator is a shared dependency

The checker uses the fixed model identifier `openrouter/openai/gpt-4o-mini`, with temperature 0 and a 10-token limit, across evaluated model families. Thus the verifier is a common intermediary. Model-family diversity does not make the checker judgments independent; shared evaluator error remains a possible common-cause dependency. No error-correlation estimate was calculated here.

## 4. Structural synthesis and formal boundary

Let the source-derived pair context be

\[
x=(q_p,\,p,\,q_c,\,a_f,\,r_p,\,r_c),
\]

where \(q_p\) is the previous question, \(p\) the premise, \(q_c\) the current question, \(a_f\) the previous final answer, and \(r_p,r_c\) the previous and current raw responses.

The checker projection is

\[
C(x)=\bigl(\operatorname{prefix}_{500}(r_p),
           \operatorname{prefix}_{500}(r_c)\bigr),
\]

while the repair projection is

\[
R(x)=(q_p,a_f,p,q_c).
\]

A revision update \(U_f\) changes \(a_f\) to \(f\) but leaves \(r_p\) unchanged. Therefore, in this abstraction,

\[
C(U_f(x))=C(x),
\]

even when

\[
R(U_f(x))\ne R(x).
\]

The checker view is blind to that revision. A subsequent verifier pass can evaluate the repair only if the repaired evidence is included in its input, or if a separate post-repair readout is added.

This is an application of the generic fiber/factorization criterion already formalized in Kestrel PR #873: a target property can be recovered through a projection only when it is constant on that projection's fibers. The shared mathematical form does not make the cognitive workflow physically equivalent to any H(s)H geometric construction.

### Existing Lean evidence

- [Kestrel PR #873](https://github.com/Satobloc/HsH/pull/873), head `94b6d96c91806a95505260a3c52220f4af294185`: exact-head Actions run [#44090154878](https://github.com/Satobloc/HsH/actions/runs/44090154878) succeeded, 8,956 build jobs. This verifies the generic fiber-factorization criterion on that PR head; it does not instantiate the ConsistencyBench source map or establish physical equivalence.
- [Orson PR #850](https://github.com/Satobloc/HsH/pull/850), current head `6b4eebeacf4f6928f18601626e4e9e3942d73d81`: latest inspected run [#44416543286](https://github.com/Satobloc/HsH/actions/runs/44416543286) built the synthetic PR merge reference, not the exact PR head. The 8,991-job build succeeded and compiled `OrsonCGDProjectionGate` at job 8,930/8,991. The inspected log contains no `sorryAx` or `admit`; theorem outputs include standard dependencies such as `propext`, `Classical.choice`, and `Quot.sound`. Tests, lint, nanoda, and global axiom audit were skipped. This is merge-reference build evidence, not exact-head verification.
- The Orson module formalizes the checker/repair projections, the unchanged checker view after revision, the parser examples, and the archived-result/trigger-pair non-identifiability. Lean checks those formalized statements only; it does not establish that the translation is complete, that archived calls followed the pinned source, or that any performance effect occurred.
- Kestrel PR #2143's exact-head run [#44649028244](https://github.com/Satobloc/HsH/actions/runs/44649028244) remains failed on parser errors. No repair or retry was attempted.

No new Lean module, proof, or build was created. The source-derived abstraction already exists, while exact-head verification of Orson's current PR remains outstanding.

## 5. Disconfirming validation proposal

A useful next study would use the exact pinned source and actual versioned benchmark inputs, with complete per-call traces. It should compare:

1. original-raw history versus revised-final history;
2. strict exact-token parsing versus the current substring parser;
3. typed checker failure versus the current Boolean fallback;
4. 500-character truncation versus a context-preserving checker input;
5. the shared evaluator versus an independently adjudicated reference.

Record the exact question and premise, initial raw response, checker input, checker prompt and output, provider request/status, trigger pair, repair prompt and output, final answer, and the representation carried into the next iteration. Blind adjudicators to condition. Measure false contradiction flags, missed contradictions, error-to-no-contradiction collapse, repair retention, and recurrence separately.

This is a proposal only. No new model calls, benchmark replay, human-subject session, or archived-data reanalysis was performed. Raw provider call logs and complete trigger-pair evidence were not acquired. Any human/LLM group extension requires consent and privacy controls.

## 6. Non-displacing recommendations

For a future owner-led revision, consider:

- replace the Boolean checker result with explicit states such as `CONTRADICTION`, `NO_CONTRADICTION`, `CHECKER_ERROR`, and `MALFORMED_RESPONSE`;
- parse only exact allowed tokens and reject all other strings;
- make question/premise context and truncation status explicit in the checker input;
- preserve initial raw response, revision raw response, revised final answer, and the history policy as separate fields;
- archive the triggering pair, exact judge prompt/output, model identifier, parameters, provider request/status, and timestamps;
- treat the fixed evaluator as a shared dependency in any model-family independence analysis.

These are recommendations, not code changes. Orson retains sole P1 ownership. No PR, branch, task graph, manuscript, dataset, protocol, or paper gate was modified.

## 7. Epistemic status

**Established from pinned source:** retry-to-error sentinel; Boolean substring parser; 500-character truncation; omitted question/premise fields in checker prompt; original-raw versus revised-final history split; shared evaluator identifier; result-record omissions.

**Established only in the existing formalized abstraction:** checker-view invariance under revision; parser behavior on constructed strings; non-identifiability of trigger pair from the logged projection.

**Not established:** occurrence frequency in archived runs; actual provider failures; actual false-positive judge outputs; effect on benchmark scores; independent evaluator performance; causal effects on model behavior.

No measured physical system, physical dataset, units, uncertainties, fit, prediction, or independent measurement was involved. No H(s)H/SAT theory claim or BEDROCK promotion is made.
