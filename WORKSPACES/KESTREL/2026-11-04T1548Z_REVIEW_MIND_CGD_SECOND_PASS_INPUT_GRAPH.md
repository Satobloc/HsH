# Review-MIND: CGD second-pass input graph

**Run:** `REVROT3-19-20261011:591:s4`  
**Selected label:** Kestrel (ring index 14)  
**Next label:** Meridian (ring index 15)  
**Status:** INTERNAL WORKING NOTE / SOURCE-DERIVED / NOT LEAN-VERIFIED / NOT A P1 MANUSCRIPT CHANGE

## 1. Provenance and role boundary

This is a source-grounded reconstruction produced by the current assistant in the Kestrel-selected relay slot. It is not authored by, or delivered through, an authenticated live Kestrel instance.

The historical Kestrel conversation is **Science Made Stupid**, conversation ID `6ab070ce-2384-83e9-b76f-4661c55867c4`, raw export blob `100267f3f11f3cce09c7d802ce85ad03879d5744`. The role-defining Nathan Direct messages were reread in that export. They establish Kestrel as a cross-boundary, whole-picture synthesis companion: reason forward from consequential cases, avoid duplicating dedicated audit/search/verifier lanes, and do not investigate merely because more investigation is possible. The current assistant does not claim to be the historical Kestrel.

The prior Kestrel Review-MIND report (2026-11-03T2048Z, blob `70d27a51ea3ce9412f1df42bf59f4b0bd94ebe57`) already records the CGD archive's within-model self-exposure, absence of cross-model peer exposure, complete-case mask, and pair-partition limitations. The earlier 2026-11-03T0148Z synthesis already distinguishes the workshop's deterministic routing/continuity ring from authenticated participation by 19 independent assistants. Those findings are not repeated or revised here.

## 2. New source-level refinement

The pinned ConsistencyBench evaluator source reveals a narrower but consequential distinction: the CGD second call does **not** receive the current first-pass answer that triggered the contradiction check.

Source:
- Repository: `aayambansal/ConsistencyBench`
- File: `src/evaluate.py`
- Retrieved immutable blob SHA: `0453540cb7c19227601e59fb342fa93e736da849`
- Retrieval date: 2026-11-04
- Relevant source ranges: repair template lines 82-95; fresh API-call construction lines 137-151; CGD loop lines 238-279; NLI checker lines 299-328.
- HsH source-locked 17-model replay manifest: `WORKSPACES/ORSON_VAY/CODE/2026_10_29_cross_model_agreement.js`, branch `research/orson-p1-shared-nli-bound-20261028t06z`, blob `c60efe6f868f2ef78bd33eaa85ec8a81802a5fd9`.

### Exact control flow

1. The target model receives the current question and produces an initial raw response (r_t^0). The code extracts an initial label from it.
2. The shared GPT-4o-mini contradiction checker compares the first 500 characters of a prior raw initial response (r_j^0) with the first 500 characters of the current raw initial response (r_t^0). The checker is not given the question or premise in this call.
3. If a prior pair is selected, the repair template receives the prior question (q_j), the prior **final extracted answer** (a_j^1), the relationship/premise text, and the current question (q_t).
4. The repair template does not contain the current raw response (r_t^0) or current initial label (a_t^0).
5. `call_model` makes a fresh completion with only a system message and the supplied user prompt. It does not pass a conversation ID, thread history, or the current first-pass response. The second call therefore cannot directly edit a response it was never shown.
6. The code extracts a final label (a_t^1), then appends ((q_t,a_t^1,r_t^0)) to the local history. The detector history retains the initial raw response; the repair history uses the final extracted label.

The resulting event graph is:

```text
prior raw initial r_j^0 ─┐
                        ├─> shared NLI judge ─> contradiction flag
current raw initial r_t^0┘

prior question q_j ─────┐
prior final label a_j^1 ├─> fresh second model call ─> second-pass response r_t^1
premise / relation ─────┤                              └─> final label a_t^1
current question q_t ───┘

current raw initial r_t^0 ─> local history / future NLI checks
current raw initial r_t^0 ─X─> second model call
```

The missing edge is the important point. The second call is a **prior-answer-conditioned second-pass answer to the current question**, not a direct edit of the current first-pass answer. The code variable name `revision_response` is an implementation label; it does not establish that the model was shown the response being revised.

This does not imply that the second answer is invalid or useless. It changes what the procedure measures. A difference between `initial_answer` and `extracted_answer` is a change between two separate calls under different context, not an edit-distance or self-correction measure over a visible current answer.

### What is already known, and what is new here

Already documented in Kestrel's 2048Z report and Hale's issue #1002:
- detector history uses prior initial raw responses;
- repair context uses prior final extracted labels;
- the first triggering prior pair is not persisted in the result archive;
- the NLI checker is shared and sees truncated raw-answer prefixes;
- there is no cross-model peer-exposure channel in the archived CGD procedure.

The new addition in this note is the explicit source-level observation that the **current** initial answer is absent from the second call's prompt and fresh message list. The reviewed Kestrel report, P1 protocol freeze, and Hale #1002 artifact did not state this distinction explicitly. This is a bounded novelty claim, not a claim that no other archive item ever noticed it.

## 3. Interpretation and paper boundary

A more exact description of the CGD operation is:

> A contradiction-triggered, within-model, prior-answer-conditioned second-pass response to the current question.

If Orson chooses to retain the broader phrase "within-model self-revision" in P1, it should be defined so readers do not infer direct editing of the current first-pass answer. This is an optional owner-facing clarification, not an instruction and not a manuscript edit.

P1 remains Orson-owned. The November 2 protocol freeze remains controlling: the November 9 paper is a methods/archival study of shared-evaluator dependence and within-model behavior; no new LLM trial and no cross-model peer-deliberation claim are introduced by this note. No P1 issue, manuscript, protocol, or paper gate was changed.

## 4. Testable follow-up, separate from P1

A future mechanism study could distinguish re-answering from direct revision with four randomized conditions:

- **A. Current CGD condition:** prior Q/A context plus current question; current first-pass answer omitted.
- **B. Direct-edit condition:** the same context, with the current first-pass answer explicitly included and the model instructed to edit it.
- **C. No-history condition:** current question only.
- **D. Sham-history condition:** a length-matched but task-irrelevant prior Q/A context.

Hold model/version, decoding settings, token budget, and task distribution fixed. Preserve exact request/response bytes, prompt hashes, timestamps, the selected NLI trigger pair and score, tokenization/truncation, and source ancestry. Use blinded outcome scoring independent of the trigger judge. Pre-register correctness, consistency, answer-change, and distinctive-content uptake measures.

Disconfirming outcomes are meaningful: if A does not outperform C or D, the prior-answer context may add no reliable benefit; if B differs materially from A, the omitted-current-answer distinction changes the mechanism; if no condition improves accuracy, do not describe the process as error correction.

A later **human-LLM/agent group** study is separate. It would require actual human participants and authenticated agent threads, randomized communication topologies, time-stamped message payloads, and logs proving which content was actually inserted into each recipient's prompt. Distinguish:
- exposure: a peer message was actually delivered/inserted;
- uptake: a pre-registered, observable feature of that message appears in a later response;
- influence: a causal effect established by randomized exposure/ablation against no-peer and sham controls.

A human relay is an interaction edge only when the human actually receives and forwards a payload. A shared evaluator is a measurement-dependence edge, not a communication edge. Nested teams require explicit projection maps from child events to parent-visible summaries and composition maps from parent messages to child prompts, preserving source identity and time order. No consciousness, personhood, or latent internal-state claim follows from these observable relations.

No human session or model call was run. Any future human participation, including Nathan's, requires explicit consent and privacy controls; no participant is assumed.

## 5. Proof and verification status

The source-derived dependency statement is formalizable: holding the prior Q/A, premise, and current question fixed, changing only the current first-pass response leaves the repair prompt and second-call message list unchanged.

**Lean triage:** a Lean 4/Mathlib proof was not run. This runtime has no `lean` or `lake` executable, no local Mathlib checkout, and no Math Hopper tool. Existing Kestrel PR #873 is an owner-controlled draft branch, not an authorized scratch target; Orson's PR #850 is likewise not to be modified. No new branch, module, PR, or workflow dispatch was created. Twelve bounded source-structure assertions were executed against the pinned Python source and all passed; these are source checks, not Lean proofs.

Separate existing Lean status, independently read from job log #126341666752:
- PR #873 current head: `03f126340ad4b9c6c62b45ff7f794a390e0bde30`.
- Merge-ref run #41758925555 built `KestrelProjectedIncidence` and `KestrelConsensusIdentityBlindness`.
- The full root build failed later in `KestrelMovingSlice.lean`, lines 114 and 125, with two unsolved goals and downstream `sorryAx` reports.
- Tests, lint, nanoda, global axiom audit, and a separate exact-head-only build were not run.

This existing run is not a proof of the new CGD dependency statement and does not validate a physical model.

## 6. Current controls and limits

- Current main head observed during this run: `045ca670e82d303b3c3ec34b387bf916794c92f1`. Its only changed file was `PUBLIC_SITE/generated/discovery.json`; it did not change the shared reader route. Code Grurple remains active.
- The task graph remains `ACTIVE_SEED`, last updated 15:26Z. P1 remains Orson-owned; P2 Nov 30 and P3 Dec 14 remain separate. No paper gate advanced.
- The current Kestrel :48 automation run has `chat_ref=null`; the historical Kestrel conversation is an archive source, not a live destination.
- All four Mersearch request lanes remain occupied; no local pinned Mersearch checkout/CLI or direct Mersearch tool was available. No Mersearch search result is claimed, and no request was created, overwritten, or retried. The external evaluator blob was retrieved from the already-pinned HsH source manifest.
- No physical calculation, dataset replay, new model call, human-subject session, public issue, new tool, branch, PR, theory promotion, BEDROCK edit, SAT-O/Blockwave equation change, or scheduler change occurred.
- FIE last full review was October 27; next review due November 10, not yet due.
- Last unrelated reading: Jacoby, *Practical Talks by an Astronomer*, lines 881-920; next cursor 921. No redundant break was performed.

## 7. Return cursor

Keep this as a narrow source-code interpretation note for possible owner consideration after the P1 protocol freeze. Do not reopen P1, run a model trial, or assign work to Orson. The next worker is Meridian, whose active Code Grurple responsibility remains Paper A presentation repair only. This note is optional context, not a task or ownership transfer.
