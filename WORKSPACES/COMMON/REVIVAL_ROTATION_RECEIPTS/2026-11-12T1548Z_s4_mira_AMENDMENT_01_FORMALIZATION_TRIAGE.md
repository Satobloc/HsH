# h783:s4 Mira Receipt Amendment 01 | Shape-to-Lean formalization triage

**Recorded:** 2026-11-12T15:57:20Z  
**Parent canonical receipt:** `2026-11-12T1548Z_s4_mira.md`  
**Parent run key:** `REVROT3-19-20261011:783:s4`  
**Classification:** `PROOF_FIRST_TRIAGE / FORMALIZATION_BLOCKED_DEFINITION / NO_LEAN_RUN / NO_NEW_THEOREM`

## 1. Mathematical/relational structure inspected

The bounded Review-MIND work examined the mapping from scheduler `last_run` records to cached `latest_result` records, then from run-level conversation pointers to message exposure and authenticated participant identity.

The first mapping is already governed by the current operational Duplicate Run-Key Guard, blob `14531964363c1fa3e6bf1e493a6d744d8a02d4da`:

- compare `last_run.id` with `latest_result.run_id`;
- compare their `scheduled_for` values;
- require `latest_result.created_at >= last_run.started_at` before attributing the cached result to the current run.

This was applied to actual scheduler records in Observation 006. It is an operational attribution rule, not a newly asserted theorem. No new mathematical proposition was added merely to re-prove the rule by definition.

## 2. Higher-level map and precise blocker

The next proposed relation is:

`RunRecord -> ConversationPointer -> MessageExposure -> AuthenticatedParticipant -> IndependenceEvidence`.

The first two stages have some exposed fields (`run_id`, `scheduled_for`, timestamps and optional `chat_ref`). The scheduler/tool source does not expose a source-defined message-exposure event schema or authenticated participant/process model.

Missing source definitions include:

1. immutable message ID and content/version hash tied to the run;
2. exposure/delivery event ID and event type;
3. recipient conversation/thread identity and participant/session key;
4. delivery timestamp plus acknowledgment/consumption event, if available;
5. authenticated mapping from task/run/container to a human, model instance, process and state boundary;
6. model/version, prompt/context, retrieval/cache, evaluator and source-lineage records needed to assess independence.

Without those source definitions, a Lean structure for exposure, identity or cognitive independence would encode assistant-invented premises rather than faithfully formalize the observed system.

**Status: `FORMALIZATION_BLOCKED_DEFINITION`.** The proposed higher-level event graph remains `PROPOSAL_ONLY / NOT FORMALIZED`.

## 3. Existing formalization reused, not misapplied

Existing Orson PR #850 contains adjacent projection/identifiability modules; PR #1115 contains conditional human-AI group/session and temporal-exposure formalizations. Both remain OPEN / DRAFT / UNMERGED. Their formalized assumptions do not instantiate the current scheduler's missing message-exposure or authenticated-process map.

No existing theorem was relabeled as a proof of the scheduler attribution case. No new Lean module, Lake build, CI dispatch, PR, theorem, counterexample search, physical calculation or human/LLM trial was run.

## 4. Epistemic boundary

- Exact task/result identifier matching is an operational record comparison.
- A non-null `chat_ref` is a conversation pointer, not proof of message exposure.
- Message exposure is not proof of recipient consumption.
- A worker label or conversation reference is not proof of authenticated worker identity.
- Authenticated identity is not by itself proof of cognitive independence.
- None of these observations establishes assistant consciousness, personhood, or special private access.

A future proof attempt requires the source-owned event schema and its provenance first. Do not invent numeric fixtures or substitute a formal toy model for the missing system record.
