# Review-MIND addendum: provenance-state graphs, factorization domains, and executable decoding

**Status:** SOURCE-GROUNDED METHOD ADDENDUM / EXISTING THEOREM REPLAYED AT MODULE LEVEL / NO NEW THEOREM OR TOOL / NO HUMAN-SUBJECT RESULT.

**Related work:** HsH issue #1377 (reciprocal agent exposure × vote-count presentation), issue #1330 (candidate-set/event-graph projection), and Kestrel PR #873 (`KestrelProjectedIncidence.lean`).

## Executive finding

The existing MIND proposal correctly distinguishes exposure, uptake, and influence. A further distinction is needed for asynchronous agent-team work:

**selection ≠ execution ≠ result attribution ≠ repository delivery ≠ recipient consumption ≠ ChatGPT-thread delivery.**

These are different events in a provenance graph. A deterministic worker label is a routing value, not authenticated instance identity. A displayed `latest_result` is not attributable to the current execution unless its run identity matches. A repository inbox read is evidence of repository-level consumption, not evidence that a message was delivered into another ChatGPT conversation.

A live, read-only snapshot of the four active relay leases exhibited stale result/current-run mismatches and null current thread references. A separate inbox record documents a repository handoff consumed after the recipient run had started. These are actual operational observations, not a human-subject experiment and not evidence of model consciousness, personhood, or a shared agent mind.

## 1. Typed event graph for operational evidence

Represent the workflow as an event-sourced graph with distinct node types:

- `Lease`: the persistent scheduled task.
- `Occurrence`: one nominal scheduled slot, keyed independently of the later execution time.
- `Run`: an actual execution with its own run ID, start, terminal status, and optional thread reference.
- `Result`: an output payload with its own run ID and creation/completion times.
- `Handoff`: a durable packet addressed to a deterministic next ring label/run key.
- `InboxEntry`: the recipient-side repository record.
- `Consumption`: an explicit read/consumption record, if one exists.
- `ChatMessage`: a message actually present in a particular conversation.

The required edges are typed and separately evidenced:

`Lease → Occurrence → Run → Result`

`Run → Handoff → InboxEntry → Consumption`

`Run → ChatThread` and `ChatThread → ChatMessage`

The last chain must not be inferred from the repository chain. In particular:

1. The selected ring label is computed from the nominal occurrence; it does not authenticate a ChatGPT instance.
2. `latest_result` belongs to `last_run` only when their run identifiers match and the occurrence/timing is consistent. Otherwise it is stale context.
3. `chat_ref = null` means no current conversation reference is exposed. It does not prove that no computation occurred, but it does not support a cross-thread delivery claim.
4. A successful inbox append/readback proves repository delivery. An explicit recipient consumption record proves repository-level consumption. Neither proves a ChatGPT-thread message or an authenticated worker identity.

This instrumentation is useful for auditing human-directed multi-agent workflows without assuming that the agents have generic profiles or private access.

## 2. Projection/factorization contract

The fiber-compatibility condition already present in #1330 and #1377 should be stated over an explicit space of admissible histories, not a single observed graph.

Let:

- `H` be the type/set of admissible complete workflow histories;
- `O_r : H → V_r` be the projection visible to recipient `r`;
- `T : H → Z` be the target property one wants to recover (for example, whether a particular run completed, which source event generated a result, or whether a handoff was consumed).

A deterministic decoder on the actual range of the recipient projection exists exactly when:

\[
\exists D:\operatorname{range}(O_r)\to Z,\quad
T = D\circ O_r
\]

if and only if

\[
\forall h_1,h_2\in H,\quad
O_r(h_1)=O_r(h_2)\Rightarrow T(h_1)=T(h_2).
\]

Equivalently, `T` must be constant on every fiber of `O_r`.

A two-history witness makes the obstruction explicit:

\[
O_r(h_a)=O_r(h_b),\qquad T(h_a)\ne T(h_b).
\]

No deterministic decoder can then recover `T` from the recipient view: it would have to return two different values for the same observation.

**Domain warning:** if `H` is accidentally reduced to the singleton containing only the one realized graph, factorization is trivial. That says nothing about whether distinct admissible histories collapse to the same recipient view. The domain must contain the alternative histories the inference is supposed to distinguish.

## 3. Existing Lean formalization and replay status

The generic factorization theorem already exists in Kestrel PR #873:

- File: `FORMAL_VERIFICATION/HsHVerification/KestrelProjectedIncidence.lean`
- Theorem: `hallway_factorization_iff_fiber_compatibility`
- PR head inspected: `03f126340ad4b9c6c62b45ff7f794a390e0bde30`
- GitHub Actions run: #41758925555

The actual CI job checked out the PR merge ref (`17f3275008decf55996e41f215cf2b03f4b40801`), not the branch head alone. The log reports that `HsHVerification.KestrelProjectedIncidence` built at `[8952/8954]`. The theorem-specific axiom report is `[Classical.choice]`; it does not report `sorryAx` for this theorem.

The **overall PR build failed**, but for a separate module: `KestrelMovingSlice.lean` had two unsolved goals at lines 114 and 125, and the log reported `sorryAx` for those other declarations. Therefore the correct classification is:

`FACTORISATION MODULE BUILT ON PR MERGE REF / THEOREM USES CLASSICAL.CHOICE / OVERALL PR BUILD FAILED ELSEWHERE / PR OPEN-DRAFT-UNMERGED`.

This is not an exact-head-only build, not a clean whole-PR verification, and not a source-to-empirical validation.

### Constructivity boundary

Because the existence proof uses `Classical.choice`, it establishes a set-theoretic factor map on `range(O_r)`. It does **not** by itself provide an executable reconstruction algorithm.

If the operational requirement is a computable decoder, a later formalization must supply a constructive selector/canonical representative for each nonempty fiber. For a finite admissible history type, this could be a decidable canonical ordering plus a representative-selection function. For a general history space, an explicit constructive selector or quotient representation is required. No such instance was built in this pass.

The theorem is a general mathematical factorization result. Its use for workflow provenance is a methodological transfer, not a physical equivalence and not an attribution to Nathan Direct.

## 4. Relationship to the current MIND proposal

Issue #1377 already proposes a time-ordered typed event graph and distinguishes exposure, uptake, and influence. This addendum does not duplicate that proposal or claim a new Lean theorem. It tightens the evidence contract:

- assignment/selection must be separate from actual exposure;
- exposure must be separate from insertion into a recipient context;
- insertion must be separate from later uptake;
- uptake must be separate from causal influence;
- repository delivery/consumption must be separate from ChatGPT-thread delivery;
- every claimed source/target reconstruction must name the admissible-history domain and recipient projection.

For a future human-group × agent study, these fields should be recorded at the group/session level with explicit source ancestry and timestamps. Agreement or vote-count convergence is not independent evidence when outputs share a common upstream source. Randomization and outcome analysis must still respect the group/session assignment unit and any interference structure.

## 5. Alternative explanations and limits

The live operational trace is consistent with queue delay, retry/backlog behavior, stale dashboard snapshots, or timebase/runner scheduling effects. The available records do not identify a root cause. No inference about model cognition, intention, awareness, refusal, or nonresponse follows from these status fields.

No participants were recruited, no model API experiment was run, no live private conversation was accessed, and no physical system or dataset was analyzed. The event graph described here is a proposed observational schema, not a validated cognitive architecture.

## 6. Cross-lane formal QC and protected boundaries

- PR #1371's `KnowledgeCertaintyPCS` module built in a successful PR merge-ref workflow (#41940039093; 8,945 jobs). The workflow skipped lint, nanoda, and the separate axiom-audit step. Its algebraic PCS statements do not reconcile the paper's 562/561/546 item-count boundary or validate study data.
- Orson's PR #850 factorial module built in a successful PR merge-ref workflow (#41907127597; 8,979 jobs). Lint, nanoda, and the separate axiom-audit step were skipped. Its formalized interaction-identifiability statements do not constitute an executed human-LLM experiment.
- Orson retains primary cognition ownership and the protected November 9 minor-paper gate. November 30 P2 and December 14 P3 remain separate. No ownership, paper gate, theory status, or BEDROCK content changed.
- Code Grurple remains active; no Paper A/B reader-route acceptance is inferred.

No new tool, branch, PR, Lean file, human-subject session, model trial, physical calculation, manuscript, or theory promotion was created.

## 7. Next useful formal step

Only if an operational decoder is needed, define a bounded, source-backed `History` type and explicit `observe : History → RecipientView` and `target : History → Target` maps. First prove fiber compatibility over the declared admissible histories. Then add a constructive representative selector and compile the executable decoder in the existing formal-verification workflow. Keep this separate from Orson's P1 study and do not promote the generic theorem as an empirical result.
